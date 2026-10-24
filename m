Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792882725;
	b=MS6XTD7sH8flroUzG3H7cYILcA0kVAU60OI7lX0ND1DTwqMeCYPLR4fY1K3dP+/4iqSW
	 xIc/28zSQhW7Bgo1gkMKVYOM6+TEqwjP1cKOySjYPd9IVkZAVgXTdIFJd6+CsQRxEmTap
	 9gyleEsZ9qTWGBR0JuOB2xRsrbZTal19LizD9qa1dVFIo4eaLp3LCisYryiqC5OX9Dduo
	 xwAk68EC9px3NwJ5mJa3By+OIxQNvNxKUQOlqDOvGd21ndYodEo+KikMEFNZkypKErY65
	 ZBrjAZa0wqF96kWgfrs/YoqfWEihqGm2jjsDlWCXKj+FUuQYXuzxdl3yNCguMj/seCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792882725;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WSIS6+25y7PpulNnWBnfkisB8hS2P0CMzOFHtu1nW4c=;
	b=ysXeIyEJAcyR+ZqZjeYWoalF/nTpmYBwGUHWA8o22bzXOK+mSUAtW6apC0fwhoiG+ekP
	 PolOniY/sQFjeHSQIW9Tyevri8lkOsvnY7fDLv72ESHcC37Mon0Z/JV8MQrZ2fM2SL1ya
	 ryinUyeIP+xZrdHHlOiPHoREcY1aMB4VS1COX/uMfz6ZDrptNoWaDn48u15x8CZTl3R/u
	 rpOgr6q6xmhYlQRC1jI6lFAfLOYDG4FXaBIbAETzRtFFlU6yEFqeMP9YPgqg3bP/luYT+
	 SPdJ/gxo14XtpX1KJy2u0x2GGIM3nMs5ft1RhTObeIBj34/1et8j8nwLHmXPK6EMtEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=YsuAc8wh;
	arc=none smtp.remote-ip=91.218.175.9
Received: from mta0.migadu.com (out-9.mta0.migadu.com [91.218.175.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A51606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A51606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=YsuAc8wh
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bGDQoazpJNyjoIiqx4hbPSVe8AwD1RNCrDC+N8q46A4=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792882717; v=1; x=1793487517;
 b=YsuAc8whqQV+CP0YWqOUXI1EZBzWRLPdKcB31cF9eDBmkamAfpo8PUJeeG8Xu3wwJSgdmPp3
 f/DBdXaq7phuN3Y/Ez9DsVEg3AKcIcmmeV0zbm4AURUnAbJcRIorQrZ7RUoYet4fv5baIgdOP/F
 OXA9b1pMClAXTU+s9ccOm6KC3C0aVs9fwUpPjS7E6KkEK4dWNzKb8DIQkxZ0nMaNUQ9R9s34dtq
 sYrzyzcxELdz58qnn6ZGD3+eOGvD7Z64qJNHvfl2H44evW3KA0XDexCf9AYQ8gWcjAp+InrcPMj
 PuXrC6mHqnMetKscuMR6D8xDRzb6WcegzKCAkZwh7u9TQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 24569aa950332146;
	Sat, 24 Oct 2026 22:58:37 +0000
X-Mizu-Trace-ID: 24569aa950332146
X-Migadu-Flow: FLOW_OUT
Message-ID: <f17f962d-22d7-4a88-bdcc-9be6556040f1@packett.cool>
Date: Sat, 24 Oct 2026 19:58:33 -0300
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
Subject: Re: [PATCH] ASoC: codecs: lpass-macro: release macro and dcodec
 clocks in runtime suspend
To: =?UTF-8?B?UmFtw7NuIEplc8O6cyBNaXJhbmRh?= <ramonjesusmiranda@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023173216.6245-1-ramonjesusmiranda@gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261023173216.6245-1-ramonjesusmiranda@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/23/26 2:32 PM, Ramón Jesús Miranda wrote:
> The LPASS rx, tx, wsa, and va macro codec drivers prepare and enable their
> "macro" and "dcodec" clocks (which correspond to q6prm LPASS_HW_MACRO and
> LPASS_HW_DCODEC clock votes to the ADSP) in probe() and only release them
> in remove(). Their runtime PM callbacks only toggle mclk, npl, and fsgen.
>
> On Qualcomm X1E80100 systems where the ADSP is booted by Linux (such as
> running at EL2 on the Microsoft Surface Pro 11), keeping the LPASS_HW_MACRO
> and LPASS_HW_DCODEC votes active while audio is idle prevents the ADSP from
> entering low-power sleep during s2idle, which in turn blocks the SoC from
> reaching CX collapse (CXSD) and AOSS sleep (AOSD) (both counters remain at
> 0). Also, calling clk_disable_unprepare() unconditionally in remove() on
> clocks already disabled by runtime_suspend() causes clock enable count
> underflows if the driver is unloaded while runtime-suspended.
>
> Disable "dcodec" and "macro" in runtime_suspend(), re-enable them in
> runtime_resume(), and guard the clock teardown in remove() with
> !pm_runtime_status_suspended(). With this change, ADSP, CXSD, and AOSD
> reach >99.9% residency during s2idle (~0.20 W system sleep power on a
> Microsoft Surface Pro 11 OLED).
>
> Assisted-by: Claude:claude-opus-5-5
> Assisted-by: Antigravity:gemini-2.5-pro
Advertisements for particular slop-generators are discouraged since 
816d9992d9ed ("coding-assistants: simplify attribution") btw, and the 
tag is no longer required since 1e035297ffda ("docs: remove Assisted-by 
references").
> [..]
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -2390,11 +2390,13 @@ static void tx_macro_remove(struct platform_device *pdev)
>   {
>   	struct tx_macro *tx = dev_get_drvdata(&pdev->dev);
>   
> -	clk_disable_unprepare(tx->macro);
> -	clk_disable_unprepare(tx->dcodec);
> -	clk_disable_unprepare(tx->mclk);
> -	clk_disable_unprepare(tx->npl);
> -	clk_disable_unprepare(tx->fsgen);
> +	if (!pm_runtime_status_suspended(&pdev->dev)) {
> +		clk_disable_unprepare(tx->macro);
> +		clk_disable_unprepare(tx->dcodec);
> +		clk_disable_unprepare(tx->mclk);
> +		clk_disable_unprepare(tx->npl);
> +		clk_disable_unprepare(tx->fsgen);
> +	}
>   
>   	lpass_macro_pds_exit(tx->pds);
>   }
> [..]

You're working with a tree that's months out of date! This does not 
apply to linux-next at all.

Commit a5ee3180a2a7 ("ASoC: codecs: lpass-{tx,rx}-macro: switch to PM 
clock framework") back in July removed all of these calls, and the 
clocks are now automatically managed by the framework, which has solved 
the issue.

Several people in #aarch64-laptops have gotten CXSD state working 
recently, and no one touched sound/soc/codecs.

~val

