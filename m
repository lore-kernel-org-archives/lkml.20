Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001991;
	b=znJSJyyfHthmG+rorC5D6M+OefI9zUZz/JtKc+EYO6u4TMkoGD4ZpqJJrzMdj8RjGXD5
	 7Tfq8E3y11rTWsek0AmWmi1ONy/fY4rUvWYNXFJ9jf/FF07h1d3YlGi+QGtB5CbKbtgEl
	 PuzLHbdh6ewx3fdEDqyX4ZTCXJ+JYnIBEwyah2hhy1W4lW8ArDRPnPy0j3PrhABLoeAfL
	 8aI26e5y8dLf671CtKaL1QyCaQJNTejZ4W5KJu99Nvofi0n/5x9kkVd2ye/AlBaSed7aW
	 4zdQsf6b0zwvonx1OQJqlkJE1bLv0xRd0I2HrPxVcAuD8IJUOU/nNdSgbkZI+0PO6ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001991;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:
	 X-Zmail-LocalSMTP:X-Zmail-RealSender:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-ZMAIL-USEORIGINALEMLTOOUTBOUND:Content-Transfer-Encoding:X-MAIL:
	 X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:
	 X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=DUbfcD+mF5appbi7QLgptqZT1xJk72MGi2kCZUq9Hmc=;
	b=1OeGMmC9N6aJjsLLw8K6yFcHoNEiKnjwLLTXA/uxriOvUQUvaOcCI4TCJtLpPIv9JgaY
	 fNltk0TeRXkmARmF7ETTQLy6k/keVQZ8EPp4ZRxi1zXPE3YoAP9qyU45JAgNmwvJHElxb
	 1EYSWbSvrqMIgS2TVBnF4cGjqwOcJds723W1vvu+UtHsDfLG3q3ZtEFvHuZHlq3oP1WBF
	 RFaSvEi5Q2pxR0DtMhJ8JqrtCFtYEsi5cFjZQz/ru+iaqp8+mb/o/oG0H8IT2jEPKdbBl
	 3E29kIfciWFuTHNs7hwr6FzUOwVGn0SW1eNaj/yEudieX8jhURcxGtYmIBmdD68oCMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sanechips.com.cn;
	spf=pass smtp.mailfrom=sanechips.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C7A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C7A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sanechips.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sanechips.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jCmRL3fzxz4yjSf;
	Mon, 26 Oct 2026 16:06:22 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 69Q865A0064039;
	Mon, 26 Oct 2026 16:06:05 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Mon, 26 Oct 2026 16:06:07 +0800
X-Zmail-TransId: 3e816adf09e6027-1935f
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
        gsh517025@gmail.com, guoren@kernel.org, iommu@lists.linux.dev,
        jgg@nvidia.com, jgg@ziepe.ca, joro@8bytes.org, jroedel@suse.de,
        kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
        robin.murphy@arm.com, tomasz.jeznach@linux.dev, will@kernel.org,
        zong.li@sifive.com, Gong Shuai <gong.shuai@sanechips.com.cn>
Subject: Re: [RFC PATCH v2 3/4] iommu/riscv: Add guest IMSIC GPA mapping helpers
Date: Mon, 26 Oct 2026 16:06:04 +0800
Message-ID: <20261026080604.184574-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016030138.91675-1-fangyu.yu@linux.alibaba.com>
References: <20261016030138.91675-1-fangyu.yu@linux.alibaba.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
Content-Transfer-Encoding: 8bit
X-MAIL:mse-fl1.zte.com.cn 69Q865A0064039
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 26 Oct 2026 16:06:22 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6ADF09FE.001/4jCmRL3fzxz4yjSf

Hi Fangyu,

> >Andrew has moved well past a v3
> >
> >I shouldn't be seeing code in iommu or irq drivers directly mapping into
> >domains. That doesn't work, Andrew's latest series don't do this.
> >
> >It still needs to use the SW_MSI mechanism and related.
> >
>
> Andrew has posted two patch series in the community: one is the
> MSI remap v6 series[1], and another is the IRQ bypass v3 series[2].
> I think you are referring to the MSI remap v6 series. My patch was
> based on the IRQ bypass v3 series, and I added this patch on top
> of it.
>
> [1] https://lore.kernel.org/linux-iommu/179209292714.4133959.5997128071302263244.b4-review@b4/T/#t
> [2] https://lore.kernel.org/linux-riscv/20260928143113.49838-1-andrew.jones@oss.qualcomm.com/
>
> >Nothing in the commit messages clearly explained what this is actually for
> >without having to go dig up the riscv manuals again. Please explain how the
> >interrupt translation works and what actual user visible problem this is
> >trying to solve is.
> >
>
> The interrupt translation is based on Andrew's irq bypass patch
> description.
>
> RISC-V IOMMU defines an optional MSI page table feature, which can
> be used to implement irq bypass by translating the vIMSIC GPA to
> the pIMSIC HPA.
>
> My patch complements that design. If the RISC-V IOMMU hardware does
> not implement the MSI page table, then the second-stage page table
> can be used instead to map vIMSIC GPA to pIMSIC HPA.

Using the regular stage-2 page table to translate MSI target
addresses seems reasonable to me as a fallback for hardware without
MSI_FLAT.

I would like to share my personal understanding of Jason's review.
Please correct me if I missed his point.

His concern seems to be about who owns and maintains these mappings.
When the RISC-V IOMMU driver calls iommu_map directly on a paging
domain managed by iommufd, the mappings are not visible to the domain
owner. This makes it difficult to handle mapping lifetime and
hardware page table replacement correctly.

The current SW_MSI support does not appear to cover this use case
directly. It allocates IOVAs for host MSI pages and records the
resulting mappings. Guest forwarding instead requires mappings at
fixed guest GPAs, with their target HPAs changing when vCPUs migrate.
Supporting this through SW_MSI would therefore seem to require a
nontrivial extension.

Best regards,
Shuai

>
> Thanks,
> Fangyu
>
> >--
> >Jason
>
