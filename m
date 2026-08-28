Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6E1287247;
	Fri, 28 Aug 2026 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923860; cv=none; b=jX/QD4duw2lSg1nF4OGXnmzrIYyeCzbO+FQTtWdhxu/2xxo4/vFtTybFmHJGdAToyvRxP/rniVCcE5YymMaKIoiQGZneuAURh/rFbKcyy62GRsJCWEFrEqSW3Exrfii41hLFMmbXxrhohZYUx9FYG3o/0eESGjH8YmzbZ22mrnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923860; c=relaxed/simple;
	bh=nPbBLDVeV+A69NA0G6ETeX5d52904YSCbDT3lyPgAIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=brk8WvvGDbtmwcNoN8Oeg4YynyFcRYlJUFBCJeclHeSfMUuxbk3NwyPvqz2xr/pa1b0UyBEGmJcDOueQaOOux9g2xkV/lWIKojvGQCzOPXHNajZshFyGmhbTJVmV9ghZmYoUGDbMU+bwbH/pilCQdG9yXHBWTPEeFRvPNX2iEwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ab0e2cf4a2e411f19a56ed5b684f684d-20260828
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:68587b0d-f28d-43a4-a6ba-6da6dc04a679,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:7816847fd6413e5ff3abab754726e512,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|817|865|898,TC:nil,Content:-10|-8|
	-5|15|50,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab0e2cf4a2e411f19a56ed5b684f684d-20260828
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1300583132; Fri, 28 Aug 2026 21:30:43 +0800
Message-ID: <2b516460-858a-43d2-a42b-a1b1194c8cb3@kylinos.cn>
Date: Fri, 28 Aug 2026 21:30:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: usb-audio: Fix boot-time audio stuttering for
 USB Audio device
To: Michal Pecio <michal.pecio@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, kees@kernel.org, chengordon326@gmail.com,
 jussi@sonarnerd.net, hulianqin@vivo.com, i@rong.moe, g@b4.vu,
 cryolitia@uniontech.com, pav@iki.fi, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260728111309.1271834-1-zhangheng@kylinos.cn>
 <20260816180147.2e5f01d1.michal.pecio@gmail.com>
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <20260816180147.2e5f01d1.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Hi,
> 
> Adding linux-usb.
> 
> On Tue, 28 Jul 2026 19:13:09 +0800, Zhang Heng wrote:
>> This USB Audio device (0x1e0b:0xd01e) exhibits audio stuttering
>> during boot when playing audio. Once the system is fully booted,
>> playback is normal.
> 
> Weird, your thread runs horribly slowly (preempted by something despite
> spin_lock_irqsave held by xhci-hcd?) during those URB submissions. It's
> first time I actually see this warning:
> 
> [    9.654586] xhci_hcd 0000:03:00.3: Frame ID 644 (reg 5154, index 13) beyond range (645, 1539)
> [    9.654589] xhci_hcd 0000:03:00.3: Ignore frame ID field, use SIA bit instead
> [    9.655053] xhci_hcd 0000:03:00.3: Frame ID 644 (reg 5158, index 14) beyond range (645, 1539)
> [    9.655055] xhci_hcd 0000:03:00.3: Ignore frame ID field, use SIA bit instead
> 
> If packet 14 was scheduled for frame 644, packet 0 must have been
> frame 643 i.e. uframe 5144 (should be frame aligned). So packet 14 was
> uframe 5158 - it was only being written to HW while it was already
> due for execution, some 2ms after usb_submit_urb() began. ???
> 
> URB execution won't even start until all packets are written - we do
> take care to queue URBs atomically. Initial part of this URB (before
> the warnings) will complete with -EXDEV status due to blatant isoc
> scheduling threshold violation, but the rest (with SIA bits) will be
> delayed by HW and completed normally after submission finishes.
> 
> The same may happen to the next URB if the condition which caused this
> persists, and moreover, the next URB may be scheduled with a gap after
> the previous one.
> 
> IDK how snd-usb-audio would react to such a mess. It is believed, at
> least by the USB subsystem, that drivers expect contiguously submitted
> URBs to execute in contiguous service intervals, without gaps.
> 
> FYI, a lot of this xhci-hcd logic is considered broken and goes out
> the window in v7.3. I'm curious if you could test how things work on
> usb-next without (and maybe also with) your workaround code.
> 
I tested this on the original version without this change,
and the performance was quite poor.
However, I am not familiar with this area,
so I cannot provide a professional explanation.

In fact, I originally debugged this issue on the 5.4 stable branch,
and it worked basically fine even without this change.
The most important part is the fix below.
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/log/?h=usb-next
> 
> This removes the automatic conversion to SIA/ASAP and insertion of gaps
> between URBs, so that the initial URB will likely wholly complete with
> -EXDEV and the next one will be scheduled immediately after it.
> 
> Again, what snd-usb-audio will think about it IDK, but usb-next mostly
> works for me in my test (one remaining exception I'm trying to fix).
> 
>> The device reports its isochronous endpoints with the Asynchronous
>> sync type (bmAttributes = 0x03), which causes the driver to
>> calculate nurbs = min(max_urbs, ...) = 3, providing only ~16ms
>> of buffering. During boot, the higher system scheduling jitter
>> (e.g., from init scripts, device enumeration, and driver probing)
>> can exceed this buffer depth, causing audible stuttering.
> 
> Not sure what causes it, xhci-hcd holds a spin_lock_irqsave() during
> the whole submission, so I think it shouldn't get preempted.
> 
>> This patch adds a device-specific quirk (QUIRK_FLAG_PLAYBACK_URB_FIXUP)
>> that applies two changes for this device:
>> 1. Forces nurbs to MAX_URBS (12), providing sufficient buffering
> 
> I actually wonder why snd-usb-audio seems to allocate only one URB per
> period and then submit URBs shorter than a period. Doesn't this mean
> that all URBs may be busy without covering the whole playback buffer,
> and then newly written samples have nowhere to go until one completes?
> 
> This seems to increase risk of URB queue underrun, though TBH I tried
> increasing 'nurbs' and I haven't seen much practical difference running
> with very low latency like 2x250us or 2x500us.
> 
> Note: on USB 3.1 and newer such settings may only work on usb-next.
> 
>> 2. Sets URB_ISO_ASAP flag for more consistent xHCI scheduling
> 
> URB_ISO_ASAP or xHCI SIA do the opposite of consistency - they cause
> execution to be delayed until the URB is written to the HW and the HW
> reaches it.
> 
> Non-ASAP submissions are scheduled contiguously and possibly complete
> with -EXDEV if submitted too late. Only after the last completion of
> the last remaining URB returns, will the next URB be scheduled
> separately and discontiguously, to execute in some (near) future.
> Again, this is documented usb_submit_urb() rule and it's believed that
> drivers expect it. It's how OHCI/UHCI/EHCI drivers work.
> 
> Using ASAP is a known workaround for the old xhci-hcd bugs, similar
> patches have been sent to linux-usb, that's why it's being fixed. But
> IDK if usb-next will solve your bizarre edge case out of the box.
> 
> Regards,
> Michal
