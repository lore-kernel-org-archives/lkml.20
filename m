Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4B2455620
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203210; cv=none; b=AleNvRKfSofpLeOR/oK4F79L6Nh5vp4KzbbxpGZ3wXaK4hvEw490VJA/kybYsr+7nCcPLtEgxTMs/6Gw4XvVVhReBbX9jwyIIBdoWHkLPsJihge3EDHskB7L4KOuLgmZBMqr5utWigxf30Nxgi/FJAk6Mpn1eAjnT2B/n8992/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203210; c=relaxed/simple;
	bh=2wrZ8L3fuDou8T3wuy8I5zA//dBy/9DfZ0w0WLLM6iI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HhBy04l9CPlHxJqhylIV5WOXYuNfJ9kNKzDxDGSdByBhFtwSCkdHwkyxSFtvOgmiOIMopL3mBTW1M9vHY4ajUdE51516FxFvsSR9Vv7Y8rSRgNufQRBuUx62SEfK3Yyq15xwbksfwmrrxdBFRE29CQKgp3jgMIKTUlDP8kSs+M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJLEU9+E; arc=none smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJLEU9+E"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so871410f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791203206; x=1791808006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n9zwmMvE9fywmpezau/UUq/GtmNz0qdU1IaBwDhE+Js=;
        b=jJLEU9+E5M6Vjc0l0lzQZJcZwbN9YfPd40jKPCJ/IyrVTgbbioggdFul8dWWqUN8WY
         z1XfxvR5uI0RCozpYjH4VRbMFEnpuPi47xR9D6j4N4eQxG0XD34ufU3pit1MKL2dontZ
         127zDteoUIxXajQ1w2UvIxdLy2F+BULWRd48wVOj4x5TOziNR2LzRYYwsqZ3CSigDy/k
         1KskKUdqQ66ea+C1BOQq80lh8TlNVei4mIQc0U3aIOilkQZ17L4xbrehnoTLzYItlTP4
         2dx7NVUi330wROC378S/jVLM7ZsdAyl836qNzawaAW8GOsXm5J9lQ1FQ9BDn2KSl2eg9
         yl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203206; x=1791808006;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9zwmMvE9fywmpezau/UUq/GtmNz0qdU1IaBwDhE+Js=;
        b=SvVSG0WTMEs4jp5g1i8TQ4W8fCKcVxPtALCpbwKp5vJ6plIPOzAJJElm6CW29tmv6h
         2tVBLzSIuYepgrpdDNJJwGFo0sDHftEZws+a9OPqiU1RiWnfYc33DpG6L6eB3n7XXUDS
         AEln5IiTUUZIw3Y+1K6WdPBY8TtK38T+h5BNGMr6BqXiB4jSYJrNQ5bp9GKJ4wIuvpQf
         GHeGaCwsh52NwN0FgCUMCo3MSua4BXeQJItNH440GOJSd4p80OylQuVfV/uXziUw9c6B
         7DHMK+3IRU+Amko0dnjo9uCCoUaXvtt1TEA4I+WKXWN+IzsSR0funYJI2vvrDJvcFchr
         wIdw==
X-Forwarded-Encrypted: i=1; AKwUvBy8tPirZ/NHAalYcH4MiMTDfe2n5MyDpV/A+UPslfWnzczdPHpJv8P1KxmZHry7ACNLgn+Kcy1nn6x5eao=@vger.kernel.org
X-Gm-Message-State: AFuF++khin8DNoayWLTxmQ4McRr+q4hbWwWW17uqjGfv3mMUCiGTfjHg
	dmWWiN1By9qvOIyX0D8SEXmIYIRd72KtJEk4jjE5aVxMM0z6HrsbgEAU
X-Gm-Gg: AYBFou0IKWmIqRr7WvWXPkn6p5uN8q6BN32EVEc/UF8PgNEAf1SPLCMFuNg8lC2fpvR
	oOkIksRGueH3qOMqwdS02u1h+OIvN2sDNFOH8mdL+snvaxrpi7RkmCUrpzMR4FZXhBeIEZ+786n
	/yIGD/kdqs3gwAjyUub5KuBfi0z14dSuty285HXlP+5RDKSPxUBQrhdb+os/aYhg1xq1waaIm8B
	J7OdJilZcng5IV4XUIefCpNnH5Oo3doLXMckThYrY9T1JCU/AeVa/eGKnFryYrLUx/1aT/MFyKd
	M926OUfP6h1LI3V3ZFGF8dzbg1ycnw3cyeGImsQlt2hsPuxyVpp4uI5W36P4ZIwpeeD7isEdLo1
	Vp0CZX6xUtj5OqKAje8rr2289K1LFs1NnBbReYjSiQBSwaOlC6gdrg6gnKPWXB7RacTwekvvz6g
	Wp0K8aIecVUSQd962zDeZL80YIICPMV8eqZ0s4njbRj55Tjzydirr7TZnOJLNg8WF9hhILXeNZl
	PyuuEMZ4LMfDSTcXFKHJyUQiQdHgtCcszq9QbrZcekiTA==
X-Received: by 2002:a05:600c:1f87:b0:4a0:1efa:c74c with SMTP id 5b1f17b1804b1-4a0275a1d54mr186457595e9.20.1791203206334;
        Mon, 05 Oct 2026 05:26:46 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm336935255e9.4.2026.10.05.05.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:26:46 -0700 (PDT)
Date: Mon, 5 Oct 2026 13:26:44 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun
 Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, linux-sound@vger.kernel.org, Colin Ian King
 <colin.i.king@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: tas2781: Fix spelling mistake "config" ->
 "config"
Message-ID: <20261005132644.583ba73d@pumpkin>
In-Reply-To: <179113127609.150114.13801161604243660987.b4-ty@b4>
References: <20261002113953.1782731-1-colin.i.king@gmail.com>
	<179113127609.150114.13801161604243660987.b4-ty@b4>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 04 Oct 2026 18:27:56 +0200
Mark Brown <broonie@kernel.org> wrote:

> On Fri, 02 Oct 2026 12:39:52 +0100, Colin Ian King wrote:
> > ASoC: tas2781: Fix spelling mistake "config" -> "config"  
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Did you fix the patch subject?

David

> 
> Thanks!
> 
> [1/1] ASoC: tas2781: Fix spelling mistake "config" -> "config"
>       https://git.kernel.org/broonie/sound/c/7d6adf283a83
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 
> 

