Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907114A4F12
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388674; cv=none; b=N9m1WI413LB/lB+xXAyIXe0ki0OLmZiuiMZJ2Tjmw485wTLIxSLSSyogW0wgiz7IsHcr8zTGWlRguCyR9p5fX17t9ZEGmcrCgJXloJoFd+TYo/HK4tv33tz/MYyjMJ0AqqxP5kb+DrI8u+aEerJOJfJXOZ+l93FciQdO3hdWtSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388674; c=relaxed/simple;
	bh=GPoexvEQgnZoj7/ssl2GVBM8j7wUDYEnI9PjtzD95oY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AfHYVLZZW3V0Eg/BzU3W1JdVmgNAf/02tfF+J8XTWhu5EhkXw4kl/ZNqZpW3yNn3ShGBnP/rtzkAChELEsjn7d37S2sY9URuagZVhnqES/89xUWPt72frEzp8WOZWwnKYSWwiAhLdY4IAxgqGS47YdchXCR4mo1yt9vJg3FSHmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=cmmXnUC9; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cmmXnUC9"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1419d3416ceso7907118c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791388672; x=1791993472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RyG/X5i0vkChanPWXCAobrxzoJwwd2fGJPSSEJItfY=;
        b=cmmXnUC9ppwOcmBMSkGzpRTXlE7sLJiVAMcgJHkpaS0tmqksSTkKHSo/6pn9K+QjyA
         vx+2YJ+gozDVTXvUJhNCI7lf3ruc+RufJu/gz68fKN60l3ph7VB995S1canxEsKdYMVC
         3EFIrO2oTUUya2PXirVsL4n9mO3AlA54EE6Lij9AAQpZTssOGvSNi3RSCYshxpmAvQkq
         PqMnfPMbyjTdSOp7JI9rV1AQb38oojjLFKNiL9aW5BitG2SBGlxcE2KpJvXssvsy+7TF
         ixKSHvpN8iAbQXn3gnWniyWh1nPrviwHfVpsd16zabfN1meT178dYQALp+qy4UmMvf4U
         5zJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388672; x=1791993472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0RyG/X5i0vkChanPWXCAobrxzoJwwd2fGJPSSEJItfY=;
        b=nJcFJwJ2yPp5q7lCjtiZYINh/4YWOlfXLtuyTG4vG5n9tV73TRm6jrXzKr3H8O4VRf
         E2nzGnQdHgxn1tDl6CDu+Lg3bzki3NsYQilRkhOcbi4t9bXTuUY6okj77D4UFWbLU287
         vlCzf6Z7SGbNCEn1qytkg18sNXBBDRTadqQK+JnzC3pHWYSJxpEPSRePHVlHYMemXznI
         YK8txVSq7SMiRRk2+tke+TvfsQTGq6971DWp9TydYciEBkQV59RN1ES65SvoBPn80p1a
         ci3hHbQc9Nafcrx97aWTLq2Wi11uWuik9M84ZoUyRMD0VByq6E/rPL080qoKE6Rskhew
         S/2w==
X-Forwarded-Encrypted: i=1; AKwUvBzNx9pIqyvOBCqVvgtHBpe4e6Y92m2wxxYTr2aHvgebvIVYg3q6ykA9oR7vrB1S+dk3XBAGa02PExQNM9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhztmEPPjIhbniZjqWePEh7o747n+uO2sKHaOiqv/mLwiB+t7E
	60RKQ4zXiJLFQBKHcZ40TU4IqtAiWb2VC2/txvVh2kQhLgWuh7mL1BeQ/2pS4tUEqng=
X-Gm-Gg: AYBFou0R5YaMowcwZhzMMYNWSPw2/Nk4ZFxiWNg6SjQCCBmUTZobhDjQYWJzASP+S4u
	HguWiWonGPyD92Q71+3QS7yz2ZMA0x+dmiUUYCIZ10PtrQV9Uep+S60RTyB0ESSF/H8OmmKaziX
	Otq9QA8RkveQGSvB8jM5JECsiZzz4LfC0fOyxzHzeA41FhfhEpGU24DUAaGh3WRYwnF/XFqD6Nx
	94NjyTo73wijRBafRi8Pt60DGGxxv3EC7cF4y2ltPYf8XdlpkY3kuonAtA7jZnc68v7RSe8HUtG
	WCvcq335VTfQKKy9MGo01OtBVKGmOHpbgkghbJtb2rCOTCIrrVkVghgJbn5upI6NP2jL09lb3ro
	hDfiNA8gADz2A25veOUBTKWS1ACEtPu6UNZlAtdYjpwrme3asKEkj2uuS+B6+Zi7ec6lzVxPY/N
	GhBEKVTJ29RldpPXfZM0IGbqx2OVPE1Fvj3eae9Y/W5mQ+cCUHJEdytRpq0jqJHO2ndZCR3DJXh
	FNgNQ+vC89EWUtSkAXY
X-Received: by 2002:a05:7300:e9c8:20b0:34d:3ad2:680e with SMTP id 5a478bee46e88-3515dd51cd5mr3194766eec.14.1791388671211;
        Wed, 07 Oct 2026 08:57:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16168f586f8sm9457788c88.13.2026.10.07.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 08:57:50 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/2] riscv: cfi: Only write envcfg CSR when task is current
Date: Wed,  7 Oct 2026 08:57:41 -0700
Message-ID: <20261007155748.291814-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261007155748.291814-1-samuel.holland@sifive.com>
References: <20261007155748.291814-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_shstk_status() and set_indir_lp_status() take a task argument, which
lets them operate on tasks other than current, but they always write the
envcfg CSR for the current task. Fix this with the envcfg_update_bits()
helper, which only writes the envcfg CSR when operating on current.

Fixes: 61a0200211d31e ("riscv: Implement arch-agnostic shadow stack prctls")
Fixes: 8a9e22d2ca5855 ("riscv: Implement indirect branch tracking prctls")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/usercfi.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 23c4d6d9d8cbc..86141e5bab822 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -15,6 +15,7 @@
 #include <linux/syscalls.h>
 #include <linux/prctl.h>
 #include <asm/csr.h>
+#include <asm/switch_to.h>
 #include <asm/usercfi.h>
 
 unsigned long riscv_nousercfi __read_mostly;
@@ -66,12 +67,7 @@ void set_shstk_status(struct task_struct *task, bool enable)
 
 	task->thread_info.user_cfi_state.ubcfi_en = enable ? 1 : 0;
 
-	if (enable)
-		task->thread.envcfg |= ENVCFG_SSE;
-	else
-		task->thread.envcfg &= ~ENVCFG_SSE;
-
-	csr_write(CSR_ENVCFG, task->thread.envcfg);
+	envcfg_update_bits(task, ENVCFG_SSE, enable ? ENVCFG_SSE : 0);
 }
 
 void set_shstk_lock(struct task_struct *task, bool lock)
@@ -96,12 +92,7 @@ void set_indir_lp_status(struct task_struct *task, bool enable)
 
 	task->thread_info.user_cfi_state.ufcfi_en = enable ? 1 : 0;
 
-	if (enable)
-		task->thread.envcfg |= ENVCFG_LPE;
-	else
-		task->thread.envcfg &= ~ENVCFG_LPE;
-
-	csr_write(CSR_ENVCFG, task->thread.envcfg);
+	envcfg_update_bits(task, ENVCFG_LPE, enable ? ENVCFG_LPE : 0);
 }
 
 void set_indir_lp_lock(struct task_struct *task, bool lock)
-- 
2.52.0

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
branch: up/cfi-fixes
