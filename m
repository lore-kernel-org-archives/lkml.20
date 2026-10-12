Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B30241D11E;
	Mon, 12 Oct 2026 18:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830545; cv=none; b=ZnmI2aOJCOVyqRbWlu9DXqvz+/GZsdRNcjvP60Q8YrVnSIoWw/AMSUDdtf7Wtv4zr13TWIFuPDYYVgDJkpqMAH5oca5ocOifnhFQ7wBcKbWP0BS2EA1FUcj6gN16zKdbaZ5lnN8rKAt39J/qQEmQq8K5A20UgA6hzsBAhrXU29E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830545; c=relaxed/simple;
	bh=q4k8XPLQoJzD8BDO0qhxsx26kkD1Q2tKz02XIKGByZY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oF4IyO3EUWlceRpm53c6qxNV+9TNPekg6ywFTjuRSna9JjrtfzTojtkOcRY1Gj0+YiwOLFCsy2LCAYzTntAW90GbTViRYk5aObdp8FUOK2SGMBdC2CH/gWl9/x+LzFZmiHdzwu79uOP9BYlhzgprywLBXpPnVAfSeipeDQAduxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=T/v2QCMM; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="T/v2QCMM"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 6D0C0D1E2A;
	Mon, 12 Oct 2026 21:42:12 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 6D0C0D1E2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791830533;
	bh=5ctWxVh/+54EdYQ1/pJyqS1d7lNABZeIrnQsKMGxJDw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=T/v2QCMMroCSpgcYhNgF+CaT6lYdh5zeGI6uz2X2YnaUXprHw+5IzrqaCibljxM01
	 Ykgs4KA05s4Rsz/lbuBhFiBhhTE/Wo6iwLEr3RbimPKY10RKXS8bstLq7DPTSsiBKq
	 y9jjjxTqpRidi5JVH/vtbh6f9PDQFgHNBOhWwCCZdJqCEhQ6vIkOvff+cVmOwDFguy
	 G7BYXfKh0Rl81PYGzfVS6JrG79jBbxPDwNrDw5yJ0eYf3H4kfHdueufEI/kfHnqseI
	 rH6EVGW6ATd0G5cSRFq/WyAexzNivkRhlvXpEkAqRUNdK1D63qr8ivW0ae8yNhSUmq
	 usmkkGUPuOUXw==
Message-ID: <12ea5b1c7e8b1399389ae5a7f76d8f4360e2579b.camel@rendec.net>
Subject: Re: [PATCH v5 2/9] irqchip/al-fic: use %pe to print init error
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 12 Oct 2026 14:42:08 -0400
In-Reply-To: <20261011050449.41903-3-farbere@amazon.com>
References: <20261011050449.41903-1-farbere@amazon.com>
	 <20261011050449.41903-3-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-10-11 at 05:04 +0000, Eliav Farber wrote:
> al_fic_init_dt() logs PTR_ERR(fic) with %lu when al_fic_wire_init()
> fails. PTR_ERR() returns a signed long, so printing it with an
> unsigned format specifier turns a negative error code into a large
> positive value, making it harder to read.
>=20
> Pass fic to %pe directly instead of unwrapping it with PTR_ERR()
> first. %pe accepts the ERR_PTR-encoded pointer itself and prints a
> symbolic error name (e.g. -EINVAL) when one is known, falling back
> to the plain decimal value otherwise.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v5: new patch.
>=20
> =C2=A0drivers/irqchip/irq-al-fic.c | 5 ++---
> =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 35581332b40e..41f7a8390328 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c
> @@ -258,9 +258,8 @@ static int __init al_fic_init_dt(struct device_node *=
node,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node->name,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parent_irq);
> =C2=A0	if (IS_ERR(fic)) {
> -		pr_err("%s: fail to initialize irqchip (%lu)\n",
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node->name,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(fic));
> +		pr_err("%s: fail to initialize irqchip (%pe)\n",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node->name, fic);
> =C2=A0		ret =3D PTR_ERR(fic);
> =C2=A0		goto err_irq_dispose;
> =C2=A0	}

Reviewed-by: Radu Rendec <radu@rendec.net>
