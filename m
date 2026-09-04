Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5712B47D464
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519151; cv=none; b=OvVj0zlYG41orkko+FFKrw0jcrogFVzTk9YGLQxs6HXZFtStGuq5NHSx++pSSYm66KuhxBprpJC3l7VaQxe6OT0Qxz1Qg+FiA/sc+w2lSW0iRtFybLmIGpbcB28x8EHfWaXpLNz1OvEvyA/kVyYSXXvhs2+1EUbW5GppilraK6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519151; c=relaxed/simple;
	bh=TkP9NVlRtH6a1u5s1YIH64kNgYTDYNLipbIUxbHPiKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R5tlItXODbiMvbz+Q2a7Gx0+o1cwUzIlZJRn+PT+q2B/Odaf94+mUh3F/QRJPW5x9KQB/MI2nk+PWITXgFGUFHjLyZLS1uGFfh0TwLYwNzeMa6PAJJGGgYWNALVKhUzrd4/tPL68NKet+v3UEZhsNU8QCFUCElLDnDupg623WVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jA5JsUKg; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jA5JsUKg"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso822371a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519147; x=1789123947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YvcHUhTtrCQFG9nBcp7L5Dsm79MezpWqR9sHFriF3SE=;
        b=jA5JsUKg+ukvOfkCnR4jb0iSfi9yOOwqEZbHulliNVmbiU9t6JaUgKN8rVPUcYsoEy
         MkpJlm5Uf2VpgMe2OmHcqwR56RXeSOb8npX5v9t2FlRT3jNv7v6CftVgGKhmGnkIly0V
         /Om2kKGPE38IFKY7uFerGHkLQ6fPPHLxWzZ+7GtJn3k9tTRMSRm2IXQc7GlFsyuT/b9x
         ooMWWwg1SV+uErANOMytIRgps+wQS7MuXz6+z8bK7a5vg+zLL765ZHv164Ym33uihgor
         /4dIm47r5aoFS0v5HEf1yfAKkOt6XKOT1VBLOEQB6GnFfF8AOCtQjrnSxrawvsOjaWGn
         j8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519147; x=1789123947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YvcHUhTtrCQFG9nBcp7L5Dsm79MezpWqR9sHFriF3SE=;
        b=VLZSaSVoNlSeRHOtNzWFePby90Y/gkkKbYPB1XcOcmFOmz4EpXOtHEvZ31umeS09bZ
         nMmn+Nb4hCrEQrLVx6AfVhufyAvrlbQIWcvVDZQ/Bz0WQLApQ6VilshTtuBGbKTmJMJ0
         2O++1+xyfL54Vc//e51AmIBaHdvZcBFw7J/mOK+rVmE2gA29tuw7WP/cKbgCL6utzk/D
         Lv5Qqp3NJpr7fvJJKhCdY5gQveHZmmwOLPh2qohA3jbfOrDNSCGHHf4cps8PL5zwYIvv
         SlLueszglsCEYY7YMlvILVu8NDqvTrlRxpeKeY2oF2pgpaUloXibGZzZldmFbNwgFnFN
         w1gw==
X-Gm-Message-State: AFuF++mK7+8vmlkmqD4SmKXDrSwuwF3d7sgAMLnB/RRfqq82hAKGE4Ea
	7S6DH8uh8LfwEeyfKtksL1GHpoVBmMwQ73TO1OW+JvUu0iAnUHQC9mVSa3CCtJnQSJM=
X-Gm-Gg: AYBFou33/H4yjAa/OzrmFeSEduisg5AjG4K7CrkUZWjT5ZG1gr+ZKD4HASKlOxvhaM9
	E5eVEkHtyYWhIuE2B7e2ybdo20D1Hhdiq78+S1anVxeEMLxrxoTX20EjocQ28rnnsZmtLgP68Ah
	mU0p+lHjD6l+qLHYWfq36DmMfrvwh+RAU05KDSn+Jn7hdZtgF1ct4HK8LdM2lwAcpeCsFQHcLYp
	WHH1pK1D7m+oSxjfD0hkmPeAddEAwdaVd9U+JiMqB0WBCthfeSQOHrkBubLLdOwom0LGmYBfHQM
	6CjndmJLCHxgjBr0wm7hLHpQWaNkC0QbjB2yDXTGo+KAk18dmWwqTX7Xpd3u9yc78r+Z92radYO
	8YBV2Znft91JzoqWBxucdrOyeQCpqylgUtvbthPTQ8G5XWKG4q9NE8UC7saOCrrL0fwD9wZM/cd
	Y40hyy81lC2hxaMpK7GYIQ4OIAe20KZhlP7aFTJ2xPHU5diqU3+rmLK6BsD1kx4Pgpjkw0qF2hl
	du0XCQQp2sUrNI=
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr7940585a91.23.1788519147247;
        Fri, 04 Sep 2026 03:52:27 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm5924343eec.13.2026.09.04.03.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:52:25 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH] asm-generic: fix repeated word 'the' in comment
Date: Fri,  4 Sep 2026 16:22:20 +0530
Message-ID: <20260904105221.31836-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'the', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/uapi/asm-generic/fcntl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
index 883cfd7de2ef..f901ad3e6a7e 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -153,7 +153,7 @@
  * record  locks, but are "owned" by the open file description, not the
  * process. This means that they are inherited across fork() like BSD (flock)
  * locks, and they are only released automatically when the last reference to
- * the the open file against which they were acquired is put.
+ * the open file against which they were acquired is put.
  */
 #define F_OFD_GETLK	36
 #define F_OFD_SETLK	37
-- 
2.48.1

