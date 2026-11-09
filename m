Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246125;
	b=ZsnOO2Q2fExT8AnjQei5TC3tVy+hm402RZftvCFTgaTAsHV4SCxkD8d/8MWcma4N33Jt
	 7W+9VYyh8R/W+6d47mKa+H/gn0UT0gFGJRAqbrQT7LxA0bWq5iul6PnuRADH3WfaOBcoJ
	 AqI92goJxa1HAMaD2DyKXVtG9l3ey1r5gsAY1V9ofs48dLXxBRghyxOeft2PcLvKVezEG
	 CMEVGB/BjTMrniLQpY/nh2Piotq/7mE2LVbEHTOh1Bq6TJLdp/K2v+oyGFfV/KhkyD0lh
	 i4YHzE+k6oB4VVb/xEF7ZVJ5l5RSobl88YC52n3D48lVfniHEYy4FfbOQ/fw/r44YsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QS0dWLS+azYRQTl9Sa/YjO/KWEZCijM0rOuiAHbxcbI=;
	b=iz0M+DsF59kdQfh7BrZIUylG/zoBkdPWBEVbaxjfHH6IMM3JttJZq4ZO6t5m2tFaDSvv
	 D0W4bzFkDsyH6ZPof6JUR2AnzLH0HYKEoNhMkuvsRJuqT2UlgJ6zASCAnDEd5bBvP2QIM
	 vqd1A4J9RXfF/5Ne+U64EvybLxAZmlgF/hbCzLU13h9J/jewzColOwnN1SuNp2uqe1UtZ
	 6ndfPWUF1Do5X5y0EQN5A77AhXqrjX8AnftM4WfvIy3j7a54po70RdYqa9T4w9eB640C8
	 6DT7fBYG2O4sCSN4KyHY9ovA7p8vWssReWoyfeE1pJiUAsub683UPahOsSFWa+FeT3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=OZkRbYh4;
	arc=none smtp.remote-ip=74.125.231.73
Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC35606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC35606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=OZkRbYh4
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-4a86da07919so574660fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1794246123; x=1794850923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QS0dWLS+azYRQTl9Sa/YjO/KWEZCijM0rOuiAHbxcbI=;
        b=OZkRbYh4CWcXVHA2akEUUDtFSNGE/aZiYNbv2Bul2R9gNuDFItTnYAKlIGsPlAzM6s
         QNdmuizRCtkhUl7IUSW00qvJBA5vET5cTGJqf7Pm+UZ3JZ7KKx5PGCuqHv1PJ/Tx2jWg
         HqC3Nfdx515yQ9oBTaqo//MnyysIHSZ6cY5v9AexUFG1F33LLFs1ARZhgE9isp8JejQU
         9nyf1gCWpPQXJ7beV5m4llurZJYGDpN9ErqTxe4DI8jC8cP+/3d6+vzm8QwzF9xnahXi
         i4b/J0BFghA3Nz/iHUZfvZLQqSho/5EAM94a8ThG0LdjQSizwr42rni5AwXqyrjrLd6j
         ADhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246123; x=1794850923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QS0dWLS+azYRQTl9Sa/YjO/KWEZCijM0rOuiAHbxcbI=;
        b=0RetO6QOJMRzln7RmqKLTIDY+bSz/BWZF5es1/t8hByHPfPigKLIedeepJbh+GZwPM
         SWF9QTlx+mC6LhGYUjkEGEDqJ4CF5YhiYGaRftFjB1vRQndPI46xlaUC5yywi97E1t0E
         1SYrQIi8b1MBgDvOFbuUyunPBBm/y3SenH21FoPIR0yECSlg9Qd+SpCpvQEaaz3ayyGI
         6L2mvRs8a6w+wwwNyCY6/14G3SdESx1hrhma/LjqczF0KaDWfUhkPRMCBCXgYeVTW6F9
         PBfa/EP75tl5xSVbzjcdXa1sqhACdI70POgp6xzh2KlbCeQmfVCu5mFYVB0bTp2aNPzA
         +YEQ==
X-Forwarded-Encrypted: i=1; AL+hErGvgLxQgZt/4wI3bCsM+PLicCTa2OZZ6ULtl26vbp79cF0SP/54kmrdd/wrsrWV85whguREsyq+PGJ9mIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jz+fLos8DYi6k4Jfrs5XoW1wG1y/DZ4ctFnzThK907HdbvnQy
	5OtkBE4I0zlbcAv1Vdst2UKbEKIvR7udDApnclPfKbc0zDaTrd9q1TmqF7wXLg94Mpc=
X-Gm-Gg: AYBFou1kRrATmDFKtMx+eX1sNEzG+ZqaET2qa06q6fnuAMt50njJR/7Cv4ucpD1YYcN
	VlGCVo3cV8H1ovBJ7COS1Q5/up9xz4H8X4nE6Rh98AwaRkjGxmCfbg3aUF++y0Dgzdi7rSJqdnn
	an+bhjURaNN+WAvEK3m9jCzW0vCTJDwLc958LGQ3nfzM7qX+vxnh4KpKwW80VGgh4cOXPU4i/bW
	jV+NFB6jguvXEobtTmG7B2b1+Y7I8/KjENupkGStOWs6JbCynThJ4OUz/un+x1iBX77nPiEfTnL
	2uOUmcqIZ59SuacYAFirABVHpsx9M1CilgW5Qrou9q9xc2Xi5Jw2x7W8X+5u9q3hfLsnyOGt9xZ
	P17jL/A9V2Nrkkp1LJak4sKeKbdzILL/jhjfbjlS+BQLePPA3MYTz8CzKQQOiuI3yNtTnOM05vg
	qLT7QHYzi6aUBfwzVBAQ9mpB+jdg/vdfU4LlkhagtYEzJoNs1ix3m3yQsL3qbVjV3VpKOPHCLyZ
	u2U5H4HUhqoLh7WRiCiz64a0T6L0KlMhvCnx91BM1Q4sydM8557S2Ufc+AHu26mLK0b08+OrOJO
	7N4A2EtSqitc6O3YrGOri6j6phVF
X-Received: by 2002:a05:6808:2388:b0:4f5:e4ea:9ef2 with SMTP id 5614622812f47-5683c9e459emr272790b6e.3.1794246123438;
        Mon, 09 Nov 2026 09:42:03 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813c71bd0sm4925229b6e.4.2026.11.09.09.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 09:42:03 -0800 (PST)
Message-ID: <675dec20-1cd7-4d37-89b4-23237b760f33@riscstar.com>
Date: Mon, 9 Nov 2026 11:42:02 -0600
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
Subject: Re: [PATCH 0/4] soc: toshiba: tc9564: config system controller
To: Krzysztof Kozlowski <krzk@kernel.org>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, p.zabel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <a724d159-1509-4649-afa7-a2669d37b4f6@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <a724d159-1509-4649-afa7-a2669d37b4f6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 2:26 PM, Krzysztof Kozlowski wrote:
> On 04/11/2026 01:43, Alex Elder wrote:
>> This series is comprised of some code that was previously sent
>> separately.  It now incorporates a new system controller driver
>> that advertises clock and reset functionality, as well as regmap
>> access to its address range.  This combination is being treated
>> as a new series.  (Details of previous versions are below.)
>>
>> The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
>> It includes a PCIe switch with three downstream ports.  To one of
>> these ports an embedded PCIe endpoint is attached, and that implements
>> two PCI functions.  BAR 4 for both PCI functions provides access to
>> registers controlling blocks within the SoC.
>>
>> The system controller driver adds the clock and reset devices
>> using the mfd_add_devices() interface.  The clocks and resets
>> are implemented by drivers included in this series.
> 
> Toshiba TC9564 bindings and DTS should be posted completely. We spent
> great amount of time on discussing already and I pointed more than once
> that big picture is missing.

https://github.com/riscstar/linux/blob/tc9564-dts/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts

Node pcie@3,0 is the third switch port (within the TC9564), which
has an embedded PCIe endpoint with two functions.  (You can ignore
pci-ep-bus@0 for now.)

> You are not describing here parts of a SoC.
> 
> You are describing one, single device how the host sees it and DT
> maintainers (and writing bindings) ask for complete picture in such cases.

I'm glad to provide whatever information you need.  There is more
than one way to provide the "complete picture" however, and I don't
want to send something that isn't helpful.

If you want something different from just the DTS file linked above,
please say so and I'll put something together.

For example:
- Would you prefer something that includes only the PCI hierarchy
   starting at the TC9564 embedded PCI endpoint and its two functions?
- Is a DTS file sufficient, or do you want the TC9564 bindings instead?
- Do you want any other high-level description of the chip?
- Do you want more information about the system that contains the
   chip?

Thank you.

					-Alex


> Best regards,
> Krzysztof

