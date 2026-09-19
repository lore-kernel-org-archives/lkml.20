Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7976E19CD0A;
	Sat, 19 Sep 2026 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830273; cv=none; b=QkLScR1uIBt2RWhze/BlI/qpiHGSEvmwJol10C2YE7jgYIS2NvHenVBvlnDns2m7rhT2SOG1snFmud9VssVrsn89DqTMkEiCDtbxM1utj9XGoWLtdq2NpzaPPxSiYdEi8kMywCT4FVOKBB/Z0ABb8YSBq5w0PoUKB/+0IxjwP+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830273; c=relaxed/simple;
	bh=niI7eWjqu3TkzVDd8WS/dn7octYE5D8LzPke4IkgmDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9Xya+u8jPzedv3rzPlG+oS/MIbEXqbBGD2/AN1fSRG2duGx8TR9Xz2CdVzsZVyFzPRHs4v80JHLTIIGAjjTGG1IJdK/U8WGF1R6XZ0MlVnLqFsxEqyG2XZ9Abx5rUj3rDdfCLmZ848PDOrCMfkQ/+UU0VN/WNTR5xKPvZDr7DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=LJCz3//X; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="LJCz3//X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789830197;
	bh=h1WOIRQT0KOUkcpfRIFqCd28qtTzI5G/vlfaczFIm3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=LJCz3//X8xRrUo89TOHgWfPuoJ0VGyCmvcr/BZHHqWcTJZh+/JohCHDyo0FvMYxDP
	 2F5qlyuwaunP2SH074Fzmm9HdClY/BqpZYHSEdQvw9CfBwDHB6RcF6f6ajpcloRPRh
	 rx+FRkHlITkMOZZXQ2eKgA4Cfh7XUCzGliOcIvhY=
X-QQ-mid: zesmtpgz3t1789830190tfdeff35d
X-QQ-Originating-IP: PioUM+UFfuxBWzMSzeGzTOV311erig4aklwdlIG29mE=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 19 Sep 2026 23:03:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11224281374008946119
Message-ID: <B8C4C8F589E42A31+60fc3495-33cf-498d-be73-5165b69947c8@linux.spacemit.com>
Date: Sat, 19 Sep 2026 23:03:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Troy Mitchell <troy.mitchell@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>
References: <20260908-resume-xhci-v1-1-aca107602e9c@linux.spacemit.com>
 <DL9ZZ8F7HTZT.1IUMD1ECSOZXL@linux.dev>
 <566DD22E9074C793+eaef8bb4-9602-4f76-8915-6e322387c7aa@linux.spacemit.com>
 <768D38E96246550E+b63978f5-b8e9-4d3d-883c-f36d79c5da12@linux.spacemit.com>
 <aq3kF_zdTPwkOuZI@vbox>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <aq3kF_zdTPwkOuZI@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NK1jrlzPMOAHF4ymU020VItJtHFV8okpJbkhvAN7RM7l2nuD8ifA7snX
	7QWZh+nTpo7fE8AEb3M24m7SEp++4+Mw1jsXGH3CY+FyMupaQt8xiPhBVT20weIWgGk7O2x
	omJfTm/BQ/c70faubX+VEcpGbPsHoWflZ65cA0JYaeTVnbl14FqhVpj8zqYAtmyynHAJ+dV
	ber6RhcQshV+HR3Z3JoGYcYPVZvYAF/vmsGxXwUlulrqq26M3p0pclgxgdkqSntOlQK9t5r
	W0V1/dNztjTdcYL5HLCj6DxEZRgtIITnXDtK79qY3kZXVZ7BmN1P04suFh6FLELoTHoUFMp
	+hmJpWCNqeLF2jK9DGQC5lQrEBD6b6qox3+PUerxO3Jaw2cLecla5+Hyq6oLsMPV3D//gXs
	QX8kKPcQ5Wkia9mQLB3etFkwd3tZn+f82MB7R3wflDN8G3fzrHMMDHM8Xs0k7nIxkKja8a5
	KsWS2y1/ZNSUSL/9q2DS6wA/97kzTmdI+pdHB29pEAKpj27RD+ZEq3B8acatWXx1BtUO9rb
	0P8xiWr2n0zSg6aHoO4EbhrZFYzKkEA3b0OPKrmyhEiGCLVRSOM0mjwN+ThD+gG+Lh87dTB
	WPiG9/fX+4yDapNhQWEqS4+JU9kuKhBrFRSmm77CiLu8lfp30tBHTLLQNjfNQEnWLTvPsuE
	QiiOhA9sZCfVCyXnKFmku5sRfDxvhXXRKTZSHBPX/uXFM96Zn3dJD2pLjyccyIKgVS6hoOd
	IoI75dqPp15LnryGLpJeHwndGvL+FNKvfImkIQjVn3a38H+ym7bEn/U0l6lSilHCaP5Q8/d
	svD6ao406n1AYJ9pXDrwHKWBka4mSNgLeRAzVRPMpgnWlVbgWlTRJA1hBYHEKwoaymN3lsb
	lM9OmFy9uG3G1uNhQKxEbAfs48RAcFwhOTuxlcWRihaPZ0HsNZwMvPk7qJI50v3o0IRDkvt
	4+WRNfVM5iwOpTWC7kOqsBU2tZ1UqrYHnEF2wQ1hwMwwNAwe7aloJ9dQAnerHqnZN+UtwC4
	BxsmuA4CBs3amt8OTCTMeD8QuJSsNkuBkYCwCm2TTdhjuUnzCS/cC6Ef4dBU6BIca20arnb
	vU6WKfgTHHGR2MoZV0Okz2wQxTe2AZkIg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On 9/19/2026 9:51 AM, Thinh Nguyen wrote:
> On Fri, Sep 18, 2026, Junzhong Pan wrote:
>> On 9/9/2026 8:28 PM, Junzhong Pan wrote:
>>> On 9/8/2026 10:16 PM, Troy Mitchell wrote:
>>>> On Tue Sep 8, 2026 at 10:01 PM +08, Junzhong Pan wrote:
>>>>> USB controller runtime suspend halts the controller on disconnection.
>>>>> It relies on platforms with custom connection notification to start
>>>>> the controller again.
>>>>>
>>>>> The host branch of dwc3_runtime_resume() does nothing currently. There
>>>>> are two paths that can trigger a runtime resume of the dwc3 core in
>>>>> host mode:
>>>>>
>>>>> (a) Wake lands on the xHCI child (DT platforms, e.g. Qualcomm, i.MX8MP)
>>>>>     A platform wakeup IRQ fires and the glue handler calls
>>>>>     pm_runtime_resume(&xhci->dev). Runtime PM walks upward, resumes
>>>>>     the dwc3 parent first, then resumes xHCI. Both wake correctly.
>>>>>
>>>>> (b) Wake lands on the dwc3 parent (ACPI platforms)
>>>>>     When an ACPI Notify(ACPI_NOTIFY_DEVICE_WAKE) targets the dwc3
>>>>>     parent device -- for example via a Generic Event Device on a
>>>>>     hardware-reduced platform where dwc3 is enumerated as an ACPI
>>>>>     device without a glue driver -- the ACPI core turns this into
>>>>>     pm_request_resume(dwc3_dev). Runtime PM does not propagate resume
>>>>>     downward, so the xHCI child stays suspended. Root hub polling is
>>>>>     never re-armed, and a device plugged in while suspended is silently
>>>>>     dropped.
>>>>>
>>>>> This patch fills in the host branch to cover case (b) by requesting an
>>>>> async resume of the xHCI child so xhci_resume() can restore the port
>>>>> state machine and re-arm root hub polling. Glue drivers in case (a)
>>>>> resume xHCI directly, an extra call introduced by this change, but
>>>>> runtime PM can serialize those requests and skip device already active,
>>>>> so the extra resume call is safe. Those calls can be replaced with
>>>>> resume calls to dwc3 device later.
>>>>>
>>>>> Tested on SpacemiT K3 Pico-ITX, covering both wakeup paths: an ACPI
>>>>> boot with a GED device notifying the dwc3 node (HID 808622B7), and a
>>>>> DT boot with a modified dwc3-generic-plat driver exposing a wakeup IRQ
>>>>> similar to dwc3-qcom.c and dwc3-imx8mp.c. This is not validation on
>>>>> actual Qualcomm or i.MX8MP hardware, changing those drivers would still
>>>>> need platform-specific testing.
>>>>>
>>>>> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>>>> Assisted-by: Opencode:claude-opus-5
>>>>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>>>>> ---
>>>>> Changes since RFC:
>>>>> - add Assisted-By tag and collect tag
>>>>> - refine the commit message and comments as suggested
>>>>>
>>>>> Link to RFC: https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/20260811090817.109350-1-panjunzhong@linux.spacemit.com/__;!!A4F2R9G_pg!fG8BhOaAiW3KsJBgmdcmOIKvYAFkNqYGGmoZn0ktdqp55U4q4kO1wKNFeAJ7YaGKoEWpwzyZAWYtypcFTR6doz7Ny1H6LQS2$ 
>>>>> ---
>>>>>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>>>>>  1 file changed, 12 insertions(+)
>>>>>
>>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>>> index fd5c2cd36c59..76883dc6184c 100644
>>>>> --- a/drivers/usb/dwc3/core.c
>>>>> +++ b/drivers/usb/dwc3/core.c
>>>>> @@ -2739,6 +2739,18 @@ int dwc3_runtime_resume(struct dwc3 *dwc)
>>>>>  		}
>>>>>  		break;
>>>>>  	case DWC3_GCTL_PRTCAP_HOST:
>>>>> +		/*
>>>>> +		 * Only the xHCI child's resume re-arms root hub polling, which
>>>>> +		 * is what rediscovers a device plugged in while suspended.
>>>>> +		 * Runtime PM doesn't resume children, so request it here.
>>>>> +		 * Keep it asynchronous to avoid waiting for the parent's resume
>>>>> +		 * callback to finish from inside it. Glue drivers may also
>>>>> +		 * resume xHCI directly, but runtime PM will serialize those
>>>>> +		 * requests and skips an already-active device.
>>>>> +		 */
>>>>> +		if (dwc->xhci)
>>>>> +			pm_request_resume(&dwc->xhci->dev);
>>>>> +		break;
>>>> Could we also check a parent-only resume with no USB wake event? For
>>>> example, reading the DWC3 debugfs lsp_dump file calls
>>>> pm_runtime_resume_and_get(dwc->dev). With both devices suspended, this
>>>> change would wake xHCI too.
>>>>
>>>
>>> Thanks for pointing out, I did missed those paths before, I will do some
>>> investigation and testing on the two non-wakeup path:debugfs attr access
>>> and the dwc3_set_mode() path then report back.
>>>
>>
>> I looked into this on real hardware. There are two paths where the
>> resume is unnecessary:
>>
>> (1) debugfs read: it briefly resumes xhci, then both devices go back
>> to autosuspend. Harmless, though unnecessary.
>>
>> (2) __dwc3_set_mode() while suspended in host mode: when a DRD
>> controller is suspended in host mode and user or a role-switch consumer
>> calls set_mode(), dwc3 is resumed first and the xhci removal follows.
>> But pm_request_resume() only queues work, and the unregister path
>> calls cancel_work_sync() before freeing the device, so the request
>> is either cancelled or completes beforehand. In my testing, the PM
>> core simply bails out with -EINVAL on pm_request_resume(&dwc->xhci->dev),
>> and the removal completes fine.
>>
>> I think yes there will be more extra calls here but they don't break
>> things, I didn't reproduce any failure. It seems difficult to get rid
>> of them since there are no good conditions to judge.
>>
>> If we want to avoid these more extras, maybe those platform who need
>> this feature can just let glue driver (dwc3-generic-plat.c or another)
>> handle the ACPI probe and the wakeup (like qcom/imx8mp) together for
>> the case(a) platform mentioned before instead of reusing the current
>> 8080:22B7 ACPI probe path in dwc3/core.c .
>>
>> Thinh, do you have any thought on that?  I'm fine with either approach.
>>
> 
> Troy brought up a good point. It may be "harmless" in the sense that it
> doesn't prevent the device from functioning, but it unnecessarily
> resumes xhci for other dwc3 runtime resume paths. We shouldn't apply
> this generically to all platforms.
> 
> Please drop my Acked-by for now until we find a better solution.
> 
> I think handling the wakeup through a glue driver like qcom as you
> suggested may be a better approach.> 

Ok, got it. I agree the glue driver is a better approach.
I'll go that direction and drop your Acked-by in any future revision.

> Thanks,
> Thinh

Best regards,
Junzhong

