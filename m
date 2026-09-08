Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D630449EC5B;
	Tue,  8 Sep 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861805; cv=none; b=WI/929WTaDi0smIyHgZ4ir/eIXn2PRBRot0dggRKrSr7n/PIumrTnCPtGxFO5XwkoIc16lE9fkLGXgZGe8gnpFQPtEvnDzqnvjQB+og3W+BOPjcjmiQU+OpUj/aY/HVlXgF3llQnDwQt9xi0cddZeSCoqxId3a7Uh3+vZAn+zmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861805; c=relaxed/simple;
	bh=vQIBuuR/BmwsBY5JOxkTHsS75Xhl8dHGbo7qnFPGjH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoDa25Bf/sCNuyVJalTE8e1gwd/Jhkq5u1wQm2jat5e1i9BBYwtK8YTo+avJM9clq4VHtU22vhExB6TPVpQ0qEBL2Sl5Xkj0+8Uvybe7CYQuKfgYprJXvT4fWvjgkhkCZEFQxU4r7cG6HMPN3xKkIObIsylaImSYvu++9RvO5WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=IWGY9+g0; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="IWGY9+g0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788861730;
	bh=AsIdMehAHVx8Vn9co92csSXF/XK0Y8AfqFEfTMs6vWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=IWGY9+g0N4J643i6P6VTebvhRdq9bdF/HKLJuHhy/DDLPuTuF30MWpbuAk9imMU5/
	 n80sPjYLcZ/tTKq6hXiQZ7sHUijOo5jpVTTAd8Z00nafIZjheK05ZInQzRACNQFNds
	 gARtKOaZnZDOrnTe8xsFTNRj3GYRFsZz4I8z1yZk=
X-QQ-mid: zesmtpgz4t1788861723t07d26cc1
X-QQ-Originating-IP: gaC7llghVtvXGohF4L9JNRie7K9GccucX/uj9em3fyM=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 18:02:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7742146852528035138
EX-QQ-RecipientCnt: 20
Message-ID: <140A6F61DCF6A29E+a53e2017-306b-460b-bce2-a269c3491509@linux.spacemit.com>
Date: Tue, 8 Sep 2026 18:01:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] usb: chipidea: usb2: use
 devm_clk_get_optional_enabled()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Ze Huang <huang.ze@linux.dev>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
 <20260908-b4-spacemit-k1-usb2-v2-3-f07342ffa051@linux.spacemit.com>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-3-f07342ffa051@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MhBjP4hWpZv/XkDWrLgj2CupeClGVTds+5kNmXaVIvtbVU2lEoup+HHG
	j97unkHczhBBlTv5PeZaMSe9a22cFTYVIzVlaKeu8HOsKLygM8+xakNCXNBm/PFP23B5/3p
	yhlbnz2cB5vsflLo2qT6wKSsTpi3gM556vAMZz10PlcKmx+wIiGMaFbxVHuQS7kdU5CF5mO
	irLeQMpuZo82gmRk+vRZ/Ndro+bXXwNyLzXjq0wOe5fnBAn4ZEOtOIwOso0Ff4E1twARpd6
	Tt2OzgsnB3y/X+ePDHhOsYt936zZY2DCFDWi5Ec5B8LmY/P/7cd3ZMydOP49RNqVcr6xUud
	oUQUbaBMzvYSOMv+ZwmTTEi8KfnUu+291BzhRHB+NDOwPNYoLXv4UZaNoQLvShojbE00W51
	T9YYScjU2b1i0K4/FEKeY6h3Q2e99uYevTyw8skWU5aFDe4bn2ahGuurP7cFxSI8wb2qbxx
	eFnXbU6yOc/AoOIkmRobrmDYq+U7sZRgxbDOWDVyFN/xGmApCByeMwNcgjb/u0WWYHxQDps
	Uz3pn0+sq/QnF1fF7lBm4P18kzEjjEH55QN5KMFKnAjbEgumubwaFSpHilxZcl0t3BqIDUA
	rCkNkiUCNYo19CuX4Gp3DFFGT0tdNc1SNgMMgmJbcRJX507lGJi2TLDhyeuDtc+GO/vbJ92
	S6O1McPDVUSuIBm971o1QaytITY49aFqaI/rTxKbAzNH71BLH83prXefrvXv++z/6ZNELjA
	Wk51d9uVPr21OfaEgDq8AeO9kE9bNznN5HVKW3PUFljdqO8BKY3rAKaetaqKjGzqu+aSGMl
	eNIel9wLVvoA0v8bnPowxlXw5tyeA/Mr9w5xbL4bG8S11a+m9nsSWFoW7JtP0yWe1n1I2Ai
	EiMrhiOUaK+m+2xFxvwmkaM3dgP347JOl09qy/xJYAdk8bBON5BzZ1/IZSLqj+EuQ74u/xt
	oGZsdGqUV40656LOkJzbA5qrANjpIr2O8+He98T1zIJZ0sjkWSJtT8Bjqogy7OI7SD+B8oC
	jbXJpYkTtEJByELZcf27Bfkgxwbym8ya3ysnczvuwUsAoIt6yW/gcBEXaFba6ZP0Mw8T5+g
	oNJ46xPKrDp22gVA7SgOiavgxSyVgzV9b4PX94xIlXNS5+WHQwKH8zM6b2ODA9Y9w==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

On 9/8/2026 5:55 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Double disable and unprepare of the clock during device removal.
> --
> 
> commit d2e0018bd6f14cd49dfa6012d83048e3abde69f6
> Author: Junzhong Pan <panjunzhong@linux.spacemit.com>
> 
> usb: chipidea: usb2: use devm_clk_get_optional_enabled()
> 
> Convert devm_clk_get_optional() and clk_prepare_enable() into a single
> call devm_clk_get_optional_enabled().
> 
>> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
>> index 8ffa1e95d8e86..6fae2d4a053a1 100644
>> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
>> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> [ ... ]
>> @@ -99,10 +94,6 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
>>  	pm_runtime_enable(dev);
>>  
>>  	return 0;
>> -
>> -clk_err:
>> -	clk_disable_unprepare(priv->clk);
>> -	return ret;
>>  }
>>  
>>  static void ci_hdrc_usb2_remove(struct platform_device *pdev)
> 
> [Severity: High]
> Does this conversion also require removing the manual cleanup in
> ci_hdrc_usb2_remove()?
> 
> Since the clock is now managed by devm_clk_get_optional_enabled(), it will
> automatically handle disabling and unpreparing the clock when the device
> is removed. 
> 
> Leaving the manual clk_disable_unprepare(priv->clk) in ci_hdrc_usb2_remove():
> 
> static void ci_hdrc_usb2_remove(struct platform_device *pdev)
> {
> 	struct ci_hdrc_usb2_priv *priv = platform_get_drvdata(pdev);
> 
> 	pm_runtime_disable(&pdev->dev);
> 	ci_hdrc_remove_device(priv->ci_pdev);
> 	clk_disable_unprepare(priv->clk);
> }
> 
> appears to result in a double disable and unprepare of the clock during
> device removal, which could lead to unbalanced reference counts and trigger
> kernel warnings.

Ok, I will fix this in v3. Thanks.

