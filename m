Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB295455176
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844986; cv=none; b=hRVe7dZENw85VvBYXMxoQDe3ydsAYUU1XktTSnfUEDlLrDjReEUZgl5MkX8sCM8n0KwZIOxggej37ceNmsvUZl4Od6l0zusT0jga8BnUZjLuATwL6wb/QTNeTeb5bxevZuH/tCYJh5suh0w76yHLIuY5hWT1G7LbRnRwH5gnykM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844986; c=relaxed/simple;
	bh=IXit39jokJOkDKdV9ozjAq5puFGqOrTpsC39d5ly7YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZO9oKTpHhp7VFpoA14Omfqgp2RiJfKcUk1oTxCW8mT0Rp97mpd5F8hviQoX9mTyhoG1U8j0YPpcOide0eZazM9GnBKztNORJ+/B+hJfa8d84C3pYiInhr5kw7hr+A+Ko+tSmayl2286kLmdouGHQk8/GEoTK0hIurM70OjCnGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndE2+w2+; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndE2+w2+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so77850a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787844984; x=1788449784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=;
        b=ndE2+w2++9Cg8O4juXiYVelRJmQ8+HFiDcLp7iuv2/g7qeuZ7eILSSdAxdPszUz7Ru
         2wdqKVTcdG4fFxooYcxMwvcd48PmQYg9OnSktXlAtGgzXVuWhF7323RDH/BceKPxVGl9
         HZxfOc3C1ZZ584so24PKu3406w1E3Chggu+jPmz8dhJcJqcHPIcCJLC2HWvVoFcbxNq7
         6BcamcvNRXPIyXosEwaDEpEEAfjtdzd2gDDajE53qYvQeB46xQJIPmae0qfhglOxForA
         RZ6ubRz/zBjMWcj8WQKKz2h7UFeLPdh2FPgTU2Aig03NFM8CrzTHhUBSci1vLGA7tU4+
         Rsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844984; x=1788449784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=;
        b=CGgNeRVvTTvK/Z1hpaIvllbsXK3LAi5oDTQER7vVhvNv0rXvAvicVoKLPzgrSJ0aSp
         INtf34dcHObUW3PXxh/pKO0Z0j2ghsl69q9BhpbzXtiI+W26s4Obn6v2EnEY9LiJ3ceu
         yxX/MjOOvSf3ou0KDh9Tpe9U71TIVsX8zhEa3OyDIlIjO7dOJGCIaq1WQ0VJ1SAeKt85
         GSuex7OFxSyTWeU0pDfUwY3ZbR2iQXdZsr/O9/Xh127ds4/Nj4cm9GNgidaJ8yUiRQfO
         tOm+cXe0phin8W6/sviYX1tqmwmPgUA/DfDda4VTSULq36rmdl27S0NMc/FoTAv6A3pz
         5X7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp6mX7odNYuHbFW99ZUhB2vY65hFlVw4Kg5hbHhsEKktt57QzRvPDooFAuTbkOy6qZn49KS3zjhdApYiGA=@vger.kernel.org
X-Gm-Message-State: AFuF++mScxBYU3F5QPYU/PVRfoKVm0q246Ox1XL12zplHQyMVMWok9pB
	+j70GLrbmqaisbhwkT710D/BhB5j1epDhqbeZ2px6mOcBV34TPwK/t3xC1gNhBg+Bqs=
X-Gm-Gg: AR+sD11V2UUeapwLFisD3NSvgC2hKSV67D3Dj6Kw9wYVO7b0coaKK9gVXpK3LFMQYwr
	TEwIlSJ53gBKUtP4mv4j9aXTV0iL2lJj20sqlM5lgCla3pttSUImjSy1HhFIVBfrYNxV7NpIl/8
	EzJ1PD6ugvhMM1m0M/w+EFGaYsMLlJId2GLIN8Kaoc6KDsiu9jdfT1P2MLR8gmUFCUSEfupl8Bd
	h8jBRvvG2rruaFUX3eYJkXA1Mdz9PqtQ6LYMdHggZ86Lk+6kYouCaDTGsmVNp+NpDvS26BAyCJa
	jwc+0iB4SIHRCg0RF73ZtO2wRaFwL5iLnXbJOS8B/Nr2d728VHABffJwZWBUTuXGADGjJ+/p8My
	dXJaE2E6EwbXDNgzVCZ6KiuMyOs3MSeqDT1TgkgjBdrIxMdAvK8JHM/r1i6hjZ4SkhjXfGn5NXT
	dgNNWdzxS4spIcYLlnPpe0GW3BaQqR12c1Wazu6+FQ+wmBzGg64Xp6X7e5WeZNzYbX
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr169425a91.4.1787844984074;
        Thu, 27 Aug 2026 08:36:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:887f:45b3:fb30:8d79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm3187307a91.8.2026.08.27.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:36:23 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:36:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <apBZdNozfoCUp515@p14s>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
 <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>

On Wed, Aug 26, 2026 at 06:36:54PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> 
> NXP Public
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Monday, August 24, 2026 9:39 AM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
> > subnode support
> > > +          gpio@1 {
> > > +            compatible = "rpmsg-gpio";
> > > +            reg = <1>;
> > > +            gpio-controller;
> > > +            #gpio-cells = <2>;
> > > +            #interrupt-cells = <2>;
> > > +            interrupt-controller;
> > > +          };
> > > +        };
> >
> > As I (and Arnaud) have stated before, I don't think this is the best way to lay out
> > bindings for rpmsg-gpio nodes.  I am currently thinking about a representation
> > that aligns better with other virtio devices.
> >
> 
> Hi Mathieu,
> 
> Would you prefer that I wait until you finalize the layout before submitting the next version?
>

Let's wait until the DT format if is finalised.
 
> Shenwei
> 
> > > +      };
> > >      };
> > >  ...
> > > --
> > > 2.43.0
> > >
