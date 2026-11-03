Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707397;
	b=5dsKCWWX1Kxdjny4/z1Potjxxl3DZzFbeChZdhcvLIzwDlOnOeBXF5UyeGE6vk+g4zAk
	 9TaH4iQdSYp41RNO6ivFkYOWb8hA6yflJCE965US5szsi0OlBwpJSG6EuhZyX9HCI39Yn
	 UTCvA4PZ3TkzrQomg9VKaWG8Bpf72xzfY9fUcPieAw4w7/6UUH0bvpUGEhXFRYjX6zcvG
	 fZCeE0qkWL/ZyZkC0kGfRnGobHY3OkFixZj33d5zXqNIKFazD4frcacvGGj5S0VTuwHoL
	 QZFS1d5hUY+Bzsj8NJAGhHATctzkA7/7gECl1p61to3PsEjytXqDCM5gF5XyAS+ZUAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707397;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9rfG8B97sjeTTjA0eUoy55WlemACgXA3zSFldzaZYdk=;
	b=Mi0OADTPX+kBt2XwGIXmqj0bxABvPdHX7EBXSk8Nsf9i2OKSsQZy1TqYt+O6VRrdGAT+
	 fKBuxz0MCfz5Ins5w69islRUM5+iz0K1bAXCWu8WjK4rlh6lB5fusy+i8ZzmaXTwS6HYF
	 8ioRKbhdZGHrczkXrzcuQre+00cSq0r70JA2v41Uw0Ff+I670YNIaLxSGwxAj2KEVJec5
	 ebGoTlpOI3cgqtBCMxhg86opHT9CQ1+6cz20aegUkF04hlqREpkEIrxeINMmsMY/FtXuo
	 Zlk9X+YoULQWg2kCtxU6u62U+g9Qs5y1UH8tfPNrhg2E9WveLUz4XwkUgoyX4s+5nHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="jdBF/Ara";
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EDD606D822
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9EDD606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=jdBF/Ara
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793707394; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=9rfG8B97sjeTTjA0eUoy55WlemACgXA3zSFldzaZYdk=;
	b=jdBF/Arag06ZsQAulrnGX4i4HllUO2cR5/vVh0ke6PEEsAs7zE2dk4fH8bBZUrfwBDrMWEVXalNWQX0Fh2T/9t2HqRmaIp9bIFwrZY/PKBQ5cfgQtwMoBrNQ0VK3HgshCRmfEbHE3+uYkvLBJe+jYeFsOWbGwRuwjYF/fOCiNts=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0XE2qH-i_1793707389;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE2qH-i_1793707389 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 20:03:11 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	joerg.roedel@amd.com,
	tanchi25@mails.ucas.ac.cn,
	gong.shuai@sanechips.com.cn
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v7 06/10] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Tue,  3 Nov 2026 20:02:32 +0800
Message-Id: <20261103120236.53474-7-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261103120236.53474-1-fangyu.yu@linux.alibaba.com>
References: <20261103120236.53474-1-fangyu.yu@linux.alibaba.com>
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable KVM/VFIO support on RISC-V architecture.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index f7e4d0f9b156..13552cfc2cd3 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -28,8 +28,10 @@ config KVM
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_GENERIC_PRE_FAULT_MEMORY
 	select VIRT_XFER_TO_GUEST_WORK
+	select KVM_VFIO
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select SRCU
 	help
 	  Support hosting virtualized guest machines.
 
-- 
2.50.1

