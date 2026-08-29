Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB3D328611;
	Sat, 29 Aug 2026 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996101; cv=none; b=rQmPFDgIy49IopD4yi84fQ4it3e72YJCTsOjPsrxaI6qhh40WXMnWtT68dhnmbGhtQChUtGCH7lGVlRgs8HYbcYmywlFVy6Dqr07uWjaSm5+gz8aNuVINJ8XoA5xH6Dub1vuYQR0JbNR5nFbmnmW5kwVcYefj55/JNqRgM+cyiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996101; c=relaxed/simple;
	bh=BR/LqOPk0RDAOLrsALcIpnNEQFYMLtvBgIIirpHr8wI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XRu2rMAGocD1N2klUc31NvtjV90M1R6YSeMxpaPj9yzjg8SlsH5yjs+8i9Dj/7Fb11A4qpAJW+3dNLXvLf/ZbwqIk7PUAaq6Cv41mbY1OsSbjYhNB/wlBj4IcBlGQS7hyPRRNqRzaemzW1M8FWXmBFyj0oi5e+nSrxQgEw2zVs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=cJV/dhe0; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="cJV/dhe0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787996067;
	bh=0PuWcwip6JcJo9sARTYnMIqkzQJvUceiNAvwxSOqEdU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To;
	b=cJV/dhe0PkAo+29kPJtmNVx55dWgc3sfCGNG1oGHbl4mWuQZMrxEFqBVhzNVzXPQC
	 sQmFaccGS9DcBKXsYeGQNPmOxtW4ylBr+gwWNv0il5lNrX9NP5MWUscl86YWMNGNW0
	 1H3DaLq84tDA5W2H1ZiYsRM8vi0EOUNYOe18blfQ=
X-QQ-mid: esmtpsz10t1787996063t4f4ae30d
X-QQ-Originating-IP: bHFmHQV2y5Io5Zuo3VJUTChZNFdGAVEBf23y5X+76qc=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 29 Aug 2026 17:34:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2601375684384682277
EX-QQ-RecipientCnt: 6
Message-ID: <4028ADCCD8D1A8F8+ffb2a2cd-1c21-401e-baeb-3d042fbbe484@linux.spacemit.com>
Date: Sat, 29 Aug 2026 17:34:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: Re: [RFC PATCH] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "troy.mitchell@linux.spacemit.com" <troy.mitchell@linux.spacemit.com>,
 "peixin.xie@linux.spacemit.com" <peixin.xie@linux.spacemit.com>
References: <20260811090817.109350-1-panjunzhong@linux.spacemit.com>
 <ao-QDVibwU90yPm_@vbox>
 <8F4C0C8A8DA2D71A+7c57de3c-1f36-4e5b-b5e3-0eeb6ca88006@linux.spacemit.com>
 <apDJbcrAgzcFRLZM@vbox>
Content-Language: en-US
In-Reply-To: <apDJbcrAgzcFRLZM@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MYfgaE2Hdx7cKiuVvA+ITC61TYM2Zxb1qNUXwgcKGhLKqFIRyZQ0gcgd
	59deBlb4x8j+3Pj/ZaNkcMEHZosb7oFsqLfX99vk5YpC7pLMblKcvrkPY+wXtX26NIj/jp/
	4mnmMQjF70bIfPtRFdXpkU3zgYHol+FSy9PpnC6pVsB6BURLGIzhNbpRvcLNvjP8WaD9eX9
	PzP+MsV5WE0gQkwq0MZEZ58KUyLJzbn17Sr3pClo7JJrXFjnZIkz9hHHKa7+T3s8Oka+h0i
	TpM0ryAfuoMGGK02LzNws6WnrtUXJ6+O5hE9yLSJqHNbuO2XD2OKBLT5YXBmOmfY7ND5gxf
	fWUTyDYoXjEma0ORfQrcCDkIoYjcs+GdR9vlzQQO0ESOgiARdc+OhpK5zq9oSmosSlQtppu
	X3GOftUvyOa3jQPPvOHvdR16hkMaYhbHBk603OmIXpLmlKCRL4tBDMKFtB2JJyIbpZxx79N
	oQvVGVrVzdWWO7udOHk4RSXEGSvglxgaMTPi/OnEwJOSuviGSuNtzh6if+KTLPLKFlkwPcT
	ZHDaRE+feTW2x8+mUbds1P5i6iTsfs8kFw+1EfnZfgRrrQpyysAILYzlr5WJ9xigmAdFKNm
	0pUxfKSW3+/aTFktLKd+IWrj6B375NkHzms9YZ5Jkh1h3rurhQCNtLMwMbgdwagAA6C6rl8
	5xpiKF7JBD5Ea3WHT2zK72W5znPAP95aS1K33l+PwS0ZFgaRt66yujg5N20wjw/eR06nUwX
	bGH2By5T4pwOex5zWXxp3j0QH5So/B56aQ/F05ojYeFH0NN7T6w27sZB+RTztDixD4pnHm6
	6nsJEJWScVwGea1OgU8PCYXraicukHEarQWAtOsvhhgzx2qcIfr3nCYmy6TwC00RhqIalBB
	IjEijhQ3A2EqiR1Tubnc24Hj5THOYMDlTfkQrj/mr3I3TN6UtZze1P0uKQfnSgQt4jI6kmu
	zndGbwRcBbotgTszYKiR6828Oj4klf9h63fKWHaPKJnOYptnCWK5+y6WDQFc4ZrF3OVY90P
	VXOc26TRM8I6aie30eKU975F9KDFl504nmb3+jYoHqTVo5SRCHqSRyuNAgiSOwK8mkNoZxL
	A==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Hi Thinh,

On 8/28/2026 7:42 AM, Thinh Nguyen wrote:
> On Thu, Aug 27, 2026, Junzhong Pan wrote:
>>
>> On 8/27/2026 10:11 AM, Thinh Nguyen wrote:
>>> Hi,
>>>
>>> On Tue, Aug 11, 2026, Junzhong Pan wrote:
>>>> USB controller runtime suspend halts the controller on disconnection.
>>>> It relies on platforms with custom connection notification to start
>>>> the controller again.
>>>>
>>>> The host branch of dwc3_runtime_resume() does nothing currently. There
>>>> are two paths that can trigger a runtime resume of the dwc3 core in
>>>> host mode:
>>>>
>>>> (a) Wake lands on the xHCI child (DT platforms, e.g. Qualcomm, i.MX8MP)
>>>>     A platform wakeup IRQ fires and the glue handler calls
>>>>     pm_runtime_resume(&xhci->dev). Runtime PM walks upward, resumes
>>>>     the dwc3 parent first, then resumes xHCI. Both wake correctly.
>>>>
>>>> (b) Wake lands on the dwc3 parent (ACPI platforms)
>>>>     When an ACPI Notify(ACPI_NOTIFY_DEVICE_WAKE) targets the dwc3
>>>>     parent device -- for example via a Generic Event Device on a
>>>>     hardware-reduced platform where dwc3 is enumerated as an ACPI
>>>>     device without a glue driver -- the ACPI core turns this into
>>>>     pm_request_resume(dwc3_dev). Runtime PM does not propagate resume
>>>>     downward, so the xHCI child stays suspended. Root hub polling is
>>>>     never re-armed, and a device plugged in while suspended is silently
>>>>     dropped.
>>>
>>> Good catch.
>>>
>>>>
>>>> This patch fills in the host branch to cover case (b) by requesting an
>>>> async resume of the xHCI child so xhci_resume() can restore the port
>>>> state machine and re-arm root hub polling. Async is required to avoid
>>>> deadlocking on the parent's own rpm_resume() re-entry.
>>>>
>>>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>>>> ---
>>>> base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
>>>>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>>>>  1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>> index ceb49f2f8004..bce56765ad90 100644
>>>> --- a/drivers/usb/dwc3/core.c
>>>> +++ b/drivers/usb/dwc3/core.c
>>>> @@ -2668,6 +2668,18 @@ int dwc3_runtime_resume(struct dwc3 *dwc)
>>>>  		}
>>>>  		break;
>>>>  	case DWC3_GCTL_PRTCAP_HOST:
>>>> +		/*
>>>> +		 * Only the xHCI child's resume re-arms root hub polling, which
>>>> +		 * is what rediscovers a device plugged in while suspended.
>>>> +		 * Runtime PM never resumes children on its own, so request it
>>>> +		 * here. This has to be asynchronous: resuming the child
>>>> +		 * synchronously would deadlock because rpm_resume() tries to
>>>> +		 * resume the parent before the child, and here the parent's
>>>> +		 * own callback has not returned yet.
>>>> +		 */
>>>
>>> This note sounds as if this is needed to all cases, but you're only
>>> describing only case b) here. Can you also mention for case a) that
>>> there maybe an extra resume work call.
>>
>> Will do.
>>
>>>
>>> Would be nice for it to be cleaner without the extra call, but I think
>>> it should be fine.
>>
>> I guess we could do this: after this merged, we patch those platform
>> drivers(case a) to drop their existing workaround hack, dwc3 will
>> take over it's child xhci in this wakeup resume path, they just wake
>> dwc3. That makes things consistent. What do you think?
>>
> 
> That would need to be validated on a case-by-case basis. Also, regarding
> testing, I assume this change has been tested on real hardware. If so,
> which platform(s) were tested?

Yes, I have tested on SpacemiT K3 Pico‑ITX , ACPI boot with a GED
Device to Nofity dwc3 node（HID 808622B7）of wakeup, and also DT boot
cases.

As for the DT boot(using modified dwc3-generic-plat driver), I verified
the extra call is handled well by pm framework checking RPM_ACTIVE. I
will mention this on next send.

I have also tested the extra call removed case by using a similar code
of qcom/imx8mp, but just replace the xhci->dev with dwc->dev, it works
find. But if need to send those patches, testing for regression helps
are still needed from who have these two platforms available I think?

> 
> BR,
> Thinh

Best regards.

