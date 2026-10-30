Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370238;
	b=LpEGP4pW3T+Xck4QpLYSPBXQpqm/ykuB18cTYM7IH+EctfRsLxV1KoIHkGBmbmgLfzpz
	 XU8JVsS9ZGvNIOch5FXiNgvtJcoOs2O2Lrr8+qJjDpPWb3Y/YjuRmgBCj/OVwZOAllsTG
	 +Np2xId4eT6cAAAdRvkcwy2Cih91mC0kgxQoD4SIWFlgYMc5y/tTRed/W+6tMiP6eoFMn
	 3O9W9qRrRxA8vn6QZ85Sa4SerlcZWxiU23O2NDS4JIUtJy7BVG2OqjWNgVfoqWnualxlF
	 Nxvp1K9jYmYXrm4NB6fn1rcSTOvTI7nhZ4YhkQDtOPaPLUcgamQM4MVWM/UfNohG5ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370238;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=E7XhqnYYTe8GaaNv1F7M1d+id0Du8l5jFgfcxwTp5i4=;
	b=RNA/r/4DKZcLB8OAz2OB/eTRaJI+/vQYRzH4543v2b6mIklnX6tm9E+zW74VcXpu/5Qn
	 ptKgCyfd5Yp9OEfh2B47TW8WPG41AbsAYTXkrMqkUvII2VARy48i9f0YRo6W1dePTnPSg
	 r/+XoJfDqdA3Ml6lqr0NsAQ6nOvfqG3G0nfOCLU0e4eHfSDnsz/BkGOpqyTs9XmtS8/vH
	 GHQQ6iGHpEYkLVVTR8Lh1ckU2DxuhoPJvFMYk5kuE8wQ9NWJiEUrug2XfR1TNSPe374HD
	 +nf3/5MG4+YlaF9sK5hHtxD70wkLhegcuLeYol9NOqMmejEoNPucHlZmtImlV+YFePA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABC1606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BABC1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5640a2d9708so1039023b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370237; x=1793975037;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E7XhqnYYTe8GaaNv1F7M1d+id0Du8l5jFgfcxwTp5i4=;
        b=fHhlUmEr4ROfMeTW4+lgeT23ZQ8Z7lNa33klnBIe9VqUjtdjP2eM/qg6uyeL05/6HN
         TulRF/oID/4B1RiyP0JOpaULRPggRomo/L//K/eZ8sSrfggkmNqy6urLMVe58e9rGM5V
         bcMe+UQegBfDZBYmQMShwPdbCRHr4dfWe8elYm8ViNB8y1aaQzGL5f1VberWP6Mgvn7y
         wAUE7mNbfUoJw9s/P0IE4jkhmDAGMfMNujtZJvkRmrrVzCmQNuAnsjQTZTyfy8+7m6H0
         PY7ZJ7JWFqtQVxMfx73nl3XmULL2SasjI9lwyPkI3Q4B2VogJPdJ8s42D161Sym8MMsF
         S1VQ==
X-Gm-Message-State: AFq9FYL3HRFUXhOPhSFZKg2vHIdWFS9XRzQWBez5toQmQJD5RiPq5aFw
	fWOOAKFlCRCCoImjSOrI6xUIF3VeQg1Uak7e3JC80DhTr+xWI5bCloFqnFeWPcE851c4H8vmN8c
	iytnK6S+Isi/lLt5UrqUGpdSWEm3n5hO7yeVvzXfmtTc/b8hV+ABA7Xz+EtE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6809:a:20b0:564:22ae:a68c with SMTP id
 5614622812f47-56422aea804mr3448b6e.13.1793370236667; Fri, 30 Oct 2026
 07:23:56 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:23:56 -0700
In-Reply-To: <000000000000974b090622004b40@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae4a87c.f57e0135.1770dd.0079.GAE@google.com>
Subject: Forwarded: Re: [PATCH RFC v2] media: mxl111sf: initialize state->d
 and fe_lock in probe
From: syzbot <syzbot+f9f5333782a854509322@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [PATCH RFC v2] media: mxl111sf: initialize state->d and fe_lock in probe
Author: immersa.bartosz.chronowski@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git c03c1a14507dfaf8b856c2608f9ac216021fc222

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 6404eb74d..fc4010b6e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -431,8 +431,6 @@ static int mxl111sf_lgdt3305_frontend_attach(struct dvb_usb_adapter *adap, u8 fe
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -502,8 +500,6 @@ static int mxl111sf_lg2160_frontend_attach(struct dvb_usb_adapter *adap, u8 fe_i
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -587,8 +583,6 @@ static int mxl111sf_lg2161_frontend_attach(struct dvb_usb_adapter *adap, u8 fe_i
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -674,8 +668,6 @@ static int mxl111sf_lg2161_ep6_frontend_attach(struct dvb_usb_adapter *adap, u8
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -749,8 +741,6 @@ static int mxl111sf_attach_demod(struct dvb_usb_adapter *adap, u8 fe_id)
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 1 : 2;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -935,8 +925,6 @@ static int mxl111sf_init(struct dvb_usb_device *d)
 	if (mxl_fail(ret))
 		pr_err("failed to get chip info during probe");
 
-	mutex_init(&state->fe_lock);
-
 	if (state->chip_rev > MXL111SF_V6)
 		mxl111sf_config_pin_mux_modes(state, PIN_MUX_TS_SPI_IN_MODE_1);
 
@@ -1068,7 +1056,9 @@ static int mxl111sf_probe(struct dvb_usb_device *dev)
 {
 	struct mxl111sf_state *state = d_to_priv(dev);
 
+	state->d = dev;
 	mutex_init(&state->msg_lock);
+	mutex_init(&state->fe_lock);
 	return 0;
 }
 
