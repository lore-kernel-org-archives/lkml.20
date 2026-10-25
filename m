Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792914183;
	b=pGx2dMBG5ShKSAavd/d4+hl8SWI0Fz/SFiHD/5oWU9vd6bq+fvXJGATCr9ICXQnynR87
	 Dox49jN3N5B7VHswGfqcDF+xz3rbWvgXvYbUyNVkpit3XfQH9kYjA/UQfWlcowLwV/jvO
	 8MeANvFcEBYgdYX+45HNKjgeIZ3k4Dy/C+Eu+AnYq86lWUGHzZDOsesq/UqGKERneQxj5
	 guTWnGriYG/xT4RxEHMNL6d9dw6v/vIf0JV2x09beyHrAZ/TxGylfrPYI19vWlopRz8a9
	 ahmVoNhE073KGIz2RIlUe30Pus13jF/fDAFCLF8npUwPPROfsNNEn/oaX/icHOtuMXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792914183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pXIk2WIkNT0windvDKCB/LIGkYLCIcpQCNUp9JyU/UQ=;
	b=AbdEuDIUk1Wy/yctnbQXVijonbnJ0XgOytebXNzOmUkr42nknJn3an+FPTCd0GnBcbT6
	 SdE5zve2+1tJlMqyYd+vTAQp/rTHVufVFa5HZSv7X9Jq0upyZjwxEKDfwX8oMdeCRysPq
	 /ILdhKvYDY77kAC8qvcPTMAhbCB8VMKBQMJVOUK04Hi8YouQrw4og5Wng9hThPhPe1JgO
	 TgztTV4MZ7FIAB6lbuoRO9L2bSzWZHtYfTfLsKh1NIQBrbwnLKZS9In/VUWLPQH6RecsO
	 UKKbyhZAQvIYxLBlZixW50uDMWN8khcd3z8LwX46soagOsZuAP+Eoe7z6E3nm+JUMkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mkq6F7kl;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71DE606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B71DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mkq6F7kl
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so2906323a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792914181; x=1793518981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pXIk2WIkNT0windvDKCB/LIGkYLCIcpQCNUp9JyU/UQ=;
        b=Mkq6F7klgtQfZ2EUk8cTUBVFuIjtnimu4n5peoDhTY+pTQyjfEi/s9/FkgVRm4BTkU
         8FImKRGOwF4N1HmLT3ahOJWvohTcW+zsmh5HqwcWicz5/CCi1pp+raP6tU6ZJxxsX4lH
         t473RMo8ny78KTMRYO/dSGG+nxsY84hkeByJGVTs7E23hOebyYRdKWcegdftJHKenvPj
         dhNaCXGsYWW4U02zfiSBMZW4jEB12chN17+D+LjCdXjWdb4cWmgfOqzDn+l1KU6jPzdc
         7EieBj1yugZ1KNxWggQCE+HbpIkkrGblG2YyjvFxmlrKXFzWyOO5B9bdiWum0SjkfuFc
         SfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792914181; x=1793518981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXIk2WIkNT0windvDKCB/LIGkYLCIcpQCNUp9JyU/UQ=;
        b=1CmjWedord27h283ZFe9q90y1ezug08sW0O6OLJ5sGx/sRxZVD71mEcxyPD9kGCPC8
         uDH05jL/0FiiRZmKqGJdjVpRlBgoR8AwZaislewLhBxxZrixYTAzVXaKmlRdX77A666s
         Pi2PON2Q+6qyNsAPyiFaKiK4/kflQ1l5NWMn/IsnF2NsPm9+odHKu1+v1Y0Ze8/dA6fJ
         b8EqiIVcXQKp+9OqYqs6WCC4r+HnOgz2ssawJsDLNGPBaBzy2t/ebf55ofWK7GguKKcm
         QfmKd9lsNFSDgTDVWV9U1373CElR6KJtoprKFEtyDbXnC3I7xVx3JK8cyus4mSvCIYDV
         +sVg==
X-Forwarded-Encrypted: i=1; AKwUvBzMjjGyp4KqiNfW6ySl3SB3pW4rEOtcUyB75NB8tVaxYgACF7s92KwZfhiTJWJZ8gfJG/f/qNnNQYgi4po=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5AnHLEnqiPz2qb5famKWcaYyo4kiZemKf4Y2k54JSomLPuK6d
	4M2Y9etJBmeb/n8ouK/SjBldxqq9IPB1EK25U1umVD6NcMwj+JDmkuj+TM9Cu9RB
X-Gm-Gg: AYBFou3BgQQy/dy4fRYWZXhACr0GyewSdQd1WhE0GWzWQmMMe6+6nPjBAZBDawAXpU1
	MmHJdOTe9eS7jPdLJ+w3i4q5VJThbQZ2MWLESJJh5ff1eUy7Ak4EMt+PBKVOoJLfwQxMHjSx99z
	qY6gsoPiINtMxKC/a6/jkFgOKw+UjHzzI4pohU1/rd+mxVVClSABPR5NxJzDMprDtbnmS5z7i8a
	UK2lKDo8eEOZH3X7ExlMrOA/rxYXke1LHPn6IkqR3dGu5VJPVZQsfCQmjJ0lCKCkBn6dJyjjHsR
	J6Cf1NDlZ0pTQ/vW/z9NquD6p/u4Qqo/pedviTwVGHnBe1lrhHLmyWl8y5SFmzedJ4hwL//oiua
	eIrD/et6bXeHJdjRmMTMFZciV5EosQjCEKwAmQfdb1hIsX4NVMhPqGIXyYRvHv5wfEJbgFVbeQE
	0J4AdK0U6q2tlMvGn/i4QQ2LiHmS45hOueGw4y5/8Iw3iu8o+d/dwNj02uDzzxtbejKn+GCyxVA
	6jNWuuzrccMquyJpYnleXPWYsUYd6hJCyTD8HNTu3tCXkEamBIcvPl8Ra9Dwy4f3N8q3R3283SC
	c/VkkwETwHFkIG0dMO02rw==
X-Received: by 2002:a05:6402:14c8:b0:6b4:21c1:21a9 with SMTP id 4fb4d7f45d1cf-6b442ff31demr2690071a12.31.1792914180977;
        Sun, 25 Oct 2026 00:43:00 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445990d9bsm2033641a12.30.2026.10.25.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 00:43:00 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH] alpha: fix PR_GET_UNALIGN flag mask
Date: Sun, 25 Oct 2026 08:38:50 +0100
Message-ID: <20261025074237.1050419-1-linmag7@gmail.com>
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

GET_UNALIGN_CTL clears the flags it needs to read, so PR_GET_UNALIGN
always returns zero. Keep the UAC bits when translating them to prctl
flags.

This was uncovered while running the strace test suite on Alpha.

Fixes: 3185bd261882 ("alpha: separate thread-synchronous flags")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
Tested on UP2000+ (SMP). A standalone regression probe verifies flag
round-trips, EFAULT handling and fork isolation. The probe and unchanged
strace prctl-unalign test fail before the fix and pass afterwards.

 arch/alpha/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index d781ac79106d..22c07ce0a77a 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -110,7 +110,7 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 	0; })
 
 #define GET_UNALIGN_CTL(task,value)	({				\
-	__u32 status = task_thread_info(task)->status & ~UAC_BITMASK;	\
+	__u32 status = task_thread_info(task)->status & UAC_BITMASK;	\
 	__u32 res = 0;							\
 	if (status & TS_UAC_NOPRINT)					\
 		res |= PR_UNALIGN_NOPRINT;				\

base-commit: 71cf9644bcb35e686c3e12a703325335a0925946
-- 
2.43.0

