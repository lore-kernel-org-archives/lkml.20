Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89102E5B29;
	Mon, 31 Aug 2026 01:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788140538; cv=none; b=FHPJM/d0DyNW8xbbXx8MGSGW053iFqZpAWhDweQpsmt5wOG3EmTckB5pA1z5j1jkEcjZ6u3SPpKNjR+PVkugranKTKCckRClIuFIZi0RMDzDsO2N5OVp41wwCWcrJSg3ixrIyO6gyVI5R3oepJrQgrR+t1hF06gSXEujPrwZrAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788140538; c=relaxed/simple;
	bh=H/w5a+XIthbN5mynp3nuzqlAIjAM5Co0ejvUDr4w9pU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OiQSv0DPW01huEI4OdWG5ufpdsNR3VIPbJdnIjCBREVXxw090onsPEz6j1G1CvCCqvsxkLQBAr4vJXM2IZFmCiI+UkmTa5HTTXNLmL93oeW5Ivs3Hr8jNmP612tgST/g592UQCO1jptA/JWTGbHhjFtl3RRLbVy2WwMTbOzDFlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=VcYEwYIi; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="VcYEwYIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1788140477;
	bh=VgcTdmN1+NZPi395+qYMSKomq+S9lhZAqZQzX8ZSS6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=VcYEwYIiDlA/qvBI+r+bmydK3L4PoXy1A2QjzPyhfma4efAZH+2vCKdhLrW/OYqzP
	 bBBuANIypPMxIeGKM3AuSZjTvI2U/hogzPhrRXPdJNYJEIztqPfrN3MTQETbh94NdK
	 46+PUqVrm56AUIgUgV27gauTJaKzH/FQfoJO8Ia8=
X-QQ-mid: esmtpsz19t1788140471t4a3b1f4e
X-QQ-Originating-IP: 3UhhlstAmz7bt2FV6PFHCQNwYydpMBw8AK9pSZHATEI=
Received: from [172.16.12.90] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 09:41:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 920350159676869033
Message-ID: <84A6832DFD4B9FF2+64806113-d65e-448a-b2c4-ee83e125a665@airkyi.com>
Date: Mon, 31 Aug 2026 09:41:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: onboard_dev: add the Rockchip rk1808
To: Rudi Heitbaum <rudi@heitbaum.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>
Cc: Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <aouw7rH6FZxscUTO@0d3a7a881997> <5096877.GXAFRqVoOG@phil>
 <apFpPP1O45BWXDv5@5be1eda4e59e> <4512468.iIbC2pHGDl@diego>
 <apGMEsCwly8TCOww@5be1eda4e59e>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <apGMEsCwly8TCOww@5be1eda4e59e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OWISOlifo4HyrF+2ggBCw624Qpr6AIS8jGWgOY9VSU0Cx8+c1b99yWRd
	FAf/4tENwvcVeRwUwksRWPcoWKqO3sH98URnZCaa/MBCW1lYDKRll24no/oxZhm+g3b4kpQ
	NYS6R+xRLeiQrVwXZxs3TYwPTEQH4/IVbwN3GOpMWAaZXxHkWSsKWRh/Qgy0JCNL0T3rFbG
	BkbVTM/ckFHRnBDK8ph5QcNFCRTSyCUN4YbxthlrWuvEV4wtjb5NyFkWPFLVDCOuMOWGD7c
	eVoovPSThB+6xES62ejzP32x0kvzZTmOE9wsPOP9H/6RjDpLUgShxmgZ8TVHNif4PK9GchJ
	gqXSYt1O4ewuMjFr5SC8caz3hBAM5n9VRnpaZMlLRMLs0vc/GkzLG22glnYNV2rhgau/wdT
	IeRUcLk9IuJtXIh6LIr+deVB7uFcZHzXmuz4CDcJkWfM8xJwDqt+kxmgKQDrBnWffiWRpRx
	1vJZsYRJZm1IuPWhkRU34xPFp1n/zbqy3mfQxAPzRAyy0ddjNmSU5VzE4Cu1fwvcy5X85Jg
	aThX0cS++CoNcI2sA/c3eWA7QblY6OpoRQ+AnTd87hlODDeW6EmsANyD+dcafvbA7FbepKy
	KvDYipMIcm07kj37icagjWr55JctHv8Yp5zZNAYSfhNmBeJ6cjU7h7QpwiWdox07YV1idjy
	Ja7bofu6MHlYQOLq5myo8CD4W94v9Rwn2kvPuZccFH4rR/PzSFtE6wBdX08V1ttB41bfZi2
	TTvKy/9sTZICN5gpkAdKf27ZcI3gKP27x2RXTryTb6rfqyOmzC0IrCEE4gXksBO2Tqe4NNI
	nBdPlZXE68GiO2L+O4Iao4dFBqekkGe/WTbK1vQPFLiIYf3seBaQyrg9eEXQ736NCPvDqUf
	NA0H1hiIhI1mmXcMS0DaqKt+rcdCCeyfRU9JDke+LxW4Nx32dNPy4HzZPXC6SWJv445DkGl
	xo82X5Nlc0oEVv3ByI+85wuCrzeors9cBd0TXZF7t/XiS7r5IEAHcnlIC/08ii2eck5cASk
	8y+DZwrg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Hello Rudi,

On 8/28/2026 9:24 PM, Rudi Heitbaum wrote:
> Hi Heiko,
> 
> I hadn't looked in to these from the mainline viewpoint. I had been
> using an adapted vendor script based on the radxa npu_powerctl binary
> which reimplements the npu_reset sequence over GPIO.
> 
> This has been the sequence:
> 
> gpio0 line 4   NPU_PWREN_1   -> 1, 2 ms
> gpio0 line 10  NPU_PWREN_2   -> 1, 2 ms
> gpio0 line 11  NPU_PWREN_3   -> 1, 2 ms
> gpio1 line 22                -> 1, 2 ms
> gpio1 line 23                -> 1, 2 ms
> gpio1 line 24  NPU_PWREN_6   -> 1, 25 ms
> gpio1 line 0                 -> 1  (reset release)
> 
> I have the schematics and the working N10 here, so let me look into
> describing these in the .dts and update the onboard_usb_dev.h.
> 

Perhaps we should first check whether the power-on sequence in
onboard_usb_dev.c meets the requirements, as it enables all
regulator supplies at the same time.

-- 
Best, 
Chaoyi

