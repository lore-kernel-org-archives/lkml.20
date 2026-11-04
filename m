Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795391;
	b=tZu63k/gWXA8e3Q2DIdJNRbQTXs4J13Ef0YwOiNiSx9Nnnh+pG35lCzIx4t93vPnmuHJ
	 w50/3+fusrTr7lFiwfpfso1kKoU79rkvBpupaqYIErNQThnfCSWegjkoCr3WjXPPPCI9V
	 wJ/7FMfcxzti/DPJJ9ThxxTuwqNVBAQ8RJHtqMXuwKaCL3t+8/ED2UcFBhAWBgaEOqTqC
	 bNasTuCOl0Y9DrbSX4CHnEbJrVSSAWP+Dc+lbT0+0m1Fhmov1tz6EktfWH7f7IX9sXgAy
	 unY2OF7Fwic0g+SfKLpj+9NRRsch/blS7ZJh94now82oPkqbhiajLJmZVR7TObC6bCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y3sjZ1/zDmNq7aGULg41fVtfLI807ZzIhfXxdB/64Uc=;
	b=4SKUSVyCrEw4vj0kgAuTcInUkSFOL1QxPAeqmwWXEe6XvRxuDMOa2oIutNMCPiycfLFJ
	 skikSPxMKGFAIyqBxXuZd3JDgJhk95LySDZz7aWZVxfMQRTyZcALngdR81r78pB6qd51C
	 13Y0BdIceTHQ+M3vDDqpN+bbTm6xv/cjf5j1TF1pbGlDER5J9jPRDd55QDjPFstU0Ryag
	 uJhK+60JbUylmqCCN2fcXqaBH20h7X6e7TCuuuBHSROFAXsNv0CpmBeB1sK5ygo6kdoXs
	 6DGj6+7O4qh9/4Uu+VU0mtk71+0Z43KvTiSqWFjo9bfbF87OIbD/u3FuoRvvQaDAiFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FzTt+3xd;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF52606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF52606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FzTt+3xd
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so7346415e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795389; x=1794400189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y3sjZ1/zDmNq7aGULg41fVtfLI807ZzIhfXxdB/64Uc=;
        b=FzTt+3xdTbOOD3tFcDwCJyIEKFuEvWwAb8w5bMFf4MVSJUbghB0caVzlLdBwZ/acs8
         vncxBJuIHI7KzxK7yszgdt0KZPF6jDUvMj1W/2KX2JQL3SqNLkeCcVdxE3++T69jIFCn
         ACmaYiAD8E/DYhcmCPnWhYBlIwI3IYqMw9h1SOC+K6xPfCqiP6MSdq1qO11P5wN0hgtP
         NGIV3RfIiIyC0RQ4NSSkUkjfMiq+9mFSpaYOkP2yiCkCTRJU2/tBClYrZx/M6TOqIg1y
         BIgApH5uFgqTglyZI30DwCQMNldcLZY2DXew5AxAoXwZMe0gA8T3JlpxfDVDObRrvAI5
         v3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795389; x=1794400189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3sjZ1/zDmNq7aGULg41fVtfLI807ZzIhfXxdB/64Uc=;
        b=ZFlnCdmhoCjmx6yS5D1zPoNZXY0zem+Z94f0TAI8tKKykkPB11VuXxjfmeOXlJ0JN0
         CrDn7jE2G+YvLv5eXyT6Nc0Sv+b8EM9bYqkztnOTp2vfYNkuYQ2nuQnDhw7n8UcjbAX+
         2BlSwoZxDIGW52BBWodPgAd4/mB7hTgtFIcYmoxMl5iwO3i4mL1hp3gRIsGciSPuYrgu
         PPjwiu81UShI13zXF2AyGTD+noEqiPz6roilIwdKzSW/KOFfV5AgvsQ3hrd0PO4PnddR
         49RoGCTPNi56FrLOD26T7BYl+icU7/2CAZObUaWnu4fPWQc46jZ3NJabeK/s9wsrY1PB
         2mWg==
X-Forwarded-Encrypted: i=1; AKwUvBynmeJuL64W9UwuXiULdhTNjX8hlq9ONuj/qzSJzU4zMY/EDq1oN3DC3tAoDfUaFvJhH/MNeQ2o/o8/JWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ghg8IA6D0KsPKzjoBfqHToYqo8JJ7Zc0vVq3+ze9FJdcWgZPI
	wywjpKdP4Rejo6N4B0Uusuc+vhaInWqKlxyJfA3727qlrNXi3WXzjkFr
X-Gm-Gg: AYBFou2U/t/7l/4oLYPGNzdrx47trXfTMDO5No6rofJyG/OZNQR69XifvJPai6WX7rR
	fDIQLrkCXyAyeUQUwK2BKaLQIZS5u0NE+rGvbnnhamJfYYfWEHVQCkT5yhLBPTQyJa8c80tai5p
	mEDloc4BuZc8bLf+RB/gDeF6OsnrM8ayPVaWp3Pr0KmHhj9rF2DH2rZtPrO4LvvU5Zlugm3w4DE
	5kmcdhFag5VeTLkLEidji3ltne69TeY5QLzjMP9cJA3hqHfjnFTjTlZUlAgcRjKN6V1BY6bHNKX
	Hd50xclA+Th+wYt7AuYqOIoR3q2y3RScVupVPRkvEXojO40+7bjWCtOsVzbtLqrsJ9EInmFsMcO
	jKuCIBipftcsENKGDdjhNRln681LDpl6R1RLBS1Xy40YW7htU5zzvCMg3EEWhg/OxcHAc2+zmD/
	5jsVwdqyB6jPW3GkAzzN4diUK6WHxchRhBneYLuU7hWaCiJaOSqENDD60S8NAYFdnkM/4IB2kPX
	qImT3SDqPfruVfWdAEijgoEMYQTIOsRnbQaqa3uqrkZ83paTAKByJFVEpWaKUAjGxGT298HiXpc
	1xyEUrgQ+5uGtDxpdBJ5LDs=
X-Received: by 2002:a05:600c:1d02:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4ac16bc4731mr395490185e9.8.1793795384605;
        Wed, 04 Nov 2026 04:29:44 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aae24b32sm129017035e9.12.2026.11.04.04.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:29:44 -0800 (PST)
Message-ID: <bb3a8a16-daef-43e5-8ede-d9a6b7a7bf38@gmail.com>
Date: Wed, 4 Nov 2026 13:29:43 +0100
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
Subject: Re: [RFC PATCH 0/2] memblock: keep reserve_mem regions out of KHO
 bootmem
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
 Alexander Graf <graf@amazon.com>, Changyuan Lyu <changyuanl@google.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org
References: <20261021211058.83483-1-azpijr@gmail.com>
 <2vxzqzhhg8l3.fsf@kernel.org>
 <32dd1f28-db55-4674-99bc-74d9d3ab25db@gmail.com>
 <70686061-787c-4c99-ba5b-ff982c8cc2ad@gmail.com>
 <2vxzfqxglrg6.fsf@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <2vxzfqxglrg6.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 1:19 PM, Pratyush Yadav wrote:
> On Wed, Nov 04 2026, Jose A. Perez de Azpillaga wrote:
> 
>> On 10/22/26 10:16 PM, Jose A. Perez de Azpillaga wrote:
>>> On 10/22/26 3:37 PM, Pratyush Yadav wrote:
>>>> On Wed, Oct 21 2026, Jose A. Perez de Azpillaga wrote:
>>>>
>>>>> On a KHO boot, a reserve_mem= region that can't be revived (new name,
>>>>> size or alignment) can be allocated from KHO bootmem, which the next
>>>>> kernel boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG preserving it
>>>>> fails; without it, the next kernel's memmap ends up on top of it.
>>>> What's your use-case? Why are you adding new reserve_mem regions after
>>>> cold boot? I'd rather avoid making purely theoretical fixes.
>>>
>>> I don't have one, I found it through the TODO. a different reserve_mem=
>>> in the cmdline passed to kexec is enough to hit it.
> 
> If there was a use case, I wouldn't mind fixing it. But I'd rather not
> add code we don't have a use case for.
> 
>>>
>>> if it isn't meant to work across a live update, would you rather have
>>> reserve_mem() fail on KHO boot when it can't revive the region?
> 
> This sounds good I think.
> 

okay, I'll drop 1/2 and send that as v2 :)

-- 
cheers,
jose a. p-a
