Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982355;
	b=T3PHhDJox/0bpb8HuOq3/oz+uU3ZbpTPHVFh3nLCWGrKXYpBjACO6SO/okMa7roiNn0M
	 EAC6FwvGmLIsVOykjz20MayNRzJG3F0V3KMuwSO294GRlwkpW0jK6TGw/R5jYynpT3Hpb
	 9PsiMPv8bV3//NbfWNCZL9M5zQW2lSru6wHQpGiJWDJKFMN4IjbqWmDbrArBcC1BDPVpr
	 pZYOoFE+Oo3+ZUPyeWuYa8H4n0DkKZgXmVTiX3TStut/9AjwhSu/nDGz9qrLIXSgrPXhO
	 O+bP9DMIMXgqxgB0A3xcqzP1YfgHeKd6xcun7363OwNUAAVKBwu5wDEqDlpO07nV2cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vbAdv7MCz2zJUTUDv7FqKwfaz+r2S2sDxgej+VGMxoc=;
	b=a4cn1es+zEBUMIQbPCCV7TUmZySA4/fItFLFwnsPhSl0VMzB2DQDg3lPIBYX2OqwrVv9
	 tsE049WQy4wCBqYipax9itwEIB6LOZ1K1aD7QXjGZLqOFnn9IXH5WHP/6miLrM28lxltH
	 /B0rkwA+kTuj06EckAlnoxx0E/RyCmGBsvjr7Rnq7tKmUlVVcqqHBlkzUYr0B3L2vKxZm
	 9R2aLB9SYaPDWXazJWCrCKc2PS1xm6j5tC3GUxqoLudLM4anas7tUkgMGKCRoC0GXewSv
	 mMA2trrwESzOV6egXk3HmgLRE1DzMhceIXFM43lylBRT2UVf3SNbGPRPSfGFfOkpuxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kd5p9nZS;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B74606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B74606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kd5p9nZS
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 10ECC3FEEF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793982352;
	bh=vbAdv7MCz2zJUTUDv7FqKwfaz+r2S2sDxgej+VGMxoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=kd5p9nZS6m9QXbQsCgnbeR3HTP9si0Xc3gxnPyaFx3ySWcliQs6Fjiy8C0achSLqa
	 /U6XYYnlIzrRXBkvKUWLMlTqJ4MYl9MK89jKcoJqhwW3SkW6y5DzSSng4RRK3DyCjS
	 +qyYRDy0O8jZC6lhhEObm3bnFBNOVHLCPIiZlvlShvNZdb0PljY60dfgRqWfAX8pN2
	 kOXbB5cSkZF3/CrT/emgPZHmPUH2V4z1nKHxNyvy3NVx+Dn9uZJVTjX2OhV+B/P02U
	 WSDHWtHhEN2jOt7XnI8sRzKW9ZonuzBZxeFr0PRqAr5b2W1BdJ2e6dSczSoU9QaraT
	 BtG6ZRI/o2o0QiFe8hA3QrhN/hFmt0rYJ0NV6yCg6O3UtD9icr1+dixDWaHrEP1i/H
	 Q61xtgm4biH4cpKJIG20ezn2N3Uj5OeTa4qL/yDuPbU+6A/NwGzoOuT4zw5FJmygEC
	 7+3juWsSn0IQ0yelMFLAhteGX7lkJqs3PaVi1VnYh6vsoY7nimnx/puuD8mAfejKPw
	 De5UW6ryHuZRVVyMDmNM8JVnu3AInjDQK76yhxp+eZGuB24BOhD9Vc1+bSguuJuu5J
	 lW9998owwbfmGrdbcnTcPyOUWyFhfuJuFkLhHPoV8Fuau9wdT2UCdE+HtTrfyhRJOX
	 UhevWA6OviFhwEOZkQW5cVkM=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a20fd059ddso6639745e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982351; x=1794587151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbAdv7MCz2zJUTUDv7FqKwfaz+r2S2sDxgej+VGMxoc=;
        b=2KlzuJCpj+iXHoTEPq20F8zjd3I3u8IEJA1ImH/nRknlcuXC9POLhSZkNgnYEzSNsk
         MO//NyylJM6/oTKajYNn5RzQfYqhUy1zTw7GduoKetXXv2u5o4OLiZjspwMXemFgb58D
         tDWmrc5EvdRehcXBieFEY0uoiRW4vypntGfGNe8/HmAGxrZZ/geihWd+FOF3Z8lNfGya
         2GR3Yc4hI+t+un0sTjG0KlbM9336KFe5ZAvckuwy6lXQnyoUokwxpXCLK1jRwdTGIGXB
         8tV3FS/hXdabCcxmu6DjGz5FAGFcHjQz/wKxnPYC0bCN4DoONnR3qGbtvfzntj2lEKwy
         ExJw==
X-Forwarded-Encrypted: i=1; AKwUvBw4Oi7ie3UfHZp6tO5dBy5EAOUIAxw1JUksloKJac2Myz/A/2DCepVqinX3ljvgouo2LcZRZ6jNJKCacag=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mX1jRyI7gYJhgiCpZ+qZi8MS8ZYWcWM/O1zE/HvM9mlKhAWWa
	eRWLGr8cRUBmS1qu4JaH2z6E8IvLpOP0tS7b2L3xvxOvM2c4u8paoqGB8bLXiZ+/e3RLUSZdpEI
	hM0voBwN6Xj0sl5dcLx5DHxyqGKyvIyb/Hng4W/H0MU7M9MiuOMM6Nrdzqgop9yOFuSjRjegwwa
	eUI+RAEQ==
X-Gm-Gg: AYBFou3L+q8L0PFXjdPui/VP/KRoHQqSco94/rAtlGhbhMPL82uU4RrwxcjMCbpx0IK
	7aW3D2edxMwyhtLJpa44nmrEyQe4mmQYIih/875dawT8l9hm8DQEE7c0pGT0khI0PYqkDB4jAGC
	30pw9orvv0+wgb0OJcCM6D9CnAEFOzlIZVwt2AWN2Zqc3de0in1f4Vmoxn8+Hwl3dbo+9RS420Y
	knXrhajnSsL6iu29v37lZ17ehwD9+pqhNIidyZ2yPWTxba2egVJVNhDYVE3Mu+MTWKirk92727l
	UhUFh08TfwpncZPp4BrAV2M5n9uNBHdtyHHenM83IXeTg8bajuplA/Q+5howsHgsM+3AO6Eq7pd
	tWmi2JZ4ma2AovrElFhYYYWd3o1aYEUTm1s6kHZu4J84s/igJ+vw5TjZgAAoiSfrirfznTB8lA6
	bI
X-Received: by 2002:a05:600c:34d5:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4b6dc6df61amr54605825e9.4.1793982351645;
        Fri, 06 Nov 2026 08:25:51 -0800 (PST)
X-Received: by 2002:a05:600c:34d5:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4b6dc6df61amr54605455e9.4.1793982351340;
        Fri, 06 Nov 2026 08:25:51 -0800 (PST)
Received: from ?IPV6:2001:67c:1560:8007::aac:cab2? ([2001:67c:1560:8007::aac:cab2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e28cce1fsm82686435e9.15.2026.11.06.08.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 08:25:50 -0800 (PST)
Message-ID: <79211469-cf77-414c-9a10-2b684833ad64@canonical.com>
Date: Fri, 6 Nov 2026 17:25:48 +0100
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
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: k3-com260: Add SPI NOR flash
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
Content-Language: en-US
From: Sarah Emery <sarah.emery@canonical.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Troy,

 > +			uboot@210000 {
 > +				reg = <0x210000 0x5f0000>;
 > +			};

This partition ends at 0x800000. On the CoM260 with EDK2, 0x700000 to
0x7c0000 holds the variable store (NVRAM and FTW), so reflashing this
partition from Linux would erase it.

I think we could split it like this:

    uboot@210000 {
       reg = <0x210000 0x4f0000>;
    };

    var@700000 {
       reg = <0x700000 0xc0000>;
       read-only;
    };

What do you think?

The Pico-ITX node also uses 0x5f0000, but I think it should be modified 
to split out the var part too if it makes sense here.

The Pico-ITX flash node also has vcc-supply = <&aldo2>.
Shouldn't this be present here as well?

The rest of the patch LGTM and matches what we have already tested in 
the Ubuntu kernel.

Thanks,
Sarah
