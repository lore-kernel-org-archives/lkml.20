Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974698;
	b=3RwxvbIqCvU6GdvlBDvDHr39SR0dOaDhg+skljoFu87YCWoCuBRh2bb2VKkPOg58hYyG
	 rP6tbjPC8ejPHho2JvtFKCDeFWGPoX2j/ubi/R2kkBCFaZgDBhsiq0AHlg26U2uiE3Ex3
	 xL09Msf2/u42JGRdyYd3teXj++6aNN+tD+msoB3gjaBnAzjhlqLATlYBSfCtpUZvKbdsB
	 vCfEF7bn5yZM7csgW37bbU7WzGc+FDs9P0BJ8HZvmJrABsEcrBWQMA1ylv4C2K1nYBkUX
	 fo94i4u3+54GtcZY3hX2A0uuQaipMIUgKjMQXE2hFDAPJ8YUifK9NCyhtqgeggR7kAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974698;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=NMEUU0nssRZdoXn3hRpYxlPnd+BCkFyCH0PpMWHSR8c=;
	b=4JkKqwAMVf2ZMK5W0VVCQDStBUc1WblF8zpvH/EUeToPCG4v3dL2Jg8VoYjZkuzvNh14
	 hse2FXmZ+Bec9JyJcFqHvCPq3Z9GsqjEmA1l4KOluNHIaTk3y3o8cpwNDfWN+K3i7vwb5
	 C5BQdIR0IJMQHK2/+gKK0D0lpVu7eja0iRQLbBMKjWU118OMYyCggiv9J2Qg3F5IPjf+f
	 uB7z0g9hf8A5n7UhI+Qs+FxSCvgYd1GJimaeS7sqiITDtrjGIFa/rhBk7rqBa3KcxmzQz
	 Ms4zITMC9C/J9Ph99AdA6CIEV4nJ7N9P5xCNACrcsyxmHZV3F/UbC4cibCbIdy1qScQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jrx1tx1p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE26606D804;
	Fri,  6 Nov 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jrx1tx1p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A37D1F008A3;
	Fri,  6 Nov 2026 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974697;
	bh=NMEUU0nssRZdoXn3hRpYxlPnd+BCkFyCH0PpMWHSR8c=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Jrx1tx1pWVylKjvtmCH4+8CQq+BXHkZvb940EOnKARH/rc5R8O/0uwPhbArCWiTdc
	 UtegVKcUCfDPwLc9wZu1lzqujuIjXRluhjPYPHXG2OZXoNi0K+qLAdS8nmMvvcC4wz
	 xs/HLqqXhIhNm9xRG0wkSUzP/GIib5IbYH1hZGwrNnKQIJrB/MRTjBjYDbgy0Bfo7H
	 elt6RMDNpw0LqgElYJWA1FQIdiWGcmbklpX9FF60bEhnQ5kngOJtGkZIv/sBCVpYrB
	 jnGNJ2YN7RCaNfiiMWirxcLfzOCq0p6WwcOI7s2oZkZ/Ap5dqgoZs6eBKKeKbFwULH
	 2F+K7ixJnLbaQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 100EC28090CF;
	Fri, 06 Nov 2026 14:18:03 +0000 (GMT)
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
Subject: Re: [PATCH v2 03/10] ASoC: fsl_sai: Remove redundant error
 messages
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261105104237.38542-4-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
 <20261105104237.38542-4-phucduc.bui@gmail.com>
Date: Fri, 06 Nov 2026 14:18:01 +0000
Message-Id: <179397468197.3073895.1522608204443678480.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=919; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hx8mgggRFuXY0KieYJpuHVL6+8FlwuH5JDHh9FUgOkE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLePpx16MPf6H3lCwqOt+ZnfsufVy/QZfz93ZqaNbX9K
 2XE497HdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiJ7sZ/rubf+RXKF7jdfar
 hs5el/gX0etiZp83z9cyfenYF++vy8Dwi/n/fJuJb30Duh6fTZotU66nH3AvrFh8qY3I3wrpzMt
 17AA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The errors are either reported directly by these functions
> or already reported deeper in the call chain, so additional
> dev_err() and dev_warn() calls are unnecessary.

> @@ -1698,9 +1696,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		dev_warn(dev, "Error reading SAI version: %d\n", ret);
>  
> -	ret = fsl_sai_reset_hw(dev);
> -	if (ret < 0)
> -		dev_warn(dev, "Failed to reset hardware: %d\n", ret);
> +	fsl_sai_reset_hw(dev);

This is the only caller of fsl_sai_reset_hw(), it could just return void
now.

>  	ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
>  			       np->name, sai);
> -	if (ret) {
> -		dev_err(dev, "failed to claim irq %u\n", irq);
> +	if (ret)
>  		goto err_pm_get_sync;
> -	}

This will only print an error for a subset of errors, things like -EBUSY
will now silently fail.

-- 
Mark Brown <broonie@kernel.org>
