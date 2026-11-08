Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146720;
	b=NNHzx2ilziANKakINQwQe7eiepF8r01TlGleVCvqIkeg5wPzoM9+t05t+rPx+uhhs3Ro
	 YYKBu9ZTwcLcwwBeDV6e3Kd6iGxxV7FqdGDSmTg6XKjrgrb96jITmWBLKey6AyBABWeuV
	 0Kiwc67mMDnIIT+DhosqeKqX0MhnqGRFmMZVW05mf8DlHqnkjG5lYRl6hOkiXtThGlOgP
	 Pg9SqJ/T3FWzAyG+coiJqFsLeBkwei51F24LQ5dKTTqyi+++8QNRGrq/Upe+trDGcMAqB
	 j39faQG3WYNOHgkBIRfZYkSGDMo5xcr2u5GwuskeHwLwue7Mw4BmZg4TF2eGHpHyBQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146720;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uICtBr2jLZuJfW9lnASQw1hy3Dw8NzL8LRvQ3Us63kE=;
	b=TVMC6+v+ubMTt249Behchx9eva3GaYAU+Mxvp6YPerYixcprPiFRMk3GdJKJupiyjJ+u
	 9gzQKTkaZNC9c7H/DZ6LXeg6aFfoh6JOPEyCfm0EryzUrwEvjC/AYrNQCSP51aM6HWMAA
	 mpn9fTA+yBjMyceUHNl7XNNC4eyGeLv3u8D1sxWe1ovq2iGX1YYSSse4Z8j0Irn3QjmKY
	 Cne+Z0k/gz3gCr/sJHXVxYo2YUFzc6ywcT1a9Mn9KgTp0C/ii+EyR0tdPhAzniKmGpMwG
	 7YbNGA7HfkhZQWHZiLH5rSGbJfZn8sHTAHl7F/c0VOxpkhZNjrFrXExkdetXv+EvGfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E82MScLS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6708606A31C;
	Sun,  8 Nov 2026 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E82MScLS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965421F0089F;
	Sun,  8 Nov 2026 14:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794146719;
	bh=uICtBr2jLZuJfW9lnASQw1hy3Dw8NzL8LRvQ3Us63kE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=E82MScLSerClm5dcf+q0coN2rzEQDo+ruI+sEWbg/4/V8prJGNzpEijyQtBbvf59B
	 +bMiKkiPb0mWkGhok67AxbfxMUdbk3AeW8bemHzRoWlv1FdvZVEtaLNPMNENkLm1GM
	 MI7xiprEh5k9psJCDbOKGy3kl575Joy4pYRp+5oOKI9StbNCQ0Ki4oPX+JdcAWtTWU
	 tCeGpkg+IBY46nLlir5xBxM4I6n92Y7I8r5fB1QcrvQCKWWnXyM3YArEve/syj/vl6
	 /xG7FvwLeWcgAJA9Yv7UTwi3aiPE9DqubRUbd7QP27Md8RY88aFZfUwfBH7wSK/cwV
	 n836axhIXtE/Q==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 521762C797EB;
	Sun, 08 Nov 2026 14:05:17 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/5] ASoC: dwc: Remove redundant error messages
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Andrew Jackson <Andrew.Jackson@arm.com>, 
 Mark Brown <broonie@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>, 
 Tim Bird <tim.bird@sony.com>, Yuri Zaporozhets <yuriz@vodafonemail.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Maxim Kochetkov <fido_max@inbox.ru>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261106112940.53550-6-phucduc.bui@gmail.com>
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
 <20261106112940.53550-6-phucduc.bui@gmail.com>
Date: Sun, 08 Nov 2026 14:05:16 +0000
Message-Id: <179414671638.3711751.18312173137946049928.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=507; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vlzJCzy2CP4AEUlWY7flG/+WGOj3279bF0KkQMlZg+I=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+NM7leBCouzQ2fFHST5MO74PXq7cek1Tbwab54ugD9
 /5/5oz3OkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRT1yMDJd7XkqmCP16e7nN
 lDW17nmciI3hwcXszqJGUhND5565tYXhf9W2WssV7CnPZaPnfgy4/+us5gz+Jd+9Wq4XReUd5z2
 ryg8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The underlying functions already report these errors deeper in
> the call chain, making the additional dev_err_probe() and
> dev_err() calls unnecessary.

>  		ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
>  				pdev->name, dev);
> -		if (ret < 0) {
> -			dev_err(&pdev->dev, "failed to request irq\n");
> +		if (ret < 0)
>  			goto err_assert_reset;

request_irq() logs some failures, but not those where the interrupt is
just missing.

-- 
Mark Brown <broonie@kernel.org>
