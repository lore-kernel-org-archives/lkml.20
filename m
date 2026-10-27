Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090498;
	b=HhJ0pC9Y01uiR3fZ8LOHUdKICHsPfvzGcA4BoCRehOx+x2EXdRa3yfNMD831PnTFplBM
	 vuqtwnBzBo/qfeCcypKUX628ed87e8aTkwTRZ+4V9oIuTITH3UpSCZa3DrnB5fxXqiAAw
	 9nSLgkCHgwv2NfYq3G4GPRud9scXpghkY5sDVfptO+mnYwpzxjugDrmH6jF4bDi2RFsa+
	 tiDVtrsAfAZ8alxEdiKKg90r0oGd80m5QihwT6vJioQbBl238iq6dXEAAWFBbf1h1C+DS
	 9VjxvFlNoeOB4Yj2mhhWgRgapl7ySs/rzzZScEFB/was3yfF1YLip8V0BL6fuySEc9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090498;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rdeTErVTM9HWGGHuc0i3Cwp7+siwoWcWh/HAVgH8k84=;
	b=CknzrEhmS5Q2goRX225h9MSGkVM5kBt251bhfxAJj/R5bncrbvmdhVQpUUPCDSnEAaoJ
	 pd7wOKNFa9XheFue6CYVg1ONWcg6wB1XCfLYFDJVm46ScFmDG2W8XD0NuGHJr1ZhXxmge
	 ZJq8Cgl4bnov3z5RpnnkoHEH2iEWvOsLeukGKX5irYoXJW9YvBfKnceRPHE5zINWzRgbs
	 N9i3fAcRdIxIlHGp1bU48vg6AspvQTiHwsVJFCSpo3T3G9yhsvJxjHGf2ZrzOK3G3DpF6
	 FhLBKuNbn5KqlmW6m11cc2pgXwktE18UfrvT8FSXOLJunB4gmK7X+LQy52jD0VLh97w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=iYuvg2Ti;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D619C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D619C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=iYuvg2Ti
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8FE41476;
	Tue, 27 Oct 2026 01:41:32 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97D063F673;
	Tue, 27 Oct 2026 01:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793090495; bh=2/EEt+dUxW2pl325C7VxxAEesb251yEwGDap3wOiNT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYuvg2Til6S2cdQu1EiTKoBzSvxSze9zZHUf92FJ9N+EFV0j6tg7y1X3p0eokkZjk
	 Iy5yUEh6hD7BwvCgB47zb0Hs1L/kRz7rhlcK5oS1/F2L19TZT23rnyOVY6dTkMouGo
	 9brJbfv41G9RuVI5LartaEpZUfWobdBSWtvvAQj0=
Date: Tue, 27 Oct 2026 08:41:33 +0000
From: Leo Yan <leo.yan@arm.com>
To: Chao Xu <xuchao066@163.com>
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v1] coresight: funnel: inport schedule by priority can
 not take work
Message-ID: <20261027084133.GA766279@e132581.arm.com>
References: <20261025131308.7158-1-xuchao066@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025131308.7158-1-xuchao066@163.com>

Hi,

On Sun, Oct 25, 2026 at 09:13:07PM +0800, Chao Xu wrote:
> Before enable funnel, priority must be set. Changing the port
> priorities in real time is not supported.

> If the priority control register is written when one or more of ports
> are enable, then the write is silently rejected.

Could you cite the relevant documentation in commit log?

  The CoreSight SoC-600 TRM, section 9.11.2, PRIORITYCONTROL, a funnel
  rejects priority register writes whenever any port is enabled. The
  current sequence therefore prevent the configured priorities from
  taking effect.

  Write the priority register before enabling the first port.

> Signed-off-by: Chao Xu <xuchao066@163.com>
> ---
>  drivers/hwtracing/coresight/coresight-funnel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index af40814ce560..17f985798d7f 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -66,8 +66,8 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
>  	functl &= ~FUNNEL_HOLDTIME_MASK;
>  	functl |= FUNNEL_HOLDTIME;
>  	functl |= (1 << port);
> -	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
>  	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
> +	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);

Please move the priority write into the first port branch:

  /* Claim the device only when we enable the first slave */
  if (!(functl & FUNNEL_ENSx_MASK)) {
          rc = coresight_claim_device_unlocked(csdev);
          if (rc)
                  goto done;

          /* Update priorities while all ports are disabled */
          writel_relaxed(drvdata->priority,
                         drvdata->base + FUNNEL_PRICTL);
  }

Thanks,
Leo
