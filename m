Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD344A440F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360756; cv=none; b=V8RnVp4Aok4rbRJI5FpfACgbMzPjvwWnmTE5WTdmSqlc89zhzoOILbW25DzJ6fhXRgqLRVniX+XioRK6sA91T72lheC8Ohc0wnmXProCGYzISrkm422NZ79YNnwFfBxdMTKviwg3iexYcGWnA0SkKS35GVvA0RUFPfd1YCNs76w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360756; c=relaxed/simple;
	bh=/Km/cEE8X7sTdY0vx+XUwewtPG/KY//lKTiuuYD6nDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwWDFXWdxfK+qOSH0OoTgAZkmrgRDF9YRLyNlQHRLP4uHKT1pj1urj7dM088GDeXh+2gBONDfwugnRfLHIeShdtNt2jMWZEBmQnDA+0vPLwGL0WcXGS7OMrj7UEjtibZ2Z9GgsMJdMJNoodT8JokTdxEu4PxPp4yAsis5HizBmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9w/5mU4; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9w/5mU4"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1437380a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360754; x=1788965554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eN2mokcnF4HYWxdSoUigLkSMSR4I4I4Fah8FFCa/XVE=;
        b=c9w/5mU4+VQB94eN55lidGErEApxoEff2QXNMstjosa3JoFo396OT3KvTwSNGiApEq
         DEzKl3H3yyZBmT1Gyg0cnVkMJm3zda9iLSgS7fyz6rzdsUzscaYXT07M7eTNrmo4vapg
         xU8bxOpXwTMjU5Hp7W+h9dDZjiA/YnTtTBZQt5WRdBXycvUynJgoGL0Xo2jUkPVUdV7C
         hKqTgtUbxxQ/eVWshawJkrDHXoHskTt7xCKrG4xgoVXfwTNc/dtwByMDhjx4nH4bgYLk
         nfq/AvY4IZdcBJvxPELja8QoyhfyvhQtCUoAsS6sXJf0m4GDsiMt+I0oTd1c7puG/0II
         Nibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360754; x=1788965554;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eN2mokcnF4HYWxdSoUigLkSMSR4I4I4Fah8FFCa/XVE=;
        b=T+mj01ngZJYr/fzqXuAn9INlUWbJDFDr6ppI06/deP9uN0vEa0qP+BV0cLhz8t7dUg
         AetuvABViUBArba7o+W97b4ZRtvGT5xo7fGZZZ2kdsCa6T0y5UJCy6cBz2++aUPO4FtM
         CSPya9Dk2M7i4AhodKsYRn8mRC6Lgv8QJzvFWTexYhRpMSMK7J789aN0hGvtLv4SykY9
         fm8TUkzQ7X2cJR1k9jEq06Gm+Nz4YBDUkILQk9/IIsB7u/P4qAhfWR6j0wcG8L0WozWN
         aKbRWXEL7QZRk9WohFkZgWqlUpyDSk5UKHpu50yc20npFtQp+1Qq+bt6z19L0dtHZqCv
         BUYQ==
X-Forwarded-Encrypted: i=1; AKwUvByT+Tkj3ebEBPBc/Z3WyYRiF7s/cwFZzVmCXxQi48xkHavltuljrEio7BqnPYeI/NgubczypsfQ1s+bL8w=@vger.kernel.org
X-Gm-Message-State: AFuF++kapW9GcubBtz3acvCxR+KtC5nJryVBhF4PTxih81htVrfSs/JA
	CMOAq3tPSC+zUuh5kgTCkpU6c9ub/Cf9qSlomwWiy+WN5pjdszxfRLjZHBFf8A==
X-Gm-Gg: AYBFou3qrk91pYKnjC1wZc4pNuSX2odMjVB79ugWJyojzq/3bloZN4c2wBvul5IANqe
	d9T7Hzw0gceUr0mNE/LTyWImJDyRIQhmj0ZZBEn4l12CjnXfYxfONo7hGusiCc+NDSJGYWJFASt
	BhJCLy+JRoLwztpjmI3ARyDn1I+fWCIg6+VTVUC6WsWk54MqwdSO0b2zovTovauBM9CF17/4VGX
	Vqls5b6XqMH2xRcyyn8L+8hIM80JEUBZJNyVCp7TEHO5cBwnUaXulotzE3f3YAelinGEJXJif3s
	9cShyVXW/MTfzD5KaTP7+56YqLQcdc8fvhr1ltJ/QioSNNoMB1EAN0rtgx5PZnOXJgFMdjN92nr
	uetzRr5iofqSOozMHmOfg1GtIuI+XZX0J99uph4IUi51kqdI5jK4qQTegwCqDW3cGv+e9FAfDpG
	6W6qKLEbQYUiP9InuSxY9V+iOlz80yGxzuhrudGYYUSgMY8HObbv1SMN7SQkWXgecfkDNnTwQap
	RhEzx1t7pHbTdaksFv3iNgU/1ZnwHuFzSZypkM=
X-Received: by 2002:a17:90a:c10e:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39aee27cbf3mr8547234a91.23.1788360754047;
        Wed, 02 Sep 2026 07:52:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75b540sm12151690a91.10.2026.09.02.07.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:52:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0de99cfa-7de4-4236-930c-2c037aa1648e@roeck-us.net>
Date: Wed, 2 Sep 2026 07:52:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Matthew Bettencourt <matthew.bettencourt@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
 <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
 <37132c40-aa82-4df1-b5ce-337601f3c085@gmail.com>
 <3c4e9f59-5272-48cf-a4a0-eeefcba955a9@roeck-us.net>
 <763a8b30-8548-4ff0-a1e9-8e74bbfe9b02@gmail.com>
 <6e8761aa-67ef-4624-834d-4b9d0ce729d6@roeck-us.net>
 <9753ed80-5666-42a6-b04c-99b9ef9326fe@gmail.com>
 <5c17ea39-c479-4f88-adc6-9a86f3dfb96a@roeck-us.net>
 <d80cf68e-a6cb-4b0b-807e-313be29ca8ae@gmail.com>
 <49cafd78-2468-4b43-a376-a8b2e2de2c19@roeck-us.net>
 <11de1daa-702e-419e-912a-db37c9f28e92@gmail.com>
 <67938f6d-d60f-44cf-9b03-fa472c8a8499@roeck-us.net>
 <65336f12-b821-449b-a637-31972807c676@gmail.com>
 <a953dcaa-cfff-40c8-85a9-c12601e49e85@roeck-us.net>
 <9cdf4b63-8f99-4a80-b0be-3f3df69e526e@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <9cdf4b63-8f99-4a80-b0be-3f3df69e526e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Matthew,

On 9/2/26 07:00, Matthew Bettencourt wrote:
> Hello Guenter,
> 
>  > It would be something like
>  >
>  > sudo acpidump > acpi.log
>  > acpixtract acpi.log
>  > iasl -d *.dat
>  >
>  > You'll get a number of.dsl files with cryptic assembler-style
>  > code and data. Then the digging starts ... you may find something
>  > like "Name (SMB0, 0x0B00)" in dsdt.dsl. Then we can only hope to
>  > figure out if ACPI actually accesses it.
> 
> That wasn't as hard as I thought. I got everything decoding I guess, I just did a grep on all the dsl files for SMB.
> 
> $ grep -i -rn "SMB" *.dsl

That matches almost exactly the dsdt files on my main system (MSI MAG B650M
MORTAR WIFI with 9900X). Either I have the same problem (I don't usually
suspend) or we'll have to find something else to blame. I do see different
devices on the same bus, though.

      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- 48 49 4a 4b -- -- -- 4f
50: UU UU UU UU -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

[spd5118 is loaded, which explains the UU, and the system has
4 DIMMs]

Compared to yours:

      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- 49 -- 4b -- -- -- --
50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- 71 -- 73 -- -- --

That does make me wonder what you have on 0x71 and 0x73,
because those are often I2C bus multiplexers. That could mess
up everything if some entity selects a different bus.

Guenter

