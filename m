Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690122;
	b=Jh6rciVW0tD6tDl09ukC19t3D77er/gfBZpPQn1N8MI0nEVVK5MMLNTc5wDDXX1CV8OR
	 YKi8fftJJF3M4By8HsQ/9SMJEEYH7Qk5Yzmn4ttgykuFEMnO36Aj83tYdmwNcVALfFzW2
	 dqz8EMOMAkrnu0HDUq6MwHGTCgEUtgzHXtnjeevEMkpRIl8QsDYXfDfP4FozMk8K67zLl
	 NM7avblZ4GzG5F1hVgkdABmDwm24rlYn2wghxTvkLvnm17rKfhbIuTuOTWXgD/9S8QwXW
	 yh48w7gXJwWtweuWRjWwBb6qVOnwKSQbo3Bkfm6XOkOsKs8lO6PKDM78E6OUMKGsygg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690122;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aIigL8Htvs1Eri4VcHQ6P7by4WWQ9ht1cFwpEUONgJM=;
	b=ICpFKIsIAZoJ3ICcGH70KUtjfQJMRHR3S8qgFFatxvokHaT+hHiflkYZVXr3Il23xocn
	 3v0SMkMJEOYbyC2ovQBWN2dR8rL82euLVWk/8PvEmaJaKuWIMFGFiUA2HMwboBAA62QzP
	 CN7ee3ynmHT4gWp/A7eQffdm0lWPVcVu6qfsaNMols8LqCy61+z4DOZU0fWlJ/FiXv489
	 Vmt/4oqgnIS1XB9C5W8hZ059xItqqnOXNLj5NkMTquWnaVoBpIJKFwjZmDP4gILq4XPqA
	 s/uenN9v7y+/o15FGjYvXrY9kfcE8jE9weuXofgwRReLoJKoyj8RfyOGMO1whTQZO4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34598606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34598606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so493835e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690120; x=1793294920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIigL8Htvs1Eri4VcHQ6P7by4WWQ9ht1cFwpEUONgJM=;
        b=AgknpA9uS0zKPTUrN0lUWNJlq/WQwFs/s+lnVEbJTtcXlGV0L9zDLUPoDtx7egdNJI
         X8xKOHWqiETwJWhFqzeCg3wVeBhOs4czc91tZ5qHI/SCths3VhC5IFZwejZz5co/qzxG
         KK2rL1XiFs4Pah/hteIbnmKRx7di5WWapuvl+F+NVdO3uIUgb6En0JjLLgbD1HOo4kOa
         4Ow5Ap2vHqj9UbWx4IU28YyEC63n5v5cbHAajWR60EA8NdzRNOda2+AVHyCJOyEemlqa
         sPRACFJLqSwVYRWiOOZvsLiABbtc7ZjRyLOu6tJ+N1aJ6gvArjXSw6i8BSx8Hh4dklKC
         N+Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwV5R/iTI6gHxrMnMarVYfUwuOYeSwAAwDDtYtWxURKGhHwlqgbCleptNxwZKd0ZRd0woH62ipl75YANnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVwaQKgWGvRkZ6VgoFtj7c6ItMP5lc2OzdzaOSOUt2BMkCNNFI
	z870krNPjFKc2v24fJak0F7Omuz6XKCmhxWyHix/tQBYgnNNNwA2ShNG
X-Gm-Gg: AYBFou0kMqZwZgRMui1JdDECiOeROd0A1Fod9rU9wlpTxL0h/LI/htfVET8AUItGE4D
	HwvmjOehXnpoaaIewIgxD8hwXZXBr/dMKY/fBUCOMBuaOQw1B8XXC5CRwJlMAAU6mwVfn9PwrBJ
	Go08HPTvWw/n9rL+E2lXg0ckAhhr85wzTkUfWkFTrSgvk+lNM1+HXvPDO+y433tbFfQhQmGoOM9
	jwJpFtrXhUu1rmo7MofW4I4Ym78zmq3aseLrzydlfIs/FQsOd2dAAq2RL++lW7A+qvKuiabi4in
	0e4L6WUQXOiNHFW9xdYI0eKNIrHckRx57z7eug8ULThJsKiZXXMtiqIVa+OmfbGkxLpuFBjR8uW
	mnNav+fbMniwigAYU6+iabxjNSSgtgPORzlcHHghFKIETZZ4OMgGhMDkORObQGn2kMub1W2uO6G
	dpNloItiTMXpPElo6K5CUMp2nVqta6oxnJ/bFrn3NqJY1dVvEHLecicS3FxBA/9zBAgXYSb4Dfw
	L+WSVJq/hQ3/mEbQhJMuEM3uEOJmEKrbGgeQT8i9aX5hBJ/xwryNq/q0NFDVon70vfmG5iseNsW
	gJRGgdJ+aw==
X-Received: by 2002:a05:600c:8b4c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4a20729f92bmr52278535e9.8.1792690120279;
        Thu, 22 Oct 2026 10:28:40 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210361ad6sm11491635e9.7.2026.10.22.10.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:28:39 -0700 (PDT)
Message-ID: <1ca9d46b-02aa-41bf-b184-2a62f8a284bb@linux.com>
Date: Thu, 22 Oct 2026 18:28:39 +0100
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
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays
 the T7 way
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-5-tanure@linux.com>
 <CAFBinCCpo28jZkQnup2=iofwh02GOMzxJ82hGHWctiWzcKTxUw@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAFBinCCpo28jZkQnup2=iofwh02GOMzxJ82hGHWctiWzcKTxUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/2026 22:49, Martin Blumenstingl wrote:
> Hi Lucas,
> 
> $subject caught my eye because I didn't understand why there's a "T7
> way" for adding RGMII delays since we should be following a standard.
> Patch 8/8 in this series documents the standard. Can you please find a
> more suitable $subject for this patch?

Ok.
> 
> On Sat, Oct 10, 2026 at 12:59 PM Lucas Tanure <tanure@linux.com> wrote:
> [...]
>>   static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>>   {
>>          u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
>> @@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>>          dwmac->dev = &pdev->dev;
>>          dwmac->phy_mode = plat_dat->phy_interface;
>>
>> -       /* use 2ns as fallback since this value was previously hardcoded */
>> -       if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
>> -                                &dwmac->tx_delay_ns))
>> -               dwmac->tx_delay_ns = 2;
> The 2ns default value in case "amlogic,tx-delay-ns" is absent hasn't
> been necessary since commit 093d23db4fff ("ARM64: dts: amlogic: add
> the ethernet TX delay configuration").
> That commit is part of v4.12. So boards using RGMII and a .dtb without
> that property haven't been updated in more than 9 years.
Ok, so for v4 the code is moved probe into the function only the older 
SoCs use, so it is isolated there and the T7 path never sees it. We can 
drop it future patch.

> 
> [...]
>> -       ret = meson8b_init_rgmii_delays(dwmac);
>> +       if (dwmac->data->mac_applies_dt_delays)
>> +               ret = meson_dwmac_init_dt_delays(dwmac, plat_dat);
>> +       else
>> +               ret = meson8b_init_rgmii_delays(dwmac);
>  From the discussion in v2 I couldn't understand the overall way forward.
> I get that new compatible strings should not rely on old, incorrect
> behavior. But what's the path forward for the other SoCs?
> 
> [...]
>>   static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
>>          .set_phy_mode = meson_axg_set_phy_mode,
>> -       .has_prg_eth1_rgmii_rx_delay = true,
>>          .has_pipeline_clk = true,
>> +       .mac_applies_dt_delays = true,
> This should be a callback function pointer (apply_delays or similar,
> to match set_phy_mode) unless there's a way to make older SoCs also
> follow the "correct" RGMII delay specification.

Agreed. V4 will do it.>
> 
> Best regards,
> Martin
Thanks
Lucas

