Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9785158B3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786745; cv=pass; b=K/L2eCdGJybkrQCL+ecAOlYPMXyvTGoEY75hgNrIDVXlqmqBhYHqDsvLphxa/2Ld7T+LVKthfOHxxPhVSjj71695reUhG/xDudpaP5i+cBOKhz+63oR5EXLHdsplP18pAToSfQOmmd8cI+ZKn7KuqxfKh5RMaZIbHHueLHniED8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786745; c=relaxed/simple;
	bh=bhyLwLX3Cbs39RNIdfvjdkMauqLBTv5+SoflpxyeT3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dwG7289louxwqabL+c8rbHABRARn1UZNb5r4b8PCm/YtHz9La56T1OaQcz+uOpWM/bBZNRWUEE9tpumpxrTLk078PupgD7TUm32DMaQw9Q8ytwa7FQdhNicrdcsyc3EJLWtg3/y34mfcmIuYbqfV2Wz+dyQql88SgwIN1Cw7o/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knt9JlSv; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knt9JlSv"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f2baso1776357f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790786742; cv=none;
        d=google.com; s=arc-20260327;
        b=WBgdmNo0fM5dQnLYaQR596QOxHHymsuTH0HDrtxdOg0Ii+ALEmjDt6Oao1n+dgfCMW
         99zh6YkA9AKg1UNUn38h4hUGl9AtDWknoTpfTcNu2IojwdB5q1C+9OXsl8PXUgprvapR
         fEa4xiSbJTUjzJ0vxPOKRBem+vJJBjVSW7YR4FNvJEKbX1ylwn1+nRN1o+XpKnZrPU+S
         EjZ3X7aBgAJhIwIsB6Bglc7HDWngpOzk6R8UI/Ein4tQYdtF9iA2DK/5HCqdU5MlvQ4x
         g3PGqe32g4HY3o123KDaDom300p2rODCiSckSvi2jOL/gZNmsrfDBRbBSQLr/k0pIu8x
         YjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0qr/Ipxr22SFcNZfSu174bMZPRwg/L3HUY1rLAYBi7I=;
        fh=hlQjX+1P/6XmP8hAWLXWvj+bndsOfr5ajh5yiBy7FXY=;
        b=nXiMqHo0rcJ3VbjoXk/+3p66bh6plu2O+VU/Mmw6xa1RZA4uagh2UV4jTeVS5yNIzq
         UvXdh6gVS4EYVUBPh4YvXTbGxmhHM6c58GRCa/3Hn4vZXb3Qrx9/JWBw5Kpj+fzHxUyU
         h9HGqeu6un/OQNps/ELlQGyfOyJqpptYuIfyFpxkVbNr3Kmweb2Cy2RbV4p5AlXWL8Or
         AFMa+osxvXzle1Zg6ngAyFxpEN899i7ukwUnaw71wjMY5HKleBBRTDZ6D4DBv4fPcnbq
         /Lt1nSba7c4KC0MPdLrZbS2Xm6emBoNIIrazsUCeVi8b+KjK/R0GPz9NEgCSWJUEW1n1
         19aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790786742; x=1791391542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0qr/Ipxr22SFcNZfSu174bMZPRwg/L3HUY1rLAYBi7I=;
        b=knt9JlSvHA/ihsQPnXC8Pto5tXIsmr4YXVA0pm0Xeq04GwRzp6MsVZB+aY/hHa2h0B
         yoUINlKRc7bS70qcFZbuxmrJdB6q5eXGOikRuXFhxbpGHqoJhTwLYYEF1UHagKwG0gXy
         smgn3xzTfk8D7fH3T3hp0/0ZP/6h+q4/t/IOMcqsEqYs+Kt7j6W7oyp1RV3y3BIPeQfv
         ExJZWrWTNyXvM4UOF/MrFQMgRTZglQSFgAR+ipYkC4v1+FyStGbHL49dSKF3GNXc8TZp
         XHHNx7oxo1GNGTpT8zQi/WQk9KXrCuLD885xnE5/KnF3WygGxo8SMqjrgsi/S4AjuqUC
         8rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786742; x=1791391542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qr/Ipxr22SFcNZfSu174bMZPRwg/L3HUY1rLAYBi7I=;
        b=qLOPMqtluLD+/l2hGifBIscCVYu1NfNWH6xD1eQfNl1hH89o5Iine4uSz1XSiRoqCN
         XvqnkSAjz5tjp+OVXgy1pMzMutHDq5TeSSZtZaSQa3VoY7c0pHhGQhKyX1YBY0B/6uB6
         Mtzt2IjzyQtwPFEJgc1U6C9PXdr3q+EgWdhoMpRtAdox+40rDNJFfNCTjvXquL6NMoaG
         GPl/+aeDhxfGOtKskEegva9kazIFZq4NF97s+sTymiDZw/xQmAyHGuSNuPbTS6piQELc
         b63EfCv67oxQvz0CsoLSDyo1TF5jIm64+1agJNPW7QdfaNAbJZt7SYqU4nQqLdLhq2HV
         fz2g==
X-Forwarded-Encrypted: i=1; AKwUvByOPeAyJI0Ry721NZFTNiS2vbEJTABRB3LAmIumcpK69knpXEBGZLSGt5SjdO7sbWT2QJLN5taHqjZxLgU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGW2bHZUK8rEGGhCVBUQNU9QkIwVSVFLMO79zzGzd/oJjFyVkj
	mjZKqRXMWsAxMf8CPK+MtddZ/d4+RTcP5jF9SAd8Qb/kopcBAasOlaPu8b3lhMLPPEjxzRw+0Ic
	cMRbLSOHBgE0p4uwrRZKef1kh1gwixps=
X-Gm-Gg: AYBFou2TT4NA+BA+Z/d1mj55DX7O1yJi11zD0qdlK9SPC/WUdTAeAPHt5072uzMQpII
	4AnkB9WY7Lzy+e28TT6i5OgbXO+YWzIz7fGXrVw2zjecRFXZNDCBrIHnkbrOV/nx4pLqx8SMIAr
	TQx5+30xpcgknrIZU/bK+DHC7sFF3DE/sgpclAkYRgBp7M9DnET5MxKSlzaLUEAqewMdv8/k/PQ
	x/iezeZar0Ta3ugDnlyWT62s7fV5YNBoqu+wSUBSWBTFQAtrUg6plwF2BzHBKenmq9PkoH9Oy3K
	MuKyCMoXjmvqTT++SJ5zgzxJA6Ym6cm/gQafCwTwlmlsFN5XfjFJbJvddowC9by7dlGRXbefrWc
	emaYpBYMJyQlpgX7d7XWUemMg4vQN497ROi/FUIfrvGk1lLGfFp5XX9RiVUqWDKMFlbqD0ZlYzw
	==
X-Received: by 2002:a05:6000:4a01:b0:48a:f36d:fb57 with SMTP id
 ffacd0b85a97d-48b024ea6cfmr4110706f8f.18.1790786742198; Wed, 30 Sep 2026
 09:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <arzVHnMtKqQx5rdZ@ashevche-desk.local>
In-Reply-To: <arzVHnMtKqQx5rdZ@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 17:45:15 +0100
X-Gm-Features: AclHuK9DK0fHm8pKCkWA6Zd6bNeQSmhN0p4rElp5jeZV36-WUljPpymXoO3Fm8M
Message-ID: <CA+V-a8sgRHDbJqnp6_-0NO8V5f-J96ZtdC698-2n0Z7n71x5qg@mail.gmail.com>
Subject: Re: [PATCH 2/8] iio: adc: rzt2h: Wait for the analog part to stop
 after a forced stop
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Wed, Sep 30, 2026 at 10:24=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 29, 2026 at 01:42:42PM +0100, Prabhakar wrote:
>
> > When ADCSR.ADST is cleared to forcibly stop a conversion, the analog pa=
rt
> > of the A/D converter can take up to 2 ADCLK cycles to stop operating.
> >
> > Wait for the write to ADCSR to complete and allow the analog part to st=
op
> > before reconfiguring or restarting the converter.
>
> ...
>
> > +     /*
> > +      * When a conversion is forcibly stopped, the analog part of the =
A/D
> > +      * converter takes up to 2 ADCLK cycles to stop operating.
> > +      */
> > +     ndelay(DIV_ROUND_UP_ULL((u64)RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC=
,
> > +                             adc->adclk_rate));
>
> I do not see the point in having _ULL (64-bit) division. Do you?
>
Agreed, I will make use of DIV_ROUND_UP() instead.

Cheers,
Prabhakar
