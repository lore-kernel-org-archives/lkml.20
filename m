Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FA24F93A4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188960; cv=none; b=GDfJepBtpJXXgKkEGyk3TRC3Ky3kQ1K0EkL/Z6LjoSZHyl1F3iMDTD2kwgQtahvMJYevhqbn1bdlqeahSxrxNAVPbP3/W770sh3EDtA1LM6liD/1WPHrnkT7g8VQD/6xm/W/KQlwq7/7XrX/6E9DWIa5WgWICd06IAVf4SyNnrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188960; c=relaxed/simple;
	bh=e5ziL31xDeZoDLStJOgoy8SPom8Qd56Yk7OU6OSCX9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LcbwPnnAztwgT1CUk9qu8Ko2VoUXMjA8ivAobdo1FG/fLS4oLqDtH3M4hKDE2uNN4jfR65rpzy18QbE0595gvvbxVfYQSqZfYvkDH9QwLXcPFpNA4tJL7jEZMEUE2ljnT3YXzfGMkPQjCsK9WhR5ZwEsJolPbn+OaZyIz/+5hHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net; spf=pass smtp.mailfrom=pardini.net; dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b=bYMdwxRZ; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b="bYMdwxRZ"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso1947402a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1790188955; x=1790793755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uksp8NEMMONI77zNPQYkgJlajaAnPtQHDaqlgAf0/EA=;
        b=bYMdwxRZc4taVqSILtC7IKy9pdzWOZt7u66I0SgEiuqFXXijHJf5sqvl6NSFLEODmH
         7wHvV8gRG02EKHLP0j2oW3jysvkl3YKBZTZMviz9sEysWZ8vz5O729WLYifkAVuQNZeH
         kQS9Oj5ix7B/bXmeZXXthRGUGQ78+uwd6FJoJx8SvSjuT1UEV5DnKFUDxYd8515uw1zd
         7o8+dcXHKxEyK1+LacrZ7pwzS/Nx9oJ8iiY5yg7ka3EXphaZ32bxv80wH3NdAPRl0I3Q
         yfTMDqfUAk0RhMr3JfKLouKufq+AmHO29M0NUh/KZ+/mNDGKnFw7Do51FFIljo6c7PWf
         UjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188955; x=1790793755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uksp8NEMMONI77zNPQYkgJlajaAnPtQHDaqlgAf0/EA=;
        b=V1NvbVicJWbKe+OS9oCdkomT7zhfd0S7ZisqfX4wiZSsALHyvZlBaUWL/w/zBS3DQJ
         sUfHtMcovXv7kIaxFzVeSl6qXFcAamGzUfzFyT0jcH7AXrdaQf18AHrC/7y+VwrggZIU
         aM75hJWfgv5X0itDtt7a9MDcb+y2/lm6cvkzVvKSKqDgFQqUnBoQAQ7tPFXKdF4SBTOC
         j04a5kMi6hd8o1hM74bpjkdvzfLo6GPArmuKT9G8i1hL6jO8I8d8/MDbcft2asJc6QBe
         FacSY/Vy4cGchtEQwD+OG1aABbKPqDSypRyed32UuvGRhemFID7R5LMLY4LxQvgtoptl
         HMHg==
X-Forwarded-Encrypted: i=1; AKwUvByHwNlnQwKmKdLtT8m2dHFqsrzuiv5FBos307UkfGQrKratV02J89E1WliJMlvIk2ktEnkvNFBKCQgr7fc=@vger.kernel.org
X-Gm-Message-State: AFuF++m96lzumv/MsNW08YPM1GiIjh6SXpS3uhHxlxKp4tpNSmUO6ySc
	21xvMnz0BLjtqC/BDM98tNHcgHCZKbWwoCOngha9AuRITTpK76/O7QovvhR6LkHy1A==
X-Gm-Gg: AYBFou2QVENPVqj2FdBAQS2aDhz5IXydQIDehX7X7+vKGud6PR02+zUJ6MPwktZbCnk
	+YzLYaMsRNFXi95/Dst7mfdvPS7OX93NtO91mDAkvTjfUiljW+5MARbvJlftoQMGIQCdr+79UiC
	eastnkjd4ZluHn1+QXDr8l2LjvkLaGQkuTrB2xsxU9gqm7JLlbQor7exVXddgbXre+5TqQOrf29
	kyi4Qk2awlIbxlBBBsjMJWIeS6/rWjKEen8lYx6uWraMNZEvcEpjs0IwdveKTCPXae39Ijdu0x8
	080/uLmkZgdHwT0BswA9JZoLhFSyrh5xyqWf4DcTg0w1UDJh9rsHEIGaVHV9B7/fQ6MlFLzU761
	F5wojRuV+gfhgC6Xy/kvTxJLMM4jOHyXymMcMHLRVKjVhH9VN3SZF/ONTdpvXtPxjRliU7kr2Kn
	Ym5PLP9ESofMdEr8FTDDzOJZ2L02CcbhpBeTi0kWS7JF4ztS1hRipeQnXtIAmuw/ZUsRgB930Sk
	T9mC13oWIO1iNe+/BVQ7FF8PjdoSdLPk2uv+DWtA4FkvxM3GJo0ky/kWqkUKkyVtJwN7jSMhWIK
	0qksi26JN3U58WvDIxFFWR4VOMZFH6N3HxLQszKRVAHIuQ==
X-Received: by 2002:a05:6402:13ce:b0:6aa:c767:ab47 with SMTP id 4fb4d7f45d1cf-6aac90b04ebmr66607a12.35.1790188955272;
        Wed, 23 Sep 2026 11:42:35 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:1072:bb1c:c0f3:280f? (2a02-a466-4d7a-0-1072-bb1c-c0f3-280f.fixed6.kpn.net. [2a02:a466:4d7a:0:1072:bb1c:c0f3:280f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37eaab7sm2367557a12.4.2026.09.23.11.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 11:42:34 -0700 (PDT)
Message-ID: <e166f6e2-05b3-4f36-a1c3-b75861618c75@pardini.net>
Date: Wed, 23 Sep 2026 20:42:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] describe RTL8125 PCIe NICs on Rockchip boards (and
 add DT binding)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
 <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/09/2026 11:17, Geert Uytterhoeven wrote:
> Hi Ricardo,
> 
> On Thu, 10 Sept 2026 at 22:08, Ricardo Pardini via B4 Relay
> <devnull+ricardo.pardini.net@kernel.org> wrote:
>> Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
>> NICs whose PCI function nodes are not described in the DT. Describing
>> them allows for stable ethernetN aliases (matching the GMAC alias
>> convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
>> inject mac-address properties from its ethaddr/ethNaddr env, so MACs
>> stay stable across boots and U-Boot and kernel MAC match.
>>
>> Tested on a NanoPC-T6: /sys/bus/pci/devices/0004:41:00.0/of_node ->
>> /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and
>> u-boot correctly adds local-mac-address property there which is
>> correctly picked up kernel-side:
> 
> Have you tested this at 2.5Gbps? With which firmware?
> I am asking because I have problems at 2.5Gbps using the firmware from
> linux-firmware (on a different platform, though)
> https://lore.kernel.org/CAMuHMdXPAeHoeaQbM9rXbXukoMbFV+0k28n6sRMw8XF8720WUA@mail.gmail.com

Hi Geert, yes, the RTL8125's on those boards work at 2.5gbps just fine 
(both with and without the fixed-function nodes in this series). They do 
get quite warm at 2.5gbps. I'm using one of those el-cheapo 8-port 
2.5gbps switches.

Currently:

[    3.254450] r8169 0002:21:00.0 eth0: RTL8125B, 8e:b4:90:97:32:30, XID 
641, IRQ 124
...
[   10.480872] r8169 0002:21:00.0 end0: Link is Up - 2.5Gbps/Full - flow 
control rx/tx

# sensors r8169_2_2100:00-mdio-0
r8169_2_2100:00-mdio-0
Adapter: MDIO adapter
temp1:        +52.0°C  (high = +120.0°C)

I'm using whatever is in Armbian's armbian-firmware package:

# ethtool -i end0 | grep -i firmware
firmware-version: rtl8125b-2_0.0.2 07/13/20

# sha256sum /lib/firmware/rtl_nic/rtl8125b-2.fw
529bf1c25c97ff52b401090d00ff89cc22351012336e5a0c9662728a3ee909ef 
/lib/firmware/rtl_nic/rtl8125b-2.fw


mvg,
Ricardo

> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

