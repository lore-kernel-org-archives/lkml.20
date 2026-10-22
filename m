Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792712147;
	b=TUBfzcxta4/yXfnuOjcZBcrYvcaISoqiZVWIM/rbLW0vdQiT50y1nOzlqv2Z8OMXTiB8
	 5q9t+oR1KZN0BhA82xZg08onPgbyDIBtymCE0FMHanpUMXH6v8iSGskVYKMk3JRQnVr6r
	 o2cL/tlKiiIdvCMhLBq3RGZRKw/1c/ayqps0STU4F4m4rKr9vKyHMYudCwNQi1ldb0ODX
	 jfcTp5xM2DsBVfu3nrGfyMzKVte1UzJXaPhOis4fYVGIBYhCJ5GiswjhWPm/8IFMNcvNi
	 G45A6PBVyc4uvHDi3m19pt+gnOlXa9auHkn8fddfyQItGZ5w0A/lymwKASEJqRMPBGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792712147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u5djCRBw1nlIHkmvbVmZqRQdrWKvlK7zRXIY63dkgPo=;
	b=V3pL8lPLrhiZCJMzUvxjKDNNHWO97GXgVcPYa7dv14HKce3fiSWqBkRA4eZZUEuWr9Qh
	 dNLbSPpJaNLNPORlc2v3Ona7hM8yCSnvw7QkF7igcdOkCMNAMfKsynYFu/sG4ysJFjCrk
	 UlskI55KFre2nv6XAviWSWtdBSPXasq9dvJHvBQF+7QT5yAAcHuGHpQbaIASli/ez6rlU
	 kQ+tBfjUwCIaIxfAO4QGNZKQcuWvRPWuIWSIwTLQIirdryFzTxuDlmTFeBvk8paD9mH6B
	 3ShvV4TfUKTu60zYNQUUlEGyesq1F8Zrtgn9nOev66T7mFSpwRF6YokSbeGBJn0Wuvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DhjJT2MW;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03162606A75B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03162606A75B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DhjJT2MW
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dc202a60eso140220f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792712145; x=1793316945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u5djCRBw1nlIHkmvbVmZqRQdrWKvlK7zRXIY63dkgPo=;
        b=DhjJT2MWXRVWDCuSo23yF3aAPhjqisXmc2rFlQuveTilm7FZ+xcfIQPBAZnu5SS0Ld
         MSJGn1tYiC/03ZlZA6imeo3pTbJkbKU+91u/eF0z0c2cFSQzA9hCWtCkG+cy+Zg0Ck8H
         1sSRsAPRaQJozs2MpuR3RY794B7o1nEaA2Vly/2IJrMnqslVgPqv8YfHyPlbqCTR3hym
         +/KNRBsO9tBQDoeS8oAomxnhhN9tIeBDOIn0kMWqA/sh3EpsWdOQ83/efJQxaDjpe2NB
         z9XSIKP9pN5EGYAn1qLHwG138p4enTiYneYjeutMsQujOSAkqX4Sre8FtmvS5b0sJj9+
         GQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792712145; x=1793316945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5djCRBw1nlIHkmvbVmZqRQdrWKvlK7zRXIY63dkgPo=;
        b=X3IF7hvsrDNwKp7II5spdga16jDgChclSnvkKFmjppy+HNf2plMITLCkFDvV3qbjFf
         2UDgxIpwCvV7gMjhv7S/l+lCbUDhR9AqGWpiM2RUJ3G+S9uE/e98dQ4CP3if4y1Rjug8
         qjge4Y2vhex5VYfv1dqR//NvfO0UsUOlF4VKhyrFumSPLiPP7Lftu/kIbzEpQI9yktVa
         KvvSJc4lNgSP0eFwj8woaJzzhV1lK4de7wO4sAdEcaBxjEdQzyX5WRXkJe7CLRH7cVXh
         YGg5JyolJLiL4VaLSNUaF74ZVROR/1R0Z+UmfVirZrED1gsP5mK5ZJx6OT9V1hJ1/S3T
         M8nw==
X-Forwarded-Encrypted: i=1; AKwUvByWIxVGVOhK+YtECgw8KXf6GtGoFcsHEsNijvDU0SYN4rUJEYSWJCu3FA9WZEQcV1FYkL5yvuZ7htQ0U5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRBQ1V5Jr49hvOUdEAHVrfYYAzxToGUuQ8j7m+YDLxHL2QqhtH
	1v4WsGFz4AHikc2936c5tFYC/MuSxF3YY09RqZrIv1gEttGWV8LvR8Q=
X-Gm-Gg: AYBFou24j6OCFLLaqOiGAvYT74Je/f9nz96DOK3+occDooR6V4mSRV8p8NeZ1lUvTLz
	XD0ageli7wgIr74OZCGXC0AhLvjdOT+GUJD5+7GoRVb1nXt65hEnC/SSROcyEIC2XEY8HzNV8Tz
	YFOgiIFNHqDv8PZNDg3j78o9Q4sJvE6R/T5DetQq5Lu6Tdoa6gQ4dL5OmFcogpR4cKdJN711Vcz
	m3sWTthIrDXpfu0+j7lpYnu3TO3a1GgLfHUDj3XQRPeKVkxLtEnevjlmSQKbsvTDEQMTpBa3UIe
	vYtghl5kcCbN5h5JP4KoW1wopYrTqqbY7UFITKf0urCGY6/ucRTlPdKpiKHohLsTl6/xCRcQDOB
	b//qQmyP+QYp5dRzi652vWcWgItKqVQLFIWOkYdMx+Enr2S46OMLLFexJv54wU8Tg39MsPC0C/F
	2lhVyjpm7/SfE0JsqkILMQ0gj5cC2UcNdu+9fwfbTgAr2XclQHSWE4de8qKBytyUfOtRNFV5uRI
	xfMhj01eqd10FS99vCrelEc50+9rLyB+DoEXPFJmOzzguu3LjoLtStuFgdJ1UqLPAPJ1kdB3X5Y
	jaxuSvVv5Ya03w8gn70VTlmOQmEn61jOBgvn
X-Received: by 2002:a05:6000:22c3:b0:48e:bf0:35c with SMTP id ffacd0b85a97d-48e3859f5b2mr538813f8f.13.1792712145207;
        Thu, 22 Oct 2026 16:35:45 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:7204:b73f:b5ab:d041])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e38061f41sm1073123f8f.53.2026.10.22.16.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 16:35:44 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: linux-sh@vger.kernel.org,
	Yoshinori Sato <yoshinori.sato@nifty.com>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Florian Fuchs <fuchsfl@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sh: traps: Fix kernel unaligned access fixup in branch delay slots
Date: Fri, 23 Oct 2026 01:34:10 +0200
Message-ID: <20261022233410.2959823-1-fuchsfl@gmail.com>
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

Commit 75d4d29549e5 ("sh: remove CONFIG_SET_FS support") converted the
callers' set_fs(KERNEL_DS) sections, but missed copy_from_user() in
handle_delayslot() which relied on the caller's address limit. This also
broke delay slot instruction fetching through handle_trapped_io().

Since the removal of set_fs(), access_ok() rejects kernel addresses, so
the fetch always fails for kernel code and the kernel dies with:

  delay-slot-insn faulting in handle_unaligned_delayslot: 0000 [#1]

The initial instruction fetch in do_address_error() already uses
copy_from_kernel_nofault() for kernel mode. So choose the matching
instruction-fetch accessor from user_mode(regs) and fetch the
instruction.

Fixes: 75d4d29549e5 ("sh: remove CONFIG_SET_FS support")
Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
The issue was hit while using PPP with VJ header compression, where gcc
placed an unaligned checksum store in slhc_compress() into the delay
slot, which panicked the system e.g. using ssh over this line.

 arch/sh/kernel/traps_32.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/sh/kernel/traps_32.c b/arch/sh/kernel/traps_32.c
index 1271b839a107..a7f20fead5f4 100644
--- a/arch/sh/kernel/traps_32.c
+++ b/arch/sh/kernel/traps_32.c
@@ -287,8 +287,10 @@ static inline int handle_delayslot(struct pt_regs *regs,
 	insn_size_t instruction;
 	void __user *addr = (void __user *)(regs->pc +
 		instruction_size(old_instruction));
+	struct mem_access *insn_ma = user_mode(regs) ?
+		&user_mem_access : &kernel_mem_access;
 
-	if (copy_from_user(&instruction, addr, sizeof(instruction))) {
+	if (insn_ma->from(&instruction, addr, sizeof(instruction))) {
 		/* the instruction-fetch faulted */
 		if (user_mode(regs))
 			return -EFAULT;

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

