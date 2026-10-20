Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459459;
	b=ryw/cG8iqdKK+C73b9BD+z92sVyFdUDieSL2X8gThFmuunJdhaZJglHNzJ/okIqnuo4w
	 mTPQlZIcwRD2BABSgCO5Ic+vlzt8OcjUBRYRAE3ZxgCeOvqSTothIIupKVe5a1agtyTmN
	 hMSCu3IyagN8IZXBfVKBtfSUIToa/3zv3chXm4RwoIpgz+LZbW+nWKl39vlvRCz5GGklf
	 +wp9hPnEVVtJLq49niB1OlprjmjDWtjtKksoaTbKDcBgkhHfJ2dKFiMVdvPX8j7s+gBEZ
	 Wm8XePX+gAkw+6H/8NvV2qhzFe5GRfpOLxaJh1VzSXsQBX34ESS5JxkU0Ti3nCLD8QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459459;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q3EOLIaJ2qdXdEiMGxALnePEn7hmKAP9M8QU5KMiV3E=;
	b=CFN3T9hhO84p4yBB54eKdxYftH6szZfSlWElkoXM8xILBdTS63YKHsSJZYk/hklisDnX
	 j3QS5wrcx+QDmJdmweJsrxGYHkIOmy62sM2NYywYAqxv9iViFJVUwSyArgGYE3wQlYE2Q
	 T2C7lnl6rrSTV2dOY75W68WlRMmLZbU2jlQI/YWk8qhVyvvwxmq9uALHxPK+MOe8vs7pT
	 Epf/JreJf/y6PpjNftWbCiVOQuG2eBEqJka9liAwKxRt/4zzJNntlqlh+eElWjb4SVLTe
	 4TEH/uTkSqPg1U4hpnqELnlxV84/E/06dIi/WqZ+SeprtZ8uqiK4neBLGPQmfCEPLCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=a3vc1LjO;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CB8606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40CB8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=a3vc1LjO
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792459449; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=q3EOLIaJ2qdXdEiMGxALnePEn7hmKAP9M8QU5KMiV3E=;
	b=a3vc1LjOyKIsguPHtmRuIHSOG8kQwx0y1QLjXpFdGETNfvN/9xiy4XkrkYAyflFRqqYjChjrB6xn5rq7c707jiwL3LP5LX8uRrZVBqDtDBasmpZPIoo/SoHVlKwIO9iJRWYrWzCgyaGv9aeTi2GFun0W7ziqoW779rSvYL5M/rM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XDB1Dh._1792459444;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDB1Dh._1792459444 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 09:24:06 +0800
From: fangyu.yu@linux.alibaba.com
To: tanchi25@mails.ucas.ac.cn
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	gsh517025@gmail.com,
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
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v4 10/10] iommu/riscv: Add IOTINVAL.GVMA after updating DDT/PDT entries 
Date: Tue, 20 Oct 2026 09:24:03 +0800
Message-Id: <20261020012403.22247-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261019133536.1610-1-tanchi25@mails.ucas.ac.cn>
References: <20261019133536.1610-1-tanchi25@mails.ucas.ac.cn>
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
>I wonder if riscv_iommu_iodir_set_mode() also needs a global
>IOTINVAL.GVMA now that second-stage translations are supported.
>
>It currently issues IODIR.INVAL_DDT and IOTINVAL.VMA after updating
>DDTP, but cached G-stage translations may still remain, for example
>when the IOMMU is reinitialized after a previous kernel used
>second-stage domains.
>
>Would a global IOTINVAL.GVMA (GV=0) be needed here as well?
>

Good catch.

Per the spec, adding an IOTINVAL.GVMA here is more accurate when
second-stage translation is enabled.

I'll add an IOTINVAL.GVMA in set_mode() in the next version.

Thanks,
Fangyu

>Thanks,
>Tan Chi
>
