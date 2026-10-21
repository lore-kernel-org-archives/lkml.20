Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585923;
	b=u/249iwXzT/y3zNGTTXFW+pqYzZ/vExNVcl6dH/6kwCqXgRfLigqofSQEF+kBpP3QSs0
	 kBA04xzsRQ23bfy7V+Utg8BabgAkdtbxmTCxFVsYn3TzCDb4CsG7UXOZnIlE62pt+jrXY
	 8jfPyfqPW8waSRuV5/LXI/HYvbWui21q+7T8/xeBj6ejX+Fkowzgwx1LVCbnl8iH02Aan
	 TZO8BZygqIQpevDCBpCyogxQ2N3MLXppye9kebBwfkfhDtHMklezVuy+Y0h3Z6u2KhiSP
	 690l7MRinPioewjlV9Ln/0k9rq0v9F0nZepA/bWprrhfeylJoRFXeaYcF4MRNCDMjXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sPba+bVamvzTWQLnLCNMaFu8OZtPQlAUYLXZMzIXg3E=;
	b=lze+TnKtFVssgTZ+BE91fSDVKXzcOZXmg/TqlvYHczj7xbXBIkVbzHnI545CaVR5TyvP
	 hbWr5q2xc//xrKyRqrjjY01UV/L1Z993ur6HHPinill4ZNm5pJPtHk3NjehBzqKmiJX7L
	 MmzvBA0jOtHdkjBUL0jA5EC4FgN/eDMZJQrCW0iKPXFANHudUQKIWVCoCEWrL28OF132u
	 3LQPVlAA8AdAdG/dkG5XVhC/fScG0E0Ut8qznxzikwO73pdnhUeRGuKrSvEShwdHKcCKx
	 o6Re1jtKfexq8Qt376kwu9amOz7b+f/rEASXErWPtsY60yQJepm8kXbZEkAEkj1jDVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pyKK+ubN;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9011860A2612
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9011860A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pyKK+ubN
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3ad6011ecebso177793a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585922; x=1793190722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPba+bVamvzTWQLnLCNMaFu8OZtPQlAUYLXZMzIXg3E=;
        b=pyKK+ubNg2ugvEiozcnh0bkIjd7S64/hpGWpkYQm1AAeaOxNzuSx/aQ3gWBSrfKJ7T
         EWkXp/iFEiDA//sZrdJBHS9mssG66AQbKTkDlJnXepPEbSGHX7hm8gJMbnJdAhflq7Bt
         lMcqeE4aA3lvQf5W49uv8lNZ5SrH+lE+GWjr1jLwih+H6J3MSLWmh0eIsYnpbOHtGjpF
         3un1ctZsA0M9chdX6rO3o/dC/1Pmj0E2TVBFHvhH237+1JNCZj8Quj3lcZ/m+r+Fe9lw
         FKJTAWR0j+NIw/ztyfwqpfQA1OdPRtE5W17l6PSn7Wj/EJVpp36ybi9r8s8hQVxXjf6w
         ZypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585922; x=1793190722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPba+bVamvzTWQLnLCNMaFu8OZtPQlAUYLXZMzIXg3E=;
        b=Mlnoo6OGmcVwgey35zEYFMCJ3NvrZf5tVKveeE12cN5hZhRjqpPTsdWk9QTtQkGcFb
         EexKQbZa+ptUMfbB46whhX2GFmy6/UxW+ZTTIx6/X5et7e2jVWABn4Tn9zuWBUmfWvK5
         TbhWPJcPl5lQ5+2hXF1J6KG44RZeVuZFBBmHgtmdi5W+ZAF1IsjaWI7P7f6ZsNpoAuvc
         4h9VWmZH8vYXA7AXYFeJ7yZfPCiERWQesCWIaI0Ib8uCSwxiiovDpySzyXO0kgmSzqJQ
         Fy5y/W9OUM97tI4EU+520rx58gNLHeBbYqV4q2f65Jj+9s+vXClojdCRX5UegStQJBrJ
         PfPg==
X-Forwarded-Encrypted: i=1; AKwUvBzqYlp7wwvEkGk8nn9CDeGomdAcOwhnTNjHPLHlvbsIB4vpt2wPD4jaJhUqq0kzG70XvhXP4dzYenLcjnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB1qw3CeWCaLZpnfYERo8HlBOwHOHwI0RuVZ3d0asSRD80kK2G
	imK0N+yaelwkPy6rRK5eSSF0zz7ybu6wlsFCrUnF2OZoYI+H07esMwGo
X-Gm-Gg: AYBFou2R9PeF2dJ2YE08oySIG8VbV/DYmREhTMer9665WqNPmfcVy9bLRnZWC2kxhbT
	YG9g5p1aWDF5EQW1CfamUS/C47USxvR6mGRL7q/ruzjyR95V0gJw0ENAndRUvkbO6TvLHClgApb
	rqyTMnVegNqRPaox3IzZSNBp8XWP2zaNCs8B6iqEtydvJb7tn6UzItJ5VVl0PVbvtFlfN7nohI2
	h1wYMneg5KnjDAbdWfGqWz0mwlPx1FUbMDCIGRzOcKAw+rOjLT+ghfApwpafevaVafSJ+ZX4pcn
	cimVoWEQ0BBZYmxNYX68vgDDxu5d25lHQrY3NV04rBtWInCLC1+qYP07kFr7A7jpu7HYOqGJ/Ok
	KZmaj4C8N1szZY/KuDi0rxmjuaD9HzRegGITirVTV2R33WD5TMU9ErbCTnEN7kdDFg1Tig1Hz/S
	wlms0inldsEaeUbEPUkdvW7wrsa0PBNxfvoOlOXQUiWFomwsQ625MJ559R9mmeaGIg9A45K1RZL
	YHY7fje+l3kPkvr0IwWYsXlWEB1LMYZ8XmpCmSTt/GZ0RZLhnWAPtUfeObjg4h2bu6AKTeM1Q==
X-Received: by 2002:a17:90b:5547:b0:3ac:80dc:f40b with SMTP id 98e67ed59e1d1-3ad86ed848fmr1597600a91.33.1792585921869;
        Wed, 21 Oct 2026 05:32:01 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813eb9casm4229523a91.15.2026.10.21.05.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:32:01 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-kernel@vger.kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH v2 2/6] Input: joystick - use usb_make_subpath()
Date: Wed, 21 Oct 2026 20:31:42 +0800
Message-ID: <20261021123146.17202-3-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021123146.17202-1-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
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

The pxrc and xpad drivers build their input device physical paths
by appending "/input0" with strlcat() after usb_make_path().

In preparation for removing the deprecated strlcat() API [1],
replace each pair of calls with usb_make_subpath(). The helper
formats the USB path and the "input0" subpath in one call,
avoiding a separate buffer scan and append operation.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 drivers/input/joystick/pxrc.c | 3 +--
 drivers/input/joystick/xpad.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/joystick/pxrc.c b/drivers/input/joystick/pxrc.c
index 52d9eab667b7a..1a11e73d7cd04 100644
--- a/drivers/input/joystick/pxrc.c
+++ b/drivers/input/joystick/pxrc.c
@@ -169,8 +169,7 @@ static int pxrc_probe(struct usb_interface *intf,
 
 	pxrc->input->name = "PXRC Flight Controller Adapter";
 
-	usb_make_path(udev, pxrc->phys, sizeof(pxrc->phys));
-	strlcat(pxrc->phys, "/input0", sizeof(pxrc->phys));
+	usb_make_subpath(udev, pxrc->phys, sizeof(pxrc->phys), "input0");
 	pxrc->input->phys = pxrc->phys;
 
 	usb_to_input_id(udev, &pxrc->input->id);
diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index feb8f368f834e..0f7ca5adaeee7 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -2059,8 +2059,7 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 	if (!xpad)
 		return -ENOMEM;
 
-	usb_make_path(udev, xpad->phys, sizeof(xpad->phys));
-	strlcat(xpad->phys, "/input0", sizeof(xpad->phys));
+	usb_make_subpath(udev, xpad->phys, sizeof(xpad->phys), "input0");
 
 	xpad->idata = usb_alloc_coherent(udev, XPAD_PKT_LEN,
 					 GFP_KERNEL, &xpad->idata_dma);
-- 
2.43.0

