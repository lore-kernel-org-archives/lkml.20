Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924300;
	b=zhJPopR3eSw1KJc8mc7j2ofuoWznu2DvjenyiJEjuTiRHYbM8mXSrn/LL+CaSGZfg7vj
	 NMWXZtkLc1qAcT+JlZJCOgbrSBDKm08jcrYU7GZMA1KcmXzUT4aWgvjuGEHt5B2KOO1UQ
	 Ax6MLarh0Vsg+t47EBn22pEPJqTp7eu8m0DD07gU8Z/g175MYSdzGitJV/12VE226Atij
	 LGgTh7kT0KH2j2IxfY8bXaydBnj77LBZaRO8XtiVYUtHL6zhcEjjHXOKtiguB2Ir4zDbb
	 Ed3tKUi0tYYxGVL8VigkV2o9ehm5nkQybyU0RLBz59hvDWR7AKA47M6dZ9EVXtyi4cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924300;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=o+yBsenDI2wUPc8JhBFdOyO8USU1Y1cTrtOmqBqpCOY=;
	b=akjGNkCRsMmnd3HmlD/P8kKfziDopkjF1xOJ84j/BHLhfyQZ6/6HZErpdv72chPTRKiX
	 Z7QpQ+rYFR9WayeNpr9fBXZdOkH8JMeQ85iaBPKx7lJ72dPgQ/ls8FvgBcCucArsVFpT7
	 tlQZGvDSNl7jLmFshewu3bXuzXdHekawjFLhr7CA/unL0OEdcBROVUFKd/J0GPkArio0o
	 5VGvSBrvOFTP+SRVo+AnJF4hdXRrQkNu8W/ApLRe77PIVXCcumMzp7dWe2aw0EBLR7/oH
	 ph4P/EqUtmnHiEwf8DYtTJOtlq8ryJsxGljy2VtjosrTiOlD8JM8UmxC9fG57ExYpsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AWTwNaXE;
	arc=none smtp.remote-ip=209.85.128.225
Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E35606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9E35606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AWTwNaXE
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-8b4e04eda5aso18131827b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924299; x=1795529099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o+yBsenDI2wUPc8JhBFdOyO8USU1Y1cTrtOmqBqpCOY=;
        b=tDx5lHSizonCnhT/WQKCeDLLlB5ZDW5dxsuTzGk6/+OiWfKt4dc5f3RMoQWHJmeLd6
         6SvfKipvMwcvfoXImzREbJB2SxbcVKbyW29URVpil+e5ZkdACjyFzIvZCd+0mFcYew1J
         1wFmuwLv8ECFSUAetUf7mRe/j6n7E09Xr/GY7nioHtpifzPj2uKDUctqBr9VlvDw2dLD
         NyLI0w90BZqB+Q3CwUvUP8HzITjlMx+EFLAAoS6iKoj8O4hpLteJF332HvrbcY0Mp6ZU
         X4S1ig322DEfiJ4c1c7AQFSNaC/x+KfolTliE2LjhyqpXhG3vkRqHsMelrIc/LG9VkyT
         Ejnw==
X-Forwarded-Encrypted: i=1; AL+hErHMFONvJ8mpbfkuNVOd+g5tmbsLfHOvYvuVqFpD4FUlxL04xSQYxtquPPY3qsULtOcTN4vPamKU8pf22jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QyEch+ReVSuimknoJlTmk251+kKIjhYU/gnFFA5dBda78Zm8C
	bBANT3ooNSHseIB8YFgOX2E0i6FZXek8q8Lk22IqIMa9QRPM6Axd0oOvkbjC8DyYdaerzUNptNM
	Nl6i2RF7TVmxOlAAdgY+Yku1sGHJXqb/mNGbwMY5LW8Sq9Yplxrbcs+u7vw+ezgxemJlHBcMqGF
	+0NRGksvrj+56fWz3AEV6kVvkyGOz7WDoAt/xUQjc37sqXIK8Fr/j60yIwIGQ/IdZtdxvQ5Who+
	UIr1r3MjO3XxngPTQgNZVh6Ew==
X-Gm-Gg: AZFdTZflouiOLWLFe34KHBetXvn43ii1Tgt4Z9j/8MNTkv1VAHN8S7M6LTLvrUqqv1e
	OqMu6eRg1hblbz1k3T4PDYKwGNLgPpZ9qbd6qo2VBedpgxD7HRE8qK7lI/ZPGMJ9r61U8olr5Fm
	nNsmxTDQCbo10ApwD51s1fy85vVT5k+vP/ytnr1j5iLSy5GLVK1uxte64emUofj3ALiO0v+/ARv
	ttnutlxr3eQQK73C8+w8aqIFndggXoM1RDcw5E8z0sdixLoryapJ1+PsGXGL+47PTFSEYyDJ4/x
	4LTMhWbfT1Z6ng/7cOwym3K3mOnd81O6sNCnzvn0ZAuOqNPJ9jZn/wrqwAL9cn1d/47J46iz9if
	AAp+rFGjQKDdtAqeOa94bZmmr7tObgmuNTebnn7tdRNQY1XV5p3z2qlZoc6juku1F8LmquipCLp
	EZIkrKorQGTXvPHgT5fq7fQf6AfBI3V5fAB3hWBMkICg==
X-Received: by 2002:a05:690e:4144:b0:67d:bd3b:2887 with SMTP id 956f58d0204a3-67dbd3b2f20mr3699789d50.24.1794924298554;
        Tue, 17 Nov 2026 06:04:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67d8a6f8234sm158360d50.56.2026.11.17.06.04.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:04:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb5375cd68so41446735ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794924297; x=1795529097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+yBsenDI2wUPc8JhBFdOyO8USU1Y1cTrtOmqBqpCOY=;
        b=AWTwNaXEjfwUkOqo6D6SHwLlHauaazz2eT1ha/I5TBu4UF6akWIqgHCSnoNAyNdYSc
         fx0MhOKJXiyIwYesfBBVEP/PPcmPt0n6Q72Ipt+K+fOJ1IW5OBdt3vNkfusemvZC+JTi
         gAUrb7o27vgblNcK0vByA6wJ6TtNZdZNi1zL0=
X-Forwarded-Encrypted: i=1; AL+hErGRs+xtCNsV3g90fC0fSNtC9bsAMUjtBYHe65laEbTxATsiqExNzzNWQ4yUrMMUle32f3t0xwcFNjxHe/4=@vger.kernel.org
X-Received: by 2002:a17:903:22ce:b0:2df:a4d8:57ad with SMTP id d9443c01a7336-2ee0dcdaa1emr123675055ad.72.1794924297124;
        Tue, 17 Nov 2026 06:04:57 -0800 (PST)
X-Received: by 2002:a17:903:22ce:b0:2df:a4d8:57ad with SMTP id d9443c01a7336-2ee0dcdaa1emr123674805ad.72.1794924296646;
        Tue, 17 Nov 2026 06:04:56 -0800 (PST)
Received: from [10.176.3.187] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76db218sm16492325ad.3.2026.11.17.06.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:04:55 -0800 (PST)
Message-ID: <b4ef6564-0e96-43b3-8784-57543ccf8ce7@broadcom.com>
Date: Tue, 17 Nov 2026 15:04:52 +0100
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
Subject: Re: [PATCH wireless 1/2] wifi: brcmfmac: zero-pad SDIO write to
 4-byte boundary
To: Tristan Madani <tristmd@gmail.com>, linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 fariyaf@gmail.com, linville@tuxdriver.com, kvalo@kernel.org,
 linux-kernel@vger.kernel.org, Tristan Madani <tristan@talencesecurity.com>,
 stable@vger.kernel.org
References: <20261102122311.181075-1-tristmd@gmail.com>
 <20261102122311.181075-2-tristmd@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261102122311.181075-2-tristmd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 02/11/2026 13:23, Tristan Madani wrote:
> From: Tristan Madani <tristan@talencesecurity.com>
> 
> brcmf_sdiod_skbuff_write() rounds skb->len up to the next 4-byte
> boundary and passes the larger size to sdio_memcpy_toio().  The 1-3
> extra bytes come from heap memory past skb->data, leaking stale kernel
> data to the wireless device.
> 
> Zero-fill the padding before the SDIO write.
> 
> Fixes: 8f13c87ccc49 ("brcmfmac: Split brcmf_sdiod_buffrw function up.")
> Cc: stable@vger.kernel.org

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 3 +++
>   1 file changed, 3 insertions(+)
