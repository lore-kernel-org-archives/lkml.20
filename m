Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653019;
	b=rZ0HDDGwZZXi2hfFIeMg2CIA8MlgySYf0YXEsVT9LMZNbzwtcYrPFXdKPo8RHSB04tBV
	 ccPJcBYwcNc6N6hB/3njVXiBa5p7MPqKl+gOZvBPuZalMpD8GKUUanZF6oa4kwKWGfgTd
	 aM+DEQejBZWoCSBxK5i2zVeae5qd5GfLNufdxbbGFx0TOZtm5GbSCD+Q0+mm3DLOTpHP2
	 Ic4pw9YgbWAenVfKTRTEm42hF5QSGKSuYVOUDE5xbaUK0WD4/1Og7CpwQnWIV8F7YHaBn
	 uGgkv7vI8cLaG9iMZdf9vtvMQh/k3IoIooQ90x+WEe+e5MuaYkoNcOLKR67/IDaTaxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D0jGTVLtzaIFDc7gI7x4v6SVaJxQo+nXgqAY9AHPQIU=;
	b=24qMcdeYxnBpJdeSps81to793SZEl7uvDloM1Yck/x6PP6is7M0cxO7U5Pq9Xv8Ncnc/
	 NDgzYSUl7AOxaKOYov+qfB40qFFmJXEuR4aP5e7w51Cqt4hiecKnzAm/ejuYBh7niFX+X
	 DexlvrDz6ycnjwzqpHeKxoevahHaHAnFicxCHJShFdpqHxC00bUoZM8FTaW2k1YVWH6gm
	 9z/2DrhJ+BOLNDfRUYz2ALW/Ell1nLXKiBseY7FjR73y0Sk9s3WHDy+B1NYMlBGe0YPRM
	 YsAYYqf7dHUAIjxc3lmrKLss9sAn8LfSi1BHkq4IltTHZf/BxJVzOB6xBDcXi3XF4xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kiOVV5e6;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115DD606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 115DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kiOVV5e6
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so811455a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792653018; x=1793257818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0jGTVLtzaIFDc7gI7x4v6SVaJxQo+nXgqAY9AHPQIU=;
        b=kiOVV5e6J/GurhcFbB5U4EjybcgG1yzCdcXX6qqqH3B8pLf4zT2exbjzkKeu3AkOYG
         8EQtoM6IijOclz7ZN+NIncP26KuaxJ7N+oPIIOX7hBIcv+ggvbWqc0diJmRQwwrOvOkV
         K1nu/SzFLysQ/vNIBbzqL3nJP6HzHiBXc/QTPIMFjM/XRDVc+9uKy4JrWsGJ/VXcAauC
         avfVAKZ3pJKSIk8FLonvgP9p16ZOpzTUbwSWm1ROEhgcbPkvIjW/Yg/jhy9zhVDLSozb
         udFqaQiSg9Q/PTrYCbTI5X34jL4OHBO9pFrN71nfLTVQwHw5oVidgelNT+DgEBwu91YE
         Y5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653018; x=1793257818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0jGTVLtzaIFDc7gI7x4v6SVaJxQo+nXgqAY9AHPQIU=;
        b=B5Idsmr3RthSbCPqAQJ2A31G5ZG5Uhgu+5OUjQE+su4zNycM8mKHBh6LY5BGogClSw
         /Ew5Ddh4rdeeffwusWLfpsWZJG14h4DeCuyAZHj5SblVvIESHbqqz2IHfZ5Jh/NFkd4o
         GiUHQ72rcKy0ORQpqdvgxrLzV6AC3M9dJ++6Ee2XXIWFqoBGaug6k15MXSuy4OcI1Syg
         nvrkLgw4rRk57x/hDtIXswHVDWXQpej50ChT5Xg1qXb64GwavAvK+eK4us92qJ0WvK9M
         p7w/Rc2QVfN30pcyB7DZ5+F7/jHdbXDEFGWDK2AbtIcJIz8oT/aQ2CliVkFM4BwymdJJ
         SwIA==
X-Forwarded-Encrypted: i=1; AKwUvBy72/Cd2rIpErcLJ4fInmqzEg2aTCdnBYHaX5YDyrSN0FWpFM2GUvieNnehzhLXd0gVXzDnkHqhns6vKc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1mVGGuugxr6shbh+58Y4bq6dHJJHlJeddZm0yfPgJAQEN66iT
	dJZ8EMpfPGotIDav2A7iBetkaeZeO2ADjq6mObr/Ezg04JA8IFxoi9ha
X-Gm-Gg: AYBFou0Oi1IaSjMsjy8M2a9oTEeXiGEsb6HYZ6EhdmWZ6rsvbe3c3saAclDxu+pyxYm
	ERBkAEp87BgHcVm74sn/1+5Uk5EkLCqYDYW2qe/jGO2u5uxElXOPZ6kEQWq4Wo7XLmuZHDHd9yq
	u/+65Wp0cp7dPQgqMTl3tGq5yldbtrW+WxcpWCzUkldiALhn+HVMgJFRZ0Gz6fqLkitGVr1h9UB
	plJjZGlA/qMBUTFbk/P4X4uL2dngOXWD+458nKfS0vClXu5XBnQsyoWmPK+1Rlf7lLhU3Wp0Y7h
	PKmQ3uYQL1noOrF3ACx/6L7mwwVX+iutgwNnw+riTVBD2aYhp3YodJvnARuTVoeQsG1X0SBGQK6
	nhWzeNQQOqGx3JF4xK5/QHh14DfV8xYpT+Y/STrYo1Lm8G2T/fruynI7Fim9wx3u8ZKg+cVQpgc
	ewoLEORsTM3HYwoU+o0GVko3pWvqknNEZ2qZyhLDljVtszZhStR6xJZFdrrKx9t6a037/b8OeUB
	Cz9746EfuFtWApRzJTCnO8SW8Qo8Qe4zeo25rVsyYQ+H12JJxG6tn1WM/aRe6+si75Eu8OfHQ==
X-Received: by 2002:a05:6a21:4ead:b0:3e0:df21:9de5 with SMTP id adf61e73a8af0-3e287dbdaa0mr3277689637.35.1792653018511;
        Thu, 22 Oct 2026 00:10:18 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49d1sm1706039b3a.12.2026.10.22.00.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:10:17 -0700 (PDT)
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
Subject: [PATCH v2 RESEND 5/6] Input: tablet - use usb_make_subpath()
Date: Thu, 22 Oct 2026 15:09:28 +0800
Message-ID: <20261022070929.20820-6-shlomojune6@gmail.com>
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

The acecad, aiptek, hanwang, kbtab and pegasus_notetaker drivers build
their input device physical paths by appending "/input0" with strlcat()
after usb_make_path().

In preparation for removing the deprecated strlcat() API [1], replace
each pair of calls with usb_make_subpath(). The helper formats the USB
path and the "input0" subpath in one call, avoiding a separate buffer
scan and append operation.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 drivers/input/tablet/acecad.c            | 3 +--
 drivers/input/tablet/aiptek.c            | 6 ++----
 drivers/input/tablet/hanwang.c           | 3 +--
 drivers/input/tablet/kbtab.c             | 3 +--
 drivers/input/tablet/pegasus_notetaker.c | 3 +--
 5 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/input/tablet/acecad.c b/drivers/input/tablet/acecad.c
index ba79dff21aac8..c12b0a0181837 100644
--- a/drivers/input/tablet/acecad.c
+++ b/drivers/input/tablet/acecad.c
@@ -160,8 +160,7 @@ static int usb_acecad_probe(struct usb_interface *intf, const struct usb_device_
 		strlcat(acecad->name, dev->product, sizeof(acecad->name));
 	}
 
-	usb_make_path(dev, acecad->phys, sizeof(acecad->phys));
-	strlcat(acecad->phys, "/input0", sizeof(acecad->phys));
+	usb_make_subpath(dev, acecad->phys, sizeof(acecad->phys), "input0");
 
 	input_dev->name = acecad->name;
 	input_dev->phys = acecad->phys;
diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index 0c1acb9e6b437..cc68ee82c12c3 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -1705,10 +1705,8 @@ aiptek_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	 * & a tablet, and the inputX number actually will tell
 	 * us something...
 	 */
-	usb_make_path(usbdev, aiptek->features.usbPath,
-			sizeof(aiptek->features.usbPath));
-	strlcat(aiptek->features.usbPath, "/input0",
-		sizeof(aiptek->features.usbPath));
+	usb_make_subpath(usbdev, aiptek->features.usbPath,
+			sizeof(aiptek->features.usbPath), "input0");
 
 	/* Set up client data, pointers to open and close routines
 	 * for the input device.
diff --git a/drivers/input/tablet/hanwang.c b/drivers/input/tablet/hanwang.c
index fd5a7e761dcc4..a9521bbc89646 100644
--- a/drivers/input/tablet/hanwang.c
+++ b/drivers/input/tablet/hanwang.c
@@ -350,8 +350,7 @@ static int hanwang_probe(struct usb_interface *intf, const struct usb_device_id
 	hanwang->usbdev = dev;
 	hanwang->dev = input_dev;
 
-	usb_make_path(dev, hanwang->phys, sizeof(hanwang->phys));
-	strlcat(hanwang->phys, "/input0", sizeof(hanwang->phys));
+	usb_make_subpath(dev, hanwang->phys, sizeof(hanwang->phys), "input0");
 
 	strscpy(hanwang->name, hanwang->features->name, sizeof(hanwang->name));
 	input_dev->name = hanwang->name;
diff --git a/drivers/input/tablet/kbtab.c b/drivers/input/tablet/kbtab.c
index 6ce70c8e2d7cc..f777118ed7c8f 100644
--- a/drivers/input/tablet/kbtab.c
+++ b/drivers/input/tablet/kbtab.c
@@ -137,8 +137,7 @@ static int kbtab_probe(struct usb_interface *intf, const struct usb_device_id *i
 	kbtab->intf = intf;
 	kbtab->dev = input_dev;
 
-	usb_make_path(dev, kbtab->phys, sizeof(kbtab->phys));
-	strlcat(kbtab->phys, "/input0", sizeof(kbtab->phys));
+	usb_make_subpath(dev, kbtab->phys, sizeof(kbtab->phys), "input0");
 
 	input_dev->name = "KB Gear Tablet";
 	input_dev->phys = kbtab->phys;
diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
index 85390ae423076..28fbae98f7399 100644
--- a/drivers/input/tablet/pegasus_notetaker.c
+++ b/drivers/input/tablet/pegasus_notetaker.c
@@ -354,8 +354,7 @@ static int pegasus_probe(struct usb_interface *intf,
 			 le16_to_cpu(dev->descriptor.idVendor),
 			 le16_to_cpu(dev->descriptor.idProduct));
 
-	usb_make_path(dev, pegasus->phys, sizeof(pegasus->phys));
-	strlcat(pegasus->phys, "/input0", sizeof(pegasus->phys));
+	usb_make_subpath(dev, pegasus->phys, sizeof(pegasus->phys), "input0");
 
 	INIT_WORK(&pegasus->init, pegasus_init);
 
-- 
2.43.0

