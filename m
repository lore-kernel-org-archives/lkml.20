Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE518DF80
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789089913; cv=none; b=qGRelQyj9IeQVH+CGZ7GOeebNZlH9OE1ILkbEDyFd/SEY0lcAMypWdhxSOFuZT+Q7Aj6vWp4JMFrMvdWKOCXj6NUKNKwd9xAc4mvexQANZeDyBW71yGB/PsHXtA2IDz2W+PPqAeSB93zBrjz6pMdROzffJQqQ7ujot2pyvAoHf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789089913; c=relaxed/simple;
	bh=7bQ2qGl2BxQcXJxiVP25uwq790tpLdCUnyZkyRwkMLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r5Zb+dnqFA1gHLEiAsapVAUyg0JUMwmW+cLaa0ZDGf4wZiLAG3REsrWqPOfMOt1VruZ1xoSarJOmnVGCNLbL/h/IXVw7XrT1nqHCeH3gwxhItn+bZMS6GS7dHnR5hZYmKRTQt1x9epf/v6dMUUqWUbPMwo5hHrkOPpYithRxu/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=hKeFIytp; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="hKeFIytp"
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c58X8ecI9cB05ly16RbhbStXD3+pVr/Huxc1EWTQbes=;
	b=hKeFIytpUKGNGHnKNt+jVrk28bOpl+Wbb2Y6jJ3uatSCB9pPzYr0PPze44XkpVSMy3dDfi69H
	Y383P3yvjSetY0Ley0mwqbo4kDMRMUuXcfUqWYF3RS0iNv9p35fOyWMFRyupylbneMH1cCqMKRr
	vNiSJxXQxfvS5SpUuj2UDLA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hgxQT0JHczRhXP;
	Fri, 11 Sep 2026 09:14:09 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 19B1540561;
	Fri, 11 Sep 2026 09:25:02 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 11 Sep 2026 09:25:01 +0800
Message-ID: <18e70561-f2d1-444c-00d3-97093bd1bb5e@huawei.com>
Date: Fri, 11 Sep 2026 09:25:00 +0800
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
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <suzuki.poulose@arm.com>, <anshuman.khandual@arm.com>, <gshan@redhat.com>,
	<david@kernel.org>, <wangkefeng.wang@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260905033148.3657516-1-zengheng@huaweicloud.com>
 <aqFWAWNzYagW2NNH@arm.com> <aqFZco-0kpQIIxZQ@willie-the-truck>
 <aqGSUg488DHcQp9N@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <aqGSUg488DHcQp9N@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100008.china.huawei.com (7.202.181.222)

Hi Catalin,

On 2026/9/10 1:07, Catalin Marinas wrote:
> On Wed, Sep 09, 2026 at 02:04:50PM +0100, Will Deacon wrote:
>> On Wed, Sep 09, 2026 at 01:50:09PM +0100, Catalin Marinas wrote:
>>> On Sat, Sep 05, 2026 at 11:31:48AM +0800, Zeng Heng wrote:
>>>> From: Zeng Heng <zengheng4@huawei.com>
>>>>
>>>> Mapping a stack-top page via /dev/mem with PROT_NONE and then reading
>>>> that process's /proc/<pid>/cmdline triggers a spurious WARN in
>>>> ioremap_prot() through generic_access_phys():
>>>>
>>>>    WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
>>>>    Call trace:
>>>>      generic_access_phys+0x1c8/0x228 (P)
>>>>      __access_remote_vm+0x2b4/0x398
>>>>      access_remote_vm+0x14/0x30
>>>>      get_mm_cmdline+0xf8/0x2a0
>>>>      proc_pid_cmdline_read+0x68/0x120
>>>>
>>>> generic_access_phys() passes the full pgprot derived from the user PTE
>>>> to ioremap_prot(). A PROT_NONE /dev/mem mapping is encoded as PAGE_NONE,
>>>> which clears PTE_VALID and sets the software PTE_PRESENT_INVALID bit.
>>>> On arm64 such an entry is still pte_present(), so follow_pfnmap_start()
>>>> reports the pfn and generic_access_phys() reaches ioremap_prot().
>>>> The PTE_USER assertion, which is meant to catch kernel prots being
>>>> passed by mistake, then fires for a PROT_NONE user mapping
>>>> that legitimately lacks PTE_USER, producing the spurious WARN.
>>>>
>>>> Reject a user prot encoding a present-invalid (i.e. PROT_NONE) entry up
>>>> front so that generic_access_phys() cleanly fails the access instead
>>>> of warning. Note that PTE_PRESENT_INVALID aliases the PTE_NG bit and
>>>> is only meaningful when PTE_VALID is clear, so both bits must be
>>>> checked together.
>>>>
>>>> Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
>>>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>>>> ---
>>>>   arch/arm64/include/asm/io.h | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
>>>> index 21c8e400107c..bbfbc4682639 100644
>>>> --- a/arch/arm64/include/asm/io.h
>>>> +++ b/arch/arm64/include/asm/io.h
>>>> @@ -272,6 +272,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
>>>>   	pgprot_t prot;
>>>>   	ptval_t user_prot_val = pgprot_val(user_prot);
>>>>   
>>>> +	if ((user_prot_val & (PTE_VALID | PTE_PRESENT_INVALID)) ==
>>>> +	     PTE_PRESENT_INVALID)
>>>> +		return NULL;
>>>> +
>>>>   	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
>>>>   		return NULL;
>>> I wonder whether we should just drop the warning and return NULL if
>>> !PTE_USER && PTE_UXN. The latter check would also catch execute-only
>>> mappings (Sashiko pointed out this case still trips the warning). The
>>> PROT_NONE case would be covered automatically as well since PTE_USER is
>>> cleared, PTE_UXN set. Maybe add a comment that that pte_protnone()
>>> relies on !PTE_USER && PTE_UXN, so it's not that we avoid the PROT_NONE
>>> issue by chance.
>> Hmm, do we want exec-only mappings to be readable via /dev/mem?
> Ah, yes, got confused on how it reaches this path. It doesn't make sense
> to allow exec-only to be readable. Also if we mmap(PROT_EXEC) /dev/mem,
> PTE_UXN ends up set anyway via pgprot_noncached(). But it does have
> PTE_VALID, so the above won't catch it.
>
> Checking !PTE_USER should be sufficient here and return NULL. For the
> warning, I think we can check PTE_NG first but it only works without
> kpti.

Thanks for your reply. I agree that checking PTE_USER is sufficient here.

I'll drop the WARN_ON_ONCE() and return NULL directly when PTE_USER
is not set. And I won't add a PTE_NG check for the warning since, as you
pointed out, that would not work reliably with KPTI.


Best regards,
Zeng Heng

