Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74E738D69D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973115; cv=none; b=UFSUW4xn4ybJaDtASRyQcRochj1JBFp496ds2j8CrMfVdyNiJIAfGdyjOg/MvJq7ACvYQYyZx9s6Y3XjlPYoDCcQGDruZ95FoDb/dP0M33gUrVVYVCSn5Oa3j84Bp9uZlKsaxARXN/Hn7ilg55Npb9Caw2fXTieMfbCoHA8OzWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973115; c=relaxed/simple;
	bh=knyO52Lg2mkf61gMd2g9nUDJTALyxRkL7qDHPDQyWG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ1ASyYd3UoXtsI6fjYVuIcV1Y8YLyQP5QCe5ZII9Evp/qcv1gD7xdr6FK/JGeXkcnc26jfkSo0J78GE2lL9kNdrrm8r7C7CNLGAsVpJvsu4Y95fEVj4hlCVWI9ZzWe/OkozdduEirrCPHU7etqb054XwZ+AL29EqkJDagm90OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OTli+3lL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OTli+3lL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so17362705e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789973111; x=1790577911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vo43nW1+HDRpeCs9SBZj5gQKg1OMqxEnbDgZqJ2fh30=;
        b=OTli+3lL7V9q9xzxyBQPStJHzPpEV/Xm2JyQ17yht17WKHZhILOzTV02B1wJk8C31n
         qMvIQOl4hDNUOaQSfNeOpzh+r/6kSJnzlPU6qeNEbpPVeMml/ZVlOpVqP6HDQzIdub5q
         C+FduW5hWnPhDUdlNQT4a7gBkw02g9mTwCd/C6LuVEHWUJLZjuk0Z/iku1PK5nSbM3ew
         GXHfPN4URrqWgvSJe1LePI9g9BE3pRYA1mBmeabNqWAW437wJq9jDbNtF+Bj5OeJc9yv
         AD2VwPO96Kn33iLKjJIrwLrW3QCSOq1hiN63DXtdTf4AL0uLo6sMZVZI4BP/+mJnJ7dp
         6KOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973111; x=1790577911;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vo43nW1+HDRpeCs9SBZj5gQKg1OMqxEnbDgZqJ2fh30=;
        b=snmPMGnlvag50FsUbR6BsAXjp/0P6MbHqRM3UNYd49MZQaKtqlwg3yv9fglKJ2LieJ
         4ncVs09iogMDMA+kuzfAbTe0WDVcO230feT3iY3hnxWhytO/eTmmYG38qkJxrSydRqVo
         c/3IKIHajCT1VzEWfGNw15MQPNtwUEDZ0PWcvJqMVgsqPIH1Bkvfp11miAzQhALZH4gF
         xhDq9x7XxTNqVYZdY7wiGWBNghisTkm9XhUlJ5dX7j5r9xnCZ+n6DsIG1zDIwKZBU06w
         Uoqox9wdUeSlixGm9PbC1KK/qbf5XEcRHxNk1N/iOgZFOO7G2BeXBcObF696Axc/FRwp
         aXzw==
X-Forwarded-Encrypted: i=1; AKwUvBx920L2n7rt0K8rqOMk9hw201qmzJ6VqPkyXxWQm8ax+zgmD6Enb3skcrzchrwtp6A/Qo7VIck9k5M/tts=@vger.kernel.org
X-Gm-Message-State: AFuF++mDp64tCIFiZGzZ1kOmQ1S2yPdMiGd/zwxhcCwHGCoTlgM11PSJ
	QVu38MGu3wfcx5uSvNrBVWu1DVVckVRtY43v13AF4hz2UpxU9aJ/PMsKELfoENw09ja893WAqu+
	4Mscl
X-Gm-Gg: AYBFou3wXzOo7Sxflem7QyoM6bqSoe12u4KrEvY/nncU+z5urZwPYKd2GocQ9mIGMOj
	oF3PlT0AOtXTR72m9pZ1Nxy+CPtAGatS+AmOqVhJTuYF1px1oKC237v75DE+DSGUzFS5fjhyFZ3
	254/xbH9YJ+G9PPDsCiUYNDftS00CXpwrfOSfMvVl4CGJtf/QEkLjRcj1+wZY67HOtmC7M1avnY
	qtuwzc6oaDZ0j//7duPCl5w/PXwDArekpMjWo0fg/q2UQlSh1l+JAOjbf2tyPz8mo48ObbFZ0/2
	1OzHBHvbDkuA9+0NrFtCCqoCKehvOibPoZcx8U7+zAvuXV+Z/IRV/DFYg/0FqEyhqm9dg6qe7J/
	NZDDprResVK8lAiBnui/1+samWNCqNgaJueaooytj9wlGFVZDaYhwujGzfTkbgn3xrGfasBFgka
	Ae3B+2SDrOoIGL4VF/GIBADp1LRc/kewEYjiw8GB3e3+pQ6oRenuL7MpMPy2uR/ggxpXgO8qnir
	4Q3B6JcV0rFVipv1ZKO/GSWce6FCRMq9NtVTTXlUK4A/Xtfeqwk1A6vJtcmzQbKe+6kVhje
X-Received: by 2002:a05:600c:468c:b0:49f:c331:39e4 with SMTP id 5b1f17b1804b1-49fc5671095mr142921905e9.7.1789973110468;
        Sun, 20 Sep 2026 23:45:10 -0700 (PDT)
Received: from localhost (p200300f65f19a904d3adedb459c24bc5.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d3ad:edb4:59c2:4bc5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fcd07cca6sm205073975e9.11.2026.09.20.23.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:45:09 -0700 (PDT)
Date: Mon, 21 Sep 2026 08:45:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Guo Ren <guoren@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, tglx@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, pjw@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, daniel.lezcano@kernel.org, anup@brainfault.org, 
	hui.wang@canonical.com, samuel.holland@sifive.com
Subject: Re: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
Message-ID: <arDSR9S3tZPB91Zm@monoceros>
References: <20260816070049.2097442-1-guoren@kernel.org>
 <20260816070049.2097442-2-guoren@kernel.org>
 <20260908222349.GA2324870@ax162>
 <CAJF2gTRYaiskhtZckt9ccRqv7an+OBKE34N=0uR3uKW9F8r6kA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uz72xaap5da5s4zq"
Content-Disposition: inline
In-Reply-To: <CAJF2gTRYaiskhtZckt9ccRqv7an+OBKE34N=0uR3uKW9F8r6kA@mail.gmail.com>


--uz72xaap5da5s4zq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
MIME-Version: 1.0

On Fri, Sep 11, 2026 at 09:17:11AM +0800, Guo Ren wrote:
> On Wed, Sep 9, 2026 at 6:23=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
> >
> > On Sun, Aug 16, 2026 at 07:00:45AM +0000, Guo Ren wrote:
> > > From: "GUO Ren (XuanTie)" <guoren@kernel.org>
> > >
> > > The IPI message type enumeration (and therefore IPI_MAX) is currently
> > > private to arch/riscv/kernel/smp.c.  Several IPI providers need to kn=
ow
> > > the exact number of IPIs that the architecture requires, so move the
> > > enum into the public header.
> > >
> > > This is a pure code movement with no functional change.
> >
> > Other than a build breakage with allmodconfig :) -next has this change
> > as commit 1ae91dc397eb ("riscv: smp: Move enum ipi_message_type to
> > asm/smp.h"), where it breaks allmodconfig with several errors along the
> > lines of:
> >
> >   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_m2m=
=2Ec:20:
> >   drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:9: error: redeclarat=
ion of enumerator 'IPI_MAX'
> >      63 |         IPI_MAX,
> >         |         ^~~~~~~
> >   In file included from include/linux/smp.h:119,
> >                    from include/linux/interrupt_rc.h:17,
> >                    from include/linux/spinlock.h:60,
> >                    from include/linux/sched.h:38,
> >                    from include/linux/ratelimit.h:6,
> >                    from include/linux/dev_printk.h:16,
> >                    from include/linux/device.h:15,
> >                    from drivers/media/platform/mediatek/mdp/mtk_mdp_m2m=
=2Ec:8:
> >   arch/riscv/include/asm/smp.h:27:9: note: previous definition of 'IPI_=
MAX' with type 'enum ipi_message_type'
> >      27 |         IPI_MAX
> >         |         ^~~~~~~
> >
> > So one of these needs to change.
>=20
> I prefer to keep IPI_MAX for SMP and rename IPI_MAX in mtk_vpu.h to
> VPU_IPI_MAX, consistent with SCP_IPI_MAX in mtk_scp.h.

That's why using driver specific prefixes are great. Why not
MTK_VPU_IPI_MAX or something along these lines?

Best regards
Uwe

--uz72xaap5da5s4zq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqw0nIACgkQj4D7WH0S
/k7VDggAtMWaEROo9vpYmrGX8ewSro8MIJ04DBeq4qKdJ6ui/DxZ3i54EdW5HjOL
FlXUoSIuzrBY+AMFup3z+q7SgSOaqvB9VhrtY3eXO844a6rt58XBxgSCMGcnvK3l
16EVRxauXer25fmozFfpJwrKTtlFoLiXYftiXgZDFkCsT6anBxhLKu9wEe2PHls0
/zA0cxdCo4kBPPmkeq0C5HH93QX20hBg29dgUYDhE1Beqten0oV0UTJ1f1tBc6XA
ulko1Z/oYE4KDRvHWQZpYRAXTcqfBEbn0Rqaem8X1IBQC3DtFiB7hkHAIJuCB/vH
EBoqrf8X7voMkW97VOkmxr+IY3/KnQ==
=TG+g
-----END PGP SIGNATURE-----

--uz72xaap5da5s4zq--
