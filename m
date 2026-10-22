Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652994;
	b=RpJ481a3tRRjcZ3TRXWiSH2BPbBrJ8p1cmJ4j59gGeqdqP62NpBMG8Zz8bk6SwSbcKDr
	 8Q3DKKXabpLlrSV9cr76FOTPJx+fj8TjQlV4HDthDlVc6wJzesd5R8DSiLBGo+P4yabCs
	 3Erz10IRzhOwo2jszsCH6aNv0E1y3jG1EJbnL72MKqUQU1f0fPMy/y1Ing1jyN0AI8Tzx
	 mjYcBre8b5xowfw9P/hT6NhKU+Bew446N1nb2nuVOKYNYdy9cfpbAB7GKbCL3oko/kvHl
	 CUKq8+ia5yO3dv5N+Iqp9KKiMHbKYnZyXe77CCBSc6rnQ+iRfEUAl+JNr1We7fjOY/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sPba+bVamvzTWQLnLCNMaFu8OZtPQlAUYLXZMzIXg3E=;
	b=XTYmSAYGqQzCrS/MwdbewaM0argAICYerCeeSbWWuBYxRsnVVI/8tMDKi4n6UZCpRtjZ
	 3QmT6zWzNJq84LwszOcF4L24WzqLP+sQ7vu32oujaKo9T01nGyNKMbohwx9EAsUc6ZXd1
	 mhyC65UvNCHwbEATUJmYRzIL+ElKSd5uUKHStGH+EFq+xWXy96w/7Htt2kryldSpws+4F
	 nIp7AO3B6gBp3e43FHbTr8r2y8IifDza0VGIy2ZwL4xzZbehiz9xlI2/dousgxKzOzxBa
	 +WEsVh6W6f/5PPV9Cplski1A/oQUnWsM7VPuigIHI29thUKuRW6xXRzSRkGfwqo688g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LfFqZKDm;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A64606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A64606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LfFqZKDm
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e61817b178so5429435ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792652993; x=1793257793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPba+bVamvzTWQLnLCNMaFu8OZtPQlAUYLXZMzIXg3E=;
        b=LfFqZKDmN3IkEYK+7q2FvrK/3CegeBNZEJauHae1T8IS20pFOVebUIFqmutLg9n92W
         6qIlk2b16QL71UYza628/9ngC8xGLUa3KuyE2zYLj7R9ElYEebezhI7etJy8oAC2OknG
         QWS5/c5kCqR8NHnjHOaqEftbICkjVWxRYobYX8x+ii8E5kCKB/XyPDR6m4Y+dkxLgFtP
         EomvUv/odZgt3vI+zqsfY06aAhHoqLSD9KctJZAJo37BlTylH9FRRABfEc6PLQvWKO5m
         CgU05NpshSmjPywVDRXteb4OCbazQhxcfvWTa9LowpzM+IkoMyHu+LtKQZTC94Y7VH3j
         jmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792652993; x=1793257793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPba+bVamvzTWQLnLCNMaFu8OZtPQlAUYLXZMzIXg3E=;
        b=v2iOx6krpsAVt9rqJIeBfjQkx/Orn88lI+t4Pj3WE/C4HFqxNW8giHNIPExorpR9EP
         6AxlA2TqBg8uDlBzpTNXR0EWRAgKdH42ltO+AS93GfWcLbOmy28jA0hZTRS2wyrygPxQ
         7eZap+G0/MX4rA1lnVboQ0fL0DuB7xP0JoOQBI9wUzHnB33OomMNiXgaCYLI7cQ47N0W
         RJMA4NH4pSj4B0ypMrMUOe8YnJB7IwnnTXNrtNZu95q0ic8btGGmK9hNwrjtizJm7xf/
         PzhSfG8x3uytVdb5b54Pdpa8NOHEZQVEC6R60nSW4phAKByHJSsjoFSHrvb5KhbxgZD2
         gDQw==
X-Forwarded-Encrypted: i=1; AKwUvBxlOKJsuIBIyjGNgi1NNQIpJn/YIu09/k71dFjoCD0Fqr5n0r7SCMFq/7P41zL63b+Ghr8ZhlYdAmI3+DU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgokA1ztWsBxR+d0ee26lMviv5MO+IwjpnC0vK7/ppBxoqUvDd
	lTuljHdE/CVQrao5Q1t5UddJTr2syzUz+88FopX3aPe1ZHppXhAkrrMW
X-Gm-Gg: AYBFou31OVDXmZ3igXSTBjA1ljTs9Bo+keh+vh6ladoWdd0739r5Y9/uEpS0ORjGl25
	ZuwYGzRtq93hoJJtiT14i+/6QAxfgBp/LbWpBri0jIxG4587vSWjmZom1R7DrDo9DXtuvlFxQx7
	e/9nmo9RicDe7JIQdt1kza4vPTSdp5Ca/0WejGnc5dxvsSywh03VUiYcAP17YP4oUa6FVa8YEF+
	stRJBnkz8+0DLIZg1OQgEl+QL7C35iE9pf8Y5MS8GqUl42thomBzXrxmzMeCvfc9Va+WRDsm+lg
	zqv8/vOh/5GLgqcDMz+YeE6bhez7RHtJr+iczY+wIlmTcPQDBM+HyOCZ1v+1/xx8QirVuaMaY0T
	F8bUFAYPTB2Vh2HQ3bXy/XjFNNvT8v3Zz2Y7jCHejiJuESPZbNNjtjgPtONZ4+eBBAeT5Lr6mKD
	gq8HIFIvuxT8RDE9AeZQNfO5hq9fSiVyjkfprJly8B2e4hIOy45Lb800UyLvQglJ11GZA+6iKUk
	5HLf3ftrHLnc+5eAbl12rXYe2VEQet8VhC/c/RYVavX+kfrb/DRtvY/P8ubyaTI9Mt6GIlvOQ==
X-Received: by 2002:a05:6a00:420b:b0:899:3439:c8d5 with SMTP id d2e1a72fcca58-8a089cefce2mr3629799b3a.14.1792652993119;
        Thu, 22 Oct 2026 00:09:53 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49d1sm1706039b3a.12.2026.10.22.00.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:09:52 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Alejandro Colomar <alx+linux-hardening@kernel.org>,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH v2 RESEND 2/6] Input: joystick - use usb_make_subpath()
Date: Thu, 22 Oct 2026 15:09:25 +0800
Message-ID: <20261022070929.20820-3-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022070929.20820-1-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
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

