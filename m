Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793429248;
	b=Qk4q69HPLRwEvr8qA4n3Y8RV14S5k7XlwETlEl6SkjrIcMC3q2JYpqxMMCM7Q7iRHKaF
	 ER4TNgja2ZAgnrHGEio11zmJXXzP1+PD8dZG/6eKrISYDJ9jqDM+OFFvmpzwYH4Jzd26L
	 90wuvSj69nP9+sZx5FIo46VlPn9JC/XNYrH1QfMHKyIGY6o/gNAMAOtKUfYbGHTyy3bKt
	 PVJNojjJ1rkwqhfpd0HJY3UvfQbYusDggbnRXaH9pnwQmCgvmABf+gRLeGPbPyI+ulv4N
	 rVCHrYMzGJVxDK+LGtQaY4J1rr0btVT+4DGcRW1gBaTAYSEMVxlkBEycvUFOx+RYaJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793429248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9U3dWfP9wuIKNIASQMC6j7LlTeXrOraHdMR5EURM28M=;
	b=qEKgUi3KUMme3W+MIFSXsO+OUADUlPZa+xWa8OEpSB+yegY3EfWc00QQvQMBHQbqniqI
	 j2VPozlfh7upCEqTu01wCxmOXah7HbMkiuANv8th+8puRZMv0fgZKltZAaM/nxB4MX4gx
	 dOWoqcZRlXdY1LBJxNzbhmpPq+CLGfeVBdrothnJxStuvwfsXwKszBAXrcibNCDg2OuHa
	 tiKdxO0FQSqnVXd68xI5N6Jgk2uUHDqX0fphvSmw9Its08D7b+egrTR/6XDxYCFMAde67
	 aj/0Nmh731noWzr/czZKqNFKcd+Sq+8VcUkqHslc3kYoEhxrnvd5Fq6SkYITWV+vOrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZhqlFdHG;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C371606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C371606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZhqlFdHG
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c414e5d282eso174318766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793429246; x=1794034046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9U3dWfP9wuIKNIASQMC6j7LlTeXrOraHdMR5EURM28M=;
        b=ZhqlFdHG/4Fe4Aj0hNIJOjbgEETH12U5661PKpmYqz1xR8tHK/kqg4aY6pEODGD5H0
         LlOA+5112rYq+/P4t+2I+DKweLBORfOZ75XQycazt8sBq0xn+iwE3TTpIbU33BfMg3Ty
         m0yV92yb+vQaSs76F0kmqQYBl73CgLoLiBDsfc/fBrwhUQ9E9be8W/+cvMhaR2lLwS5a
         Eh0DM/216SaxM7gRZaGGGLDfabR79qb/trJB+ARbEBzdZJkwBxvz+D0JPzaZF3CKFdjc
         gDwAyAD0L9nBy7m1HQBt0/lq3J3rlC+Gay+rVticzvl+glaYdTybSuDJGtij8aeEv0Ys
         Pgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793429246; x=1794034046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9U3dWfP9wuIKNIASQMC6j7LlTeXrOraHdMR5EURM28M=;
        b=1EuXy5AvPPV00s5CjjPXEHNv5guHPEN/ObN7JGFiBgjcLIUoeqc5WNI8KlBJ/JXEIK
         FfynoEK45WMEubj3PwkclxG+0C2DiQj5UCrvHfCwLO3/uiRk6RumG87tSPd555MEL2qu
         ke5YVOtOx9a7hxbsbuJSRw+z97UDghwYMA9Hsxb/K2mWdhgtePb94qaqXXx3pcPOIU7k
         N3s9txJR0egFD1MzT1LrtX+QWphU2ecNygedVvEp0bWzTucH/fP0pxCgj1dPzS9/VJAw
         0CtFfqAoTcGEJ+Vip4qobrcubUqP1BOntLc9o7HiWDrAmOUxE7akZV5or2Qj/VKGfa9c
         HpIQ==
X-Forwarded-Encrypted: i=1; AKwUvByh2KMmwgoPtPE1pl5t6dXwNAIvXk/7vJ4LJfgsEbkNaeUcfLgIOhuMxIgMfTYRu/I9SA0VeFYALcNNr0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcU5/F63LaBt+4ImVOOYVUV/Hj61fyZYtKOH90Lrc6SV9bl4o3
	XSbykJbxaJ8BgE98deSsUfYbopUlmgXVRWGSayPvn1et1EcQRQ8iy1OlEpKx4DIw
X-Gm-Gg: AYBFou1iqfeH/iXdUVohYe8vtRe1qfi4HwZXpLr28qNsxJfOB5nU0Q5xMILyA5tIYwm
	eG90Ivy4yir40lzqskjRp483xjs10bUzoc1YSD7qZkJWfZcXYkz5KGOWLkLagLQbBfC30Vt16RF
	3enfT+EGbrfty0/T3BsC5Pxam8M01d3T13KIip4o21DfBno3b8X89XeELlg2spZT+Bta+8Hugl3
	8PTnWmWbLQtZ0c8qFHAMLa+AqjI7S16akFPlT6IjbPHcr+U5CFvHhA82n6UirjnuJAXQyIy3NoH
	tBkbvk5tEWGTBeEI8uf89MNGLPfLgMEjwaBMqEC+3reL0chjGKLUMcdhYJjxmXz2KWxHPBEn/bl
	sOLc0vLYSFLX37AAv2dj9g8V+ZHfUaTkVaVcarQq328Le3dXwd4I4cODPWnNa5QMhP+alFcOBmk
	mA/dIc/PNw2Uk0W4ebEiH+hg3m+XwQ3c79r132TwhjIcY1LpcTUMolCwKxtoH+7I+XPvWteFGvt
	VU27cdfxgymyhTAhUw3M685HFF6FLMDhLPo/cna23zVkCj7sehX3gxqmIWy5zZGinxLnCMTXbnJ
	F7x8ZMIW4SjiyOoGcEE/TPIbRqSkhEkDFQqXhSjSm5qLIaoYjHuXaPCE80xYNsyZec9zhbB/F1Y
	SllhDJ4dc7HbGNRMjC9I/T21Fz2NErRT5rlH9g27YqW2m6FPDEIzqn79s4r3BO0pvhyQ=
X-Received: by 2002:a17:907:9346:b0:c49:b9b6:4b5e with SMTP id a640c23a62f3a-c4ca7b1f727mr373328966b.20.1793429245709;
        Fri, 30 Oct 2026 23:47:25 -0700 (PDT)
Received: from maria-VMware-Virtual-Platform ([182.186.37.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf43b19sm145030266b.87.2026.10.30.23.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 23:47:24 -0700 (PDT)
From: Maria Sheikh <mariasheikh812@gmail.com>
To: outreachy@lists.linux.dev,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Maria Sheikh <mariasheikh812@gmail.com>
Subject: [PATCH] staging: fbtft: fb_tinylcd: align argument with open parenthesis
Date: Sat, 31 Oct 2026 11:46:59 +0500
Message-ID: <20261031064705.9513-1-mariasheikh812@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Align the continuation line of the write_reg() call with the open
parenthesis to fix the checkpatch.pl check "Alignment should match open
parenthesis".

Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index afa8f1c740c5..d58b1247262b 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	fsleep(250);
-- 
2.53.0

