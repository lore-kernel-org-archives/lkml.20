Received: from mail-dl2-f6.google.com (mail-dl2-f6.google.com [74.125.229.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90904190462
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009432; cv=none; b=AQyrP8X0XiW5cjRQF3rUF1b1Tldgu2RKBuOIAssosLSrFUF15pC7CwFe/g6omNWM8xzGODj55RtUbjkFmN81As5rZrGy2Wyt5P0h5dHe0SkgS63WtkdI23DyzC4dwphVQiu1g0DFRtNW3C8vfr/Y1HLapl4BcUUQ92rPrW4GQFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009432; c=relaxed/simple;
	bh=x2YynQf5QeIZRrkedxv+2yvurxy27yAStNz06FpWNSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/eo6GOpVcADJXIHuwuvHdh3X1vQmb5fIR2N11NQGu0l2D1YGw++nWsX9Xb26SPckIP5x4CJ9thEXKREQXb5EtkRJjR8v9S9d6hSObtcfSBBMD7sUkdT1/zKK1sjhHCGelyK+9RCJ8CondBllrXPvParLgQ3om5kdf5b4/+vG4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jqluv.com; spf=none smtp.mailfrom=jqluv.com; dkim=pass (2048-bit key) header.d=jqluv-com.20251104.gappssmtp.com header.i=@jqluv-com.20251104.gappssmtp.com header.b=scIwhXGz; arc=none smtp.client-ip=74.125.229.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jqluv.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=jqluv.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jqluv-com.20251104.gappssmtp.com header.i=@jqluv-com.20251104.gappssmtp.com header.b="scIwhXGz"
Received: by mail-dl2-f6.google.com with SMTP id a92af1059eb24-14b4e009173so129000c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jqluv-com.20251104.gappssmtp.com; s=20251104; t=1792009428; x=1792614228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2meKWCIBZF0eGori/8ZapaGbLe2/nGQXAdZcA61CD7Q=;
        b=scIwhXGz9cCFa5oP6Pdg1cz7vKKn8NWyc6aOo8XaU8Y9O8+26LVu1/Ta0apHhCAByz
         RZJmyISmwY6H4+nh5cuS1qOLPiy6wJ0Ro3fV3NPrSigDaFDLITcBiiDcB7uLZUSYj5MV
         XJ5hGd3uXAfOs9SJuGcIIX5M4Rh2jMaaJDox8CgGk7a9zgIKMa77qwpYN5jaZjb7Q8vr
         kfNM1hWHui/8p4USgR2/xEHAIIEgeRtpF/GA8VOGbUJKFqYixqBgvnzxFWWy8QBrBcTe
         Z2fa/NJHRHI4FV+fxHBOIRQWRbc2YYJtCOoy4C+MGL2NO/4kJsuhMD5hL2wD/pDp6POe
         Cw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792009428; x=1792614228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2meKWCIBZF0eGori/8ZapaGbLe2/nGQXAdZcA61CD7Q=;
        b=G/XCgcJnUIbUCc8gfdJrQUoSPqkW4YeNQ3CfQQrMkdAPouOW6YIP7MirDQ2GqCWbIv
         NNVgCK6NiQFCaZKXehW4cEy5vK3E/sTSV3kNcsts0ytOgW8/bAVPJHPHg4/C3y8gfoa9
         GDraChfXGAsykWiTkI+ozexDKQSL0DkREhuHS0V4wbteXL9qUzNPBeqJNB9UUJZQvrqV
         cCRTAeH1ZcP+ygoU4TnO5wPJamPpqOa9T8SfEeQyijk+zwFVmrOx7pTQQzEijvrb7SpY
         0uZHj0I0St5Kp5lHuSDFC4Bth2mEJDbIU/Zm1PIWZLuOXuVf0atQXfrjPeeza/zVf2nQ
         8IBg==
X-Forwarded-Encrypted: i=1; AKwUvBwBd8JfjmLfwdSDqawnLlRM8WUI5dan1uvd2Kw5N6XRRmEkQbhHB3w7hgyfF9QO6vSBuW2QGsjmmIGJoWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmSI6LXjpaop9rv085kjKFRFlj47GM3QetkrRpm9odKDZB+iBs
	v9ILTy9BfRc140CV+bDGY/z7ZrIufecXVJFY3DxrsSawqtu1AFUrCNQ7Usb3EmLNE3g=
X-Gm-Gg: AYBFou3M8cFTwev0PD9m3hj8vLH2lP32xbecv/nYt2HefpnGzB3OexrINRXrzwPSl4m
	E7dH74M0jbvaiqgItF1Vj2QWTcc/KHoESqoOMzfF3xb870dZ6uWzKdJihlIQuri9AkJ7GKXXLah
	UUaN50bZ3oWQ3kdwzvbpzVZvaoDJBc1zeLHRsM0r0mo602wL7Pv7RfHsM+0moBk/E5Ppndb6xac
	7qoUH6yBCZaAYcwz2wVqD7tbfGbF4ldEyqG0O0c+tqQsVBhs0JA4OjVJWLNj9JBtWj8Dp0+8z67
	/fP8a2dhuV1AD52evX38DQBR2RxR8X746svaKw+a/EiiHrPh7WuoZiXY3sYHZAFsgvuKmw5Ngcj
	HMkOIWUkMOFVdmCSENTkl7ctflWDVwQJ6DJjiYfCWkww0FGrfMyruM26RL1ZWPbFp8ipIPnF9cf
	SRg1oYAOV0++kKoAm8tZc3bxcBNfOwk02yNv1AHwXCnDJz3jpAZ04pmO5EdGnbE9fg7AekeEbBO
	LXQipiegF503BgyV9VQIpBzWG/a74rrZUtJrvQA5EnKmkS3nxrYzj5Hl3+S9YKjXowU
X-Received: by 2002:a05:7022:ed06:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-16a5ac102d3mr20692656c88.4.1792009428065;
        Wed, 14 Oct 2026 13:23:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:1782:ba0:9133:6daf:392a:d146? ([2600:1700:1782:ba0:9133:6daf:392a:d146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm46444041c88.4.2026.10.14.13.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 13:23:47 -0700 (PDT)
Message-ID: <e3b179b4-ce8e-4158-8bdd-8cd8de8c6aaa@jqluv.com>
Date: Wed, 14 Oct 2026 13:23:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] PCI/quirks: Avoid certain address on Genoa systems
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Maciej Grochowski <Maciej.Grochowski@sony.com>,
 Nikolas Joshua Britton <nbritton@exabit.io>, Eric Auger <eauger@redhat.com>,
 Alexey Fomenko <alexey.fomenko@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 LKML <linux-kernel@vger.kernel.org>, Bradley Morgan <brads@mainlining.org>,
 Kai-Heng Feng <kaihengf@nvidia.com>, linux-acpi@vger.kernel.org
References: <20261013224010.GA1589480@bhelgaas>
 <f823d264-8b9d-422e-bfaf-388957fbc2fa@kernel.org>
 <as9eqFRuiMgG-fhG@ashevche-desk.local>
 <92d10658-15af-c9b0-5e4a-69992920fd1b@linux.intel.com>
 <as-EghzVdmmbMGPI@ashevche-desk.local>
Content-Language: en-US
From: Geramy Loveless <gloveless@jqluv.com>
In-Reply-To: <as-EghzVdmmbMGPI@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As I recall, on Windows, when I tried to pass through a GPU, it read the PCIe Extended Configuration Space during boot, unlike on Linux. I can provide QEMU pcie analyzer logs if anyone is interested. You can essentially debug the pcie protocol this way and find the difference in how the two boot from a reverse engineering perspective. (sorry for the resubmit html kept getting included)

On 10/14/26 6:32 AM, Andy Shevchenko wrote:
> On Wed, Oct 14, 2026 at 02:17:36PM +0300, Ilpo Järvinen wrote:
>> On Wed, 14 Oct 2026, Andy Shevchenko wrote:
>>> On Wed, Oct 14, 2026 at 11:34:44AM +0200, Hans de Goede wrote:
>>>> On 14-Oct-26 00:40, Bjorn Helgaas wrote:
>>>>> On Tue, Oct 13, 2026 at 01:59:23PM -0500, Mario Limonciello wrote:
>>>>>> On 10/13/26 12:26, Ilpo Järvinen wrote:
>>>>>>> On Tue, 13 Oct 2026, Mario Limonciello wrote:
>>>>>>>> On 10/13/26 12:00, Mario Limonciello wrote:
>>>>>>>>> On 10/13/26 08:09, Ilpo Järvinen wrote:
>>>>>>>>>> While testing the resource placement changes, tests hit a case where
>>>>>>>>>> igb fails to probe when BAR 0 is placed at 0x9c000000:
>>>>>>>>>>
>>>>>>>>>>      90000000-9cffffff : PCI Bus 0000:a0
>>>>>>>>>>     -  90000000-902fffff : PCI Bus 0000:a1
>>>>>>>>>>     -    90000000-900fffff : 0000:a1:00.0
>>>>>>>>>>     -      90000000-900fffff : igb
>>>>>>>>>>     -    90100000-901fffff : 0000:a1:00.0
>>>>>>>>>>     -    90200000-90203fff : 0000:a1:00.0
>>>>>>>>>>     -      90200000-90203fff : igb
>>>>>>>>>>     +  9be00000-9c0fffff : PCI Bus 0000:a1
>>>>>>>>>>     +    9be00000-9befffff : 0000:a1:00.0
>>>>>>>>>>     +    9bf00000-9bf03fff : 0000:a1:00.0
>>>>>>>>>>     +    9c000000-9c0fffff : 0000:a1:00.0
>>>>>>>>>>        9c100000-9c17ffff : amd_iommu
>>>>>>>>>>        9c180000-9c1803ff : IOAPIC 8
>>>>>>>>>>
>>>>>>>>>>     -       Region 0: Memory at 90000000 (32-bit, non-prefetchable)
>>>>>>>>>> [size=1M]
>>>>>>>>>>     -       Region 3: Memory at 90200000 (32-bit, non-prefetchable)
>>>>>>>>>> [size=16K]
>>>>>>>>>>     -       Expansion ROM at 90100000 [disabled] [size=1M]
>>>>>>>>>>     +       Region 0: Memory at 9c000000 (32-bit, non-prefetchable)
>>>>>>>>>> [size=1M]
>>>>>>>>>>     +       Region 3: Memory at 9bf00000 (32-bit, non-prefetchable)
>>>>>>>>>> [size=16K]
>>>>>>>>>>     +       Expansion ROM at 9be00000 [disabled] [size=1M]
>>>>>>>>>>
>>>>>>>>>> igb 0000:a1:00.0 0000:a1:00.0 (uninitialized): PCIe link lost
>>>>>>>>>> ------------[ cut here ]------------
>>>>>>>>>> igb: Failed to read reg 0x18!
>>>>>>>>>> WARNING: drivers/net/ethernet/intel/igb/igb_main.c:724 at
>>>>>>>>>> igb_rd32.cold+0x3c/0x4f [igb], CPU#32: kworker/32:1/706
>>>>>>>>>> ...
>>>>>>>>>>    igb_get_invariants_82575+0xff/0xf00 [igb]
>>>>>>>>>>    igb_probe+0x3c8/0x1190 [igb]
>>>>>>>>>>    local_pci_probe+0x3b/0x80
>>>>>>>>>>
>>>>>>>>>> It turns out there is a 64kB iomem black hole at 9c000000 that returns
>>>>>>>>>> ~0 and this is where igb's BAR 0 resides. If another BAR of the same
>>>>>>>>>> card is placed into that address, it is similarly black holed.
>>>>>>>>>>
>>>>>>>>>> Mark the problematic 64kB range reserved using a quirk bound to the
>>>>>>>>>> bridge found in the problematic system.
>>>>>>>>>>
>>>>>>>>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222074
>>>>>>>>>> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>>>> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>>>>>>>>> ---
>>>>>>>>>> Cc: Borislav Petkov <bp@alien8.de>
>>>>>>>>>>
>>>>>>>>>> As an alternative to this, I've also tested reverting the commit
>>>>>>>>>> 07eab0901ede ("efi/x86: Remove EfiMemoryMappedIO from E820 map") and
>>>>>>>>>> that also resolves the issue by retaining "9c000000-9cffffff : Reserved"
>>>>>>>>>> entry in the resource tree.
>>>>>>>>>>
>>>>>>>>>> ---
>>>>>>>>>>    arch/x86/pci/fixup.c | 36 ++++++++++++++++++++++++++++++++++++
>>>>>>>>>>    1 file changed, 36 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/arch/x86/pci/fixup.c b/arch/x86/pci/fixup.c
>>>>>>>>>> index b301c6c8df75..cc463bf492b6 100644
>>>>>>>>>> --- a/arch/x86/pci/fixup.c
>>>>>>>>>> +++ b/arch/x86/pci/fixup.c
>>>>>>>>>> @@ -822,6 +822,42 @@ DECLARE_PCI_FIXUP_RESUME(PCI_VENDOR_ID_AMD, 0x1571,
>>>>>>>>>> pci_amd_enable_64bit_bar);
>>>>>>>>>>    DECLARE_PCI_FIXUP_RESUME(PCI_VENDOR_ID_AMD, 0x15b1,
>>>>>>>>>> pci_amd_enable_64bit_bar);
>>>>>>>>>>    DECLARE_PCI_FIXUP_RESUME(PCI_VENDOR_ID_AMD, 0x1601,
>>>>>>>>>> pci_amd_enable_64bit_bar);
>>>>>>>>>> +/*
>>>>>>>>>> + * TODO: Remove when/if root cause is found.
>>>>>>>>>> + *
>>>>>>>>>> + * Genoa appears to have a 64kB iomem black hole starting at 0x9c000000
>>>>>>>>>> + * address for which all reads return ~0 blocking an overlapping BAR from
>>>>>>>>>> + * working.
>>>>>>>>>> + *
>>>>>>>>>> + * Work around the problem by reserving the space prior to making any
>>>>>>>>>> iomem
>>>>>>>>>> + * allocations that could overlap with the black hole.
>>>>>>>>>> + */
>>>>>>>>>> +static struct resource genoa_black_hole =
>>>>>>>>>> DEFINE_RES_MEM_NAMED(0x9c000000,
>>>>>>>>>> +                                   SZ_64K,
>>>>>>>>>> +                                   "reserved");
>>>>>>>>>> +
>>>>>>>>>> +static void genoa_iomem_black_hole(struct pci_dev *dev)
>>>>>>>>>> +{
>>>>>>>>>> +    struct resource *r;
>>>>>>>>>> +
>>>>>>>>>> +    pci_bus_for_each_resource(dev->bus, r) {
>>>>>>>>>> +        if (!r || !r->flags || !resource_assigned(r))
>>>>>>>>>> +            continue;
>>>>>>>>>> +
>>>>>>>>>> +        if (!__resource_contains_unbound(r, &genoa_black_hole))
>>>>>>>>>> +            continue;
>>>>>>>>>> +
>>>>>>>>>> +        if (resource_assigned(&genoa_black_hole))
>>>>>>>>>> +            pci_dbg(dev, "iomem black hole workaround already
>>>>>>>>>> applied\n");
>>>>>>>>>> +        else if (!insert_resource(r, &genoa_black_hole))
>>>>>>>>>> +            pci_info(dev, "iomem black hole workaround enabled\n");
>>>>>>>>>> +        else
>>>>>>>>>> +            pci_dbg(dev, "iomem black hole workaround add failed\n");
>>>>>>>>>> +        return;
>>>>>>>>>> +    }
>>>>>>>>>> +}
>>>>>>>>>> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_AMD, 0x14ab,
>>>>>>>>>> genoa_iomem_black_hole);
>>>>>>>>>> +
>>>>>>>>>>    #define RS690_LOWER_TOP_OF_DRAM2    0x30
>>>>>>>>>>    #define RS690_LOWER_TOP_OF_DRAM2_VALID    0x1
>>>>>>>>>>    #define RS690_UPPER_TOP_OF_DRAM2    0x31
>>>>>>>>>
>>>>>>>>> I guess it's good we know the root cause is 07eab0901ede. If we're going
>>>>>>>>> down the path of making holes in that we may well put the hole in
>>>>>>>>> efi_remove_e820_mmio() like this (attached).
>>>>>>>>
>>>>>>>> I don't really like that though.  If Genoa is affected I would expect plenty
>>>>>>>> of other machines are too they just haven't been found yet.
>>>>>>>
>>>>>>> That's what I'm worried as well. My own testing can only cover very little
>>>>>>> ground here.
>>>>>>>
>>>>>>>> Can we roll back 07eab0901ede and add quirks for the busted machines instead?
>>>>>>
>>>>>> I had an agent dig through all the reports linked in 07eab0901ede and
>>>>>> drafted up what should be the remaining quirks for a revert.
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git/log/?h=superm1/genoa-mess
>>>>>>
>>>>>> Bjorn, thoughts on this?  I'll send it out if that's the way we want
>>>>>> to go (or Ilpo feel free to subsume into your series as it's only
>>>>>> really exposed by your series at the moment)
>>>>>
>>>>> I would LOVE it if we can use those patches because it's way less
>>>>> magic than 07eab0901ede is.
>>>>>
>>>>> But I'm frankly terrified to touch it because I'm skeptical that two
>>>>> more quirks are enough.  I just expect that whatever strategy BIOS
>>>>> uses to build these maps is likely to be used on many models.  I do
>>>>> hate 07eab0901ede though, so I would love to see it gone.
>>>>
>>>> It has been about 4 years since we came up with 07eab0901ede IIRC we
>>>> had a huge email thread with a whole bunch of attempts at fixing
>>>> the issue in a generic manner.
>>>>
>>>> IIRC some of those attempts tried to identify the exact problematic
>>>> issue the quirks try to fix where there is an EFI MMIO reservation
>>>> covering the entire bridge window.
>>>>
>>>> Maybe we can dig through the old thread and see if with the knowledge
>>>> we have now one of the previous attempts of fixing it from the thread
>>>> is better?
>>>>
>>>> I agree that needing to go back to quirks is likely going to be painful
>>>> and break a whole bunch of other systems. IIRC 07eab0901ede fixed
>>>> a whole bunch of laptops having issues around the time not just
>>>> the Clevo NL4XLU and Lenovo Yoga C940. But this info might be spread
>>>> over various bugzilla entries, etc. + some models where likely never
>>>> reported but just fixed in time for users to not report things.
>>>>
>>>> I also wonder if given we only have this magic black-hole on geneo/zen4
>>>> if it would not be better to go with Mario's original approach here ?
>>>> Esp. since Mario's quirk is chipset based where as the other problems
>>>> seem to be model/product based so that is 1 quirk vs many quirks.
>>>
>>> Can we simply change the algo of allocating resources to follow what Windows
>>> does?
>>
>> I've no idea what it does.
>>
>> You seem to simplify things to just being about direction of allocation 
>> but there are other constraints, most importantly alignment ones.
>>
>> There are many cases where there simply isn't any extra room to play with
>> so the algorithm must produce as tight packing as possible.
>>
>> The assignment step is greedy that could easily lead us into dead ends 
>> where not all resources can be assigned because something was placed such 
>> that it is on the way. This series of mine tries to make placement such 
>> that it maximizes success possibility of subsequent assignments (leaving 
>> the best free space candidate for future assignments). Side-effect of 
>> these changes is that more allocations do happen at the tail (to maximize 
>> the alignment order of the free space, that is usually larger at the left 
>> edge/start of the window). So maybe you actually end up getting what you
>> wish in many cases.
>>
>> Retrying anything in controlled manner is also challenging. This might be 
>> fixable on medium term by holding some setup structure across algorithm 
>> "tries" but currently we hold nothing else than what's in the struct 
>> resource and in/not-in-resource-tree information.
>>
>> Changing anything in this area hasn't been easy at all because almost 
>> everything seems to break something (in part it's my own bugs but there 
>> are also many cases I just could not foresee nor encounter in my tests).
>>
>> So I'm sorry don't think any large scale rewrite would be viable.
> 
> I understand. Thanks for providing the explanation for the reason behind
> your series.
> 

