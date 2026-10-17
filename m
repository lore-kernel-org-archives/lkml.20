Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430C3390CAE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202177; cv=none; b=ZotyXWh6td1X52keqN8rRbGSgQUWBnMmQxNnFTiU6/3mwH9KPlOGCpn8JO5qAb3/+KsrZ5VFq+/ojujbAspZ4PwzWgcYj6hk/eunHh5ue4mJiRLkNJkiD85NUovcWfmeeY6KFdEsGn5a2BHlDOwxMklR+S0DA0x3tQGHd4AcqcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202177; c=relaxed/simple;
	bh=Wz3AynSRouhjdOCDf3ZwA/+MVGmp61qIW0ierhI97O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImiyfSe5mV6R3tlnanaWGr0Gs6P/aPP0gV3k0JZ69eQPNtWlT23ohdT/yBnZSO30lEYTWJojPNLTIsnJIQf13IO/0VJss/f1NCfBBqORW5zZm25aWa7PbP2Uc/MdOfDnOfBOwC7rAxc65fm4Ny3urpXpiXs4gElIVjDyzGqZxtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il3L/+7I; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il3L/+7I"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ab432273c5so4301937b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792202174; x=1792806974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UaqrgWMwy8tCpgosdqPhUPyluySo43hO1tIzzayAGmQ=;
        b=il3L/+7I7mxcfA2VvtNp+Jf+OvDkvjfA2HjoQm2XTSdD2tkB6Rh+bRZ1cozRDmuDja
         KJpsrehU8XvBPvfyAJJDB81GbXLb18c/k7uRc8Wb87RI2BSWKhcu/GQZf0bEnbbMrrCu
         6iXLBB5cq6oWufex4z5NC0C08oxlxmJ7U1zWuAOWSnb/fzMUv7zgh9qFPMHxDYlPvgOh
         jzIGBAU+03/PLFmcNatsACOf0fcBjKzNPk0XkHhxfRp9sOzHHnG5UBKNE7ITK7dmRl+K
         wR8qsoRP8sRuiqWHZW5qXvlrndWG2jy5NkVHzCqLOPTTj00OSGOFZ4D94wQf2m2C0LYl
         FCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202174; x=1792806974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaqrgWMwy8tCpgosdqPhUPyluySo43hO1tIzzayAGmQ=;
        b=AxYQE4Gj1lVnahjtqfYawSs0Ln+9E2G4RcUJuLNmVlXgd8vD3iLNpQkyx/JaFZHORG
         Ge2bJLP/LSEJQiVV+4FZEwGG3uNt1vWMJf9AB91xG4ueg2Dkxtm+dGQ/5ARuvkdRXqTv
         PC2k0OmkZCcHlM5XyC5DbJ5QsEn7ZMJW6Ji0smOpJ/0dO1TGAU+j5Iks8Z6uFCZ+AXnv
         6xToz8aLojRQPjRilHHIl7CgPQAo+OiSnStmpPcK6RiE/q+d3B1GJvZ5KAnFiuM4ByUp
         sXGL4QXaI9W3WjMse8W2C0ks3zTJaMTTG/2WGM4NXAbyLWzB+aDCQhu9jkLsmitgWEDB
         IJtg==
X-Forwarded-Encrypted: i=1; AKwUvBypBcp57eqj5Cc9vA0WZGhfHlAGO1vWuN95orujT5wHHKRXJh4BWILLeLNpHKupwGzYmsMCx+Ikzcx0cpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIZurW9mKi1z7ezGFYYG1YFkMQJOkLWk2MyjI5cs56ARgh+di1
	cIK1RTKChqZZvZKhF65HISkjDpNWgnH02XfhCUVdGBPYjYno3sjVGSAwT1GdKA==
X-Gm-Gg: AYBFou1SFrRoKQe6Jg34HSZQ9bnlw+r+6ULm7Zu3Szp6hAFw4BpbfzhNdcVUlUsT/W+
	yyIr14TdYL6Bb80NNA3nuXDIUdNl1QPa3jGhG/R02wGz5b6KU9J75GsTkx0P6UwORYjYcLN5xjG
	LJVfQeJMZugjQmsUGC/tBiM1QRfQxzQiGcNIsOfsC+0R92H3lW3YFaS0JlOgFMKqrmsGs3K4UKJ
	u+xxQNNG+fNcSVJTh8oP4o7jAqkMaEBdgSK62IEWH/D99VvVCxCFeBKXKIlBTtYDlHXCxlxT2AI
	P9ak/AUfccV0kqIVH/MeI91+114A8fbhQBTeXiw10bF/1nCt1tj+R8z8RAi6Dw9xN7A2rUEo0mX
	wVImN4UOw1drZ0AlUua8gsZsCVEwRpFKTAqUrZcMGsJevbQHSYxH6AlBMLQFg79abpt0H7JzrnR
	HvGp7Z2XDtJMuaQMIZx10FxMcGH6LIzcyGiYnBLwD9/PgXYkM7wRt8r0FBTLlFUj1DqkDiL4pZo
	8q7HsZkLprpIK5dQ/efK+zeeew72C+0cSHiDqn1szPaJ37iT9fVAWw+qrK3becM5o8zFYE+NUpe
	U8xYZ9vBCLxpLidVG5/0Smi92BF2
X-Received: by 2002:a05:690c:6087:b0:8af:511e:3b11 with SMTP id 00721157ae682-8b0f21eadb4mr6904497b3.48.1792202174247;
        Fri, 16 Oct 2026 18:56:14 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e590f2b0sm16451427b3.32.2026.10.16.18.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:56:12 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 21:55:49 -0400
Subject: [PATCH v2 3/5] alpha: use user_stack_pointer() in KSTK_ESP() and
 dump_elf_thread()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-alpha-perf-regs-v3-v2-3-17654742226a@gmail.com>
References: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
In-Reply-To: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Wz3AynSRouhjdOCDf3ZwA/+MVGmp61qIW0ierhI97O4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIuXV18oaedwXBtcNY/PU7ZgKh3l60cBdk2iay4Iudgv
 OkJ332Wjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLkmnYeR4e+2bUnzM4
 v8Feeqlt+s8DNP0IyQ03RvC3j369Ff4yc3mBkZdtYfW9l3r164yKCWw/lqS/eTvUU7frZzbxKyf
 2CyIr6KEQA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Both open-code the same PCB lookup.

Assisted-by: Claude:claude-opus-5-5
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Acked-by: Ian Rogers <irogers@google.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/processor.h | 3 +--
 arch/alpha/kernel/process.c        | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
index c461a26d47b3..73251cd671e0 100644
--- a/arch/alpha/include/asm/processor.h
+++ b/arch/alpha/include/asm/processor.h
@@ -43,8 +43,7 @@ unsigned long __get_wchan(struct task_struct *p);
 
 #define KSTK_EIP(tsk) (task_pt_regs(tsk)->pc)
 
-#define KSTK_ESP(tsk) \
-  ((tsk) == current ? rdusp() : task_thread_info(tsk)->pcb.usp)
+#define KSTK_ESP(tsk) user_stack_pointer(task_pt_regs(tsk))
 
 #define cpu_relax()	barrier()
 
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 06522451f018..7861c9e767b7 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -318,7 +318,7 @@ dump_elf_thread(elf_greg_t *dest, struct pt_regs *pt, struct thread_info *ti)
 	dest[27] = pt->r27;
 	dest[28] = pt->r28;
 	dest[29] = pt->gp;
-	dest[30] = ti == current_thread_info() ? rdusp() : ti->pcb.usp;
+	dest[30] = user_stack_pointer(pt);
 	dest[31] = pt->pc;
 
 	/* Once upon a time this was the PS value.  Which is stupid

-- 
2.55.0

