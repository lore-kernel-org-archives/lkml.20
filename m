Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F982515982
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166466; cv=none; b=SEaRoezo1erF1zCfLGtqwqPm6m8CBi3Xt1AbvAM6vh+3vD5GtcjtaGYcY1rsbPkQVH+WejlEP0wgy0h27TxqHr+Vd5BCDZ9i4T2s56bct79EDXFF5BSdQmZWkM4QdMQYPPQnJEj9h/CO2MzvWnhteJFQtpIcBHvPMRVpQqfevzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166466; c=relaxed/simple;
	bh=iB1X6yc9MU3O6Kpid7OWc6ghPs6cxaK0vVaYt7GQq78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+AYnEkAPnL5rJXvFabS5JDjE7nM+ekuNdeuzTQTJFoHIdlUPE0ct+i4bvd8BENRm6RzUChh34u8zOIqpm6tJ2ahpTaJbsF6nEh+/K9RD24TfUK+Ms+wRX30EoB1Gg2kkaYhlulh3MfLTvX67vow48aEDGn01GupnzfoBsAAmjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c83be8db39so560562e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166464; x=1790771264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IWcv1ApL6q2ZhyUuH+tMQlo7vXHYJanHFmdCnLCsLWk=;
        b=GcPRKB6M53ds7dB0TWXigpH2bdspsgEKXwBTlYrERDipERk1Whp1+vVge6NnN2vCTY
         jdQieJAM/tcLhYmcnyDHqaNgZFjUt/0u2/WQ+k22I6g9pfT3yZCygWtcQDfOXom36dAe
         yzdyE+sJYkWuQdJlTAd+U9fHNNV9TtqJdhoupvsGUsyzP1cn323yuLh+KeaV+0BP1sAj
         VbJMMURO1J+8aUaUZpMpOZmLUFV8Pr7A0yIBZfLJSG7ohMsGdaY+AygXP8btUAadYwJQ
         7Ydg7Gho4x0RrtPE71ajbK1qk8k4TcWoaR+AwCDgIR18pXCEM/3jBZvfPzt+AIBLUMRP
         qvSg==
X-Forwarded-Encrypted: i=1; AKwUvBy1aRhzRUP3chUyUY5ktvnL4nrDz4hNsfEzEO4XEBDdPtHpZGASIhOPITg3nUuPQP4+gMsN0O7SrCorRko=@vger.kernel.org
X-Gm-Message-State: AFuF++mGWe98gwOndmUYzgtDABYRVQveURypos+jdc2JgZVBUwRU8jDb
	TzGo22Ymq41Xzkl2LBDini8ZK8pIi70VBRMlpAapcIWzPiBGzk2tNbhRPhvG+mLZRb8=
X-Gm-Gg: AYBFou3rZsUHNZz3Y/J7WfMOv0/SeCXLl5SuQHtZHxHgbl3sINIPEPQsgu/Y8SG6llY
	fan2+NOk1TAdjiPrBd8OSBGg8oP5JqiDYdkGH/Z5Mt2G84pbWRtsgC4Tccu2SwolScKC2xgrSww
	7wEo2VlAYPtkgmSy/F8Vkk28uCehZzy4bl3iKEaYdrxD/81WRyJWgg0bHNkI0Vt5ieje/qLfIZN
	sxBMp/EUzIp+75V85f0Q8W/I3smww0RDnt674d6wBu9aQUDgJ3aoaZcphP5e61PsrQ/Lbt0ALfp
	GDC4MkgLdhw/DSLZuW7PVEULmaYuUwE6AUzV1M3gm+HzAhUQjZ2oKBLOGwofsQBomJ+rZsgjGIt
	TsWWE/MDobAqlDUJJmPm4MraGfxfcMZHQouvNycD2eiOKzkcVNcxqsEX6CRSQTUsb+3toal1q6T
	YPmva1nzxcqlDC83NS2Szw2kBZFTxhscAnCpJWtMPZWMecH9rilXpRiE45G9T8bHQ3+1G+YRN/M
	N235wWfe3i6JfKKpqjfHOIHp/++V+RoE5bodQ==
X-Received: by 2002:a05:6122:1815:b0:5c9:a60c:273b with SMTP id 71dfb90a1353d-5c9f16926b8mr2746441e0c.19.1790166464389;
        Wed, 23 Sep 2026 05:27:44 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04f02bfsm2814556e0c.7.2026.09.23.05.27.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:27:43 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7d4so493775241.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:27:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrrrNiuFVfKUR4C7LZ2xbbhqDtdiV+8SVPrNSq/lXrzHJMbmz++cC0gn/hlbRaX+RmRyypjxvjV3sz7us=@vger.kernel.org
X-Received: by 2002:a05:6102:162b:b0:7a1:f7d2:e81e with SMTP id
 ada2fe7eead31-7ac1d2e81fcmr2402107137.23.1790166463439; Wed, 23 Sep 2026
 05:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
 <20260921134432.50338-4-ayman.chaudhry.kc@renesas.com> <CAMuHMdVkh_qpJKqD7N=njG+35gS+rE7cFfWQ-kS3aRoTByxH_Q@mail.gmail.com>
 <CAMuHMdXmJWu5DD5sQ0epWX8FnWc7zt0CTvJ5_jpjj-Hnvgg_cw@mail.gmail.com> <CAPx+jO99DnXLzarD_rWgr43e6vzWCJjYWaVFh_hhr6rtivXxFg@mail.gmail.com>
In-Reply-To: <CAPx+jO99DnXLzarD_rWgr43e6vzWCJjYWaVFh_hhr6rtivXxFg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 14:27:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqNLG15fAUt6EVf2-Ek1T=tR4jykean3c-K98+HP4TMA@mail.gmail.com>
X-Gm-Features: AclHuK_87NLy33tHoFHeNjhVq_Wp4n3b4z8txTDgsw2XX2yqZfJAlI229NijKRs
Message-ID: <CAMuHMdWqNLG15fAUt6EVf2-Ek1T=tR4jykean3c-K98+HP4TMA@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] pmdomain: renesas: rcar-sys: Add r8a774a3 support
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Wed, 23 Sept 2026 at 14:12, Ulf Hansson <ulf.hansson@oss.qualcomm.com> w=
rote:
> On Wed, Sep 23, 2026 at 1:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, 23 Sept 2026 at 12:33, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> > > On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
> > > <ayman.chaudhry.kc@renesas.com> wrote:
> > > > Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC power are=
as
> > > > to the R-Car SYSC driver. The RZ/G2M v3.0 SYSC is similar to the RZ=
/G2M
> > > > v1.3 SYSC, however it lacks the A2VC0 power area.
> > > >
> > > > Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > v1->v2:
> > > > - Added space before closing brace for `ca57-cpu1` area
> > > > - Updated include path to SYSC dt-bindings
> > > > - Added Reviewed-by tag
> > >
> > > As this has a hard dependency on "[PATCH v2 2/9] dt-bindings: power:
> > > Add r8a774a3 SYSC power domain definitions", I will provide a shared
> > > branch with the dependency to Ulf.
> >
> > Alternatively, I can just collect all pmdomain patches in this series
> > in renesas-pmdomain for v7.4, and send a PR for that, similar to what
> > I do for clk and pinctrl.  Up to you...
>
> Usually I pick the corresponding power domain DT bindings and share
> them via an immutable branch called "dt". I would prefer if we could
> keep doing it like that to avoid confusion and special cases.
>
> Note that I already have a couple of patches queued for the renesas
> power domain driver this cycle and whether this series conflicts, I
> don't know.
>
> That said, I am planning to pick patch1, patch2 (both shared at the dt
> branch) and patch3. Would that be a problem for you this time?

Fine for me, too!

Note that I will have a renesas-r8a774a3-dt-binding-defs branch for
the clock DT binding definitions anyway.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
