Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99804A99CC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150289; cv=none; b=dKOZE193BSUyz7YjBBymhfG8XNyvNPGaKdwPMI+FGcfHMfr+jdJE4oWGislsgQD4PozukEs/CDpYzMcWIQNzvsr1QpOdd+4eEfnmjKIalWSd7Ry5PvpwaMFdxA+sDZXQLUhb8iF7rwaliFsMDfT1In4rdTJB4j2AhKr3vvLvulE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150289; c=relaxed/simple;
	bh=HCQbWa7LkKEX50QT3DwF/c7T/iKLPW1K21LgtlRNWgc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/mQz6ixKK5yc2QgtAEpUWODh0vAAVHSlDRxD8L1y9v0YllLyHigJU5sdz4H41CiYd2wJj/1DqowXJUIPYQ8afZ/Y239ElLET6yuZm8+JvPU4K/9aCnEvOwNWoQNpBrSHOrSGAjNB7fG1nGt3WL8f94/xvrL1CDRp64pxbQW9Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lt9SXcB9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lt9SXcB9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b94fce6e8so1475225e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150277; x=1789755077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1iFhVzmJnHThQ931GRzwOosH5WkLdTobwxrbVY8PCx4=;
        b=Lt9SXcB9iYPCtFYeg07KKMQR+9/oRFQx9ogHUpekAL0nOWo7W38FJq/xgLqEju6dSc
         PbJns6rsmbTsq+wUdA/p1UhgN3Klg87jLWlYxT8PhqIChgol7v/6Y6+ke+FxupoBe7IZ
         7xfncVhWdYUW4GqRK+9YhsxJc3+mWOZSMHLRTNYnH1Wp80t7/k/eBtroj/d2IXZGxiCZ
         c9Ajt5IMnrunDApTPuwOA1HcVIhjlTNUftO4n0Hg8ALcETsxecdskKi1VcGd3SGlmJC5
         hKHO7CbCaG+9qNOfRb3v4/PjXg6gtfZdKxEfrIVJh0de4Gb4sLTDznnae6OrIT4yn756
         kPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150277; x=1789755077;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1iFhVzmJnHThQ931GRzwOosH5WkLdTobwxrbVY8PCx4=;
        b=F6PK+23OaQjItA8EPe63YaxNiqJ6e8FLW2TU0g9uyREjnYE+iL7+jV5IDfXaF/HKX5
         rtmiLjQu3HGJKRaAHPPFXFpTynOq+dsDz48Sq/jPwDDIuaGOdrFbVlhaa2dtSryY8qmj
         Dlf7h7qBt4MipWl/+Y4uODXakn8y4PdamvEKyt9QnA7hxNAX7sOfzJOIcxLoKQHw3wdx
         FGLzphyg0octNwLcPiQQcniqH62ZCLyHsecz9H/SxBFYjZd9hxjvPKJMRbzI6jWF1sDR
         kIrrczMKx6+8ep9tvEJyP+FrnM6rj/Rg9I0Y9CGx5Q60/MZwgb7J4wAsZB6WpbsukqL5
         O6vw==
X-Forwarded-Encrypted: i=1; AKwUvBxYiRyW70TsQCasOqTaBN7zAXGgTK8Snr+At1w3UKJYDnWBi6vNwq9OAdrdEJ8wDgUH5hH68FR3NkLvUnY=@vger.kernel.org
X-Gm-Message-State: AFuF++kMVcpBrEoEr0RjO5ctYPOpFh66v4i0ffHYg0/bNvbtM8u+/WA1
	a3bdRTCkWn4OoeWpWkBZNrvNry5XAZHFbRbWqXp8ciY+DHdDA9swsfUM
X-Gm-Gg: AYBFou1PByJ6pEESa+ko1vfYaEcutMt1DW1aP5O8+91R71rGog4rDN/YhgfL7z6+P5U
	cCz2yh0qhmAx3GvoLCU4sdXzyBV0+XvFfVRsVix7JerjqfwBj2vhsiaT+CalRw25vPTstLxLt7R
	quzdmBKNa5rcJqSHtpvNARUBb2pOoBUi5BTmbePD7pfCaFDOeNTz0UTNeMPfsF5j1H6autcZq27
	796S11Ewx1vjsl7naxipt2u0crB/CLYAml0o1Vtqf/k/BScwEFyetdx8JjHpHLV7nGrNT+hQiFt
	6HBBNMoo4h57po4zEZG5WHcO8MN+6PsprP1BsF7RmDF1YUs9e1esz463W5rkyySI1OH/oxC/DEq
	dkodeVmCHqTfPyaqsrN5WFZfOb82gdgNFdmjyqYgd6vDr7Pp7599eGH9WFVT5+f7AL3ML9//lT4
	KYINierqsCUkjZP9Gdl/cayTJN0CNSURGmfLEPcIcPPiNrKfEQbhaLSqepDBVUGOkMTnjpRgaD/
	FOmhymtKA==
X-Received: by 2002:a05:600c:3b02:b0:49c:e3ad:41d3 with SMTP id 5b1f17b1804b1-49e61649b8dmr68492305e9.0.1789150276731;
        Fri, 11 Sep 2026 11:11:16 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm134624405e9.14.2026.09.11.11.11.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 11 Sep 2026 11:11:16 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:11:13 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 parth.pancholi@toradex.com, francesco.dolcini@toradex.com
Subject: Re: [PATCH 3/3] usb: xhci-pci: Put PWRON_POLARITY on a defined
 state
Message-ID: <20260911201113.42cce0a6.michal.pecio@gmail.com>
In-Reply-To: <CAOMZO5DfPToSOqi4CW8ETAVkU0RXTr=eyyOqLwkFC8CjhKkoeA@mail.gmail.com>
References: <20260909125842.528340-1-festevam@gmail.com>
	<20260909125842.528340-3-festevam@gmail.com>
	<20260909164339.7252469b.michal.pecio@gmail.com>
	<CAOMZO5DfPToSOqi4CW8ETAVkU0RXTr=eyyOqLwkFC8CjhKkoeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Sep 2026 10:58:27 -0300, Fabio Estevam wrote:
> Hi Michal,
>=20
> On Wed, Sep 9, 2026 at 11:43=E2=80=AFAM Michal Pecio <michal.pecio@gmail.=
com> wrote:
> >
> > On Wed,  9 Sep 2026 09:58:42 -0300, Fabio Estevam wrote: =20
> > > Currently, TUSB73X0_PWRON_POLARITY is set when the
> > > "ti,pwron-active-high" is present.
> > >
> > > However, when "ti,pwron-active-high" is absent, its status could
> > > have been set previously by a bootloader or by a previous running
> > > kernel. =20
> >
> > or by EEPROM.
> >
> > Do they bother to put the chip in a wrong, non-default state at
> > boot? =20
>=20
> I was working on a hardware bring-up with the TUSB7320, and I never
> saw it happen.

That could practically only happen due to a bug. Seems more likely
that EEPROM or boot FW may set the bit because it's required by the
board and then the kernel could clear it for lack of knowledge.

If there is ever a need to support clearing the bit, it would better
be done by checking if the DT property is specified at all, and only
then tweaking the bit accordingly. Otherwise, leave it alone.

Regards,
Michal
