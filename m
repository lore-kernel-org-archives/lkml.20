Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734CB2576E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021725; cv=none; b=JIFjQdLtt1DxSzmT+2k5jPRSxJDswXkD+Ntdbf641lxGIy6GKtwn3Ko6FR8V31k7nnXhh/Lzi2KaMqHN4f5EITLbvf+iljVri+DCI7GXGVgI4yktiErtpHPH5vrR21GnfQlgbHddlwezi3m2Qiroq20gucfGNQRGDw0GQYRR3nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021725; c=relaxed/simple;
	bh=FIQSjaSCtNQo1sKYmTkp2kr1XmrOiTghO8W42iOm4ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tf2U/vwuGi6D/hV9kIN8NGIMDHvWWzSbaLCMcdAQfZph7cDctdpyjamsVw/1PUJQnY7qVGko5vyhE5ZCK4Vxmu7mDfoer+qbO3V20R3w3Z5bfSW0HLJSHUk8HIrPjE1zQDEPNcS9m6hjYnVIOefF9W4X/2SwJYfQyE83j8gkZHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvwO3Uxq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvwO3Uxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B741F000FF;
	Thu, 10 Sep 2026 06:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789021723;
	bh=J5OsNpzXow/5o2jOPSekRVovtAwip9X556IzMiie/4g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lvwO3UxqSyb5TUYV31KEAVIQUEqzf+XRCT3XySXgpKqzzkDtrsxa29OAIw5ijgYbs
	 CwDTGJzxpAr2BRP4zHMiVgjd6Qff21dUxsuMz4XPh3CkJJVI62EYFUJuiuovI7+wnp
	 Yg1u1VDGrxhfSedbtBxNaKS41+/8Tk4zVjQoezMaihYAtBPg4+bFDQd3aOeFV0I7kE
	 puFHdlEJjSldUnMJhtpp2yG6SGYjQ4ZHOk2d4O7Smg4mBBKNoXkl/eXlLvgDgCemS0
	 7h8ZLW01kdA7DBoLR1DHj70j+o+x1gYTFJu6O87px9HgKoSvdI7Er/etzsaTJJFjO8
	 d/ykoc5ZmdfXA==
Message-ID: <9a6b150a-63c4-4009-ae7b-3b8ab91efb11@kernel.org>
Date: Thu, 10 Sep 2026 08:28:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 1/4] memory: fsl_ifc: Fix optional NAND IRQ handling and
 migrate to platform IRQ API
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-kernel@vger.kernel.org
References: <20260721202450.485171-1-rosenp@gmail.com>
 <20260721202450.485171-2-rosenp@gmail.com>
 <3bfabe23-b88d-4548-a7a4-06bf526c3a31@kernel.org>
 <CAKxU2N-xfKn_AChcAse_nxFBznxog+OLYW2htBwKHd_Mxk0BUA@mail.gmail.com>
 <dc7c1fb8-9d01-4d1c-abcd-1bddd70edecb@kernel.org>
 <CAKxU2N8OVpTtcduUtodPtX+wP4qF5SXEZAyVKxNM8V8C5i6Xqg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAKxU2N8OVpTtcduUtodPtX+wP4qF5SXEZAyVKxNM8V8C5i6Xqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/09/2026 00:33, Rosen Penev wrote:
> On Tue, Sep 8, 2026 at 11:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 06/09/2026 20:34, Rosen Penev wrote:
>>> On Tue, Sep 1, 2026 at 8:29 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>       dev_set_drvdata(&dev->dev, NULL);
>>>>> @@ -204,9 +202,21 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>>>>>       int ret = 0;
>>>>>       int version, banks;
>>>>>       void __iomem *addr;
>>>>> +     int nand_irq;
>>>>> +     int irq;
>>>>
>>>> Why do you need the intermediate variables?
>>> In order to call platform_get_irq before any allocation happens in probe.
>>>>
>>
>> But allocation is the first thing the probe is doing.
> We're going in circles.
> 
> It's better to return -EPROBE_DEFER as early as possible to avoid
> doing anything.

Then you would be getting all resources like that in every driver... and
we don't. Plus deferred probe on IRQ is highly unlikely.

Best regards,
Krzysztof
