Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808698;
	b=qzpEWlxmVwiOdBHL6ka/aEsgF95PSCbNwF+q243MlBjTJnD1K/NR4JuWJQPok/56UwSh
	 PCQQB82K/Dg2cBqKNhEIe56jDUgJW7Jx7Z45wUG7mSJClwJHS2R2XOsPRzLynZHoASrIP
	 qAfCi/yCmG1qCfUd7qnfMnSJIHz0XvPeW7Z5f5b0ulrET6kXMuKMR5sKZwBbLSZ7Vmj+q
	 f9d/vxQgNIX3MWYTU9Krpxacj5amMltWJlKRAnq5HkJUV2u5wd6o2iBcTlL760bmXnQxF
	 suWTm1JdbUrtiroS5mJ/xNX5hvVl7QjBRT2IfbvsVVe6Fm8A+Xt+FQVQANtd/M6+Jmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=An84VwlzMp3GuZLx6HMKZAlMwrBtzJQu2yyoAEx9ZZk=;
	b=PI8IwzXgfvRem2kNJEoRdYDA9DZW3g1CTLA5AHc3W4wVkAqdNHdG7Gcva3XzgQWTdtgM
	 C2uLxXjsQ03VXiaX5E1+Y0aNRYipimROwyV5c6rhK+eK+LlzizrCdCtDYpTFN4ekmT/pB
	 O/G3revuE2mPocFmCaL3GfyIwZyMSlymvPYVewZ2u9RCRKyTgq5sLL2usPwLtlQZCwlFR
	 DMj6mY2slBWi0Sy72SkcDsJHlX7oFG7IfvGvNFa04Z4TH0m0zhpksyIt6MWOLn77tUCPw
	 KrlK9vD0nkz0tXTUW41A622EaxfnwD7bYfB5Y6MQULP4fJbM/iD39F5uNKEaJlxaoZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xv+SqMwV;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2AB606A321
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D2AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xv+SqMwV
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso9280475e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792808697; x=1793413497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=An84VwlzMp3GuZLx6HMKZAlMwrBtzJQu2yyoAEx9ZZk=;
        b=Xv+SqMwVYc9+NVdMEsS1SvMETvulAbGhuDxXzf13ILbhirQSDI98CTRFyPEC01+zmw
         qHv68OBlDO1eEDR0AwmO7uNjnJgERVaDcOVKZc/Q0aT6wXzsvcv9x5xx3SaGw67fxdvg
         dHAg0xfK7hAQP7BLKvfbAjXPoMmczohK2lPfLnHklHMbdamJ9wrrSNV+3xKt6tmKs8dZ
         zduiPNfG0IN5GQj2+YShvgAwUwJsX49zOoLWGxfRHvJW6DIm3ddntFqumyuOARUrSfr9
         7E70k8J+VY32HwSCdaY51vVIjkxDJlnT2TOYTghPQXMmMozDREzcsv5KW5kFnB2qVV7w
         EkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808697; x=1793413497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=An84VwlzMp3GuZLx6HMKZAlMwrBtzJQu2yyoAEx9ZZk=;
        b=dmkkv6ptSrBphcDArRyWi1aDdAI/xfiYjcepNlPn5WP6/UBkAIaCNXS7wjhcTBK6iS
         ccQZ3FrS0m+4I9kJBdH0gGJAogwicx5lhVFljOHlnSHyZf7g1qRra92rt4L8G2IJ/xbr
         BonjgaokG2SEAC3ZyWZl+T/V0C9erZ62I9JZiQJzls5T4WXYO+CVONx7rMSNdW3eBuVL
         1f6H3nRvp5wqHXeLAG5wPDZdX1InRJnKRxgC8mwT3lBE9yrfBLIR2AAwTGYKhMvXao0M
         t6zhypKihGVbZtZBjyJYA+4Gfxj8EqCwRpBCeIhfKOfY4oE+UJJpVarKhaLBffeKPfmL
         uSGA==
X-Forwarded-Encrypted: i=1; AKwUvBwkf6WRCvt1/UMngGg+RB+XDOvASRu3om/E71kkDgO3TVrWjcrM67OTP6TVUncOMYzIWpv4vinCAdetejs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6JmlyaeZTRU3T8Jx8O1ZpNBzc7pF6JL3xsBR9sj1c7Sg0nciA
	Kk3JsVgQwuvTmSi27I/hwvFoWl6+anyh/gEs0Jeso8UVvKeNUrUvqqwV
X-Gm-Gg: AYBFou1VUq5x31l0uLt1aB5mW0Nvi83IQ3bgHtKtf6QlPvcKzTiiv/JSAprVbgPd20C
	+9hHwnyIXZsr4IHRAkHpYgvsfzo9zgtw6svLWBWsV8H8XDcz4Bie3vFu5Yr6HvsMwyaVESyjdTM
	V5AvH7phVwY42gcgYtelmOi+Hl1SL29EGGcwS2xQxQ16Nv26Yo4QLqrat+cftgIUxf9ri6h5thB
	U2IZNKiXe8h3viOc/o3aDKzHAdoXBvOj/p6vhvF77JyKbUsMRglFdVoAiPTUt6uIUj2VFFwvS6R
	gV3/nqldxtlpRWKyK1ahh3UsJDdU0plLf+Yl+9ezW+HNV4ZuNeANNZSle1XVKEZnB4iD4tkw8WR
	qfTd2ayo3KY/54x3BSHSjB8FPCMcpRj27EwRuz6MnNo2r/UR/9aY9mhmdgfN1w62jaueBQNi57x
	7y8s/NBxcAcJ5+kMP/ROF7FcUeGUzkRYwyvBCaoTTlgTSPp3ZhHd2wQ51YK/6fE0PTJGGFavYd9
	yeccVqiFBV26GB0Am6iLzXFaCCADRdXT3sRVT2FQ3By2WoPwjJyRIZ7zY3H3gwPuOpzaOPuXO9Z
	Da+XQxnRsp3T75jKb0KYuDOBTQ==
X-Received: by 2002:a05:600c:6384:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4a35aca72e2mr9122565e9.13.1792808696426;
        Fri, 23 Oct 2026 19:24:56 -0700 (PDT)
Received: from ASHA ([2001:630:3c1:164:1a66:daff:fe85:4026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm21088415e9.8.2026.10.23.19.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:24:54 -0700 (PDT)
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
Subject: [PATCH 1/2] genirq/manage: Provide irq_set_percpu_irqchip_state()
Date: Sat, 24 Oct 2026 02:24:49 +0000
Message-ID: <20261024022450.629980-2-amirmnoohi@gmail.com>
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

irq_set_irqchip_state() acquires the bus lock and the descriptor lock of
the interrupt. A per CPU devid interrupt has a single descriptor for all
CPUs, while its irqchip state is per CPU, e.g. each GICv3 redistributor
holds the active and pending state of the PPIs of its own CPU and GICv5
keeps that state in per CPU system registers. Callers which modify that
state have to be pinned to the CPU anyway, so the descriptor lock only
serializes CPUs which update their own private state.

KVM on arm64 sets the active state of the host timer interrupts on every
vCPU load, i.e. on every KVM_RUN ioctl and every time a vCPU thread is
scheduled in. When many CPUs load vCPUs at the same time, they all spin
on the descriptor lock of the same interrupt, even when every vCPU has
a physical CPU of its own. A global serialization point on the same path
was removed before in commit 64b6d1d7a845 ("genirq: Get rid of global
lock in irq_do_set_affinity()").

Provide irq_set_percpu_irqchip_state(), which sets the irqchip state of
a per CPU devid interrupt on the calling CPU without acquiring the
descriptor lock. The irqchip callback is still invoked with interrupts
disabled. The caller has to have preemption disabled and has to ensure
that the interrupt is neither freed nor reconfigured concurrently, which
is the case for an interrupt it has requested. Interrupt chips which
require a bus lock are rejected, as the bus lock may sleep and cannot be
taken with preemption disabled.

The function is not exported as its only user, KVM on arm64, cannot be
built as a module.

Signed-off-by: Amir Noohi <amirmnoohi@gmail.com>
---
 include/linux/interrupt.h |  2 ++
 kernel/irq/manage.c       | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 3bf969ad8fe0..ab20129615d4 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -507,6 +507,8 @@ extern int irq_get_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 				 bool *state);
 extern int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 				 bool state);
+int irq_set_percpu_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
+				 bool state);
 
 #ifdef CONFIG_IRQ_FORCED_THREADING
 # ifdef CONFIG_PREEMPT_RT
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index bdb47837c66f..e76fe1cec9fb 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2777,6 +2777,42 @@ int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which, bool v
 }
 EXPORT_SYMBOL_GPL(irq_set_irqchip_state);
 
+/**
+ * irq_set_percpu_irqchip_state - Set the irqchip state of a per CPU interrupt
+ * @irq:	Linux interrupt number of a per CPU devid interrupt
+ * @which:	State to be set (one of IRQCHIP_STATE_*)
+ * @val:	Value corresponding to @which
+ *
+ * Variant of irq_set_irqchip_state() which sets the state of the calling
+ * CPU's instance of a per CPU devid interrupt without acquiring the
+ * interrupt descriptor lock. The descriptor and its lock are shared by all
+ * CPUs while the state is not, so acquiring the lock only serializes CPUs
+ * which modify their own state.
+ *
+ * Must be called with preemption disabled on an interrupt which has been
+ * requested, so that the interrupt chip hierarchy cannot change
+ * concurrently. Interrupt chips which require a bus lock are not supported.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int irq_set_percpu_irqchip_state(unsigned int irq, enum irqchip_irq_state which, bool val)
+{
+	struct irq_desc *desc = irq_to_desc(irq);
+	struct irq_chip *chip;
+
+	lockdep_assert_preemption_disabled();
+
+	if (WARN_ON_ONCE(!desc || !irq_settings_is_per_cpu_devid(desc)))
+		return -EINVAL;
+
+	chip = irq_desc_get_chip(desc);
+	if (WARN_ON_ONCE(chip->irq_bus_lock || chip->irq_bus_sync_unlock))
+		return -EINVAL;
+
+	guard(irqsave)();
+	return __irq_set_irqchip_state(desc, which, val);
+}
+
 /**
  * irq_has_action - Check whether an interrupt is requested
  * @irq:	The linux irq number
-- 
2.53.0

