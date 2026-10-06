Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62BC3E3177;
	Tue,  6 Oct 2026 10:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282537; cv=none; b=Ad/BCZ226RGIqlw/c+tXmkAwHY+yZ+LEmipbzxG5gR/vnIe8F4Rxt8utGo07hwZ3k0g3RWCVEjiXgZYyMbI9/s5Bo4fJb9wF+C8ZFwl8cMsJpqm37DDBNdNTZNQFQdRW3kWWMJh8fGHj8ZPLpMnEcvv51aze3S5iG25wyehw0Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282537; c=relaxed/simple;
	bh=CMwnIq4EzH/h8aGBC+9C1q1EScSn2RamA0/WP01JIRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M/4vfLZTCg9xmcE8Zl8GuKfP0JDQjDG9olsFyP5GDbZaU+hl1V4XOhsmTRPM2ea4Vn3nPgWiSMXNOJJ9PSTlJvAvAO4rg7Jss90vlQbmfMiJtDvftSZXHPidn+DRnIAqDCmQKb7E/sSm7th4j0hwV36zwbfUN3uLljihPw7unwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uKry8SPe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uKry8SPe"
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2B141CF8;
	Tue,  6 Oct 2026 12:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791282412;
	bh=CMwnIq4EzH/h8aGBC+9C1q1EScSn2RamA0/WP01JIRo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uKry8SPeYfkaAUFPvUfiOgCdWdfxanbJRYX3QCqYJEUyoInmzGtnfalYf/5f1UDFv
	 y6r4uQ/9SJQNrM3j4LpJXrLniiue6Ahxfw+i9VfmwuDm4bDd1L3lpc25wodzdTcStk
	 lnXwshE2l0i58ogjoL7nA/o8kX3N3tgh9HSb5jpk=
From: Alen Karnil <alen.karnil@ideasonboard.com>
Date: Tue, 06 Oct 2026 11:28:33 +0100
Subject: [PATCH v3 2/2] media: rkisp1: Treat 8 bus width and 16 bus width
 formats the same
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-2-93d3d43991a0@ideasonboard.com>
References: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-0-93d3d43991a0@ideasonboard.com>
In-Reply-To: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-0-93d3d43991a0@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Isaac Scott <isaac.scott@ideasonboard.com>, 
 Alen Karnil <alen.karnil@ideasonboard.com>
X-Mailer: b4 0.16.0

From: Isaac Scott <isaac.scott@ideasonboard.com>

The driver accepts 1x16 YUV formats, which are 16 bits per sample.
Each sample being made of two 8-bit components. Add a fallthrough case
to allow the ISP to handle the 8-bit components.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
[Alen:Rewrote commit message, added comment]
Signed-off-by: Alen Karnil <alen.karnil@ideasonboard.com>
---
v3:
 - Taken over from list and refreshed
 - Rewrote commit message following review and added code comment
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 4de44f6ec753..54b9028b1f41 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -264,6 +264,11 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 
 		switch (sink_fmt->bus_width) {
 		case 8:
+		case 16:
+			/*
+			 * 16-bit width YUV formats use 8 bits per component,
+			 * so they can be handled by the ISP same as 8-bit.
+			 */
 			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
 			break;
 		case 10:

-- 
2.53.0

