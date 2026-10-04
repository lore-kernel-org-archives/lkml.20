Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6299432C8B;
	Sun,  4 Oct 2026 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131154; cv=none; b=jbSTQGMRG4kSCz46yCwL7xvxux9RD1Tu03b4B7Vjv0Eqiwl1Y/ibm6dtsoUurrbD56UT1IJGE4+kZd8ywyZ70092pgZqShjnXX39uAUwPfEOHTufKwcoQ6nP1Nets0bxct6LiauigAebf4gHOPcAd6yt4DC8u3CBnk7Guq2n+ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131154; c=relaxed/simple;
	bh=dnaJCgALZQKd5qJY4nhiZLfNYukFwN/CJHSWXfgG7sk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=At4JBFHNVN/3gwQktXiZq5yWWTf42dXYvYfP1/FMf8tftIuNPotycXM+diPeh+eTBJdKoQRtoM9LuWoijTcSXnatmJ2zSm9ZdEnMdVmk0YqtrXzksovCJCrZJsShSAbgAdSqEbPV/DfiBaS27lbKny+gFb9jOvSfHpFy6W+KF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=p3ObXZ+Z; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="p3ObXZ+Z"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 0991CD1951;
	Sun,  4 Oct 2026 19:25:48 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 0991CD1951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791131150;
	bh=v7zwPCo4uBIidkqLPV4OdHtYo25BA6fomZ9vjY0K9Rs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=p3ObXZ+Z/BmQQXVY43cvu/xgsg8r5Y6uUq0WMAunb6OYgVA7nkVYfCKPk7Js7z6y/
	 FrPOlknWr37XRaTLuhFvtw0f1aueDUPQAyq00jfbsNpYyeYCwagynSqtkebksluvzc
	 qxpzaDjcUpeiJV4KfKgA4z47/rtgCfa7cxd+HGviMXoorpnljzs3F4S3BQm2K9f53h
	 XPamcoZAfWpQNqPXaJ7ndtqLDcZjANVQwMAMjy8bchzgg1BoriA+9G9w+oyPwkAbnY
	 qUi5vYl2B3VB0e/zBNqJ9TcdohvB3R8aD/pH3fD5XUFblC/D2/JT3rAvUEj6lC7zn8
	 0G5QIqMyZL5Hw==
Message-ID: <4d4ec34125df2f2b3efc6adcbe9dc45f66b822e8.camel@rendec.net>
Subject: Re: [PATCH v2 2/8] irqchip/al-fic: use %pOF and raise init log level
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 04 Oct 2026 12:25:47 -0400
In-Reply-To: <20260927080637.27285-3-farbere@amazon.com>
References: <20260927080637.27285-1-farbere@amazon.com>
	 <20260927080637.27285-3-farbere@amazon.com>
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
> Use %pOF in the driver's log messages, so that both the success and the
> error paths identify the specific FIC instance by its full devicetree
> path rather than by its bare node name, e.g.:
>=20
> =C2=A0 /soc/interrupt-controller@fd803000 initialized successfully in Leg=
acy mode (parent-irq=3D3)
>=20
> A single controller is described by several FIC nodes that share the same
> bare node name (e.g. "interrupt-controller"), so the bare name cannot tel=
l
> one instance from another. The full path includes the unit address and
> keeps the instances distinguishable.
>=20
> While converting the parent-missing message, fix a grammar typo in it
> ("device require a parent" -> "device requires a parent").
>=20
> Raise the successful-initialization message from pr_debug to pr_info, as
> this single boot-time printout is useful when dynamic debug is not enable=
d
> at this stage of boot.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2: reworded to explain why %pOF matters (several nodes of one controller
> =C2=A0=C2=A0=C2=A0 share the same bare node name, so only the full path w=
ith the unit
> =C2=A0=C2=A0=C2=A0 address distinguishes them). Also switched from full_n=
ame string to
> =C2=A0=C2=A0=C2=A0 %pOF. No functional change from v1's "use full node na=
me" patch beyond
> =C2=A0=C2=A0=C2=A0 the log level and the grammar fix.
>=20
> =C2=A0drivers/irqchip/irq-al-fic.c | 16 +++++++---------
> =C2=A01 file changed, 7 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 35581332b40e..760bd08dcff4 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c
> @@ -216,8 +216,8 @@ static struct al_fic *al_fic_wire_init(struct device_=
node *node,
> =C2=A0		goto err_free;
> =C2=A0	}
> =C2=A0
> -	pr_debug("%s initialized successfully in Legacy mode (parent-irq=3D%u)\=
n",
> -		 fic->name, parent_irq);
> +	pr_info("%pOF initialized successfully in Legacy mode (parent-irq=3D%u)=
\n",
> +		node, parent_irq);
> =C2=A0
> =C2=A0	return fic;
> =C2=A0
> @@ -235,20 +235,19 @@ static int __init al_fic_init_dt(struct device_node=
 *node,
> =C2=A0	struct al_fic *fic;
> =C2=A0
> =C2=A0	if (!parent) {
> -		pr_err("%s: unsupported - device require a parent\n",
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node->name);
> +		pr_err("%pOF: unsupported - device requires a parent\n", node);
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> =C2=A0	base =3D of_iomap(node, 0);
> =C2=A0	if (!base) {
> -		pr_err("%s: fail to map memory\n", node->name);
> +		pr_err("%pOF: fail to map memory\n", node);
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> =C2=A0	parent_irq =3D irq_of_parse_and_map(node, 0);
> =C2=A0	if (!parent_irq) {
> -		pr_err("%s: fail to map irq\n", node->name);
> +		pr_err("%pOF: fail to map irq\n", node);
> =C2=A0		ret =3D -EINVAL;
> =C2=A0		goto err_unmap;
> =C2=A0	}
> @@ -258,9 +257,8 @@ static int __init al_fic_init_dt(struct device_node *=
node,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node->name,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parent_irq);
> =C2=A0	if (IS_ERR(fic)) {
> -		pr_err("%s: fail to initialize irqchip (%lu)\n",
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node->name,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(fic));
> +		pr_err("%pOF: fail to initialize irqchip (%lu)\n",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node, PTR_ERR(fic));
> =C2=A0		ret =3D PTR_ERR(fic);
> =C2=A0		goto err_irq_dispose;
> =C2=A0	}

Reviewed-by: Radu Rendec <radu@rendec.net>
