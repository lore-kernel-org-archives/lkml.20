Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1549C28506C;
	Mon, 14 Sep 2026 01:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350940; cv=none; b=lKbNzSyZcP93mA28hhUcAEzOEs4FVJyTmxhsNCAvzoXvZEgV3G2fG4wDfsSqem0GqE8PCTXucusHrDodYSwwXW5pfPjFlGwJJ+Z+Bo4Kl64jTX7Zj68gJSmMlcyBRUauUiWYnBx8gvR//1Fhus2IDW2Ek2c0VcbFcij2nIXF1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350940; c=relaxed/simple;
	bh=eyp+LXoRW4iqSZraAKpyA8TC1CLbJr6Go640TKxR4FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTPsYQ3zYOpr3eKt5uDJI9bc56sVILtLL3OkNMHIaQ1ZD+05uu+NEYAOKRORTjSIU7Z2v7mygwxbz+pEZJ5TrXeD+zNsyb7Kc6sZmdbSZ12m23tutCi8HOWPFeVFeMErbljDr9IkysDPJEoTJO6BduoBbJapLqwczLeaLPoMOQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=St//JtXS; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="St//JtXS"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CE84103D80;
	Mon, 14 Sep 2026 03:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789350930;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Mucwfkb4MzJMIfmg7+6JU7Zg3V6BD7CxMn7XJa8cbwQ=;
	b=St//JtXSrpBfl6a044eOJX7wXKwW/NvqVvqNMLkAIacBn3IgyiRLeposLxrmEA5j3/CItC
	R29CfmGgbweGu3yyVoU8e4MhTtHpfQv/vl2TbHBWICgMdbrVrCdYJuTgx0ODEZ22Du+UyU
	Pj64o/cnaOn1bFGhuQ8MB4VQIjVdDo/2daMCaGZZVbpC6kPeKPkSvzYI5pPDVV+QlRZn8s
	wbqYbOkizltkVNSpCeRPN2bDrW3QA2vCj682LC28jfPIYei4PMOvd2r+EIPvHIac8MQjvz
	Up6Q7TRy8qjt7naIgl/S01jTNf4tKYfMgD+l++6LYwgPNtHC9HXV45R7Tz8yWQ==
Message-ID: <00acb35f-ea7c-465c-96da-4eb5dac9e2cc@nabladev.com>
Date: Mon, 14 Sep 2026 03:55:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Peter Korsgaard <peter@korsgaard.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <20260909182641.165383-2-marex@nabladev.com>
 <874ifwjff2.fsf@dell.be.48ers.dk>
 <fdf07bc2-428f-4055-97fa-61a302f57a6b@nabladev.com>
 <87wlspb50g.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <87wlspb50g.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/13/26 4:27 PM, Peter Korsgaard wrote:

Hi,

>   >> > +	chosen {
>   >> > +		bootargs = "clk_ignore_unused";
>   >> Why?
> 
>   > This can be dropped, thanks.
> 
> Good.
> 
>   >> > +	gpio-line-names =
>   >> > +		/* GPIO 0 - 77 */
>   >> > +		"", "", "", "", "", "", "", "", "", "",	"", "", "", "", "", "",
>   >> > +		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
>   >> > +		"", "", "", "", "",
>   >> > +		"ifm_device_info_eeprom_wp",
>   >> NIT: The dts references a number of other GPIOs, any specific reason
>   >> to
>   >> only name this one?
>   > The legacy userspace tooling used to depend on it, used libgpiod to
>   > look up this GPIO by name.
> 
> OK, but why not add all the referenced GPIOs if you fill out
> gpio-line-names anyway?
Because the userspace depends only on this one line name. But since 
eeprom node contains wp-gpios DT property now and the kernel controls 
the nWP GPIO, I can also turn this around and drop the gpio-line-names 
entirely. What do you think ?

Thank you for your help !
