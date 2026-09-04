Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5534548123D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536178; cv=none; b=S3JhA1eQ5nQv/Fi9HZq4d23nqYC0hQZz+DaanO/6ymvdjiAHDpfREtNc5H+cAViXKb2OZXAio2DwATDddurnxdRmwn5QSxQ13IEdGHpDNX806J0cm6cFnUgn2ZOTLhp+jG/ZHsIgLfH3WyoYfPNQ323KNqdOA1PccDd5+cenddA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536178; c=relaxed/simple;
	bh=kKrI3qMSFCWJeV4bwT6pExN7KhvycqA4trfwSHseajU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eSBtpK4mRNN+ITh/uZDRRS+z8L+HeMlFl5J4Bq187fXHMRZo+Xa5ZtLeAm0sx8C/rAk9puafiJ9HpJXg32CwEGD9SUimah7fwBz8d+e5D9zBDjxklXLSm4xJKOJnHi5IDwYGMKlUpU29I9e/FpmL7qdZYccwZvftzzwO/85+jFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=VCSIjzxu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="VCSIjzxu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso12747295e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1788536174; x=1789140974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZFGyur2mmP2KYGddhk9G5uPJrbNoRsh9kodzw0N+Vk=;
        b=VCSIjzxuvGDo8GDLGXYnF1QrRm2XHznqHEwi48xCFvy9dvkWcGxD1iFCV6+5Jpg4Ee
         w+r9EZfizeC0dDfs+Ol8OXpHQj9W/Vw04FY8jdhsLOK3v/wwElIVwqJQ3fHg9tmb9h3C
         5HJhguRx4+jWMvwoIKRPXuW5Em2QPBmYEXOsUH5JRhE5lp51b08E/9y6TXE9HxZTsdbS
         mT3dM5KhlI3rywKsfREevD8D0NuxO4kXz4wuznCz+I/OEghOj1D+ChI/Lqq2zkTR82ok
         KpBAtCkcVEx9zZvCvPVab7mlj0w+1gh+TkGfRNWFgZKbzOl0Uln1+9SYMdLhZpH6reNT
         ot0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536174; x=1789140974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZFGyur2mmP2KYGddhk9G5uPJrbNoRsh9kodzw0N+Vk=;
        b=PmW7bydYlRIFSHh5r7olF11egMPMPoxHkJKaYW7WRble7xTmFrv0mA3p/lzrilON1R
         RJVVfVrGLXxrzSEykqps7zwRS3gshxUr3Cqilz6u8bdvXTZ4ymt0tF7q0AKTKMmA1x1J
         7jkV5G2c573k+PP82ZIfJjJsx0VCqoWWl//z+0+oLumkmVZyDBd6Ge/xJn4wwuQ9feRK
         rl59xBP93SZJAOK+vzGm4rFMQSfmqP3P19qbFnoet/dqMTKctAO/rAnOQYNd5F3/GbQd
         +QnD7+QdOXhD3cMnct2KJBPSpZ8RXBiKe0cOnkDzWyBSFmfSpEkaaMbvAVifip0GFtMM
         k5oQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWUvOo602uEL9SMSH3n9c9rpBdycCk9VI+aotnsHoEmWGJxjf4V/xVrEipJmNqeSJGdKxOUScsmOfYmGA=@vger.kernel.org
X-Gm-Message-State: AFuF++mAj0HF/hwlP/v/r7rUchlkDmymalujO1jAgx76M4MGHm1ABdIV
	/OYrRi77AC8y3Rnj7Kmf4FY6/gC2vy1JqrR+x0C4QPWxF66pA9jL0oCBnOBpX+gbsg==
X-Gm-Gg: AYBFou2ApBFiJBtbmpMxfnlI4BNg1zkSoXqF0SPacJ2/5MJ1Z8GdPvPlGOOgL9xKX0W
	ZgcjmMp3wDsoTvFSogJf6dC8TBNyG39VFygDH+ZpYvUv3+bFSqlvFKL5s05G/HRviPpZGha1kCQ
	iJCTnjL8m3Lgd6sWk6sLAJBiEfbc+ogDL3y/Nx+py9PDCO/10t/eogxNMA8A9ljwlgQbNGJrKSq
	q2AT86o/a9lI3jw87wQNw8diqwwaz5Ta2iNgl+Szk/Yw6a87fMSGc0gAts66g5h+FCYZS5SWEiH
	agZOxeNLWHTOHtTganrbvuOhJvVtd5CbomdBOUy/e7Z/DyVcSH3m1YyH6qSY0NO1O6uREyEaosc
	zlchSOQk30Z7XMEM6omupKTz1DE/Rhfc2iCgyI35mEs7uIUHZeRpujILZrZR/lcCES2TX/xm8H5
	tPCHTnV4dEMe5MpFPgPyWSCVsCbT4FWaHuHxi1kj+2c7fPPdtDP5wRDuUDqUYZ54EGJn6x8Ww=
X-Received: by 2002:a05:600c:4e46:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49cfc6e8e51mr42088835e9.24.1788536174321;
        Fri, 04 Sep 2026 08:36:14 -0700 (PDT)
Received: from [10.83.43.186] ([82.141.220.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7739b7asm73481455e9.13.2026.09.04.08.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:36:13 -0700 (PDT)
Message-ID: <6f916404-63b5-40a3-a429-befe42a08629@arista.com>
Date: Fri, 4 Sep 2026 16:36:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] PCI: Stop waiting for link status after config read
 failure
To: Lukas Wunner <lukas@wunner.de>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Sewart <jamessewart@arista.com>
References: <20260904111318.1063858-1-yurypm@arista.com>
 <apq3kd9_qsURNpKu@wunner.de>
Content-Language: en-US
From: "Yury M." <yurypm@arista.com>
In-Reply-To: <apq3kd9_qsURNpKu@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

what to you think about this check:
if ((pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta) ||  
PCI_POSSIBLE_ERROR(lnksta)) && pci_dev_is_disconnected(pdev))
     return -ENODEV;

On 9/4/26 13:20, Lukas Wunner wrote:
> On Fri, Sep 04, 2026 at 11:13:18AM +0000, Yury Murashka wrote:
>> With a nested PCIe topology with multiple layers of hotplug, a link can go
>> down near the bottom of the topology shortly before a link above it goes
>> down. In that case, pcie_wait_for_link_status() can wait for the full
>> timeout while every read of the link status register fails because the
>> device has disappeared.
>>
>> Return immediately when reading the link status fails so event processing
>> can continue.
> [...]
>> +++ b/drivers/pci/pci.c
>> @@ -4580,7 +4581,8 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
>>   
>>   	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
>>   	do {
>> -		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
>> +		if (pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta))
>> +			return -ENODEV;
>>   		if ((lnksta & lnksta_mask) == lnksta_match)
>>   			return 0;
>>   		msleep(1);
> It might be clearer if you check for pci_dev_is_disconnected() directly
> instead of relying on a PCIBIOS_DEVICE_NOT_FOUND return value which is
> generated as a side effect of the device being gone.
>
> Thanks,
>
> Lukas

