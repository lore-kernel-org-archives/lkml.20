Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435436;
	b=dWZuo/VesDRyxREWY/ShYqS7chiA7TnCYIcqjfqvAT5RrfqKYvt50L9t4m158KoRFbYx
	 cgKl++SbdV85xImWsZWENVgw7CV1mSQ9THXHEw8bfA8pMNxDQtAoXUey9K43Df9602f7X
	 WCzVm35BdmlrAAH/R4D/icTaiomLMVW5an3SsdqkBx60O7trR9v1RKoPWv2IEvnAlvJ1h
	 ONMWRmwwoKFPWSp3sZZchQRLuiLiF1poBxJA1NE2S05z6BcJ8tWqEbH125iIOy0uCmU4G
	 DERd/ObgtRg2VuzykNkvxMqkE7xoGzGEe0hBYBJLlHJLXA1rhGwmIdBnw5g3CwqBwWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435436;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q7H8hNLr3QrvgMDoVvUiwiv88IHAXA/9SeCjmVc/p7I=;
	b=LvRV9JepqgjADtrwTn0WnmlUdmOJ0a+QwPe2aXWbDkPmdXuxZU7W2LOzPSQYL8z3HQsM
	 vcnxtql/0Hq5s8JnsfEWlHBfk1xL2vzV1GUMfCwADMzMWjnL2y71LQdI2WsDf5w7WWhB0
	 FQ9WF1dhmoxWOTg7WGAoaLFC5sQNHmf0AlAJYZ6OPEEgMBbLA5gxsXjezxcOFo7vnE3iV
	 EkCCrc2yU5bhWQ9co0hkZLVaSOj/8s/m5leV7r5pvHpSuIp704OnEVAiHNRZjolGI4Hp9
	 3ceZtx7nwmro6AVEMS13wuFsis/z3m+ofWrUbiD2JZX6+x4ASgfGElP73lRl8L3csZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cjdv3Jwd;
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642CC606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 642CC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cjdv3Jwd
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793435433; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Q7H8hNLr3QrvgMDoVvUiwiv88IHAXA/9SeCjmVc/p7I=;
	b=cjdv3JwdjmMU2fN6vRtRB0qtFSKAgFYG/Dk0Zmb12g/fceqSZqjVps16I1DepzNCtww4+aNlQ/g8foil8qdK4krm+4ozlvo6rSpgvbNCuymKTrXDA3k2TiJX9qRLXB1N6TyFooABSAX0DgV+24vqz2tMMPXXYxqwY5GUENf4oIg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0XDo-2lz_1793435429;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDo-2lz_1793435429 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 31 Oct 2026 16:30:30 +0800
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
Subject: [PATCH v6 06/10] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Sat, 31 Oct 2026 16:30:10 +0800
Message-Id: <20261031083014.15040-7-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261031083014.15040-1-fangyu.yu@linux.alibaba.com>
References: <20261031083014.15040-1-fangyu.yu@linux.alibaba.com>
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
index 2e3c4e6c1cd7..4bc99cc0995b 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -27,8 +27,10 @@ config KVM
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select VIRT_XFER_TO_GUEST_WORK
+	select KVM_VFIO
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select SRCU
 	help
 	  Support hosting virtualized guest machines.
 
-- 
2.50.1

