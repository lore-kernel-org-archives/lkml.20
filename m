Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791648;
	b=qU9bPY0Yasj3GXGsvM9opW3KWaN9mRv5ZpePVGf8gbKJzTaq26NC5HMUWLREA1rSG70W
	 e+Mi24FcdfNOpfjIRWrfgSTuRRRXfHSB+reOsDMdgO4GelnxwdLS6vF1fuM9jnqQqlgOf
	 jRbfjXqUH8eiqUWecXn89PF5Kw/ZiMTEwptrfOKyktSzEaDjL5mQvmDJSxz3rSr3W/f9X
	 GwZshkHxonjOtKYEZmtJHjoCl6pfQBD3ZNB5kbKInWkpL2lVX0EkFjOFkNZPrVnEUcuJ4
	 wUd/iJJpk4HnK2dNXTSXHEauvUFgRCkoSROFjDGZmSCcEPCJAZmDvAXcDMzC6SAkeGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791648;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eSRpEyiCpq6q3r3x8lXM5Pt5HeYqMgK+KLNe7ym6hQM=;
	b=jtdr79A1BW04jpkBQd83JzVFkJ24YPI7psZXPs6mPZ3YaXWQQW0Zrnx02GbhdGnhw6rQ
	 SQ3pZ0tmgLZuQsE64B+otRE2roFaAZK/dbdJ5+MhVVyRsxP7ILWvPAVcOvP8rvFJpmxqG
	 4KKEA4g4/ugNP3qN81WCWZpQAl2aCWYFrjluvj4g2FkH1CshfsUTCIzCNiGz64GUoGAto
	 CESqGt8K3QjSpZ/8nvC0IdjrJc9oofbx6m3MY9x46sLbSbUu4Jt+QFmZE3wrDOKvTGgVT
	 cJo+CW2Gohayy6yty0MyFgrm8xoEnfEmDXn4ptt3hqKftNcY9yb7rtGhyNnQ9W3bKpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=rz+1DxXA;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16530606A339
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16530606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=rz+1DxXA
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793791638; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=eSRpEyiCpq6q3r3x8lXM5Pt5HeYqMgK+KLNe7ym6hQM=;
	b=rz+1DxXAVtn13kDO3j3GHv+7mVMdJgFOpCHP9iHJgx8o+IVgufEes2G97YBhXdtuZfaBI+GSSCmzj1txHmq2Pc1mgZh8sh65FPR0+7u2gT48qrieHvvT+/ZM5HqNAv2nPj8txxxtxSvSywq7hUNwsnPl+Jw1Yqoo5cOUwSTvmUw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=29;SR=0;TI=SMTPD_---0XE5bSHL_1793791633;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE5bSHL_1793791633 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 04 Nov 2026 19:27:15 +0800
From: fangyu.yu@linux.alibaba.com
To: gong.shuai@sanechips.com.cn
Cc: alex@ghiti.fr,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	nutty.liu@hotmail.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tanchi25@mails.ucas.ac.cn,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [PATCH v7 05/10] iommu/riscv: support GSCID and GVMA invalidation command 
Date: Wed,  4 Nov 2026 19:27:12 +0800
Message-Id: <20261104112712.68199-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261104092111.119394-1-gong.shuai@sanechips.com.cn>
References: <20261104092111.119394-1-gong.shuai@sanechips.com.cn>
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

>Hi Fangyu,
>
>> From: Zong Li <zong.li@sifive.com>
>>
>> This patch adds a ID Allocator for GSCID and a wrap for setting up
>> GSCID in IOTLB invalidation command.
>>
>> Set up iohgatp to enable second stage table and flush stage-2 table if
>> the GSCID is set.
>>
>> The GSCID of domain should be freed when release domain. GSCID will be
>> allocated for parent domain in nested IOMMU process.
>>
>> Signed-off-by: Zong Li <zong.li@sifive.com>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>> ---
>>  drivers/iommu/riscv/iommu-bits.h |  7 ++++
>>  drivers/iommu/riscv/iommu.c      | 62 ++++++++++++++++++++++++++------
>>  2 files changed, 58 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
>> index f2ef9bd3cde9..65d1f2250011 100644
>> --- a/drivers/iommu/riscv/iommu-bits.h
>> +++ b/drivers/iommu/riscv/iommu-bits.h
>> @@ -720,6 +720,13 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
>>  	cmd->dword1 = 0;
>>  }
>>
>> +static inline void riscv_iommu_cmd_inval_gvma(struct riscv_iommu_command *cmd)
>> +{
>> +	cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD0_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
>> +		      FIELD_PREP(RISCV_IOMMU_CMD0_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
>> +	cmd->dword1 = 0;
>> +}
>> +
>>  static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
>>  						  u64 addr)
>>  {
>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>> index 918fce4aa8c4..5546dfcd976c 100644
>> --- a/drivers/iommu/riscv/iommu.c
>> +++ b/drivers/iommu/riscv/iommu.c
>> @@ -49,6 +49,10 @@
>>  static DEFINE_IDA(riscv_iommu_pscids);
>>  #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
>>
>> +/* IOMMU GSCID allocation namespace. */
>> +static DEFINE_IDA(riscv_iommu_gscids);
>> +#define RISCV_IOMMU_MAX_GSCID		(BIT(16) - 1)
>> +
>>  /* Device resource-managed allocations */
>>  struct riscv_iommu_devres {
>>  	void *addr;
>> @@ -842,6 +846,7 @@ struct riscv_iommu_domain {
>>  	struct list_head bonds;
>>  	spinlock_t lock;		/* protect bonds list updates. */
>>  	int pscid;
>> +	int gscid;
>>  };
>>  PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
>>
>> @@ -1004,7 +1009,7 @@ static void riscv_iommu_tlbi_calc(struct riscv_iommu_tlbi *tlbi,
>>  }
>>
>>  static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>> -					  int pscid,
>> +					  int pscid, int gscid,
>>  					  struct riscv_iommu_tlbi *tlbi)
>>  {
>>  	bool use_nl = tlbi->non_leaf &&
>> @@ -1012,8 +1017,13 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>>  	struct riscv_iommu_command cmd;
>>  	unsigned int i;
>>
>> -	riscv_iommu_cmd_inval_vma(&cmd);
>> -	riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
>> +	if (gscid) {
>> +		riscv_iommu_cmd_inval_gvma(&cmd);
>> +		riscv_iommu_cmd_inval_set_gscid(&cmd, gscid);
>> +	} else {
>> +		riscv_iommu_cmd_inval_vma(&cmd);
>> +		riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
>> +	}
>
>As I understand it, the same choice is needed in
>riscv_iommu_bond_unlink().
>
>The missing GVMA command does not break anything today, because every
>caller of bond_unlink() runs iodir_update() just before it, and that
>already sends the GVMA for the old GSCID. But depending on that
>ordering seems fragile, and the comment in bond_unlink(), "invalidate
>all cached entries for domain's PSCID", is no longer true now that we
>have S2 domains.
>

There is no functional issue with the current code, since
iodir_update() already performs the required invalidation.

That said, as this series adds S2 domain support,
bond_unlink() should indeed be updated accordingly.
Good catch.

Thanks,
Fangyu

>The change, if you think it is needed, fits better in the last patch,
>"iommu/riscv: Add IOTINVAL.GVMA invalidations". I am replying here
>only because the code is very similar.
>
>Thanks,
>Shuai
>
