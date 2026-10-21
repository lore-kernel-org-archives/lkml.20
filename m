Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585939;
	b=K8wshsWVpBUQNisAtr94wemTcW8jdztmf9wQXhXb4AWEbjTdKNa62+YuV/3ivEpFNUkX
	 nWvB3O0C7AJ0GD1aTshWrjVWjvjay3RtPas4+g7ZcVDk1FPy/QVQh9rV3yW64yhDn727j
	 FG5DSm3H3hEBbu5vc/DYUF8+ZJios3HwOkY0MMyKJncuSTvLuWk0Aeez2v3ohaUcSai2t
	 /M49SKr/DC7qXZeE+b3BTbVq4VooVNTHcnBhC+E48fsBaZH05hsi4tXNFGlE9LB/v46dQ
	 SidIXTvO36MuPIs5Dx4RT7WjQ+UsmEVyqmr7OSGs8T0yLgQzWbHFUWE/J5/CBniIiEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UlfXExQXyhG92dzdrPUvVvWcK6W0MmRTGKrmc+yyUUM=;
	b=BhGhRftBCEZr9oAJAc0t5skxWhWanWt60CMnPNU+/Px6YFnc6vvPIR2t6lJyl1H3KNTU
	 FucytmsehSGNQElf4tZm2ryp5PDh5PvOYOmEKda8531nPWbgNRDTo53Fmb+Gv4jIPZB/B
	 HoRoiE1WEIOmrPaZDMBhi42aah45xKQuc8r6qGPiB/nEuyZ0Ki5BFkBMJ/0mn548odSKN
	 ZMq099sCt8uVupSBrJc6KfUrw0LDkHL2INP5QxVwBqVq2eW+Feqd8NxNfmMDiWz4Tyx4f
	 TB7BkU+hfXFsqMNjWGuRagLCHmKcl+p5TuMDt7KRcunrcACDqIxRiCm15vQ1Jtt8Iag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aulBXKiD;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEBE60A382E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BEBE60A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aulBXKiD
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3ad6011ecebso177854a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585939; x=1793190739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlfXExQXyhG92dzdrPUvVvWcK6W0MmRTGKrmc+yyUUM=;
        b=aulBXKiD6yr4+Lpo4Q4fQnuP3c62bSp5gu1WaPr9X8F9pBH63WOXP/HmOkj4tA/DwI
         f7c+9Qq6K4JfLf2CYYTlYdL46udovCZHsZWK/oNBh6GLjiX3+rEsqpwMci1cmV5c7Obl
         sImwte7h80qCmdOB7fys3U8uxsuPplW46JMjCp4eu+qEo8+jawjt2Hw9FeABGniYE8jb
         D5+ftqdXwL+dUVqZTyIVXoHUT1S4qYwTtZQN0x23TbxP5hxJ9RgWJXXt540R12rQIK8h
         ZX8ZXNl1Tdw6+kc4Dal9QyGsURqGESjBd2mFgmcBYQE8keRxvJOT6FnKKDAcKZsRsSjv
         4CUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585939; x=1793190739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UlfXExQXyhG92dzdrPUvVvWcK6W0MmRTGKrmc+yyUUM=;
        b=KcAHVqJ5HCpYRDd5WwEjHrxRAANdYho8HDfxq2nflYqjSYGb7LjIKAfRlR6p+fFOiC
         kdHLM43VHs1fjzmfSTnAeY6syFcJLSm3fWGGjjKzaysPuqFzqMnQPRj91K1Yr3R+xbMh
         j4k9XDLTi0XnM2RRg7fiRAgGuiSOEtBb6BHm957r5ZERpjmZX7W7tmLkWfiW96PbSrYH
         u2fybr2cX4g1FGY9PhssoT0BXUKdmxkkDFL3EfLYvVyg1QyE4ZZoKZri06W6lL8X9oPW
         ZV/Hg8rEvaFraOQ4vWBooUi1B0BCMz4EzCz7juNz3On0hxQ7a5tFW7/bOujG7es7/M0V
         azMg==
X-Forwarded-Encrypted: i=1; AKwUvBz2LRqbov7tX9JvLkc8PwX11T9QImnV1Oecr6412+PxkFosJ84sm0a9unfpoazRw0B8Hl45703QPD6kKFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC8qDCG/9yLZTUFduJ/0ilOAt+AevyMnVXh+ecUg7Ex+wlFG6y
	Fi/bfyGskkozWY0SqQ9Pu/omP7rUKjjWovS+t8m1iqN91sr0padiPIgI
X-Gm-Gg: AYBFou0kcct3GzSjBbAxSdW5u3xVuhf9M6e6H8W93Iv0FsfAql1PbGsP/dlI7Qo6zhP
	APjoYwah4cxiIcyboTrZ1SOZyibg4NBltveakpRekqonrbsPCyPoFTVYefBzQ2KCTi8CWAF4FZD
	wdpFPGgJ5dSwNGTuijrBKBNvfk1QyOlPaxv9IjT38TjqVtq+pabNcCPWTVRpY0yiIgxAPp2/xsM
	s+bAyWnKe6fgaHGngXqtaxz+XHU9UoiqtVxsCTkOXcetCd6COGQhhu6xANBwHaKDeqbeZJN3tZP
	a8NaTgjvNOYzsxT0ErGIdmc0omZLFn3lCh+2uU5Xi0bH1bfhe8C2eO3pae7kwQjzff0oBAxa3rc
	NIXxD8nc0qHIg8mN0/B8tYiAh6WP8cAbi2jmwPmWe1PJe7TxVRLvaMPqNJpEqRgBCw3FvJ7BYGa
	BVGLhEIJNMnq0cwBN5aw+1QkOXElfHH3mW07mHohYpuXJOXuaoxvQwMBSgpLyQVw/cEvZF+4606
	yWRFSQvaA/My6DkVpbuPhVXL2aYE2FS1PLbJGuWj2cV5e/+BiSlrqc3NlB0QBijMQcdC46XaA==
X-Received: by 2002:a17:90b:4b03:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3ad86e9eb76mr1566540a91.14.1792585938937;
        Wed, 21 Oct 2026 05:32:18 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813eb9casm4229523a91.15.2026.10.21.05.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:32:18 -0700 (PDT)
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
Subject: [PATCH v2 6/6] Input: touchscreen - use usb_make_subpath()
Date: Wed, 21 Oct 2026 20:31:46 +0800
Message-ID: <20261021123146.17202-7-shlomojune6@gmail.com>
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

The sur40 and usbtouchscreen drivers build their input device physical
paths by appending "/input0" with strlcat() after usb_make_path().

In preparation for removing the deprecated strlcat() API [1], replace
each pair of calls with usb_make_subpath(). The helper formats the
USB path and the "input0" subpath in one call, avoiding a separate
buffer scan and append operation.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 drivers/input/touchscreen/sur40.c          | 3 +--
 drivers/input/touchscreen/usbtouchscreen.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 77ec2c94b91fd..7702eead123e2 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -690,8 +690,7 @@ static int sur40_probe(struct usb_interface *interface,
 	/* Set up regular input device structure */
 	input->name = DRIVER_LONG;
 	usb_to_input_id(usbdev, &input->id);
-	usb_make_path(usbdev, sur40->phys, sizeof(sur40->phys));
-	strlcat(sur40->phys, "/input0", sizeof(sur40->phys));
+	usb_make_subpath(usbdev, sur40->phys, sizeof(sur40->phys), "input0");
 	input->phys = sur40->phys;
 	input->dev.parent = &interface->dev;
 
diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 0bbacb517c286..fd2b896675dee 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -1512,8 +1512,7 @@ static int usbtouch_probe(struct usb_interface *intf,
 			 le16_to_cpu(udev->descriptor.idVendor),
 			 le16_to_cpu(udev->descriptor.idProduct));
 
-	usb_make_path(udev, usbtouch->phys, sizeof(usbtouch->phys));
-	strlcat(usbtouch->phys, "/input0", sizeof(usbtouch->phys));
+	usb_make_subpath(udev, usbtouch->phys, sizeof(usbtouch->phys), "input0");
 
 	input_dev->name = usbtouch->name;
 	input_dev->phys = usbtouch->phys;
-- 
2.43.0

