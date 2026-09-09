Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6263793B4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934993; cv=none; b=b0lzVksxSuHD9ndDAzkkH9MalUg2r96nXFQXV+ImlNp/L4BOgKd5/FAE+yZ8tRKhgbgQv26+m+cFPjtN6my8IESNnbLMwJYgfPC8yJgl1JxsG1VEOoV+DYDp1mK8YlkyfFPPTq4RWv8PXLIcg4SUoiFF09NMA3vPN15myuv0RN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934993; c=relaxed/simple;
	bh=vCZ0sp66Ujq2pYxTZqVkONRljQsnyINGarb9W74b0JQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nq278o+ev27vjs6CiuhtJUjry3K/okFZ9x6GQn5nCy81XzzSRtKwTigggJ1yRdpAlnv/U5MJldIhARUdn3DlvwW7dV0Iz4GXJOL5kkOSUAIPHA1BEn3zTo+rQP+nDvarHZ3WpzT9I35qvJ+3+vQjOYsJ4x7WoU4FGNvoCuS7n7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hfrMp3j0ZzKHMbN
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:23:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 0E19B4056D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:23:05 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP1 (Coremail) with UTF8SMTPSA id cCh0CgB3YAtH+6BqQMYyBQ--.9414S3;
	Wed, 09 Sep 2026 14:23:04 +0800 (CST)
Message-ID: <5a17b91a-1720-eda5-a3b7-5c7b438087b9@huaweicloud.com>
Date: Wed, 9 Sep 2026 14:23:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: io: Reject present-invalid user prot in
 ioremap_prot()
Content-Language: en-US
From: Zeng Heng <zengheng@huaweicloud.com>
To: catalin.marinas@arm.com, suzuki.poulose@arm.com,
 anshuman.khandual@arm.com, gshan@redhat.com, david@kernel.org,
 will@kernel.org
Cc: wangkefeng.wang@huawei.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260905033148.3657516-1-zengheng@huaweicloud.com>
In-Reply-To: <20260905033148.3657516-1-zengheng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:cCh0CgB3YAtH+6BqQMYyBQ--.9414S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw15uF4xtw1UWr47Zw15twb_yoW8tF17pF
	1kur1kWrWDGa4IyFsFgr92gF45Cws5JFZYg34vqF12vF12vFWxJrsYg345W348AFs293y8
	KrsIg3s8XryUtFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkKb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AK
	xVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU17KsU
	UUUUU==
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/

Hi all,

    Kindly ping.


On 2026/9/5 11:31, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> Mapping a stack-top page via /dev/mem with PROT_NONE and then reading
> that process's /proc/<pid>/cmdline triggers a spurious WARN in
> ioremap_prot() through generic_access_phys():
> 
>    WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
>    Call trace:
>      generic_access_phys+0x1c8/0x228 (P)
>      __access_remote_vm+0x2b4/0x398
>      access_remote_vm+0x14/0x30
>      get_mm_cmdline+0xf8/0x2a0
>      proc_pid_cmdline_read+0x68/0x120
> 
> generic_access_phys() passes the full pgprot derived from the user PTE
> to ioremap_prot(). A PROT_NONE /dev/mem mapping is encoded as PAGE_NONE,
> which clears PTE_VALID and sets the software PTE_PRESENT_INVALID bit.
> On arm64 such an entry is still pte_present(), so follow_pfnmap_start()
> reports the pfn and generic_access_phys() reaches ioremap_prot().
> The PTE_USER assertion, which is meant to catch kernel prots being
> passed by mistake, then fires for a PROT_NONE user mapping
> that legitimately lacks PTE_USER, producing the spurious WARN.
> 
> Reject a user prot encoding a present-invalid (i.e. PROT_NONE) entry up
> front so that generic_access_phys() cleanly fails the access instead
> of warning. Note that PTE_PRESENT_INVALID aliases the PTE_NG bit and
> is only meaningful when PTE_VALID is clear, so both bits must be
> checked together.
> 
> Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>   arch/arm64/include/asm/io.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 21c8e400107c..bbfbc4682639 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -272,6 +272,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
>   	pgprot_t prot;
>   	ptval_t user_prot_val = pgprot_val(user_prot);
>   
> +	if ((user_prot_val & (PTE_VALID | PTE_PRESENT_INVALID)) ==
> +	     PTE_PRESENT_INVALID)
> +		return NULL;
> +
>   	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
>   		return NULL;
>   

