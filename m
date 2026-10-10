Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F4D374A1E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648246; cv=pass; b=IBGD/35A+F2RZkz+FTg6ckaPAcdzS0C6CtTorLCUJ+TugLIQQnhfxSFsQujeFh4kxD8h/pIUKQ28Ume9dAtfYvQPDiSvf/zktlNLVcGthUBPU29O3/NRNO7re1/26R3RTd3TFSdZdK6OW9gGzJS2dHntANWlYmSWplDpYXITJY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648246; c=relaxed/simple;
	bh=0jFOKyrTlsyR/l5U9gLW4SzEpIFllXJgxTkqfgC040M=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Ei4+Ww+tQKTCUzQkf19ZsnqOLqWm+yxGEBlg+9etxPAEhIQpJgAEXfqwT/lXhOKTm9m/NtsKVqY0MgBrBcsr5BMZLVTS0i1QchGFYeRr36DajAOpCiP9+h73BnGYPTo/53tzkUEajvktXmi1f6v5a4nCd6LK36Da24zqsMmpOtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; spf=none smtp.mailfrom=xenosoft.de; dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=Frpi7HjM; dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=BC3njdNb; arc=pass smtp.client-ip=85.215.255.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="Frpi7HjM";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="BC3njdNb"
ARC-Seal: i=1; a=rsa-sha256; t=1791648181; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=I0/tEQDH63gdnc/RHpijRQd2irgTXY2u5sdn4FaZWi/Bi4YDfmZLyu56EbJ7FxZtx1
    va4juYfqzke8sMoTl90NpHsyNJDxVfIXGnla/UHcFo04dpRPuzjMON9SSR/BvMIs8B2Q
    CaXljBwhyBFNfRVBcLM/OMoTTIUUuAzRjCeHAJPNXHijNEQ6zUqe5DPu2bPAUGc2Vakk
    v3rpGp/3qSuU0G3dcJ82LtMmcx70noyjCNFVF3gZ/ET6jrJlp7qvbTkJnyGePET7rJSO
    /5emxJnzcEv5xX9emf1uXN7nnO7qeFGXfR7DD7CtNj18pEUHon0z5xbNGsVfJrudtsZq
    ISVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1791648181;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=8Dn09naFX34dB8eLy8oKRKU9r7nHmJhKKpa22bIqJYs=;
    b=sAFroKuwVFLrJxOCGSLp+vyADD55tBJTELb6jXK46xgCxZnAjbm5/eOilaIWJ+nSJk
    dS86GiZA4Zl/XWt4hfg2QNAd2WitIpL1DMCiaWm+x7ifOzxnfbNlQa93HSxV7aFtgYta
    jJkiofONFNbQIogG2p8vhAQS+GLGhckBm3aYIkd1Zm+XLsUfGYog4T1tDKKyq+4KUori
    BzICd6VGFJ9xEMyXfZ+sSObHWPpjzIn9GLYuNkzxfyV0Us4ujZF4L57E+vlUvIqtz6Jn
    u0UY4uW6yypZAXs/rnalyiq70DFQVA6FdWsSpzC0sowD8NFfbEdrk50RRsnkV92peyh2
    VqQw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1791648181;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=8Dn09naFX34dB8eLy8oKRKU9r7nHmJhKKpa22bIqJYs=;
    b=Frpi7HjM00W/fu4y5Vj5szP9PeuCe3/CewrtwPBJZ9FdD/RMnImDivVPF6FzwIxa3a
    Ve4kSmUrWUG3Q+Yhv9Gr5SMiqJqz8U2F/OqoKsGST76Rw6y4Y1VaElX6obs8YKxF3TL2
    GtPdkVeRHS9aLbtYODUXdNatzLU0MdK9ppBmL2GAzaxGv25PozTtv+2dfMONchzOqRq2
    y0+0cllknQtsv9rpDbpBtfM3niYOgvFFJii4FgB2/loleIOhqFcNuWiOWFtvn81E0RLq
    LQ2UIuEfv1DQkMRNo2KGMpSRHUumZtMnykV+agf/bty0cOg7OsLmXFSKBLZA0b8Lq6RG
    JVMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1791648181;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=8Dn09naFX34dB8eLy8oKRKU9r7nHmJhKKpa22bIqJYs=;
    b=BC3njdNbFvBiKxTqU7OxtDyrx9RW8QnUoDN4SmmDObwTIEO9owv2/fYnDvRjuhB9VQ
    /pQsIWyb0XOWzkRXDQCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIC+m7Xc="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.6.2 DYNA|AUTH)
    with ESMTPSA id e0463b29AG30iMc
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 10 Oct 2026 18:03:00 +0200 (CEST)
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
Message-ID: <0a1c01c3-d50b-90eb-6736-16628ed18099@xenosoft.de>
Date: Sat, 10 Oct 2026 18:02:59 +0200
X-Mailer: BrassMonkey/34.3.2.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aoFPwEi0iQRSmmSu@rli9-mobl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2026 07:50 AM, Philip Li wrote:
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
When will the patch be integrated into the kernel? Would it be possible 
to integrate the patch into kernel 7.4?
Yesterday I adapted the patch for the stable long-term kernel 6.12.

Link to the patch for the kernel 6.12: 
https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/6_12/patches/X1000/pas_pci_init_v6.patch

-- Christian

-- 
Sent with BrassMonkey 34.3.2.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_34.3.2.1)

