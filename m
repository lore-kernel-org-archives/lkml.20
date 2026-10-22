Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.80
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792687807;
	b=uiXo0sVm1S57+mfhzC0Sq4i1AhjjJ4SK0SjnFPv1uYoaP7uh9msWPFouuCvH0q3ZFu5u
	 3UBV5T3bdKJIwdjCFpyKkoMd9WLdQMxc+Mqwh5aipvAqSDDi6J2TIrVKdNm0Ap6S1q6O9
	 xdznZc6axclSVgJdZYuxGbBjWXD3aBxSbU+lSsc6h+ZWpVmZBbZqbRXcFUgDmPgfCCkg2
	 vXGbDriTXbXVGkyEIq7VD8iNnhiEycIIBemikID30ds8Oi/jwGKYNDHK0DXu7/MlDW39p
	 U8RAtl3z0WAHqmShTX9mm2jH+dGkKgQf6FogJ6NC3DAFbqAGpsmYECPHtG+eH/TjOVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687807;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Subject:To:Cc:References:From:Organization:Message-ID:Date:
	 X-Mailer:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=c9UuZNrtT9j3BmRS2G0fSk+x18niOMWM7XsMCgG28vk=;
	b=toM+96kEK9QBDdFTA3q0RDV27o0D+vjYkGugszZ7SaS/uprIjcRZbbi3hjb8Fp/Tc4HI
	 CgMY+K90Q7AkfmkcjQM9ZHHCJ+E3yZQYbak7iSNAoxUgczVZRbLt54JyLg9919BNG3PSU
	 rGWq11lYUJKGRcIcIRUPq/k9o9ts5Ty59rSgOTF/vX2gXgkD18qx5nUUuyjYLTR3I63zs
	 M2HtO5Qm08RLWkOC3vVI7TV1Ri5Q+0k3I3V5JuqL9U2bATYnIKug1Y+VlWzPhaYXYDm9t
	 yAa0Nxq3lqJU0l/lXLgdGWVY/UJFr1PFIhWo2RQwoyw8ujAEl50LbCSyyS/iOHVcucA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=igDPq65G;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=z52wK+qT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.80
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C5A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C5A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=igDPq65G;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=z52wK+qT
ARC-Seal: i=1; a=rsa-sha256; t=1792687766; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bgvjnoE5/u/B6zWjKIKwHSbWLwFKSHpsIjgnRILwqNAOEjtT7VJxIYjlQ2iH+Drzdw
    UgwwyCSNqS23El37iJjfCOGGxob53z5i4JagxCo25i3M2ZI6nCcBcTqQH6fPZWSon+kr
    2uKIImRfutLMoMCKGWYAeDlxgG2IhE8YX7cJGqjZR3CKJ8MMFgS+U6EWiyXW/a/s1xm6
    HPcATaVE1E57O/6OkDxwzSxFkHy93koAI4GtKtmd9ONdPvQh+XP/ii67TIP1YGvY+wkQ
    3JIPRCHcZErS04hzaLLqh2GEVNKSGnDmGmri94WV0DvTrbdAOgObQNUHHo75ExD+oBv3
    i9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792687766;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=c9UuZNrtT9j3BmRS2G0fSk+x18niOMWM7XsMCgG28vk=;
    b=KCdlwYjvNnegP8f5gWcbjh0z/HtNdHy0kXTm+vWysn0rqV9j1FM1rWGfKQBo31PqQ9
    UAPs7dVPgvD63UUpgr4YSB5McYD+oRnRmBGm9RRhPbJSMzkhpCyaaELliYXJC7ZgCS2b
    I/NXrUogYeLOCw43xhtQY3reoq68UxROv34+oLljIok4dFwgPDoCpniJelupIdwUY8R9
    Q3/BDwVt8q6VLscY0DNYJ0uAiNYM19+AiiTbMuH/s7d5MW/qNqpQe7+GxM/No9xfvlZI
    HRlucOZ7JKReqD53eQiaz2YaoP547OiwFXhOE5yUNvrpDBtBsfNlLTd+uUNJ+piuwumh
    b6Bw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792687766;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=c9UuZNrtT9j3BmRS2G0fSk+x18niOMWM7XsMCgG28vk=;
    b=igDPq65GiY2KB7hMRFvtg+dkeM+CXZwlVuohKOLeR00oh6yOpE/EcXOhp2lmAjE0pV
    ooJIEdWRfWWr7AveyNQlyUf5nKumoOlgW4Q+yhFp0TtlPQG5PVADYYp6whJkCpbT0vfX
    FNrMIYIQdSrsxmYcVPiopNuk3koUT6mxzRq+5d0rowYNXoUltpQqAdYK93OqN0m1qdfU
    kDmRjAR5lvO5w9j+jMtdeDlsXTLFMfhOUZrxkxjgraUMNrg3Mxrhfv0WWlqjeeDIivda
    B4LjIcRR9ZcX/I4eLZQxsoWgh4035Ot/F8ru1J3IraNFmaNTcoqHIa7FyXtEQnhaMPnv
    hk2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792687766;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=c9UuZNrtT9j3BmRS2G0fSk+x18niOMWM7XsMCgG28vk=;
    b=z52wK+qT5NOnKK45L+07BrB3LBDIX4ykBvT/OQNFcRnayROqiKoeC9uvmJIp9oXufA
    xgCjBUBBpscFHHPDrtBw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIS+l7Bng"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.6.3 DYNA|AUTH)
    with ESMTPSA id e825d929MGnQXf5
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 22 Oct 2026 18:49:26 +0200 (CEST)
Subject: Re: [PATCH] Connecting the SB600's i8259 controller rather in
 pasemi's pci.c than in pasemi's setup.c.
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "(open list:LINUX FOR POWERPC \\(32-BIT AND 64-BIT\\))"
 <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>,
 Damien Stewart <hypexed@yahoo.com.au>, Christian Zigotzky <info@xenosoft.de>
References: <20260701125941.906-2-chzigotzky@xenosoft.de>
 <202608142355.4AeDorvg-lkp@intel.com>
 <5ad17e60-7c02-2cd9-7cad-0c14896b8f3d@xenosoft.de>
 <aoFPwEi0iQRSmmSu@rli9-mobl>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <9baed4e5-2bc2-c3f9-9a27-24f7ec8dcbd9@xenosoft.de>
Date: Thu, 22 Oct 2026 18:49:25 +0200
X-Mailer: BrassMonkey/35.0.2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <aoFPwEi0iQRSmmSu@rli9-mobl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/08/26 07:50, Philip Li wrote:
> On Sat, Aug 15, 2026 at 11:56:56AM +0200, Christian Zigotzky wrote:
>> On 14/08/26 17:42, kernel test robot wrote:
>>> Hi Christian,
>>>
>>> kernel test robot noticed the following build warnings:
>>>
>>> [auto build test WARNING on powerpc/next]
>>> [also build test WARNING on powerpc/fixes linus/master v7.2-rc7
>> next-20260813]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url: https://github.com/intel-lab-lkp/linux/commits/Christian-Zigotzky/Connecting-the-SB600-s-i8259-controller-rather-in-pasemi-s-pci-c-than-in-pasemi-s-setup-c/20260813-054214
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> arch/powerpc/platforms/pasemi/setup.c:217:6: warning: no previous
>> prototype for function 'nemo_init_IRQ' [-Wmissing-prototypes]
>>
>> This is the old patch.
> Sorry about this meaningless report, we will improve the bot to check
> new patches to avoid such report.
>
>> Here is the new patch with pasemi.h: https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20260801043458.12500-1-chzigotzky@xenosoft.de/
>>
>> Thanks
>>
>>
>>
>>
Hi All,

is it possible to add this patch to the kernel 7.4 too?

Thanks,
Christian

-- 
Sent with BrassMonkey 35.0.2 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_35.0.2)

