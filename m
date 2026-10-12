Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8602E33F37A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798884; cv=none; b=HHj7LB77JRD6/QEPs4555564Ik4J2UuoInokIxUWlswuMJbIhL8iqQs2sXCYDer7ZBQUaBZt8BjUbBiAf8u2jzwMRkuyWJuEPmBGL0MonNkLSsRFp6mIZqJcZWjpgSo78gFpc4usnb4R/3FHnfLYaXj7vsnBoYl/xpCZQga9h3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798884; c=relaxed/simple;
	bh=qEpKnihwtB1O/AmQiViwPVFIh5doeRnDfGtkes3Yveo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QNo0YH2laXbnG6ZSj2OlEVtON7t9ZtHa3ZxqtccaHf3tdOWPvr5pKGtW6UkinV92T73mgNuPejHv2xQOcUWGzerBQf4kewhINEOsXgreYODeQD1RKjORniC/gqs4Kxo1z0asUTEqO7MjDYTZU1VEibmpBy+/9mtV4fibRsBKVDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Fq/PyAWp; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Fq/PyAWp"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791798880; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=qEpKnihwtB1O/AmQiViwPVFIh5doeRnDfGtkes3Yveo=;
	b=Fq/PyAWp9GjcrCSvhQPlOkMaL8kLJRn1XJ5ijjUJjX4UQXM2w99dZS9v6VYM7E8loYLmmV8bY/Nd9OF2x3M3UaiL8qshYSmraCXOS8EB3utuGCJOmYVOCqJ3esuvtYdPb93Z01RxMK17z/Sp4DbUVOMJaM2AgCCmYRPV9QjQM14=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XCe.3FT_1791798560;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCe.3FT_1791798560 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 12 Oct 2026 17:49:22 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@nvidia.com
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	gsh517025@gmail.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tomasz.jeznach@linux.dev,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH 1/3] iommu/riscv: Add guest IMSIC GPA mapping helpers
Date: Mon, 12 Oct 2026 17:49:19 +0800
Message-Id: <20261012094919.98576-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261011135132.GH13920@nvidia.com>
References: <20261011135132.GH13920@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>On Sat, Oct 10, 2026 at 07:18:37PM +0800, fangyu.yu@linux.alibaba.com wrote:
>> This is not a generic page-table operation. It is a special
>> requirement of RISC-V IOMMU IRQ forwarding (irqbypass) on
>> implementations without an MSI page table: the guest IMSIC GPA
>> must be mapped into the second-stage domain, and when a vCPU's
>> VS-file host page migrates, its leaf must be replaced atomically.
>
>I think you can add an atomic PTE replace operation to generic_pt,
>that should be fine.

Hi Jason,

Thanks for the suggestion. I plan to give this a try in v2 and move
the atomic PTE replacement logic into generic_pt.

CC Shuai, since he suggested the same earlier.

Thanks,
Fangyu

>
>Jason
