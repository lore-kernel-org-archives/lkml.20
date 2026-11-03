Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742197;
	b=xuEYGQTAdFSAlSiv41C+bMieUGb/wksHTEi6cDd3qs3B5bONzy462Xl8Gp6FI3iqz+gJ
	 HJrb7NoTvxv3aorKZhqsjdz0/j0vSuOOxYdEX/d9S+RR96GdfjT52WvqMexwXYHbIj2k8
	 44OHoFaCDNnYhxsWx81Qb68pTK+4cOezM1ZLv2h4akStYMNyRPFSqt6VP8Bh6m5v2rK6v
	 vyYEL+GTSHlt6PDK8cNFdW9DEXO9HZjO0z36mjajjg+cVCWF8SQjzYl+O6Mnvi5Z5xVSA
	 GJ3My4nhHhMjIbQs/2GElYjYRgZdJ45c9+ye5/LtPleIWVM0X3u5CpyeWycfwEEAlFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wiixacI9+OIBzgiEEn6eKWz0f2j1hW6VMWT9Hic5AQo=;
	b=qK85pAx1VYEKFAVr3v5xXoxUtfGW+eaBzMdjuukQvsQ/z1Le8AgNzYqhyV4gXoZerh1a
	 WtoTRAcSdf5WbhpmZHUeZrI0L3ZoOG8/HBU0sUzS0ko7DWtjp+nnGs70u9uLGVtog8lCT
	 ifazMreb/maaXA18+LjD9Hi7pPg3TMJLHUlWQa3IyLILRSUhP06edrGifQExYhBHGSKVx
	 1siNJIUHvmyGGLILykVY0OcxFdm2wUModOEWvOTtMtxq3NBKxGJQ2EqrI9LusWA8CKnr9
	 PxqfJqeJSEZJUhik50iKCX3CnJhiAUTTD2/5UnotQTCYS7gDpzpFa3BrBKX8LWJ8b+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQSKpPpr;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BB6606A33F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40BB6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQSKpPpr
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1719545a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742195; x=1794346995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wiixacI9+OIBzgiEEn6eKWz0f2j1hW6VMWT9Hic5AQo=;
        b=FQSKpPprvEMgZOOhUwG4A8mNt7T8IA3bh9a/h2e9b4PmWfSRZ3cM+us2pjyqaahOG0
         Ywdz4gayJ9EjYXZF4En96C9RLaYXV0MAZvK0B8D0mVT1hoEze6ClqEuHkEIdmubu+/SD
         Q9ZXz0ooOaDkVjj/SFmG87ovZ1PEDGqPIJ24Kd50nT0c3Mfv+lIW9gpa457oJDhGhfGC
         TpgaXbrwBl5RZLpONNJ+JW5QJpWzhKbDB4KPpuvWgJ7wJaO8Qw8TQ/toRmlLVDtvqOqv
         xXTSqDljfdrt/4kO5xYaGGLZwhVh9/HGyAdp5mQ6mTOJOuoHBlysQJHsjuxXW2f+AK2A
         e3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742195; x=1794346995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wiixacI9+OIBzgiEEn6eKWz0f2j1hW6VMWT9Hic5AQo=;
        b=MwbEJDAl2SNEewCEo/Lszm89rYkoxDgXO0oRy2HkXYcnpgmOHbH/eK4LRVtlZvVdYh
         odN+0L6r0M/ZBS6cKZ6/R9cXw6ZujwJ8KJ0cHrOal5vPFsay+bVz12BHd1hDDN/xRHEj
         kbhd3+Ei8IAGsya7CM+qexmjSwA0S2E1Rxj0lQHD1UrhNFsFra3CUIuHb3WF9grYOz73
         fc4ZLE1R8L+51OhpdDXM6uBDyIxjtlYMkd9I8mjEIxgrakyNv6Um4zSkOULsK8Vzbvg8
         YIHOEsUsFZIqisf60pvxjEEX9fTLBYhNOsoe9CiPyZy225AS4JHmbmWGJMR+4ySj+4bc
         khww==
X-Forwarded-Encrypted: i=1; AKwUvBxtgb3LkSuY5J/shGBpbI4VRBHQxYUkYAmcCg/KAcM0oWoXbYdgigbr+vZDHyTc2uIwf0qOlxZwbuOserw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NXCvkBoQtxO7BC2V07Bja9Xjxi9Gpqh3pDsr6kgO26P+vj2PR
	uFIZU5k6VXFaYbRX8Boh8UXoaMW0n+5fapG8F8wZtTLPy/ry013PVsTz
X-Gm-Gg: AYBFou0kc+DJ+BE4eLyIBmvhblBLj3IsYlQhklPjZz/oxtMUH7Nx19PxasJl+7VIRs9
	udq8DVDBnD2XF2nznhj/Sar5DlGozy79LgJ0DNoD58kqw1Uul8m4fl08HHsC/ATdTVSRmflB3Ar
	F8vLvqKJ/bANzJGrDeiP/B+7eYyxSZGqYT8yH2q8WpFH0rOC5tz0AHK2sx4YD5F3s+06pRp2eoD
	gFwhYbWcwpYUl8wB58OyZp+/2D2FYIg72DHfomQiGtMGw8R0/dW2cEhyTrdNN7G0s3NkZtWdBZZ
	noimRmq4c8HNBYHG7jGMQIFfqUICr+1H8DAuEP88NESnshdl0N5GTuXHx4PMttIrURawZJ3WYqV
	JtccCRVfu/9/+3mvk9Nt3OueZnr82b/m7+4+D3M9id0oB6dAFpNnS1FGQ8m4oPOunK8PWjmJej0
	K+HAuxyPtya34q4g3+Q0QSzEJDJ2ZS/yWr/+YUSgjLfSL/5X0DZbIwwvG8qSCxbfCRuUBMWX9cm
	UZS5DJOu8SnDS6rNduLE1AoB9Gem4jHym9CtddRhGHhp702SkbsBjR/ByD6eXdZsjQwJcLwQL9l
	cm+axvsXC8QBmsAZ3MLX8zJy1XT3WPiHvqo7ZgzUOrWPiy0VcXlwndTzz4Jqhtoe+FA8YMk=
X-Received: by 2002:aa7:c418:0:b0:6ae:16f5:5be9 with SMTP id 4fb4d7f45d1cf-6b4d4c78d8fmr7236202a12.7.1793742194559;
        Tue, 03 Nov 2026 13:43:14 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:13 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 02/14] alpha: report syscall errors correctly to audit
Date: Tue,  3 Nov 2026 22:35:08 +0100
Message-ID: <20261103214120.1099893-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
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

Use a3 to distinguish errors from successful return values and negate
error codes for audit. Failed syscalls otherwise appear successful with
a positive errno. Keep raw r0 for kernel-mode frames.

Fixes: a9302e843944 ("alpha: Enable system-call auditing support.")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/ptrace.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 45d1229344b6f848eb930917bf50ba759da99beb..c933c8805eedd91e3845bb4b46588974258398c2 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -21,9 +21,18 @@
 	(current_thread_info()->syscall_meta \
 	|= ALPHA_SYSCALL_META_FORCE_SUCCESS)
 
-static inline unsigned long regs_return_value(struct pt_regs *regs)
+#define is_syscall_success is_syscall_success
+static inline int is_syscall_success(struct pt_regs *regs)
 {
-	return regs->r0;
+	return !regs->r19;
+}
+
+static inline long regs_return_value(struct pt_regs *regs)
+{
+	/* For user-mode registers, a3 is an error flag only at syscall exit. */
+	if (is_syscall_success(regs) || !user_mode(regs))
+		return regs->r0;
+	return -regs->r0;
 }
 
 unsigned long user_stack_pointer(struct pt_regs *regs);
-- 
2.43.0

