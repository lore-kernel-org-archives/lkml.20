Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6094E4DDB4F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617235; cv=none; b=Bt9V8YGy4NyL3oKp9Ty06b3d/hbh4gMktJVLxk1WdKRI3ZOCuEvTI5/2Y7d84PtHwgGeie7DMPUpGaFTIrSsl4qDJvak2Pm4wmmFj8fcpuXk/WiD9Mbri1UGhBN4W1SRAmqRe1pZ8kiPpS3D804vxwwWcRzCl/tTBoBZ2x8ssFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617235; c=relaxed/simple;
	bh=bhpyAU15yC6QPGadz4JxsbfOGUa1ye2WK8iafRoSRFc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Gv2dJK7D0JtOum04yUXd79oVpHwdDc2tjcBcqLsh61Z9Ozm4iHS5LmqiGrAbFhAk+ua3NNiZjz8WykCN73cxfs64hUaTIhNZHsayQHaAnI9TrHDFe4DeWVmJiovICfwCNUAXBiat99531R5d6Dhhdom16DKBZnnR+e8wCLgEgEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oFFw/qtm; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oFFw/qtm"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a470ead068so882015a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617234; x=1791222034; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sw50tyOgJDy5SizTNDQpXrNC0JD8AqhCQeUwJLrCoro=;
        b=oFFw/qtmkPcaAdDhrUT5O3OKP1pPiLdlkXUnQWEkCnpfSnvmQ4mKhOQTryU1BlQYUh
         WvSCFj5VZVY6FQr7ftU2w4p9LC2JMiew04+IT97ZsM+M8Ab0ESNZ+vbgdDbvgBQS6JnV
         S9djDEag7sU7dmZD14OmkRvzAlgtWNepeV7HjC3sAZGJLCzRjD2Mq544g1HvQT/oVIGO
         i/2M9RBU8xL03m8QLIhxQ2juNBWO75WGenLWGMPOy1ZrGrOJzFZGyWz1juvnoMq7o7yo
         xGOAsnVMheqlCu8Tuf/NQ59bBfeSGVqSzBSzT3Ef97qPTzMKQrWJPdu/OIkvhg1OF4Cd
         PYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617234; x=1791222034;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sw50tyOgJDy5SizTNDQpXrNC0JD8AqhCQeUwJLrCoro=;
        b=OXZvpZAZBWa0JI0xEXWyCtgIEpwmKCrGPYhV3X+f5Yn4k3zhNwR+NTR/ytylKdgaG9
         pQ8eE074NhgPJHX0Pq6N788Xm9r4h4k8aX0mXhqQC3/333K9WM08txe/yGzOkVtikueu
         3lQ+yiPfFNPlpf/zmL0jB7jKUPShA59T2/B4Y3ZR3Tfety3Ud+21P8ZiZBQ/fcivjj90
         ApAK6nJmY6JX1OT7p9pGEv3YNf8sf1TrKwrunFpQRVRUGk7xh/kohz2w2MJaWW77WhJ2
         4rdf6f62wxkPVWDsuwzQWeJzCbMo6f/8YaqV9Jhw9+m2SBYHYqXE/netNPz2VKWLkC0X
         PfEw==
X-Forwarded-Encrypted: i=1; AKwUvBwXLC++rEsCP5Y9oZx4ZzOh/WvXV+kci7IigdhAv2LaY0+v/jasSioEeKBO7Y8kFm9abs+0HH0Ye9szKZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsEMe97H/k6TFdmATL6hSCz4GqRQarsw6lc2KZdnuH3lUL0apj
	URLkK9CP/Cebr0xk6Crc6CY/bnK8rQ8SUzhaxzdQskNYZO5Q7vq8+53I1qIoezKryHPXDg5u5Ca
	2ojb55xrwSxUjiagw1NC72FUzs73U2F5iNg==
X-Received: from pjyo13.prod.google.com ([2002:a17:90a:eb8d:b0:3a0:dfb1:6c07])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3a46:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a2b04e8389mr2449084a91.44.1790617233471;
 Mon, 28 Sep 2026 10:40:33 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:40:12 +0000
In-Reply-To: <20260928-b4-fix-aer-memleaks-v5-0-ba6b94c9c9a6@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928-b4-fix-aer-memleaks-v5-0-ba6b94c9c9a6@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260928-b4-fix-aer-memleaks-v5-1-ba6b94c9c9a6@google.com>
Subject: [PATCH v5 1/3] PCI/AER: Fix memory leak in aer_recover_queue() on
 kfifo buffer overflow
From: Priyank Rathod <rathodpriyank@google.com>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, 
	"=?utf-8?q?Ilpo_J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Shiju Jose <shiju.jose@huawei.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Priyank Rathod <rathodpriyank@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

When ACPI APEI/GHES processes PCIe AER error records, it allocates memory
for aer_capability_regs (aer_regs) from ghes_estatus_pool and passes it
to aer_recover_queue() to be enqueued into aer_recover_ring.

If kfifo_in_spinlocked() fails due to a buffer overflow,
aer_recover_queue() logged an error message but returned without freeing
aer_regs. Because the entry was rejected and never inserted into the
queue, aer_recover_work_func() could never dequeue or free it, leaking
the allocated ghes_estatus_pool memory.

aer_recover_queue() returns void, so the caller ghes_handle_aer() cannot
free the buffer itself: ownership is transferred to the AER code, which
until now only released it on the success path.

Free aer_regs via ghes_estatus_pool_region_free() when
kfifo_in_spinlocked() fails on buffer overflow.

Fixes: e2abc47a5a1a ("ACPI: APEI: Fix AER info corruption when error status data has multiple sections")
Cc: stable@vger.kernel.org
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Priyank Rathod <rathodpriyank@google.com>
---
 drivers/pci/pcie/aer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index d8dcd238fda1..b013b853b555 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1415,11 +1415,14 @@ void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
 	};
 
 	if (kfifo_in_spinlocked(&aer_recover_ring, &entry, 1,
-				 &aer_recover_ring_lock))
+				 &aer_recover_ring_lock)) {
 		schedule_work(&aer_recover_work);
-	else
+	} else {
 		pr_err("buffer overflow in recovery for %04x:%02x:%02x.%x\n",
 		       domain, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+		ghes_estatus_pool_region_free((unsigned long)aer_regs,
+					      sizeof(struct aer_capability_regs));
+	}
 }
 EXPORT_SYMBOL_GPL(aer_recover_queue);
 #endif

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

