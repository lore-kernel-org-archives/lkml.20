Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B504645198D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753800; cv=none; b=C+az96IywNkhIavh6WwVV+skcJYbr2Ctj+0M47qrrg0UxJD6+TvRjeaaX/9xUv2pizFRfB0z42WorRtAwx5akb/9s7C2rtnO8s2RsFrfOhlOC41pAkKS0zSay3mBD7CYbNXxX3s8YdNvmRNuKq7NSvWXeEQxIXJGEw9Gizoxy28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753800; c=relaxed/simple;
	bh=afPlTpVBOVxRusNWGxKuDYVFIlS9SkvZcarrTJS78lU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZwE620xw/HpfmVrfiUtDjuASyR973CnMarPu0il6/h2XanMpQ4g9ckIEDu0KoFGg5PRqi6laF7NrE95YuVdeJ4P1dPafAo5wok3KmMu1nuoyL5PC2NuIutoFl0OgID88zHbM4POQf33J66KMOdo+4GNtAIouka6Iik3XTAYfds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=pVHEJOwK; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="pVHEJOwK"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec395so8332741cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789753795; x=1790358595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBXBlps+fzGob8XyzdrqGGeZGJ/AtzGPAtCevAfGf40=;
        b=pVHEJOwKKdHLMeJuk4L8dL8tZ6DcYhRBL5eQdj3UfUKw4ms5RN1YlVphH0RTWYxbo8
         0dD9ZMsseW2hM7CXiM9mld2iUGabg7YU8cIfsrr4qUpT8GSld5V15b4+9z7Si4oDz+X6
         HkDti8jIAE8b6wkPrMuliLmC5JTEdLBJBHdhpBvhp7TieAuzxtMfAM/WOJNfuDYrNmSm
         TioyH2QXDpMo7UAJLntVwrqL8UVSPj2z2KcgN3RvBtVXB1kjfv6Aurfz08wOOCkj2snB
         zHU7ekFl8DBJB2+vSOD4clFjWjaRrqCKInFU+Nv29l3co1e5ZP0SXwBl71kfo1BTtyEp
         DfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753795; x=1790358595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBXBlps+fzGob8XyzdrqGGeZGJ/AtzGPAtCevAfGf40=;
        b=rFcbBhphn3Ac3KjJcM/0UHhFATS2w30oUm7FCQNRmdIXxzgPmJKWI1CQ+ueIBoFFTE
         M0mBVwNkwblm2nn28LiG7C4hga8mAHa9d1LeMJ/yznRrhC0Bsd124eTP/VTARFHJD2CY
         uN9f3MdfYG19bfoLu6t5Yi8F2Uo/HqdOfKthHV56B3c2zUPtQNl82VSkQm9ljsoZ8RwZ
         FO2USo6zNtXto2C8JLgNn/DXOn9H5M7PL3eSkFrNIV8pW5PB8ReYxl14ItvmEt7AUjyz
         /Zrwra/Ni1XzmUD+DOfGJhXbDNZdi8knza3ugAlqpJW3vXEU1v2VC0i0admnas8kYbLl
         gyWQ==
X-Forwarded-Encrypted: i=1; AKwUvBytMrtRdLlaXlTtEgAbLEtrgsFzmmvDZn4jEqCRDmmnTJfyc9kihdQzPqRaqUpBFcmDp0tcDfHqovGIkSs=@vger.kernel.org
X-Gm-Message-State: AFuF++nVnXcyWn8A/35bnkrTBoHP2hEhrWbuDRTXAxr+BXmiyaJz6mHP
	PwORtKN0q1uhRh/ajycWyHBbDPnmTkVpMfSbN9qQLRu+iT8cVtrOvXMNdu3lhT7s61E=
X-Gm-Gg: AYBFou2dl3Nlo9LGPdNZnGesgZTeLMlVJAiI5ICCwYdDeiSnEqht6hJbiHevZMjAkrJ
	RWBpYxJmPEaHpqddlDkU7oIDvjDXTDxPEDzWfnqoBkRxdnJsqpLUqOYPeIytK1VKbZaBWMAxXNT
	s5M3j/9GypDUAlmbN5ERLiNhoG9HU8i9R5FEHTRC3dGJ1DpvHYdupdUsVnoi1hP6w3vKAgP0kim
	EuH/7osen8vOPuZFlW/5qXilKeBSKNTUdN2DmeXjtHOzn/9Tn+DmmMh+LLwxC0EoUAEgQBp03Ex
	fGcBvfVFpF4IsY+ify4OqwVUo4po4Z/q+KBawOkccO0ok8csCxwAOL4uEBrjP8t6dm8JDZZ6e/g
	ySIxrkDPBUAfOCAHEK2w3k2iW9O8BGckSnXTqdfe1jiLMqzhIZ9UXWeASJ9CIFnjt4OHmxaas//
	FGytkFvfqnI8XJaSaHqCZV/hufECQ47bv0j83WBtDTDa2UkNqKZLgxxNPJiRE68uku3alnO34=
X-Received: by 2002:ac8:5d8f:0:b0:530:ff84:e426 with SMTP id d75a77b69052e-5329e47ff4bmr57576891cf.47.1789753795392;
        Fri, 18 Sep 2026 10:49:55 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae5ef242sm2551661cf.5.2026.09.18.10.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:49:55 -0700 (PDT)
Message-ID: <e9bd7954-1cec-4ffb-a5b2-2389469b0c05@riscstar.com>
Date: Fri, 18 Sep 2026 12:49:53 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] misc: tc9564: introduce base PCI driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, bhelgaas@google.com, andersson@kernel.org,
 konradybcio@kernel.org, abelvesa@kernel.org, daniel@riscstar.com,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrea della Porta <andrea.porta@suse.com>,
 Herve Codina <herve.codina@bootlin.com>, Lizhi Hou <lizhi.hou@amd.com>
References: <20260918173003.GA1166280@bhelgaas>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260918173003.GA1166280@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:30 PM, Bjorn Helgaas wrote:
> [+cc Andrea, Herve, Lizhi for of_pci_make_dev_node() quirks]
> 
> On Fri, Sep 18, 2026 at 10:26:57AM -0500, Alex Elder wrote:
>> The Toshiba TC9564 is small and highly-specialized SoC that implements
>> a PCIe switch as well as an Ethernet AVB/TSN bridge.  In addition to
>> these, the SoC implements other functions, including a reset and clock
>> controller, an address translation unit, and a few other devices.  PCIe
>> BARs provide access to registers that manage these IP blocks, and the
>> SoC is modeled using a PCI endpoint bus in devicetree.  This allows the
>> IP blocks to be bound to platform drivers that do MMIO via the PCI BARs.
>>
>> Create a new PCI driver under drivers/misc that binds with the embedded
>> PCI endpoint functions within the TC9564 SoC.  Because these functions
>> will use devicetree pci-ep-bus to provide access to other IP blocks
>> within the TC9564 chip, the main purpose of this driver is to do basic
>> PCI initialization, then call of_platform_default_populate() to scan for
>> the any endpoint bus children, and probe all devices defined therein.
>>
>> Because we're using pci-ep-bus, we need to use the PCI quirks mechanism
>> to have of_pci_make_dev_node() be called for each endpoint device in
>> pci_bus_add_device() (via pci_fixup_device(pci_fixup_final, dev)).
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# quirks.c
> 
> Not an issue for this patch, but I'm not sure the quirk mechanism is
> the best mechanism for doing this.  It's not working around a device
> defect like most quirks do.

I pretty much agree with you.  I think I mentioned this before
(though it might have been in a private conversation) that it
is an intentional act to call of_pci_make_dev_node() for an
endpoint (and not just a bridge).  And that's different from
a hardware quirk.  You only need to do it if there's a pci-ep-bus
sub-node on the endpoint.  (I'd have to verify this on the other
users of this approach to be 100% sure though.)

> I wonder if pci_bus_add_device() should unconditionally call a wrapper
> that calls of_pci_make_dev_node() for bridges and any device that
> appears in an allow-list.  I guess it sort of amounts to the same
> thing in the end, but it might be a little more explicit and not
> subject to CONFIG_PCI_QUIRKS.

Yes, I think it would be better to separate this case from PCI
quirks, which are really intended for anomalous hardware behavior.

I'd like to get these things merged, but would be willing to work
on this sort of thing (and/or on separating this driver type, as
Arnd suggested elsewhere).

Thanks a lot Bjorn.

					-Alex

>> +++ b/drivers/pci/quirks.c
>> @@ -6391,6 +6391,7 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5020, of_pci_make_dev_node);
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5021, of_pci_make_dev_node);
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REDHAT, 0x0005, of_pci_make_dev_node);
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, of_pci_make_dev_node);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_TOSHIBA, 0x0220, of_pci_make_dev_node);
>>   
>>   /*
>>    * Devices known to require a longer delay before first config space access
>> -- 
>> 2.53.0
>>

