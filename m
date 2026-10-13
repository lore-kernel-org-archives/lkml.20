Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073BC4F4728
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892838; cv=pass; b=mJtG1KhJSFLIcok/WFm7gwaR5Geb1FB0eebwutbdVCi+F+a/kzoQeU3Lw4bc/hnKcpTb2OMGTaJyQjkoZi3tVJuSwNt2LmWmi59NnmODNxQsZX6j5FbBKEDZ/CQ1r1PRwRXFuFRHpYcHgSg2amaAhQeSEP1hxuBS8omfWnt642w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892838; c=relaxed/simple;
	bh=3MZ0rBUQQ/DT6hYuG6QZ4NQ/FBC1DV7mDn+OHinCE3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNTkibbg4WOSKg9O74weyEHWh896d5gt0By9ZkiEp9UPx2GH6GWVev5z8u9yKRnL15/qc6bJiSkGb4UrqI/HBawOKTiBnvCVIF1RwwVcgJ2eKZY+64MG4eEeKaOncxP3oH0cB2oPA6dApHCCJzlJWASqzcy7wydgGMskTkQXA34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=IaZLwu7R; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="IaZLwu7R"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6790844c9b0so2040229d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791892836; cv=none;
        d=google.com; s=arc-20260327;
        b=N5D75SnoegqUaMn8Hcjst7XIth1THNFFkh8QzNc/Pn/ZsxoIDMzcEYreZgYmFUFXvI
         x8Q5iMTm+Yp0fe1n7M/wqkmIlRXP3UotEJsI1ELJs4SG/RuXcC4QZcoPKBCErLaATO5x
         VMXGAmFT6U+gWwCUG3eVqUwYQzeT5cx5f4/BXsQPLJ1ETi0tQlHobbEbEdDWbmFkdBld
         VD0/LVMjSV96mpnF8fzqraIYtzBZtw28zpziY3vBjbuq0pJ4fgXRkBJDDi3H/Z0l5NUw
         wOrcHp79PIMc+GVRZVSxMUZMgyLX7OqSovGSii66CLILxrONHVEpAGeVMSqIp5hlwuhG
         ieZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=;
        fh=Uj4D+nKd0G27b2qTX+0BIfiy6VZJCwcS9vDt7umAx2o=;
        b=VlkVoS9vyTKgikJM6nfJbpnkjMPhxb8FXo8/h8w3uLBzuAMGWSqcDd8MCLZTADA4le
         OHqHvvPhweS3sUsy/abh0NkYE7g58TAmiA3uTJplmy7kvv//GQAtIlQUpZR+8eO0wRYM
         VjGqo4vN6xxqkhEHihPogldEEairePmFHvu/DtoPrEWmcabz1VzBV0nvMcg2RbHTLSry
         xfWSTiFUD2FDlN7W3qG9liHHF5jUsEgJiOXu2aSywa1C81MqBR+v2dQo/V78ZTqP0j05
         znbPk/T0Uxbs04DaKDwwgBzlPGhC3Q2cisJIW4t8Lb0q133X8RazPIr38DQI2P8BRUf3
         3GlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1791892836; x=1792497636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=;
        b=IaZLwu7R8ZTUVshbS8jWl4wLf/889Kp5dpZ8mC+Vjb8PzD/OJVDP4TPwDs/X7SxWj6
         QTuLu1+L4G4eV6GTQGNpcU1q3yf0mjQnDgFTrWN0FPp3JZVm1TBB4pZ4c+mB1xou3nL+
         C/Q2w30XPDuy7tpYbSQtkjvWG57ST04mbDhh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892836; x=1792497636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=;
        b=tio/PXeMZ2gnsKx59iK951qhh/MZsrAK61ye0VYMWE1Oi/+7SjGXQER//uZiQq2Tm5
         xhBrdDNyzsd1PrWsYo7moJJAI0m1jbaTgmsUlLDUYc/CwjBeynN6J4wElZOITr4m3Sm5
         4WDFMFCtq8vHCZShD8N0A+E+Yypdbcch0SQm1NgY+RQ619lEAbSZaMKj/CSOCQPsJF/U
         NJwJEmWMi5RAVaoytQnm6xi7FhPHerLmzFVEW/CvhV8yaezNHlVlU/6hLXKXavx2Iqfh
         5Lh3HYxMam+A9Zz/GVtshcvBJk73O79eNV7HmqmH3XrWn7tZZb3EFoVN/c2/nErtRlAp
         Io5A==
X-Gm-Message-State: AFq9FYJOoD1YJa5MYp3QRLPXVl4DPB5oYXupMgoH5sJ3fPwo8/1+SD/D
	A4TrBzmSvaXBbP30v54cCpLnCalWD/MxeF2EAcadqt0AwdGjrUUxosYkWTYiqcyWsu2XxZ5fWsu
	4wF1Wk9jTtnx9oq0vYGyiGPWU8XhM3rr7F4ncEvZ22w==
X-Gm-Gg: AYBFou2EBiwgvzd4alwhfILCAVX31eE8LRWhncjjOfkeCsIIwNGNeTmMBovFCNO58lF
	TMhQHDUgScy1rUdr8E/xx+OnPRj5wNfpKGgMlJJ8QS9SejUJbbSGPJr+QBxZZUPzCecSQrIy5i8
	4vS4jg2xWyjDD1MFeII5OAXUtR8kWRANu2SSllegjFYKO1Qdh67Ob+sAZgBmlZqrfrXUoP3mYLC
	44tjnS4/TO4N/E0Ek1Wm1MiSXHCOQHOtMDA+4Osu5EQs61fKsXenuUc++kZSNI6iSawsX11Fh1M
	gk/ff9KD0xsrIMb0jL+XAvDnd5iy1Gh8Y/0KTrEgjFA1hNy2+OHLZovKxJkN8SpglPDUZLwMFIc
	gum08BZEzH9cqpMQr86ThtV5L/naqHnAimRKrTEixyppI
X-Received: by 2002:a05:690e:418b:b0:677:d67d:39e3 with SMTP id
 956f58d0204a3-67936767e9cmr4005406d50.2.1791892835727; Tue, 13 Oct 2026
 05:00:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <179070048452.199845.10870046832708018931.b4-ty@b4> <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
 <ar2q8M7Sn9DccVBI@redhat.com>
In-Reply-To: <ar2q8M7Sn9DccVBI@redhat.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 13 Oct 2026 14:00:24 +0200
X-Gm-Features: AclHuK8xxG5WHCzDqDFRzliodJK57Ya-SC3DZoZtYPsOSf_tESDvqgcH-jYqUEQ
Message-ID: <CABGWkvpjZsDR=tOEeNfEGY3TWC0U3o=ZZE4BEWCx8DF7uBmt+g@mail.gmail.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
To: Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Brian Masney <bmasney+clk@redhat.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Brian Masney <bmasney@redhat.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebin Francis <sebin.francis@ti.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sudeep, Abel,

On Thu, Oct 1, 2026 at 2:36=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> + Sudeep
>
> Hi Dario,
>
> On Wed, Sep 30, 2026 at 11:01:28AM +0200, Dario Binacchi wrote:
> > On Tue, Sep 29, 2026 at 6:48=E2=80=AFPM Brian Masney <bmasney@redhat.co=
m> wrote:
> > >
> > >
> > > On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> > > > Support spread spectrum clocking for i.MX8M PLLs
> > > >
> > > > The series adds support for spread spectrum clocking for i.MX8M{M,N=
,P}
> > > > PLLs (audio, video and DRAM). It has been tested for the video PLL =
on
> > > > boards using i.MX8MN and i.MX8MP.
> > > >
> > > > While at it, it validates the spread spectrum configuration in the =
clk
> > > > core before it reaches the providers, and fixes the i.MX SCMI OEM
> > > > extension, which converted the spread to the wrong unit.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [2/4] clk: validate spread spectrum configuration
> > >       commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88
> >
> > Thanks for picking up patch 2/4.
> >
> > I put the two fixes at the head of the series expecting them to go in t=
ogether.
> > Am I missing something for 1/4?
> >
> > And how should 3/4 and 4/4 be handled?
>
> I can pick up the other SCMI patches, however I am waiting for a
> Reviewed-by or an Acked-by from Sudeep for the SCMI changes in patches 1
> and 3. It looks like Sudeep wasn't CCed on the original series so I added
> him.
>
> Abel is the maintainer for imx in patch 4. I can take this as well,
> however I'd need an Acked by from Abel.

Just a gentle ping. Any chance to get your acks on 1/4 and 3/4
(Sudeep) and 4/4 (Abel)?

Thanks and regards,

Dario
>
> Brian
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
