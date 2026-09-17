Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B463A2556
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789615628; cv=none; b=GcmzA26yDvdl0asEoni5n9ebz+bDgSiOzBd9kpDIb7Jrbnq54IVB3ts+wqeg6luaEtIoGRl1eKf6jE5HUIBPugA14Nj7AY31y/KkLArDhRtd9+r+SlBc4+rNBMeFEwWUbLgB7BJ3D2XaGmduh0X6atP8xNDLgKRNSR0j6mP3Gdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789615628; c=relaxed/simple;
	bh=R3FAfBMCy0I3rYNbY7ljz1l5sVG2klBi7lbMe897t6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIzjWPPILunkptK7x8eQOyaZXlK9oZ5h405UsuAceNysdvG+bo55B8MgaJ6qNhJIZKGFKSTKUYOFraQacaM93Lm5eo7XqbjvgWjVhQb8RAHAbMXvANUkIdzwYVtNjK1Cl5ZVLunvFFbKsP3+p3Ja/FYGB29BtcVHP2uSslbjV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnerzhUF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnerzhUF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so4583585e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789615623; x=1790220423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfZ+gBA8a1DG0OUmX7Tsw/OgchSGtEjjMWjZU8Wx4UA=;
        b=DnerzhUFn78f74xuOB0DoViVteBgbh8n06A5FDz+rb/nC8CXzZ0J5WdZszzwGBb9FR
         Z4igT3YBo7FEU8V1Zo9FeDh30EhX+21DF+iB+k44ZLctNmOjVh0LEhEq3RlUlBFmpzDE
         ba8mAshJPvf64c1ZkemVmexX2rx8O84PiqjiIHnRwjiBB3ahpnl47XbkNvCNeNCQUUIW
         JTEqcIwhTB2NDGtHoRHtGpXkb6MTJ7otrpLAATahoYZwf1383vgtCBhuRgCFEyrj60JK
         3InaMerdX8fwhTsXXJTqU7S6GIl7elGUOwc0fctNFd1jrLppBBMzpWwAhlE2leABEpK9
         eRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789615623; x=1790220423;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfZ+gBA8a1DG0OUmX7Tsw/OgchSGtEjjMWjZU8Wx4UA=;
        b=DHuFgHBEXaWB6GRE3ClNodus7fMqycHinL//+km9PwsfJw89ykNv8saW/k8E5vlf1p
         OObRxKoluiVmWIn3VdQQYTEFW+hKBZjmX9ApAF+7zL2AMfVXfr7Kp9FqfWAX2KTQzqTV
         GTWNtNhd5AVLzSQyhud6mjHguK6R1F7SuCqCwykLZ0mTd1NZWzlqU9PCoEcAZ3xUigYb
         kggoFR+CIcj5DUYKInjFmGB0s/ae7awW1iKs4eiK8lTiTm6ugpFoOLtH99krAvx5OwA5
         xn2RJkVvX7MBouN7ByVyqvHtDAJA9w82B+EuAQ4Eex63wj1CX/B90Lza4nhyWf3LNB94
         U7ug==
X-Forwarded-Encrypted: i=1; AKwUvBzmaDoxrWz9GnJZsQ3gEuRDsdZkTzSNFYO1Hh/YcXNpuas+lBxV8eRZC1mZh1tsxYw//3h6+6C1MnzVRUM=@vger.kernel.org
X-Gm-Message-State: AFuF++mNFlmakcYRp8dLIVkEQvZsk23peyCL0MeITsPYDTkR9Yvx1oDB
	0K9DnPNkiJmv6nDJAb04Tz0LWQlPr+ybwpqRR/d4oPfFLKR6O6H/9VWP
X-Gm-Gg: AYBFou2PzkTiK6MLywpRJGSH8hcmOinH+RprbDesqRZmLHxZsb6BLMpyPAyx0sy6II/
	gDkL8FxlD0azEZmjU0oGYo+p/qA8J2QnOb5WoCy6PB4id5G9YLbznKaNA/zkhU4AAle35F6LK7Y
	xGFwgMDrcsyF02GFdKLiA0/0HGu4hh5ViuU2atGhSTv1LMX5xogXbyqKVpwLuxxa/eC6BgLeNKe
	VyU+CCr788nKCCqgmkK5E9xbcMsv1S6NZkNUkk71rZ5M3jeCsh8k8JpmQK164MNFCTjNpLG6438
	N05gaSMvta14RTF24foZD/ZeBGm2BYoseG/WRu5denjpqUYqH/wiiUJZygTEnpc96IRfohqhWcC
	a/lNPT8lXkgLzGgiMSxC8UpH6rc/kPMrAJrznaZtP+2PUmChTY8ZcX3Z7Q1RVdSB262q3QbCo+N
	pAdqgFeFWSp36TG75229okfHTQ6Y4QP2suLGhlT1vGfZASJIwhY3cZssc4V4+HsScYOCn2IYjC0
	X8fj8s1iU0RibBK13PadwcnQe1B8ue7o+51pOv7XFBIuJphd6GhjFk1AGgX7a74Y58ReykUhXFC
	f8PSd8HHmZ0rR1M5r1uyKXsoV4clTd2WR58+io9xeBXQiJQAzxfKHVXxEGV74ODPq7XcctKkAAy
	bCHY=
X-Received: by 2002:a05:600c:8b78:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49ebb4297c4mr61135065e9.24.1789615622470;
        Wed, 16 Sep 2026 20:27:02 -0700 (PDT)
Received: from ?IPV6:2a02:8388:e6ca:5780:b097:7d16:9a11:ca28? (2a02-8388-e6ca-5780-b097-7d16-9a11-ca28.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:b097:7d16:9a11:ca28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm11432549f8f.35.2026.09.16.20.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 20:27:02 -0700 (PDT)
Message-ID: <e2c853c4-34bd-4f2f-8c8c-a05cc4442a98@gmail.com>
Date: Thu, 17 Sep 2026 05:27:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
To: Inochi Amaoto <inochiama@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yao Zi <me@ziyao.cc>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>,
 devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
 <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
 <aqtKAuoVSCxcts52@inochi.infowork>
Content-Language: en-GB
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <aqtKAuoVSCxcts52@inochi.infowork>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Inochi, Samuel, Yao,

On 17.09.26 04:02, Inochi Amaoto wrote:
> On Wed, Sep 16, 2026 at 12:10:23PM -0500, Samuel Holland wrote:
>> Hi Andrei,
>>
>> On 2026-09-16 11:06 AM, Andrei Lalaev wrote:
>>> The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
>>> Reserve this region to prevent Linux from using it.
>>
>> If the FSBL wants to reserve some RAM, it should modify the devicetree at
>> runtime to add that reservation. Adding the reservation here creates an
>> unnecessary ABI surface between the FSBL and all consumers of the devicetree.
>>
>> Regards,
>> Samuel
>>
> 
> This is fair, and the fact is that the current fsbl can disable
> coprocessor in its configuration. So I will not take this patch
> and maybe do a cleanup for existed devicetree if I have enough
> time for it.

I guess you are right. Just thought that it might have been mistakenly
overlooked for Duo-S because both Duo 64M and Duo 256M have the same
node in their DTSes.
If it is okay with you, I will try remove this node from the DTSes for the
64M/256M variants.

Thank you for the review and sorry for the noise.

 
> Regards,
> Inohci
> 
-- 
Best regards,
Andrei Lalaev
