Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808696;
	b=z4EjlxJrEZUS30eLfpMS4KVBsCmOmiF7PWppaAsWKptTM6TDAya5ZjriH/BMgd5llujt
	 bgSDNpenSZ3VyqQK9/YW+YSVz3vR7ahWgasWfkqsLFfEcb1wti6zRqJ6A5aFJi+VhLDEA
	 RoUVyjIlH2gThMguMeQyXKRyqZUOOzmhqIApkfqyvH4Uka5bOn6HSoRov4gcBG17SNgBl
	 ygYuzwzAvRvWgXlKUGErDw3diwSRXUlM7sYOKJ0d/2CCI6UHbstFJ43eixrp/2ED8lLFH
	 pYehs6CLHFZoW7LSMXE1ydmictLIsmUedq5iZN6XZPMXU/WjEWpQ3MfSlSn3VSB62fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IVlkwGJQd53FilqK8CCX7q0KQcQC9PlRvrNFImbfNek=;
	b=agdiw4H+V5D19pG20RqL+7cnUgP4NEPGexPPDgwfTOyo/jA7tU7ukVwdxxJI/2UZEtfM
	 WrLeXWCo2XLUrhNP7GXVEmDFpKVAfAMSy3ozg+lbuuUjXG8z8fN3NLVrMP750ucN/hfte
	 d+86Q9ta9/TOHNgVqXOHO4r61XAzqOaazf7jG0YjSp0/JBGZMzAglBMlFZ/kKuqiYiHUw
	 mymAZ9C69jeO0U+wqY+sCfd59RzA+gXbnMbU9PXZ0pPFfsFn/2u7lZnNuFRnpt1d6QePa
	 gtiNS0VrDeo+qaxuBxfk8j9JYVPxfgczMmdpdWhrYwyzt+c2FUfbBfi5fqWhzgBxhYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l1+Ws8MC;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD84606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD84606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l1+Ws8MC
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso10681185e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792808694; x=1793413494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVlkwGJQd53FilqK8CCX7q0KQcQC9PlRvrNFImbfNek=;
        b=l1+Ws8MC4/jkqoS8+aTeyyiyus1k2nPwNgRI2GlZFbxS3sBNZzlKwO7c7nD/pDJV6S
         p+9oViIqtgbFrbKF76VIdG4yQDkrm1mZmmIElL4N9wN3ADCPLcjkE7aMXk3VaxW88Z6A
         5qBbDBNrgn1IOqZ2Yp74nuG/fZACt7N9z2ATlw2hdWzhQTxcPBg5JytDHAg42j+eBOvW
         phrfkaQnLsobYxv6R3Ojt2gkfwFwVgoRkVrgUXcgENEQGX3fPGzung611v8ZXojeEO4V
         6G/pZ67PSiz+x0+87fCB8ndfb6+ytPgTM7YC4jRYI7wntHRwM0ldQGVr3+enPCaAU3w9
         /R/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808694; x=1793413494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVlkwGJQd53FilqK8CCX7q0KQcQC9PlRvrNFImbfNek=;
        b=gDDyd+kTNEqfbist1Zvjpdl+ff7raRRbvE+Vl6SZhnnhkLbJXUlesfXYDq4d3JQ1Md
         lqRIXhQ7qzaTS2wd5sZ/x8/1WH9uwqRJIkocWi3SflU8EBZrTl1tg2ewht27fQbJ/fRl
         V+Mpk3eLaFZb0Q5NQ1/5j06b8bh7bcXJvG/3T3fYrPpE48EXSlgPTPxV7fotRWwtDyrh
         K8nGlbNtVsrl6nmWhSdDFv5BfmM4FEBuNQEy85jIr35/AlnK516WjyFcDTFrKIduM+ZP
         At4O/PaU9hHiAxlPmDyucstBd+Un+xvjaY77+awLpPJnYJVQiVSLMRgTM6LY8gvx/xXM
         DtxQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4eYkFHNtpuaa2zkyNR7BeJDHOYwwXUKLQ2Bvn/5gSNcTL37OxZtyIvinj9kH0UW+511vD7Pb+NaOqGVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIMxrw/yrmQKxtZMJ2xEYidEotrNtxYUdpwRL+lirvD0fQuagm
	R/10WX/C/qeMBmAi5JkPlFcC3Y6sxYNUTUFOdFPEESvgYbRrCkwA5/hM
X-Gm-Gg: AYBFou27ZoaxOBFCaOlBDC6YHNaJ5E/nTTT8oP7wsASZMvDQng5soq+LUfIKiapgv4W
	O+ywl0UQJkO29uzhKcaDvb1gs5+c92FBvgWLb5C7wHEAZX4Pu433B2fRqf7OTjay/vQWcU5s/LW
	CCZhC5TYlZxKezZ9tzIstTjsdkeMVQXsjVnQaPUYduYT7wtzLr+9HEAgy6DXjAmPsv/5fRihCz9
	M3eRTFpKJgTw/F4kW8FwgRRla6B/L8hBSlh9MHI7C2x2fNqBiNA29P2/AX3o5LAtE9QqkmFLywV
	gpWa7DdB8lUVlXwl65Hr9i3pJGScQeUWAoDXsT/knKxCP+Fh/2gQO9EEtNJQhnNDxE4BKgiRQ8Q
	uQjwv7y9zL3dYxeZT+tuP9sK55iROueRnK0ZBK540bWMSt24G/ROSP2Albiqch1uxWNPNsspMbt
	Vj3z0BJQc+FdlW6sQtvksKjceusqGKQwFAYsi4M3cIyzes+ChDzUjSUR9fxEPltXNLm7EiCGZ5z
	jU18uZksHzumWnV2qLdy8SaKm4I1cmaIhebEDpgm8U1jHSsXNeEoqF1tAciNYZhbHYGXbDDh9Bt
	DgGl
X-Received: by 2002:a05:600c:4746:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4a35ac8bb3fmr10452595e9.7.1792808694219;
        Fri, 23 Oct 2026 19:24:54 -0700 (PDT)
Received: from ASHA ([2001:630:3c1:164:1a66:daff:fe85:4026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm21088415e9.8.2026.10.23.19.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:24:52 -0700 (PDT)
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
Subject: [PATCH 0/2] genirq, KVM: arm64: Avoid the irq descriptor lock on vCPU load
Date: Sat, 24 Oct 2026 02:24:48 +0000
Message-ID: <20261024022450.629980-1-amirmnoohi@gmail.com>
X-Mailer: git-send-email 2.53.0
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

KVM/arm64 vCPUs slow each other down even when every vCPU has a physical
CPU to itself. On a 32 CPU Ampere Altra (GICv3, VHE) running mainline,
with an in-kernel GICv3 and each vCPU thread pinned to its own otherwise
idle CPU, a vCPU which exits to userspace in a loop manages 320k exits/s
on its own, 120k when 16 vCPUs do the same and 59k with 31. The aggregate
rate stops growing at 8 vCPUs. No two vCPUs share a CPU and nothing is
over-subscribed.

The cause is the interrupt descriptor lock of the host timer interrupts.
Every vCPU load sets their active state with irq_set_irqchip_state()
(twice on VHE: virtual and physical timer). The timer interrupts are per
CPU interrupts, so all CPUs share one descriptor and its lock, while the
state being written is per CPU (a redistributor register on GICv3, a
system register on GICv5). The lock serializes nothing but CPUs updating
their own state. At 8 vCPUs, 99.9% of all lock contention events during
the test have __irq_get_desc_lock() or irq_set_irqchip_state() on the
stack.

Patch 1 adds irq_set_percpu_irqchip_state(), which sets the state of the
calling CPU's instance of a per CPU devid interrupt without taking the
descriptor lock. Patch 2 makes the KVM timer use it. With the series the
same test gets 326k exits/s per vCPU at 31 vCPUs (5.6x), the per vCPU
rate no longer depends on the number of vCPUs, the aggregate rate goes
from 1.8M to 10.1M exits/s, and at 8 vCPUs no lock contention event has
either function on the stack.

The series is based on tip/irq/urgent, as it builds on
__irq_set_irqchip_state() from Igor Velkov's patch 717862eac6ef
("genirq/kexec: Do not take the bus lock of an interrupt chip on the
crash path") [1]. It also applies cleanly to v7.3, current mainline and
kvmarm/next on top of that patch.

I'm aware this arrives during the merge window. There is no urgency on
my side; I'm posting it now so it can be looked at after -rc1, and I'm
happy to rebase and resend then.

Results
-------

Reproducer: a /dev/kvm program (no guest OS) which makes N vCPUs exit to
userspace in a loop, each KVM_RUN being one vCPU load/put, each vCPU
thread pinned to its own otherwise idle CPU and running from its own
guest page, with an in-kernel GICv3 or a userspace irqchip.
The test program is at
https://gist.github.com/amirmnoohi/91560854a63cd3e5fc7a359eb5e17302

32 CPU Ampere Altra (Neoverse-N1, GICv3, VHE), mainline 864c07de0c7d
(v7.4 merge window) with and without the series, same kernel config,
exits/s per vCPU, mean of three 5 second runs:

                in-kernel GICv3           userspace irqchip
  vCPUs       before      after          before      after
      1       319694     324584          319670     345088
      2       298808     326063          289274     343884
      4       294895     328420          284269     343528
      8       278579     328736          112423     343984
     16       119943     328887           56120     282905
     24        77267     327478           36948     253529
     31        58722     326056           28114     250586

Aggregate with the in-kernel GICv3: 2.23M exits/s at 8 vCPUs and 1.82M
at 31 before the series, 2.63M and 10.1M with it. With a userspace
irqchip, which also clears the active state after every exit, the rate
with the series still drops to 251k per vCPU at 31 vCPUs (runs varied by
about 8% there); I have not investigated that.

Lock contention events within 5 seconds at 8 vCPUs with
__irq_get_desc_lock() or irq_set_irqchip_state() on the stack: 122800 of
122847 (in-kernel GICv3) and 7865871 of 7865907 (userspace irqchip)
before, none of 49 and 24 with the series.

If all vCPUs instead run from one shared guest page, the aggregate rate
with the series stops at about 3.6M exits/s from 16 vCPUs on this
machine (also with the timer's GIC writes removed altogether, as an
experiment), and the extra time goes to guest context (front-end
stalls) rather than to the host. Measured that way, the series gains
2.0x at 31 vCPUs instead of 5.6x.

A second machine shows the same: on a 384 CPU HiSilicon Kunpeng 950
(GICv3, VHE, 6.6 based distribution kernel, userspace irqchip), 8 vCPUs
on 8 idle CPUs ran 2.4x slower each than a single vCPU, and 69% of the
time spent in irq_set_irqchip_state() was spent waiting for the lock.

Under QEMU TCG (virt, -cpu max), 8 vCPUs, the series removes every
acquisition of the descriptor lock on this path (LOCK_STAT, 10 seconds):

  host             irqchip     irq_desc_lock_class before      after
                               acquisitions  contentions
  GICv3, VHE       in-kernel        393878        36682        none
  GICv3, nVHE      in-kernel        199654        32080        none
  GICv3, nVHE      userspace        429928       122152        none
  GICv2, VHE       userspace        321430        59542        none

Throughput under TCG does not change, so the real hardware numbers
above are the ones that matter.

Testing
-------

- Built for arm64 (defconfig, debug config), x86_64 (defconfig,
  allnoconfig) and i386 (defconfig) without new warnings, no new W=1 or
  sparse warnings (arch_timer.c has two pre-existing sparse warnings),
  checkpatch clean, bisectable.
- On the Ampere Altra, with and without the series: KVM selftests
  arch_timer (8 and 31 vCPUs migrating every 2ms), arch_timer_edge_cases,
  vgic_irq and vgic_init pass.
- Under QEMU with PROVE_LOCKING, DEBUG_PREEMPT and DEBUG_ATOMIC_SLEEP:
  arch_timer, vgic_irq, vgic_init, vgic_lpi_stress, kvm_create_max_vcpus
  and steal_time pass on GICv3 VHE and GICv3 nVHE hosts (on a GICv2 host
  the vGICv3 based tests skip, the others pass), without warnings or
  lockdep splats.
- Not tested: GICv5 (no hardware), hosts with no_hw_deactivation
  (Apple), protected mode.
- Not changed: on hosts without a vGIC (e.g. Raspberry Pi 3), KVM
  toggles the timer interrupt with enable/disable_percpu_irq(), which
  take the same descriptor lock. Those hosts have few CPUs and their
  interrupt controllers do not implement irq_set_irqchip_state(), so
  the series leaves that path alone.

[1] https://lore.kernel.org/r/20261015-kexec-irq-bus-lock-v2-1-2af15f0757b6@iav.lv

Amir Noohi (2):
  genirq/manage: Provide irq_set_percpu_irqchip_state()
  KVM: arm64: timer: Avoid the irq descriptor lock on vCPU load

 arch/arm64/kvm/arch_timer.c |  2 +-
 include/linux/interrupt.h   |  2 ++
 kernel/irq/manage.c         | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)


base-commit: 717862eac6eff0eea8ac30a0c0de0bed84922aab
-- 
2.53.0

