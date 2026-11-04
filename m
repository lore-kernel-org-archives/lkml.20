Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826544;
	b=5IdNVGIBnHwr2ypfu6umuCtUk4cgrOICvZHflRmYPkWYANlBOfbccXr/lgeMZeLy225/
	 lOMGpJMM+zduidglgdwxuktro9Qtkbnb6STfr1q8uP/gKDco4RvK0UZFhl7wQ9K091+JQ
	 ZUpJldQsTloEikmpXVnbhw5CWBXCMhtclr91fp2OAJ5ORjmvhz+EjvgjSzluA8o/Gbeu8
	 QEKX9oxg1CdYmKT0wJuD6usrd29HbME0FoqB9nD4aJGB9L62m4dpXmvFXPWxye9BpMqDm
	 5xUUcA4zIaCOy6pHe3Q/KGdW194QVbD5+LyPy+iSUgev7pXulz9JDhE3At3qdPY+t0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KJjJiozm3d0rM1mQcNRsH5gFVPVJYU6IQSIk1eq0QT0=;
	b=kC/Tj5qPaP/blmOJqPBSGleYy1SursMER+xR2YBOZP02DMuqmRlNZAB6aILITFZGaLma
	 kP5+mVduKM0anOBhxZIEKd4LYmWhIw2QJCqs7BeD7KqSIrITYtb2G5NGA42W9CI3g6Iyx
	 cHYS6/G1ksbe60gh6oU65QXf3iUNFubgVamXj+6ve6ESJWjjfnKeRvvYQbx1SLAS8d+f9
	 YwYvNpeRti4Zezsm8fkmV3ptWv9LjICMN6mIlaaOk8LSFhU7aqKsAFks2CpDFMKRHBpg/
	 DuyQ4hkON1Zusd8OVhYGq6pRud0v/bUHkrtPmGqcbw8bHufiSFDS1FyAliW8LPRuWOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AyYn8msc;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3168607E902
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3168607E902
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AyYn8msc
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490585eddfcso617625f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826542; x=1794431342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJjJiozm3d0rM1mQcNRsH5gFVPVJYU6IQSIk1eq0QT0=;
        b=AyYn8mscU8vUqS3lRk7C3LFoBrszPG9ICQkVOCkMxJXvaekNRR0xpbc6+vCL1FQJKa
         Cz+4cqtqSgh3cEVlOxS7KLGNTKMlEaZfTflp4mjNKTaufuYIEmE7GilVQThsmTHxsdw8
         mR9aOEDFEm3mHx8fKOxslo1wiESEmEcRbupWQvwldeiSdUIaZwY3jMUz25D9W491wcWg
         igeGPpMojr0XznbN3znlufssneYVn87FqDrH+aWxEjsqoD4rEGUC+5ph3HuH5cDFb55i
         TJ0QQZeRltXKxKCBn/17WGHGB21CigXEXoHSIeJk7OhjzwGP/VJpEFaf8MduY/QcRZgo
         5O8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826542; x=1794431342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJjJiozm3d0rM1mQcNRsH5gFVPVJYU6IQSIk1eq0QT0=;
        b=VOIzl/2h0EoQ9MIuMN/ef37Ml6eDNwD8cq7CxxxcYZG7aAdYLmcg+uYk+dNkG3pQEJ
         MOWDdYo/jMBf0XCE2Xo6ggGdoZ4sA6Xve2vBNGiHwUY+xSDtGkW6e9ZMjRy56hPTC9/U
         /TsQHboJe5vOV2P0YtESdRP7oZwjfDkqiPcMgQwIqc+BKoG7L8tU9ZNERPIIZ7Z1Wqco
         TnRO5dTQu0OQlpMxquaB9aU+Thp+Znr39aX198cVrvEgUyQG64p9iorrqwqojHJ96ASZ
         4PmJMI3UvoDGnWzXJszjSTLrLVZuxaIAbazBfjXGKWEGo7/UP4V32KRJllZeuCMijQHc
         /2+w==
X-Forwarded-Encrypted: i=1; AKwUvBx4rjpu9Hu9l/LirLx8MEUTZIns0evA9PQsdPtKYKNKauGdoqIDBpO47KXUEmWt9vSh52taq4n5+Kmm/oU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XBBaw8t7AFjQbPwjhrODoll0GYJSROj6M4SZ/lrvheEGLLA6I
	+XwJ6i8CjV4ADxlSjXwiQUmutgD4X3Qd+QjtLxO+nwBV4e5Sbsmr6OCT
X-Gm-Gg: AYBFou17z7/+BLzqpVBBNWXLL38bXaYGV3PjHJLckEXTft+QQCFqGamRGV7xezi9do5
	r5f+ox1pYnVstyKIJZwt7xZT78Z5ZK0e1IOiNFiICDd0FWRdFRFrAjcJZefjWlUDf9ZwUu/RhY/
	w7pjImEteiTSQQ7uFcSQotRBKLEHJqq5XhpEdwTq0LAlX3DiXywVcbMYwzKqlL8Ryg5gA4fecQe
	N2w2mWq+T3pBM+SshSWxD79s84k0Rb/9m0Y6cOtS4Cojy9ykRL8WAmTkBYJPfSo+roLir/pdmYI
	cHxDEjrpo4MPIZZIW2nHLpD1fcV1GG3S5vrZazbfdRRESOyUsIA24jSVMiJsyIqRbVBjrISq5VE
	m3Wkr/3BbBCyXh+TyL1tNGOANiy2Jf7sdIxpi0ggrenp3q8awaFQWhCSJxO8MJ+0c8Y9zY23T8h
	Rm0vqlxxXAsCnuk23zMUf+p5xEpiusMlisubGLzW03f5yQhywFKTm7sNxL0gYm89zZiS5uMqqkM
	yy1b73+e6/H8cv3uVQNHpwiPaVfZTJN7Z/xYfbdamAFnDgP38/xu29LW4KfOaLAATC+gSOrL40T
	/Qe2bfhtxBb4tr4I63zzhm2gRi8cp0AghBxZTTganknjXEnOkKRj8g==
X-Received: by 2002:a05:6000:2504:b0:48e:5df9:1ec9 with SMTP id ffacd0b85a97d-48e6e500979mr42439584f8f.24.1793826542329;
        Wed, 04 Nov 2026 13:09:02 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99d67sm5897273f8f.24.2026.11.04.13.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:01 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:51 +0100
Subject: [PATCH v2 05/27] selftests/landlock: Fix the openat() success
 check in fs_bench
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-5-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

fs_bench expects openat() to be denied when Landlock is enabled, but
only treats a returned FD of 0 as success.  Any other valid FD falls
through to the errno check, which then reports a stale errno value.

Check for any non-negative FD instead.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_bench.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_bench.c b/tools/testing/selftests/landlock/fs_bench.c
index d13a88dcd1ed..78d1efcb2d20 100644
--- a/tools/testing/selftests/landlock/fs_bench.c
+++ b/tools/testing/selftests/landlock/fs_bench.c
@@ -189,7 +189,7 @@ int main(int argc, char *argv[])
 		fd = openat(curr, "file.txt", O_CREAT | O_TRUNC | O_WRONLY,
 			    0600);
 		if (use_landlock) {
-			if (fd == 0)
+			if (fd >= 0)
 				errx(1, "openat succeeded, expected EACCES");
 			if (errno != EACCES)
 				err(1, "openat expected EACCES, but got");

-- 
2.56.0

