Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.86.107.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197572;
	b=X0btXl3MwoAUR2beMMxKrXW1RDa6a1s/ZNK9M4iLKXyq4M4XDDVR6c6a0aylym1vG6Ir
	 a1n1tgksegshwpidDZtmkMfLOzM9WNexd2iqMViQg3DGGkUHI4rRrRbJl3BI4Na+rOON+
	 S+WBDwQRnLJiCR8uiXI7rlTtKc/jaw75B/5gclbzoL3oU3kfxlanOeYsjXaC+R1HmV7z5
	 6hLMY+enQLqo9zPPcrJOo7Vqwndly9o390mx2T53V9GxpJPfeLCTO4y7d+24UZSnNHUdQ
	 TUhAdw0Z1qfUnIV5Xd79VbDrFvmeis14j4V/bbREBxMG/YSn6wb9spLzB9m20dSqzZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197572;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=9ecP5Paab01vW01ah+VFfzbMn0r0qdT/KH2o51GJw1k=;
	b=BW5SVjOHtPLhj0Z0ZtsR3OcXFikfO572Mw0dkVOOtMBzqeSNERCa5BNZskgZ2HoWocDl
	 trD8ogdDwZKQ0BJvt1q1TRQrn/U8gSKBVDttwB/HQ7ZYfCoO7faS9WVXjQ7CXMoyTp+lf
	 0FhoGv2kXAePKbjMakAgygcY1eNZbqK07RI7zgyJcpzgTTQzsgnaNAcyfxGYZ5OSQ3Ze6
	 jwsZrH+lXwtx+s06+8xwAXDV4qLQdEcsrDknRBtjf1qLmiPbxUGmV/oIF5lkU7DGf7eH9
	 4vIQhKB2DQwsDT2fP6r/lL3f083N/TMJAiIPHGBrRXMpKdlHw78ciRfZnGNLa+TfDRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rendec.net;
	spf=pass smtp.mailfrom=rendec.net;
	dkim=pass header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=UuFbsJ8Z;
	arc=none smtp.remote-ip=80.86.107.70
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B21606A31C;
	Mon,  9 Nov 2026 04:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B21606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=UuFbsJ8Z
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id BF3E7D50A9;
	Mon,  9 Nov 2026 06:12:47 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro BF3E7D50A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1794197569;
	bh=9ecP5Paab01vW01ah+VFfzbMn0r0qdT/KH2o51GJw1k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UuFbsJ8Z2ptkqGhhMbpc49fXSCGqFGbJgHw4R5MuoKO0EEUKyKl3WcDuMWU0Ng/KM
	 N3T3IaERNibAsLvRCuz9eYUQm75CTRDbOzkbP7LFhpvhjH0b+a8J0Or3SXy069Mklv
	 8Gi0pYMaaKbqIXJaSeAMY2icehUjfV/vPBqEB0VbMwyRpARiyNiEj6xojVht/OV7a1
	 GF3UhqqjPTrUpivlwNsH0WKq6ShWzWJE2IePEzIOPTefjQuslNLAkSXdbKV3mRGZq2
	 3I8XagQAteEedS25m/jo3Zq5Z/evSm9WbKtjA51Br7S7sC02BfZipKM/HXkZnQA8M3
	 hieybW1c3RxOg==
Message-ID: <321c9fc07d58b2febeba1d6cb80baf85a4c03814.camel@rendec.net>
Subject: Re: [tip: irq/drivers] irqchip/imx-irqsteer: Validate IRQ count
 before creating domain
From: Radu Rendec <radu@rendec.net>
To: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-tip-commits@vger.kernel.org, Fabio Estevam
 <festevam@nabladev.com>,  Zhipeng Wang <zhipeng.wang_1@nxp.com>, Frank Li
 <Frank.Li@nxp.com>, x86@kernel.org, 	linux-kernel@vger.kernel.org
Date: Sun, 08 Nov 2026 23:12:45 -0500
In-Reply-To: <20261109033108.GEavE-fNcWoLB94CXe@fat_crate.local>
References: <20261104073759.386777-3-Zhipeng.wang_1@oss.nxp.com>
	 <179417457995.2093942.6001079047755881830.tip-bot2@tip-bot2>
	 <20261109033108.GEavE-fNcWoLB94CXe@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 2026-11-08 at 19:31 -0800, Borislav Petkov wrote:
> On Sun, Nov 08, 2026 at 09:49:39PM -0000, tip-bot2 for Fabio Estevam wrot=
e:
> > The following commit has been merged into the irq/drivers branch of tip=
:
> >=20
> > Commit-ID:=C2=A0=C2=A0=C2=A0=C2=A0 f99f3c4acaff0df9393c1e6a3f28b7b974e0=
1d95
> > Gitweb:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://git.kernel.or=
g/tip/f99f3c4acaff0df9393c1e6a3f28b7b974e01d95
> > Author:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fabio Estevam <festev=
am@nabladev.com>
> > AuthorDate:=C2=A0=C2=A0=C2=A0 Wed, 04 Nov 2026 16:37:50 +09:00
> > Committer:=C2=A0=C2=A0=C2=A0=C2=A0 Thomas Gleixner <tglx@kernel.org>
> > CommitterDate: Sun, 08 Nov 2026 22:43:43 +01:00
> >=20
> > irqchip/imx-irqsteer: Validate IRQ count before creating domain
> >=20
> > The IRQ count is validated after creating the IRQ domain. If it is
> > invalid, probe returns without removing the domain, leaving its host
> > data pointing at devm-managed memory that is freed on probe failure.
> >=20
> > Validate the count before allocating resources to avoid the leak and
> > dangling pointer.
> >=20
> > Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts=
 support")
> > Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> > Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> > Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Reviewed-by: Radu Rendec <radu@rendec.net>
> > Link: https://patch.msgid.link/20261104073759.386777-3-Zhipeng.wang_1@o=
ss.nxp.com
> > ---
> > =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 7 ++-----
> > =C2=A01 file changed, 2 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-i=
mx-irqsteer.c
> > index 1b8d0c8..766756e 100644
> > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > @@ -218,6 +218,8 @@ static int imx_irqsteer_probe(struct platform_devic=
e *pdev)
> > =C2=A0	 */
> > =C2=A0	data->irq_count =3D DIV_ROUND_UP(irqs_num, 64);
> > =C2=A0	data->reg_num =3D irqs_num / 32;
> > +	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
> > +		return -EINVAL;
> > =C2=A0
> > =C2=A0	if (IS_ENABLED(CONFIG_PM)) {
> > =C2=A0		data->saved_reg =3D devm_kzalloc(&pdev->dev,
> > @@ -246,11 +248,6 @@ static int imx_irqsteer_probe(struct platform_devi=
ce *pdev)
> > =C2=A0	}
> > =C2=A0	irq_domain_set_pm_device(data->domain, &pdev->dev);
> > =C2=A0
> > -	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
> > -		ret =3D -EINVAL;
> > -		goto out;
> > -	}
> > -
> > =C2=A0	for (i =3D 0; i < data->irq_count; i++) {
> > =C2=A0		data->irq[i] =3D irq_of_parse_and_map(np, i);
> > =C2=A0		if (!data->irq[i])
>=20
> I'm guessing it is this one because it removes the "goto out;" around the
> 2xx-ish linenumbers but forgets to remove the out: label itself:
>=20
> drivers/irqchip/irq-imx-irqsteer.c: In function =E2=80=98imx_irqsteer_pro=
be=E2=80=99:
> drivers/irqchip/irq-imx-irqsteer.c:271:1: error: label =E2=80=98out=E2=80=
=99 defined but not used [-Werror=3Dunused-label]
> =C2=A0 271 | out:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~

The culprit seems to be 54ac29cd1111 ("irqchip/imx-irqsteer: Let devres
own the clock"). I think Thomas had reworked the patches (particularly
the controversial part about the pm_runtime and clock control
management) before he applied them to the irq/drivers tip branch.

The commit posted to the mailing list removed the clk_disable_unprepare()
at the end of the function, along with the "out" label. The one in the
tip branch does not remove either. I guess the intention was to keep the
call, but the label slipped through.

> cc1: all warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:290: drivers/irqchip/irq-imx-irqstee=
r.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [scripts/Makefile.build:572: drivers/irqchip] Error 2
> make[3]: *** Waiting for unfinished jobs....
>=20
> An allmodconfig x86_64.
