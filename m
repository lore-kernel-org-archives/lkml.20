Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532020;
	b=cQZkzSG0p1L0Wjqp1TQXkbq+y5kw7P1xkvL3MxJkZIYE4o3lIqIQS8cOnDAVLuZgP6n9
	 5B81dGg1omTLFXQG9NZApsucrqMQgSg0/Mjouh5zc6kx1TdlNpleVeB7gpnHRHO4zpw1l
	 kARCaJjcPuI9HdH7FDZgmWg9GD7PVWzF/snU4tZ4dxF2fHWLoelziAbE4LjPTBBgQdixh
	 4MosMUeX8webQx01YjXr7y+dX0gA+9UyIvuBQT6WsXCGadVaAewq6J8tR0rtOOaXrIAod
	 4kZBhJb0qvVdv6hJ6GhZuVuY2O8TU1QpEZeTZ0ps4HXKJpHftEo952cOLdkLjKMpmAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rlhpaFlsrc+933YxlPZnFj8i350qqqxN4FKpGWGwqtc=;
	b=ptOr6asmy0PgfieXOvjpWp4BTMaYZ4QCZGFq0wrqkDhYCjhmOSP6vho7W8IVLw5dK3i1
	 K/SO5fs+i8eiUX00gurtfTLsWwyFlZGQiBexZIKLmPlz97cZT7/7k3iZslFX6E4CnSTRu
	 AjwRGu63AQaKYfjY3lQ9fpLzJQvzgKDU0OaxHKPgV161Lnxq82HVStSPiDrAqTzeZu5mQ
	 iILTumyXbPPtzT+gLiWdwd03aSpu8S9hcT9p5rDLDH8ZSHCdLtCZiFRUyWS3gFsYHlc/I
	 iknRdthnSH73bPU0TD3u0nar1e4jgbOvt/0DcneXpzf78b6I+B+wlWD5icpfO971bmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4Lmp6Af;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A044606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A044606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4Lmp6Af
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ada7d53082so7480551fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532018; x=1795136818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlhpaFlsrc+933YxlPZnFj8i350qqqxN4FKpGWGwqtc=;
        b=d4Lmp6Af13mPCv3upS0m52UdfCvOh8HtqyuGwIJvqwEp64xd8W3ycUcJpL31yNZTdV
         P5FMLsHtCCe4Fo6/nYD98HnOmpOKBY8sLkbRJcP+1yzCEsIOupWljtNoJAg/SBBc/YeS
         d9UGvQGOznOHI1PsBmNU454AbCnlH4OrhV2qgeqAHM5CNMKTm0hYamMwF611e5VxSpxK
         czI+sUWRUHloCQUCrpZLjt1rZH9zI23eo6m9Hx4NcRd1uh3qlqjIoKCXP+pjU7WkCigx
         ZqNVV4iFQxQZKp76FQzVO9b5DZbkGW5dF3JcsYEzB4M62bAvMRjjrcNi75hW1yfcYJn+
         DhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532018; x=1795136818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rlhpaFlsrc+933YxlPZnFj8i350qqqxN4FKpGWGwqtc=;
        b=t2vqvlpp7ztQOiqM8OgJuWL8prlJF0FXHZ+1Vin+eZI8OdodUyuiS7wMIaN/TPa5kn
         t6uSjVd07IxHDQKhRDliFnxWwoI1vlF95c2dy73E7oTp5AI41MhWuw00xHQaxHg0V0pK
         Mw657t3YORzJw7zlsnNjb8Myr0IPYEw0YDwZjVJjRNG9XOmwsD5XSUUNrzjODN7TDaoN
         mvJ9WXhCDvDyzfN659sU9D+v4tsjcfM4pJjx2UzC5rFd+haOyzMZLWKs2U+wpaHKWuEo
         BuUM3ZSnI9zEP4wsxNJlKiVwytZK4depXGjAhG1+DG/eQ48vBs8Q5SOZqo+ClR7BZ5SB
         CF9g==
X-Gm-Message-State: APuU4Z8qrUfDNPrz3D3GST55YlsBH9a8ZBaJe6a8+mcXcXgDGwavCBvf
	oq9ej+Y6y7Tj+t6ZO+bp7ON/FOE+uXuvv/r7khLmE8LM/SMN34YdX6BaqV0avrH3Yzs=
X-Gm-Gg: AYBFou33cobtcoYA/Jkv1rJioUIJcSziQ5vbnAyJWeSlFSexSPT/Zl7/nirH/7/2ZZH
	V3Ilgrp6nTlbgGLiIG5sqdXn1cYukh6E9vrlbx/VBs59QrJ5UgbywQK4/0Jx+sFLVqJaYSZrnWN
	DBVIaE3YK3cNb+kymgcjNbdAEgfGYXeh8MN4Iz+k8KycJuO4me/5H4BEiwkPmUwtzp/vvFIp5dU
	3jB+aG3CIfGClxA8gmNxiqhQJ7VQLiJvukXtEO5t6lKUyjwC8cZ1DXRHZISFKjkWA6izJL7vq+Y
	F/Jn8yYXo6pdwKnZ4tvVzBsY5znDgO9b/jqAs+/8vsBQbi5vI90FktnKSpfrK8dVEHs1hP14pqj
	Iy9J/o2fLwGMo7w6hUx27+GtNtQqtDoeRweqVm4cWELKOssiOi4elsNXynTqQfEpuNzZDPyQn+/
	Zwq2GdWqEoos1pL0edovu1rFA70c4wAzjMUgAIry9EBAK9c39nmgXhU3r5+SZ6LeuXWQDd1UXtD
	uCi2SRIlPIV3GpVs0klo/8XpKDRg+RI6CpzXW1JRayw8zpMVzxy7vdvViEpTMCw3VKk15pCOPbl
	hscTwpPGvZJ4UMLW7LfsD1ZPCQKBZjRwiyl804KukP73TDZx3uLRaxAHLR1IZAmsjPwb/bRW/FE
	rqLLfZUi41g==
X-Received: by 2002:a05:651c:31da:b0:3aa:e5df:f852 with SMTP id 38308e7fff4ca-3ae2b5252efmr3330001fa.14.1794532018351;
        Thu, 12 Nov 2026 17:06:58 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:06:56 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/10] microblaze: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:08 +0400
Message-ID: <20261113010631.139191-4-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/microblaze/include/asm/entry.h       | 2 +-
 arch/microblaze/kernel/microblaze_ksyms.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/microblaze/include/asm/entry.h b/arch/microblaze/include/asm/entry.h
index 05acf4d7b..f3e4a6eaa 100644
--- a/arch/microblaze/include/asm/entry.h
+++ b/arch/microblaze/include/asm/entry.h
@@ -41,7 +41,7 @@ DECLARE_PER_CPU(unsigned int, ENTRY_SP); /* Saved SP on kernel entry */
 DECLARE_PER_CPU(unsigned int, R11_SAVE); /* Temp variable for entry */
 DECLARE_PER_CPU(unsigned int, CURRENT_SAVE); /* Saved current pointer */
 
-extern asmlinkage void do_notify_resume(struct pt_regs *regs, int in_syscall);
+asmlinkage void do_notify_resume(struct pt_regs *regs, int in_syscall);
 # endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_MICROBLAZE_ENTRY_H */
diff --git a/arch/microblaze/kernel/microblaze_ksyms.c b/arch/microblaze/kernel/microblaze_ksyms.c
index ad7596d7b..40915d400 100644
--- a/arch/microblaze/kernel/microblaze_ksyms.c
+++ b/arch/microblaze/kernel/microblaze_ksyms.c
@@ -51,6 +51,6 @@ extern void xmb_manager_register(uintptr_t phys_baseaddr, u32 cr_val,
 				 void (*callback)(void *data),
 				 void *priv, void (*reset_callback)(void *data));
 EXPORT_SYMBOL(xmb_manager_register);
-extern asmlinkage void xmb_inject_err(void);
+asmlinkage void xmb_inject_err(void);
 EXPORT_SYMBOL(xmb_inject_err);
 #endif
-- 
2.56.1

