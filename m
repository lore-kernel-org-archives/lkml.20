Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297520;
	b=gNQ1JV3IVbp62Rjv7TiVv/ekzgKac+GzVNFQydwCfbaf/9CYiAkghnAgPpZh7yVj0n/F
	 0E4aCjHA85PjT4BGcQ1x9JoStMSVCTOKP8C4FB05CUoUgvVO9zeF1Z9GGtm/8WK4a8DNR
	 iwH1G7w6KcO4KLx0wgvqRoZmDbGbpP7cfxD37NVXVOZZ9nKlesH0joyrPyi+Se0lYC/is
	 MCR/THps49ZUau3fFkrUrjUOf6mARRgIRyJ3+QtWMXl4WV5OMT0gBb7NbwJTpizZVl9sQ
	 Yt7fOrKFIlFodfEsnN6tbd0IJgJgFuZSE6DWm6ehK84VUb9RDHQZBIjnOLhTVqf4Bww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297520;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NoBZTVv1shVwmkJvvV8aDCWMUpsFZmi4eqE2fdU6/kQ=;
	b=ehBsMWXF4lVdcIoEKcG1qr3Q7frShzEc7Y5JHl1+S3x0RvFMMWEOePzkh4L7b/9l4wBA
	 ujCMelKmoGFXwEsY7qxKzKe8hT5F0p0/HCTJ3hKYzKEZO+/kdlKsPKZOCZQy6pUpHAXZZ
	 zLKgQkFmPdLMTkBblgAqY4YDF7dHQN1G8JPFLvMCuaHkwm7kwGXiV1ppf5lSDDn+SSsA1
	 dvi4cCkWDcQC8tTtQr5qW6xTCwynDQPGVGJ+2AoEXzGlUSzm+pceITNuvPThOOAKGEzzV
	 btHo0PeeB7nh3NEDK+xC+TmZeAsnh/U9ZzWttk+7zsWMBQXSrymW4dyzg1kps16jXgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rxxDcuj3;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962A860A5BFD;
	Tue, 10 Nov 2026 07:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962A860A5BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rxxDcuj3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rxxDcuj39Tk+ij5f68oU1/VdCog8NfmItoDd46NLBFbn8kdh5z2XaLFjeu4NKvKzb/eBCMuEvIDr0
	 Tgup6f9gSNp6WTRwslsmSraLCDSr2AmhhUkHdUkZJck/0WIQehmKKNd1vzefasdlBntigKR/y6emZw
	 4njZvpq1LOQ2PnIk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af2ceada30-08804;
	Tue, 10 Nov 2026 15:58:37 +0800 (CST)
X-RM-TRANSID:2ee26af2ceada30-08804
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acde9;
	Tue, 10 Nov 2026 15:58:37 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acde9
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/22] usb: renesas_usbhs: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:20 +0000
Message-ID: <20261110075825.24946-18-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
 drivers/usb/renesas_usbhs/mod_host.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 0c7fe109d5c7..92f4f35f8bb1 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -852,7 +852,7 @@ static int usbhsg_try_start(struct usbhs_priv *priv, u32 status)
 	usbhs_pipe_config_update(dcp->pipe, 0, 0, 64);
 
 	/*
-	 * system config enble
+	 * system config enable
 	 * - HI speed
 	 * - function
 	 * - usb module
diff --git a/drivers/usb/renesas_usbhs/mod_host.c b/drivers/usb/renesas_usbhs/mod_host.c
index f7ef3a9f82a4..1a35f54203c0 100644
--- a/drivers/usb/renesas_usbhs/mod_host.c
+++ b/drivers/usb/renesas_usbhs/mod_host.c
@@ -1319,7 +1319,7 @@ static int usbhsh_irq_attch(struct usbhs_priv *priv,
 	usbhsh_port_stat_set(hpriv, USB_PORT_STAT_C_CONNECTION << 16);
 
 	/*
-	 * attch interrupt might happen infinitely on some device
+	 * attach interrupt might happen infinitely on some device
 	 * (on self power USB hub ?)
 	 * disable it here.
 	 *
@@ -1347,7 +1347,7 @@ static int usbhsh_irq_dtch(struct usbhs_priv *priv,
 	usbhsh_port_stat_set(hpriv, USB_PORT_STAT_C_CONNECTION << 16);
 
 	/*
-	 * enable attch interrupt again
+	 * enable attach interrupt again
 	 *
 	 * usbhsh_is_running() becomes invalid
 	 * according to this process.
@@ -1468,7 +1468,7 @@ static int usbhsh_start(struct usbhs_priv *priv)
 	usbhsh_pipe_init_for_host(priv);
 
 	/*
-	 * system config enble
+	 * system config enable
 	 * - HI speed
 	 * - host
 	 * - usb module
-- 
2.53.0



