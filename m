Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9729C3E2751;
	Tue,  6 Oct 2026 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282531; cv=none; b=C+iY3RYEm8QfyHGE8ulnT7xbcXWtLG4HKoFfNHEdCexgMWuze6zDynJz5lY+Oc3hC+UIMElLApMXG2N7VT704DDKCw1i2JuPB8iE9QJrs+vPYq9k97X9Jh+P9ZtBtzKWfLEseKQ3zCzAQofmTT96jlu9BHhaPWLaINGesqsz+tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282531; c=relaxed/simple;
	bh=eEGtRczHjxTULl4VBNXnvHlt2NPPQvYK7b8knK8rR0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G5wmjrriXVTZGPJDzMGZhD90bDXiK0Of/Yn07xLrCJHEFcBOBO66fIJsr+jOO9cT5hki8Au/2sQFpHLeBSv/qPOd7ii+a/Uf7GMJJ0qFqf2qedLBJAIDXabUny2qN3B/7B+/LTLkECXGc72EQ6HG1Rrt09ham0mYZ/4cVGU6ijA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vTNZgkma; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vTNZgkma"
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2570493;
	Tue,  6 Oct 2026 12:26:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791282411;
	bh=eEGtRczHjxTULl4VBNXnvHlt2NPPQvYK7b8knK8rR0A=;
	h=From:Subject:Date:To:Cc:From;
	b=vTNZgkmaY3ZYP0PXZESp4xzjua/BQNFYTIwOOavAs6vGDDhDGxBtXcGp70GHp9RU3
	 irG7MU+6FZnVoCv1vMLKuL6903KXxs4+mAMGGtMollzMDh0/Eu3des/v5XQdgm5bv8
	 UGepERXRBSij7nfRsQR61jp0yEOMwDcilopiML58=
From: Alen Karnil <alen.karnil@ideasonboard.com>
Subject: [PATCH v3 0/2] media: rkisp1: Add YUV bypass support for rkisp1
Date: Tue, 06 Oct 2026 11:28:31 +0100
Message-Id: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-0-93d3d43991a0@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQrCMBBFr1Kydkqa2tq68h7iYppM7SBtwkwVR
 Xp3gyDu/oPPe2+jJExqjsXbCD1YOS4Z6l1h/ITLlYBDZuOsa21ftTBTYAS5saYKMAR43R8wvBK
 qgt5TirLCGOX38F1XedvVzdCRydIkNPLzGzxfMo8SZ1gnIfxnnG0qWzt7KPd5900PDlgRfak+r
 uuJA6HGZYgoofRxNtv2AUl/drnIAAAA
X-Change-ID: 20260916-media-rkisp1-add-yuv-bypass-support-for-rkisp1-c881c0835b8e
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alen Karnil <alen.karnil@ideasonboard.com>, 
 Isaac Scott <isaac.scott@ideasonboard.com>
X-Mailer: b4 0.16.0

Hi all, 

I am taking over the series from Isaac.

The goal is unchanged, which is allowing sensors that can
output YUV streams to be used through the rkisp1's passthrough mode.

In patch 1, the ISP mode has been replaced in two possible
paths, as my hardware configuration only goes through a csi serializer
I've only been able to test a single path (the lower else block),
so the path requires testing with hardware I do not possess. 

Cheers,
Alen Karnil

Tested on: v7.2, using OV5640, GC2145 and I.MX8MPlus
Compile-tested on: media/next

---
Changes in v3:
- Reworked patch 1, to fix incorrect logic and add comment.
- Reworded patch 2, including code comment.
- Link to v2: https://lore.kernel.org/linux-media/20260205103207.4020959-1-isaac.scott@ideasonboard.com

--
2.43.0

To: Dafna Hirschfeld <dafna@fastmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Alen Karnil (1):
      media: rkisp1-isp: Set correct data mode for YUV bypass

Isaac Scott (1):
      media: rkisp1: Treat 8 bus width and 16 bus width formats the same

 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260916-media-rkisp1-add-yuv-bypass-support-for-rkisp1-c881c0835b8e

Best regards,
--  
Alen Karnil <alen.karnil@ideasonboard.com>

