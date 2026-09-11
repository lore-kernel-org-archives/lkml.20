Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B02F7E0FF;
	Sun, 13 Sep 2026 03:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789268662; cv=none; b=VFOi7ROe0NB/t58Gq/e4l0WDvhJrcqDTseRR+imW7P1Yv5tgnBmcf7US28V+s4TYO+8xm33Mp8K3wsXLOL2wQXSnXe+RtSV4s8tug4Mx3SJ6S+g+RjuFRx5Q6nlMrtN1v21nCN63V1OyFke0/Sc9zYpsdazva00Qx9iQ1RoXjAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789268662; c=relaxed/simple;
	bh=r6yZynmnp2hr+Y2qX721PPePRWpAVWpG90UcknzeG5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2iZnGJzrT6ieUN6eLetC6pzdWPQJ3mpz8puXbY6F7OGxsG7bi2WeMrxERc1gQjh6cKh2kFbVJruQIuGSoRq3U765JmPxSuNRZhwbm4BYuArrFUZJn+80M3Gv6y9Du64u2sHADzLn+xgTN19gNa/jp6ZpeaQzFVLKSeiME8++fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=YgCXwaxw; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="YgCXwaxw"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1362B10364C;
	Sun, 13 Sep 2026 05:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789268657;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=r+dsOyuauVyftnIALjK1E6v3Vy0EWAr+12caK2RyzhU=;
	b=YgCXwaxwW9SHo1xDWd02WuZx+i7/w3on54n0KB8T3Kb0tlBdTXGicKOADyuAvc91+Dt6Pk
	qcEQsFAFj9YYKfdOBwOogFfzWWl99pmIy8ROO4Ecyjls6ssifb4EUZCy/ERrQ0Cs+rXj62
	qaRc65ydEz5Hxx+i/PmTNzPpljZbZ7nlHUzScBoJ2sXAghS2tDO80qcCtowGxUcnh1ayE4
	HKnkZRYLZHahqxbxs0J6IsGh6xoHglcE2AmTa+hTclkDMcr9ZNB0b8drWhmspDnJfrKS3p
	o2pB0YDRQldXQuyWmd32xTqyFXMTpJN+RS0CBBBuGmY+6Dwpx9Vjk/H+hVMq8A==
Message-ID: <fdf07bc2-428f-4055-97fa-61a302f57a6b@nabladev.com>
Date: Fri, 11 Sep 2026 16:49:59 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <874ifwjff2.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/11/26 11:38 AM, Peter Korsgaard wrote:
>>>>>> "Marek" == Marek Vasut <marex@nabladev.com> writes:
> 
>   > Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
>   > The board is populated with four ethernet ports, QSPI NOR,
>   > eMMC, UART and USB host interfaces.
> 
>   > Signed-off-by: Marek Vasut <marex@nabladev.com>
> 
> ..
> 
>   > +	chosen {
>   > +		bootargs = "clk_ignore_unused";
> 
> Why?

This can be dropped, thanks.

>   > +&gpio {
>   > +	status = "okay";
>   > +	gpio-line-names =
>   > +		/* GPIO 0 - 77 */
>   > +		"", "", "", "", "", "", "", "", "", "",	"", "", "", "", "", "",
>   > +		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
>   > +		"", "", "", "", "",
>   > +		"ifm_device_info_eeprom_wp",
> 
> NIT: The dts references a number of other GPIOs, any specific reason to
> only name this one?
The legacy userspace tooling used to depend on it, used libgpiod to look 
up this GPIO by name.
