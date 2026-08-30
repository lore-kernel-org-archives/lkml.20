Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843F22EC56E
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788107435; cv=none; b=mxbC9O5vxWfJioNvAP/ubbBvwbvyMn8lYBDfPbvkjmFGg1EEiOr0LA6WFj8mWKCGJ9Rv11xTlOBMlZMWASYIlB8QYu/xzhv/nifH5g1rxDmOSGdL7QrgCXXe94ybK/SdG6twrMdPM+Krabf2npOwdSmGQJKlcUN7LIN7B0+z+gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788107435; c=relaxed/simple;
	bh=aNS8gAc2JRPWto6wkjb9L5yUtOT4hCY5RJlAwW+y8Hs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rnsxSkqjcEncLhCOcVzwwC5Ig9/80VBQYUSinlGFJUH4x/vboBPSXVDTH2R1BostCZKgemVb+m4J8lSxqHBcyGmYESfAQ/wHYYU57WdW0dDB1EmhALIF2S2ALth1eirNJFw6tkLspp6O0i/vGCXnJ/a7hhQvCttLKITWHT4I75o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=VbnYzlYA; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="VbnYzlYA"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 572C4CC505;
	Sun, 30 Aug 2026 19:30:28 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 572C4CC505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788107430;
	bh=DHbQgw0rVP+95Tv0kAeoRDdjuGbtzcnAd7wDYd7T4VY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VbnYzlYA/is4ElrnBAiVpynIrmgkXqFz8NREmw6TFB236tIPAP0Rj6EZPNRW9A6bo
	 qYRSCl+FKSPWv1qdPuuKd7jcsmkSjieEnzBAOa+OrSaXKcdsRfw+oIbb749n6La0qr
	 PmtmiCvjf9YJWIgYO9ghTa/xzswW0LaDlQJh6mt/5AGSSljNsvUDiP5TPaAvmdt+AB
	 QyyJnf1rkX4m+IsG3bumpZ7jc+02U0WzU/N3tIInaP4QgNI6VLXC6TAaZBcO66h7po
	 XiZ41hUAHi9ZCgTq4zlrc/aEtAUunfBKqmnth2RtN0llWsP+0/tarLiLK6RTCydtaP
	 q0j3u2ru77ubQ==
Message-ID: <0b44f9fe48a6e81a5dbbb61ead46b77b117433b4.camel@rendec.net>
Subject: Re: [PATCH v5 4/9] irqchip/imx-irqsteer: Dispose of parent IRQ
 mappings in remove()
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Sun, 30 Aug 2026 12:30:26 -0400
In-Reply-To: <20260821101039.4037925-5-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
	 <20260821101039.4037925-5-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-21 at 19:10 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>=20
> probe() maps the parent output interrupts with irq_of_parse_and_map(),
> but remove() only unchains the handlers and never disposes of those
> mappings, leaking them on unbind. The child mappings handed out by the
> domain are freed by their consumers and, together with the domain, are
> now torn down by devres, so remove() only has to dispose of the parent
> mappings it created itself.
>=20
> Dispose of the parent mappings alongside the chained-handler teardown.
>=20
> Fixes: 0136afa08967 ("irqchip: Add driver for imx-irqsteer controller")
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 571324de8bd1..071ab1ac1fe9 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -287,6 +287,7 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
> =C2=A0
> =C2=A0		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
> =C2=A0						 NULL, NULL);
> +		irq_dispose_mapping(irqsteer_data->irq[i]);
> =C2=A0	}
> =C2=A0
> =C2=A0	clk_disable_unprepare(irqsteer_data->ipg_clk);

Reviewed-by: Radu Rendec <radu@rendec.net>
