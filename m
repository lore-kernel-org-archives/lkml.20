Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E87E346FB3;
	Sun,  4 Oct 2026 16:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130541; cv=none; b=JYeeW75Y6MoUlDaRpEaZCs7xcVTjYDe/SNnX0/xa1s17wnYfqNePWNt2+X5D54By5Sw+h/pdRnspzTbLDO6Ivz51EEqn8Jone4CS4vkbOITarj7WgshqyGkw3BTYBfghp4gFl+Jffj/uzHeiQ1d8rCR7OzQivMdbMnMeQZcil8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130541; c=relaxed/simple;
	bh=GXro25r1oxBsXQjRyScAB+MjpKJbWO7aT4sRP3ONE/I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oD22whTkNKybqAzriVID+pKR3STdHsOUy2CeDygAF0Lc2hWp4F4sFdgz+V2Xn/rh0Tu8jb6CCrrkHiOqNK6NJr8kftj4kNA04KUGjLCklRCik8rwFQXE9IamIAPplFu1RLDD6bMMvEerbGYxd6OFDfBLHUX13qMj9jqYHfD924A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=tgNHhzhO; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="tgNHhzhO"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id D3E37D1951;
	Sun,  4 Oct 2026 19:15:28 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro D3E37D1951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791130530;
	bh=xN28YHCbJ0FqTUsBHEpMgEsQErbGHRXRz+UCSPrxKLw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=tgNHhzhO+1p160FqlQmb+xhOl3yp1Y0BOC9rhC2/cramVkQ/TLzzvEsekNsnAB79z
	 yIoeO605rltRYrYb6KCQ+U6cExD1fDjaNQedL99h4meiY6vV0iC01j2Q/12Y19USfw
	 cQwaEDrVjwoay9IgKwHGPzQqzE5Ke9nIK8plFfX82COSzOfUNXe1Ek9wOrH5CSpeL+
	 FU9rTpnz0WW37/X0tLNx9YWy5qvp4JFAeZnvybCgxxEiC08ov5IVYSAgKRC9VE5Pzd
	 9EMrkN8inG1NxaRjqO1TC7VIuE4JcZqjDuMa53RnOnlha258XLyqmMYD77almZNWw1
	 NJElNYtxM48mQ==
Message-ID: <fe5ee287339e8aa99b1e6ec7d9929ffc8c37aad7.camel@rendec.net>
Subject: Re: [PATCH v2 1/8] irqchip/al-fic: fix argument alignment and a
 repeated word
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 04 Oct 2026 12:15:26 -0400
In-Reply-To: <20260927080637.27285-2-farbere@amazon.com>
References: <20260927080637.27285-1-farbere@amazon.com>
	 <20260927080637.27285-2-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-09-27 at 08:06 +0000, Eliav Farber wrote:
> The continuation lines of the irq_domain_create_linear() call sit three
> columns short of the open parenthesis. They were aligned for
> irq_domain_add_linear(); commit affdc0d1bdfa ("irqchip: Switch to
> irq_domain_create_*()") renamed the function to one three characters long=
er
> and left the indentation as it was. checkpatch --strict reports "Alignmen=
t
> should match open parenthesis".
>=20
> al_fic_wire_init()'s kernel-doc reads "the fic hardware to to work in wir=
e
> mode". checkpatch reports "Possible repeated word: 'to'".
>=20
> No functional change.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2: new patch. checkpatch --strict cleanups (argument alignment and a
> =C2=A0=C2=A0=C2=A0 repeated word) split out ahead of the functional chang=
es; the touched
> =C2=A0=C2=A0=C2=A0 lines also appear as context in patches 3 and 6.
>=20
> =C2=A0drivers/irqchip/irq-al-fic.c | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index d10ac9b63c99..35581332b40e 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c
> @@ -132,9 +132,9 @@ static int al_fic_register(struct device_node *node,
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	fic->domain =3D irq_domain_create_linear(of_fwnode_handle(node),
> -					=C2=A0=C2=A0=C2=A0 NR_FIC_IRQS,
> -					=C2=A0=C2=A0=C2=A0 &irq_generic_chip_ops,
> -					=C2=A0=C2=A0=C2=A0 fic);
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NR_FIC_IRQS,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &irq_generic_chip_ops,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fic);
> =C2=A0	if (!fic->domain) {
> =C2=A0		pr_err("fail to add irq domain\n");
> =C2=A0		return -ENOMEM;
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

Reviewed-by: Radu Rendec <radu@rendec.net>
