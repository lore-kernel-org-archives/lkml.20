Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591281;
	b=vsaVbqCJFlnfTkYov0BpBtc0WBDOC/ASpivouqEbiEKccMuua/UbuYe9sCjLLvXy+Url
	 wQdLz+5oBfVGevvzaMwGwIPIUMpfVjYFxH0CREzSGrlPKlJs0LGcmb3i/f1wCuhsrZE5G
	 7y6wyGfvCFiLd0VhzS1LvyaXmBVWLQamIbiyIAtyiTcFcFgGfOAY2IKKNaay2y8H9aeuW
	 OJbVaZZZCxvXbx4RvEr+4q3coKxqwtqHd5FXlpTpqctxO60nwDCDBkmYdrIi6SAGdloMW
	 md+kayfMb18i1seHm6v2Pc08tjC5LVZztK2AiaDGYthcPV/K7NZiNbbzCR/VNBDQ/dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DWiQMc0yS3XQq0TvbZM+Yred0vSvNUmYKHsb0aPbvUI=;
	b=x8nlK95jZOEGen3xnr0nACPiBt9ifF8knh3uYlytcw7B/8zWKdoxIBrHoM+Qwq6XHzzz
	 xj2rWR7Pr8f9herrC940uTcQDvHqi2FM8eFip44w7/Qeb9MpaQLp6T3Qe3n0z3SwFsOzu
	 cU7KOu6apnE3eqnTpj/tMPknrDp22KWs80DUFOPjPLtk0UXlebZ3vgC81vKnfCtgaRtY4
	 ehmFEqUOA+yijMOv+Ig9Kng1xvzxv1eF0zi/654e5TajAqf0RV0J+Hf1r6Beh+gbb8MdS
	 lcKExdlXyHpDzIoSP2Zz09bvtCiGPIXY1mQ3W0EfPnk7vQibs7qsnFpFCDWlyqeQ7tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NshcGPsL;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44989606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44989606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NshcGPsL
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so647091a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792591280; x=1793196080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWiQMc0yS3XQq0TvbZM+Yred0vSvNUmYKHsb0aPbvUI=;
        b=NshcGPsLQpHkQJPBseBKZ7zPWrtA4Olj1652AoNpZgt9B1kmPpjAEOlgOEa8P7Wdrt
         yuYbiH0dY25mNt+iPZGTBA4A2QvNA2aAM1tPNVIcgQkx9CS+9xo4T23BlkEOxLCr14DJ
         kqlneNUYr1bemcloYSqb8jjoC/5/rwremHKUNebclu9b0cF0QIClThp6UaG3IUdstjax
         NUYQpVMLu6u3GFyLYIkpr5mL6D5Iyw3TEvHm8WSc2l/H5C1SP/h6JlhDASzj0qsC0GNK
         eRMP0vrHULHF7mysmaEwQudXObXx9sOeWH+JPKt66fj9C+20/8ulXDtStFGp9NDpqDvv
         ymiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591280; x=1793196080;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DWiQMc0yS3XQq0TvbZM+Yred0vSvNUmYKHsb0aPbvUI=;
        b=Bu8kzwXOsYAfhYuxyl/moMpEZB0hvk8rWGQCC0kHN9Khn+HdkL9aMiygFy+GqnpCOO
         FI7XxD+coihWBeGnxfSFwQdOaodVSW0zt5OUj1x3+2dACJq4desFykLAtiHkw8OoqUPw
         Mtl7+uNWqo8Ci9ttgcRBhDEpz/DrHUJFBYyKyxb72hGKAgvwVF2FoDsegihygSMwZ29K
         sJBqc/aO0AI4hClN3PB3Oi+G2UB5mkTeD3IX+OZrJmvS9cIMy4XaAotz74jm9N03V0xo
         RRIsENDz8UjkXBIyv9WD3uO5r1sDPQ477R+QxTwOyRVmYLc2PikILHsXIdt5ZH/Hopr1
         oEmA==
X-Forwarded-Encrypted: i=1; AKwUvBxGgXmLlU4GGv2vtv/enNKs7vI7+Jn9JhUCicpAm7iUOiRv0B2rz4qgjOeH25sXiNtZifm1OEGhTxHwxDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCuLeM/sADAiA1imK94EHpGJ7Nwf44kBF18eDPnskQP5mgIKwH
	toAivXRpsgcTuFyHp4pS9gXPvnz0EM1P2bpStPZaPs54PLuuCOmgKImc
X-Gm-Gg: AYBFou18o+9340xj2+E4tUb20iLqI1eLDVIM98/Z7fDi5XoivvQ8ESiBk87yretajjU
	Nu6rENJelNsMN/yV7hAG6t023pnK/8Yn9loVZ74XFpjnoFRAdG1ldj8N4yzGjSgQ4g+c3TIrAk+
	goOjR8FRGfiHsQNdy6CDQoxePo7hFznjzhDTZweReuADgdorRZ6YdmzOWFfhB0S10SeD4jJQOe7
	QzbUuarLtU8EGMR53hCzQ9ShpiJmLse3nIQ85UZaF0ypiYTGm7MdPeD9tzIjEYTjw46mhtAvutP
	AEa2S/BnhMT8LkqZ2yN54xXNVZj18GJejH3Cb25JokmIrTGKLvJJxsRDvVAPzx9KpNvqLzNMOAf
	u7ew158GJBFq8LTZwvMTlSGdvbL7//zPAo8c3D6zVuBob1uq3G76ox8ZG2WSZlMnUff1jWl9REi
	C5ViVq4eSIzXtiaUuRfiUJsN/jOueI8AWLlfTSShLP8zGbeIsWjfE7hIDNMRAnOr2cB39H4NznA
	GiGODQbAo5xk/U8Fk86VyR48ISP4T38YR1+W5TJNI/BqXWY0k6xlxdbk5TANZYMzt/BrEBokvR6
	M6w9lMSwCbJKCziAgl35s+4BNBGpWg==
X-Received: by 2002:a17:90b:5550:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3ad87089230mr1937944a91.47.1792591280175;
        Wed, 21 Oct 2026 07:01:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82e08f1esm2260065a91.0.2026.10.21.07.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:01:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9ae11521-6c1e-4c0e-aa89-0a9c0a5a7346@roeck-us.net>
Date: Wed, 21 Oct 2026 07:01:16 -0700
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
Subject: Re: [PATCH] hwmon: (coretemp) Retry failed sensor creation
To: Ximing Zhang <xzhangjr@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261020-coretemp-retry-sensor-creation-v1-1-7dd4851a34dc@gmail.com>
 <42ee0ffb-c0f0-4426-a568-28be267e4a93@roeck-us.net>
 <CALurWnHeNBKVdVbsrZ17OjZ09TM1bCseK=R6MDgjz4Sg0CiWYw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CALurWnHeNBKVdVbsrZ17OjZ09TM1bCseK=R6MDgjz4Sg0CiWYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 05:28, Ximing Zhang wrote:
>> Is that a theoretic or a real problem ? "Test-only fault injection" very
>> much suggests that it is a theoretic problem. Have you observed it on
>> a real system (without artificial fault injection) ?
> 
> It is theoretical. I have not observed the failure on an unmodified
> system. I found the unretried error path while auditing the driver and
> used fault injection to verify the existing behavior and the proposed
> recovery.
> 
> I agree that the fault-injection test establishes the behavior but not
> real-world impact. Please disregard this patch.
> 
Please refrain from submitting similar patches. As it is, I am already
overloaded with patches fixing real problems. Patches like this result
in me getting even further behind, and real problems are not getting
fixed.

Thanks,
Guenter

