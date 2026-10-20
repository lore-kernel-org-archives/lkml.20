Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455091;
	b=zIyu2VyqL3K3/nUA+E5WSGzTJps6VukssT2NOyOGOqS43WvBzkb1Q4xTxvjxsWP6l/a0
	 OF4wij1tnyMtY3Sxb0/UMKlwt2qf06E7ZJ67N8zxDA5TWXHOB9xAOpNHSnHvZaBN3ca+S
	 4QaQnzvXJ1hDUrOy2tysgJpTv8PmFYugYYI1/L2lPeOP+fFr8PwQjLU6eiAmJOeaSQCju
	 iGkeU3uEwqn48BRdu7mDahdNbp4bQvNWBB7wPKphMEK6CuC/93BVIlDdu6QNhvNn9ZnXK
	 2ntrSyCgfbHjPlrJY/UxaX7eH4JSAfaYC385hZchujvSl2INiELlNoQOlfSnPR/7suA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WOP0UMhz4D5NxyJazkwDnxrLjSi0TkHEImgM+dwA14A=;
	b=rjXw6wVpfegSjVMoWVRF/jNSlulZcxrwq92nY0f519Cg/IiIAbuJP06hWAcg7toOkWHO
	 8nQoKRqy98UqRzHXW9XNxo1hNgYKmx6zSp11OuiFPX5EIrJ2YrMVNjkbxbqo8ZTlDNn/V
	 52hMdxtgUDHHlxrN6/UlZiMAQkR4mtRCjIygktoaL5lPG0xCoxvQG5YjXZPTSYneQNjdr
	 N69yVtaj3mEq1W1aEypCEEtdDRt/UB2lOf+/icuef3A2ij8jPzwTxuNGEu5VMKGvSXFt2
	 SOXUqtPbL7Ffg63tujUZdfDoRlWl1u0c7pZo8lJ6zEUa0sKWuy2xskmvIYpyhVD3mZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qrJxDpWm;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FE2606A332
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02FE2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qrJxDpWm
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15354aa70e8so2883814c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792455090; x=1793059890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOP0UMhz4D5NxyJazkwDnxrLjSi0TkHEImgM+dwA14A=;
        b=qrJxDpWm+UHXEJI1mLr+C1qPGsbUwidMv3dqQI9kRdcP5b+vZCrvbSu1jk0FUCPRl4
         5NalmdlN9HI8rMTBnDbkPFXTNEa27cYAydLV6id69KgWJJt/4tt9EN+KRTGplYO2qymB
         1cIFWyjESjMfdwgfkePRfEb+1EUePUlr3FI6mMPLfl6Vynl5N/FPKoHv5kFguFrwMmFN
         qnokR5pSHc5Nrx9Bw/JaSaW1CqBI2lPLdEjkpgEVZkLJzkT7NsEv3BIGAMiJjolF84Wh
         /Bxhh9BGytM7njxznJL7+JhWEX1n6W8IQwbm9rtgG0bOdbOS+QGOqPqbkA8KKf7qWNRS
         9bCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455090; x=1793059890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WOP0UMhz4D5NxyJazkwDnxrLjSi0TkHEImgM+dwA14A=;
        b=d8RUnqU+kkn54w7VgCbQ6s0lLQJ6c/ZLrN483BqMFtPMDunftqFcfvmU4g2zCW0XNJ
         TsGNSZMoO01/SAAGI6vNf8zmghFpPiLQ3+mEA17QWZVKgOYN0NL/zPiJGR3nVIc9KmpR
         8klC5oPDmFDkI6cMvMHHyaJy51a7B4ZMAQ7G3cn3ED94wdz2do7ptmy/qfkal0EDcc1y
         +m0V1NbYLYMJEPgW8Rx867C35EQdpuK5UiLR8OBSBTYRZTIUx/Bgid1b4oMY8A1jJE8Q
         SQbGaxSrLMbjDFz5nP3+0UTjSoJHzs3g8ON/IPvQoh883ItM6Cr9nJvTciQHgLmGErNs
         qqbw==
X-Gm-Message-State: AFq9FYLg2QBTKDoMEnUSfKwYzT9XijMURD1l26Orh9GYIPG8HEjfli7c
	aMA2qTRKum2J+cCmQZCZa43S4fqjzvW8PI/62nt5Pi5Jjcd/ieQPiR4XLKIqaA==
X-Gm-Gg: AYBFou30rea8ug03HbLBpNR0ocEvUPh4BenufYfRUKD7lLdumVd1pXTFyLTgOAKtIC9
	vI0iM06E1uGpVJxy2KyOUJ3liehuhQSGOPeTNfYFXYAUKwrdXFkRSAEBPX1uGppzW1uLeJdgjaE
	2kK6zIghDncd3pY8A3TGoJMpbeS7Lh3ygGikespvAVaOIdZGQgt1d3/KUIGNWOjcLG5zIxNrZ48
	UCb2c1tdqh2Cnr7gHzDHCKdk+dBzKYU1BvMZeSviQ9W3PHJGf9RmXuaicmo2b5berVGtSb1Audj
	MhvcxLA6UYse1lqtzhJUDmG9N/ekhlZ6jETbbWFVZFnPRIRUVRifml9YYJjNKCObBwVlujFnoYe
	ZdaX2dAmPAJztj80J88eocSkW5An6obS52PSEFnHt6FOb6CJbvClHbhWHUg3mrFeAKGngHrJn+C
	RoE4N7N8NE3geH2Ylh2x8mDlF12MARi2zfd5OO3b+AJSC2KNdWRa3UmwisGgVEsITEfbBY+zFCI
	PnlYo3AqtCYPDzx8UP0DehlCdHOsXNMbAcyUrySbbWpVNXJyJ/pnR0=
X-Received: by 2002:a05:701b:450a:10b0:166:862b:9bcc with SMTP id a92af1059eb24-18512f1b124mr13245448c88.18.1792455089795;
        Mon, 19 Oct 2026 17:11:29 -0700 (PDT)
Received: from pop-os.tail4adac7.ts.net ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37258981c88.0.2026.10.19.17.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:11:29 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Kees Cook <kees@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [RFC PATCH 2/9] seccomp: add __NR_seccomp_* aliases for the fork family
Date: Mon, 19 Oct 2026 17:11:17 -0700
Message-ID: <20261020001124.974063-3-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020001124.974063-1-xiyou.wangcong@gmail.com>
References: <20261020001124.974063-1-xiyou.wangcong@gmail.com>
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

From: Cong Wang <cwang@multikernel.io>

The existing __NR_seccomp_* aliases name only the strict mode syscalls
(read, write, exit, sigreturn). Add aliases for the task creation
family, clone, clone3, fork and vfork, so that seccomp can recognise
those syscalls by number, natively and for compat tasks.

The native aliases get generic defaults from <asm/unistd.h>. A syscall
the arch does not have is named -1, which never matches a valid syscall
number.

The compat aliases have no generic default, because a wrong compat
number cannot be told from a right one. An arch provides them when it
wants compat tasks covered; x86 does so for ia32. x32 needs nothing:
its syscall numbers carry __X32_SYSCALL_BIT and match none of the
native aliases.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 arch/Kconfig                   |  6 ++++++
 arch/x86/include/asm/seccomp.h |  4 ++++
 include/asm-generic/seccomp.h  | 26 ++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index 45c657772362..61040529a7da 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -641,6 +641,12 @@ config HAVE_ARCH_SECCOMP
 	  - __NR_seccomp_write_32
 	  - __NR_seccomp_exit_32
 	  - __NR_seccomp_sigreturn_32
+	  and, optionally, the compat fork family, for features that need to
+	  recognise it (there is no generic default for these):
+	  - __NR_seccomp_clone_32
+	  - __NR_seccomp_clone3_32
+	  - __NR_seccomp_fork_32
+	  - __NR_seccomp_vfork_32
 
 config HAVE_ARCH_SECCOMP_FILTER
 	bool
diff --git a/arch/x86/include/asm/seccomp.h b/arch/x86/include/asm/seccomp.h
index 42bcd42d70d1..767d047050a1 100644
--- a/arch/x86/include/asm/seccomp.h
+++ b/arch/x86/include/asm/seccomp.h
@@ -14,6 +14,10 @@
 #define __NR_seccomp_write_32		__NR_ia32_write
 #define __NR_seccomp_exit_32		__NR_ia32_exit
 #define __NR_seccomp_sigreturn_32	__NR_ia32_sigreturn
+#define __NR_seccomp_clone_32		__NR_ia32_clone
+#define __NR_seccomp_clone3_32		__NR_ia32_clone3
+#define __NR_seccomp_fork_32		__NR_ia32_fork
+#define __NR_seccomp_vfork_32		__NR_ia32_vfork
 #endif
 
 #ifdef CONFIG_X86_64
diff --git a/include/asm-generic/seccomp.h b/include/asm-generic/seccomp.h
index 6b6f42bc58f9..5acdeb62c56c 100644
--- a/include/asm-generic/seccomp.h
+++ b/include/asm-generic/seccomp.h
@@ -26,6 +26,32 @@
 #define __NR_seccomp_sigreturn		__NR_rt_sigreturn
 #endif
 
+/* The fork family; -1 names a syscall the arch does not have. */
+#ifndef __NR_seccomp_clone
+#define __NR_seccomp_clone		__NR_clone
+#endif
+#ifndef __NR_seccomp_clone3
+#ifdef __NR_clone3
+#define __NR_seccomp_clone3		__NR_clone3
+#else
+#define __NR_seccomp_clone3		(-1)
+#endif
+#endif
+#ifndef __NR_seccomp_fork
+#ifdef __NR_fork
+#define __NR_seccomp_fork		__NR_fork
+#else
+#define __NR_seccomp_fork		(-1)
+#endif
+#endif
+#ifndef __NR_seccomp_vfork
+#ifdef __NR_vfork
+#define __NR_seccomp_vfork		__NR_vfork
+#else
+#define __NR_seccomp_vfork		(-1)
+#endif
+#endif
+
 #ifdef CONFIG_COMPAT
 #ifndef get_compat_mode1_syscalls
 static inline const int *get_compat_mode1_syscalls(void)
-- 
2.43.0

