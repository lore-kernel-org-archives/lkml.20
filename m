Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E788A444706
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515537; cv=none; b=M+DLkUuDFza8ROaK3Jcy/6+6zUo3gW4K9Yj8HJmKkN+CHNvzSSVZkvdeYP8dCBo213Ejwi4vVcVRikjoGez796dEfY+EN95AhfBiMi45mMcf/UQP/KaAdVLqfNl4JfbyP0XQFdHIvzbml5Noy+XsIeQ7lPz5MZJ9KWwFyEjyuDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515537; c=relaxed/simple;
	bh=WLuAx9dL8Uhq9q7tDcC3t3WqKTRHxDSaOFzJ3KhkEZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdjymCGUFkA6rdY0zkYo7ebnLJiwDX13SqCQHmqMY4cqc47ZI3gi6yFeI9eURrwe4tJf9ns9f0fSO3ijMfSp1ai+rCBw0qysdsQSVbzeiPwurLaRBNUZB86eIj1UdUko3ORqu5VhUrt0UFFS0CX7nGvDQMAP04dxewbu5d3ND9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7p/1V9D; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7p/1V9D"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso6705905e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788515533; x=1789120333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tPZxOd/jUEm4iyVSqikL97T5ZOmda/lLmug2pbNFbY=;
        b=r7p/1V9Dq7hHSQ0s6cNy2nQ1DcjNQLZRH7N3Fr3ZradUUMzKI23sdjadesUrWjv7L6
         +Bpn+yIUj7+WhbprQabmAqCqI5A90BJs/PPXyda6jkV0gwDzUuoVEJinzNW8TNx2M2YO
         WgH8s95OwTO9dzY5yn1MGHu/t0Z/QeaxSD/X9yMxGteB0F6SdKULXCduS3KKGTslsu3P
         AMzEqP0L9kVkCv7BpuQBz+OD+k5M8RYu3z/EQnJM77uDTjtnEzk7eUZKRbQvCgzOJcH0
         4KYxDUsP9Gu074M+WPxO7pdv4ejXAZit9AAb5jPednUDpZdRoj4e0dPHeq66mZM6DxTZ
         cVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515533; x=1789120333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7tPZxOd/jUEm4iyVSqikL97T5ZOmda/lLmug2pbNFbY=;
        b=Ao34sJUPTG88q6YYuDvCMCZ2eVypdwJOzth4zmT13jlZzqVnFOdjuZc64l7Rjl+Nc1
         y1KrWnPnGES/gVsnZrANULr22POkzEhPg1z558eZdHcuecL6D8/PIdoGkhtHUebrUDkg
         M6JjU+C7UrqZA098A3S8HqmBF4ZxVvyxxkGFe4Xha3IKXQheHu4uEKFQngiIUImERqkI
         pxjh2bPeGR2HC+pqG/H/UiX/hozJ8/ijkDZtWrchomk6Qr/zszHTK/fDT69deL4wkOww
         JbSSci3mpmik/4GuuE75Ljqt5CXUXRAMSK7jN0LuOEQ7zsDT9pnnMDO4fEzOtI5DWJwn
         6X7g==
X-Forwarded-Encrypted: i=1; AKwUvBxBXX7cBXmBDZLzggP+zDeOs33NYGanRhx1YAyDkhzRJn/bHz6mnWLS1ww5AnuGe5M4ukZ+3FkFfZH948o=@vger.kernel.org
X-Gm-Message-State: AFuF++nKgi6ChRdC58yqiXBeCmhY7BO5qPeL19e4txvrSR2/p49hEqO2
	5U+cpNVM9bDWgkVycZ9HvuG4lUYuypyZ5oGkNr9OPhBSpKk5+4Z1hD8=
X-Gm-Gg: AYBFou3shG/BYeF0cTwoAcLwJXCpPxwFno2ebMlfTOy5w2sURa8qK9+mYH+Pa2tzBYm
	QZq/xYiIgVbvAtCKiIKEtzIV26j0s+XfjC8qohiLRXddd2ttjXYCU+dzQNRcDyR+UueLI384XaO
	sILdkG+jzRlRTc6q6p6qYeeUoXsbDFFb7m3StFMf7mOOhzC+MBzqScthCcJte0DzQPOkHE1aarE
	7F7PQl7NS0irGqlOaSvnss3h6tKzKo4oIxumkow0dmL6NC9scnPjkq41wRIy+5jsgDn+lNl4/eq
	xV7JjGmGDdKhBYYKpzxHbjflDO2F58TCCSV9xhSY/v/XtQkVFtrAtI+U4SNh8Xdb8cU838rCmlg
	nCRQLrCiHhVjzgvIQDzhiAAKUn1rfJE2o+cLmn2ftA+I9bbqgJK/jGGeY0VI9DxgeUGwh+p0CsE
	n/c+qR8L/Ld+NXqjbNHQ8W6WXiC39qUg==
X-Received: by 2002:a05:600c:5247:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-49cf81dadcamr43236695e9.2.1788515532842;
        Fri, 04 Sep 2026 02:52:12 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm168466065e9.3.2026.09.04.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:52:12 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] ALSA: usbusx2y: validate URB actual_length in interrupt callback
Date: Fri,  4 Sep 2026 09:52:11 +0000
Message-ID: <20260904095211.3906038-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904095154.3905899-1-tristmd@gmail.com>
References: <20260904095154.3905899-1-tristmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

i_usx2y_in04_int() processes the interrupt URB data without checking
urb->actual_length.  A malfunctioning USB device could send a short
transfer, causing the handler to process uninitialized heap data from
the kmalloc-allocated in04_buf.

This is problematic because in04_buf is allocated with kmalloc() (not
kzalloc()), so uninitialized slab data may be present before the first
full transfer.  The data is then copied to us428ctls->ctl_snapshot[],
which is mmap-accessible to userspace via snd_us428ctls_mmap().

Fix by:
1. Using kzalloc() for in04_buf to zero-initialize the buffer
2. Adding an actual_length check at the start of the callback to skip
   processing on short transfers while still resubmitting the URB

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/usb/usx2y/usbusx2y.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
index 4190227c5a2a5..5744a873aac26 100644
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -189,6 +189,9 @@ static void i_usx2y_in04_int(struct urb *urb)
 		return;
 	}
 
+	if (urb->actual_length < 21)
+		goto resubmit;
+
 	if (us428ctls) {
 		diff = -1;
 		if (us428ctls->ctl_snapshot_last == -2) {
@@ -253,6 +256,7 @@ static void i_usx2y_in04_int(struct urb *urb)
 	if (err)
 		dev_err(&urb->dev->dev, "in04_int() usb_submit_urb err=%i\n", err);
 
+resubmit:
 	urb->dev = usx2y->dev;
 	usb_submit_urb(urb, GFP_ATOMIC);
 }
@@ -305,7 +309,7 @@ int usx2y_in04_init(struct usx2ydev *usx2y)
 		goto error;
 	}
 
-	usx2y->in04_buf = kmalloc(21, GFP_KERNEL);
+	usx2y->in04_buf = kzalloc(21, GFP_KERNEL);
 	if (!usx2y->in04_buf) {
 		err = -ENOMEM;
 		goto error;
-- 
2.47.3

