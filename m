Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794649717;
	b=MpCVsKDU2BNby9LE4rHw/3WeoE3DFbFvCBlrmI+ewkAiIsQnAHLm7eloxVMt712A20fq
	 RP6pqJHXsq5rAGOktgX7Wm1ZhTGSEx9ztnpa1qrRVHsKhAsGJEPva6oHIDyab6y35KfA9
	 yL19Ga6Hl06/xMbh2yOLC8HB2e5NLWq/YNZAJnzFK/X/gS8C8UXkCONyIZNVEOHIYXdtq
	 fMc4SP4lshh/Yg3vNcG00K1gKVw4a/gfyxYKV3mJLXAJzDxCzwzYGlS7V1yl3PfPF6HEl
	 8fBnsWRy9QyCzKMTZuk2LWUDGwcdpoi/WdE+P1V200hwSI6DzV9agLmz54mRAOzWx5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794649717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tmrz5uMHL2FZGviVrsuQykS5aGwXeAGDlbNFz/QrW7Q=;
	b=J7YsN9ZRveBlj6SaHb9K8YRzX5cGNHcR5gkdcXlvjzm7g7+DGidWRW8tXZZdRShULBkt
	 YM8D43l0qYSx8Z8pIwUODVDfDtbUPXC8ke/iKZ40hTmnUIyabNTQOPJHxjgOqjhoNyuda
	 Y+K5p84yaV5ddXn1yKkGHdmyPflxf1mtUVzbd9GtAJdUc4mr0KnWFF5osYnKj/Wv3cn8t
	 gXH3/mrbMk+YuivMKLamjtE9TzHdhdv9g7n4m4mGMEQQjz46BydlBZtd+GKZhEpqwjW8A
	 6Zd9iHdtnbSHsqsofHytDAXnTsGtyYmQtl5/1WOgVDJuISH125B0jwC6M+11qG2mlww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOh2S9aN;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487B0606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 487B0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOh2S9aN
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso2948777a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794649715; x=1795254515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmrz5uMHL2FZGviVrsuQykS5aGwXeAGDlbNFz/QrW7Q=;
        b=jOh2S9aNP8uqb4ImmhTnKhOACB0jhlUPzbC64dxuIhZNnbS0/dXQ4/sqjBrisNqtgA
         WzLFhO2jrSu1FLOB4kiaFTR0oZ67c5Q54IORP8w5fljmYbbORbeOlzsOYX6mFrBy5IIL
         XksEt4DkmNzzLNwU4f1+29o0b4JTC41ilE2VI+kQ1yggqwVtx4tK2UdHsa5jkzfTj5LX
         Vi1l87wm94jmsnqRpbZrcL3IcXuHxRU7AmJfWoMkZr8YJDevOSbIT6cYeQ689EbVHGOf
         VnG4oi90G1I8JGstDkFCz6tJzyrDNIBSfGesPZmOOaqCg6oW+XZmtnVlkDrAi056rRBZ
         9wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794649715; x=1795254515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmrz5uMHL2FZGviVrsuQykS5aGwXeAGDlbNFz/QrW7Q=;
        b=bTUOa6xv8vwiEYXDvpqDTmRKfJbhIxbAGZCS4dAwcf5arBCbvdD/7YLOmgKXVUIl0K
         iDGr6YW8CyAI0WNH4pWpDAenD/qoIgk9/A6pKAKZs7R2b29PTbzmIGNkf1KTYKIRbi5X
         sYPpGV57pjmtSuTrEW6U53llT97nlRw6uNkFeanaNQVT3GOokQeFrwH2ml5yLSVuov1I
         oHHx+2lQKALIAhoMpGFAzisQIC/5C6Fc1eQiKpaG0IYC5e6vStWkJiogN4eyN0+7YmQD
         qW8/KgqtX34tHlIFY4J4oTpfSLV6D9n/WQBASVhIsGaX73OOoF2I9Bymcqlc8JfEqXaP
         5VdA==
X-Forwarded-Encrypted: i=1; AL+hErHCEFrzJRT7Cw3UnaQShAvgtOT+6L/LwL04PvvhB3yPSI0gsw0Ohw/YsrjR8UXFaagIKkq4O8jVkn0C59s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SIF9HQ8oP7Xjc3FJexwC4rVKMEC0+wC/S6IHgR8gzW5WfMhg9
	TkfSjSuSdHvkXjveUJVbuBl5cu8OmdCJcWFa087dGVbT2zY/hTdO2utC
X-Gm-Gg: AYBFou0lr3d89RsugG7I+PMei/KasUg4dSuYhBo9mK2YF8iMO7co5nrXQrQ9I1TbZwn
	/2KgcipZVwEPlDedl9LLV3eUPnqC5N38uy+oopJDfDB2mqH4DZ0vl/4xYYw9SDOuBFHpqvzl1/2
	s5slXU8OoGyVkMMKPRyoiNidJdVvL+uVKkxpV2QB6D4HPoYyWaOWDBmJgW1Pd7V3EukFrg5pP++
	EFPgq8Br3QmgfxkKGmh3DmNA1N37WCdWzk+6fwdTXe2bz9oiQv8RD9sErYuZUveO0BplMC8ZfPZ
	V6sV2hZvDWVbi9gQM8SefsOtcz5Df0qJRLEq2YEp84Epqey5ELMWg0FCKcfpMRgpAUGrV9rELI1
	CAXA8KEWGclGH3wiTRXnTzss5ZkLwVol2pEkbgHdhY8r4M+cxgi/Jrkmpvn+9z+1OaIforZYd6r
	+3hrWay2DXUUKihUXrcrwf4ln7js6l3eItk00SG5vYImLGplvzKzs2KzWiW6KTgZMaiXHS8TkY9
	DErS3i61gu1suBXROkMScUc8sTSdxoY8YPiDyYigBOk5nF0w/YsByk14w0O+pHz3drVgGXk4shk
	QRoMEdMWMGpU80lt0uyJUMZD6DEATDaFr9/KfazCMQeMjvV+RVhalz0MMy2+X9QsLKbpCg4=
X-Received: by 2002:a05:6402:438f:b0:6b5:5ee4:c9d8 with SMTP id 4fb4d7f45d1cf-6b7c0c8232bmr4185673a12.32.1794649715475;
        Sat, 14 Nov 2026 01:48:35 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c672asm2062135a12.15.2026.11.14.01.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:48:34 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3 0/1] alpha: Add support for HAVE_ARCH_JUMP_LABEL
Date: Sat, 14 Nov 2026 10:48:18 +0100
Message-ID: <20261114094826.1282965-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This revision addresses Matt Turner's review of v2.

Changes since v2:
- Rebase onto the current local alpha-devel branch.
- Place HAVE_ARCH_JUMP_LABEL beside the other HAVE_ARCH selections.
- Warn and return without patching an out-of-range branch target.
- Remove the unused mutex include. Retain JUMP_LABEL_NOP_SIZE: the
  current generic jump_entry_size() requires it on Alpha.
- Clean up the duplicate NOP comment and extra blank line.
- Document the writable kernel and module text requirement.
- Retain Matt's Reviewed-by.

Batching I-cache synchronization and relative jump table entries remain
possible follow-ups.

The previous submission reported UP2000+ SMP tracepoint and stress
checks. Those results do not establish validation of this revision.
This revision cross-builds successfully with W=1 for Alpha SMP, with
CONFIG_JUMP_LABEL=y, CONFIG_STATIC_KEYS_SELFTEST=y and
CONFIG_TEST_STATIC_KEYS=m. On the ES40, the boot selftest passed and
the static-key test modules completed 10 load/unload cycles on each of
three CPUs (30 total), including cross-module keys. This used a combined
kernel with CMA v2. no new kernel warnings or faults appeared during
those tests.

Magnus Lindholm (1):
  alpha: Add support for HAVE_ARCH_JUMP_LABEL

 .../core/jump-labels/arch-support.txt         |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/include/asm/jump_label.h           | 63 +++++++++++++++
 arch/alpha/kernel/Makefile                    |  2 +
 arch/alpha/kernel/jump_label.c                | 79 +++++++++++++++++++
 5 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 arch/alpha/include/asm/jump_label.h
 create mode 100644 arch/alpha/kernel/jump_label.c


base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
-- 
2.43.0

