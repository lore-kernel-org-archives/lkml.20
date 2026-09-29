Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBAD3F6619
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653538; cv=none; b=V02/HiEgwnMtUiLbNdExoQQiySjxv7TYf60pF5BXbgzZrk9MYpSPY7mLerBPe8n7eAfAf8FuUWM7bueeHGHE75R+oZJbouroLeaGZZkbIBPXBHG9+KTkxYf0TmeHHX7aRkTSlUdlgELZrjxJz/32O/IjdhnO6OyBLqUBpNhfL0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653538; c=relaxed/simple;
	bh=fBsvcJTGySkCd+eb4363p1Jk8F2h4J7YsqmmUHp9hgU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W6GOwZRbLjxk26ZVs7iwvpex3Mk3FnE7ROCO4S9wVmv14xyb59YRkZHvT8FbX0SfuzcS8V53iPI7UOX2wGIa9Z9lWfzK3xCSGdpMSzJ+FE31LZmgQWVXX08TXcUW0WIbmN6pOz0Ua+BroRDLLFy7Sj75fkTr8AWi7RT2mZaLnNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ku3dpin0; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ku3dpin0"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so2624512a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653536; x=1791258336; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTnb5gdEOwnPdz4JRroX+sFrer89MQl7kw/S2QGLtV4=;
        b=ku3dpin0ngpLyX7ZzagHIAR7ZynSiwuFMpuJufJINVxElvG+atUqOMr6i+K2j12maC
         7zmJIsbXMQAG8FKuja8u617KPxf4Q0JnFVuNXfBN4IFwVmwxqWBqqDiRVV9URoOzFqp4
         RR1XncOAQZ5CrFRFt3QQPuFPncRUJTM6I/EAdNOjMUahItDI678Waj5Ank+HIowMX5CL
         a6xRuNeWF4o3dVhF+9tR+9I19dHXr53PCo0UEYa3k8oi2SPZDtJZjuHF/71c9UIELzEI
         wXd06Iseilgl55/oeQMn0zlsM0WOvmZCJS9PBD4D0R4iBfebsjQVRCjSyEf4PJTuqOsG
         Mt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653536; x=1791258336;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTnb5gdEOwnPdz4JRroX+sFrer89MQl7kw/S2QGLtV4=;
        b=BrW+aoQ+gH0v2qTR/DJn9nqZTQGQo1NLl71C5SsmFOXkAXAIVs0xui0lS8HOx4+uun
         xVp1m45PXODX90ZkX2cI2syjUOkdQd30R47JP3u1x9tthaUFOCPmEFhC4c4+54XGR1li
         gaZJHLGvBJDzXr8EBgLzXOLg0O284HVVl/GPCOh0CG/vLDVficcgKnbad+6zR1qGbxil
         eGC+S3zD3vmjVabUuSdOsZ6Z8NQaNblwEXQXzXN05WAN7YUFHXp4N+c1wB4El1YrUs/8
         Gpa0dGAjr2TCrr/ppuyCa714DakV/Xo/w1M+MQKTOFD9yDht0IMzSl8G2T9bVVv4rJNa
         sIqA==
X-Forwarded-Encrypted: i=1; AKwUvBzI1mvPLlsbzXRiuDbeu0iy9wISilUW23JIvHkHFkKsbEgT8LmNraE89+0BcBMDt0m4mm5y2S/hC/bKBQw=@vger.kernel.org
X-Gm-Message-State: AFuF++l6425kQsMrQFO/PIqK+WunJUdoiMIJ90NjQHJ0eVwnmawLRKwU
	Gz9fT5RBQ3N/j9gf9NLxMoPxCM3fiGwWhNZk4TYRDMuu1D3yceMZTYZl+ZSjfmJlMN9RLBod0xN
	FjA==
X-Received: from pgbdp8.prod.google.com ([2002:a05:6a02:f08:b0:cc7:a092:edd9])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e38b:b0:3de:67b8:26bc
 with SMTP id adf61e73a8af0-3de67b82a79mr3606310637.30.1790653536063; Mon, 28
 Sep 2026 20:45:36 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:01 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-8-praan@google.com>
Subject: [PATCH v11 07/16] genirq/msi: Cache MSI message in irq_chip_write_msi_msg()
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

Currently, PCI MSI caches the composed MSI message into the MSI
descriptor inside __pci_write_msi_msg(), whereas platform MSI and other
device MSI domains do not cache the message in the core, forcing
individual drivers to manually copy the message into desc->msg if they
need to restore it across power transitions.

Cache desc->msg in irq_chip_write_msi_msg() before invoking the chip
callback so all hierarchical MSI domains automatically record the
latest message. Document why the redundant assignment in
__pci_write_msi_msg() must remain for direct callers outside the
irq_chip hierarchy.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/pci/msi/msi.c | 6 ++++++
 kernel/irq/msi.c      | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 80a9db417dc8..f7bedc31d486 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -257,6 +257,12 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 		pci_write_msg_msi(dev, entry, msg);
 	}
 
+	/*
+	 * Although irq_chip_write_msi_msg() already caches the message,
+	 * keep the assignment here for callers that invoke
+	 * __pci_write_msi_msg() or pci_write_msi_msg() directly outside
+	 * the irq_chip hierarchy.
+	 */
 	entry->msg = *msg;
 
 	if (entry->write_msi_msg)
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index fb5f372215bf..df460a574d80 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -634,6 +634,15 @@ static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int domid
 static inline void irq_chip_write_msi_msg(struct irq_data *data,
 					  struct msi_msg *msg)
 {
+	struct msi_desc *desc = irq_data_get_msi_desc(data);
+
+	/*
+	 * PCI Multi-MSI shares a single descriptor across all vectors and
+	 * the device stores only the base message. Cache the message of the
+	 * first interrupt only, so that sub-vectors cannot overwrite it.
+	 */
+	if (desc->irq == data->irq)
+		desc->msg = *msg;
 	data->chip->irq_write_msi_msg(data, msg);
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

