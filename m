Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306009;
	b=VZ3GGuqlxsNW4V6MWNlDccR96FDuqAQqfntjDVhTwO4s95P0t8DtUqpfjMchbCA3afdc
	 S9n3knuARnAQzG4CF+N8BEpVAxOdPJd9CCF9JYuq1lTI/J0sizwfGfOQTYf5c05TNffPT
	 4c4UUxD0gMJgvwpx7PYDquE3wiURn5qSXLkr1IWtqxulqdXHqrs9YEiqficlqZReU5/af
	 +iri1y7lM+X92JYWa+a8CioAzIqaGs48u/LpPAhSxvJjwhXv1emnjc1C4zy7hwXCiOO+u
	 MBAxQNGn1O6QKf4Gs+aatjWkyJiPWAnMJoCX5P3Mdf0jC9u9LuuoUALXuUO9NcKieDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1nHo9LSuLUSo1ctkTfXz3MdvvMC6Xb44b3d2+BYjEH0=;
	b=o+Mp76i6qq5Ded+RtweyG+G24i+HrEM6e3hxhQMAlNVbxVpwkuqag+QIIAxbDpN5t3oS
	 gHb7JReTURN680O3EOE9riqH+h1BKKMKXThchsHiwxg9naphG7wyQTDX7moeJYYKKphY6
	 R0YJIs1nACq/nABG4t5Cix1bBETKjc2yiDA/PTsRo5CHseGuuIIn3Q9RmrMn1yonahMio
	 JdvjHrBoV92jBSriYctEIODvUizdsceCXuPB7Cd0OYN7wD0HCuBLax8faf5u7DUwJgmbJ
	 q69FJKyJgp+zWRKGmu3pPdCHGx0DWjNTfOOGrdGo93zk5B+gsj2S9YX8bYiY3VWW3Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AvGiNFNc;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E57606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E57606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AvGiNFNc
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a5971cf7ceso3375926b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793306009; x=1793910809; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nHo9LSuLUSo1ctkTfXz3MdvvMC6Xb44b3d2+BYjEH0=;
        b=AvGiNFNco0Bf06EufKLTC7p9myk8p/QPJO44njYZtDjlrmQCDtqRhsOEfiiPcnz2DD
         GimcmyPsyOo5mFvvCtYbhJ7WZF/YtBdyUZcMDVyjC0wP6vgBOuMIkhsXutndINpLeFwD
         +D4BJM784mSmrHDYEndPb4BBXJkwA74ozeuBdRHRMoyuxSYqPZLNhVEbSEXvnimijm+7
         F9bcl5pLBLRnsdH0hxMSkyvH1dLhBsWMExwbvi/FmxhWyta2Wmy7oDD9zwdSLItGufrA
         w4VEB/t/wPlAS620ma1q2dWKp2P9cILPi6C4sC7gGJIBOqGOAe/UYqJuX39Tf2fF8Jx0
         P/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793306009; x=1793910809;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nHo9LSuLUSo1ctkTfXz3MdvvMC6Xb44b3d2+BYjEH0=;
        b=ftyam5+/4xs9orYrcAubhfPy3in3DbEOJZ/oubsj5D4nqBR/zJzNUjmG068ljRLoKa
         C1O35gAjDERGOKj4NPZfL+5uy2mTF8viLcPzhuw6ZaCF46dcLODIfWXnipeFZKjZCWos
         GaQdJnUOGFyni8dTKXKlvCSb14SWJ8teTHDxfN0YHe+6BjWrGxwT/NgJyPu5ezVYSpFd
         zDFvNbyfd2rDPBGJV2QbfnOGgTKZpkO6eu7b8F5GinTx6ewb4gshcVRn3K2LPnz7e9db
         A3bpuaQcorft2KoZbM+RZDpFCIwkrFsJxXDnhQaAUD1HXA/WQoTkj+1UCxygbiDGLYkD
         A3aw==
X-Forwarded-Encrypted: i=1; AKwUvBxw7HscCDzw/SKoPj0fN52CJy6bi8bgBD/GM2EEKMfMI1yEXwiyG2p5rwMEEJMDkSrcGqszT84xf6F3/kY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDGQRL83pJchdcKe5zhUR/YhUkMpOxPCW9viZzy+UadrpkpWoO
	aJcakQUcypyiYU2Y5yXW9jKU0g7XVHbD0rz+qu18UgxAZsPWsnmeLLgCfy4K9oSHL2BCxGmH5EI
	B5kDE8DfH11nImQ==
X-Received: from pgcgn23-n1.prod.google.com ([2002:a05:6a02:6a17:10b0:cd6:db2:b293])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7345:b0:3de:8ee8:8323 with SMTP id adf61e73a8af0-3e928956a7cmr407720637.29.1793306008350;
 Thu, 29 Oct 2026 13:33:28 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:33:21 +0000
In-Reply-To: <20261029203324.1637772-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029203324.1637772-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029203324.1637772-3-dmatlack@google.com>
Subject: [PATCH 2/5] vfio/pci: Annotate lockless accesses to vdev->sriov_active
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Cc: Abhishek Sahu <abhsahu@nvidia.com>, Alex Williamson <alex@shazbot.org>, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Use READ_ONCE() and WRITE_ONCE() to annotate the read of
vdev->sriov_active in vfio_pci_set_power_state() and the lockless write
that clears it in vfio_pci_core_sriov_configure().

vfio_pci_core_sriov_configure() intentionally clears sriov_active
without holding memory_lock, so the write can race with the read in
vfio_pci_set_power_state() (which runs under memory_lock). The race
itself is benign, at worst it results in a spurious -EBUSY while the
device stays in D0, but the accesses should be marked to prevent the
compiler from tearing or otherwise optimizing them and to document the
intentional data race (e.g. for KCSAN).

The write that sets sriov_active is done under memory_lock and is
serialized against the lockless write by device_lock, so it does not
need to be annotated.

Fixes: 40ef3edf151e ("vfio/pci: Use a private flag to prevent power state change with VFs")
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 95aee6b7cbb3..9a62797e50bc 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -332,7 +332,7 @@ int vfio_pci_set_power_state(struct vfio_pci_core_device *vdev, pci_power_t stat
 	lockdep_assert_held_write(&vdev->memory_lock);
 
 	/* Prevent changing power state for PFs with VFs enabled */
-	if (state > PCI_D0 && vdev->sriov_active)
+	if (state > PCI_D0 && READ_ONCE(vdev->sriov_active))
 		return -EBUSY;
 
 	if (vdev->needs_pm_restore) {
@@ -2396,7 +2396,7 @@ int vfio_pci_core_sriov_configure(struct vfio_pci_core_device *vdev,
 	 * state transition would at most result in an -EBUSY, leaving the
 	 * device in PCI_D0.
 	 */
-	vdev->sriov_active = false;
+	WRITE_ONCE(vdev->sriov_active, false);
 
 	mutex_lock(&vfio_pci_sriov_pfs_mutex);
 	list_del_init(&vdev->sriov_pfs_item);
-- 
2.56.0.317.g454f8302e1-goog

