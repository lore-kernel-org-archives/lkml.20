Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405023;
	b=aMFurA/Qw3NFKqEw3p8AE44yDDaMUfqihIpiOEzXhYBaxfqsmng6dFLSbto4aYxfxvef
	 1K51e/pj7dmszPAutS6m2pzBiPhEqmyFEunlb5MMAOXpt8BoG5cFKqP2hZuAS8q2hZbiA
	 L+iVlen/vqo6FSpd5BiWUpB8YnrjuSYIKvzaelxkuCEZ7+s9pkk2aQVmH9xvdeqpzupoE
	 XNA/NT8SP+uN69hpwu8jUerL1otq0buqw2UjKbjbZeFeaEM32qrwhrLNOREpHeLa6YtAr
	 CBWJjnzV+l7dHldXhNFnTVfgrcslgM8ZeFrLTnet6ytmA/lhqJjOA4E37oRtbj25LwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405023;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=PMhvGI9ERAg7fhsMSdsC/hmF3rE9akJlGOplemvTp/I=;
	b=M+3I0W1szxvaGOSFmnz35o6giBk6zQWwXWMM4WFaQGTsQGYslBRaxP+gJo4adL5VR+Ea
	 kkgNOyvEoQw0lE1xXXuD6Z1r3hnnpj1NaMDFNteon8GojiyIJtTshFy1iHcChV7BuesAE
	 hj2hu/06fenDiBCrgCYQchb9F/euu58b0fZ0V2ANMm0VN4wX6Tl3+FgCWbr64x5sCBKea
	 6mnYyGDI/HV+eFCdh0ahRpwmIrpSvOGOW61TsI5Z6z6RBG5+zSwNstOZhXA0F/zdrpBsm
	 fmXOQzT8v8sTIKhV0sqIEuUiKJxHaEaulFOnQLLaiBboqqg4V6CFHJPibqWmtcDiFcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=enneenne.com;
	spf=pass smtp.mailfrom=enneenne.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=AEACPrrm;
	arc=none smtp.remote-ip=62.149.156.86
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A70560A2603
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A70560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=AEACPrrm
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id R8iKxqxKS6q8sR8iKxsQjf; Wed, 11 Nov 2026 14:50:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1794405012; bh=SyFOrM7z60lMT225ZMupQKCXLeoZIrXfO4i0UdnOE0Q=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=AEACPrrmJ6KLa3nyNHmLCKaPmH+S4MoNWn+D+hVVEfo+nUVoqxZCyM+git9D24wIH
	 XpGhvyzGyNQH4s7DjvpDmXHznCROfMWdGFoyeUEkJx7eQRHAJa1AbAAS2kr0y5toUZ
	 wfmFRSN6UeUKeegaU4tVvTUze367zE6BUv7bzwkP7B1DhqTFE9yU4uQwIkjcadTB7O
	 VlwaQCWib4+dvfUXUkKDBKpB5hhx11ChwEnMVQWcQBgBcu9cZO204I7D8jcZRikdP8
	 JfPsgjHDBy9oB2ArhQT5PFoDpxs4YQMcwIIXR6ketEJV8s1zn0WFAYLYHLFsdVWmfq
	 vQLjhZ4bsOELQ==
Message-ID: <e73c9835-f17d-409f-bb9a-365212823c1e@enneenne.com>
Date: Wed, 11 Nov 2026 14:50:12 +0100
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
Subject: Re: [PATCH v2] pps: reject N_PPS on pseudo-terminals
Content-Language: en-US
To: Hungyu Lin <dennylin0707@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
References: <20261111132709.5959-1-dennylin0707@gmail.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20261111132709.5959-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfN9LwweBv96Z7xTG5t868Q1CyswA0yisg7E/8KPwv2qgJp1EMdhsBCTnv20nGJkREBmK+BZOlp1LbrntA/IdcugHsVyw0UjeVeD98oUwBXxVQQ78dDru
 DsroarUjwb94QWwuE2qbhQxF3Z6wdLRL1cu1lZTvefaZz0LABvCXp9nzbWCPShITHEfxLBgLM6MDY0/626gSqg1OHKMVyvvz3LetIyV7lvd5rIlb/DxyY0Fr
 K6ofdobNN3XEruvkD9KwoA7xDSy/X2c3a7FwBopUOVY=

On 11/11/2026 14:27, Hungyu Lin wrote:
> Attaching N_PPS to a PTY registers a PPS source even though PTYs do not
> report DCD changes. An unprivileged user can exhaust the PPS source IDs
> this way, causing registration of a real PPS source to fail with
> -EBUSY.
> 
> Reject N_PPS on PTYs before allocating a source.
> 
> Fixes: a0880df0ccde ("pps: serial clients support")
> Suggested-by: Rodolfo Giometti <giometti@enneenne.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> Changes in v2:
> - Reject PTYs before registering a PPS source, as suggested by Rodolfo.
> - Drop the stable Cc.
> 
> v1: https://lore.kernel.org/r/20261107211753.75932-1-dennylin0707@gmail.com
> 
>  drivers/pps/clients/pps-ldisc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pps/clients/pps-ldisc.c b/drivers/pps/clients/pps-ldisc.c
> index fa5660f3c4b7..83f4caced0c9 100644
> --- a/drivers/pps/clients/pps-ldisc.c
> +++ b/drivers/pps/clients/pps-ldisc.c
> @@ -46,6 +46,9 @@ static int pps_tty_open(struct tty_struct *tty)
>  	struct pps_device *pps;
>  	int ret;
>  
> +	if (drv->type == TTY_DRIVER_TYPE_PTY)
> +		return -EINVAL;
> +
>  	info.owner = THIS_MODULE;
>  	info.dev = NULL;
>  	snprintf(info.name, PPS_MAX_NAME_LEN, "%s%d", drv->driver_name, index);

Acked-by: Rodolfo Giometti <giometti@enneenne.com>

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
