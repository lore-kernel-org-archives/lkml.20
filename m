Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E92473C80
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789009; cv=pass; b=qUo1mZ0isDJCgSVoZfS69YJNHzjyFYu9RZ8wpQyXA7Bl2is38DDJDTwokDelCTorrXW8nK16Nhf1G9CCz/tOSz4adSefzY9WKbsiPx4/JqvKp1gN0XyJKbZOUrHxsUzoruAgoM2P9Q0Yjv/U2KV86KFgoHPzw34MeHB90AYVSAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789009; c=relaxed/simple;
	bh=jNZHF0WExlWBrCI69A25zEKjol7bW38px42D/CWs3WQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bvnz3AAjwfhOyXfZcDdZH2aL815SxJ/pTZSYbSdKSrJcooPYMhVAXLawtbmFjaNxrRVKgzu5q98tSHmrBrxG3DvPIYEdIa/Zo4EH4MtT3E6K8H4emLV1L0/lP96xBiXSgXuP+S78rgnHFlCzdmBNeb1xKZ7zr/AMYvVkIOH8cqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=BzDMlpEE; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="BzDMlpEE"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2637dd37c1so217774966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788789006; cv=none;
        d=google.com; s=arc-20260327;
        b=JBjJWyHg/MwfAlrLhQjS5lNeVPEsCUrTD8GK2V0yjrypUdcGF1DP4wDLJK+hYjNr01
         sJl4pLiyUGQUbszMPdbQO06YSpM7895GpxMb57M37hp5CbsKYgfjyKuBr2qM/bWBBGAU
         z1geTWEAX86wSBcniIVK4K5bmcC50LJhesbakgg2Vm0DIPFirYaJhcxRn1BM7xXTcU3s
         +fJwzN7/6/+P+n6Z397dF0IbLERXhAdHOM0LzU/94q0yt9vHUZ7y/0XiCSCdbVAHl/9U
         zaXsF22GXiHevlqbszf2BrvE+GEnwKerBffJHZKSUhlXkTf/Y4EB1P5q9jGRsWOyT9mg
         TucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jNZHF0WExlWBrCI69A25zEKjol7bW38px42D/CWs3WQ=;
        fh=rBS23HWHJ47nlASXMrltpg0laX2kc4V5NxP7ppBMlTw=;
        b=GrharpeTwQQBtoE2hA4a6oMUyoCknvfNssKX/HrRxgwoqpSK6OoaqR6q82TWc0WeyP
         t+3XFcP2Y2SDAGEYyQPtC4Gr8wNMr57x7yfXW6Z98fzciKeLhE+PQnOnGIkM7SXKU+zc
         cyX22bJHDidz7bRMExCOSyOd9lSnP6NeHMu9fD4rwP85Nr31T5V2ZIbTShs67PE3q2g2
         OvCyr+Vr3ievviX+Eg41zcuYS3GULnIyghrZq99se0XXt2AqXKPKikWpoUpwnIBlj9dL
         ApGbp9ViurkXp0nsO/6Bz4QPgzmjChnKVt7J7a+AMsPURj40eL6oFWSFqI3b7Bu5V9IO
         Wv0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788789006; x=1789393806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jNZHF0WExlWBrCI69A25zEKjol7bW38px42D/CWs3WQ=;
        b=BzDMlpEEyDA68Vcdw424iusj1WGxx07AJcywrv5qJa+33uA6SNCUcmToGcpF3yU1j2
         pW4Ja45T/BvSLfRepA/6VxLSA7oQsip2A2pzTXorfCNabQsvbOx3/UWrZNlz42cVqF79
         9kzeowKN0hQOEv5t6q6gVkccEuErarH8MFYGgCltvJ1lbz5/BQxvI/AwevM9Ko4KbAKI
         uOEPR6KmeS3hl6OKa2USNQUzhnAW2IQ2tbne0V3oX9gLUKh8ZLBLkagNiDlhBNgmL+zW
         k9gyTYnCPlnxhmja9fm6Xq2EUCcVYy+UABJ4WNiYGZLWml89VTP1RBM/GwutCRAZzpsO
         7gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789006; x=1789393806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNZHF0WExlWBrCI69A25zEKjol7bW38px42D/CWs3WQ=;
        b=sxudRPyZcuS8YDNknki6+KXtmf7JaXZKaOQsJNAJuhC8N9A+Dp3PUclWTuLEYj9u83
         Qoqc2EZ1d6q6Sa3uwFuXT+E40Ly7njtrkzMcUYwFxA7GJQs5aEzFOZr7WzPOcUjs/zKi
         sq9qbCiLBdrM/J6ulMIZoWKyOCJlp3Z5ZrVImPsUuTLKkQVqgri+sfTsnDiIdyIaoWOa
         VNM459RGcVcZFwfQKY+kWX8iD07QiBNJz8ii4ZbkFnKybSbZQ6UuUw1fwU7gBDyRwVlG
         DdxGy7Wt06zlRXtANs7UDaQLum84BBxlluOQb+ai6AKtvW4iH1eKOjmCMFFXBHaqzVz7
         aCUA==
X-Gm-Message-State: AFuF++lFl20EXxktwQipi5gFS4Nk4huWkcn+NrHLqVGs6dcImuOBEcnu
	cqMWinNoejzHKWvCLkHZSdcAK7chIR5Mjbv+nHVefrKt1MzKEpbhOH9vWh2bYXI9/TrvXWMzRCN
	BE4UTNfKqEybdoXyjxKK53aXhvUeBLrs2ktsIUP/R/Q==
X-Gm-Gg: AYBFou3CXQrn8b81YrgtDJSdwhA502rNIxih1Seo5gG9u9ZzK3lEqTXMUDKB0nhpnqY
	r586W60lHRWOUJXv8iidUsfXFNmmOip3NC6cuu57ZXzFspAGGdOgw2SqnGyVjeGQep3v+Gf6xR7
	BnSArn8uRxbqlzy577M94G+EPELCeXT+dQ05Lq3K0LcbrXef6/JW2bBWuc+kY8T4aFpfsmpR9tY
	stnoTcBiSlAHFhwv/yi9AJx2a7gR3y6Tpm8WQ9Puo4fpXkFuuG13kRJgPKZy3EtjMBHtth2gGWe
	NCZr3fFGESwddAMFOD2kRzLuAMyAuwlzTgro5YgDh4hU3LEBVPRHeR3dV0Myv/vuXRfzp+CQKQE
	FtFBvoHyuTNrr
X-Received: by 2002:a17:906:c14a:b0:c26:2151:180a with SMTP id
 a640c23a62f3a-c26215134f7mr635825666b.3.1788789006351; Mon, 07 Sep 2026
 06:50:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-bq25792-v8-0-c1c70473bbe7@flipper.net> <CAKTNdwF5yW4YFFmsvDFVY+Q+89Uo=YS79nb4qYrT4WyKOszyvw@mail.gmail.com>
In-Reply-To: <CAKTNdwF5yW4YFFmsvDFVY+Q+89Uo=YS79nb4qYrT4WyKOszyvw@mail.gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 7 Sep 2026 17:49:55 +0400
X-Gm-Features: AcwNN1ViiR2Nln6q6EquDYeq682N7lzMxojPLLDRGB5jwNk6LcMvHbqWFR0a-zQ
Message-ID: <CAKTNdwGC=AZ9jmD71tz6JqCWk-00QLWCYb9wiG6RRQ0bO=mC4Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] Add support for the TI BQ25792 battery charger
 (regulator part)
To: Chris Morgan <macromorgan@hotmail.com>, Mark Brown <broonie@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 6:21=E2=80=AFPM Alexey Charkov <alchark@flipper.net>=
 wrote:
>
> On Mon, Jul 27, 2026 at 11:52=E2=80=AFAM Alexey Charkov <alchark@flipper.=
net> wrote:
> >
> > This adds support for the TI BQ25792 battery charger, which is similar =
in
> > overall logic to the BQ25703A, but has a different register layout and
> > slightly different lower-level programming logic.
> >
> > Mark, would you mind applying the regulator part, which already carries
> > your Ack, and which is the only part outstanding from this series?
> >
> > No cross-tree dependencies here, as the MFD part is already in master.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> > Changes in v8:
> > - Rebased onto recent -next and dropped patches already applied by Seba=
stian (thanks!)
> > - Link to v7: https://patch.msgid.link/20260603-bq25792-v7-0-d487bed276=
d0@flipper.net
>
> Hi Mark,
>
> Gentle ping. Any chance for this to go into 7.3?

Gentle ping :) This still applies cleanly to -next, so I'd appreciate
it if this could be applied.

Thanks a lot!

Best regards,
Alexey
