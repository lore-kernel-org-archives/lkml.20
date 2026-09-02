Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07C440F8E3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384913; cv=pass; b=GEBuCxITr/Zji/jYzn7YIaRI5jlDo5nWqrvVr383b/4oqZE9rjr/NkEUSGlExZd4oyGafc0f0aFdCCoNYhgGHjRH8XNe7izz9tR7mKmv7luwTK56RSa5hjW+jgCnozAJazl0TSbY7ODLnHFwD+8ajGFWyZQZzzafwZ3lZHLmMj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384913; c=relaxed/simple;
	bh=/3pcgbsRpKvkjeE4xYl4+01L2pgs/y1sJR7qtHiJdnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0KTQfwO1FC+r0hR/aKxhBRIwfTFBf7fX5nY1Gjj9MOoE8LVI8+SyPSTkWQ3Kso8K3cx5mBzxJuTPTxFdL6IFp2wevlP/dphYnG+wCSHhS5mh6fMBhzmyKt9t9xCIYzs3BbjGcyegyNHn6pilmWpN0/4faeZIgTulMNMTl/FUpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+AuOdSi; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+AuOdSi"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so2623627a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788384907; cv=none;
        d=google.com; s=arc-20260327;
        b=fVATlu9RBU6DrPc3/0r3frKmDfUChMK9mctyp54e+hu2cYfAyXJLH3pQh6U8rlkb8U
         ZwgpjbgXVBi46d05tHwVfgGL0LILLpRj/CJnPsIFSQ/NRUtlvDvwpsCPa2u0H9+jhwsl
         jY+WPtqWXULBPagDrZEK4rfASqUoS2Vg0nE/4DMer4dBP9SmSEGB3aEl6s94Y68CiFtL
         eqdcqQ7RrhvqDxD86kyxP1oeAFKRQMuThTieaMlRnTaouZ8WU3zt20zQIsr2OXsBK5+E
         RPHwIzdVtlf/GUNaDDXS+FgSXY7lrUJyEyt1Kj9y/4rSGRFINCi3GsJNjBPtpk1Fdzw7
         dCxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A3AAbrMEFHcqDNT5olp4jYzEjeN8ZcYhbUy/GnjuDWU=;
        fh=jn0Kkz2F+gqqEPefm7z1faMAFF3I2bNDHqmVpREZlQM=;
        b=AIKh8vguD0begI/fJvQ0b0E08KmJAwQSFTZdjLH3wGFgwc3lLCVNzp8Wb6jG1MH/a9
         H7gh45y6/8v8K+VyvogpxN4j8x12k+YREl27/vlnB6YWw6CfmqW5GpoU0RghTw5bKHTX
         d6xC1i3eAd0LkvkH148+h1SzJQGbwAJgZIlkI2F10Xgfu3cjDyHE/IDWjSjlV/JNZTGD
         5cB5L2txz0U2Ro9lyRl1VqBGPCUu3O/U7twYEg7g+thhMOFwnq7TMOTl8meGjh/LQnq+
         V5fAL/kEgSkgZcuc39OSFS64XBQ4A5jW/eMcyksJevZxY3tH8v8gVPd9ht9lcqZgXsy5
         XNcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788384907; x=1788989707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3AAbrMEFHcqDNT5olp4jYzEjeN8ZcYhbUy/GnjuDWU=;
        b=R+AuOdSiXtKqWskLsD5Bw5He5p5Kzkl36kaBnjYu6VyynddTv4RCuS4BUK8mZIPMBE
         eEMU6kxN+HwO2sowytw2IeEmaLVoKcg1LBDiFDpDl6uqlbjrIz/w5dGlK3lOxkL88PGw
         iT1VpEYXMsmGPoQkXuWKfiThN12TvzCKakqAoypcy1sHU1UJOmaD4jFQ7KPzuTDFxvST
         jYSSjQjVVsPAX949Cpv76lFsrt84QXHjM8S/kuMu2PKzzVRLmPB31A3x3PavufEV0W5V
         IXmyppD6jNRzj8Vx7W6PRTAifm6kqJ4UQFbKsIzY5QP/Z+HxzVXiLcOwnSuSHSR5OqHz
         h4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788384907; x=1788989707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3AAbrMEFHcqDNT5olp4jYzEjeN8ZcYhbUy/GnjuDWU=;
        b=k0asgXlWqVs13woQGCzW9fdFsqj2Bk8IfjSc+JM/lmaQTgCrN67DLK74B2f+pRYQdF
         hSYtvOiOH0vfYst4q4hct+GZnzLBUTJua2Xus6ryLA7gmE73AhBqbhvTUU+s1po0zHdX
         N83UgRSiiq4m0nyl7Y08EI4EkM8GZH8FfmBD6GHzaFuna0W6nw3htR/nxBiFgiDinkQl
         wzKf+UqGzJKAxivFqnyQH7co0xAj18XVXM1Y3quikE0YVACafTfFjSdZl/bvjrIzu6Mq
         AAQZPIfzgG2fwjGgLmZsTaaM2FP7rcZWUJw/hRenuPVKO5BSmeGlrDohq0TKf0HSPN6Y
         BaoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpI8tTBHnYfO44ejRFDoFn95gqYUcgLiiKuBsRaWZLzXuCTjp6Tx0TmLUN6NCHiwmsX4CMS3TcFymqWEw=@vger.kernel.org
X-Gm-Message-State: AFuF++meoI6NqYZ4MRxT2m3LyRL0FAqhSDULlELQEHKJxuhEjhaIUatW
	vli6SflnV1bZcylRCNmQUmYGK2jSYO0YiRRE7WjLUpcKTETpKwAK6tnzeTQcO8kpSnaw96eh/4Q
	xfvX/ze7jVqywhyq0was800p3FZ+7FW0g+xPe
X-Gm-Gg: AYBFou2daJdsdCMj9ZYjK6AGNp8/8NZ/rfBM9F80JepACE2pM08mkFwOvGSfgvxOQhB
	7uSWy0tfOLGnxLddTSkcLNL7JoyvADF8k8ZFYZ+HrvtBAepqaaIV0y0MbiIoPBR37qadGAs2m7S
	HYuNzbW9SI4S/w93Ig/BL0nvFZrW3RxrGoXzzzTZXULk+DbbTStCtPS+9avNTm8woVZS4MWf8xR
	tGYpSTlqcHndajS5RFKl3UmjcBT55+jMfSeqSo42lnygPG2MXIOLwM9gdKU2K6ZAvz3o9WFyQSk
	TE/UjkCA6FNLafBAdApHHmKv2BUJkKZMw1zjLdg6hDxiSDwJo2tplvgU2ONlFD8z2Cx7hiIl7Yn
	jn76NMfgm3Vc6uCQNQC27QVNhAsCZVxk89EtOLdlndQiw0mT3NC9RMIPgigCTSURtXYda17yt5t
	b8KLP6t/g0uMbWOoCXioYeNcb3IMAWRFN1KdgrJ8A5K224npMbqgpS/RZyJEYL1CE7Yw==
X-Received: by 2002:a05:6402:2381:b0:6a6:1076:8152 with SMTP id
 4fb4d7f45d1cf-6a68313f895mr5049013a12.7.1788384906985; Wed, 02 Sep 2026
 14:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901004203.49686-1-rosenp@gmail.com> <20260901-corrode-unvented-4cf271941722@spud>
In-Reply-To: <20260901-corrode-unvented-4cf271941722@spud>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 2 Sep 2026 14:34:55 -0700
X-Gm-Features: AcwNN1VBhItwhJb21bPHSs3C2UiMxziNU0BPB5MkKs7BmaQD66JnJpLxPrmmKk8
Message-ID: <CAKxU2N9X=fvr-a5h5o5XaRLuRuSUq7wR85xmSduK9vff4z4CQA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: 8250: add marvell,armada-38x-uart compatible
To: Conor Dooley <conor@kernel.org>
Cc: linux-serial@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, in file <devicetree@vger.kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:51=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Aug 31, 2026 at 05:42:03PM -0700, Rosen Penev wrote:
> > The Armada 38x and 98DX3236 SoCs use this compatible, either paired
> > with "ns16550a" (armada-38x.dtsi) or on its own
> > (armada-xp-98dx3236.dtsi). Neither form is covered by the 8250
> > binding, so dtbs_check reports:
> >
> >   serial@12000: failed to match any schema with compatible:
> >   ['marvell,armada-38x-uart', 'ns16550a']
> >
> > Add a standalone const entry and a two-string variant paired with
> > "ns16550a".
>
> Only one of these is correct, add one and fix the users.
> Given there's match data, it's probably the standalone one.
Commit 62480772263a adds the second one to support earlycon.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
> >
> > Validated with make dt_binding_check (8250.yaml) and dt-validate on
> > armada-38x and armada-xp 98DX3236 boards: the UART schema errors are
> > gone.
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/serial/8250.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Docum=
entation/devicetree/bindings/serial/8250.yaml
> > index 8c2c177faf89..f71c6afe02f2 100644
> > --- a/Documentation/devicetree/bindings/serial/8250.yaml
> > +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> > @@ -109,6 +109,7 @@ properties:
> >        - const: aspeed,ast2500-vuart
> >        - const: intel,xscale-uart
> >        - const: mrvl,pxa-uart
> > +      - const: marvell,armada-38x-uart
> >        - const: nuvoton,wpcm450-uart
> >        - const: nuvoton,npcm750-uart
> >        - const: nvidia,tegra20-uart
> > @@ -119,6 +120,9 @@ properties:
> >                - exar,xr16l2551
> >                - exar,xr16l2550
> >            - const: ns8250
> > +      - items:
> > +          - const: marvell,armada-38x-uart
> > +          - const: ns16550a
> >        - items:
> >            - enum:
> >                - altr,16550-FIFO32
> > --
> > 2.55.0
> >
