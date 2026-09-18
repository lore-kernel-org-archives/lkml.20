Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C694EDCAD;
	Fri, 18 Sep 2026 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736981; cv=none; b=YO0FiI5G0g2I5CypooOFc3cahoqpZcyeAxkKiIkqktjY8HdC7LI6YoVyLh3KRMsVZY+fszbcU5ZHYwlR6ZYThBAZp3KyDkVCgbYMcO2x8V4wLEwYaI/1bszE9lWRSdupsRf6DS6tYF96GApe5t+hgCtSYwTiwh0cQSblVcnkO5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736981; c=relaxed/simple;
	bh=C/ixOUtI7uWYalxn7RDlGINC1VreSJk1dwuruTME8xI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BJ1ZVR9UCwkEMBEH6VqRK486HT32yxq3DIcA2rBVNRf5nL5B2/xAInWWa/tq6bu8GJVmvgtyB5LDcASd9BlvoVnVfs+jffoobGNybmL4KHkj5KUz9crOFnpBapzcnek6UUyttS4bCkKz/4I/f8n24/zgqf8WAiZeYxSnK0Vbmn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=xX/3VMkX; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="xX/3VMkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789736891;
	bh=NQe6SZgHq4C4c6OQq2uMfbITwyQfNYkJdzaj8xFvJOc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=xX/3VMkXeLVct2CRmn7s3IC86SMJ52tDryTAqVBBTa1I4VteOqRzwsA4VpwbEuRFC
	 J/ft3pmxbICWOpZ6SkTVbmsbA+V1WfzUuU4C6sAx8m/zv8NBn+pCFTLVGKXjHOxilv
	 51yu+aurAp3ctXXl4brslJRsRIfCG4vaeBNhpCVw=
X-QQ-mid: esmtpgz10t1789736884tec6452b8
X-QQ-Originating-IP: /kb2l/F6wfwX8gp1SErJ3II9mxlSeQDT2AtxmCa3Ox0=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 18 Sep 2026 21:08:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4423648668496576874
Message-ID: <768D38E96246550E+b63978f5-b8e9-4d3d-883c-f36d79c5da12@linux.spacemit.com>
Date: Fri, 18 Sep 2026 21:08:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.dev>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260908-resume-xhci-v1-1-aca107602e9c@linux.spacemit.com>
 <DL9ZZ8F7HTZT.1IUMD1ECSOZXL@linux.dev>
 <566DD22E9074C793+eaef8bb4-9602-4f76-8915-6e322387c7aa@linux.spacemit.com>
Content-Language: en-US
In-Reply-To: <566DD22E9074C793+eaef8bb4-9602-4f76-8915-6e322387c7aa@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: N3IC8um5pMyYrZwY7k9TsmuVrmQNfWebr+tcl7GFf2AAzA/WrkqSyTx3
	ABl/IpOwNtjjsVFfRUolns4krHjF6EuY0zPEKD/gJnt5DEI1WI2PiUDNIE/B/fI5pV8AuUb
	EaXnWLrmSBMmKGecGjrRjWQoTqFaIzZTLG5JK64CRLM9D9PJ9geUWL/9W05zGRm0lKwiXEj
	FnfdjJrH6pN/UC/zhsPCHJwLr6mPkiqK7ZwD3RVu63A1R05ByNhG2PD+KKmMcy0hnmDbFqF
	DH+lJw9vCQ8CwE5U9HnYd6cJbmSMNBUAjw3L0eDgBMOhRg3iaONoPuhk+HnbMphbX2gd8ts
	gI+ev3w7y45Jm37rMNk4bQwFrZbVfgS1mx+EWCUYWFocucSXoyGyn24ssd4oDICkETq13up
	X25JrYEUnGkgr2pOB1LwPEcO0LsOm0j8uDmGR12LuB3JFQCHa1fAeNIKBdIbdE3iSi6JORs
	P0XI+U/H5QEbkuET/XZLO09m+98P45Ana3SpQiP+YMTo3f2J0idt+2oSzRsUgsN06wAjBla
	QsnequfsZQy1GRm7iBhSPmt/0bI+fJmhf9IaRFHNjXn0kvrQomXb1DLkbpG5Jo2eXMJ88HV
	rP/uA9FNmnLZg5Yip+iF4i7yonGizS0V7fhRotgN/WRmOdqg7+JA3D1Z4cG/r8Ves9kVbEh
	DNHBtW3X/oFHqIee28qG9w9zMPc6ynHm5icJe15wM99otUYGMaXC9ah9ZRJtGcnshQN2PBU
	fO2omI+1Z4LLy6jDsscS/xRuU6TfL4rw/6/HjuN2IzJt6s1DOFsamwtaY++tM7iReAdvh0f
	hVGDUBoFV+4xjoPCQbxHzqEo9Neab9SBcC1MsXUnrFIqrykPn35KG6O3PipkNvLOT3gbLSP
	r09XcLligjVDy4TyU2AMPmAm5//5Shpjb8H80HZJK1WGtvVXspcFu19+MGpk9vqCMFz1seA
	qcKoj7an33CJnvQJJI2qo1TxE6dcQxk8M8cvBn6dpNHne6AnGZxeYVMHesH2dCheGcRR1O6
	Jn9+DF+/yetdA5QQX4RQ8aZ4ECBWyJKOx9syN2Xyqod5qSuWfd
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

On 9/9/2026 8:28 PM, Junzhong Pan wrote:
> On 9/8/2026 10:16 PM, Troy Mitchell wrote:
>> On Tue Sep 8, 2026 at 10:01 PM +08, Junzhong Pan wrote:
>>> USB controller runtime suspend halts the controller on disconnection.
>>> It relies on platforms with custom connection notification to start
>>> the controller again.
>>>
>>> The host branch of dwc3_runtime_resume() does nothing currently. There
>>> are two paths that can trigger a runtime resume of the dwc3 core in
>>> host mode:
>>>
>>> (a) Wake lands on the xHCI child (DT platforms, e.g. Qualcomm, i.MX8MP)
>>>     A platform wakeup IRQ fires and the glue handler calls
>>>     pm_runtime_resume(&xhci->dev). Runtime PM walks upward, resumes
>>>     the dwc3 parent first, then resumes xHCI. Both wake correctly.
>>>
>>> (b) Wake lands on the dwc3 parent (ACPI platforms)
>>>     When an ACPI Notify(ACPI_NOTIFY_DEVICE_WAKE) targets the dwc3
>>>     parent device -- for example via a Generic Event Device on a
>>>     hardware-reduced platform where dwc3 is enumerated as an ACPI
>>>     device without a glue driver -- the ACPI core turns this into
>>>     pm_request_resume(dwc3_dev). Runtime PM does not propagate resume
>>>     downward, so the xHCI child stays suspended. Root hub polling is
>>>     never re-armed, and a device plugged in while suspended is silently
>>>     dropped.
>>>
>>> This patch fills in the host branch to cover case (b) by requesting an
>>> async resume of the xHCI child so xhci_resume() can restore the port
>>> state machine and re-arm root hub polling. Glue drivers in case (a)
>>> resume xHCI directly, an extra call introduced by this change, but
>>> runtime PM can serialize those requests and skip device already active,
>>> so the extra resume call is safe. Those calls can be replaced with
>>> resume calls to dwc3 device later.
>>>
>>> Tested on SpacemiT K3 Pico-ITX, covering both wakeup paths: an ACPI
>>> boot with a GED device notifying the dwc3 node (HID 808622B7), and a
>>> DT boot with a modified dwc3-generic-plat driver exposing a wakeup IRQ
>>> similar to dwc3-qcom.c and dwc3-imx8mp.c. This is not validation on
>>> actual Qualcomm or i.MX8MP hardware, changing those drivers would still
>>> need platform-specific testing.
>>>
>>> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>> Assisted-by: Opencode:claude-opus-5
>>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>>> ---
>>> Changes since RFC:
>>> - add Assisted-By tag and collect tag
>>> - refine the commit message and comments as suggested
>>>
>>> Link to RFC: https://lore.kernel.org/linux-usb/20260811090817.109350-1-panjunzhong@linux.spacemit.com/
>>> ---
>>>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>> index fd5c2cd36c59..76883dc6184c 100644
>>> --- a/drivers/usb/dwc3/core.c
>>> +++ b/drivers/usb/dwc3/core.c
>>> @@ -2739,6 +2739,18 @@ int dwc3_runtime_resume(struct dwc3 *dwc)
>>>  		}
>>>  		break;
>>>  	case DWC3_GCTL_PRTCAP_HOST:
>>> +		/*
>>> +		 * Only the xHCI child's resume re-arms root hub polling, which
>>> +		 * is what rediscovers a device plugged in while suspended.
>>> +		 * Runtime PM doesn't resume children, so request it here.
>>> +		 * Keep it asynchronous to avoid waiting for the parent's resume
>>> +		 * callback to finish from inside it. Glue drivers may also
>>> +		 * resume xHCI directly, but runtime PM will serialize those
>>> +		 * requests and skips an already-active device.
>>> +		 */
>>> +		if (dwc->xhci)
>>> +			pm_request_resume(&dwc->xhci->dev);
>>> +		break;
>> Could we also check a parent-only resume with no USB wake event? For
>> example, reading the DWC3 debugfs lsp_dump file calls
>> pm_runtime_resume_and_get(dwc->dev). With both devices suspended, this
>> change would wake xHCI too.
>>
> 
> Thanks for pointing out, I did missed those paths before, I will do some
> investigation and testing on the two non-wakeup path:debugfs attr access
> and the dwc3_set_mode() path then report back.
> 

I looked into this on real hardware. There are two paths where the
resume is unnecessary:

(1) debugfs read: it briefly resumes xhci, then both devices go back
to autosuspend. Harmless, though unnecessary.

(2) __dwc3_set_mode() while suspended in host mode: when a DRD
controller is suspended in host mode and user or a role-switch consumer
calls set_mode(), dwc3 is resumed first and the xhci removal follows.
But pm_request_resume() only queues work, and the unregister path
calls cancel_work_sync() before freeing the device, so the request
is either cancelled or completes beforehand. In my testing, the PM
core simply bails out with -EINVAL on pm_request_resume(&dwc->xhci->dev),
and the removal completes fine.

I think yes there will be more extra calls here but they don't break
things, I didn't reproduce any failure. It seems difficult to get rid
of them since there are no good conditions to judge.

If we want to avoid these more extras, maybe those platform who need
this feature can just let glue driver (dwc3-generic-plat.c or another)
handle the ACPI probe and the wakeup (like qcom/imx8mp) together for
the case(a) platform mentioned before instead of reusing the current
8080:22B7 ACPI probe path in dwc3/core.c .

Thinh, do you have any thought on that?  I'm fine with either approach.

>> Would both devices return to autosuspend after the read and still
>> detect a subsequent plug-in? This would help cover the non-wakeup
>> case.
>>>  	default:
>>>  		/* do nothing */
>>>  		break;
>>>
>>> ---
>>> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
>>> change-id: 20260908-resume-xhci-0fa34ff9b332
>>>
>>> Best regards,
>>
>>
> 
> 
> 
> 


