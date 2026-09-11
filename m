Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB63B585F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093551; cv=none; b=dTzn+4U66D/lEHjBpt517nG2mk2kW2xiGmdCx6URtowT00rJmlhLhF/weWd8HWdioQ2Hgx18g4td7hOTaNAchP4aMYbOKdYWqfbokkH3FanwKhbmla90lcPsi1XtncbHdKK7Ym7tI9IGn7CuPpvi0v4GwBWKSxxTnSkgShVKRxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093551; c=relaxed/simple;
	bh=PuxOMmFLlhO7PBg7Pbai7BgbNylrrfzDckYCbeR2JDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZ+7mgaXmWM/oVGY1AU3lxJrPqeMzitSrACyn+nWtf2IlRZGgsQqwuZWBAfIfwta1jJKNXh3ZTwGWZty3r7w71LHvrs99tcUiwiM9KPRnplAT+F/3ClvQ6SzhBN9xEk1/D/+mzWGSYWnhzKPOi5Oc6IsBrHy646Oz+QwfUDoNm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5OMm3Jj; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5OMm3Jj"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso389005a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789093550; x=1789698350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuxOMmFLlhO7PBg7Pbai7BgbNylrrfzDckYCbeR2JDg=;
        b=X5OMm3JjhYkvNbI1kyqpUUhwq5knZC5nfZUKSdrNkVbe/VwHXKNxlEkDmAaj98UJ2R
         pu1j2x8m6Zp0T1M35F4YcA/7/3BWDKaTy0ifnZSebiAIJM7N0Ih9nBf5AGvSXcsPNEhr
         jbvEqCyfEkIVOtNG3f8HclsbZZ6Et5oZRz7Buo5xygUtTBY23GmvXHC6wbFfZmSaVncJ
         3ACLbF03tmCkz6hbb0w7M5htwQC6tBJgqyQfgVYoQMPEIW2uhRA6jmTY9fcm6YkVACiB
         MfURlwcHL9HxFfuVPD7KzVm2ra+EHVQqQn4Hs+MJpg0BITCoOuZEyuL8cMALp7rJXada
         qKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789093550; x=1789698350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuxOMmFLlhO7PBg7Pbai7BgbNylrrfzDckYCbeR2JDg=;
        b=IRBSMNoqUUbvCWFNM6f8QfOnBClPPrITe8JZ32kvFVkhP5xDwGmP/nyTWYkagw3JJt
         gnx2RfCp11o+RW5CpfNVoTr+f+waJ9XQ8Dqs8UB1gGhxiF/81JFTRCyCKElkPsd0pmG4
         AjgmiCaWRCWlSvhkv7SbTBCI29g0M4SOCrxRlyNtz63k5549a7UUgrolxe55VW7hI8WV
         8SWxoD/g5/iRRM97HLdjbW1N9oSEM4pU6As55cxJiYnJSmS46TaPQmy4Sq3Ihij08ces
         tIV24R9mvPx1SR8QOJO8WpjOVQiMJu2kNeM7eJeRwrIAN2qfDVZXqMWLqPkbC7+Sa2bD
         6WGA==
X-Forwarded-Encrypted: i=1; AKwUvBwVsiP1vePYNCL0yxTK4skQahism0SCDGiQ1MARavzr7ebxowAXLrGiXac9um+t747HYyoXcpGVfEa4Bmw=@vger.kernel.org
X-Gm-Message-State: AFuF++mcJR3BTjj0FAuNh6KyVJcIhyYB7UYjQFH+wLqrZR6dvLSAP0cI
	bnuN0t/FksJ1WTPgfqlW7qWftpxP0erUcQNRc5uUh04C4mfBJ2j/ITgj
X-Gm-Gg: AYBFou0jmDwETf0doYUVxUp637GM9bQVPZmoIHf6Qk+t3Xwc+dQXEFjqalb33Tov+3C
	328gHdoPery2lxmTy2WQ5KkJV6+tlTwNI5c90wnOunfmMoO0aClZbAU0ym8mpUWBOSaB3YPoif3
	6wIZzAuheI9bivv1COkE1S+Iuf9xst3KeuCynC9hLKlS9MCnUllabjGFOthVpz9i+Lhex4afAsl
	aPuOQo4Tcq8jkN/eabmJHuw3ZlNiGmvLRduOKKnp8YNQIxnmDsRasGLyfZN5fmwjO6JCXyprFFA
	u789ty8HD2XU6XDNzd23G+a5RmFUCZEU7HrP9bSyLdAmsdmX/4f738HC5hDSMo5xeb+i76Hf4V3
	G9YUzFC4S+TN2eRv8Jf18zDLVWfmo+liCX86YCOrESXzVKpb7Yax+7JQ9ohFN20pzDUxYhKq2nd
	PZ0CzU95trx4y9xd4cBom2OlxlOjX9XJkwwZBaObmqhmAbd9Ly+6bmXEBLl22cwl6//U/0KZqA3
	MZLjS0TMvXnStzN4U+h9yx/tceQwN1HEZuND5gT9C8FZVxZmcRfBFE=
X-Received: by 2002:a17:90a:d2cb:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-39d9bd971fcmr2831000a91.8.1789093549708;
        Thu, 10 Sep 2026 19:25:49 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602e7sm1998815a91.5.2026.09.10.19.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 19:25:49 -0700 (PDT)
Message-ID: <c7dc7356-22fb-4194-aeb6-084b5d3f9b73@gmail.com>
Date: Fri, 11 Sep 2026 10:25:45 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Zi-Yu Chen <zychennvt@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mkl@pengutronix.de
References: <20260908014526.413399-1-zychennvt@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260908014526.413399-1-zychennvt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Zi-Yu,

I reviewed v3 of this patch, including the CAN controller addresses,
interrupts, clocks, Message RAM ranges, pinctrl settings, and the
board-level clock configuration.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang

