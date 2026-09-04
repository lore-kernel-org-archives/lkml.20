Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889C288C2D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526962; cv=pass; b=ZWXWp6qvhYXTzSTpYCKK1HKSEUag/ZWD1VRte+xSzEYwrAS8hI5ZRiq8rWthTKvXwaYT4EoBfYkoGyt42/OEfaNAVkC/oFFEtCvuZ0uvrw6mzftd+P9vRfL1vYcnO1iJfd9Jl7QYTL+A1DLaYd1ddSyArcbBxvLV57CzqjAte7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526962; c=relaxed/simple;
	bh=jA/Pi3dFWAvnVX/ST1pvVL4fyN3fIOOPQixPvnlSwNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDrk2369B2uxfZBtlqVhQHLdMg0KaJHZgnoBEVyEQrdgIZRLIehXDf1+nOJl8GEp6QS9Z79+hMPaqDUR2lPEHMmV1A4Ck5N7ZWxP7PTzTtyKIpIIEKrDJFCBFMZ3ORPZy25Yd47rc8w0UjMxiseksDe4mhr9V9VH4bKSK2s/7Qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Flx9ywXR; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Flx9ywXR"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1670dad7a8so145312866b.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788526958; cv=none;
        d=google.com; s=arc-20260327;
        b=sAhjCnZ4k5UKm59L3VjVYk6SVBJLE1h/hA4GeVn+Ig63tkVIS6HbUdipP3TwdqPzfA
         uXUdfoXDbwef2KLtPRhAo9CS0Dayo47aJCruPbjGRnjxkzvSASXUEo2CNpQca4pmCo7M
         CCp/Qi4LDFK2oJb5wSQ6J5pdyFpTAh77V+3gfnF2xblx1wjohm/YWsyEmZW3ZZkgg9Ar
         o6Zgv2/Dwoyzyu2dmNaj+NQFOKpGWM4FEkx50XOZ5zNhVHPE9kRV0B0+SzXmE2kFDfNA
         vqY83IoonDiG3eZ9g3UTrB7cShJoblam+0tSnsRRrzGMWB2zRAqL6VY8CPkLWTko/zLf
         IM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A1Y7YmZWSzxr2iY3IqKw6JuwDP6OUCGK+XiwHXOkRsQ=;
        fh=JYKz/dD6DbqUj33gEfsVLsYA2M0mDtvNJM+OPs7WuWY=;
        b=hzJygnRklx4VMWLWetgKCdbKsX93R3wbbSueEApddly7j6U1Fooffg1NH4fSXXD7pB
         HMHZgNiL7cYoy/ph9NQTGHPkj/Mku/FNuOaHo1uVCKB2lAP78ujI5al+d2JGFt1tGssX
         IkT65TI3mEkWb/WaQxcWTrEzJLwtFS77O916+WVuxCtpipCeeelP5mE90BM/NDiK9Vti
         orQtuqnoGpaP46SE8QTjBKT57eP0PxYx62ZCzWrjS+OOX3/WUrNiRa2rjNv/43BcCoQr
         p0ExMMTI8wykHcoYCtXD07NcnJAGM9zqxGGlgWQO38yp1N4USyYpfTeJR+WrCRqhvGh9
         QIWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526958; x=1789131758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A1Y7YmZWSzxr2iY3IqKw6JuwDP6OUCGK+XiwHXOkRsQ=;
        b=Flx9ywXRl7cCMXQRwfQoYlxUS3aTaakwGY0AxPmdXc/wvuMw4OB7SQgQCCcQzQmmb7
         NQ5DonArgGLRnwld4CpulBGLKFKOeWjY4nf6/RqV064nptigCfrRCWiY/+Q7y0McQtzk
         kI0wW3SFUHMWneM5JGVd6Az/yG4oulE9Vt+AVKrx8EZcTkH4v2BQ53y1GJNo+aq+yG5P
         xqgG0ydi6KuIrPGilPz0lKiS4RrHk9FelFixR+hd/54I5kJzyidQafAnkGRu3BjJ81+2
         4m8wWR2MsOH5Q+x2GO0bQLLbE0OEFjJjdUY1+ZszLut65KNgxu2k/8xQERd/ljtVf1Iq
         9iaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526958; x=1789131758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1Y7YmZWSzxr2iY3IqKw6JuwDP6OUCGK+XiwHXOkRsQ=;
        b=SGXTcBldvXTjxASkIVQm4tScfHH7yD0J4a5FNkNymtMKBGs+QRQrZ7F1EfvMEwtoTi
         C9pGh9r33PlwH6mIDn8YSstEKg55mJDxDk/Jv5POJzEhi/Jq5p9CJgwncWAzt2GkUJMr
         yeNUDhRgo2M7+z3SF8e1XYdenFnpWyhpZQk97wnxXT437pwA2uRrQ2fYXJasPWdVja8V
         /sgP2pn+hr3dWmPfdrKnd+LAh/aqnsbPhExmAbu0wyQ/julvPb9uL0ZvBWzBxgE68An0
         SvuvrJYaTviCMB7iVAN5PkAdp0EPuMPLWN6FdPTyjhV/NXmUbm7lc6k07zqORD49JkWK
         tbuQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/eguxZlxsJ8fPLMKdvfVAGU9VTK4fwzFrZIyw23TYycO+WivlUW6A+p6BpNFzkg2oByGB61shLITvVF4=@vger.kernel.org
X-Gm-Message-State: AFuF++lrMff+C2WXlsLdTZxfhS7mbE1ZaND6dwgC1svYBEuZ9TvkL+xN
	oATWQFJPQzdrPOjeGKvGhxqf0TX7/6pgV6/q6Q7ccHyGhjVmNgOyzaKYAgjPofr1d4R/0MP/428
	c2CAUg3iAwNNaHGuUC/grINZ9CNfQ7Y4=
X-Gm-Gg: AYBFou1GhwzIaFTupdkICkp+njJZv08kkb0cIM7Bd6OSKsNdoCC3a3InaKwlx7+AKpT
	UL7KjyWZZ1cm6O0fpCtNIpJB3jRocDtIYQ17PD20Ux0NkgNL1cOPbMZfOsjUDOP1FtN+8gUZDpV
	MtxxX+QM3xwLKwAwr4c/zyJXcTba1v4TSJNvDPs3W1r4b8kbC0oHAD4BUvM5ZgX+BrQi1FOhMxE
	bpwYVI1L6wME3oGbM1MxAzN62IL0Y5TZzVZzgANuSeReC5zSAaOSlLa20qXPfJ3CldEhWjSgWoV
	O7CsJHJdd4psMqa4tXu6NqrrLos6eDeRIfGDG2AGWvoeVIZpH42PVFfRpzAIzE7OSqzd++M37Yg
	sFg==
X-Received: by 2002:a17:907:807:b0:c26:19de:912d with SMTP id
 a640c23a62f3a-c2619dea0a3mr112357266b.32.1788526957825; Fri, 04 Sep 2026
 06:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
 <appvhlPleahTRklV@yjaykim-PowerEdge-T330> <20260904100900.21517-1-lianux.mm@gmail.com>
In-Reply-To: <20260904100900.21517-1-lianux.mm@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 4 Sep 2026 21:02:00 +0800
X-Gm-Features: AcwNN1Vm-0llheBPana_0CljCj4L1V8rcsjZv3MdI7EdXVkr6QNxUdxDIn19Bb4
Message-ID: <CAMgjq7Bh0hdVoRcS4xMRL0YG-zmjh-TxyF9xXCmP2MRarAyksQ@mail.gmail.com>
Subject: Re: [RESEND RFC PATCH v2 00/13] mm/swap: introduce per-priority
 allocation queues
To: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
Cc: Youngjun Park <youngjun.park@lge.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Jihan LIN <linjh22s@gmail.com>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Thomas Gleixner <tglx@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 6:12=E2=80=AFPM Lian Wang (ProcessMission)
<lianux.mm@gmail.com> wrote:
>
> On Fri, 4 Sep 2026 16:13:10 +0900 Youngjun Park <youngjun.park@lge.com> w=
rote:
>
> > Since tiers come up further down, I'd like to raise a point about the
> > patch subject line too. As Kairui mentioned in RFC v1 that we would
> > stay aligned with tiers, would it make sense to frame this RFC as a
> > per-tier allocation policy (or something along those lines)? Kairui,
> > what's your opinion?
>
> Thanks for the thoughtful feedback and for taking an initial pass over
> the series.
>
> I agree that this queue could naturally become an in-tier allocation
> policy. For this RFC, I would prefer to keep it separate and scoped to
> the existing priority semantics while the tier and virtual-swap
> directions are still being settled. We can revisit the subject and
> naming once that boundary is clearer.

Hi All!

We can start with adpating the default priority if tiering still needs
more time to land, Not changing the user interface means less risk.
It's also fine to implement tiering first, there are some other
blocking issues for tier though.

With tiering I think we will still need rotation of devices in the
same priorities / tier. Once tier is ready, we can further extend the
rotation in the same tier; that's something to discuss.

>
> I will also sync with Kairui when he has time. He has several things in
> flight, but his view on the ownership and framing would be valuable.
>
> > Devices assigned to the same tier already share the same priority, so

Hmm, the current posted tier is a band of priorities. Do you mean that
when tiering is enabled, devices in the same tier, despite of having
different priority, will be used equally? And is priority ineffective
then?

> > I don't think the allocation policy needs more than one option for
> > that case (I can't think of a use case that would need it).
> >
> > 1. For legacy swap with no tier configured, define it as a single
> >    priority treated as one tier.
> > 2. When priorities match, allocation naturally falls to a single
> >    policy (not a queue). the concrete policy here is this
> >    queue-based scheme.
> > 3. When tiers are enabled, devices previously assigned under legacy
> >    swap are reassigned to tiers at runtime.
> >    (This means different swap device on same tier handled like same pri=
ority device)
>
> These are useful design points. I would like to study the concrete v11
> before deciding between runtime, boot-time, or compile-time tier
> assignment. It seems safer not to bind this queue RFC to a permanent
> tier interface while those semantics and the virtual-swap backend model
> are still under discussion.
>
> > I think this feature will also be needed on the virtualized swap side,
> > which makes me wonder whether this patch should go back into the swap
> > tier series instead. Kairui, Lian, what do you think? (Or separately?)

I'm fine as long as there won't be a regression. I remember V10 of
tier didn't touch this yet so the regression is limited to tier
enabled case, so no existing case will experience any issue, that is
fine. Causing a performance regression for existing usecases is
usually a bad idea.
