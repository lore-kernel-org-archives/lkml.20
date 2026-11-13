Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593744;
	b=WuqifU1ez6VJvJtwKn6Z7rjP5FYjMJzPXBBl76rOiVkcr3kbP8zdjtrcEhHup2lJ4R4m
	 6nLcGyi73V2q9ablnAhr00VslvTXhdDmFMwHTXQ67z3CgnkLfTqbN5if/oqBrrKyyZw20
	 Bgg325zr8piE/uOj77NEdP2QhiERieUCoobhNI8jSKFmCYx2nGwfXmAeOVD7Tb6j4jCED
	 h1Hagbz9xKOl58JBUh3rpwljVvXrcrgm9DsHCdGp112DNEgT4Il+Kw0PTTQtxree50aDb
	 kTVuRu9CoN7EH7OHqnkd5lgn7Hcd6wN6nVIjndxTB7q2GjVCvo8kbHO8abf/NImBLww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Qb0UkJf0VrVHdKGXACE+JKh+6CxNNCz7RSuZaWY+rFc=;
	b=CH6AbSvWAxbMS9AAtTJlKJ9x1HlOTVz1+XT+5hwlbRW3LkqLAZUXo+pZJd3iAnIP9DCB
	 LpoUUSVCueUPJ4rIBgDXFJd+n9ByDgDldhvY+Tyru3EkQIgG8IM9q5Wtt5/gNgJ4uFD+q
	 icXlhrmHpvQkZerK6GJ56vnHU6BJGAw1+BciSQrcTmZUH4iDic/tuMvxXHHDY/phihvJO
	 TXtjYsk7vxs7ef+vAnyjySg17jsQATfOol93r7lmkWz13FoWP+n40vedFfHVVCMr/3MTj
	 a74nqgdWD0KW4P7xrOwSZvEpMQrf9DVrpHrnUHbcHs1HUF6DpXRFh6bR2YXscHXLzlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTBcLH97;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391F7606B504
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 391F7606B504
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTBcLH97
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1302708a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593743; x=1795198543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qb0UkJf0VrVHdKGXACE+JKh+6CxNNCz7RSuZaWY+rFc=;
        b=kTBcLH97rUrnJ4KURpQ1dhq3yExaNpCXKEffASOv9H47vMKspCGnaACNxMDNQw5951
         Dq+Lcn90SYUs/ohaGnBmt669QXi2WdG41vDvENc6ZPTZvPt9CnHL5+vG7rtwxU3ltH4K
         lGlOQbHZy84fitgauXGO2AOcVb+vaeGwHTSLI2k8D3sBppVN+chc1jekUcIJr8kUaZ9J
         /Cm1RT2l2UzMaD0dBgm1xy38IcVHz7cs5dMQqKv9yu8eIPdIUDmuq3rhhGrVj2N6G9DX
         isLUv0bCDHhBZnvjDBiTb1Nkqx/VBCsB6hPow7CZ0e9YOjthYYorGBq6y6aVuGOOaO7s
         R1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593743; x=1795198543;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qb0UkJf0VrVHdKGXACE+JKh+6CxNNCz7RSuZaWY+rFc=;
        b=XwRlUPUMne+1BBKqHG/su/Rhc89/kCfFxkpDg7wxo7IVrpBq7/BUgjCFY8l4p/GHey
         N5+CoexNDdtnwHu0yi/crN6APqCrwlVhryskzzKLYQ3uywXyPit/njPxsLpXFmL+H0Tu
         1QR+SDEHIVuY1uf83mVs66u6Foc5FfUl2BzPRB9jrPv1zMt+TFWldBm8eD6iIRXZvv/1
         q956q1GK5LT+dxIz9fvsKEfTu00qPq+d8F1OowRYYpG4j/gUJY3LggisVB1hjj1yy7Xq
         V1lykUzQBUMYVB0vF6ibptfiVP4YkeGqNZ4e8otmo2RiSYVExL977kJ4HhnyYF/9kGvk
         XpBA==
X-Forwarded-Encrypted: i=1; AL+hErFBJMDE01N++vKn1e6ZSe66S0PHIaKAE64L50CEqLgfwVFwBLSw/r+CodpjfxX6670Ygj0lhQIqz/TfrH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nxTiDcTMQIX3Xl8ZEcfinTW9zGFjiBpINsuSdnuE8gY1GHKkr
	pY3gmxGqEc9np5RQj+oEh6z9/oihKRt17yZU7sQ9eMvNpWiGYhNyUafc
X-Gm-Gg: AYBFou0lGBvm6tBqNvUG4/fsLxPU7v6HqDeOwSuGzqETdNUpTwBzS+pMyKnZtseC8RK
	FyFnjYz8keFRKv2nPkch1lZxwfkSUbYE7VUefnX8l5QnA2Kutwe9GMKaRe1FkqVG4gqUVYvhLxR
	3Rd6+FR5R9JJ6w0LCSOla10IN5q4/0XFwEGlUbOcz5RO8h0Z/qnSJrE6a3Dh210WyPqPCE2AAVl
	Lqpai8hJt8JaqPxGW0NEcz4PimeBFRLmEorSeXAo2MdhUFWA7se4r+XjEwj4Aon7vO0VSG7dxjB
	fY1boTcc6aAYmtiO7v5btw2FlwFoen4sNsJgBmLz1DA0oO3UXAUSx4ak2PerB867k7nVaqFRYJx
	LpUekktF3xRYxGdAzu4R0/pvFUYs4DNgTCMUMqUTKryDkJYn728SXkznFaz0nFZZB3vAMc6v794
	hALBNxZZFI5h60e22YhFKq+7S9NjkYbzFu2Jdp3e+kmX/ODOLyHjIE//PKUMaB7QCNee9Rx85Be
	f3yTODA7Fc7wQzeQSVUc9zKayKYCG7pgXIhT56ylaVJ5iZbIavYlQ2GFMXvMwX7ViYwNiMzNkQ6
	FXwvOu0Nm9j/EPWtfXbin83sxPSBogAYKLLO/ZNAj/Te007w0DK3zJB6
X-Received: by 2002:a17:90b:4f41:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b1b0ccfbfcmr1844303a91.31.1794593743599;
        Fri, 13 Nov 2026 10:15:43 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm5421608a91.6.2026.11.13.10.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:15:42 -0800 (PST)
Message-ID: <85af50eb-9fe3-4327-b05d-18eda5993446@gmail.com>
Date: Fri, 13 Nov 2026 10:15:41 -0800
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
Subject: Re: [PATCH v4 2/3] MIPS: Ingenic: Add XBurst SMP support
From: Florian Fainelli <f.fainelli@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
Cc: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261112184441.3724150-1-f.fainelli@gmail.com>
 <20261112184441.3724150-3-f.fainelli@gmail.com>
 <ea78059f26aa3e25822665a1a462951695bd1e80.camel@crapouillou.net>
 <18bc9378-3f8c-4212-98cb-40e876bf996b@gmail.com>
Content-Language: en-US, fr-FR
In-Reply-To: <18bc9378-3f8c-4212-98cb-40e876bf996b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 10:07, Florian Fainelli wrote:
>> Drop the macro guards:
>> .cpu_disable = IF_PTR(IS_ENABLED(CONFIG_HOTPLUG_CPU), 
>> xburst_cpu_disable),
> 
> OK.

On that suggestion specifically, the member cpu_disable does not exist 
when CONFIG_HOTPLUG_CPU is not defined, so although PTR_IF() evaluates 
to NULL, we are still trying to assign to a non-existent member, which 
won't work. I did make the callback always defined and used 
__maybe_unused instead.
-- 
Florian
