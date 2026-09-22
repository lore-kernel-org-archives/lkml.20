Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07565592F6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082819; cv=none; b=QJIiNcsFR7gdLX31ReQcrgdcElyZJef4IKMZMzJOhQKg9TYpQzu96QGh7fCctDBPPmW0GP93FCku35gp/CExrAB8QX9xYkRnq6CU31bWcdT/Qs1Rr09YCnu4nGpGNmwKsdG/MbvLBU+l949hdFVPjHSIvpXnN5cFR1J5VgYb6hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082819; c=relaxed/simple;
	bh=w0v4/Cc0aZSRCWoynVPgXYj7n1ayw0SGNTNFER2zP+8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PQ2B8sz32HTlGo3Ay0JnPQwJ4sP9BivQeRsxaNJVQ5KTOLxsVVT8f8uSv+Q4ZUZ4s15ryc9RBeG2z8NCiu2r8GOsFSfq+B6NGr3iMNdyMk3DLk5xbxWtvmiiclQi5VETSBs/0oL6Z4XOP0JZs3OGjW79Y/DsgZujGPk1mPVvrec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hApER0KA; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hApER0KA"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a9b5240fb3so5217064a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082813; x=1790687613; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVQjAaBFFW3dvBW1v+aV1twyKPPe74xtBKnCer/p5k0=;
        b=hApER0KAFZoxg75O+7OkHvJenWVHezW2X9ygbZAUkt7CXTi84DlxhCe6qDsfOC5L+h
         3QW+8091DWg1OST4cQRLhuU5VTg6pUuk9f1cBoA2hK41+9BKrDCeRNyJdEqkXM31gnbL
         Bj2oPCR3rc2v9JWldphxyBGtzd88ltOAo3L5wJOWp8ZB1BdSUGwO7Cv6pz7vK/q46Mym
         leoUR8O1dF1a36IcQQfxSKtZFM7uM46NB8vyGv4cfkNg+ZoML2UWkka1vz/PGnGiM/9N
         JLtUv8FeVmEiLkomzv8hvRUSWFGIyWpNwvD7GVks5T/1khv8+udtOootn8aKScFrYeOl
         d0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082813; x=1790687613;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVQjAaBFFW3dvBW1v+aV1twyKPPe74xtBKnCer/p5k0=;
        b=PLiAUidMvGOmPQlwUkqMIbS9moh0mhbWz+AM+NvQKeyfwpy071OyQYh6onCviOEF71
         mX/5uWwHjrN+8XvA+FwQr+0hn13wKinWr5S3kHLIe1ebO7n8SNp6JmYAEnD7FybsdT+A
         45WJ/tAKEMXEJcxNOipaj0rpOostZ7Z8z1jVgI0jqx76vhdSSWTqINQrOIIefdpgUhvu
         5Gg0qkLv3iI4gY2hj4Hd8OaohDTzyNcmfVzFmIinI2j9WZTLKuB86FpQLTYK4QGJga9e
         5vPHAVe5xCap76Q/BUUrCRbK/XQx5Etn1t2VXn/o8nB9fPBmWCd2vxWvmuZmgclTy1Fj
         1GMg==
X-Forwarded-Encrypted: i=1; AKwUvBwpYeYzAjIe+nyxh0rTIjNn0srqCnhJCYDyoUElFnhiCO+BNocTTciFpZ3SfpoeXQEpu6DT5YeJDF6wkZE=@vger.kernel.org
X-Gm-Message-State: AFuF++mY/+8o26KNheSmNhfkaCItGUI0EjPPoFtcJnF5swbGkhB5zg6o
	FIMKbnBoSapS/sSw3bQPl1bBxewyh72xBIIhqG1nI25Ep1Q6FQGl8HqFF58EYj7mblKYcAA9J3s
	jINNinH2+iLzqYQ==
X-Received: from edqt6.prod.google.com ([2002:aa7:d706:0:b0:6a9:c0e0:494d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:52ca:b0:6aa:734b:1a1d with SMTP id 4fb4d7f45d1cf-6aa734b1b6bmr7367534a12.23.1790082812533;
 Tue, 22 Sep 2026 06:13:32 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:58 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-26-smostafa@google.com>
Subject: [PATCH v8 25/25] KVM: arm64: Add documentation for pKVM DMA isolation
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Populate the section for DMA isolation in pKVM with the newly
added KVM IOMMU and pKVM SMMUv3 driver details.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 Documentation/virt/kvm/arm/pkvm.rst | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/arm/pkvm.rst b/Documentation/virt/kvm/arm/pkvm.rst
index 514992a79a83..ce67e2ae1f9a 100644
--- a/Documentation/virt/kvm/arm/pkvm.rst
+++ b/Documentation/virt/kvm/arm/pkvm.rst
@@ -77,7 +77,28 @@ Status: **Unimplemented.**
 DMA isolation using an IOMMU
 ----------------------------
 
-Status: **Unimplemented.**
+Status: Supported for devices behind SMMUv3 supporting dual stages
+of translation.
+
+With ``CONFIG_ARM_SMMU_V3_PKVM``, the hypervisor will take over the SMMUs
+on the system and provide an architectural emulation to the kernel SMMUv3
+driver.
+
+If some devices are not behind an IOMMU or behind another IOMMU architecture,
+DMA isolation is not supported, as a driver must be provided for that.
+
+DMA isolation is enforced by dual stages of translation; similar to the CPU
+where a driver can register their ops through ``kvm_iommu_register_driver``
+and implement ``host_stage2_idmap`` to shadow the CPU page table.
+
+The page tables for the stage-2 SMMUv3 will be allocated from a pool created
+at boot with size configured from the command line "kvm-arm.iommu_pgt_mem"
+The size must cover the worst case scenario for leaf mappings of system memory.
+
+This implementation trusts the system firmware not to allow the untrusted
+host kernel to bypass the SMMUv3.
+For example, by resetting the power. In that case, it is the firmware's
+responsibility to save/restore the SMMUv3 state.
 
 Proxying of Trustzone services
 ------------------------------
-- 
2.55.0.1082.g2b9226bbc0-goog

