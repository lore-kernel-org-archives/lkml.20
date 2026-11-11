Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376620;
	b=P//KpAZ20Tc7OO2dz1aefdEfk+3ZdtuYEXAA4T9g/TS1FPuNbKKqlSaCV75G04axzdmC
	 SOZesmxIFv01BAB95gisR6oAA4XzgsJ0Az49Lqm5OfHI2HnRo7MQ99SqYmoDO7MLhr5zW
	 DEU8uxlIjyedkr/VdokeHbqBp+0wrjEHVsRzGdDk8YUfsbYsZ1xHL5pLIa0uo/PfhsdR/
	 XsyzRIMC2TlFChnJ6zvqor3S3kcXmk/O4ekwzyKB+/6ptnIH9fTsvBaJWZ6VxdrEMobR0
	 j2Blmn3wj24BGrttH439ELw/p9tOMqNLgZSsJLtXTwmFr+993bkj2lU/95OkYvaRBYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wit1oMqBgUZguWTeUkrhLstN01zhTlUg8QuqFOi5XKw=;
	b=k60GWKRzWS3jDVNCoVC5N3gQhsnDJLvpI+GhUiTQjGrsj+ly7y9jersLhzK71F6mn9/J
	 +pwdi9ZTuIY/rcvlWhVEt8G7k1IWprrmpwI0J50YAL/O1YU+h7TopEtZ9/2XNFkniRu7Q
	 Pt8DOJzzVOneo2pK44/9MJsMelIPPc0b69x42zZPyG/KAYN1oesnRpHKJaivD9JbYF7s3
	 Nc0fys0BiJkVAsiRXa2zWUHhMD8I7sQ/epyvfmtxYHRpfy0P6hdONnAxxEZmkdTHvdpnl
	 RF44AOHEjhWLXSD+I8y0IbG4pjmCeTisMMo0uipVjbHYTk1JqEOLsCC0tncujOFBqow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAqQBKoA;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BF9606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24BF9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAqQBKoA
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed3d8877e6so16557095ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794376619; x=1794981419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wit1oMqBgUZguWTeUkrhLstN01zhTlUg8QuqFOi5XKw=;
        b=MAqQBKoAzm4JhwG+TDVdZv8i0x9xYsPLOzX3jV6yyEyoyLS5iG53kvKl3h4OswOhV3
         7EEyMgPuLC7VuF7/2/mPD1UW84hAqEElY79LYbQXeB0Cu1yR3t9vgfPzBPy6KvviuCyj
         hrWV/sTfjkIijX6Thg+yCPWR8YvYePeAqbcFSSBmYU132nq9vVJCHrq3rNAeVFzUnMZo
         lQ4/UtMmNBNVo/X03Fyt6Zd9RCsI++x6h27k4K8euqd2YrbhC0AZ1J/O1vaIAHjwtcm9
         x2DG7hYSL4M6VutREIokUaVdoZminmHlafQWRr+MNRc41jjSXOINAqP968yoWlCTDBdL
         OAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376619; x=1794981419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wit1oMqBgUZguWTeUkrhLstN01zhTlUg8QuqFOi5XKw=;
        b=MxfOUgPYE26CF0kXTGLSJ8zJxz/1wEBidUlZlNjQDWpvr1F0o6940kjuS7IdHYFAfy
         SuC/EakDSTD+5cxV3Utn8R/C0cmFudvLvBV0W7SjCvtBa0ir3Gb5Jq4amzqJL/ufIy4q
         WP9d2Fwh5TZRDj2UZ+lZMayf4lPAfoS3bxF4tJw3pG74rsBhVxZ7ALEmXg5Oamus+xYc
         PKd5nxlYF+FEOInKSAFcZ2zfSOd91pKGaK3fn6rPgokn9eOpCeWT/CPicEn7qm5VjYdg
         eXsVcDIFMQU0mpieVIRLVVVFoLQ63QZXy80BeIjijTqjvEcQWksXJPzBuEIL/bePM646
         hj2A==
X-Forwarded-Encrypted: i=1; AL+hErF+NSHCUt9zAcOh5yxk/XcUaAbFexHkmjtCOCh+h87g4fkrloFRtz/HprnXFG/rZ31pj00irWEL3WtXY2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QioTxZpXdMwhQY8FgCaLY7PDT3biTpb3aEpDwNQdjr5hF4lYH
	6e0/IYZ66tpYHHEr8pCB6YfdDcbRtLst7ynZdoLvkt0SWWiym6LOtk8a
X-Gm-Gg: AYBFou2+M1pWXhtVj2zKMQ4wmqIy2+ZzC+FbI50Q7M1ydedL1qHSikE4/+tNLJOZBAY
	6QsV5GBIqp2uJHKUmt8yYAAS5Shnw+tQRn/6QJTlYmoODGim2zuYGqyHGpAjtAHQcKJd0tzu8Ll
	vTzF/ZK5FJEZhAUl+JEVUNFqA8iPso99b42RAEUQk1W1XGhTC3jh0BcFwOZYAt5BqZqhkO5CEFg
	TRKL/jXh3DnmEItiQO2wpvekwK/3n8uLs2L9c72mjUzK3LYcxc4NGi6jyJ+qrbW7uhd7UViVaw6
	FWAAo8KK6fPA8s/kt0gKf4P1bL6pY1GK1jLZjmDJ0SZI3/m5ArYruWmgBIgcKDADvlZ1uHGhDmw
	/lbb1I7m5Q5x87jRjP/5TKAgS47ZpaSCTF5JRjDSias9ghZJybhh45ykhG+40QYQaHpexb8ZAsW
	7cpVu+1bYuXkWW5gkbod0BsDkB8zY9GAStsGa6zOHBKEPxIoMsi3hXoRBxPD37zLldRMQC2GHlZ
	SLqlB9YfP5CCqMPMiDU0p6Qyiyy3xUYUKlmNcM+IkPlbnO8KOzMwv97HsIZZErCHjstHiJzXh03
	FxW8OIue9oOvXClMS9Y8brqtQQo=
X-Received: by 2002:a17:903:1a4d:b0:2e9:4175:3079 with SMTP id d9443c01a7336-2edd775fea4mr18178705ad.21.1794376619395;
        Tue, 10 Nov 2026 21:56:59 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a43768sm17021535ad.6.2026.11.10.21.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 21:56:59 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] usb: dwc2: Add USB DRD support on CV1800 series SoC
Date: Wed, 11 Nov 2026 13:56:18 +0800
Message-ID: <20261111055628.183891-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111055628.183891-1-inochiama@gmail.com>
References: <20261111055628.183891-1-inochiama@gmail.com>
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

On CV1800 series SoC, it has a problem that it enters the role switch
with a persistent Session End Detected interrupt. As a result, GOTGINT
bit 2 remains set after write-one-to-clear accesses and prevents a
normal boot.

Keeping the BVALID override asserted in host mode avoids the observed
interrupt storm while allowing host enumeration and device operation.
As the BVALOVAL field is device only in the datasheet, this change is
added as a quirk.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/core.h   |  3 +++
 drivers/usb/dwc2/drd.c    | 29 +++++++++++++++++++++--------
 drivers/usb/dwc2/params.c |  1 +
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 298b418e6859..52ac64f67f41 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -357,6 +357,8 @@ enum dwc2_ep0_state {
  *                      case.
  *                      0 - No (default)
  *                      1 - Yes
+ * @force_bvalid_in_host: Set the BVALID override value to 1 in host mode to
+ *                       avoid persistent Session End Detected interrupts.
  * @power_down:         Specifies whether the controller support power_down.
  *			If power_down is enabled, the controller will enter
  *			power_down in both peripheral and host mode when
@@ -460,6 +462,7 @@ struct dwc2_core_params {
 	bool reload_ctl;
 	bool uframe_sched;
 	bool external_id_pin_ctl;
+	bool force_bvalid_in_host;
 
 	int power_down;
 #define DWC2_POWER_DOWN_PARAM_NONE		0
diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 3dc194657e82..3df63c0b88d8 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -28,10 +28,13 @@ static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
 	gotgctl = dwc2_readl(hsotg, GOTGCTL);
 	dwc2_ovr_gotgctl(gotgctl);
 	gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
-	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
+	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST) {
 		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
-	else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL)
+		if (hsotg->params.force_bvalid_in_host)
+			gotgctl |= GOTGCTL_BVALOVAL;
+	} else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL) {
 		gotgctl |= GOTGCTL_BVALOVAL | GOTGCTL_VBVALOVAL;
+	}
 	dwc2_writel(hsotg, gotgctl, GOTGCTL);
 
 	spin_unlock_irqrestore(&hsotg->lock, flags);
@@ -45,18 +48,26 @@ static int dwc2_ovr_avalid(struct dwc2_hsotg *hsotg, bool valid)
 	u32 gotgctl = dwc2_readl(hsotg, GOTGCTL);
 
 	/* Check if A-Session is already in the right state */
-	if ((valid && (gotgctl & GOTGCTL_ASESVLD)) ||
+	if ((valid && (gotgctl & GOTGCTL_ASESVLD) &&
+	     (!hsotg->params.force_bvalid_in_host ||
+	      (dwc2_is_host_mode(hsotg) && (gotgctl & GOTGCTL_BVALOVAL) &&
+	       (gotgctl & GOTGCTL_AVALOVAL)))) ||
 	    (!valid && !(gotgctl & GOTGCTL_ASESVLD)))
 		return -EALREADY;
 
 	/* Always enable overrides to handle the resume case */
 	dwc2_ovr_gotgctl(gotgctl);
 
-	gotgctl &= ~GOTGCTL_BVALOVAL;
-	if (valid)
+	if (valid) {
 		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
-	else
-		gotgctl &= ~(GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
+		if (hsotg->params.force_bvalid_in_host)
+			gotgctl |= GOTGCTL_BVALOVAL;
+		else
+			gotgctl &= ~GOTGCTL_BVALOVAL;
+	} else {
+		gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL |
+			     GOTGCTL_VBVALOVAL);
+	}
 	dwc2_writel(hsotg, gotgctl, GOTGCTL);
 
 	return 0;
@@ -67,7 +78,9 @@ static int dwc2_ovr_bvalid(struct dwc2_hsotg *hsotg, bool valid)
 	u32 gotgctl = dwc2_readl(hsotg, GOTGCTL);
 
 	/* Check if B-Session is already in the right state */
-	if ((valid && (gotgctl & GOTGCTL_BSESVLD)) ||
+	if ((valid && (gotgctl & GOTGCTL_BSESVLD) &&
+	     (!hsotg->params.force_bvalid_in_host ||
+	      (dwc2_is_device_mode(hsotg) && !(gotgctl & GOTGCTL_AVALOVAL)))) ||
 	    (!valid && !(gotgctl & GOTGCTL_BSESVLD)))
 		return -EALREADY;
 
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 091bfcfef753..16db9c3c1991 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -222,6 +222,7 @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
 
+	p->force_bvalid_in_host = true;
 	p->otg_caps.hnp_support = false;
 	p->otg_caps.srp_support = false;
 	p->host_dma = false;
-- 
2.56.0

