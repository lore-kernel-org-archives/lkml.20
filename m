Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581775;
	b=rR1Z8FjB6b+rmKKJOajPjpK4C2ruok5wIbzN4NQ7sOwXtEaDAZASMgBCpMA8p2AegujB
	 W8NQ4oT5EYIXII9QzxQ2GEn+mU3juCZBRwwb8WouQW1BEXApj31Ajxg/yeCSkjAB4YsQR
	 15ehZxM4cCA7ru10rEWGxBn0SLyCstKJ/CV5/veIelI9nJV8HoC5uWTu5bw01tv/m5Tek
	 aT1YScnjvDQ74gjowAySY5SDjAD3xI3/DG4zoQ8Ds2h+2Ypl5R3hUFhXA0UJm0RxarwPb
	 tnN7+citiziq7eKh4mTktJmA34uKTdLaloyos4J4faUKdXG7qzHKKUg7FiinaRKiQaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HTKei3hMm8BrgIn9MBb98/wkj/SGe/y2Ur5xLD1rNKQ=;
	b=dBKXPqDNjXwAD+lUIdU0pJYp9DXvdXnNG27u1ReXSfgKqWEXPu86sKTOdg5nyYJ0Zy6L
	 5u2o/pwuMzrbY5Eyb+GvDfB1cja8SX10cFpQyGqISMIoUfXMyJ/V2o3zeuI1mxwmwxkXF
	 j6ivXdtu1EqIa1enG/mX5WUSKsSu62xhkDgEHRQuYANDkXseRV7yLkcSes6mh0pMsa0zr
	 IrbzitceA7lreIaTmMwdxNnXDx3/uKrNP0YP/2cqanOIEHNqHxTFtGi4yFCv3GfxhXC7c
	 6kV6gH/rcpeFhIrMLAhxbYDAtLU91Uj0CDU3XFjYOpHsL7ZkftBMxdVcWpKj/o9C5Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1m7vzUQ;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A66606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A66606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1m7vzUQ
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70bf1671c21so1464732eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581774; x=1795186574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTKei3hMm8BrgIn9MBb98/wkj/SGe/y2Ur5xLD1rNKQ=;
        b=c1m7vzUQ962ZBdEwr/0zeh0jHX6t+DLgPr5rDyNH7TyCI4WMFpUjc6STRXXFXdk0bf
         IcMsmCrRV9e+6+6yPgA9cuQM28MDbKvOzqvNz9NM8DBA0x5scmFTU/+L4/fIl30GlAKA
         U+p6CBUDtvGn3GE1ISHUaMGj65YHgVKG4sh71Uxpp9O0+EyxDDNdosZqbTNOAwclNNVM
         u6JXNviREgWf4Ija6P0zPhN8og8TTVDA1+C84ZWqus9/8BNCWguCUr0efo7yJdmXfMt/
         4Jz3p0g0jrS/YX7IKFRU8B4WWEfwakl7qd/lSD6491uV3rZL9a4cyvqKJsy25KwMvGft
         7MCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581774; x=1795186574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HTKei3hMm8BrgIn9MBb98/wkj/SGe/y2Ur5xLD1rNKQ=;
        b=D301G/sxTocprBpa0wu8T4MASrOJSGP5FGTYMgUzZwUTX9W0dxWuEks5E9NmzgLu3v
         pjAsVHadxLAHTKW9ODeXiHoOCE6jcE+v10pF+uQfnxfM5bUTbkJn8E1wItVfhghECUKV
         KqNFkul3DJyHQ+vwyRgCnFMuGcGbo9CwSi2FY6wh3Xb3l2ZzbEzXKuAGsPg64TgkSdGo
         BgbNpKwsbm9vXT6nXQl2K7MZaVpKWB+5nGzIadaVtPmG5wSewoSIVjgjVOuU6LsT2qD4
         baYHOi+r1VtfOkyDmb8wQOJdkVxJHZEiDhbzBB1m5ZboKdJD7yiyqs8UeE+Bvp8xFQyO
         Xhsw==
X-Forwarded-Encrypted: i=1; AL+hErEyB9+iptX7SYyKNen0hRbh3WW/NIr702j8lqi/TkOiWFBXiMixbnIdwOfNj4TUIZhoWHCodvX9drYu36o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zM8RlVJvxf+bG6aql93cEiKSV3pVQAANJsnOz7D/5+IFNyhlq
	rpsFvr62RObRJlS/c0R47pR4q56wSrZeD/hjdKCrUgimlVe/RUbhyqxU
X-Gm-Gg: AYBFou3Fjcf/9qFaQdFZydHBqu2MFkz9951CIH8DrsglnneXcQMryrM0YIuA+e1W1go
	QNZWind15gWXSRqRE9plI4artyZK2+v+AD4jRtdeJfSsa0oyoQruWgjmgbCCbpn0OrQO8T6FDxy
	3i9hvxQLkuNPZEnBtVhLNt8Hr5qZp/Z4+ByBdhqiOo8BfGp5kB46WyQtIvk5nKFM6eAxOUavrk0
	EgrxVkVPKJJyT754fpTlLz/IUMvhdPWndeCZpzirohqA00umBmjpdKVB/oWjAMRvQQM6XG3esHJ
	LedOgTgy7wTkv1rg3fusvvyduco5xrmEVRqkisXoJKK/aBRjIAfVcLc6fkFc8uLWYL/i1ISVTX4
	922xEoab1FbkRWmdyocj1/K6axa6iWVGr588nTRgYZY/p2gs/IvsHqoC2ujLSKvqLSKAoLubxWf
	eEyCPtlJTCVOH6KBw2UWlQMxFj6Ufe2XrwJbo6UgWj+WTxh1HKtw2LfEMV6bKIbMMM1pJFmuMZV
	Jyx9kxRjvj68QC/Dx5y9rPponqbL096/8DT6uWbtogF+par2sXrGHsUTRF7fb3ZpKHajLoHZOEt
	HOgctCp4Dcz2fR6Igr5GbTs+/wu4XlS4PRC3i+EG+xghFSLuZRW0U0gGVHwe/qePHXQnd74H79l
	dX+weCgxIQetNAkR6cHqX
X-Received: by 2002:a05:6820:f024:b0:716:d5d7:60f3 with SMTP id 006d021491bc7-71ab4cd9493mr1547569eaf.9.1794581773792;
        Fri, 13 Nov 2026 06:56:13 -0800 (PST)
Received: from cachyos-x8664 ([177.245.232.83])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86288133265sm2844298a34.14.2026.11.13.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:56:13 -0800 (PST)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com,
	diegomancera.dev@gmail.com
Subject: [PATCH v3] media: em28xx: clear dev->v4l2 when v4l2 init fails
Date: Fri, 13 Nov 2026 08:53:59 -0600
Message-ID: <20261113145359.65440-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CALruWrWRWRU84AkDocSnNMSRp+WQD5ic9G_3peE50BvQR5iGBg@mail.gmail.com>
References: <CALruWrWRWRU84AkDocSnNMSRp+WQD5ic9G_3peE50BvQR5iGBg@mail.gmail.com>
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

In em28xx_v4l2_init(), if an error occurs after video_register_device()
succeeds, the unregister_dev error path unregisters the video devices and
drops the initial v4l2_dev reference, but leaves dev->v4l2 set.

An em28xx_v4l2_open() call already in progress (such as from v4l_id)
that blocked on dev->lock while em28xx_v4l2_init() held it will then
find dev->v4l2 still non-NULL and succeed on an unregistered node
instead of returning -ENODEV. When the device is later disconnected,
em28xx_v4l2_fini() also sees dev->v4l2 is still set and calls
v4l2_device_put() a second time, dropping the refcount to zero and
freeing v4l2 while v4l_id still holds it, causing a slab-use-after-free
in v4l2_open().

Fix this by clearing dev->v4l2 under dev->lock in the unregister_dev
error path of em28xx_v4l2_init().

Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Cc: stable@vger.kernel.org
Reported-by: syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
Changes in v3:
- Resend: v2 reached lore with the "diff --git" header line split in
  two, so the Media CI robot could not apply it. No code changes.

Changes in v2:
- Drop the non-standard 'Assisted-by: Gemini' trailer that failed
  checkpatch.

Note: compile-tested drivers/media/usb/em28xx/em28xx-video.o with
allmodconfig (no warnings); not runtime-tested locally against the
syzbot reproducer.

 drivers/media/usb/em28xx/em28xx-video.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..f78325a41124 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -3129,6 +3129,12 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
+	/*
+	 * Clear dev->v4l2 to prevent an in-progress em28xx_v4l2_open() from
+	 * succeeding on an unregistered node (returning -ENODEV instead) and
+	 * to prevent em28xx_v4l2_fini() from tearing down the instance again.
+	 */
+	dev->v4l2 = NULL;
 	mutex_unlock(&dev->lock);
 
 	/*
-- 
2.56.1

