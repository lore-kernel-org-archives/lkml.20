Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480305;
	b=zf9ozK8RlDMgWUuOGdLHa2FKZWGUdQmPSsvbj2jSGOLzcz+WD78asDX5cFSX5VeLLsb8
	 um/EP7ga3GxTheIJHFq7Q9k0AT6ck8EH+qIAQ+rZVlNVWOQFwi+N37Nr5jMHgvH3bikEN
	 48B368cvY/fg1MCKzxRwmFT4eC5+e0RFuzuIDd0K6tDqny+/NEERdzL7WF6RWpnMDDoKZ
	 XRp/qNHzS4hnU3d1BWCGcv+dobHjNWPK3iyCKpwEbPEis+kZVfD5jH3pl6kHCF8LxJEn0
	 7P9n18Wgkrv589SCrFtu9CLIBUtNKmRlliSprUh4Jy4YTZ0pxL/ctCYEZOKrhm5yRvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=INpeTcchLLbS0psUlyWopVBCXTqH0HdLEcZJcLgnzp8=;
	b=yLcW3AGEnAdjhmpCusUnZR3cWwiQ1Q5FcR3K7CinKoluBLGIfaGiIwpchFDOO/hkWCPG
	 NZgybMtYsT+nqOELcnsMVvZpYrRcVGfuRu7jXU6xecJm96ADp6PJ7qcjEH5jq9e/Nwuc4
	 uSuFRLmYh/xAGDCiZjXdD81rkiU7HT2QcchomPp/SLNZpJy6D6HChodbbBBgHy12zb7r/
	 B2FTbfOLf4x5SNOLu+63bEsO3u+QYNJ+TaNd/CPyfSaIi4hEz8qeVXspEbTyRYbXlwgo+
	 kmQ3emnFsoqGO+SoxqU2V11U7fbxr5cU+cpt1arxAOMl2zkS0KA7oVWo7ZZ+bgjIMlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VhSAjEJT;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E97606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E97606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VhSAjEJT
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3188779c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480304; x=1795085104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=INpeTcchLLbS0psUlyWopVBCXTqH0HdLEcZJcLgnzp8=;
        b=VhSAjEJTXAaXpQdaf5y/37clY9qum96I3OhdyoKcrPdx+eQDYT1E8PzrMoO3VlQurs
         YHhhVBZNj/IgW66JlKShiypHEubXT+akNNMBoQ+k3KEI/6H8UwZ/nD3lT2xEGA643A4W
         cvW5sUY6nAGixGav8ggIG5AEFVZCoImkhfTz+k8o2a6GEfFtlfJ2uv79ocuQQsqJTSdv
         r4gQbyLtAMihEboCJCe3TbqPES8SyE5dulGcxXI9Gkwm1Xs5MVXnJcNbBpx7TB/026gt
         dAFy19CipMBI7/CGRzjPJ1NiXqXnXOl+kmn4j1w6yyjppCB+kiR/rdbYLXGvIfo0Z7+V
         HJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480304; x=1795085104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=INpeTcchLLbS0psUlyWopVBCXTqH0HdLEcZJcLgnzp8=;
        b=cEGQbDliyKZjgI2fcoNH3q3Xdc6oRjOIFpfl4L+WVwJXpGCI8M2WqZX6QMIi4P+XJu
         hx6MQoccg1qu4qHWRwNOyXkoc7nLPYMZQaKWdhh1pRM2A5OgRMEcqIKBYUfJnKM3MbjK
         XjNO2gU8zwRxiYue7QWXlKOwT06cx/wTeCT6vUtFJE0xdbMC2MClrwp+UG3BqCKBOnt+
         jyZyiE1/NbEvSJFhPUvJ4vKdTlYNCojFQ02xqI2JeidK4Dap5mfh7Q5joOnuR741euKq
         Fgx3S4rB/Kc0fcdLYUrVOrWPbA3CwaxzxIHo9g7MUcgslwGzkp4Gpqcf71NwpzRUQ22O
         vpLA==
X-Forwarded-Encrypted: i=1; AL+hErGhx8WnDFyvuPA4HKISMiz4XgFlPh/Xy18SOVGGvikA2cE4FtDd9cyJ0iY1stTD67x0AoffBF8n09x5W70=@vger.kernel.org
X-Gm-Message-State: APuU4Z97aB81EknnQRJVyjz06OS++WhfqWoCWHetoYDYionnFY6H0mrH
	H1rPSLbuU1+dJ7ZjcjahT08bp/hyrQzYjWHdt4XDT1lJXuvCgKAdL6tmy4vM/F1neaw=
X-Gm-Gg: AYBFou30LCptJ6WpvbAlc1CWpeoUpQBborVrkdVyYuCP4RMYnPyl98bRwAqdNcUJ/wr
	qxWkJ+2bPQFVQiASV3pSCh50cRqxxW1CVIlPpYh6O8lI2JleUp5DvBunXZbTvMESyjkiM9cuskL
	226fI79fCzyv35KvGOjh33HZyCMFQ2qBKmAjsZTGh3wCHnG+jTQO+4s1mVme0uYxGdnXYFwmlD9
	84FVG3ORvFWSoI10A6ZGc9nD1IYgabRWFogvxEAkpgve1a2u2oJ3sWJ9EhUc+94JBdbFSvHgYe8
	JDHxW7ldTbnUlqD3FkvUxLPJNh6Alzoz7nQ5i5ldCsCnVDfszA23dHR+qRPL4nVwCCoaGhkr6cd
	hhRhnfcWfTokOksArDrm4djXabNu3HUwycposJq3rOnvjhf31ZTEknvdlIabCVjvwfE/vWQZep1
	4l48ynrT0y0gtdxQNeOcacKLUIHIj9pTfF/Rz/BN1+3fRC/U2gkrdOel6I9IjX8S66qDqcKC57O
	7iB9xJxd2xcBSQi5AOFtdruEaeD+QdpvoJpF3b7s/P3vuWoWERQL78fXmE+jxJ3QmUWB/ZuNlMN
	ZZcmJ5Vm5j0UTIgu3XQsY9Ol/6L9QqMg8WTgPgaBPv3Yl9oKS634fVGmF74sD8qMcrU=
X-Received: by 2002:a05:701a:ca05:b0:166:5552:780a with SMTP id a92af1059eb24-1b3c02f379amr4916378c88.8.1794480303681;
        Thu, 12 Nov 2026 02:45:03 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.44.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:45:02 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	oleg@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	broonie@kernel.org,
	cuiyunhui@bytedance.com,
	dave@stgolabs.net,
	david.laight.linux@gmail.com,
	jszhang@kernel.org,
	tglx@kernel.org,
	conor.dooley@microchip.com,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v10 8/9] riscv: implement preemptible this_cpu cmpxchg128
Date: Thu, 12 Nov 2026 18:41:48 +0800
Message-Id: <20261112104149.38589-9-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261112104149.38589-1-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
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

Extend the preemptible compare-and-exchange support to 128-bit values on
systems with native AMOCAS.Q support.

AMOCAS.Q implicitly consumes register pairs, so keep both halves of the new
value in fixed registers even when either half is zero. Retain the
local-IRQ-protected fallback when native cmpxchg128 is unavailable.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 66 +++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 4d2fc10cbdab1..1d35fc89eeeb2 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -9,10 +9,12 @@
 #include <linux/thread_info.h>
 
 #include <asm/asm.h>
+#include <asm/cmpxchg.h>
 #include <asm/cpufeature-macros.h>
 #include <asm/current.h>
 #include <asm/gpr-num.h>
 #include <asm/hwcap.h>
+#include <asm/irqflags.h>
 
 #define __my_cpu_offset (((struct thread_info *)current)->pcpu_offset)
 
@@ -518,6 +520,65 @@ __percpu_cmpxchg_case_##sz(void __percpu *pcp, unsigned long old,	\
 
 __PERCPU_8_16_CMPXCHG_CASE(8, .b)
 __PERCPU_8_16_CMPXCHG_CASE(16, .h)
+
+#ifdef system_has_cmpxchg128
+static __always_inline u128
+__percpu_cmpxchg128_case(void __percpu *pcp, u128 old, u128 new)
+{
+	__PCPU_OP_CONTEXT();
+	union __u128_halves old_halves = { .full = old };
+	union __u128_halves new_halves = { .full = new };
+
+	register unsigned long new_lo asm("t1") = new_halves.low;
+	register unsigned long new_hi asm("t2") = new_halves.high;
+	register unsigned long old_lo asm("t3") = old_halves.low;
+	register unsigned long old_hi asm("t4") = old_halves.high;
+
+	asm volatile (__PCPU_GPRS_BEGIN
+		".option push\n"
+		".option arch, +zacas\n"
+		"amocas.q %[old_lo], %[new_lo], 0(%[addr])\n"
+		".option pop\n"
+		__PCPU_GPRS_END
+		: [gprs] "=m" (__ti->pcpu_gprs),
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),
+		  [old_lo] "+&r" (old_lo), [old_hi] "+&r" (old_hi)
+		: [pcpu_offset] "m" (__ti->pcpu_offset),
+		  [pcp] "r" (pcp), [new_lo] "r" (new_lo),
+		  [new_hi] "r" (new_hi)
+		: "memory");
+
+	return ((u128)old_hi << 64) | old_lo;
+}
+
+static __always_inline u128
+__percpu_generic_cmpxchg128(void __percpu *pcp, u128 old, u128 new)
+{
+	unsigned long flags;
+	u128 *ptr;
+	u128 ret;
+
+	flags = arch_local_irq_save();
+	ptr = (u128 *)((__force unsigned long)pcp +
+			 __my_cpu_offset);
+	ret = *ptr;
+	if (ret == old)
+		*ptr = new;
+	arch_local_irq_restore(flags);
+
+	return ret;
+}
+
+static __always_inline u128
+__percpu_cmpxchg128(void __percpu *pcp, u128 old, u128 new)
+{
+	if (system_has_cmpxchg128())
+		return __percpu_cmpxchg128_case(pcp, old, new);
+
+	return __percpu_generic_cmpxchg128(pcp, old, new);
+}
+#endif
+
 #define _pcp_wrap(op, pcp, ...)						\
 ({									\
 	op(&(pcp), __VA_ARGS__);					\
@@ -618,6 +679,11 @@ __PERCPU_8_16_CMPXCHG_CASE(16, .h)
 #define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
 #endif
 
+#ifdef system_has_cmpxchg128
+#define this_cpu_cmpxchg128(pcp, o, n)					\
+	_pcp_wrap_return(__percpu_cmpxchg128, pcp, (u128)(o), (u128)(n))
+#endif
+
 #undef PERCPU_RW_OPS
 #undef __PERCPU_AMO_OP_CASE
 #undef __PERCPU_8_16_OP_CASE
-- 
2.39.5

