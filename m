Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773506;
	b=xDzpaF3kZjo6IPB33PwGr/dEu2ufald0nzktNYrtBJwJsu+4t3cH+v7+NGwxJBjal7kF
	 Vfkh1UzMjfw95m9lQMBgVL/jhgaxnO7zCyhH7YRDocvdlt3X04sPCfSWtMrvW5mJe1zZ+
	 RTw1nj8Z7gnami+o7XJAx1F9ucZMOeB/MinfKr6hrkYgeks4qHqPSc2NYTqc8fjHp/sYP
	 IN1uasdEh86p71ssfOjxEenZvMI9dFGpEX92EjqWgdIS1l03/jrB68+14ruNljC/t1xRv
	 QOswBzjUzo9ts/q0SUyEPQB/wRxvM8zqPxkFNU8/A4jGF8p2WDGLX6f909dtqIyXnKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6aqflyyGibB6JpqtJHNzZdrDhDz9SBMlPar0zuxq8rw=;
	b=Y8sPnhjrdgwadzQ3yIZOVcgebH6dhueZKDvsymKTWvYHbEqnQGzdb8DsgweIZhZFsz7g
	 MBLRMaKZBCn61vztzuxI1D390NxkndUnuW4MLoGtNiYe7RVVvWV7mK+i8LUea9f1Jps1M
	 KBkmge0/c2RiAGjMJGZ/CIP2shGNm+I+IfEw1RSun9931FuFr7bUlsQgn41QF0mw6il9U
	 4qYwR1y9ByjomHFroDW0nQpd2uZVP9fQ5iOV7zXDiY/tdMKNLllXY6gSeboVabJOEZV7r
	 636HlW14cJEw6fyNxrJ96RyZ+z7CJvqyTJFomhLXrrR5AdWvuDoZcvZmU/ZP5Qvfjyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+2n7Ak7;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3639606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3639606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+2n7Ak7
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so661072eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793773505; x=1794378305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6aqflyyGibB6JpqtJHNzZdrDhDz9SBMlPar0zuxq8rw=;
        b=S+2n7Ak7tV2EJGZD2ZPpD4lN8xiJfS5kAxeubkDJcpbqw0AFxfAIHpdR5fzsjv0cs+
         i7CUhFQj9ik/a1NcJEP7H7+kR850mD41LPurwO/jH89nmuJG7G70LvXom89npCcGEVSh
         OmqyEQlukw+KPed/wEqrj81aVM4OJ395XPiAEPbGdHJ+lkBD0hRXCJRYqH768oXOG0GC
         RTAuwLizS6+M6y7QISup/pRQqhcoY94bFwFqK/Bi88ygcaaBhs6W7YTmGK+O7TXVkX5s
         59g8jINCi9yykjdI/DwtgU3LbHPEyEuwGY9w4ZDOVb3VyLTr04NmyIGZ/ykzQBSKBV+r
         MYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773505; x=1794378305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aqflyyGibB6JpqtJHNzZdrDhDz9SBMlPar0zuxq8rw=;
        b=OusX6PXTBXTftvAcjy3XVeYtM1QftDrPRZelJN24cSjALhbLTWAUDCWrhpNDIvG+Ne
         59fqxA/m4JSnrMe5hSwtXvwcscX43x5ZCVQ6cPZFh0bhu7p6tITZNq10+fyfQ+WBsb6v
         85lP3wKOyizBsTmz2pJbrrisDssE5R4ZWJIMlPS61Z8K9yL2sbi+2ZPJrvfIXgxWMvuP
         HOgRdDc9qORqWBOqWq8XZvi/JgEKK+3H/ALtOHMcljkDAReX+G0EA0BfT2MBYXEvPbka
         Nl4zjQtPKmXJHP7+C4HSASr8/7r4gKubWi/QeT30YHK1qL01MlevK16nYYBYqJusVYKQ
         zo0A==
X-Forwarded-Encrypted: i=1; AKwUvBwo4LOs2syVh+8saDodBl2mAEX8/zzGHA871x8SfsMAfCCX26Bq3FbiA2se2IOU4Z3ARxAkv9TGa6XD5Ck=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vDuqEqgEP1BEKP58/EcJl4YZkTpXQ33ANSomZSz8DJyYAKjm8
	h3NSEdzQxwYke0C+QBVoDeMcxiy7F6es5TE9SdYRVMerafgakAj7Rwnc
X-Gm-Gg: AYBFou1N1L+of7dBGXbygAaLH/Blho+2zymbD/HAbv8I1xKk7fXA5njJ55Ye4gAb/UO
	iCIy440GbWcoeo2kXBMBK9n0ue9EMbFDoLgmflYxA89PQLEdgUkU9Q9pwuReJ6woR/+9uLGXHYH
	8JqWYLfD9legWPTqa4ZuWeSudGkdCS0x0/JIqxflIsZrthbHOaeILdvFxyulkId3eIaAKM4OBuC
	J3RTkQhnZRQHl5FmmRkeYIciuyaD6TlCKoTL2991+4B58u+2QI9IvHllc9DMtqd2m98n3DxMGi4
	xKjgLKFwVLDATZ1eg0EvRE67qfYc8U5e41G3SBOItGjtnp4OV8sPi34QxZ5lE4MvLxzqT5ZoPvj
	N8WARh2xjwLxRu5Mhs6Yyf1S9VPVdXGLHfpwckltPLG6FozjZPUrElTO/HAQyB2ZpoDJEyZWM/Z
	NXRTlntM/ceZgz5xXAuDgJWIKhQKto/IwM4JKPMBi/mPtuAJ127kFl/++0cEfBmEUN5yrxWJMD5
	fBSh6rx8CdjuWw0318kgZClY8COikdMIa7WQc4LBWu7/oqCwrroEloVBMn/TTS4GSEL8Zvzaokg
	eKCuO64QSFaPvhnjv6mvn3CGSbHUJfprgyRolT+hC7pqyhVwyg+4i1IRGuKS9yojxIMyjXkoDDA
	/m62u
X-Received: by 2002:a05:7022:5e09:b0:1a4:3169:cb with SMTP id a92af1059eb24-1ac5cfe5610mr20134833c88.17.1793773504605;
        Tue, 03 Nov 2026 22:25:04 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:37bc:b892:b6fa:fd6e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm5615163eec.27.2026.11.03.22.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:25:03 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] Input: mouse: vsxxxaa: Replace strlcat() with strscpy()
Date: Tue,  3 Nov 2026 22:23:18 -0800
Message-ID: <20261104062319.288360-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
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

In preparation for removing the deprecated strlcat() API[1], use
strscpy() to initialize the mouse device name.

The destination is zero-initialized, and the constant string fits
within the buffer. Since the return value is unused, this preserves
the existing behavior.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/input/mouse/vsxxxaa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/vsxxxaa.c b/drivers/input/mouse/vsxxxaa.c
index 042a17fe81db..b3a0d7ff5738 100644
--- a/drivers/input/mouse/vsxxxaa.c
+++ b/drivers/input/mouse/vsxxxaa.c
@@ -463,8 +463,8 @@ static int vsxxxaa_connect(struct serio *serio, struct serio_driver *drv)
 
 	mouse->dev = input_dev;
 	mouse->serio = serio;
-	strlcat(mouse->name, "DEC VSXXX-AA/-GA mouse or VSXXX-AB digitizer",
-		 sizeof(mouse->name));
+	strscpy(mouse->name, "DEC VSXXX-AA/-GA mouse or VSXXX-AB digitizer",
+		sizeof(mouse->name));
 	snprintf(mouse->phys, sizeof(mouse->phys), "%s/input0", serio->phys);
 
 	input_dev->name = mouse->name;
-- 
2.43.0

