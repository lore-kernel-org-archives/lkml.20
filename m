Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F72B47CA64
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010442; cv=none; b=goVEfbw4cGv8zj4sloEpiIAcpJ4F+2f7QCQ4Z+iJL60vJnYmTsQZjAJYWBXOxX6ixPh1/OOzmea7EzufaNDSFfl5a9IcpeJr6p7fz+oTsVmi1n53QwEqcz+bILLiB9dHjPvOBcbvpGRZl1zGzvLQvDOyvbFmAOyMLzs527OhBCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010442; c=relaxed/simple;
	bh=JQnBZxB94b7FdJbt6YoVD0ugDd+00IsGczuRtXQr2WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAv1CWKPnklDdwveccRXMm3ZiHisZbcKBSb7OGN4o2bSRn/D/0twYikxHv/rATikh8gTp16suRbwnBSWO96IFg4lNI759X7JAOZELf2tXG22eq1CB7CN9rWUrU93Y8bptihMevpSq01bn0CduveWv40nGITdhLmEC6mXVKsg4W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=OUfKi4xJ; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="OUfKi4xJ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so604770166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1790010438; x=1790615238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m70w/bX3ilZ4pFPnKbI3naBgfETFNPJqRbN1JfmLM1k=;
        b=OUfKi4xJQtRJpmP5Yag0nmozxm7vpHt3W+JkrRsc3Cg9Ju55/7nfokeuTJyzs2K2pr
         u4OdkqEs6ZmFXWzQdlbTxe7cBxMSuEs97rXX3O5niTdM+2HWUeEtgFf/I29lRSMmNZ3c
         6Tp5GZUIbh8zs0qgZmxF/dunFyOZt5mwte8yDr401fEq/S0q0Gepwl8yVPGoKHhVcUHE
         j0k3ksU6CteIzWMD0VcsxIqPUERkGJFu+N+qAn5vVxI7IoP8aYnlxnKuiMncBdnM2+bb
         lal1cD/ua4yfT7oXPT4Edy1j85U7jrFAZxHIaaxqQ4btwvA9lWeSzAq+8iKLZH+6So+e
         jfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010438; x=1790615238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m70w/bX3ilZ4pFPnKbI3naBgfETFNPJqRbN1JfmLM1k=;
        b=MlPHUWV7WF/Bxw4WSC2Qgvh0ZQr+X+jV/t3dm86kUrsM9U+z3IcNmPdgXSyrL+0BU2
         xxzV7h3tmu8hyKsamgKt+IQMWDwZhFg2Xu/J/AxjIqaZmSdZhB9YpDbfcvwdx6TZIQwq
         njjmcMgyRxF4TNkvFx3W62C2wz+/EOo9vksAT1GUPVmw5nsQjZdqHln+5Xq3ivhSPteG
         1i+/GcRfeUk8HaljyBV9A5Xvitp94wnd/nnYcc+PpNP8M/kKQP+AjhkmYbbTFUsZPVC5
         mTuMUPCC8GXhN0lbhUaDKUzfxK/SrAUKlFJUC88luMWrtfF3RiXtot2ZRoTXEuDZbPpi
         E41A==
X-Forwarded-Encrypted: i=1; AKwUvBzqAISWDDBwPPb9N7b90Y1L2oUPdg/MAJQ7qeAjJZEPPJLWDn+Eh/UQ+IVBxEEiMFah3pRXgbjMClw431c=@vger.kernel.org
X-Gm-Message-State: AFuF++k3mu2T/dohWsL4SDcLdv1BPOnxgIUNUqOzxsTeFNwxiqlrHAnr
	H7Og4X42bKefoHcP/WzHcsFGPx/FNu2asMMrF9vK1wEkVpjHabp7J5+j2qzRBbMJdw==
X-Gm-Gg: AYBFou2FvsglhI2YapeSRjRzqWKgZWbjn2hKMkeZMrcrdrUozG5F6SdwRsCJnjiCDuC
	gaxQVJBj/bbeZ8E0sMR7rd90JaXgUAonxaqjehPOA5+gH4rAlz5Kz8HRtO7OXhe4JcbkdQU4DS7
	hE8jfkOhtRv89nNQwOlVLlwrvqZtugNBaqD0l0vlN5ahKdez5T2dYqOmLSnFNHJ/KiOnEIkXgyi
	kmECqB4ay1RsP2L4rNa2GXy1VOv52VF8+MttdzHygVvM1RLi5dIGWHehVFAyNAm04/vdI45412y
	Uhg06pmig8rARPHyHcNlf2csE6/Lfp93ayVOhzxIO+boTBLaotbSd4r41KI/1uqh9ev/osskRim
	2inaoRZ/D2/5hKm38d5v7P/D1qwoVL+e6maeKxABlbCyy22eNbuWhGgSv02BzBJ2L/1/x6qIg4C
	ct2/0O0MNRCVfHMzu69WngbuFo9gDUJaxf5bIW+4ysuCXkm3IykcPUZhFP4+az3E9bOGmZkUfSh
	x3fMwTc3jtAyk3ttmHozYNuHPqo3219KidYCq/Ef1mApXGRTCtsJ60=
X-Received: by 2002:a17:907:9723:b0:c26:1648:a061 with SMTP id a640c23a62f3a-c2a15e0febemr1007505366b.28.1790010438384;
        Mon, 21 Sep 2026 10:07:18 -0700 (PDT)
Received: from ?IPV6:2a02:8086:c99:c280:94ab:79a9:2843:6b2b? ([2a02:8086:c99:c280:94ab:79a9:2843:6b2b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3588485bsm348783466b.46.2026.09.21.10.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 10:07:17 -0700 (PDT)
Message-ID: <b8fe94ae-29ea-4de1-9ec4-9a5840edcb50@arista.com>
Date: Mon, 21 Sep 2026 18:07:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: Stop waiting for link status after config read
 failure
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, James Sewart <jamessewart@arista.com>
References: <20260904111318.1063858-1-yurypm@arista.com>
 <6e10813b-3c79-7f61-2bf8-85a6d09674ed@linux.intel.com>
Content-Language: en-US
From: "Yury M." <yurypm@arista.com>
In-Reply-To: <6e10813b-3c79-7f61-2bf8-85a6d09674ed@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/4/26 12:59, Ilpo Järvinen wrote:
> Wouldn't it be better to base such checks on PCI_POSSIBLE_ERROR()?
>
> If you keep the check for the case where pcie_capability_read_word()
> returns error, its return value should be converted with
> pcibios_err_to_errno(), not just return -ENODEV.
1. There is no reason to use PCI_POSSIBLE_ERROR in this case, because 
pcie_capability_read_word() overrides the value returned by 
pci_read_config_word() and sets it to 0 in case of a read failure. So, 
if a read fails, pcie_capability_read_word() returns 0 instead of all Fs.
2. Thanks. I addressed your comment in the v3 patch and used 
pcibios_err_to_errno().

On 9/4/26 12:59, Ilpo Järvinen wrote:
> Kerneldoc wants this formatting:
>
> Return:
3. Addressed this comment as well in the v3 patch.

Thanks

