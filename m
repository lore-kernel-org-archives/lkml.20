Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877335;
	b=dL55lZJufWHAwveSIaXazNRCupRNTSVMnZGPI/yV7ZRK2ssu0r7J1w9gdtTIigCmkgsV
	 xzQZzKRc9c0Q6im8GWgP4YoB7nELrhBG65qAsixM2BWPQJWKt/VJNjD2UQoKHFcvTl0Py
	 jSxW4Cq6tyPPMxQlntwP9hYwePW1NMXkzXK6dOAAwYKHGULI2FUroPwckofrsJ/pEoUs5
	 EdiiQ1pVVDNyz2STVkY2BlD4ubgfI1Z8vovXU+jMgeKAJrlRqu/mhm/m3ZAjKZZ0imRFJ
	 GCZdwFMVawNeqqYaq6f0cGCI5YUEgrkWz1woLlwKfLuqzNgrfsMzIemy/cfHzRo/6Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WKjXGirCGBWaGZ6gv0IsyrzVZH7S81bL8FiRWNXjU/Q=;
	b=nIMinvczcjzSz5F4uk2T8/7I42mHnsWg1vTQEuoySCmIv2LrwPm9oybcV+4RoMOHxcPw
	 tIHFSTcCGFBZ70o0JjVHSTRQ6CPtp1Zm9C4jVETon2wt3NlGcweRLaVaQ0UChIQuOh8KD
	 wh+zdnV8zYJFJxzpU/66wYbGlGX+v/tm2ilB79+u+RqowHpQ6D388jAJ1dM6nqVoYClk0
	 LDuvkWHmHUZv9oFSnPsM8iszKkykqwcs8aIs11ebe+ez20PMU58rKzMs7UNgS7HKObz0M
	 356FxhyZ1tF8SiZnzsaxyZ7UjoFGLuaWdYupUxgYm/u+5KeKH6lm/2TfoENG3DccNMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HElaDVQA;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABBD606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DABBD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HElaDVQA
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso19709925e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792877333; x=1793482133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WKjXGirCGBWaGZ6gv0IsyrzVZH7S81bL8FiRWNXjU/Q=;
        b=HElaDVQAIMc1ZsKVqQxudVKxBA/PKKq4A75xkVEdlZT/9HhcHO2VzKFiWBsP7HPB9b
         hyllLjyICB/v8zGLenX8PX2pzGhsHNi4k8dP1mHqpEzqOmLV7ojJdKC05G5Zu23CpEPR
         A5NadaMyAvr61l4onROhXW5H2AvlZVySg0Q4zKdQQLdkUDIWOHuENipxaqYFXQQZU6BS
         yGawIvd20cfm+LyfV46DoQwxVSY5oVkgiZcYPGLGhxzMZSZUNdBJ3N+WBQAnpM6k+vT9
         R6W1ewio8ZIRAWLvXvItuViKcm0Z85oy4HW1Or0mjMsFWvEcI9ZKXf9Tb0Z0XnOf1/qG
         8RvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877333; x=1793482133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WKjXGirCGBWaGZ6gv0IsyrzVZH7S81bL8FiRWNXjU/Q=;
        b=ewCYETVnqqI1o6yGezqpgzygasRiZL3eRozvKZDFkjtF+JQXK8ZZW13SnvjmUUN9er
         dfoIlELmiXoWz8Q978eQ5rHI+1r+WNtK+3e9qJvUItfML9zGzs3+rzPSV72zoDoUdX83
         6iPghoNzuWvpXDDvREuU1uWSug87RC6uvDTuv001M4q2HyWOvOt6PExnZxMHC6VZfuRL
         b9Sl/cRthwgaqVRo1B+WrVzR3qlpFqrwqp4gdDdvHnChRw74z1BJzTDMNoS33Lo/qGzC
         NTXenEjahRCTAj9BqTLK6J9pVJOJ9LI7T6rRs8zVHwHiunSHnLsFbOK5SJA831gBLF3U
         M4cg==
X-Forwarded-Encrypted: i=1; AKwUvBxZUhDEZn9PXLDmOg3GrhlnJ+aulv0FMl0Enh1FpxkvNBdeFr5G+Nd9kEaavayF9YTDHeua0Pvnfna7IFc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIk0ThM+lA4jZOGHRIpDIVyZGFX0LXMJ4lnfPueJJO4rQ4Jmfb+
	7dEF0l2O2gnrfG+gzBvneyuVmWj0JNGN6EPk9lvFMYTXqKYQCnUX6t+3
X-Gm-Gg: AYBFou1gpj9NoilptwTfb2nlhvwL4rxja05Zm29ykHzPl2M5XmvDiJk9+QeM1DKu2t1
	B6+xoER4JkwdtNDBe4eF9QAQVXpnSsQdm6MQpiCxb2WQ1uSZcGLbVhYTg9+Qye6HEG1BoIa+v1j
	yGJ3NTuAWdrEoL1HupsjCqD7wDdXiCsm0YDx3VhYSi+R29YsoStuyzhZVu85tSIF79kdQ58KpC4
	tB86yJ0qHS9cteqP6lkFmaWpWewQojXJZmCkOHTxHLxoKvGiAMvx9Uu8N/bcK0vExKC1hQcohh4
	scQMK2piZxJLY3zQ8gPK92zGJd7t9LNMwRz3mn3ANz5L9v096GRnF0zF2ol6aaraPCZs4FXrFTr
	qLjbuODkqMM6bsNrzv6u0SlknvFolB9UNxTQPbzHM3uT780rcQVwtvhOuYR+xqjI+uZULaFUSht
	J0CTQgSFObCgmLAhcUagwO+4jDfdXIuI25IX0Is7TXoAaSlGj26i0d0xrmeO3yoM3ARs81Tkl4D
	IoBGuuLhA0l6ABdQSaxisU89GZ/nFYKhzJ6WpCljbPyJTskHMaVH12Lv3/HVZv1Z8gYyBWu9M9p
	Wpq/
X-Received: by 2002:a05:600c:1987:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a35ac3a7b1mr41192835e9.2.1792877333059;
        Sat, 24 Oct 2026 14:28:53 -0700 (PDT)
Received: from ASHA ([2001:630:3c1:164:1a66:daff:fe85:4026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm77497285e9.14.2026.10.24.14.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 14:28:52 -0700 (PDT)
From: Amir Noohi <amirmnoohi@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Radu Rendec <radu@rendec.net>,
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] genirq/manage: Provide irq_set_percpu_irqchip_state()
Date: Sat, 24 Oct 2026 21:28:44 +0000
Message-ID: <20261024212844.3405617-1-amirmnoohi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87se1v8f2r.wl-maz@kernel.org>
References: <20261024022450.629980-1-amirmnoohi@gmail.com> <20261024022450.629980-2-amirmnoohi@gmail.com> <87se1v8f2r.wl-maz@kernel.org>
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

Hi Marc,

On Sat, 24 Oct 2026 13:21:00 +0100, Marc Zyngier <maz@kernel.org> wrote:
> It really feels like a leap of faith.
>
> There is nothing that says that it is safe to call this without
> holding the global lock. For all we know, drivers have been relying on
> it for a good decade, and I don't feel confident letting things rip
> just because it (mostly) works with the GIC.
>
> At the very least, something exposed by the irqchip (a per-IRQ flag?)
> should tell you whether it is safe to elide the lock.

Agreed, and v2 does that. There's a new IRQCHIP_PERCPU_STATE_LOCKLESS
flag, and irq_set_percpu_irqchip_state() only skips the descriptor lock
if the chip implementing irq_set_irqchip_state() has it set. Otherwise,
or if there's a bus lock, it just calls irq_set_irqchip_state(), so
drivers that don't opt in see no change.

Only GICv3 sets it, in a separate patch. For SGIs/PPIs/EPPIs its
callback only touches the local redistributor (gic_data_rdist_sgi_base()
and the RWP poll), nothing shared. FWIW, irq-gic.c, irq-gic-v3.c and
irq-gic-v5.c are the only drivers with both per-CPU devid interrupts and
an irq_set_irqchip_state() callback. KVM's own timer chip (GICv5, no HW
deactivation) doesn't set it either, so those keep the lock.

On GICv2 in QEMU it still takes the lock like mainline does (333k vs
321k acquisitions in lock_stat, within 4%), and on GICv3 it doesn't
take it at all. arch_timer, arch_timer_edge_cases, vgic_irq and
vgic_init pass on the Altra. Under QEMU with lockdep, DEBUG_PREEMPT and
DEBUG_ATOMIC_SLEEP, the selftests pass on GICv3 (VHE and nVHE) and
GICv2 (the vGICv3 ones skip there). No splats.

I made it a chip flag since it's about the callback, but I can make it
per-IRQ if you prefer.

Thanks,
Amir
