Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269024;
	b=j+26CPiysNorJ698lTHqfunGY+g1J0j/VsmJhSkJBgTWjp2855Xb27Cfq7ZieHHactYK
	 YWtdXC07si6BXSz7Jl3p1rgEOPs5zB9VTyx2tMlhCsBl8jIuLplFZO/DvBJyDccEc+hzx
	 xZzHtFpCgPBY7n9IdllUTgP7zAs1acOwTmYQtN3v6Tt4GXT2jw5pNqlhoADOzQ8u8CRns
	 Dn/wYpEKEFqsU/h34jul3QRz/RHTedQN/m1SYKiVhvtK69A3nUidwoR5jJDyrDT9axK8D
	 /EUR0jgLa6oNgMFSnFImAjnfl4xZrSf1GCvEnndgvwfXUXW+XdEQcVUvyIQH+Imxu5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MqapBShL7E9HAwIcfwxW3ioInnC6a/75KJwMddESkz0=;
	b=jKAx8mJZEJ6T1b+IpV7DFiGDa2wNHOK92FuedHqLr3+oDvGWC1PCLypca7LEzBlRUEey
	 gdXuaziBJSHxDUA0zZqMAhNJy3OHdZtJFzis53lwmYgj2W/MzTJw3k3Dr99N6DEouix1A
	 JXGWlF8E5yChm9V9zGCPMfIJraECwcWiAAxa84xQXTNHh+9DST8Ep1WFAsxqfpGUWZMZY
	 E/MNFDlchkSdsUvjL0ag/Bcv/7anrgaNb/qjhhBXA82gbE+VwBExXeN/itNlx1ICyHxW4
	 klC8E3hqj8wqYTY7BdBGwoQlqeHJIe2IkOFWBfWFsJZjHabdM8TL8nW+dFnO4O5Xk2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VIyyEQr3;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E857E606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E857E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VIyyEQr3
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6d68de53053so996995eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269023; x=1794873823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqapBShL7E9HAwIcfwxW3ioInnC6a/75KJwMddESkz0=;
        b=VIyyEQr386njSjYzUQ7Q00OWsSdpmWsfy72Y9mA6pZGJtvTbNQLrCYlMGYn30EqU/m
         CPjSDLEjTv4c/z+XCt/H0OWcgbnC9ABGDwWNrc3+mrKiFt5clvk/Qh0SmYe0YhgEY6XM
         BqS/xMn6oIX/0ym0dCPICKBnR+doCzmUQeFbGh/c1B8LlmPdK/YFOr4InSwO740OEJro
         aP8/X+IE2cPjZywMFmr8p9GUJf6WB8Z0LzhhQ3BlZbXDdhLKA7IZU0YHkpBgYYsUNrVi
         bX45fahueSIpAD2aEY4ZmmZEBF5Rb+3QLfZvOZceCbPbssKmXZCqfONQM3fgkk6BkvLe
         96UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269023; x=1794873823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqapBShL7E9HAwIcfwxW3ioInnC6a/75KJwMddESkz0=;
        b=hsZKucLr9PXw4MgJFmZSQnWGrYKQ2UhpcW/vR8Cl+4T4XRkzfR36zKR0LrZo17fopk
         wiFDH37YN+RzZWxpUaT1Xd5PXLAU09CyAwKKH5O69xteY8pzXUZRt+CJkEPKlXXC6PCE
         s/tDZk1bmLtV460YSRLTe81HZjJaw24vxP6jFB36TjoxeFJh1DsCJnPFTm01UMH9K9q5
         XoZSOZ+Li9oSZpL3nsRSxSuKH3yHs/D5cKj89OOENOL5cFK1bPfr5VOsRww5v43TfSSk
         S7aF87lleV99XLlJU6fEvxux+QbshoCN3hLqStkcDZtTGqb/uFJPMQUTNYFIu3yf59ov
         Fn1A==
X-Forwarded-Encrypted: i=1; AL+hErF1amnSkFjOshpbBA+ukhypiqjsLrM91ZuUbNdKrkePzo57tvWHCglcRbvXt3GePRy6farDpCowxaXnXxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xIJOYjpJVcptPjUD3nfMV6gdRzC/u20qQehlSPnC50Tn813Ex
	wPInQmAHoQkribHxm4+ccVaUXi4CkFlkBabpYrXod2cHxQcjSucpNLVl
X-Gm-Gg: AYBFou09hdjjJyE/jwcxokWVvKqVzenVJRyikHctbL1LQVm5qpnYJfBuKMVQ4TMEAXg
	dJQ1g4bZTnO+TQIdD4hFbk6XKiC7WUwa2ai5+ne4XL1ju9wlvZZeZNABB/R7y3MuLZZHFbhSwzY
	XIwjk35ltMNwin8tsJ8uoR+1PZJk0KxAxzDm8fAG9PdBdd9Vj2sSPG5Qky+B+lgWtRpQrPPvEqZ
	BKR5z2sszWZk8ClDhUMJ7jnQbohHw7yn/tMQAhBjqzLERh2eZF177ZqgmVFn5uZqZKwBsqzKNJT
	7YWgEdqCf+P4CY/oub1p8iso55zAWFRLITu/WlY4ZuojinJnVdjGWp0E5TCHwFbpIJ3VvWzHcKP
	HyEPGrvsOuu8DN5b14LDShY19c2J+zb1zbQYaBYHqU9Hzi8aveTpKW7Hw3Pqoue7h6QJJEY55Hf
	dHaI0/QbtvFg8780HNj1VZLdoCrP2xDHo9AGA4ij9B7rjruPz2MWZe21jsS4w4C/hMTgOYqIzu3
	BfdtTgBcOGJYarlAbeJt7P8UxVlYvgdiOdT/fwF27UH/d6ZOLQyLp6OKzT8p7WvVxc9CTp13jEa
	nbJVpL5NE+Df6fdWHGML6i7D3u09Occ2fwVQeL2j7MU=
X-Received: by 2002:a05:6820:60f:b0:6f5:a96d:cbb with SMTP id 006d021491bc7-718a644c319mr420980eaf.45.1794269022914;
        Mon, 09 Nov 2026 16:03:42 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa03dbeasm513036eaf.12.2026.11.09.16.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:03:41 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: yangtiezhu@loongson.cn,
	chenhuacai@kernel.org,
	alexandre.chartre@oracle.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 1/3] objtool/x86: Move the cfi->regs access after the NULL check
Date: Mon,  9 Nov 2026 18:02:53 -0600
Message-Id: <20261110000255.1720945-2-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000255.1720945-1-lzsx618@gmail.com>
References: <20261110000255.1720945-1-lzsx618@gmail.com>
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

init_orc_entry() takes &cfi->regs[CFI_BP] before it checks whether cfi
is NULL, and a NULL cfi is an expected case: the comment right below
says it happens for unreachable nops/traps and for
STACK_FRAME_NON_STANDARD functions.

Forming a member address through a NULL pointer is undefined behaviour,
and since the dereference comes first the compiler is free to assume
cfi != NULL and drop the check that follows.  An x86_64 defconfig build
of v7.4-rc2 with objtool built with -fsanitize=undefined hits it in
every objtool run, on vmlinux.o and on each module, all through
orc_create():

  arch/x86/orc.c:11:18: runtime error: member access within null pointer of type 'struct cfi_state'
    #0 init_orc_entry arch/x86/orc.c:11
    #1 orc_create tools/objtool/orc_gen.c:72
    #2 check tools/objtool/check.c:4939

Take the address only after the NULL check.  Running objtool with and
without this patch on the same defconfig vmlinux.o gives byte-identical
output.

The report was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: 8b946cc38e06 ("objtool: Introduce CFI hash")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 tools/objtool/arch/x86/orc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/arch/x86/orc.c b/tools/objtool/arch/x86/orc.c
index eff078ecc945..b688afcc4ffc 100644
--- a/tools/objtool/arch/x86/orc.c
+++ b/tools/objtool/arch/x86/orc.c
@@ -8,7 +8,7 @@
 
 int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruction *insn)
 {
-	struct cfi_reg *bp = &cfi->regs[CFI_BP];
+	struct cfi_reg *bp;
 
 	memset(orc, 0, sizeof(*orc));
 
@@ -22,6 +22,8 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruct
 		return 0;
 	}
 
+	bp = &cfi->regs[CFI_BP];
+
 	switch (cfi->type) {
 	case UNWIND_HINT_TYPE_UNDEFINED:
 		orc->type = ORC_TYPE_UNDEFINED;
-- 
2.34.1

