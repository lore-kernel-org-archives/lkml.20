Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507174;
	b=w/Bz/J9erex8EYsTamO4Ko+nmt/zFsxfawbOeTM+OkALcnX0FivEOwx4zLGiHw8OOONh
	 I+1GNMwZnbsaFpIoWjisNLMk+GKA8097+jrlYXrHwNCrqAyCXVI18IsW+cm+b5s1Y4IJ3
	 pWhOsSPQtKkROKWoQ4KeE3sXy+7aaeqAYHXNIW0k/FdCkQx89QeByo8CyWchY1OdwWxsB
	 /GaQE1m0TPPlncHldsUZZDgmntUj8pu4XP+S4w0SpR9Lh4z+2CYclXI/YG2NSJbzg5pQO
	 odpE5YDCxZ6qkTf6Zcv2MXNLBC3wFF855Zb3l+UGe3Uz6jQQ9GcRJ3OmDflILhP07zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tvPvYGksmHTWeqyNsQWxBvyC/kcPNDGmR79WDiO9WKY=;
	b=MqiadOdcEb5DQnPdHVUTrxyb+BzN8a4noWITVy/WyHZhG45ttW5rrNRxyCdczH0uPxD7
	 rUfU3G3UFTcgdsJflJCbYh4rKx0cjkR0587XO2HkgTjM/lyilrQtDFC+fdxefPAJ0adxd
	 rK9t9K+sFsaA4SeLpqxOuEc6go8hVqfS4bIG4NeEzzm9j1CSIP5mnsYBhxk6r2fS7odJW
	 DKW3GSxxwIXynanuJE7W3oRr7PH+eJ/pm2IqGnQCL28KxYlaCsNgorD3Hg3vaS3k4B9XU
	 aj8yzIUkFtCVm94AzKNCvd3IOEADfCf+7ncrLNP5OpJm7vq+c6a+E53x1Tft0h0GE1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LnA3trdc;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4861D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4861D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LnA3trdc
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so26241f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794507173; x=1795111973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvPvYGksmHTWeqyNsQWxBvyC/kcPNDGmR79WDiO9WKY=;
        b=LnA3trdcVWMwTnKTLbaOHOhAqd2KqrmCC1w9umS0vVBTxUNFAnMiZDPubBbugO2S0v
         4VnrccP83ARKl0BwyWLu7FEyQ8RDPoe9yzjHqlo5sYIYg2iXigBfYbvEobN89R83NqFs
         OvbbwXh0drfouYC0K+4L+euiT/09A1sDrNVCeFpFclI6f7Sj0G7WidM7EKN7Wm7XP8oz
         FajxuqViOs2dYpLd2gzh63PvShJ14pIw4TbmJ3TMDIxFvIXLa97aw1fQQQrdj+4bQa3s
         6Fg6pYv2E0fcO7xMtDOt+wIIsLMKiiPtXI3TeihSIIkZ4QqmA1MbSMro6WoWhdeJTX4n
         sUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507173; x=1795111973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvPvYGksmHTWeqyNsQWxBvyC/kcPNDGmR79WDiO9WKY=;
        b=r8+WlI8qCmpespOWNpmnW4VmYJZwOmjeaNebIVi9ljqwQqsKBh6eKVPftiRKBL1E/k
         Yb3cE7hF8Gkt3c/iTNAf3ag8pJei/xVDILN93mXSExNFg0K0aAGX/X6SXGZSg0Du+r+7
         qn6mAhNMNCn9/ktmNMd9YtEis0FbtQXuLNA30NmrvWX9gdEURk9hBAv66/N2SWn9FKfG
         Wz7hfB45d95s8ja/HyUu2ea+mSEV4fok2atU8oTO5MdcmNZ3h8A1dv93hzuWN3aUJV4q
         W9HYgp5TvxLdRfgDK3UslY/9ONAYZ3yySrxZLFqSd7lP0s48IOchbTbVWxfKo2QgafUo
         W7pA==
X-Forwarded-Encrypted: i=1; AL+hErH93f0igh3Sna/MkAGa/OgArSxOkFBP1lj9HRwCzW9s8T9l88e7iG9J61F45BaZket0Gc2ZswbztLv7eyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z95nlbJzShF5uxXtNRi2x6S49T0KdW2YvRQvMVrjgGTxi2AFLzY
	w5OQxR83a5E2UGV+4I7bYkRbuColSGIv8SSGoFShWdI+Vu8riTk7OzUzlJjXY8nIiBI=
X-Gm-Gg: AYBFou09yUQQlo8lubYAAA58ENk0BXFkAD55hG3tX/EXbm5H/n7iG433TteHSgMIX8T
	RQ/3QZplUTNb1LU16bt/sicvtkAg4kQxvgE/BdhSTKaAHUjuT1CI9OhLzg2m5nIW2Y4wBwz2mgn
	C/KQRPRjyqm09f+Q9x5Uygowe3SORaBurLcY5bvV+Nmp9UL89QkYuxCtlXoSo8powuiQEy1m29s
	YHn8J2JngAQJ4Y8zughDFeweS3lZXsWQxO+W+HUIohZuhkJSj1zyV2iD024jQT//JKKbTnYCGPo
	2bBwAxQelgv3Z8VOAaVsp9t5VoYY8mjhOVWhjo/h7arbFiIM1ycxbTXPoqbPD8+Jfp3qehJMxyg
	8QKINpy2LM8m9N6DuaPRsdqlGex0HDHaYhwISspBgUoAtHSuvSFzMuOo4OaC7QLwqy72EQ1tfY5
	Nel0KO5p2XyCU42QjTr1d7Y5pFPI8FfG/ws9vAuL6cMvpHyNPldwPsx+uDCCluvQcMj4Iym8S0V
	iaPPkvQzeKXcLSiNdWgHTE054Gas6vOgdqyekhwzchceLCPlkKDHdAo9mF8/oJIF7rmjsU0R7uE
	xOzqLIGD1kDQj3ScuAv5csbLTM3l+i/cDJhBfN28vMr06YC36zdIEEPPwcm/j0gE1PfQc2Lkpu2
	NYqdovZM=
X-Received: by 2002:a05:6000:22c1:b0:488:83f7:6352 with SMTP id ffacd0b85a97d-49c6fc9e5bemr472663f8f.4.1794507172668;
        Thu, 12 Nov 2026 10:12:52 -0800 (PST)
Received: from ?IPV6:2a0a:ef40:e16:1f01:b442:1e4f:d5a4:2a21? ([2a0a:ef40:e16:1f01:b442:1e4f:d5a4:2a21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60bb2a5dsm556563f8f.50.2026.11.12.10.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:12:51 -0800 (PST)
Message-ID: <bbce8927-1b9b-458c-827d-46f2bb795da0@linaro.org>
Date: Thu, 12 Nov 2026 18:12:50 +0000
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
Subject: Re: [PATCH v2 1/4] clk: ti: fapll: remove ti_dt_clk_name helper
To: Brian Masney <masneyb@kernel.org>,
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Michael Turquette <mturquette@linaro.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
 <20261028-patch-ektor5-dm8168-clk-v2-1-dc6bf0fabae4@linaro.org>
 <179444595968.1126566.13848954974182834412.b4-review@b4>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <179444595968.1126566.13848954974182834412.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2026 01:12, Brian Masney wrote:
>> The fapll driver uses multiple `clock-output-names`, so we cannot use the
>> DT helper in this driver because that would assign the first clock
>> output name as the parent name. This change do not affect other SoCs as
>> the only consumer is DM816x.
>>
>> Fixes: 9e56a7d4263c ("clk: ti: Update pll and clockdomain clocks to use ti_dt_clk_name()")
>> Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
>> Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> 
> I see what you are doing here but can you give a more detailed commit
> message / argument here in favor of the change to make it easier on
> others that will evaluate this about whether or not it should be
> backported to a different kernel.
> 
> Brian
Maybe Rouven will step in here but the main thing is that fapll.c should 
never have been converted to use ti_dt_clk_name() as it does not work 
with the binding [1] and usage.

eg with the node

	main_fapll: main_fapll {
		#clock-cells = <1>;
		compatible = "ti,dm816-fapll-clock";
		reg = <0x400 0x40>;
		clocks = <&sys_clkin_ck &sys_clkin_ck>;
		clock-indices = <1>, <2>, <3>, <4>, <5>,
				<6>, <7>;
		clock-output-names = "main_pll_clk1",
				     "main_pll_clk2",
				     "main_pll_clk3",
				     "main_pll_clk4",
				     "main_pll_clk5",
				     "main_pll_clk6",
				     "main_pll_clk7";
	};

The use of ti_dt_clk_name() results in no attempt to register the clk 
main_fapll and duplicate attempts to register main_pll_clk1 of which the 
second fails leading to an early exit, the clk system is left not fully 
initialised and other problems follow with eg USB failing to init due to 
lack of clock.

Andrew

1. Documentation/devicetree/bindings/clock/ti/fapll.txt
