Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8319E49B5A0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950067; cv=none; b=J+IVfuSOCywCFpKcvUEozajlf5QAAFI9gyJkeuloohXOUzUA8uiozGWIRMACMm2OYu1dq2I2skmdDOR3hDCcoarK/4sDtKB7Y2uAMYVgRSsPXrlyTYP5T2kPGIzIY0xciMLc9Caq8BJd1kK+1aqLONXe1IssEAWoAwcfrygg6Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950067; c=relaxed/simple;
	bh=bIcfAsiQV62iArj4SkhKW7CglMVzBskVy2Fq8ytlSCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BnvI6I68AEPPHmlu+PNrEKAiPt+rwf4nlUVNK1H1A+54CjqAzWR1sqovfISi49neTDjtB4IfY66lahoHig2mlgfszQJxwJ73GRsCsoVcMxj2YsRNTh6e7aBkH5anOlssvc82HOkjkwpFe52VVcdRsKA+CtdwU+q+12htl/KcA2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=KsLm/x/n; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="KsLm/x/n"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93e479c36edso27769385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790950065; x=1791554865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klW0FlcC9T/zxSbbXLwbzIQb4lA6oCn6B9PBm9CJcAQ=;
        b=KsLm/x/nm019imslu8c2Cd3O8klQ8nsU24aY9CwiUmhFZ/bXcocytMcxwsCXV5Blzz
         s2l/bb1/767tvVeWUXgGJ21QNMEvcqT5x429djQ3qpYs9lG8strdykhOtGZYDtciiNgv
         YxDLiGGWuSsoiZ4UcF+9qDeC0OcORFvI4l/BTRGrVNEwvBf7PZXmRVHtce5cFKoy8FHQ
         VczHPuj0byqu6eUzNVIAt0KR4Fo+zz5MicVaLnF6MGpuqR9DKLl6hMRhq+ZaalrYSHEv
         lPCggd+B5efbzFalt/6Poz37pI5zLe0Uj3UqXl0/Lk2wK8IG2uGya1deaq53e9YyU2iJ
         8PiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950065; x=1791554865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klW0FlcC9T/zxSbbXLwbzIQb4lA6oCn6B9PBm9CJcAQ=;
        b=ZsuUQow7X1KAdqrbLmwgFfniNfvsupx1ILDRj4U2JlGzmjjM6IRhx9fE/t7F/cyKoL
         n77CFwK0F9jULmXfQr8TrE8s4iolgH8HKtx4M7Y9iCct7GiX4eb4aXef3ylaQEfDChpD
         TW3cbB5/m1FfiJf1gIzrSGXyDD8nVfBiEqtp1/+dQIHj1hnO/k0VS8JV3/lUvzweYShB
         f96rjZv4tIZI6T7ZOJ9Zw4U9IWqnEwcNQHFVZxiZDcThIidU5yrRVfIZ1+6zmZFc1pKv
         ZiacjoAqObb9I3gYVqW5h1auv3axN/+7AP7kXtvMM/dzS7QNC18J5wNlPhfT9R5DiPzO
         +9pQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBS22FPQbNhk/Q0bJpZvQqFKCZEl+XR2GPPNCEGC5iWSQIMQI/s0B42knO+h/izg9b3Nxn+RXDBjMHLSA=@vger.kernel.org
X-Gm-Message-State: AFuF++k/D8ZNIC/JCFF++zZRn/zj76ch6UMLyZCkGAxoYzsldygGQzsn
	vEO+2hReDOpSSTOLULnEpphCNiyXNcr7pXXjfCcxALNPc71K0cxdEXcUsnAXl0PpBeY=
X-Gm-Gg: AYBFou0NYlM2GwLVqws2xPRmh9mune9ud4bWP7z8WLzb6ExenJzidT1TsmyIBKZ37mO
	OY9QVBK7EZo5W/CFIKbome7CIG+azZbxx2qvXy4UU529B2ArEozvf5b089ZCZ5+zh97CfJLnR1Q
	XxHXVnXO6SvwP3uH0vk9dxi/zxOjmHSeU/u2yYJ4z1gWfNIjqSVBjhvcjq9+hzitIiFfAfY8jVm
	r+HQcWk5JcC5zC2I+4SmA2GOERHDmgRpaJdu7d3Eqh+iEoh+sehsc9iZZ9dK1vTyr2/DqZU20ON
	ld6N8r228YkLZFj/j+95WfvUVLiJ9W7g/fhHLkJysEQvVJydX1PsrKI+tbTlYkt8LkuKSrC69er
	pm5CjGI64mCZ7febPlspTZMHBJ0JN/3P4O/iON9Q7+qIILaNNud+d4HZgopOsfLXSlTyxZFwmlB
	lf7rdFyY5j28KgO+zthIs8jxOPklgY1mb0+/xayY0A4p+mLv9R/jWN5slLuHPARHBub4/HMz63t
	D1WObM3pA==
X-Received: by 2002:a05:620a:d88:b0:93c:8f50:8c65 with SMTP id af79cd13be357-93cf19fecaemr502167785a.64.1790950064264;
        Fri, 02 Oct 2026 07:07:44 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2d9fa1sm226966285a.44.2026.10.02.07.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 07:07:43 -0700 (PDT)
Message-ID: <ff8ef0da-180c-4ebf-b9b7-0bb029c56cc9@riscstar.com>
Date: Fri, 2 Oct 2026 09:07:42 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: Kconfig: tc9564: fix a circular dependency
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: daniel@riscstar.com, bhelgaas@google.com, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20261002013306.373689-1-elder@riscstar.com>
 <d8890acd-d854-4f66-8ea9-3b30bde41605@app.fastmail.com>
 <bb42c2f1-eb0b-4ff4-a4a5-7f847baed1e8@riscstar.com>
 <2582b0a0-009f-40f6-9b5f-85d4c8b2fe84@app.fastmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <2582b0a0-009f-40f6-9b5f-85d4c8b2fe84@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 7:55 AM, Arnd Bergmann wrote:
> On Fri, Oct 2, 2026, at 14:50, Alex Elder wrote:
>> On 10/2/26 1:02 AM, Arnd Bergmann wrote:
>>> On Fri, Oct 2, 2026, at 03:33, Alex Elder wrote:
>>> config TC9564_PCI
>>>    	tristate "Toshiba TC9564 PCI function support"
>>>           depends on PCI && PCI_DYNAMIC_OF_NODES && PCI_QUIRKS
>>>
>>> (in either one or three lines)
>>
>> If I do one, I'll combine OF and OF_IRQ similarly into one.
> 
> If you have a dependency on PCI_DYNAMIC_OF_NODES, you don't
> need the extra dependency on OF_IRQ or OF.
> 
> I guess you don't need the dependency on PCI either, unless
> we ever want to make PCI a tristate option have that in
> a loadable module.
> 
>        Arnd

I'm partly influenced by something comparable to "include
what you use", where my instinct here would be to explicitly
indicate dependencies even if other depended-on config
options satisfy them.  But I'll do what you're suggesting.

I will omit the dependency on PCI.  This is the same situation
as the OF dependency, where OF_IRQ is only available if OF is
enabled.

I'm adding "Suggested-by" you in the commit, because the final
(much simpler) form derives directly from what you've said here.

Thank you.

					-Alex
