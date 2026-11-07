Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794054619;
	b=VNf4kVsSiX8tcsIjdGY5MEogLMAnaoQvdZIoLTDHCGdJDkKtIyuluwLAX1ih4sF2ZaXy
	 rp3JChWT5Zo2ymBA4nT+zE0l/HIwF4qCl8CVg3/WlCiMjtEFxubFqddLAPn9wN+jtdzpJ
	 gA7rHoF/2lBIM08CDeMOIQFpHNiMSbbjHNHNxTFUcjTSw+wXf7yp12OnG6Wa/jo8MD1pS
	 DwKvjnsVGXnEokI+K+qnzLk+wfALpL65tVwgePp28gwYc27gyTQ4/7ZMX/LHecWQ12N6I
	 3XjnCDLUFi9XCxukwYTI+bsqJbucrUzOd8ugA2XXFOm/eZLmwFlb+DS85N6/vpNx+hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794054619;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nr1mAF9XQ5+YqnUwdfyqdWv+PVIL5wfF/9P1RpVYn7U=;
	b=QhhT8NLBW2hdRENmdM7tbrvX2MP81CFc+6HyEcea6zHDK4yArPfvSWPU+8vzwskydGXa
	 1y0ZCFzpHpqkS0afEkeXGdcHol+2Y7MkGRSc3mq6c3NLs+DeyGzGjLYOHIuDloUsD1+ZE
	 vu8ebl43HH8YhF0vpPAOa3XRYBEW37GvRmD12Eg6hg3nvQKmtgSqzjaYA6QGwJ6TgN7JB
	 cGE7jWSFHY9evqEivjm94QFPGsCdeB5AGGs70AdYy9IYpgymRULoL6d0lE7Cv0V0DO2kF
	 sGz9/mnnLAQe/vdl6SouiNfk1RXTInGtEPyCoMTLtw2O/SGAaunQge9UmbfflWEP4eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kh7MWo74;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393FB606A32E;
	Sat,  7 Nov 2026 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kh7MWo74
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E15E1F0089F;
	Sat,  7 Nov 2026 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794054618;
	bh=nr1mAF9XQ5+YqnUwdfyqdWv+PVIL5wfF/9P1RpVYn7U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Kh7MWo74gdG0A0nfGfPyzvK5EnkGwsd4FoKhligqwHB4eJAANeUEEzpNkM/pNqQmO
	 0eicZzOsjU56DsuysVKysC58IOR0rh1DgTXdyR5sF03qA9UVWh9bkzdtyfS5IT/crc
	 Jr2CV+25eTV0XUi8V9P/ZVa75Lq6pHVIlDqmteofre28QUPREB3xZQdOQS19rErt7W
	 TDFgKG0Gk8Fqaj344Ewt9nunLqBy2JjNomBvuzHQT7/8/WjG+oym4MPLovqBMvZbUQ
	 97Hr2gPBYUIrvq832nhXXpjUHszWU6FllOMOYkruUdXr4CJDT4DBwqnLeHd2JMBlGT
	 SqbOx6gKKX9HA==
Date: Sat, 7 Nov 2026 13:30:08 +0100
From: Joshua Crofts <crofts@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH 2/2] i3c: master: svc: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20261107133008.7d8f0bb0@systembl0wer>
In-Reply-To: <20261107-dont-use-autosuspend-i3c-v1-2-80a1546354ce@kernel.org>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
	<20261107-dont-use-autosuspend-i3c-v1-2-80a1546354ce@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 07 Nov 2026 12:06:24 +0100
Joshua Crofts <crofts@kernel.org> wrote:

> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
> 
> Remove the redundant function calls.
> 
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index e700392f0801..9b845b2955be 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -2084,7 +2084,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
>  	return 0;
>  
>  rpm_disable:
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_set_suspended(&pdev->dev);
> @@ -2101,7 +2100,6 @@ static void svc_i3c_master_remove(struct platform_device *pdev)
>  
>  	i3c_master_unregister(&master->base);
>  
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> 

Okay, after reading Sashiko's review it seems that this patch won't
be as straight forward as I thought. I'm thinking of manually
suspending the device in the remove() function or just removing
dont_use_autosuspend() from the probe error path. Any thoughts?

--
Kind regards,
Joshua Crofts
