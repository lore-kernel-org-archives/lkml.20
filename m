Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6CD2BE7A7
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789324508; cv=none; b=DZuM+qHY6//vy7EZHL/xTIJAYR6+ZsGC59DPLYT9xJfng1IdOW4m9TjyWIZulPN04kqGxtgYwjVPVwZYh5slkElfqa2l7RciBznLsuIDZRDXWQ0NL4f0TmyWjUNBd5/mCxkzm7blg05VbtygjwigBEJloTAqvrAw+bJcd+3pfXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789324508; c=relaxed/simple;
	bh=mdjB/6vHmOS+jT1ikolyDEoo7GiRuopUruAO6LPFdB4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DVVWG312x8KpHvDffAxrRJN20SamHeLb6D9s81b5flDENf9IdgYAPrczVaTcuNcUUgAy+BJgPAJ573TFO1hPL2vOb28aG326KB4tpQZvQlGJTrQ8RPcWhkUrZfBHvkE7j9Ype5j1gbIfQiIUc/33YY1+HE5YkJsEJw3bRFVZKb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=zYmUIFjq; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="zYmUIFjq"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 1590FCD5E7;
	Sun, 13 Sep 2026 21:35:03 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 1590FCD5E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789324505;
	bh=jzvF1uGW1BmPBniFIraEI0sWxtjhBw/Ld3lz24/uYLE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=zYmUIFjq7qOs7pH3Rln2weE3OGG5dniOgPViHjuTm/Im8+hFbmEseOs9DX4+YXJW1
	 5TA72w4xE8VpsyAIXR9NcxZea/Hg0tvng+l6XBG39GUCnHVP0q9jeXhhik9Q+l9MpG
	 kSnGSfvmpsGxrsYILHxjcVlXqP2FpTfmynppy/TrgXoltbiS8UUGZCB0S6vtdaxfLW
	 MMQGCGH1bWjKuB0pDNHxt2MfsLuv9YWOqvAMZdVCrqgDAeDQF8qrof2bIstKsd08UJ
	 /XYluhSNkNJy3e+jrYYzN2kL6Lpl1NkUSnoZ4wsqowHsfYUTQR2IK6EJLi5mmeWRKT
	 H/kS+7ojVgMWg==
Message-ID: <67e1861034a1083843c876deae4af9733f4a09ae.camel@rendec.net>
Subject: Re: [PATCH 10/14] irqchip: fix repeated words in comments
From: Radu Rendec <radu@rendec.net>
To: Hemanth Selam <hemanth.selam@gmail.com>, Talel Shenhar
 <talel@amazon.com>,  Thomas Gleixner	 <tglx@kernel.org>, Marc Zyngier
 <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Sun, 13 Sep 2026 14:35:02 -0400
In-Reply-To: <20260907065659.12034-1-hemanth.selam@gmail.com>
References: <20260907065659.12034-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-09-07 at 12:26 +0530, Hemanth Selam wrote:
> Drop words accidentally written twice, reported by checkpatch.pl as a
> possible repeated word.=C2=A0 Only touches comments, no code changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
> =C2=A0drivers/irqchip/irq-al-fic.c | 2 +-
> =C2=A0drivers/irqchip/irq-gic-v3.c | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)

Same comment as before, for patch 02/14. I think this should be split
into two patches in the same series.

Applying many patches is easy/cheap. Dealing with merge conflicts
across different drivers when backporting patches, not so much.

>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index d10ac9b63c99..760317db9dba 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c
> @@ -180,7 +180,7 @@ static int al_fic_register(struct device_node *node,
> =C2=A0 * @name: name of the fic
> =C2=A0 * @parent_irq: interrupt of parent
> =C2=A0 *
> - * This API will configure the fic hardware to to work in wire mode.
> + * This API will configure the fic hardware to work in wire mode.
> =C2=A0 * In wire mode, fic hardware is generating a wire ("wired") interr=
upt.
> =C2=A0 * Interrupt can be generated based on positive edge or level - con=
figuration is
> =C2=A0 * to be determined based on connected hardware to this fic.
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 6e1fa5b247fc..69ca208eeee6 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -687,7 +687,7 @@ static void gic_eoimode1_eoi_irq(struct irq_data *d)
> =C2=A0{
> =C2=A0	/*
> =C2=A0	 * No need to deactivate an LPI, or an interrupt that
> -	 * is is getting forwarded to a vcpu.
> +	 * is getting forwarded to a vcpu.
> =C2=A0	 */
> =C2=A0	if (irqd_to_hwirq(d) >=3D 8192 || irqd_is_forwarded_to_vcpu(d))
> =C2=A0		return;
