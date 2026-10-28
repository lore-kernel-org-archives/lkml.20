Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202263;
	b=gk5afzkZAx2J499BNtjIdgin44sKF69AICYQzsSCKu/l5GBMngTbsbkGaojAXKSS9Foq
	 dg8V21ZCa6Dyp5EJnYyjAdIqhzhymbxOILAt90hScTBYIuyl2/37gV2iVKc4anuTHAGCW
	 rHoKlJ1lnlcKwiVC11YHXYCqLs9Q529FL7vAZY1enoSIV4ZRhR03U4LDsOYF76jgW/kUL
	 UGeV3DkV4PtDc3eemaYoF0Ev2Azg4kBcqieZdyiTM2FMtRPebPHwkwXagznZGTzNt+BKd
	 OBHF3DKp31t46jF13Mn0yDqoYrQLCvFz6vOtq1v1YnRb8j5seCaIzGXjhyhLKL2W8cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=hqyoatBuWzt+rzT6XLIO+YQLmt48/m/aZM3ACi+9940=;
	b=4+uu8kV4OnX5s5rxCW1nhca/1v62RTo7LWOydgfhUKKDH06afHdLdIlKAVNPWPhU1G70
	 ec+OjOdrpNjnRRnYqC52l08SP9wq97T+tkDeTa4AMKm2+Ph5CXMnYN+VDWLKDTmDw+CQz
	 WBqWCcgwC/WIz7uYRxYRRbDJQBZf+LEDnkDTb5qyh8+Fl+L7PCVNMNcwVOksTwXJNqPnT
	 w5EafKua0ex5GlKCKddhV3PUTb0FlnLvQdM6t46Rp5eExPavRP/okmOm0Mr2wrlXlp8xC
	 Ogrdh1AcVM8yiBPyuQlUHDuApIOzP7mh7oQ+g1VYD2A5w8Qy26NaxuO2apJxN3Q46gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vVRQYMZm;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1901460A383C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1901460A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vVRQYMZm
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so10942985e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202261; x=1793807061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqyoatBuWzt+rzT6XLIO+YQLmt48/m/aZM3ACi+9940=;
        b=vVRQYMZmRATfXuBDLw24cUDCHaJq7j+gDMv8Gym+FaX7CLKfgfFnccPLvsd5c+/Tka
         /HLjVRkiJ8uODWT7w65gtCQTsKUEsQiC01/kPuUs8L/YMB913fPNTBqbjmgUPH5lTrlN
         LU+ae7VGzf5rwTZXkeQw13PZUDhNUmZ/KBQxqtWoWh5jLsAz9Nkqim6r0nksE2WuSLuL
         ikrzSl7HyUx13SpLJa09UXCNK5tyPaYhxhU6hlyBqSNCN8j+V0i6NujGOEXmnmDNIQQ7
         Q9jj6iCxMz5X0CAIyh3MjVyp84AK91EmGTy3GAPMrFdreF4iVpAxoZ09RD33DzMZE8LJ
         UD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202261; x=1793807061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqyoatBuWzt+rzT6XLIO+YQLmt48/m/aZM3ACi+9940=;
        b=d2gHA1cL3Ju4cCfCptpv2mQtg2J5vWO8ZoNhJ3QRRPtJpN6pAhXKQxhoKCO0Sd3V1v
         EdWA76aP8RiiXu240rkpKr0AXxVsjREjT5ZKMWLkVcFPYhsT9AnfD7GVhVFtUmfq+tXt
         CYbY+IzrgBIfaJeq7xbVKVjk5nZhkmplJHyzyKRCcIXRnLFrUSSJzawT5gN6YEQ7BdIz
         rFzOcdDHJnorCQ0y/LSlfd6PcT/PWiUGO40+WEvcJG7TiaPPaStOKFGRyxqkRobmJ0HG
         6bHZa0NYL85r/qZPx7ABxOBhkaRDIl6VHq7A9aBDmvcv113DYXjSsAg6SHvLroRj6gja
         Bx7A==
X-Gm-Message-State: AFq9FYLd5s0IO/WUKuPY7axZRCHTmHlxr7HSOjzZH7L7FnvU1+1X5J6v
	cqhhGnV5txONEVOE3iKdY/0Gdg0yc8wwDVNPPDe+RhvqFBK8XbMug6Kk
X-Gm-Gg: AYBFou2uah3KNEw/St1z2H2l38wf5cVxmE6QYRqM5snv/92EEQQjRobD9EyDkRYWeHx
	BGOvJmbzqI2XCa8hpZamk+EQ9rJwUEY09rOCq6ruQ9F5izwYWJgEOYNYUBzW6EUYbRCjPOgCO14
	h8XjHBbHHpQng/RTYEDt3oL5ae02mqvLSNWjUBgC5gJn7+QDEGIKC/1ywcee72fAQ1TAWRUz1wk
	6anCjvo2bcsPQ2LGJSAggj133XYPoVzfnFDE5m/JENm63c4d5GASyUfUPmrLvSwdtIcHK8bLnpz
	WwNd2R0LiRMvGFSDZM53dURXjiu/00df8yJuX43JRTS+lLnlqdgpSTilzPaMeU5G7bNOWjOi01Y
	oEvRQL8t9JRud24lDxfHPp8xivOmETIp1hY0KuYmyrTYhB791IE1ndm8CuYoqjFZJdpFnb7dudr
	JzUGhZpSRN/ZnfSr5nLTqxnQN5yI1M/KT6jAYOcwIuWenTupfcr/dmuHE8t1f+FFqxWg7kgAfAz
	KgJz42ut0Pr3iAFVsFUVyefgdTP5QOKSv5dlQV/CzC6mihsp2HGwKWlOZLkqknO6twjl3NCzeQU
	gNkBgYX+pkwf7QwUtfjMdFN0plFYw8I9z8HLpJJimaCBV68kyPJnmxViwr6nGjTXYw==
X-Received: by 2002:a05:600c:8b6d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4a967f8c344mr59591525e9.31.1793202261496;
        Wed, 28 Oct 2026 08:44:21 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:20 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/4] riscv/shstk: release shadow stack on failed fork
Date: Wed, 28 Oct 2026 12:43:13 -0300
Message-ID: <20261028154315.1272705-3-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Same hole as arm64: copy_thread() maps a CLONE_VM shadow stack,
copy_process() fails later, exit_thread() ran but was never
implemented. Select HAVE_EXIT_THREAD and call shstk_release().

shstk_release() already documented this path; connect it. Clear
inherited tracking on the args->fn path for the same CLONE_VM
reason as arm64.

Fixes: fd44a4a85516 ("riscv/shstk: If needed allocate a new shadow stack on clone")
Cc: stable@vger.kernel.org
Cc: Deepak Gupta <debug@rivosinc.com>
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/process.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6c9d61d83d71..ba1ee563aa54 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -168,6 +168,7 @@ config RISCV
 	select HAVE_FUNCTION_GRAPH_FREGS
 	select HAVE_FUNCTION_TRACER if HAVE_DYNAMIC_FTRACE
 	select HAVE_EBPF_JIT if MMU
+	select HAVE_EXIT_THREAD
 	select HAVE_GENERIC_TIF_BITS
 	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7cc5a6a5c020..5bb93377d67f 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
+#include <linux/sched/task.h>
 #include <linux/sched/task_stack.h>
 #include <linux/tick.h>
 #include <linux/ptrace.h>
@@ -213,6 +214,12 @@ void arch_release_task_struct(struct task_struct *tsk)
 		riscv_v_thread_free(tsk);
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	/* Failed fork after copy_thread(); deactivate_mm() does not run. */
+	shstk_release(tsk);
+}
+
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
 	fstate_save(src, task_pt_regs(src));
@@ -261,6 +268,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
+		/* No user shstk alloc here; drop inherited tracking for CLONE_VM. */
+		set_shstk_base(p, 0, 0);
 	} else {
 		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
 		ssp = shstk_alloc_thread_stack(p, args);
-- 
2.43.0

