Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC06488205;
	Wed,  9 Sep 2026 12:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957007; cv=none; b=DpkyLZYAYf5sA87rwrSVUSbckxrLvyTZzkHh5duTMgIxon1DHscsX2oOXs5X0r5g4y+ysNhJ4ii5CGkBkaTh2fFcKROakWFrQsBbvYpxNTi5nmt2MFTBi+2RWW+sBiY0V0BdzICsJtji/HqITGKgGLY5n4m5pnU5EubJi99YmqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957007; c=relaxed/simple;
	bh=NqGy6hIXcY4gDq+NTJQchl2Qf5eZxe6SHEnUw1M93BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlOwCDwwVjyT//0Iz5O0DeITlqf08t/uVF9NXH8s2qsO5g9NO+6fU4c8nDXqoQNpAF3UGFhGZJJxXFUZcEJgD4GvzFTolK0ijo5lzEqP3j2ma7sRAHO4MggIm/hVnZFSFRQSZKkUS9JfDgpEvAHSg8GYJjL7tTDci9xe+jA2Jcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Ou70p9+N; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Ou70p9+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788956942;
	bh=C2S7dFgrFR2UVsQVVBeuk6XfCFWA9wrDEPE+fq83Yxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Ou70p9+NDG4z5c0Q7ksw9p3VKS3uKV1ySllHMaxcbNx+SKW66s2lAf6zPdKXE4MWh
	 VY81c0BtWiIAhxg/+BEXI4dqCYOpREnvPsx/Gg/iwQNjhOWQ2TsTf/GwPfxXwMjeaF
	 r/6gkFnAU3Q7i4KT8ZM4FhgP9mftG35zOWTWkJxQ=
X-QQ-mid: esmtpgz11t1788956936tc860ccf5
X-QQ-Originating-IP: h3Eg+sQTt311ySAh+/RtmDu0Zm0fZFzy5GGqlSDlFIc=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 20:28:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13942927660563248268
Message-ID: <566DD22E9074C793+eaef8bb4-9602-4f76-8915-6e322387c7aa@linux.spacemit.com>
Date: Wed, 9 Sep 2026 20:28:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
To: Troy Mitchell <troy.mitchell@linux.dev>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260908-resume-xhci-v1-1-aca107602e9c@linux.spacemit.com>
 <DL9ZZ8F7HTZT.1IUMD1ECSOZXL@linux.dev>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <DL9ZZ8F7HTZT.1IUMD1ECSOZXL@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OSKIRUYof16RjqqdbG+gVfpyHd1KyaLGRllpkrhPCbQWJJbmk7n46Aee
	DrlR0F38NPNsN9zk19fD+foh1foFuBw2v5GjN01pSznBpZGB2Hc8igHcEHT7aJkrljBBfNC
	LSToICgJebFizsaigNqvR+q2Lx7NpxrkZI8UgEa1Zn9eE91xcmnj3NS5Ai6avD6o+u/pkbH
	KS6k9nw16EyW1hwHj7F/ht1qJlew+T6yEiymDtv4eH6jDPqWe/k17QciROLOPpHBL7scGCn
	wg14IED8nZhtql9/VkmQYtkVNzbmSzbHVZV+ChJ/2+qpgBCXerL08UAHTel1zsFTo5qwD76
	upvynMBfBclESEalHV5uciEsC87peyzeNaD4CBw3dVBfE39eKU7Puwp9F5aNPaq095dTd9b
	9jmbeCh8NFYarp4xsycAHNHgXkW7YtOTpDT3XEFdPus2+E4FYplhO4LAutFAC0E7bpB38YR
	c0lQ8KlabH0ypS51Xse/GLuOeICLq2r9eVLYp8ZIqYnfZteDkFVCAcQBEvSazb3icCBjr0p
	X7oX6F6jJ4Y2nibEKLXSV+iCanWlWX7iP1e39fGoJuaB6jA5etoiq4ghkRnJGwgPLSnXoOU
	5ommdQeBEzGl5yno3QFJ+a/GY61jhrrgezvNrS9NOWCLSnDWI5N1LChowRTbvfXP9+xa692
	ZrCl0JEYRZQgmYuOGOOSD2xRRVZ6S41EjPkC1KeAf7PUiZytK5SkGa9TF11376Cjrr8Ymzz
	i28r+qyXYTEVrZ57q7hhA9/48BPnSARd71Z1LZbxaPRcUfMKEmsoIcI2RW3fvW4cFaNG8K1
	0IcCx7MXWPT1Y7KVptWSyqKcDr4A9tvzNOKX7TclmtyP247lEfY+9oNHxQ5IvAYs+4aO66N
	Gh+qPTAdkDTOqL+UbedG8DWtDtJDRlfiBCwp2gUFid9XRPQWt0mWPyX4firF8hlBd0xMQUl
	1YVejVaN3NJtmSj1Pf3m3wyIej2jeNeeb3KP07QGHtckXq5y17OdeowQS96MxXtnRTj/So5
	MbY1sHyujZMlspim4uPff+bEzZp4zoMbcnZGZqiIBl/DJg47vmYQH8YPdci4Oy+mld7fM9C
	wIuhaBlnFTAWfl3RpIG6BanEqIBgmwYk2eliBgsDyhr
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On 9/8/2026 10:16 PM, Troy Mitchell wrote:
> On Tue Sep 8, 2026 at 10:01 PM +08, Junzhong Pan wrote:
>> USB controller runtime suspend halts the controller on disconnection.
>> It relies on platforms with custom connection notification to start
>> the controller again.
>>
>> The host branch of dwc3_runtime_resume() does nothing currently. There
>> are two paths that can trigger a runtime resume of the dwc3 core in
>> host mode:
>>
>> (a) Wake lands on the xHCI child (DT platforms, e.g. Qualcomm, i.MX8MP)
>>     A platform wakeup IRQ fires and the glue handler calls
>>     pm_runtime_resume(&xhci->dev). Runtime PM walks upward, resumes
>>     the dwc3 parent first, then resumes xHCI. Both wake correctly.
>>
>> (b) Wake lands on the dwc3 parent (ACPI platforms)
>>     When an ACPI Notify(ACPI_NOTIFY_DEVICE_WAKE) targets the dwc3
>>     parent device -- for example via a Generic Event Device on a
>>     hardware-reduced platform where dwc3 is enumerated as an ACPI
>>     device without a glue driver -- the ACPI core turns this into
>>     pm_request_resume(dwc3_dev). Runtime PM does not propagate resume
>>     downward, so the xHCI child stays suspended. Root hub polling is
>>     never re-armed, and a device plugged in while suspended is silently
>>     dropped.
>>
>> This patch fills in the host branch to cover case (b) by requesting an
>> async resume of the xHCI child so xhci_resume() can restore the port
>> state machine and re-arm root hub polling. Glue drivers in case (a)
>> resume xHCI directly, an extra call introduced by this change, but
>> runtime PM can serialize those requests and skip device already active,
>> so the extra resume call is safe. Those calls can be replaced with
>> resume calls to dwc3 device later.
>>
>> Tested on SpacemiT K3 Pico-ITX, covering both wakeup paths: an ACPI
>> boot with a GED device notifying the dwc3 node (HID 808622B7), and a
>> DT boot with a modified dwc3-generic-plat driver exposing a wakeup IRQ
>> similar to dwc3-qcom.c and dwc3-imx8mp.c. This is not validation on
>> actual Qualcomm or i.MX8MP hardware, changing those drivers would still
>> need platform-specific testing.
>>
>> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>> Assisted-by: Opencode:claude-opus-5
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> ---
>> Changes since RFC:
>> - add Assisted-By tag and collect tag
>> - refine the commit message and comments as suggested
>>
>> Link to RFC: https://lore.kernel.org/linux-usb/20260811090817.109350-1-panjunzhong@linux.spacemit.com/
>> ---
>>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index fd5c2cd36c59..76883dc6184c 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -2739,6 +2739,18 @@ int dwc3_runtime_resume(struct dwc3 *dwc)
>>  		}
>>  		break;
>>  	case DWC3_GCTL_PRTCAP_HOST:
>> +		/*
>> +		 * Only the xHCI child's resume re-arms root hub polling, which
>> +		 * is what rediscovers a device plugged in while suspended.
>> +		 * Runtime PM doesn't resume children, so request it here.
>> +		 * Keep it asynchronous to avoid waiting for the parent's resume
>> +		 * callback to finish from inside it. Glue drivers may also
>> +		 * resume xHCI directly, but runtime PM will serialize those
>> +		 * requests and skips an already-active device.
>> +		 */
>> +		if (dwc->xhci)
>> +			pm_request_resume(&dwc->xhci->dev);
>> +		break;
> Could we also check a parent-only resume with no USB wake event? For
> example, reading the DWC3 debugfs lsp_dump file calls
> pm_runtime_resume_and_get(dwc->dev). With both devices suspended, this
> change would wake xHCI too.
> 

Thanks for pointing out, I did missed those paths before, I will do some
investigation and testing on the two non-wakeup path:debugfs attr access
and the dwc3_set_mode() path then report back.

> Would both devices return to autosuspend after the read and still
> detect a subsequent plug-in? This would help cover the non-wakeup
> case.
>>  	default:
>>  		/* do nothing */
>>  		break;
>>
>> ---
>> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
>> change-id: 20260908-resume-xhci-0fa34ff9b332
>>
>> Best regards,
> 
> 


