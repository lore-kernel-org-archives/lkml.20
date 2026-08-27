Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA9543BDD2;
	Thu, 27 Aug 2026 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824377; cv=none; b=LGXs21x6oFnlqBkVtq/5g1qYR8o1yauGh29mkn6z/pYHu/Uo7purc/yMR2FU96Oovdy7ZOU6zwUdFGHgy4VhJV1ZpIRnsAgE1wTL6q7WDu513+WhUo9ImyyPOqPA7MxSnkNb1uOPVLI85Z+daZiQb0C8VZBGWJRwZ2hBj31klkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824377; c=relaxed/simple;
	bh=RWJZtLdZ6ZS/480H0LSNnFcg1i9+557te5Dr6v8HG38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQsymwS979kVnQfzOnVbBOiJ8vt+iTIhRQMMFVpjIXpFah0+bGB4afnNfW68RwrY4554nhJSOkaF1wK1ncHspmTKrdsGwoc2vD7M1XhsRvjWzwpnFdTsdD6Zq1B95DLrJWur14pbCtg9Q5itQkpatCCcKnGZrVIONxDtpYq4elw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=xwVqqt73; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="xwVqqt73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787824352;
	bh=6HhNKvnphh8gYUCrkxzvGMUTECP0EAeEndGb9SUyApk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=xwVqqt73hvq/L/XV6b7VjYZ8fhZGLOsICEWRJBI0Ocl2rwwbFEb7Sfqma0FEwf5tw
	 wuyEd6OYcosL96rWqn4QtTWB7nEiUzKqlY/tWu0cOS1THLzTM5oIIkBHObNgYJ1IMV
	 sbrZQOLABDHCkt8KzOoM7rq+rrPDt8bLovBR3D7c=
X-QQ-mid: esmtpsz11t1787824348t5d3603dd
X-QQ-Originating-IP: 3FRuVmHJZu/1Q012Do+kPs/g+mcSjjnVSg8nfn7qEkI=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 17:52:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12697951333145275488
EX-QQ-RecipientCnt: 6
Message-ID: <8F4C0C8A8DA2D71A+7c57de3c-1f36-4e5b-b5e3-0eeb6ca88006@linux.spacemit.com>
Date: Thu, 27 Aug 2026 17:52:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <ao-QDVibwU90yPm_@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: No5qhXOiWrB7359tlTpEVNmsr8H/hmMgrwDcNW5NSDu8yg/XLtHbGtXh
	gY04N4/7Wdl/PjTrK8RHMc3LlGH9tlkNPqrc5QqG+H5jjkO395EkREYvAKJsg0Zn6J9uvCZ
	QEAOvRoKuURYnGYVGjZlKxoSdEBZZlkIB1n4Zzz5K8+09zvmmgogFZNRS7a7OZGfenRoovQ
	HCIilX87fE9RRGFe7SqYbCUc+1S2EjNFtVO0a20O0EgB72e+kGlpiqFKl6lj0G9CkynX+LK
	iZYEMIfgL74idwYMnzlcrae5v/3+V2EulyfPITwN+j6Gcnk2L/IIpc7dkX4Xa0vBL+P8QqY
	G6jJzC6tIiehfa4eTkTuQ85iT9cp2fRD93rdSEt4D7fizG94NidiLZcTABIw/HtJwWruLky
	C93O9zoB/gcJ50P/nrvbC0+s0o/dNp2l7c6pLXIASDm74AivjRnADLv6sQvUE3m6LwPGjVj
	G9SW3EjT+u2JN11dbzCmNIY835n6ijGpxVBhRlhkH3jlHSetSziVLvmDBOKHmmUzR09qG9S
	qp0n+Oo/gdIXN4dJJC6vHjCl5xe6FUl6/ftqO7t2X/7BbM1TpN4StGJqYpQ8aI6q1oolPFY
	xZ9GRrbl1oh4Oz4TccvcM1OzJYiKRsVBRS4FudmcuXP9t+roaATpN64bPhTPMIJ+R8BOoWc
	S8VChKODVNvheuNLcX+W01r+rjnOpT0pWKGkDkXjUQx86SCwmOvwBQxTsxfISIthRt1LSv+
	iDC3WO63oKU5NXrX9lsPAES9QuX0ZKhMrbbGESZUGIis26NbnMiaRIl3GP4y3LAtZv24SmH
	5vyz2lSDIZ01QpY10HiMEHhmnla6iiAUtG9HZRytELzbmsiL4MHE18jPdoV+zt2NQtJ8NCO
	DdABuLiMB0p0sQW/xiXl9ziAcpzC7sbF52/hz1vePHnA3GN4ZLV1ppkRXo32mrHywVdTshJ
	CoJzle4w0xWeouM99aQThDM92OnRF8LSp3JBJUrUnxewnO57Kk1ebHeGO5egekA8aJ1p2Jo
	V3VfjE/q3sSh907jsTr4X3MRGG1JbZxMPgOB+c5/obhWkgCZ9nBWvTBQaurr5kO55hbx3sr
	M5YlsekcDCGgfiLU2uSd8O+z92Dq+M0jmDxsraYNu4jHHAoHLRHpN0=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0


On 8/27/2026 10:11 AM, Thinh Nguyen wrote:
> Hi,
> 
> On Tue, Aug 11, 2026, Junzhong Pan wrote:
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
> 
> Good catch.
> 
>>
>> This patch fills in the host branch to cover case (b) by requesting an
>> async resume of the xHCI child so xhci_resume() can restore the port
>> state machine and re-arm root hub polling. Async is required to avoid
>> deadlocking on the parent's own rpm_resume() re-entry.
>>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> ---
>> base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
>>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index ceb49f2f8004..bce56765ad90 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -2668,6 +2668,18 @@ int dwc3_runtime_resume(struct dwc3 *dwc)
>>  		}
>>  		break;
>>  	case DWC3_GCTL_PRTCAP_HOST:
>> +		/*
>> +		 * Only the xHCI child's resume re-arms root hub polling, which
>> +		 * is what rediscovers a device plugged in while suspended.
>> +		 * Runtime PM never resumes children on its own, so request it
>> +		 * here. This has to be asynchronous: resuming the child
>> +		 * synchronously would deadlock because rpm_resume() tries to
>> +		 * resume the parent before the child, and here the parent's
>> +		 * own callback has not returned yet.
>> +		 */
> 
> This note sounds as if this is needed to all cases, but you're only
> describing only case b) here. Can you also mention for case a) that
> there maybe an extra resume work call.

Will do.

> 
> Would be nice for it to be cleaner without the extra call, but I think
> it should be fine.

I guess we could do this: after this merged, we patch those platform
drivers(case a) to drop their existing workaround hack, dwc3 will
take over it's child xhci in this wakeup resume path, they just wake
dwc3. That makes things consistent. What do you think?

> 
>> +		if (dwc->xhci)
>> +			pm_request_resume(&dwc->xhci->dev);
>> +		break;
>>  	default:
>>  		/* do nothing */
>>  		break;
>> --
>> 2.25.1
>>
> 
> Thanks for the patch, can you resubmit with the proper assisted-by tag
> and remove the RFC?

Will do, thanks.

> 
> After the change:
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> 
> Thanks,
> Thinh

Best regards.


