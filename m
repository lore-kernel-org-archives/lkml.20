Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792792330;
	b=XmJNjajyUWsAnUiycdecBHaaLYG9exTLkld2/n6EqKrIeYONSxK9hSopfb6cSDgXNl0q
	 ey20sncJ/lbljS1eFh5AOKcVz0KIeHmdnQvTfAKqoTTX/EVQXkiiQgcQrYJdK2LMXrfDi
	 svqBSWJcXiB3gIQWVk1bAPhGNwu/6zpipZckfxgqcK2pTIyqIp3/xmDtYmtIQnxrULe0Y
	 fSxvufc5FlXZKjHBSJ20sfi2j9BrAKw7cCo9YqBSAxMYDYL2Ij/rivtzaQ3Br+9MsugTi
	 nlPp1mwMEwfrbxMgfwqOG62iEsr8m3UD2CcpffFLXPMG5Uh33xKOAWjVm1Fbsm3zLYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=powphZXLhH8S0DAbGwSawM8KqytfbP1cF9uHOkKWMWI=;
	b=OOphRW8+BTjsQRtce/HoiC68b7B94FSnqkl8F9xdd5W5h0Qpb/P98ZKPd2yKZ22YpOCd
	 0IEE6DNM/katiO98Rtn96HdiFdwfX+5dtKXgOg+N7kc17HNwbef6kjuPtDel+aXZQ0INf
	 3I/GI8Se9uimQxPcSTBz7pm7oYcNLtRKhStVrpHktGxg9tbEAwQxyFeWQt8SKnn3BKw/Q
	 DVOnQ6h6naQxCFsvHaqsp6QrK6+Z/m3CP5EyIewnzSCS6OYeeprYjLR0rsk1RqJQdsdvZ
	 HU94icgcnDrU/ZbAs9f3rR0iDlLI+qF3JFrMCnpMAirHqXxYVYnQuk87FyB5lXlXp+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=M6ZlctPX;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EF5606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EF5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=M6ZlctPX
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f8281066c4so1652323b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792792328; x=1793397128; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=powphZXLhH8S0DAbGwSawM8KqytfbP1cF9uHOkKWMWI=;
        b=M6ZlctPXYoYAgkYIZONBO3nURYjOMZebko+yvQzXX0K3+db3LOjiHB9actSK7i36Y9
         4SSQ5+1ZZUpm69GkjrAtTQ7Xm2itjRofwV1cJNUml9PqNDgtzCQIqzlmhaHZT8IA+ds7
         v7tYkOQqIx8ci5XTh7lrSOIEI31gmavpqOmRv11uNDgzYt4MYG/mglQeHkYCcdm5+l6Y
         w3scrmGvyqY7ky7d6RGlVkHVDJc7xd1p/UPybYekQvSjCzEKMdjkv+dweLj4bKZ1LiHP
         xgd+3dP+02rQk93Wd3YEeJig58XcpFsHbpVKIBnto0sM9DGo5zZKZ2HqNc+ex+j0Hgto
         La1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792328; x=1793397128;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=powphZXLhH8S0DAbGwSawM8KqytfbP1cF9uHOkKWMWI=;
        b=JR99wZoJsOLK7V8E47b8QqdonJs7akHec/RgR7k+wqVVe9rraeziYsrO618FHDTpD+
         Kp2PBbUw//Co1B8zoc1acHhsrzJGp8sdL9nDPwP4wxjMFm6Ds2DB1aieIRVK4yEUFyOt
         ZDNaHhtU09vhq9CMxrIaunFDlcNc/Dha70TFSzIlhsIg3rDDZysDnAfSIla8YclJx6Wh
         8ycbXL/HpWWvk4bwGa7RSJBn7Tz92LiVKEEwR15EB5WW5hAMsuPYCmpgrbq0Obr2X45d
         Aj8C2pcZldnq+KAdecQiXheSX01GnajJ9wUhzR1Pd7zhmZVl9sfYvQmqfpai0azfvJwc
         ps6g==
X-Forwarded-Encrypted: i=1; AKwUvBzegKZrrDcCLLzd1TAB5AXcJ6koSemgt0+fUzj98cfjsHDKNqUkpzZS9WxGPGUv8uWzQqVXlcb6ilo7E+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+2j1DeXXoEd4pKSpuf/UtjXfuRzh6t7aVEUvVbnHkkFI0krNV
	+qy48Pjw6cKNFVFmzQc8PcgUr1pJ08DK0NprLFfKKlb5FH4sQKmXPnijn8WUClGe7fVI0dJYuHv
	no35oMll8rpuTgIk0/bJOqncrCQ==
X-Received: from iocou10-n1.prod.google.com ([2002:a05:6602:c30a:10b0:9c4:1f4b:e117])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:11c8:b0:4f7:d324:bc36 with SMTP id 5614622812f47-55c002fc6a9mr386149b6e.43.1792792328262;
 Fri, 23 Oct 2026 14:52:08 -0700 (PDT)
Date: Fri, 23 Oct 2026 21:52:07 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023215207.1465369-1-coltonlewis@google.com>
Subject: [PATCH] irqchip/gic-v4: Use a separate lockdep class for vPE doorbell IRQs
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
under desc->lock. Assign a dedicated lockdep class to vPE doorbell IRQs
in its_alloc_vcpu_irqs() via irq_set_lockdep_class() to prevent this
false positive.

Fixes: 8e01d9a396e6 ("KVM: arm64: vgic-v4: Move the GICv4 residency flow to be driven by vcpu_load/put")
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---

Notes:
    An LLM-based coding assistant was used to help analyze the lockdep
    report and draft this patch. I reviewed the analysis and the change.
    
    Tested with this patch applied to a 6.18-based kernel (the affected
    code is identical) on a GICv4.1 host with an idpf NIC and
    CONFIG_PROVE_LOCKING=y: bring an idpf interface up, then run the KVM
    vgic_lpi_stress selftest pinned to a CPU shared with a busy loop so
    the vCPU is preempted while its vPE is resident. Without this patch
    the splat fires on the first run. With it, five runs are clean and
    lockdep records rq->__lock -> the new vPE doorbell class instead of
    irq_desc_lock_class.

 drivers/irqchip/irq-gic-v4.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
index 8455b4a5fbb0d..68ee288f6a076 100644
--- a/drivers/irqchip/irq-gic-v4.c
+++ b/drivers/irqchip/irq-gic-v4.c
@@ -157,6 +157,8 @@ static int its_alloc_vcpu_sgis(struct its_vpe *vpe, int idx)
 
 int its_alloc_vcpu_irqs(struct its_vm *vm)
 {
+	static struct lock_class_key vpe_irq_lock_class;
+	static struct lock_class_key vpe_irq_request_class;
 	int vpe_base_irq, i;
 
 	vm->fwnode = irq_domain_alloc_named_id_fwnode("GICv4-vpe",
@@ -183,6 +185,8 @@ int its_alloc_vcpu_irqs(struct its_vm *vm)
 	for (i = 0; i < vm->nr_vpes; i++) {
 		int ret;
 		vm->vpes[i]->irq = vpe_base_irq + i;
+		irq_set_lockdep_class(vm->vpes[i]->irq, &vpe_irq_lock_class,
+				      &vpe_irq_request_class);
 		ret = its_alloc_vcpu_sgis(vm->vpes[i], i);
 		if (ret)
 			goto err;
-- 
2.56.0.257.gf7497c7d27-goog

