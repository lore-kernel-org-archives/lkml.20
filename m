Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDA848EC78
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052851; cv=none; b=DdFvSXBE0De6Dk4En4dPwHf8i02iWSnri0GGqNxtDA2G8KTA2h8Vp5nEVi+sWb9PfIzOJJ4IJ0QJgyl/lqqKJVrPWVsAT94Chlufo7YbgWppziMFDPI9jfNpFDEsdzlJo3KXhxelAfg79PHjN1taLOWMCNDNF2f3pQ8FC46Ii5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052851; c=relaxed/simple;
	bh=ZSifJhowUN3XRl0pBXqUuN4VFkNb9eYBeJKIvQ+HjAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JtuFubIr8pAkFymG+CwJ9yYZ+YxT7bT1qBul4ucwsQZSTmM/C/MNgyAJn1SILLk7eC9h/DcSGWpL6TuEbhVJt1FJ8UWhNF+SxvyZ9Iq51K+m0KjZqCaOlcIAa6ulYoqE8FBtGzDIR/uHtTBh6TqwZnf6MxJN/EK1r94ayOlTYS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMJFVTEG; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMJFVTEG"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4be07e7c54dso865774b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789052843; x=1789657643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V24IRBj7QNWWWRl5+75adnJliei49Y/3P3TGo3Uu6OY=;
        b=sMJFVTEGiqwD4HN2lnLSjGGf+YwfM/2/VZfybsmGjrey4gRuuWq7iX05gIuZcBq68z
         rwshWr4T550jnl0AaMhr7+Th5xRh4b9GxltiHqFp/K3OQfhN42RLntJnfJyE8aKnVW9p
         XRvZL+47sE+sAJHiwVyNZfZbZdmLfM08nbgwbEdOoqyDW46XO0+ro9Ekez/HipDi0Xn7
         QyL1mEMu9VSli+VnYzcqLzbXRd+WogdDKB5+f/Iw443EmUVqrEmAmJvwuQcxKf/kDCpl
         s2eJeHLR6fEqozh1WwBtmmMYO/P3eljCplJpcwuSrynY5rJiVyH+VknpsUR541EIDrKO
         Evtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052843; x=1789657643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V24IRBj7QNWWWRl5+75adnJliei49Y/3P3TGo3Uu6OY=;
        b=m/v1TRUuVkvxUASmRzZ+FyhAiAMKwqMUlBDLA1UPrJUEbCM99cDNEXTOOEI3MGI81I
         KmX8O8ZD8chpHDZi3hCd8I7Azwdaui5/uXUfAWRfeXyomg4qnDoan0xGuEb87jPUzcqD
         vrBCP+zTxFqRuTGsw1n6GKlkPIyGCOiGBFF8WdCBSGTIUvV4F2sc0V0djracqDr079O5
         hnt5GGs8yOCAtO4+JYADoPHzWhffX2s4FRa6A/h73/wVkXA0XMUL1I2cvUPLDW83m2hV
         ZNB4U/HmbC8w9JNXjtvEQHFUoDjuKxxa6eiBSt5NLaLGjcy5xEYogR0afu2WPJbbArpS
         iRMA==
X-Forwarded-Encrypted: i=1; AKwUvBwJFdRq95pS/a6ZhetFNgeHFBdu/Li+G094hgI+eNjh5MCbhxorIfDlF2rg/D09c4CCu+l/5D9f0B7rjQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++n1UPwCKL4Toh3KlomomPnDhmSetw7r0n67x6a88at1NRrTXYtF
	kL3D4eJawv/zQGiJkgSq30MsgRlyDN2LNdg01sO7jeaDL2EE2inh48Ll
X-Gm-Gg: AYBFou0yV3YKCuSPqTdibmCsiulORriE7jSGfDkH4tmCm3IqJxnjsCkDzPv4dv9GgEt
	qMsHe8DnIxpeGp+E5v+h5KSVL/+uAHl9pd29Lvzal9ykvVCPUw1mZAtPQ/e9+IGfXzywnQ2M60N
	U30MpgNCKruFyidksrWsUS/QjI2KvJG2nAdsJw7K/mcyoCY/X8P/qMXCbXUqiQ+oifFkdv99XnT
	r8qIo5okjMCEBZgdO+Q0PUNm2/Jk/pOe52b8aZR6y+AyPC+pld2Go6HLszOoegcOcDsH5WRcPDt
	LeEh1fe45XjYtjRVZkAm5gzPcShoLQjwxXIj10Ce8tEZktX1weEXeCy2LSk8GQdTI1CVJTOnbTN
	xSvhDXHl3IfrLP+eF3Lbv6IQ5y2f5bsReJmkgtMzGQ9PlzjQkNTv7jHeZspS0As1vBFIDjDl376
	D2SaCqScqKeTjqQSxb3/XnVoBMx9Nj2guzeX97fpoJzCfUIhOuq00D3O8qjXSj+foWLovMH9t6y
	WU58yIzGAAYrMB+IWgBHnZPlfz3wX5AfoNsywtuji+Q91QIZMA1SBJXFDd27ss035UW7UGSeTE=
X-Received: by 2002:a05:6808:1a05:b0:4b2:8d83:436e with SMTP id 5614622812f47-4c1a5f9e194mr2665075b6e.8.1789052842906;
        Thu, 10 Sep 2026 08:07:22 -0700 (PDT)
Received: from [172.24.138.145] (ipservice-092-208-240-035.092.208.pools.vodafone-ip.de. [92.208.240.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d200fesm18169918b6e.3.2026.09.10.08.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 08:07:22 -0700 (PDT)
Message-ID: <d597d432-2903-4f0c-883e-eccb6867bc8d@gmail.com>
Date: Thu, 10 Sep 2026 17:07:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] gpio: ad7768: Add AD7768 GPIO auxiliary driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
References: <20260908-ad7768-gpio-v7-0-52ee6ef18a1e@analog.com>
 <20260908-ad7768-gpio-v7-3-52ee6ef18a1e@analog.com>
 <ap_nqnPLWJpz5N8o@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <ap_nqnPLWJpz5N8o@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/8/26 12:47, Andy Shevchenko wrote:
> On Tue, Sep 08, 2026 at 09:24:54AM +0200, Janani Sunil wrote:
>> The AD7768 provides five GPIOs controlled through registers shared
>> with the parent IIO device. Register an auxiliary gpio-regmap driver
>> and use the parent device for runtime PM.
>>
>> The device has separate input-state and output-latch registers. Add a
>> reg_mask_xlate() callback that checks the line direction and reads the
>> programmed output latch for output lines while retaining input-state
>> reads for input lines.
> ...
>
>> +	if (ngpios > AD7768_FILTER_GPIO &&
>> +	    device_property_match_string(gc->parent->parent, "clock-names",
>> +					 "mclk") < 0)
> Looking at the length of the line I have just noticed that this uses
> gc->parent->parent. Here is the question: what does gc->fwnode refer to?
>
gc->fwnode is currently null. Would you prefer that I explicitly set config.fwnode = dev_fwnode(parent) and use the fwnode_property_match_string() here instead of walking gc->parent->parent?

Best Regards,
Jan

