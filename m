Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952240;
	b=LmRj/Fg6D8/Uf+ms9DeRPWtxIR5bhbddzg4pgdfRpoee4w2wtvXL4JXLPWgG59xE8HzE
	 +x2wQgdw2fxGETXWdS51B0Qyv3ZQeX6CXOlcKjJzBS57W+KPUutoPFyzb03seTPmwSVdo
	 hOwZJ/yz/QJuAWAIIg7T7U1KCvLpr8wUfV6sFkLEC3L83bhIqWAD1ySwNvxvcuhfWu0q+
	 kqCARN/45l0zVJNPJMDUefbgw6v2gAvtmJqkRCkamoyvFDBPcgGZ6JlwUSZSrN/86Ook/
	 AbZfhOsp8K8+PQcSvIKlkqHmISF3a2ud2ucIUb4BX0ZPuPKUsbHqLLFey9M8vSHVNsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k3uHALvzjtptIMCjCni4Os1DaEQGVzPkp8ccI+3SeBQ=;
	b=jXLgj5/k1CTxZlGxEgDwIWAc+AgQe80RBreB2VyUDNOUrHu444hokCWpXaK93MNDrJoQ
	 k5IQfBa0yJWn28QMgqegQnnv/IN94KuQh8s2saNsMihMoi6SyGru94bIJhdpP0sFTK8Cf
	 hjY9o9qmPob+R9ANyrvE/xg+S3NTwwfz+j3Yj6vUGW6muwdld5q2895SyQofW2lKYMD7d
	 a87GyIbdWhxe1Dpob030cf2UiqX6XLyfWS13ZAChRICQnsxqmW/KUsdlGkC7SPXVXGHVN
	 xzDEDix1zN+53uxCfg/SsIJm3lE/idBz1METOcGONU45R5G9eJSZWLhR/cwnPEUw+tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC14606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BC14606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so2287245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1793952238; x=1794557038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3uHALvzjtptIMCjCni4Os1DaEQGVzPkp8ccI+3SeBQ=;
        b=k2vjgbNvN06sZzQr7ly4gExj48be0hhFCTg3HdoFnt22kAKYQVYTrUkmQsvYn9Igty
         6zO08AkzRzRm+RaLIdOlx1oWUIt1Oa9vm5bNEDijfCN7oxuL9WmLbQ3zW0KPfuRSPBiW
         8+7y3aBsvtdMOiWSpd5cLYpjZhmD3IJwoUqPeiQMT0+mkz+CDfR0zn/gph0K4DxFWN2c
         joH+fvYKWIeyqoWyb7ZC+vLwJKNXFaffBrLL9cEkw9W7GtsP2VLrYKwCCv9EzAbyuLf9
         fbNpEVG/tcWzEdqUCtUE32u6+FzwbgSjRRMxBLQ+aCGWu64H+wXSV47h1wM6MrRENrtn
         a7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952238; x=1794557038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3uHALvzjtptIMCjCni4Os1DaEQGVzPkp8ccI+3SeBQ=;
        b=bwTr3n/vXvOU/C6UeGoqEwOZm8n+1U9816UlMfRELemAIo4zrG+vKwvjEA7717G8E1
         1UlMzPsX3ZBBqBWF550RLbx71IIMIg50chmCTStRQ27PzsdaStgPIU0stKG1KIysEL1H
         qqid9J3pOiTk7aE8+Bz8vV1l9SYuyEh8WY1uU5YpIcTFUm8ucePUKuiaB4LEnqWU/KZi
         6yz6dTMpeJKEkK2WGGoTnxlEzjYI2U8KRdjTl/RWmqKCCTzU/M3pfJi+EEI0Mg8hhF5M
         aXTC83t/UVbmXfUtsjEO7xgBhZO4ZT7qPwIoVE3CEIelhvotPnoU3DyJJcCuS5Zk/BGb
         BCjA==
X-Forwarded-Encrypted: i=1; AKwUvBzmNrtci1DNPSbszUObYRMRmfoCtCx9mdKxUdJpKU7OIWpWQ7anlMgw7sCsivgjnrPFb21m8CwMDANuO1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AVFI55QLPW7Zs+qIN4KSXoubh7NEmK4F2iSyELvldZ9w2qZ/q
	aUUM/teimcWhsgFmcSmFAVgXDFUWZ2zBO2hXLv6KVhIOpJV8rSAfDHc5IfcA8b8IhAg=
X-Gm-Gg: AYBFou1/jsKN71Lg2AiNSnx/R5aQyEytRspM7Du0dtJOrMSmC3Gw3RfEoWRFF9N3gV0
	T4sl6+zbvE1f7X41h3ODp4lcWQgAlK136PCT0RcHUmsK5U0ghVFp9v7DC6MTBw0LWUr+TFDyhPm
	kqmCx1AlzD5Ay05k0oCTq/aUhNwyibsFh2vHPpjjhzkVZUHPikO4THLdV2srrULrDh2v0WA4wsj
	dWANaMpHrgLPbBSuykqT+qQ6rL93vwx10TlwbPPQhCgWuQTYFA9Ot461jf/dqR/DH1T5di83a6X
	a6LYKX59DYTKJK0r/1uzy1AqALQML379IKCzkQnINNjFNxuLF6dM1TmLfNYs3+nV/S3bqNo/cCM
	4WBFyNbWsByn5FVn4GJHbOe/Q8TSFGOAGbXiEU4reAjCmcjbnxwnzjeazWcg87zVDmvt0rTvfXu
	yeNyF7FkLwWPceSiHTcJHWvgWNqA0gmIaAlbin1aj9glzNJyJE1XLPJpPVwFQtf2LQfdeXYyrLD
	i3wcSeviL3sw21d7hN9UAUrBrAVYIokNtCgxHPeU3eZKQ2OoYMX1T/2EvBIs6v0dIIWtehIigJI
	1K2pLepdxY5wqWuRX3zYk5CP7neGzOuy6/8=
X-Received: by 2002:a05:600c:8b28:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4b6dfba8628mr21279205e9.30.1793952237431;
        Fri, 06 Nov 2026 00:03:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm34920515e9.2.2026.11.06.00.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:03:56 -0800 (PST)
Message-ID: <096754b1-6362-4f44-992a-989a1ccdec22@tuxon.dev>
Date: Fri, 6 Nov 2026 10:03:55 +0200
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
Subject: Re: [PATCH v4 3/7] can: rcar_canfd: Allow the CAN FD clock to be
 sourced from fck
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev>
 <20260902141544.565763-4-claudiu.beznea+renesas@tuxon.dev>
 <20261016-durable-meticulous-owl-7a9eed-mkl@pengutronix.de>
 <69826962-0c21-4616-9cd8-6eb0478a422b@tuxon.dev>
 <20261017-weightless-poetic-mayfly-bbdf75-mkl@pengutronix.de>
 <4a9e32a8-8a2e-4b70-8057-2d51e6d38b98@tuxon.dev>
 <69f0c77d-8c23-4949-bbb3-0a07da506b7a@tuxon.dev>
 <20261019-precise-auburn-bison-8b0d0a-mkl@pengutronix.de>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261019-precise-auburn-bison-8b0d0a-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Marc,

On 10/19/26 13:42, Marc Kleine-Budde wrote:
> On 19.10.2026 13:36:49, claudiu beznea wrote:
>>> Based on the comment on this code "If not available fallback to CANFD clock"
>>> I think the intention with IS_ERR() is to allow probing go forward,
>>> falling back to CANFD clock, in case of any error of devm_clk_get().
>>>
>>> The device trees that I've checked sets the can_clk to a fixed clock
>>> with rate = 0 or have the clock provided directly by the SoC clock
>>> provider. I think the intention with IS_ERR() was not only for -ENOENT
>>> but for any other kind of errors. We can return in case of
>>> -EPROBE_DEFER, to ensure the expected clock is used, when it's available
>>> and sane.
>>>
>>> I'll switch to something like:
>>>
>>>    gpriv->can_clk = devm_clk_get(&pdev->dev, "can_clk");
>>> +if (ERR_PTR(gpriv->can_clk) == -EPROBE_DEFER)
>>> +    return dev_err_ptr(dev, ...);
>>
>> On the other hand, returning -EPROBE_DEFER here means the driver may never
>> probe if the can_clk provider fails to probe, even though the fallback clock
>> is available. That would go against what I understand to be the intent of
>> the IS_ERR() check: letting the probe continue when can_clk can't be
>> obtained.
>>
>> Please let me know how you would like me to proceed.
> 
> If the clock continuously fails with the error -EPROBE_DEFER, your
> .config/DT/system is broken. I don't think it's a good idea to ignore
> these errors.
I've addressed the concerns raised in this discussion at [1]. Could you please 
let me know if there is anything else to address for this series and [1] to go 
forward?

Thank you,
Claudiu

[1] https://lore.kernel.org/all/20261019121356.2421761-1-claudiu.beznea@kernel.org
