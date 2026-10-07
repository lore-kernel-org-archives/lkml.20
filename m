Received: from mta1.migadu.com (out-56.mta1.migadu.com [95.215.58.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887193368BD
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356268; cv=none; b=fAsR2SymANxy3/7BCltEGgFrAmCvAfVN2nLM6I6AoOk9OIgTkl7MChMIO361xgBTcBQqM7ErDjLsZGjGd6jC6TLCGErhemWAo7/CIwTsIXG27nlf2Xutu/g2lXw1I35LD+J7qpRBKEdmu4rsBhqeX5wndmneqhlG5iFyWUt2xMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356268; c=relaxed/simple;
	bh=bgvAnuDBKrah+1oAtquFA8au46xffNkrUC44ySLVSKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSV8Hp25mdRxS9922OYxsrB/mZWm1sj7UxtLFhDG+//MFgnBSuIlUOvmUMt8NW7YcuASn7RXtasSvHDvwwEDjX+umD6W6RotkF2WOrVWF+rEorOryiAB506Gl4r62J4q/yxwiuVSCDGp8X3gK/5g7uDgln8t21efXnOY5poYIxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WnTHYnfQ; arc=none smtp.client-ip=95.215.58.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WnTHYnfQ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bgvAnuDBKrah+1oAtquFA8au46xffNkrUC44ySLVSKM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791356264; v=1; x=1791961064;
 b=WnTHYnfQmwIQWflbVwSkxekWLWk0e/wJoX67NX85NKMxYS0+bdrTFh8hbTNvg9Zc4f2gm9/z
 Gi/b0T4i7XYE1G0nIf2476sUdyCFC2u7DfaJtSD7ebsXqRlZjv+H81UdNhstLzXt/FWkK8WsqM7
 f++WJZrtbNnHcEp+5KaNFBqk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 81353408bb37fdb6;
	Wed, 07 Oct 2026 05:42:35 +0000
X-Mizu-Trace-ID: 81353408bb37fdb6
X-Migadu-Flow: FLOW_OUT
Message-ID: <9866b263-ab09-4609-8885-62b68049bc33@linux.dev>
Date: Wed, 7 Oct 2026 11:12:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] PCI/AER: MacBookPro16,1 powers off ~20 s after boot
To: Lukas Wunner <lukas@wunner.de>
Cc: "Perlow, Jason" <jperlow@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 Alex Deucher <alexdeucher@gmail.com>
References: <CABZrw2HcaOh3DHTJtxU5dXrb3Vg19scr6+qR-xe_+R7rME35_Q@mail.gmail.com>
 <20261005231914.GA639967@bhelgaas>
 <CABZrw2F=pOOq7+puKohtYMihYqWCevCFc7rkAOETW4T5Nf4n8Q@mail.gmail.com>
 <asRjch1fMBslk07D@wunner.de> <2a7a97cc-7ad0-4e6f-845a-dd841d36079b@linux.dev>
 <asTDCW28kKBfKAVs@wunner.de>
Content-Language: en-US
From: Aditya Garg <aditya.garg@linux.dev>
In-Reply-To: <asTDCW28kKBfKAVs@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06-10-2026 03:14 pm, Lukas Wunner wrote:
> On Tue, Oct 06, 2026 at 02:01:52PM +0530, Aditya Garg wrote:
>> On 06-10-2026 08:26 am, Lukas Wunner wrote:
>>> On Mon, Oct 05, 2026 at 08:17:12PM -0400, Perlow, Jason wrote:
>>>>   masked only on 04:00.2 (Apple T2 Secure Enclave, 106b:1802):
>>>>       stays up (120 s)
>>> [...]
>>>> So here the trigger is unmasking Advisory Non-Fatal Errors on that
>>>> one function.
>>>
>>> That's quite unexpected.  Maybe there's a bug in the PCIe IP which
>>> Apple used for the T2 Secure Enclave device (which I believe is a
>>> fully-fledged arm64 CPU with a PCIe port in Endpoint mode).
> [...]
>>> macOS likely never unmasks the bit and so they never saw this during
>>> validation testing.  Is the T2 device visible on Windows?  If it is,
>>> it seems Windows doesn't support and unmask Advisory Non-Fatal Errors
>>> either.
>>
>> T2 device is visible on Windows as well as "System Device"
> 
> It looks like lspci is also available as a Windows binary:
> 
> https://github.com/pciutils/pciutils/releases/tag/v3.15.0
> https://eternallybored.org/misc/pciutils/
> 
> Could you double-check whether it unmasks Advisory Non-Fatal Errors
> in the Uncorrectable Error Mask Register, on the T2 or any other device?

The Windows build seems to be too old> 
> Thanks!
> 
> Lukas

