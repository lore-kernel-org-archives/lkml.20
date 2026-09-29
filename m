Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC973DA5DC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653524; cv=none; b=edJCDXhUOlvpcro/uU2reh+qYX5UnpHglIxpqo8bB10LnngVBdPAo6fbzpuxDMmqtLAr34klTi58D/aVQ9N3rZxAtxIDgdr76s4GTEjpfeMB9r6g94EpTmaj4cmX/8HfUJqeSpdsyAGmEd1ktAyt5TkOvPsxFEvUJxG9+TTH9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653524; c=relaxed/simple;
	bh=fFhDv6xiTzoP5mXky/YcdL+5KxtKOvsug5MtllavMrg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ElEw/ni5/WPJnvBvESJmErrTlGipxyIzS3jifdEZ9fdtjJwfqGc790rQDeRh748r7o28EJJv+akr6kzqyvjWVQZP+oPqed2N7v4a6Umi8Gj08NDo6vzR2/B9ILO6dYjxwDeXM7DjSCiIPjEgFSl9ZmR5haNyuW2oOJW46z3x7Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LfCPAbCK; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LfCPAbCK"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc51591102fso2531861a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653522; x=1791258322; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzOEbNfjD3OpqFZFEVxnhgWiMymsFPxW/9SXAAccjko=;
        b=LfCPAbCKFI6eJQr2n+BdiXya2Dt7TJ0XNnQMvNdu/GBKqxogqBB9tu8apTTd/iXB4i
         PpA/CCixySpIFjZKTXhgm01Be8H5R3zfaV+uNQbeJzaIIB9wU+W7DWYuICWkGmo+dPsU
         9Rqc3A8elJ5E0PTrE4SL0iNsl/RkFu2kliNDPoagl+DqH6i6QXAtVqNw7LU5t5tkLU7n
         M7GQe+BrTfiuGOl4xiiBWTpHszAxghDpihJG6UGBvYCp/AhuN952QObi/Nplc0/q8sAV
         UJeI6dUsr/uoxavmYWzDl9NnGvcYQVYu5fvZsGI8S4zoYng6m7rkVqOeqFsn5IlFR4rO
         0lDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653522; x=1791258322;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzOEbNfjD3OpqFZFEVxnhgWiMymsFPxW/9SXAAccjko=;
        b=byvVBKdSMHh9vHe5uDEqRB1B1+0D7ElcNRF7D9N0/D8d4bH/3fHogWVdPWKG2N8hzU
         W8OGv83uMO1sez3LI1kVDmrJY8eG9v9TvCIZrqLct7JCUEvgGOJ1fRIF+HUBXO9CuWUg
         qK5EogXHAj8szUc/vKrOng4y2OpNP32NWS317V+SHsl3BkTShMQTQe6jG+Fn6ZZSTzP2
         969hD32dWR58Fu7y9kv1zkCOmYxzUYOoq9y8tlJIBq7oQwkg4+zd8LqJsJ+00fCT2Y31
         v0j6C8/tFfEupZjPySYPeKfYtZIYfoJD4X4xD+dUaW0SvDE1vmFbBQEwMaCpCsw1IetO
         n/ow==
X-Forwarded-Encrypted: i=1; AKwUvBxWsMq/g5PKnl0DNCZZ38Ddm2I8dT6ppfxYi8/FrB6ImsB5CyQMuKtDL0F4JisWc+zEwmszJcueK9A/69Q=@vger.kernel.org
X-Gm-Message-State: AFuF++n8aJ1nkYpYFpXVU1x/EvF08EtlRJvTnn/EbTUFwxfSm9oOzUdq
	1qrRZJpVKLA9+bmBrRBDky2uJx1dKK5QOO61uLruZIzwMmzgsN32Mqvw8TMYDb63lGoB7TAyqaF
	/Ug==
X-Received: from pgnn16.prod.google.com ([2002:a05:6a02:4f10:b0:cc4:ac4b:d736])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:820c:b0:3da:b089:dba4
 with SMTP id adf61e73a8af0-3de0e6f1564mr15182146637.2.1790653521605; Mon, 28
 Sep 2026 20:45:21 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:44:57 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-4-praan@google.com>
Subject: [PATCH v11 03/16] iommu/arm-smmu-v3: Add arm_smmu_drain_queue() helper
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Nicolin Chen <nicolinc@nvidia.com>

Add a counting-based arm_smmu_drain_queue() helper, to replace queue
specific polling loops. Its until_empty mode serves the suspend and
runtime PM routines that would drain the CMDQ. Any timed-out drain fires
a WARN_ON as well, since reaching the timeout would take some stuck
consumer in any realistic case.

The existing queue_poll() API is not reusable for such a drain: it is the
atomic busy-wait for the command issuing paths, and it assumes a hardware
consumer making progress. A drain caller is sleepable, in contrast, while
the EVTQ/PRIQ consumer is a threaded IRQ handler that needs the CPU: such
a busy wait would starve the handler throughout an entire timeout, whenever
the waiter and the handler shared one CPU on a non-preemptible kernel. So,
this new sleeping helper is marked with a might_sleep() as well, given that
an atomic-context misuse would otherwise hide behind an empty queue.

Note that a drained event is dequeued, but not necessarily handled, since
queue_remove_raw() moves the MMIO CONS before the threaded IRQ handler gets
to push the event onto the IOPF workqueue. A subsequent change will invoke
synchronize_irq() and iopf_queue_flush_dev() to close that gap, and it will
act on the errno of a timed-out drain too.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 81 +++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 06b7de2e6e4b..84b56849f6dc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -948,6 +948,87 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 					   cmds->num, true);
 }
 
+/**
+ * arm_smmu_drain_queue - Drain an SMMU queue
+ * @smmu: the SMMU device
+ * @q: the queue to drain
+ * @until_empty: target selection
+ *
+ * With @until_empty == true (for CMDQ), exit once the queue is observed empty:
+ *
+ *   cons0                cons                                prod
+ *     |                   |                                   |
+ *  ---+###################+=====================+=============+--->
+ *                         |<--------- undrained==0? --------->|
+ *
+ * With @until_empty == false (for EVTQ/PRIQ), exit once "drained" reaches its
+ * target: "pending" (i.e. prod0 - cons0, frozen at the entry time):
+ *
+ *   cons0                cons                 prod0         (prod)
+ *     |<---- drained ---->|                     |             |
+ *  ---+###################+=====================+=============+--->
+ *     |<--------------- pending --------------->|
+ *
+ * Note that a drained entry is dequeued, but not necessarily handled: the
+ * EVTQ/PRIQ callers must follow up with a synchronize_irq() to wait for the
+ * threaded IRQ handler to finish handling the dequeued entries.
+ *
+ * Context: Process context; may sleep.
+ * Return: 0 on success or a negative errno on timeout.
+ */
+static int __maybe_unused arm_smmu_drain_queue(struct arm_smmu_device *smmu,
+					       struct arm_smmu_queue *q,
+					       bool until_empty)
+{
+	ktime_t timeout = ktime_add_us(ktime_get(), ARM_SMMU_POLL_TIMEOUT_US);
+	u32 cons, prod, prev, undrained;
+	u32 drained = 0, pending;
+
+	might_sleep();
+
+	cons = readl_relaxed(q->cons_reg);
+	prod = readl_relaxed(q->prod_reg);
+	/* The exit target: the number of entries in the queue at entry */
+	pending = Q_POS(&q->llq, prod - cons);
+
+	while (true) {
+		/* Accumulate the entries consumed since the last poll */
+		prev = cons;
+		cons = readl_relaxed(q->cons_reg);
+		drained += Q_POS(&q->llq, cons - prev);
+
+		prod = readl_relaxed(q->prod_reg);
+		undrained = Q_POS(&q->llq, prod - cons);
+
+		/* Exit on an empty queue, regardless of until_empty */
+		if (!undrained)
+			return 0;
+
+		/* Snapshot mode: exit once the pending entries are drained */
+		if (!until_empty && drained >= pending)
+			return 0;
+
+		/*
+		 * A timeout means the consumer might be stuck. In theory, if it
+		 * moves 2 * qsize entries or more within a single poll interval
+		 * Q_POS() would wrap and undercount drained: that could trigger
+		 * a spurious warning too, if the queue was never once observed
+		 * empty. Yet, that much consumption in such a short interval is
+		 * unrealistic. WARN it only, as a stuck consumer is a real bug.
+		 */
+		if (WARN_ON(ktime_compare(ktime_get(), timeout) > 0))
+			break;
+
+		/* The consumer might be a threaded IRQ handler. Yield to it */
+		usleep_range(100, 200);
+	}
+
+	dev_warn_ratelimited(smmu->dev,
+			     "queue drain timed out at prod=0x%x cons=0x%x\n",
+			     prod, cons);
+	return -ETIMEDOUT;
+}
+
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
 				   struct iommu_page_response *resp)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

