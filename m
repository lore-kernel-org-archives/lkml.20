Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E079145A287
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728509; cv=none; b=B2bYrN51jag61dI6vkaEyH7jwR2ui7YphhesPZVLsBJKrSZeBWI9nNwJ9tYJ+2a8GtNAmYgBRm1GejjlCeB2ggs/lC4UlksHBrpBCiVSdlZMtFck5VgowZKwh/w0gHD7XoHiR5F2f3Ap96rLDxIgavz413sm4EWjyVXAoJq1xvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728509; c=relaxed/simple;
	bh=TH2hvxG+a3DnkfzStjL9vGu1h7pAJ9JEfX/MRQWvLXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IV5OoubMWM2P95nnz3TANqYQoSa99+Fn2UWnSRjlzbzCYuD/oWQTpOOA3SQOY+jXRvevbd020BwhP9T3u22OjY+6c2xBhAXD/Cpk9snB/Smh0D5+N+APrDGGxmGTuT2vKlmTMST0e/D7/mRxfPPOaXusLFU6VxzfBkEzd5+tAUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8565d77c277so5473157b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728506; x=1792333306;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KzyYwwdi+Gw4Br7ibuX1uhAgZ649p+E+2HalXmhinyI=;
        b=YxoUO0Nq+0SSqt+9ae39RlSA7gSMDQ3jfAy+DIPcQ3wqKswk2rv6MqoBkytN3S9PZE
         Kcn2HuZ05MR2A59kCMEMuuQC/fC/YybDtS+MyQZeYkXXQP0z4HSyDTExRapkutyXqWRC
         4/em8M8IY2qLjSbkS1fOLJ+R4YHPo0MCdWu44bzxIV6GywQR5uGOKgd8LMdvnmTSvDla
         s3e3YRG/j16epn2IGRRpV4MNrhlw2zvVPAzHtl4mVBVkKJKYDfIIs7bJSaQ5i6Dud3v4
         rpIBnFn3JRL3b5sD06zrfQMfh7mlbQAWWfCGnjKTvEbbwl3+/Zr1mW1rTgLDZEP6Meku
         BpqA==
X-Forwarded-Encrypted: i=1; AKwUvBzprgEl6rvsWtGm8XK00bnOLBeANDSByqEqnZeSEohOp70rRW9WPo6ECrJSq7Pj3/8CGbNuNJdD1j6WpFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1UfEUrNK+pHao5fd17A+GBhGgDpk0l6QqI5daoo97gx270lZY
	/qhp5uP1fJuu67EcQ0LXEmIhyN7f7lF1u6sSeiR29BHRP6JgKLHpryYSIDuuqXNo11s=
X-Gm-Gg: AYBFou1mLTRvXsFsNtDRIOVbP9sbXqFCoB8nR5yt9/mFlgi7IyF6lrlQgdK4hKrhQil
	7eTlxMWstaUwxv4MJEvGzhecuqf+pmMGgicWG9D0Vtb7ATDhI2i2ZVYM6OOCxxs1rppIr6kfoPI
	TizyfaYeeYbTPk7ohtr4c/R0mLU4YNBqx1x/vLd6GLvOR6GHGXaxZNbDlgfsIpa8S2gizhNYTQZ
	xOE/xeSqKWheaTyR9WOR+xcpjzt1wKrAJ2jLCunpIh+8+Pg8uFVZqZZqt5/XPtoKa0cbDDw/sO4
	uJTuYwrs3f1PNc7+5rfU+obmMxSKP32dYhjDsOURJTIYkODr05ztQ3Uxw5oxusw4eoNFyxyXFKk
	ZwPt+BSJGaUfUtJ7C+wFodM4atD1qsUYfo45Y+3FhAhHM86Oo0FUrfQikz5+YlSHDQtFjWtqOCs
	8sR0MViEW4N6mU5aXmJ0469eeBDHESQZLuxrnPpee3k5j74a/IRsKooyYp3jGTCScftut0St90I
	xzYpaBvDgoKQqDQjmYXeUkc/6iGsp3FlQbyhOYTjqBwlEQFm5FAcVImIryCFpEe598=
X-Received: by 2002:a05:690e:4186:b0:677:deb1:2aeb with SMTP id 956f58d0204a3-679362826cfmr1546534d50.49.1791728505644;
        Sun, 11 Oct 2026 07:21:45 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356bec15sm2694456d50.16.2026.10.11.07.21.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 07:21:44 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-888cbacf70eso12515277b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:21:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3aWoanyfxrpOFVvUQmS8QOWzqq3wCYSU8JW2SOQwM5JQYvE8UWyFoRDZWPyMyq303o2wE71xrNVvfI88=@vger.kernel.org
X-Received: by 2002:a05:690c:309:b0:8b0:9e1c:3148 with SMTP id
 00721157ae682-8b09e1c33cfmr4413327b3.34.1791728503965; Sun, 11 Oct 2026
 07:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-3-tanure@linux.com>
 <CAFBinCA7rPu0obv+2aadxqkzMYKmd1+DLJgRe6y418v0QrwSSg@mail.gmail.com>
In-Reply-To: <CAFBinCA7rPu0obv+2aadxqkzMYKmd1+DLJgRe6y418v0QrwSSg@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 11 Oct 2026 15:21:32 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2tBUh=xP9kzPBB0CauXFJukipnLf6D0jLMapvZOst_UQ@mail.gmail.com>
X-Gm-Features: AclHuK90wt6EVCYdNEmq2Fhuw7FDmVki8iPk3nLcnG5vHPlk0pxu17yKPiCVT8U
Message-ID: <CAJX_Q+2tBUh=xP9kzPBB0CauXFJukipnLf6D0jLMapvZOst_UQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 11:14=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Lucas,
>
> On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +        # The TX delay is a quarter of the RGMII clock period per step=
,
> > +        # which is 2ns at 1Gbit/s.
> > +        tx-internal-delay-ps:
> > +          enum: [0, 2000, 4000, 6000]
> > +          default: 0
> Is 0 a valid value? Let's say we have:
>     phy-mode =3D "rgmii-id";
>     tx-internal-delay-ps =3D <0>
>     rx-internal-delay-ps =3D <0>;
> According to patch 8 this means: MAC is responsible for adding the
> delays - but it doesn't add any delays.
> I'm not sure if this patch (removing 0 from the enum) or patch 8 need upd=
ating.
Yes, you are right. I will remove 0 as a valid value in v4.

Thanks
Lucas
>
>
> Best regards,
> Martin
