Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4C94E8E06
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617239; cv=none; b=rnvYDWe0A+uxt0LOIKK6LFo7VirtOoFLGgAbIOwIi21xtEW6SzuNOXVSqJiOJTxH38OulzEHGKzh/qpG62WCx/cFnXgZ0enPfwchBZ8MlKWcj6WZtjYMqS7LtMp9irIA4aLEQkgM69xmviAi6JQFq3c4+ALuPjHokiCfszyOYSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617239; c=relaxed/simple;
	bh=DrrpmMgqYm/UCDYIJMppjRzVQ0lH6SCyvXay+DqFGyc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EHiq8ea434aE5f+XLdbRnaKCZKfHWYrWUr2Qe5i6Fujjilylts6oyVcnRE+D27fW9Jgog9DWnHgVcZseZZM38zQTBdvN0UVMCLAoGM8SbF56x5LXLcRvqgmmPNAsGlc7BbWacuWHP7UziUmyVPdSYFaOBbVIQqx7MthWwlcgZtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KTsmG9dq; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KTsmG9dq"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb92868263so2122634a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617237; x=1791222037; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tB5j9Ieax5DH9zx0vt2uvs8E8GXW1JSopJdrsg1Gquo=;
        b=KTsmG9dqG+Bb3PeK7AbBPRD7gQgiOfYDv9kP/oIhyWRC2McXidM2OMXKaMvbSkDGx0
         QthMyvoYX0zoGvpyrtPeEqDfwjitkovQRO5Xa0qujsURtMaxzOxivFRDnBS+EZBPioJ9
         F45TCdTNtyhmfQHctQzQphZpKSNZzPdnPcfFnrxjfUgtIOoGdSpuWYGaPDe3ghLcN7b0
         NvLEGCSrIlG5xOOavrEqEco5vxA3VYwWqgD3Y4+aGgLlXdTuMBXfDM0SI/LZUNoBPQxh
         gcXvyeytjtRCwywDlGFGYoC6mtcaAIR46pv/SQOay+alCWxqos1lDUKvrqP2cVlTN9xI
         QKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617237; x=1791222037;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tB5j9Ieax5DH9zx0vt2uvs8E8GXW1JSopJdrsg1Gquo=;
        b=J49YuQZqVlmjl5l/gRslpRWz5uQ74k73Yc6OHvzEfhxxGdh7cEXPl+uYhJR50iVN6R
         Ck9KcxA5W5nKR99Lfk1b7N5OvXffvwPqyJlR5BiYAAW2Y+z+78r9mX4MwJcUHVmsRpQ2
         a4sYbwtdm5q4uorLSSWWzAVsteolSFbyQMEygykARIVOY2VnsoobzrmvQtYbLtLx+fV2
         HJnVRhCp+Wk1AYTg/Ro2ECqzQr9zh1/XRZ4A4x8x7FWuk8fbbjd4O3rkyDTIfCtxtoBh
         MyfezjTcNTcISB+vtnIIWZrLga17lwvuMgrcCqEe+XnO1rX6VQ5TxPLXlOF/M5SIwN2P
         fJ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxDZiJXClyG526OOc3JnhEUmCFMcpUgGv95+bVgSSsoodE8Bq5PWVRvesG17xO0FDXyR/K/G0qELbV9Idw=@vger.kernel.org
X-Gm-Message-State: AFuF++kJeElPdpKsS3/qr8/9mpyd3oBP/ij/uplDH2v8Nq9+EKc3Qr8q
	y9b0bStrNWQzWvgRQF4pc046IxdxX3v1LStKnllAV6ZOVAOhrS3m2vdrpROHP65rnccWTy+4wGF
	zqOBKduH2UbPvoq9aPKpDKqLXxGtcPk3Wsg==
X-Received: from pgbgf16.prod.google.com ([2002:a05:6a02:2cd0:b0:cc7:b01e:d448])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3d1d:b0:3d7:b3c1:cc34 with SMTP id adf61e73a8af0-3de0e76e738mr10931497637.26.1790617236401;
 Mon, 28 Sep 2026 10:40:36 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:40:14 +0000
In-Reply-To: <20260928-b4-fix-aer-memleaks-v5-0-ba6b94c9c9a6@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928-b4-fix-aer-memleaks-v5-0-ba6b94c9c9a6@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260928-b4-fix-aer-memleaks-v5-3-ba6b94c9c9a6@google.com>
Subject: [PATCH v5 3/3] PCI/AER: Document that aer_recover_queue() takes
 ownership of aer_regs
From: Priyank Rathod <rathodpriyank@google.com>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, 
	"=?utf-8?q?Ilpo_J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Shiju Jose <shiju.jose@huawei.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Priyank Rathod <rathodpriyank@google.com>
Content-Type: text/plain; charset="utf-8"

ghes_handle_aer() allocates the AER register snapshot that it passes to
aer_recover_queue() from ghes_estatus_pool.  aer_recover_queue() returns
void, so the caller cannot tell whether the record was queued, and the
AER code owns the buffer from then on and must free it on every path.

None of this is documented at the definition of this exported function.
With GHES enabled, a new caller that passed a buffer from any other
allocator would hit the BUG() in gen_pool_free_owner() when the AER code
returns the buffer to ghes_estatus_pool, and a caller that freed the
buffer itself would cause a double free.

Add a kernel-doc comment that describes the parameters and states that
aer_recover_queue() takes ownership of @aer_regs, which must have been
allocated from ghes_estatus_pool.

No functional change.

Suggested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Link: https://lore.kernel.org/r/4513e7d4-4e2f-42d8-8f0c-2f0e03815dee@linux.intel.com
Signed-off-by: Priyank Rathod <rathodpriyank@google.com>
---
 drivers/pci/pcie/aer.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index a6600801af6e..a58244e00bc4 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1404,6 +1404,24 @@ static void aer_recover_work_func(struct work_struct *work)
 static DEFINE_SPINLOCK(aer_recover_ring_lock);
 static DECLARE_WORK(aer_recover_work, aer_recover_work_func);
 
+/**
+ * aer_recover_queue - queue an AER error record reported by firmware
+ * @domain: PCI domain (segment) of the device that reported the error
+ * @bus: bus number of the device that reported the error
+ * @devfn: encoded device and function number, as returned by PCI_DEVFN()
+ * @severity: AER_CORRECTABLE, AER_NONFATAL or AER_FATAL
+ * @aer_regs: snapshot of the device's AER Capability registers
+ *
+ * Queue an error record received from firmware through APEI GHES.  The
+ * record is processed later from a workqueue, which logs the error and,
+ * for uncorrectable errors, attempts recovery of the device.
+ *
+ * Takes ownership of @aer_regs, which must have been allocated from
+ * ghes_estatus_pool with a size of sizeof(struct aer_capability_regs).
+ * The buffer is freed with ghes_estatus_pool_region_free() by the work
+ * item that processes the record, or immediately if the queue is full.
+ * The caller must not access or free @aer_regs after this call.
+ */
 void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
 		       int severity, struct aer_capability_regs *aer_regs)
 {

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

