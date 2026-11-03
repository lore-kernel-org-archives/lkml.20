Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742198;
	b=E9WJW/Ruj70K/3kwMcinZmhR7tsEFZATtQUbO9WisaqyBKEnZoKX0/C9Pv308mj5DAlG
	 NQLyA8HuWr73Ix1JDSb/cXgGhFlqnKr0iwelR/e5Yl6pF6T0gTM26Dt+5UC1rfj4J8Fjm
	 OmShmJYqh5ydPne9C5cu1zOciZreB9q7AbqQfAmX4qS62UlAA9AwuP5+24e7XxLppWVqw
	 xt7k8HmkaJfLCo4DcPPUh8f7p2hy9s5qmRJ65xfxQTnC2r1dYVrT3JuVXh/znIowgyCUe
	 uUit6+2YaNyDckkySqOK0chbEDsUY3K3Jcht2Cyw+eN2Qk/nnEMfOjCwUjBrCQn8eCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zZ0YsJUmZEHGM0S6zZ5gkkjGrmZKtts5IgDdt6PpFEA=;
	b=t4BsVVzNA3drC3bMA02beXNc1n3rn4HMo4USbhgbmggbv720lFiEuuEQhT4++CAJ8fnA
	 fBmkkKdLeYoZkvzMLSnOsF74PLSS62eZb0sreDCOAhX9UhpVukTbswf63ThyQ1i2EK5Ra
	 SfTRwF4Co6x5m8YimlyUT4N82ItPtPZdwJimbGvC0BwPKBqeb5cx5biZP/+ihVSbKvxLw
	 OoOjK7jXONDXFuUU94DJTKA8UK1ZGxq2/kbNFexPX0zM/qiaEN4g7LU/gHn0Udq6wuUTt
	 Wi/d8sonRyxRyu/oROd0waHd7NeMHi/HzkHSAXmdC2/+LK3u3gmrIkk37zZ2YxUh92A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqkoi8UQ;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84662606D80D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84662606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqkoi8UQ
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso4479a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742196; x=1794346996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZ0YsJUmZEHGM0S6zZ5gkkjGrmZKtts5IgDdt6PpFEA=;
        b=mqkoi8UQ7vuFDVkGVeR+z97GiNNw3yS8b+CpKmSgk9X+Tr2tvRYuEJ73LcIe8m58sX
         N0nxelw7qX9rLXny/ZR+pAstsri2A0Mu6Nubz5v7eR8PxTDkz9bppUzjmRKLsTiDx3F7
         FS9NTZDVoXGc3rt7r/tXAaDPR9L+lkYyf5zoOxvK/i3Wr5EMQKcwPoJyDRVDUpg0DZdi
         GL0Sy+uPbxxRFkg/f3hoC+AqNgqR11bOcUvOwhD+H+SwUfkNREcJ4CabszfAMDLeS5+S
         ahDOT4YqbeZGWEj+/N7Gf8tezJyll2wNvKhaGBGDeA4Huq2VG/vdIYz8F6m3SA3q7fDn
         yIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742196; x=1794346996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZ0YsJUmZEHGM0S6zZ5gkkjGrmZKtts5IgDdt6PpFEA=;
        b=qpfrTmxZPwvC5Ls7D4Vdd6fbSwmcMJkM98SVhS6UiUwYLPEfxme19dPvB0VGNQlvAH
         QvR7O59DocR78h5TZCBXXQH973LJEabKBTSFaAjwOTPk/ZqB4fWWGQTw8f8LdHfkH0QI
         FUBql2PRDTMrKlcjtXGNOn8M/qJCQ9SMbRbrFwXZ3Yyuhh85nX6OOXKAMXMkCJQbzsa3
         wqYWxef8kvuTDGykgvij83I30+hx8VXXnAY56y4K+fRSQ/UsTThm3N50Oy6QGFM2cyuT
         IeLf0zaNvsxDVGML4tAHvkEsxN2PkM9DeC6dZuTMQ6tC3+OTQC9f1vOk0UttFnX5QeGj
         A+gg==
X-Forwarded-Encrypted: i=1; AKwUvBxxAsBgRjjzgElBfKf6ZZ+3VjUQPnm4lHTuuhFTTHLQcLzn4ccwDNthsNKf+5q8+3ExX8v+eFqtHdNCqZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z81VZ+1F9zgTXbOS6JnRgovkQgJhd6hj36Y4UxPAXww9Ylu5mJt
	9vxkuzqUZsVdzP3ZtuDxvvc5fVSdeRdXvJZGI6zu85hcLEsBLUG3hDi2+6jIMDugzQA=
X-Gm-Gg: AYBFou1dNtcZTfEoDZN3VZCPSxcVJHwemJWrO9BLHYOFXIfwgc7yrQbZv9Regyeogfp
	AqHF8+eLRs4d3/N2/IDZqf9aJBB9H2QH4wCqY8V9hYsKZsCg6yC6/FV3etzGo8sK94Na77NqWYN
	HBSfPdJZrBhpz5ThkAFZdyYsJHW7/xmAmNDcemfwhZ4Uv7q/oVsBT33T3sYsoCYmLFwdtqt6JXS
	u96SNfFOk1Q6Yt9ZhmVT5/DazDoL9nzylx7dIfuOy2f2Z/kbvZQnvk8JTCV4Eo/nFRZI4lbA+eE
	YtXjmrzOAxR0ItYjTcE7vsc9Tsfei7ZT+D8QmxQ4CDUEwjH5DvVmp0262vRC+tXNjpzKFAFckeb
	GQ/zfWQMFNg2sYZNsznY0Z7NE+xesvJmdIz0bHi3gQtUoGqKqG2TdXhfnpUSeMVX3ND/lWA8ell
	35ZAvgt6096+1JpqIys7DDKPpzfC0q6f74379RqbhF+lrzmIObGASkZZxI078yjk3zznCOD00ZA
	6XOR3wJ2iRCNjZWreL1VV4rnNmyO54CwhH7LPN/ULkUqazKqfxBocGatLRJ55PgGFMrXLOw6AEd
	EIeM2StQrPIZZUE2CZtxzw7BLArzF6fWTeYI6rM1wrAp4xcUMxi2QPp5aqwisawEKm2NxJY=
X-Received: by 2002:a05:6402:42cf:b0:6b4:20bc:fa0 with SMTP id 4fb4d7f45d1cf-6b4d428ea8amr11759571a12.13.1793742195931;
        Tue, 03 Nov 2026 13:43:15 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:15 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 03/14] alpha: preserve rolled-back registers for SIGSYS
Date: Tue,  3 Nov 2026 22:35:09 +0100
Message-ID: <20261103214120.1099893-4-linmag7@gmail.com>
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

Record syscall_rollback() in syscall_meta so skipped-syscall handling
preserves r0 and a3. Otherwise seccomp RET_TRAP handlers and kill-action
core dumps lose the original syscall number and fourth argument.

Fixes: 83bd31c2840b ("alpha: enable GENERIC_ENTRY")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/syscall.h     |  4 +++-
 arch/alpha/include/asm/thread_info.h |  1 +
 arch/alpha/kernel/signal.c           | 12 ++++++++++--
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/syscall.h b/arch/alpha/include/asm/syscall.h
index c1394910f584f9ca42367ffc33b1c0ac46cfe112..22315b932f854a71fd3babf6565dda443c6c7a77 100644
--- a/arch/alpha/include/asm/syscall.h
+++ b/arch/alpha/include/asm/syscall.h
@@ -105,14 +105,16 @@ static inline void syscall_set_return_value(struct task_struct *task,
 	}
 }
 
-/* Restore the original syscall nr after seccomp/ptrace modified regs->r1. */
+/* Preserve the original syscall registers for a skipped syscall. */
 
 static inline void syscall_rollback(struct task_struct *task,
 					struct pt_regs *regs)
 {
 	unsigned long nr = task_thread_info(task)->syscall_saved_nr;
 
+	regs->r0 = nr;
 	regs->r1 = nr;
+	task_thread_info(task)->syscall_meta |= ALPHA_SYSCALL_META_ROLLBACK;
 }
 
 static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index d781ac79106dd1178b9cb0e094333139db531bed..49bc08f3b5a98fbcb1d4ac919001bf70c3db614b 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -57,6 +57,7 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 
 #define ALPHA_SYSCALL_META_SKIP			0x2
 #define ALPHA_SYSCALL_META_FORCE_SUCCESS	0x4
+#define ALPHA_SYSCALL_META_ROLLBACK		0x10
 
 /*
  * Thread information flags:
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index 441d8dd61055d5ddc321c2221984eab8aca5d206..3fae37b4593f22f07a375ab7bc0b0712d0130a07 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -587,10 +587,11 @@ alpha_syscall_enter_select(struct pt_regs *regs, long syscall)
 	 * entry work did not already change the return state.
 	 */
 	if (unlikely(!permit || (unsigned long)nr >= NR_syscalls)) {
-		if (regs->r0 == saved_r0 && regs->r19 == saved_r19)
+		if (!(ti->syscall_meta & ALPHA_SYSCALL_META_ROLLBACK) &&
+		    regs->r0 == saved_r0 && regs->r19 == saved_r19)
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
 
-		ti->syscall_meta = ALPHA_SYSCALL_META_SKIP;
+		ti->syscall_meta |= ALPHA_SYSCALL_META_SKIP;
 		return fn;	/* ignored by asm when SKIP is set */
 	}
 
@@ -617,6 +618,13 @@ alpha_finish_syscall_to_user_mode(struct pt_regs *regs, long ret)
 
 	instrumentation_begin();
 
+	if (meta & ALPHA_SYSCALL_META_ROLLBACK) {
+		ti->syscall_saved_nr = 0;
+		instrumentation_end();
+		syscall_exit_to_user_mode(regs);
+		return;
+	}
+
 	if (meta & ALPHA_SYSCALL_META_SKIP) {
 	/*
 	 * Skip-dispatch path: ptrace/seccomp may already have installed
-- 
2.43.0

