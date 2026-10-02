Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC16F488223;
	Fri,  2 Oct 2026 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940326; cv=none; b=Hj/1Isi8WmEo8jcysT9WRpS2AHeiSA4UQxHN9DOe9lL/m/xSq/gfFIDzs0tVBeuIDT277voD+Bq8iG/D0LgKRKdrFmIT2Cxso+/To5IkG9U66crzRI7gZTxDhrqU0rZ3YryuTQDvCy7U82MldPxDkhASpP7a5OgtnRDKGrVfWG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940326; c=relaxed/simple;
	bh=rXKDfpXJyNTb6XomWcRa/rYsUpu8ud1luicyyI8Ujds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRPo2lWCPq4vPg5zYP/iCD2DrgSr7d3LDgHt3ze1X2TMRq88N9r2IJqvqsZ9M57nOZRppFXii4z0Y93sWgL7YnFIJZpKjLM54XG+OwaKYtyiimeFkbK6mmO3RuWxCTV9MlYZkYKcHYj/9R+mihC+DtnF7jTuXMXUVAeQlOPrYsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fm32CMEq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fm32CMEq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AF51F000FF;
	Fri,  2 Oct 2026 11:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790940325;
	bh=VDnaG8ES1kgEtz+L3OdHjOgrH6Sl7lj4ASDqs5ASdL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fm32CMEq6YjufXbEd1WTX0th7pgJGNVwhI683WdbZqydnB59XCI2FvSpWMusALNvy
	 DB3v90xse6AJBlSJ+KCiRmDxcbfC15VrKeLhNppilRFoCxtQtd5PcyLEuuTjeZTmVu
	 HAZH5tuythh7b8gNnboEybnT/ELOVB5mYlvX9bZDutwHmZJ7nd4jXEXZzL0xRn9NxL
	 pY7b/D5LMPGmfp9b0U4rfBmsqDnVyRMS8uXoZR1Uux5gSONzy9M1w8ogt2ZWOj8TAh
	 RIksj+Ro0vSlEgOKSNObb98eV6WPV5qGfyGx0RSOPJfLKAxqtX1sJyDXwJFdLY6kWB
	 aG2xAh4/AH9KQ==
Date: Fri, 2 Oct 2026 11:25:21 +0000
From: Yixun Lan <dlan@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH v3 5/6] irqchip/aclint-sswi: Add support for SpacemiT K3
Message-ID: <20261002112521-GKA60800@kernel.org>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-5-cf4fd4050e14@pigmoral.tech>
 <20260919000611-GKF297024@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260919000611-GKF297024@kernel.org>

Hi Thomas Gleixner, Radu Rendec

On 00:06 Sat 19 Sep     , Yixun Lan wrote:
> Hi Thomas Gleixner, Radu Rendec
> 
> On 00:29 Fri 18 Sep     , Junhui Liu wrote:
> > Add a match entry for the spacemit,k3-aclint-sswi compatible. The K3
> > SSWI device requires no special handling and can use the existing
> > generic ACLINT SSWI initialization function.
> > 
> > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> > ---
> >  drivers/irqchip/irq-aclint-sswi.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> Ping irqchip subsystem maintainer, how do you expect to handle this patch?
> There are some dependencies between dt-binding, the driver and DTS file..
> 
> Would it be ok if I take it together via SpacemiT SoC tree? and probably with
> your Acked-by? Thanks
> 

Just FYI, I've queued this patch at spacemit soc tree for v7.4 merge
window, but let me know if there is problem, thanks

https://lore.kernel.org/spacemit/179093990819.1237110.17149048431287759426.b4-ty@b4/

> > diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
> > index ca06efd86fa1..d3ef2cd3b5c5 100644
> > --- a/drivers/irqchip/irq-aclint-sswi.c
> > +++ b/drivers/irqchip/irq-aclint-sswi.c
> > @@ -179,6 +179,7 @@ static int __init generic_aclint_sswi_early_probe(struct device_node *node,
> >  }
> >  IRQCHIP_DECLARE(mips_p8700_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
> >  IRQCHIP_DECLARE(nuclei_ux900_sswi, "nuclei,ux900-aclint-sswi", generic_aclint_sswi_early_probe);
> > +IRQCHIP_DECLARE(spacemit_k3_sswi, "spacemit,k3-aclint-sswi", generic_aclint_sswi_early_probe);
> >  
> >  /* THEAD variant */
> >  #define THEAD_C9XX_CSR_SXSTATUS			0x5c0
> > 

-- 
Yixun Lan (dlan)
