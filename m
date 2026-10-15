Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C58D37F01A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035980; cv=pass; b=Kvt2IbWWugM5dyIT7Zn1Ngn+y042pvudGkj9QtgqgGhcnZrhZSGEJ1SxG3vPGodpUGSH0FO2d1Sz6GhCrqRZWzMKfgQ8A3uIgRvBAI5O3IXlCmJuNs19ZEetFrsbuZzDmpInsY2xtbRL5B0VzjSO8oKFxuzDTwLiabsrjkR3lp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035980; c=relaxed/simple;
	bh=vCYUKF1CW9W6XFavsMsHK0R2Tch2/Pg+Paf9MP4MWg8=;
	h=From:In-Reply-To:Mime-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iF96i9pc6ODx3OPk9f9rf+IfdE86XHjvV3cl0npBqE2ST0kYCgN7+svKpIasfR5e7KSM/sreAzWpplKJshu+CFlCCqES9qCQcDC/PiHW18Gwc5EgZYiDiLZbRoQugvVM7GJH83tx+7XxX8fI3GKaQr9xBHFPvrqFdO/Bekmwev0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=CZPmbOcP; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CZPmbOcP"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b8f5e2ce5eso4387553e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792035972; cv=none;
        d=google.com; s=arc-20260327;
        b=RHJ23VgCfyQq0s8vsowyn0VGnbQBmIH8m6zEmlCJbtkdw709UKZY3b/1YsttLf0c2B
         Y7ncWAj4c/mWGNR3CLZvnNeDU+V53pFbb2WmEiuMjNcpvbkGJDl4YD+ScNt8N83H0WVk
         P8Sg8RXDiHjzvCeny/m1cHxq8CD4FHCc34V4ET8gQK7YvlNmuuVWoh0Q52rKRLU8skFa
         v3ZKFq1n8IZ51FuLUBsQ1bK/TNZ4RxWLVQJ5coGaujDWR3gzGEgTPgUw4v+InvM/19cF
         UM41Lr0tz1ONBKgJHovgFrAXV8laQOx4gqUgACIk9Yhuvhja+5nb+DH/KhZIShhbXDMT
         XzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:user-agent:dkim-signature;
        bh=d+21BlRaonYej0puQeH33HEePTVzDShA+6xV7c9sZ/A=;
        fh=6XEo9uj+qDPajY0WKx8/V22jJg5pmzeDhhadIeuPgZY=;
        b=GhBszNFFlezs9AmhX0U5ciWsIfF98EM6BUP/GyjXFR33u3Hbs1QEj5IIdN3+fBtoyh
         Um8MtygJWIFRoM0Wr0APlGk2XQY3w5Ydws/T4ZdTRClAx0jNlWk28RmZqI4Xy86k7Iwl
         P3g9BpDYyNRml0dDFkmx0HZ+2V/Z37W9iDHbz5qLXOYDz/26oFJKvTapUQ1JhRvgMgJ2
         lI9gjV7aG7QWQ8AvW+Mam4CFhX4g347CgaKuAaNIaN6oPzrhUwc3gNaKbb5xhu9+uKvN
         UNsqE6xCT5LCLrbd8VdKR1niKgZ6AEi09xsnSgbSYRRKr4Xfxo6lRhFOhnKicKbhG7bh
         hfpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792035971; x=1792640771; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:mime-version
         :in-reply-to:from:user-agent:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d+21BlRaonYej0puQeH33HEePTVzDShA+6xV7c9sZ/A=;
        b=CZPmbOcPdjB0z7h7IKu8+xnKwZW01fAjIaeDdtQAUmRIaz4kMud4npNVVjvKzO+8we
         VAPHsX9pNwv5Gatxg22VeHyyPnmVAYjoYjyY0kDko5H+nxjFljhOOINzxoAtSiYzXDwK
         +VvGqkasOiNb5un47ipUHJvm0AYDGGwnxmtJR2dQp+fehLSUuhqdjtTCZzisahwxWVYC
         hNaDyYRnkxahXAdJIGLrV9pnWBXPvOdWV0kID7cTsqYFuEjFFsvUrr5mr22Nu/+bJygf
         5YsBsZEw7k4W3TjFaWY8OIlDqblimwJvpK+sYirsuG/GkZCclbzMhaO/BoYKCIWhmRoi
         YrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035971; x=1792640771;
        h=content-type:cc:to:subject:message-id:date:references:mime-version
         :in-reply-to:from:user-agent:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d+21BlRaonYej0puQeH33HEePTVzDShA+6xV7c9sZ/A=;
        b=xSGcQnn8gFQX1GQZdcZaNupuphq2/JmXliH/I4sMsKs3akSSYVMbcYoQaN3PdvudVW
         5Stjlg8PtqO7WVM4U4gfNXw8IJUraqW/EYhKJ2VW4L3VopBSm+O5s6q1WYl02ZvfUo/y
         c6Tw29qOmWR98jtPOPcMN1NOa+5++YQ2yxe66fSX+RJSq7GO5BG4dHxy1ojGXS2Zt0W5
         A99mzrhFwxKkwLq3N2N6+b6Wj/pMwKy1/GZipODxX4k53XgLykRA3ZwrA8DBlemEJ2oK
         80Mw8QVCcWBvNch7OiG3tEDcJug/+fnfcP3bhMtCpxuvwZIXHXiUME9ezjFMcYvZk+vM
         tmEw==
X-Forwarded-Encrypted: i=1; AKwUvBx9SEnB/wKou1K0a/2T9DlMmE4WoGdNlhT4RnO9h8kRCTQuMHrQb8WyTZx6h+RvW21X9KQeNDYmb+Cj5PE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkbOzS13aqt7yyDVuLyziKyGaVtn7V6D6wpMbnzMJcQ0f7eZAB
	g2/vZ5aEjz1usRWt0iZ2Azabu00WbrEaNcA2jOmwV+ca99P+zAm3dbb0DzQA0YNtfuhtW6oKw0Y
	lQxGN/7xs+tvNhQks2v+jw+PafRjnMg3mrJO7MmfjjA2KY3UNf7gE
X-Gm-Gg: AYBFou1iikq9aj6OSfiXVMqugCNWaVjEAQ+gEcDB/5BT4ocRuflKAgfbjPXP1rDW4IN
	rridIWdk8MrKDcq/5oMnZZXx5aDveP76psGPlvJuLFI2gqt4zhy66LNWvFvK3cGkwIa3dfsBx36
	T9BEI0HBh/LVpyYmpi5Oz/W+xxyIU1aJA15xQS4wI0kP0cdAwEvG9EjnS9b2YKQ55nOGb9oPAaZ
	csJYQqvD2fZnAnLRKAAx9PI7NMXr8In7gI5COqhLgaEsVs58fHr/lnrTEAzz/MQ2LdFjiGURqI9
	EW+m4l6pk7vx3huXs7AzRHttKY66I+lOiSX3c8MmyBtPlu/Sa2TaZzhB
X-Received: by 2002:a05:6512:3c8c:b0:5b8:f52b:8119 with SMTP id
 2adb3069b0e04-5bcde6c3488mr6491386e87.28.1792035971468; Wed, 14 Oct 2026
 20:46:11 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 14 Oct 2026 20:46:09 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 14 Oct 2026 20:46:09 -0700
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <8557363f-c051-4267-9fbc-f4cbb13ac35e@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <arKx__kOPe4B5gDW@agluck-desk3> <8557363f-c051-4267-9fbc-f4cbb13ac35e@arm.com>
Date: Wed, 14 Oct 2026 20:46:09 -0700
X-Gm-Features: AclHuK-ifaTyE672LcfsNG1D0uvyO2aZ3Fent-KaK1PQbFh3W9LBjWXPCPycr_o
Message-ID: <CACnXVnfJvJXm58TRd92q0j2FuAt8=SYLvXn_8aYk9qNoBFj+Zw@mail.gmail.com>
Subject: Re: Resctrl and I/O
To: James Morse <james.morse@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Luck Tony <tony.luck@intel.com>, 
	xiaqinxin@huawei.com, reinette.chatre@intel.com
Cc: x86@kernel.org, iommu@lists.linux.dev, linuxarm@huawei.com, alex@ghiti.fr, 
	corbet@lwn.net, tomasz.jeznach@linux.dev, robin.murphy@arm.com, 
	fustini@kernel.org, baolin.wang@linux.alibaba.com, aou@eecs.berkeley.edu, 
	pjw@kernel.org, linux-kernel@vger.kernel.org, babu.moger@amd.com, 
	wangzhou1@hisilicon.com, linux-riscv@lists.infradead.org, will@kernel.org, 
	joro@8bytes.org, kevin.tian@intel.com, yuanzhu@bytedance.com, 
	cuiyunhui@bytedance.com, zengheng4@huawei.com, palmer@dabbelt.com, 
	shuah@kernel.org, ben.horgan@arm.com, Dave.Martin@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi all,

Thank you for the helpful discussion, and sorry for the late reply.

On 9/24/26 1:13 AM, James Morse wrote:
> Hi Tony,
>
> On 22/09/2026 17:51, Luck, Tony wrote:
>> Patches for ARM[1] and RISC-V[2] are both at RFC status.
>>
>> They appear to be based on similar h/w capabilities where architecture
>> specific tags can be added to transactions from I/O devices by the IOMMU
>> servicing the device. Device enumeration is handled outside of the resctrl
>> file system.
>>
>> ARM docs say "the device name is the one listed under /sys/kernel/iommu_groups/<id>/devices/"
>
> I think using existing stuff in sysfs is a good idea.
> (Creating new things in sysfs fills me with dread!)
>
> ARM/MPAM also has platform devices that can add the CLOSID/RMID metadata.
> e.g. the GIC ITS [4] - a kind of translator for MSIs.
>
> For these we considered just using the device name as found in /sys/bus/platform/devices/,
> in the hope that can be tied back to a struct device - and we could add a callback for
> resctrl to configure the device with a CLOSID/RMID.
> (but - I've not seen a use-case for this yet - those devices generate very little traffic)
> >
> Robin M set me straight on the iommu_group:
> Strictly that is the wrong abstraction as devices are in the same group if the
> driver can't stop them communicating, e.g. PCIe peer2peer. This doesn't mean it
> can't tell the traffic apart for CLOSID/RMID labelling.
> I picked this because its the device granularity VFIO works with.
>
> Equally, a device may create multiple streams of traffic, where only the driver
> will know what each one corresponds to.
>
>
> Using iommu_group like this may need a bit more thinking....

I agree. DMA isolation groups do not necessarily match the granularity
at which QoS IDs can be assigned.

> If we can fall back to using a device as seen by sysfs, then the arch differences
> here could be invisible to user-space.
>
>
>> RISC-V says architecture specific device tokens are "devices or device groups"
>>
>> In both cases assignments are made with:
>>
>> 	# echo {device} > {group}/devices
>>
>> So now I'm looking at the capabilities of Intel RDT hardware. I'm ignoring
>> the implementation on the Granite Rapids CPU, and looking at what is described
>> in the RDT Architecture Specification[3]. Here are the highlights:
>
>
>> 1) Enumeration is split between two ACPI tables. IRDT enumerates device groups
>> and provides MMIO addresses to assign CLOSID/RMID to each group.
>
> For ARM/MPAM - this would always be driver specific. The fields may be share a register
> with other things the driver needs to consider.
> The IOMMU abstracts this for its devices, but this is still something the IOMMU driver
> needs to know about.
>
> A driver hook, with a drivers/acpi fallback would be ideal.
>

Building on James's callback suggestion, could the driver responsible
for tagging register supported devices with resctrl? Common resctrl
code could manage token lookup, group membership and assignment
cleanup, while the driver supplies the ID-programming callback.

For illustration:

     static const struct resctrl_device_ops iommu_resctrl_ops = {
         .set_ids = iommu_set_qos_ids,
     };

     /* After the device's tagging state is ready. */
     resctrl_device_register(dev, &iommu_resctrl_ops);

     /* Before releasing that state. */
     resctrl_device_unregister(dev);

For IOMMU-managed devices, the IOMMU driver could handle registration
and the callback, without changes to individual endpoint drivers.
We have an early PoC along these lines, but it is not yet ready for
an RFC.

A full sysfs path would identify the device unambiguously, but can
be long and cumbersome to use. Perhaps a bus-qualified device name under
`devices/`, such as `pci/<BDF>` or `platform/<name>`, could be an
alternative?

The token format, sub-device contexts, hardware-defined groups,
differing ID limits and detailed removal/error handling remain open.
I would appreciate your thoughts on whether this could be a useful
direction for a shared interface.

>
> Do you have arbitrary grouping of devices? e.g. a USB controller and the UART.
> Or would the grouping make some sense to the OS. e.g. all the USB devices behind
> this port.
>
> Having the UART show up when you add a USB controller to a control group is a bit odd.
>
>
>> ERDT provides
>> MMIO addresses to read event counts for RMIDs and to configure cache allocation
>> bit masks and memory bandwidth limits.
>
> Arm's IOMMU does have controls/monitors that match the spec the MPAM driver needs,
> but we currently have no way to expose them through resctrl.
> The caches on the IOMMU are also relatively small - I've not yet seen anyone show that
> setting the controls there makes a big difference.
>
>
>> 2) All I/O monitoring and control is with respect to I/O caches, not to the L3
>> caches that legacy RDT features operate on.
>
> Do you have I/O traffic that can turn up in the CPU L3 cache? I think PCIe calls
> this 'cache stashing'.
>
> Arm's IOMMU is the same - but the traffic may also show up in the L3 depending on how
> the system is put together.
>
>
>> 3) The number of RMIDs supported for I/O is lower (maybe considearbly lower)
>> than the number supported for CPU monitoring.
>
> MPAM can have this happen - and today it will sanitise the values to the lowest
> common value. Considerably lower becomes considerably upsetting!
>
> I'd be interested if we have an approach for this - the IOMMU designers would argue
> they only need one RMID per device - but the system wide sanitised value means they
> have to match the rest of the system.
>
>
> For MPAM systems this shape is a big headache because on the platforms we've seen,
> the monitoring is done at the memory-controllers - so any RMID spaces get joined
> up eventually.
>
>
>> 4) Monitoring events are I/O cache occupancy, total i/o bandwidth, and i/o miss
>> bandwidth.
>>
>> 5) Current revision (1.4) of the specification doesn't include details of
>> I/O memory bandwidth control (The "IBAD" subtable of ERDT is reserved for this).
>>
>>
>> Fitting this into resctrl
>> -------------------------
>>
>> RISC-V description of "architecture specific device tokens" sounds great.
>> I'll have to find some ares of /sys to provide the mapping of tokens to
>> "device groups".
>> There's no association with IOMMUs, so this will be some
>> other path in /sys. Perhaps under /sys/firmware/acpi since the data comes
>> from ACPI IRDT table.
>
> What about using the device behind the IOMMU instead? Presumably the kernel
> could allocate ids that don't clash with those in the IRDT, and use those
> for the IOMMU.
>
>
>> Need an info file to tell users the format and source for device tokens.
>
> I'd prefer we have one consistent way of doing this across architectures.
> Especially if we're going to add something new to sysfs.
>
>
> The sysfs path probably covers all bases - but I wouldn't want to parse that
> in the kernel.
>
>
>> I'd like to avoid limiting resctrl monitoring of CPU activity due to the small
>> number of I/O RMIDs. Perhaps don't include a "devices" file or mon_data/{i/o
>> events} files in resctrl group directories when rdtgroup::mon::rmid >=
>> num_io_rmids? But that feels clumsy.
>
> I had a half baked idea on how to do this. (which Ben has poked some holes in)
>
> Assigning a device to a ctrl/mon group needs to be able to fail. We can use this
> to re-allocate the RMID into the range the new device can use. The CPU tasks can
> be repainted to use the new value - but the obvious problem is the old data in
> the caches that uses the old RMID.
> As no new traffic will be generated for that RMID, it might be possible to keep
> it associated with the ctrl/mon group (which would now have two RMID) to keep the
> user-space view of the counters correct until the old RMID falls below the
> reallocation threshold, and it can be free'd.
>
> It's worse if we ever needed/wanted to do this with CLOSID. Two CAT bitmaps
> can be configured the same - but MBA doesn't alias in the same way. Tasks would
> be able to burst higher than the configured limit - but the size is limited by
> the size of the caches. And if no new traffic can be generated with the old
> CLOSID/RMID, then the effect can't be made to last forever.
>
>
> For a totally wild suggestion (that I don't think works here) - I had
> mooted having a second mount of resctrl for islands of the SoC where the
> properties are different. I don't think it works in this case as the IO-RMID
> presumably gets seen by some other monitors later.
>
>
>> Domains are based on I/O L3 cache instances. So a new rdt_resource with
>> new line in the schemata file for IOL3 cache masks per domain. In the
>> future when there are I/O MBA controls, new line(s) for those too.
>
>
> Thanks,
>
> James
>
>
> [4] https://support.arm.com/documentation/ihi0069/hb/?lang=en search for "MPAM" in the pdf.
>
>>
>> [1] https://lore.kernel.org/linux-iommu/20260901140802.1215508-1-xiaqinxin@huawei.com/
>> [2] https://lore.kernel.org/lkml/20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com/
>> [3] Linked from the bottom of https://www.intel.com/sdm under "Related Specifications", or
>> direct link: https://cdrdv2.intel.com/v1/dl/getContent/789566?erpm_id=1158389_ts1790091453223
>

Regards,

Zhanpeng
