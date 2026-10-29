Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263941;
	b=rvxwnWeekfH5tVQKwRpBouGTFyT++hp3H8TxVLe4vNs4got1ImQidUYdSGSoWSuhvpR6
	 bd3GCKmgcSQOkmciSdBj4SEJeftgANNEOeX041EuFMXeJV6xmt/eaN8Va5u8MpCwPJNZk
	 c1Q5Ln1U0VXcDYwII2X46o5V5VsFqNeTM9NAnood9vo8QdLuB6bKD43fD0zu0Qwwk7O4K
	 V8KPXIx39XaUDpVzLXX9mI8Fu5a9d7SWP0Tleeskbwm0n7twpu+SH9ZIJgreFEipPUO3Q
	 /VpHh3WBPyHLSIaKmXldINGD0nnjRC3K0GPr0y+g+/hJXNmrgs6tt0P2qzXvhzIEpUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Gv8+m+QgPF+dHnlKjkvyxWOczusyoFg1Sgu0wSqQt2Y=;
	b=Hsqp5noD2Zb4ueZkbUHNutRgzH/K314AT24CSXY1axPIewaRjFPRWr5pMuoTDcrcwobe
	 GGSFuIKsXs6QLpi2NA5V9O3e4HTCKDkPRkYKogCaD1FjfwKXRQ2dPHWgspIOagEFqx4Uz
	 kcCuMsSrra1g3lXjCmZRe1obp2HwkBf/gVEcLD1icOQDSZY6ChtqHnYDdewqnBOROi/7y
	 KoUL5FUDWXHvwKk+lgY4GsxhebbbFvbhTRC++6radpPGWAE4MNgdHQx4YEM2LMPHJ7Kzu
	 jash5IEY5AmhpDMKpGrQJYsqCzfpYaVs83GWqtmmsl92yTS2B88lOesTlkwHBJr00cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=AZQLynIu;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBE8606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEBE8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=AZQLynIu
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e47347279so1274923f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1793263939; x=1793868739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gv8+m+QgPF+dHnlKjkvyxWOczusyoFg1Sgu0wSqQt2Y=;
        b=AZQLynIuAkv1ZxUEIzHuGL6g/T1/iI5IrYiMhrg86KmJ+eg4wm+adc7EEryKM518h4
         LYhmDrTLfV+Duya0nPUSKbbJWEax4a9+ivsqC4zX56otSPjtuaYFq81NPMB15xaxizN8
         jBIHJLEwDp68+d0mhgyVv/aBUl8/Pd4FkIbNzYd+M5Zn9e9mfI+9HJJBKZYDtvEMQl5f
         KmJMDHnv8Xdo8BX60M06lwYeHx4//0ikrSPSF0cYLxfavLh0WaHeTbDhL5mM0zJ1MwN2
         PqCfxWnkaJ1InxrdwpmjzRVzz5kx8eQbByzWic7TsHtyzRxczcdCc3GxqdGob6k6Ee22
         20Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263939; x=1793868739;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gv8+m+QgPF+dHnlKjkvyxWOczusyoFg1Sgu0wSqQt2Y=;
        b=Plreu2JJDIb15wrzwZceMz0MQHy0JnNMQQ4UF4/wtP98LyvJ0achp4htjhywjc54Uj
         EC116esetL1jdJUlbwKWz5IZ7kT/YEXgMBNwFpe8Avgmcy+XOtIZEhc7QV2Bmz7e+tCu
         IATewsT1fuZTsFSWcDrks1caERhhbWAMaHjfOrZ9Ivu9mEMznVM/7uWc4myel2/NaSwO
         AM9og986k2Ez08FyUZjVFeCrMHcsE5+WGdwhgzedJWB6cIhWXrRn+f9o2Vl6YzDEAC15
         gnqjPx2i2I5tURrrWvcGg4ncmMiHr2ugIoTAiuFstv35aBj6Cgrb2Fl6JQTuA1HPrdx9
         UAdw==
X-Forwarded-Encrypted: i=1; AKwUvBxtFvHSrOqn6s5AwctYDadhcfiKJ5slbucCagpw46Ad0MhzqWkdhrU5YXkaHt5CdcLj/F9+K4cnUrAqwI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL33my1soIEnbKGitDO+2bqz1i8WBt4hqiOQ8EXSxQyVDl0gsmQ
	IT+boAZVhyHphZluYCLY/Ar4a2nIKpaEyrC751nM+a27y8EG0gHGWv1oHz70Z0D6CpM=
X-Gm-Gg: AYBFou053w6BHo/EtThwB3/h5xrGRS0Wv4Wy6fyjgWWU4AcbwQybv7OTy0IV/xDjfR/
	80B9uW2TSQToW+AS6T/zyTbuZalk4z/E8SUYwt8siCKo8eu9mFcN07awQ4OLV8lJoEVnr4/QiW2
	otqg+7npAkZxXgVSs6v6NpIfFbHJGnerpTcENg3AiLNmyrl+p0b6syPTxOuYurvwU+cTiW5k+LA
	gFoZVVb1mtuTVbYh96URle6szu/IE/FvJNb5zQD6F94c9k1mzEgolKwQHvBrdwMrt6OPzp4GAbH
	FBq5NUhap5Z/TYYCDiN7ZMXjthLtmryrqEMGqWooS6Go/Ihahi+uNJGVyVcH+/eF6PK4Tyu8Jak
	q6lFZvNpolBxZJ7aE/i5oqwjFnjS6DRaTTcYaxvvsN3LdIstlPg7HTO70dCdNHaeYPNtEukaiG6
	dgrlCena7uo1I+fPp9NXpzuEG6idqCUjjrnJU2c0/JUnsi4GM5aadePfCWtVlf3dRhyDEBS7aPP
	eSWs2Y4w1jslEpTSejrnM39cesr+uUZOqTnYgqPuBXWT3mD5gbPcEV6s36qNsc8Cee+Yo722lL1
	0kmniB9NgItDYIcvoD173OUk7RluCHYvQ0m+btyBtbKCcu4FRUkuhQGN49Q=
X-Received: by 2002:a05:6000:616:b0:48e:5c60:6a3b with SMTP id ffacd0b85a97d-48e5d5dfd9emr11686469f8f.46.1793263938677;
        Thu, 29 Oct 2026 01:52:18 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm32992051f8f.4.2026.10.29.01.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:52:17 -0700 (PDT)
Message-ID: <12c35123-2c08-4d3a-b08f-c646b1a7b982@blackwall.org>
Date: Thu, 29 Oct 2026 10:52:15 +0200
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
Subject: Re: [PATCH net v2 0/2] bridge: cfm: correct CC receive monitoring
 transitions
Content-Language: en-US, bg
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: Ido Schimmel <idosch@nvidia.com>, bridge@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028164730.253238-1-pocj8ur4in@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261028164730.253238-1-pocj8ur4in@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 18:47, Baek Kyu, Kim wrote:
> Two CC transition bugs affect CFM receive monitoring. When CC is
> re-enabled with a new interval, the first RX check uses the previous
> interval. After CC is disabled, a received CCM can still change peer
> status even when its RX work cannot be queued.
> 
> Patch 1 stores the new CC configuration before enabling peer RX work.
> Patch 2 keeps RX work disabled while CC is off and skips CCM status
> processing during that time.
> 
> The v1 submission covered the RX work restart. This revision also
> addresses the two review findings. The interval fix is a separate
> patch because it has a distinct failure condition.
> 
> The combined series passed 8 CC interval/transition checks and 3 CCM
> status checks under ARM64 QEMU/KVM with bridge/veth. The CCM status
> test failed 2 of its 3 checks on the v1 image as expected.
> 
> Baek Kyu, Kim (2):
>    bridge: cfm: Store the new CC configuration before enabling peers
>    bridge: cfm: ignore CCM while CC is disabled
> 
>   net/bridge/br_cfm.c | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
> 
> ---
> v1: https://lkml.iu.edu/2610.3/01364.html
> v2:
>    - Add the CC enable interval fix as patch 1/2.
>    - Skip CCM status updates while CC is disabled in patch 2/2.
>    - Retain the RX work disable/enable fix from v1 in patch 2/2.
> 

Hi,
Are you actually using CFM anywhere in production? We have been discussing
deprecating cfm and mrp in the bridge as noone seems interested and they have
proven as sources of bugs over time. These don't seem like critical fixes
so I would target net-next when it opens up.

Cheers,
  Nik

