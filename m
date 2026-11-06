Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793929844;
	b=Yx1YWrdlwUBioSKW2dqm9IfA6p3Wc9krCYn2mzu/wY9LyqRIMzEKi4sTZIamV2z6bbmH
	 b8HhMiK4Yumi2qXn3z83uvk9gKxKhQlMkt81JxG2/1201PZRsabAoRwBwzRcInljPvmXf
	 wGddeTfWAh56pm4FNo5KtGImYcm0jp0TcoK7sZWr4Ud58L1LorDhrQun/wWvAjprcNLMM
	 TKFcnbh+xjYe/nc03rz02Q+zHabKdAlz5mOI2OzepL94EzC+HaH7nNPct5/w4+FzxB1Y+
	 hoW7oZiHTXQX8YjiU/rcE3u0sS20rbYrFjFfhseZDOOmZ3nWyuBqp4F9k6afFhGNmsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793929844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bMCFjChOWXQl08hcopau30f+4A1VG5iv+0pA9BSCQ9s=;
	b=jvZ0t92iNBF7kQzDxdQpfDrEcmaHtrtHUtd4uAINrLDZ2BN/9wFyTQ3ozmZuE1smgfJf
	 fnF0cNH9MluZ6rrKfJx3ACvC/0mF8WmwuDHYomO2IxLgLLudx4JGz+c8kktGeHXJ9vdGW
	 YG5lye9ojkTo+AV6leWd8W4c34TkYHvAwAJoQHqVqGN4uxf70BdVIuzAqU6ytDlV13ekJ
	 UiVm9kt64Pe8QR8V/Mtl+nebOZveep3mdAxnDiUOwOuMO+QhGTTsLNBzN/M0cG8m3Vprm
	 zf8QlSQcXX1rNT4lqw5arcRDAUDn9eIPpHdOwbnohTf7go2DSOYDVoIrJWg1u7je/Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=iFiGgm81;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B53606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61B53606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=iFiGgm81
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-486f013db83so21823fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793929842; x=1794534642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMCFjChOWXQl08hcopau30f+4A1VG5iv+0pA9BSCQ9s=;
        b=iFiGgm81vaMCUIvQp0P8W9hQsBzQpyVVeiayZlgE/yRrYx/diZVQpRy1S9MtZcstGs
         8f8rbNhbmL3dxI4BO/m7AJJWAWPOZM/zw3cEaKG15fv6idU0I2+vL1Z+ABuuGVyupR29
         gISnEyCTgBHbx8tTUlHBk5hoPStY8wxRfpRDjCEM2DYtE/GMWby7rrDhGMPx+5KAHwTq
         Uzp3v+Xi6/NyKJAnomo7Bn4clGD/ic8gu7k8WLodKyfOZVPZJMfr3AzauPlot/tjoby2
         X3Vb1fN+YLnRKHduGJSyimAcYJ7VWXa80+rsqkNbO4n1awfE3zoS6tndR0kUg4V5LplX
         Yz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793929842; x=1794534642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMCFjChOWXQl08hcopau30f+4A1VG5iv+0pA9BSCQ9s=;
        b=mdriYKOKf4AGSm/JNFkJxR8JK5KhOg4DPPiDcED1NHnQ44SDqVGByNAxo16QEv0/FT
         eGxwdkCRNW7DdDusVi7/3vIXbIpto9IjfvIedF5g+ym10+67HM91CxbVh3IBkhn8VHlT
         6Z7a+ZplGj8l/qoGVATObPeHdtLRoPMwA1fLeouluTxl41oSpL2wPlOybGYLKC/y5A8w
         qYtsAwf+TbxxwUn4Nbg2uCPRLZANeV3FpxefDwJHGE7hz7l1YJGhCouue1yfqQl3zeQC
         zP0mM8wtXrR8uyEL+AT7ehVlriokWwKxTjAafkoVBszxcRjX1lqqF8i6rmoOCpvJfI7n
         yBeg==
X-Forwarded-Encrypted: i=1; AKwUvBzlZzk6GA3pgVhlgvb6gN0kGNnkZIQrvst/d5yHqDK6WgjYt/9Frgc9cbjol+zanQXGxT9k4uooq+ZnaQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cnzxlY5XD0rsOJdh2TnKobiI62BnmQwDfpNY/gotarmQxsI2n
	pq6eVJbflfLitK5r4ViT72WjHuUAoZK/RV86QHeJtg7ZpNwg9yKyIA/h1EHGSTsNDAE=
X-Gm-Gg: AYBFou1ivTxW1X2fwuohcFvIvk9lsNnoLbYeZpd6kTha95HpasvEuFqwluCs63ZZiu4
	29fXcO6u4zXJMKO4zT0paIaRbQEqYPL7UcLsB0HPHF+EQ9DBTcCsnbK79vynlssjvPLsVllKAs4
	3En37vxiJw5G0RCgtwWAk/+vtqgrnG2ErfkQJ5hy4E9ST1cu6TkeqDEIjIy3OPDleIMF66166u4
	MGwah225hp5YrqWENwpIZvoguPlWWrmkeJ/ADCcU3feQGtdd6HA9UwGmjZ9hnTxLYZv3ZFbeP2K
	9H7P4TAhTGnbZ1+v9Mpwxug/RUaHTdZKuvVRZpOGzBwc50xJ8cVZRMwG6UvPhXGctWAHuexs9Hh
	+B6HqnidBXS499GHxmZkcxxmOP9DQKU1erOExBuijmPTDaExgzrBAWrOMwSwUx7lTFbPtqMVSvf
	n4LExaql0FTNVZqESGuuqq5KiRietVJgRYZN4yGAaOrb22Cz51JRFIp/tkVWDpuIb9rJW3dtUXN
	xpd0OpiWSThc/GLbKbEhLzHset5j8TSzK/Xfy5LU3H8aOn1FsUGeIsC0XhKBCWTVEhuOjcpVGLE
	YzdJyzKDxsYV38DqohIrpnxKSbgY
X-Received: by 2002:a05:6870:a0ab:b0:4ad:8800:b277 with SMTP id 586e51a60fabf-4ad98b4feb2mr759024fac.24.1793929842253;
        Thu, 05 Nov 2026 17:50:42 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97887090sm817691fac.6.2026.11.05.17.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 17:50:41 -0800 (PST)
Message-ID: <bbeb0df0-10ce-4f8c-8b2b-07437d959b3b@riscstar.com>
Date: Thu, 5 Nov 2026 19:50:40 -0600
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
> 
> You are not describing here parts of a SoC.
> 
> You are describing one, single device how the host sees it and DT
> maintainers (and writing bindings) ask for complete picture in such cases.
> 
> Best regards,
> Krzysztof

https://github.com/riscstar/linux/blob/tc9564-dts/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts

