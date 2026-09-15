Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757CC406818
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442925; cv=none; b=CbPRH7Y3C8IpstKnzvp/+zP6zT2LR8TEsoetlQYRIrlZYZcumfEfSYxLF5OCdDQAdjuYf9xKGoWIBzLJPkx42ayiMLEmXiub2P/QlpC6e3h1dlxHFI16y8cLNt2+PW2XCP+xauPI9LAidhgnMYm6ruSyeunBstPD9YxXGR2bNRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442925; c=relaxed/simple;
	bh=ajeixIyIZn7e1SVn+fOU3DQOEcuI1JMx4t+xxh48PYk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tEKBD9F5h5aQIGMTxHxkHm2RqiTMdbGINjovAdHhhm2kUJN5i8RusCtnl6EspH6smZAsqimoYiyDShtc060mbrbkbgZFGHr4WqmXiWqzMjftMEtPVGkXDzB7RH2AP6kdQkaQpB0VBmBFv16+4YT+/ohriHHBN58G6it2Jx75Ego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=o/FRFbM5; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="o/FRFbM5"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789442921; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=WPil3eixt8ucg6uFY2jx9kjdOYj5Ua6FKNTjPbzjrB8=;
	b=o/FRFbM5xVBtkVrj285hquG0TSpIkDs7rrx6C4io49OF90y1/fcpaDAiZp/wSZMELx1naINEx0krttqW9tImngjHe5k7RPG05wa3BNRK8gnFDFRpD8sj5Idj77x7AhggLirRcVrdPwPmgWYLQKTLJAoEAhhxsEgcjBF3U2Cr8L0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XB.uvOm_1789442917;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XB.uvOm_1789442917 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 15 Sep 2026 11:28:38 +0800
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
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	joerg.roedel@amd.com
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: [RFC PATCH v4 03/10] iommu/riscv: report iommu capabilities
Date: Tue, 15 Sep 2026 11:28:22 +0800
Message-Id: <20260915032828.11250-4-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
References: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Report RISC-V IOMMU capabilities required by VFIO subsystem
to enable PCIe device assignment.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab10..a6c8307e82ea 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1422,6 +1422,16 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 	return generic_device_group(dev);
 }
 
+static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
+{
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
 {
 	return iommu_fwspec_add_ids(dev, args->args, 1);
@@ -1483,6 +1493,7 @@ static void riscv_iommu_release_device(struct device *dev)
 
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
+	.capable = riscv_iommu_capable,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
-- 
2.50.1

