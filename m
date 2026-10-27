Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124372;
	b=KMnoWjNh3pXxMLrCCOkI/q3fL0IwAMh9O1o/snKHvkSPOfs/OFKBHVKzABC1ZJJf1cfQ
	 Rbk/QRBIGrOZXMvsfR/SxRjmg7BX44WParwPFp6XZKncuT+KMbmOKxMQx57IQVzgAXEhu
	 1tuYtY8YLUIy9zS5tr2Z/oLm398MS5Q8RXT0eWNmr4Kv6BDWi9ez/9+/KmRrowoiVdtif
	 9FUDaEFOC8yvEkjj3jQq+XAsK6whJPldHqBjWF+j0t9QFEBokCssbD1KMq4RyaWS1UI41
	 lN97L/ryXHnCeV5GHV7A7p1AMvc8Jra9leQiAwYjpX453Ld8KWllPKhbkZlhFdKREZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=TxYi1TQ/n9gm4Dyl6a+4Ba89b3B/1LYi/mstI8Zdh48=;
	b=UaVSgaYoL8HTqcUMng5Y+/u3nSM3B8jJ7DrkHnKyrXmDSEa+eeUzXBUkS75e0yjKpz4Q
	 Ye0DzR0MfXfiJisUJS8ZZT8BBCRt6y5M+7DkxdW+MiNkGC9cBFzZ0et2BANmpWk8Cke1c
	 MKv2OWUKsZOoTLnStEtp2Wq3QHTfsxMlQeow8ogCv4lWuVlHumK2QgneWa3cBU8WoSpGZ
	 7az9LBfa8NfYxS5w/ptaaf4Ag4rjRPDqKMqJENrxC5VeYZns66V+i40B0o7XdH74wCkTw
	 D80oDLZ2PnbWEtHnJXEWefzMMFl8MmKJsqa6vM94x3S3N7PBDxWjAtfbup6vV6Z0RgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="kR/+wmrT";
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1709C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1709C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kR/+wmrT
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8488f31d754so129086a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793124371; x=1793729171; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxYi1TQ/n9gm4Dyl6a+4Ba89b3B/1LYi/mstI8Zdh48=;
        b=kR/+wmrTEFcyIFKOziEO8h+TyzoE33rz+xYAY21HcCRaSJ8orUrvMss6EOX0Zg2reO
         I/+bHenJ4T/eT2nhx48Wk4X2hsQ/cEfQfNebb7r8vS84GZFtUfU5x/36xmVAHmCJHzDd
         F4sKkRwleaUx3AuEYygQwnIX/WO2y96xeXuFtlk9oFLCQgUacayrMWGIjt1+Ggy6c9hK
         Q7Z0CC5lZ8KX5aa+aoeHGI0cTGnbOCEFtXsRO3z+7vkKBIvNucMOM8lqwxXjhcmgpHHi
         8w81l24YumURmGT7P/GHb9Uckcy16ssKlFwuZcqMKybo1P7iPmVdR1W+ROcDzEraBguL
         7NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124371; x=1793729171;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxYi1TQ/n9gm4Dyl6a+4Ba89b3B/1LYi/mstI8Zdh48=;
        b=zMn+9L7Ry1yg5h9VDkl/DRB4CahjdA/CIkxHXaL5GbTUtFoj976/0T8a8WFun+jT83
         kT/g3Y8qewOyFuJomA4nc49HQtUkUiZQU0iA0L7dR2heTxANbFy245/NUAAKDSaaGepg
         Xt1ueGR7W7M2vn3SNjkv7KUnDkM6M/h2+zfyd/uLA6OwtcfgCXzNF79ogEU/JmvgGmrd
         DTUWSobSP/U0alRPEiAHFZhVb29Vqr1NqxvVT0fNxtCDrYugwLHzSxjIilWeSqezRQTZ
         svlswvGZFZgC9CsBowJvAz9fMxvNYS65l5YniRhASWAUsVaafygw4DuxRBvjRb30t+6/
         layw==
X-Forwarded-Encrypted: i=1; AKwUvBwhO39w8FpUskDpKphmPfmauLN2whRi/d9rUToFohNstt7LZBPvMITqjphcfHt+14pyfvDAzJJN+CFdR2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXrWefRFh0NHsIVlfHI8mYFVjo982QpElRKvwRuEYGpmnW+mDf
	kx/Op3pSp55c+/t2OUXNox2r0mTAMEbUok7SKAeGiMJUXkazg249MHJSQ3WaMpFuvCpFbTUhnq0
	Dw9ad0JhHe8xSSRmN6UI3ACkaMw==
X-Received: from ilei7-n2.prod.google.com ([2002:a05:6e02:61c7:20b0:516:a6c6:8fa3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1694:b0:53a:8c5:d7d7 with SMTP id 5614622812f47-55c003426cbmr6749991b6e.58.1793124370805;
 Tue, 27 Oct 2026 11:06:10 -0700 (PDT)
Date: Tue, 27 Oct 2026 18:06:09 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027180610.2840837-1-coltonlewis@google.com>
Subject: [PATCH v2] irqchip/gic-v4: Use a separate lockdep class for vPE
 doorbell IRQs
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Oliver Upton <oupton@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

By default, init_desc() assigns the shared irq_desc_lock_class lockdep
key to desc->lock for every struct irq_desc. Device drivers that
register an IRQ affinity notifier establish a lock dependency chain of
&irq_desc_lock_class --> &pool->lock --> &p->pi_lock --> &rq->__lock
when irq_set_affinity_locked() calls schedule_work() while holding
desc->lock.

On GICv4 systems, scheduling out a KVM vCPU calls kvm_sched_out() ->
kvm_arch_vcpu_put() -> vgic_v3_put() -> vgic_v4_put() ->
its_make_vpe_non_resident() -> irq_set_vcpu_affinity() while holding the
scheduler runqueue lock (&rq->__lock). Acquiring the vPE doorbell IRQ's
desc->lock establishes &rq->__lock --> &irq_desc_lock_class, triggering
a lockdep circular locking splat:

  WARNING: possible circular locking dependency detected
  ------------------------------------------------------
  VCPU-0/109705 is trying to acquire lock:
  ffff0001e41e4cc8 (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x5c/0xb0

  but task is already holding lock:
  ffff00dad15fd260 (&rq->__lock){-.-.}-{2:2}, at: __schedule+0x23c/0x1850

  which lock already depends on the new lock.

  Chain exists of:
    &irq_desc_lock_class --> &p->pi_lock --> &rq->__lock

   Possible unsafe locking scenario:

         CPU0                    CPU1
         ----                    ----
    lock(&rq->__lock);
                                 lock(&p->pi_lock);
                                 lock(&rq->__lock);
    lock(&irq_desc_lock_class);

GICv4 vPE doorbell IRQs are internal to KVM and GICv4, set
IRQ_NO_BALANCING, and never register an affinity notifier or queue work
under desc->lock. However, under forced IRQ threading (threadirqs or
CONFIG_PREEMPT_RT), request_irq() creates an IRQ thread for the doorbell
handler, causing irq_set_affinity() -> irq_set_thread_affinity() in
vgic_v4_load() to call wake_up_process() under desc->lock and establish
a real desc->lock --> &p->pi_lock --> &rq->__lock dependency on the vPE
doorbell IRQ itself.

Mark vPE doorbell IRQs with irq_set_nothread() so they are never
force-threaded, and assign them a dedicated lockdep class in
its_alloc_vcpu_irqs() via irq_set_lockdep_class().

Fixes: 8e01d9a396e6 ("KVM: arm64: vgic-v4: Move the GICv4 residency flow to be driven by vcpu_load/put")
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---

Notes:
    Changes in v2:
    - Call irq_set_nothread() on vPE doorbell IRQs in
      its_alloc_vcpu_irqs() so forced IRQ threading cannot create a
      desc->lock -> rq->__lock inversion via irq_set_thread_affinity()
      (Sashiko, Marc Zyngier).
    - Link to v1: https://lore.kernel.org/r/20261023215207.1465369-1-coltonlewis@google.com
    
    An LLM-based coding assistant was used to help analyze the lockdep
    report and draft this patch. I reviewed the analysis and the change.
    
    Tested v2 with threadirqs and CONFIG_PROVE_LOCKING=y on a GICv4.1 host
    with an idpf NIC: confirmed vPE doorbell IRQs remain non-threaded while
    normal IRQs are threaded, and co-pinned vgic_lpi_stress runs after
    bouncing an idpf interface pass with no lockdep warnings. Also
    compile-tested for arm64 against v7.3.

 drivers/irqchip/irq-gic-v4.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
index 8455b4a5fbb0d..e1e20aeb8fe2a 100644
--- a/drivers/irqchip/irq-gic-v4.c
+++ b/drivers/irqchip/irq-gic-v4.c
@@ -157,6 +157,8 @@ static int its_alloc_vcpu_sgis(struct its_vpe *vpe, int idx)
 
 int its_alloc_vcpu_irqs(struct its_vm *vm)
 {
+	static struct lock_class_key vpe_irq_lock_class;
+	static struct lock_class_key vpe_irq_request_class;
 	int vpe_base_irq, i;
 
 	vm->fwnode = irq_domain_alloc_named_id_fwnode("GICv4-vpe",
@@ -183,6 +185,9 @@ int its_alloc_vcpu_irqs(struct its_vm *vm)
 	for (i = 0; i < vm->nr_vpes; i++) {
 		int ret;
 		vm->vpes[i]->irq = vpe_base_irq + i;
+		irq_set_lockdep_class(vm->vpes[i]->irq, &vpe_irq_lock_class,
+				      &vpe_irq_request_class);
+		irq_set_nothread(vm->vpes[i]->irq);
 		ret = its_alloc_vcpu_sgis(vm->vpes[i], i);
 		if (ret)
 			goto err;
-- 
2.56.0.307.g5fe7bd680c-goog

