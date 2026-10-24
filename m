Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808699;
	b=rXk0v0bg32Fu3o51u+WTHpV2mEBBeR4lfpcGAVX7S7V2WeMUmjYLufq9vsbY5yK+aIE/
	 ZzPXeGK2O9sYWFxRzIOI+3rmNb/tJ53cPQVuZstfGVSNO2R5ofs6GSILajuW8/wEP42XH
	 9PACimjskD0KC5724i1M9Vj98oFsHlmkGuFEsgTVsqpUxw8YzeT5v3SBU9BaTbua2y0SJ
	 zruLw3lf+CtbQGKrWdSB/nEChsyRURAGBHQFDOLG2t209xZ0I7w72r50K2dYaTv0M10Q6
	 dxnYxJoCrts23xQsYiicHGDtGd3gZBCFUmO+nSELF63Lvu5nQ62ixZpTcepSQOuZcNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MwaAPfyutmKmJPECsVQASiFKd+n4QdGa9vMFjSb1Ixo=;
	b=ZXDXpbYF/lvqpI7pD5cbBWIDRn6ApszMcxTV3JJfYSX9EhzMrN8VKDIdQDolYKyfVbe2
	 DyPheKCQUsNSQLItdUNFn7dmFgmaBbE4ZjA54CMWgxCdArKh2ZrHoz3my5QIQ++VauP66
	 ltntDOe2ziIL3Z1qxQdYUfEZDNSQXFMXYpZSFfEebk9EsS4rWy5o4/jUKL1YXV0Wl+u6g
	 h12fQQR3ntx5PCa//sF+kt8c0FaPNLHFBYjqn5PVH68WD0qOmqh/oJUnuf8BNVTYRDy1b
	 UqF2TJ+TQ+/FJLNaVNw5hvA6aTTh0xaWYdU5g052xBDqfUfY6hLj+qlucXPkHs7o8KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kggBlAWK;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA59606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA59606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kggBlAWK
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1271235f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792808697; x=1793413497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwaAPfyutmKmJPECsVQASiFKd+n4QdGa9vMFjSb1Ixo=;
        b=kggBlAWKbtM+uaIQgjBxgJaQwaHVuL7c2YVtdu+9S7z22gEBMRxKZt8YeDkEtleuga
         OkgXl7NF6iaT70xmtNumjYKv3RSVHoTazviIweq9sYejkWD81Po5DkwFqDfaa031B8l+
         izV+o7JbM9X39T9ozXJ01Yp5+09XmOsKVBBr3GBhqDd1e0wXg5FcEfKxtGRV54mXLWVN
         tOkZ+ZmX0feHpFJvKp2FD0666UilAYvz6taAWX2eTJ9+moDOymjaZ6bxy82CrWVM7MLL
         AT1mo7WParD6CE4Q8tZl4C+Xw2Ds5qbHk34/OmXFKsoO5ggyMnZfKRuT6ZxWVbXkVNzZ
         TRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808697; x=1793413497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwaAPfyutmKmJPECsVQASiFKd+n4QdGa9vMFjSb1Ixo=;
        b=igMlFt31e2yGeIc81eYuHMZnM9EUFI+9LDpAj0QrgiDInW5wpwPpDnmlwEdzSXbFla
         aSkpAHXyTXU3QABuA4UnxTgdVoDs72vtb8eR9fNhKUbJK0Ni1uqr9leDeLCMu2+K4uXV
         tilGcu4ynF8zTqhfIiTqBfEx0BX6/oW0FQJS1pahYh83uQaFhV+OR/M9TGpR+6TGsKg7
         6PCGlGoi/kCuKW5di7RK8Xy68BDe/Xt/t2E9YDWK+m0gerWM3RPs97aRjqeFexNtGECK
         dkD5Tsnb394KlFV+aK7oyZBVdf3YK1vq+HoDDpjB+HyYcBXe71VQpD91nAtaUr3LQzyr
         oPRw==
X-Forwarded-Encrypted: i=1; AKwUvBxzwEkGDPwilf+6viNbw9p0Lf3NLaudIY2TlnMQ+XLP3oTPH9ooOYrTK+uZcLGupRyTafKJ+Hc0MpBjzEo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP/zLBWNxUR5LAu+5IqtQGDZneGC0IcMJj4gCSjGC+PGI3uiQs
	i+MgEnwxwphSCHgn9TL5MVdZN/K0n/yeVrCbEErfrfvVaOVtGs3opknR
X-Gm-Gg: AYBFou0lXQl8pFgkPG+OJ2L48xcYikVv6mJBrZnVHiQLMnmCSq8EyYYmpPwohNyz71m
	loA8hGii/S7bXI0/CvqYX+D3EjFU6g7cmKS6h1Qp+/iCfc9sw+wAxZq6clvcS0jm0LoQ/P5kw+i
	GkIE7NnIC5/3W1RquuAbQZ5X4FVA5Z0GYRaFhQ6GbBA17PVtEMBphAJIlGgumgAydG/Gm/mcKus
	g3+wshOIBf9Qeg2kwrq1FuSYiQbivg0XVuQn5YwIUdsSqlU6K1d6ycT78+TacihS7klSdv1I1rn
	IL5fCDmjhdWjjh41ajsp4+EEfWxZMM8zF/8R9k4CpMhQho9feBTtfkKRGzItAe+CTZ20SloB8Pf
	0BkXpeFYaAk1TAB43bLlLPG6mgSQH3cihxO+LElCXrHPLB+lpHraJ2/PR+AUCRI1yJZzUb0tdqW
	0yW2Nluz1NQqCxpQx/7jw1glAdUuBfQjj3FJj9G5pvIljJrb23U4d5ilVXv5L2AvVXISBYQcIQx
	b772YpLwVtU9kWpMiUCrnI6GLLk65dz/c51Ow807jo2eTp6krQ7Rl5xhb+aBN9irkU1vZemyMVf
	icQe
X-Received: by 2002:a05:600c:4ece:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a35acb5854mr8241675e9.28.1792808697511;
        Fri, 23 Oct 2026 19:24:57 -0700 (PDT)
Received: from ASHA ([2001:630:3c1:164:1a66:daff:fe85:4026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm21088415e9.8.2026.10.23.19.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:24:57 -0700 (PDT)
From: Amir Noohi <amirmnoohi@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Igor Velkov <iav@iav.lv>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <cdall@linaro.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Amir Noohi <amirmnoohi@gmail.com>
Subject: [PATCH 2/2] KVM: arm64: timer: Avoid the irq descriptor lock on vCPU load
Date: Sat, 24 Oct 2026 02:24:50 +0000
Message-ID: <20261024022450.629980-3-amirmnoohi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024022450.629980-1-amirmnoohi@gmail.com>
References: <20261024022450.629980-1-amirmnoohi@gmail.com>
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

When the host interrupt controller has an active state, every vCPU load
sets the active state of the host timer interrupts with
irq_set_irqchip_state(): once for the virtual timer and, on VHE, once
more for the physical timer. On GICv5 hosts the state is also cleared on
every vCPU put, and with a userspace irqchip it is also cleared after a
guest exit when the virtual timer is not pending.

The timer interrupts are per CPU interrupts, so all CPUs share a single
interrupt descriptor and irq_set_irqchip_state() acquires its lock. CPUs
which load vCPUs concurrently therefore serialize on that lock, although
each of them only writes its own redistributor (and, when setting the
active state on GICv3, reads it back while holding the lock) or, on
GICv5, a system register.

This does not require over-subscription. On a 32 CPU Ampere Altra
(Neoverse-N1, GICv3, VHE) with an in-kernel GICv3, a test which makes N
vCPUs exit to userspace in a loop, each vCPU thread pinned to its own
otherwise idle CPU and running from its own guest page, gets 319694
exits/s from a single vCPU, but only 119943 per vCPU with 16 vCPUs and
58722 with 31. The aggregate rate stops growing at 8 vCPUs. At 8 vCPUs,
122800 of the 122847 lock contention events within 5 seconds had
__irq_get_desc_lock() or irq_set_irqchip_state() on the stack.

Use irq_set_percpu_irqchip_state(), which does not acquire the
descriptor lock. All callers of set_timer_irq_phys_active() run with
preemption disabled, and the timer interrupts are requested in
kvm_timer_hyp_init() and never freed afterwards. On hosts where KVM
stacks its own interrupt chip on top of the timer interrupts, its
irq_set_irqchip_state() callback masks or unmasks the parent interrupt
on the calling CPU, which is equally CPU local.

Same test and kernel configuration, exits/s per vCPU, mean of three 5
second runs:

                in-kernel GICv3           userspace irqchip
  vCPUs       before      after          before      after
      1       319694     324584          319670     345088
      8       278579     328736          112423     343984
     16       119943     328887           56120     282905
     31        58722     326056           28114     250586

With an in-kernel GICv3 the per vCPU rate no longer depends on the
number of vCPUs, and at 8 vCPUs no lock contention events have either
function on the stack.

Fixes: b103cc3f10c0 ("KVM: arm/arm64: Avoid timer save/restore in vcpu entry/exit")
Signed-off-by: Amir Noohi <amirmnoohi@gmail.com>
---
 arch/arm64/kvm/arch_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 6ac3321f4c57..a9103625dea3 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -679,7 +679,7 @@ static void timer_restore_state(struct arch_timer_context *ctx)
 static inline void set_timer_irq_phys_active(struct arch_timer_context *ctx, bool active)
 {
 	int r;
-	r = irq_set_irqchip_state(ctx->host_timer_irq, IRQCHIP_STATE_ACTIVE, active);
+	r = irq_set_percpu_irqchip_state(ctx->host_timer_irq, IRQCHIP_STATE_ACTIVE, active);
 	WARN_ON(r);
 }
 
-- 
2.53.0

