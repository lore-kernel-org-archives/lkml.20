Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297520;
	b=5HUfjSkrcZnP8ub9PXdx3RraGJlPvoVpufepIGdO5OXKQL8VKNmvERIifyPr1ME1FIvq
	 FEUfy1qDC2jn81qdYGavEx022ap86bDn4+Kw2YguL+Cgva0R9bWNQxkO2uNyKA7X+t6V7
	 2HvFhU7vXihVBhUUhwPfOYL1LEbsyI0oMWxDPBUoav0QCmblV5x8+AlaZ3IpUf/tWjYM/
	 JJZzxgsrCBqykDmyu4KZJ687rFZnVTesS9ZLcJJxgFqFY+WU0asIKSPPNuSelRSAogf8J
	 dwjd938t9vIUOd17KzECO7EO3CjOhdzK8HGO9VwFLA5yzBD8fAkwOpUCS217Z39OC3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297520;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tmd+aIN3oARPQWgf2MNmvOkS4VVvOgqyFA4+vSWFERA=;
	b=iQHJio71nj7RdiupP70vFNU2qmyRBHLUz0nCxnmdI+h/y/jBt5DTkw11CBODHmucooWA
	 3RMyyC+RROFFI+ACVfdNfP6qOe4wab+8Y6F2lhCTyANDoyoMpAju0SfWLhd0PFH92UaHH
	 8OEN30cZLxw3sizMHA4kyDGTjmRK/K0tQzC/Ql7BZ7sMuuG8bZVybf6O9Nzjkrus7fPQM
	 DRLWRBh32jJksr0+CUOJ2vNMWJD/kIoOrGcBg6/XbTpAJnRXLYJ83Px+0dNLBoz0Tuqvr
	 zKX4lGktEqaTmwvu9jKYFjpcJod+jFWqryTC2ye7kJo6rpR//f2rqtp9rjyZEvM9MIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=S8m6+CiC;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FA760A6F7E;
	Tue, 10 Nov 2026 07:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FA760A6F7E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=S8m6+CiC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=S8m6+CiC4NZnD1qHnQA5OusFP6jPDWyERgnajH7SdVeliPYAdRy94/aPvMxCrDB/D4rVg5dRp9KVw
	 2rngKWzAi9KM/2CiBAP1AtLzE5Q2ITXR5Rr/Kt4vuhnoy8hC3AVYs3hg5PAcVYB3Eiox5IJ8E5vWsT
	 RRRwNO6PojO/kuj0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af2ceae613-6c42d;
	Tue, 10 Nov 2026 15:58:38 +0800 (CST)
X-RM-TRANSID:2ee46af2ceae613-6c42d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdee;
	Tue, 10 Nov 2026 15:58:38 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdee
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/22] usb: storage: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:23 +0000
Message-ID: <20261110075825.24946-21-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/storage/ene_ub6250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index a9358e04ab4b..18d85ee79db8 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -470,7 +470,7 @@ struct ene_ub6250_info {
 	u32		bl_num;
 	int		SrbStatus;
 
-	/*------Power Managerment ---------------*/
+	/*------Power Management ---------------*/
 	bool		Power_IsResum;
 };
 
-- 
2.53.0



