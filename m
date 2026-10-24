Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792858397;
	b=vCk8t0jGkw0I9On6O4pWPI5aTGEGqa0EU4etJQXTSsliQx2uZCSLJn/PnTeUPQcYB0YA
	 9+JFdPxjxXwCoSDZNj2cCoM9MVLMEXy6d2cBcUP4vGU/klmwFHrHF+ywtHroOzNpu9P1O
	 VdQfrM4jT407Wb2KU0FqYoNy5q6BC+gga07OOqWpTraio0HqNwYbf7r9EPOs6WZmKcZZd
	 rQT4RBiKeV5D3Xxw6VIPmdzChvnRrUoGwlbWrI78R9N+CjaBq7/6j4N63fEO7JjvKW5Al
	 5MPlqLJnxDNMxMbIVy0hhp9kgzgkPcdXuEJcl4gHC++xCUyGno/k0eD8Y/nMEiztKkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8m4A9jkTkwuo4ipkSykg8HyuJpfZHAGONM9dzpmnNxQ=;
	b=PkG0SvnJlawVssVYiMW/GpvbqBq4tuaYPEUlpLFkmFA/yeE0OXeIpFs7fTqxEU6VBXKj
	 8ZohPF2bY2Z38fsIF+fc3Hr77+7FcIEw9SFMIKxpyibY7FTlaqC5f3qJP2WULP4kWFh3r
	 X36zTmxgKMLVle6ibLcFum8uoMZFRpvygwPUHCGMvLoGqfFMhjS6QMIPoqyhUQppJyS4a
	 o5C6ExG1PCZIeHA10CVgoWxu6uAYAg/1xWSgU8PufSkpXCFdACzTFKaDTmV/Ej9dn+OZN
	 49ItudLY/WTl0qjPLiWaOZxTpPmBPzc07XgDjJKtE6OpsjjE084bDi2WIK6TMJkOKxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LOwkl1uJ;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5331B606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5331B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LOwkl1uJ
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-930c0f9c1b1so160559085a.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858396; x=1793463196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8m4A9jkTkwuo4ipkSykg8HyuJpfZHAGONM9dzpmnNxQ=;
        b=LOwkl1uJjZXsyTq8dwsJoMHwAKpGn77KQcY3H0yw23C9r4dTTVvcDlgLDEikbuJY+4
         Ao/uvrFCciO3LdnUywnotj6RN588OeRabGyqdlDG6XQrn6ecjwoIvditQV2+okx3PRCI
         qHAIDX+fcPbPxKJjhJovUMMwo18HTYhyyYX9IsKIWYcCnr0gPBFPAXGfL7MeNpu8AHSw
         q5TB07O1KXthKywbT/uBoivV4wNHY7NJPxPO5X2zf+pgbqHX4Fo4HmW7ob34IHZ3JLbD
         mx8GEW8h3wxFZVouORyiokQDKPFY/dzt/l3DWAqoTKEUvyefvizzCr/ZNem859PHjQ2D
         K1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858396; x=1793463196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8m4A9jkTkwuo4ipkSykg8HyuJpfZHAGONM9dzpmnNxQ=;
        b=2JNeZTZp+aGI32tc+5IgX5j4WmgWiAxpuz0qLvnwwcpc/A2EEtw9GYaJ8zfLPX7TEf
         NMLfQrX2BZ9pYBsuHGB1po5aG0pug8TyXIZJUw8Ci41cNhPfrFTiD7lRpA9kRVo9xw/p
         sbJRguZMFXjTgG1jzTJzhOquUQw80NCnDlRzP0FsZ7NU/T0pBVe7YXLxlZR8aeD8vpn3
         XAGF5DIhrgKEbLeC2yeDIXLv85Yw4aFpdLXxybgb0VXApESu5URqfV/dFCiH1kfnY+Ji
         VcCG7UrHBXal+Pn5sgDwQ6ZiyPOixODbhhv8xUqLZq5arMbeCAgiRwRU4TT7RPe5PhR6
         C85g==
X-Forwarded-Encrypted: i=1; AKwUvBx6jlECOXVCcHsQcIT1ZlrYX5BpDQZqq5yMWDezJ0m4yunRC2KLRXFnO3thFRQ3lsAvOM9xSgJ8HigiLZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMBqi7X4YdDOrIqIqeLA5EV4X3jpNMxCsZ0h7CgDgcfhpiQIB3
	s70s2U1wEAHixqk4FTIURfTy80EqBO3WKOryc2vYrCJnBFAvZr/sPjOb
X-Gm-Gg: AYBFou1LyWcP0y9ejs4vySvg95sx5bp/tKRHo9/3gaHVXC2uy49CSyONlUs/eLyqkMh
	VsccwpDwNMD7rPU2h4nbs2NrCSVseWQ5TD7mpZjQD1htMsujAjdfXpBC2tIjq8pWFnfcAiSSGyw
	ypb1nggdCH91sx0tzv66OS7Rgjws5diFDqC/m7VuattBQeX9cy1M4Fc0fCn99S60gK59GXTtYi/
	BkP1e/6MC0LfeYu/QgjI/VxAg+ROlOisnvGnlcYicvAqrAzRS2l45ggeRpONZfNMq49yoAXLj2x
	FuxtLsQ+2TZRZwRNELt/GTcqbAFpDYIfu/mYyyRxo5iTHaCT1R9ySgV1T0ZItaXobhqPOOAg4Fm
	25EzZyUXcLZ1YEf7hdKEr62x7e6MywmCCEExc0gkT4XJh1Lq71Xq3syGHZkUU/PZEniU/Eo6T0v
	lgZkTv0nBZKdLX07X6ZJ7l/IxlJ571CZ8fcl9iBl92awfsXhKNbNE61Ed/6wB8LSTel6j4zERgH
	f06DJ6vva5qoJMnLyen91DLwT+9ItUa1mAIDNp86qO4J6eE9P8AfFDMk0PXoagZMeKajxUWlJaY
	t5O9oz/Q1Ii51DvIxXRb14tEpA1OSZQoXzeOQfyMEUwKEqPDDPu9oN3G3bhDl4MzQhFi1A/jPOY
	34MPa3EpOXuybX6DnX747iZLxYIqanxbJBEA=
X-Received: by 2002:a05:620a:4515:b0:93e:fc4e:c490 with SMTP id af79cd13be357-940ef913660mr339909185a.15.1792858396158;
        Sat, 24 Oct 2026 09:13:16 -0700 (PDT)
Received: from [192.168.0.124] ([134.231.41.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a9720csm210593385a.42.2026.10.24.09.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 09:13:15 -0700 (PDT)
Message-ID: <59ad0f62-dd4c-4d42-b50a-ab91bf469fb7@gmail.com>
Date: Sat, 24 Oct 2026 12:13:14 -0400
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
Subject: Re: [RFC PATCH 0/1] ALSA: add PreSonus Quantum PCI driver
To: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-sound@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>
Content-Language: en-US
From: Jamie Steele <steele.jamie1991@gmail.com>
In-Reply-To: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/20/26 4:36 AM, Nicholas Johnson wrote:

    The driver provides playback, capture, raw MIDI, sample-rate control,
    clock-source control, XRUN reporting, and surprise-removal handling.

Hi Nicholas,

I previously encountered sample-rate switching problems with this 
driver. Another Quantum 2626 tester has now reported similar behaviour 
using the August 20 RFC with Internal clock and direct ALSA hardware 
access, without PipeWire, JACK or a DAW.

His 15-minute 48 kHz duplex test completed without new xruns. At 
requested rates of 44.1, 88.2, 96 and 176.4 kHz, measured capture 
delivery remained around 48,000 frames/s. A nominal 10-second playback 
at 96 kHz took about 20 seconds. The actual hardware clock hasn’t been 
independently measured, so the cause is not yet isolated.

Full setup and results:
https://github.com/jamie-steele/presonus-quantum-linux/issues/34 
<https://github.com/jamie-steele/presonus-quantum-linux/issues/34>

Is this a known issue, and is anyone already working on a fix? Is there 
a newer patch series or development branch available to test? I’d like 
to avoid duplicating work if an update is already underway.

Thanks,
Jamie


