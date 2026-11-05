Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876747;
	b=Mbhu3arbzVDq8n6OKNV4wD84O8eoATv3v+yTAFb+hNeB3+sisI3i+iRyWJr7uuyC1yGi
	 A2F0YZY83u05WoNtchOof8zIjaBJ9eBxVq78oveDOXawdUvgBdPTzGV56QLPzwDeCP3Wx
	 RIH0iLId1RhM5bJRaxUqZxJRAVoifKrEv6GkqXWamEfT8U4L7bQklf3yPJwXo38s4NQ6Q
	 6UELIN8UVQnMPwAgpxk8pk+23LZ5etHxKiRrSqnZyHxuvlm4WOd8WtEhguGWk0P7Tr75i
	 soTRogA/sNGD3jFG5YVmsCpb2+KHQx4sILHwseZoBBdCOZ4MIfcyTy8XK3Nq8VtICpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JN0h7SeXPERjAEMznolQ48k3OWsfixBRlrh/PkvU79k=;
	b=crHpLnzR6DJu/Ls8AubYSRReAiKegZV+3LSSNvMXJ3/vNPPmzjgeueglKmYyUr0lkVuF
	 GUE0xWkzU37qnSrJoH+6SkaHhV+UihX2udLhv59ZWvnebVxvjqepcQiQPqrySkOZeLo4V
	 CwzYp8aKsisRk3WzsNPyYPPnqJBpGlOimuCkAM3McRA9AL/7Nog14ACLRo7mGUxkVBLO2
	 vBVEapBS6N5bcyizM6UjQWYcn4HwCARn/Eleblveni/wNHdvCR4kfAX1T4QgdR+4ZiGWM
	 S0dx6R2PWdFhWvS//OlxzQQ6p6icIHdpVJ2Af/RmthN/MF95eoX9RA0v7HhgZzDgsNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kws39dw7;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103FD606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 103FD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kws39dw7
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso742493a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876746; x=1794481546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JN0h7SeXPERjAEMznolQ48k3OWsfixBRlrh/PkvU79k=;
        b=Kws39dw7eQ3kZp132JgUegkj1UJMNcWAmDavCayW7p+4EzXtSjiMjpOu14eGanq0CA
         FR2oKytqK+Aye8O50js3m9AxPehTyjqRRKgWnuHrQdz8LFTrRiY/kHXDlq8EoJ8+mQ7Z
         kxWNltVLsO4JK8VTxMsjnwVZadW5ycNasCHvd9uM6IWwvEOwhI+hTAFyk6CtQU43/vaW
         U0DQp9Ab9voItrQzj4OqdCzXBBHjr0tkIPhOO3pxXnngVr8CfUiNL96tyCmEipjnRNff
         /UdJyJODefVYVMQv6YAY1rRwh4Zy7O5Ook2uh+ekNZaAI6x2uIiqJsZD0nF0Qyyi+MkQ
         N3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876746; x=1794481546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JN0h7SeXPERjAEMznolQ48k3OWsfixBRlrh/PkvU79k=;
        b=dqxmZXMHoe9eVKcR2syZyE9tZWRvspSAh9sHx3ghcHWihbNESK/oiPTxqyvmuw9bqD
         FzitjEQfZYZRKSAIR5/m7XK2qIIiZg5gvveE7i1U0hBWFmEX5x1qRtBOTzgo5mN4EQF2
         DBlqs5Adz/iGxdCflWPk+/KgWqppIDiFewgOlpJwJNjkcV6ADEalGbRVQZjtN+sU1xf/
         jQGVPS12ww4PYKrrgJlSL8D/GOcL/MTi7cXwXJgDXJomeKip43S443363ePuIRcZshxU
         8oeKGysHM29EFm7W1B6SWM07Wsy6oGQLQ2R8F1YMXdqLYeQknXCZML68eyjXnC/8Cn7t
         +dsg==
X-Forwarded-Encrypted: i=1; AKwUvBwy5rv4v1+NJYWxchK19wJByzsB488ax/iu9IGZhC0Pg5nz6Kb0CJy744JRw5E/2+XPJ8nYmQXVQM+NlcI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R5ajOqXo9DmqKpgLD1J3JRDwNwUZRKYbMND05m+e5hegK9C9p
	5fgCEhwwWLYLAHJHP69H2zMv4LLqFauDSRAnWotl2AgZ1FSV0AESxBPI
X-Gm-Gg: AYBFou029jUKBfeN8MgrlIqM0TV0q8bxKoZVOvROy4xMR3tAudvbXnplR6qgLfV+IpN
	G3FkDHlwPZHS//ZpKa67esA8JBDldk81Adne9hsRguzdh7JPSj1f8/aX9HtZecCJPYJeNIUBc03
	7ZOAWEwQrpcWFbBuj+ql1FCegCW+9tiuNmuR1R8UiQCfQtyIcpvYHXOJo8bWSJjtlWsDPbyc0kn
	Ekt8ySxSc6xIhZya+Oiz0Dc6si432ukCAjdUh44khBClHThKtocOimEdKUpBsirkeMk79TplS57
	mVC55MiB0OYF+mh8ZYU2alZkg8ljY9LS8fftgzcKUiImg4qnTI4ssFTqSbBin9vi0nxPnS6aLSy
	aTMzCdQxiPE8HUqE7pBU5uXRsHOnwJSLc8b37EjxGeBF3ZKxjA7dzzeJ7kr9X4sfJSzEQFh7yK5
	a9vGCAdrk9y0QelveL7O5h8gsxCpOH2sKFILsydVLoziygxboZpiqy/RPsYHuIM2+SEYzWQNCZP
	9WpoeT91Wxd/Seme2JFFdji37WILBLsrp+FFZH9R1mglybP+YTG4QBXKLFaQXzU9FgojiO4eFTe
	hTH8rfhnClgyxUBibVpkrpR0vC9sXgwoV3FaS01yeR7jyCz4GK798O8oopTLhiOAn53mTsBjG9l
	6M58=
X-Received: by 2002:a17:90b:4a84:b0:3b0:97bc:62d with SMTP id 98e67ed59e1d1-3b097bc076emr4500305a91.32.1793876746390;
        Thu, 05 Nov 2026 03:05:46 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31aa128sm3474817a91.11.2026.11.05.03.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:05:45 -0800 (PST)
Message-ID: <67823831-cb47-42e4-8af0-1331a3f73ef5@gmail.com>
Date: Thu, 5 Nov 2026 19:05:42 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20261104091136.151269-1-cwweng.linux@gmail.com>
 <20261104091136.151269-3-cwweng.linux@gmail.com>
 <ausb-YqIJM0mI65Y@ashevche-desk.local>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <ausb-YqIJM0mI65Y@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


 > Repeats what __clk_is_enabled() provides.

I would prefer to keep the local flag here. It tracks this driver's
clk_prepare_enable()/clk_disable_unprepare() balance, while
__clk_is_enabled() reports the clock core/hardware state. For a shared
clock, it may still return true after this driver has disabled its own
clock reference.

The flag is also used to avoid EADC MMIO accesses after this driver has
disabled the clock during suspend.

Thanks,
Chi-Wen


