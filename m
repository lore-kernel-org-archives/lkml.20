Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0835F27AC45
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789431586; cv=pass; b=qHHbi0AUcW1L/3YP5sXUOJuWcvstFjk3JlOHwFW49IzrT2NZ35OLWP7itHExvju0mQ4B54rMrDxQ54R63S8CM28JHTsjhhHu8c8smEPJsmMxaFZYh/+U+HMIKf0zQF6WHb4tcxjBf5gOcHAbuIE4esEPkipCcOvr7P5zDlMh08I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789431586; c=relaxed/simple;
	bh=EdKInOD+E6jqh6viJs2EtgOk8z4C7E9EBNp/xGdSPnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRcRL6aajMIgvSvhHwwPTpO6IknxwEKe1cJz2GNdeikmrtw/oZncNFut4auHsJUUEM9lBJe9bYYbAx4fU4KQGpBvjwtVe5Y2lCnbXTWoGw5agvylS7StbvHNSjmH18IwEVhPXJjvV9KV+8tZ7gSw4er9Mcfwuumt3+vD4QoMT6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs0lTwvi; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs0lTwvi"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c29667ed561so490205566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:19:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789431583; cv=none;
        d=google.com; s=arc-20260327;
        b=pF8cXiXx1nHKDM43YX2VpmrSMtTMskXt9BAhfV3MYsWZjyrOyfJmpGzz9Cw9bJMm3x
         8W+yUbEN1OQP0Az+etJK3RXLjp97kvCw7bqdhdyHm7mxlVlkBsHAawhtVNcOCCwz4wxn
         vT4N+KedXnXlgkImj70BUTx5OeAC03ftB24t7KD4e1hwZb/dFE+D5jcZjNypaMcsnQkN
         10Zwy/4cU5KQopIaC6K049H/2lWXIV+m/rKAXsECe4VZmq9c7fqgTX2fyP45vIeA7l5N
         LDG4o7fjQijwikivEdqupS9mEFpaDk3/1B7Hb9NVZ7BnSDHgt4N9wHqf8Fm6fJ6+VrHd
         ViPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhSnpJaF0zIlzRRxfxVLp3csW4mX+RohYNQStTeeaVI=;
        fh=RFmfmEvknzD0qy2E6a7jJUuz8gPI2xqqi5jrTplz53E=;
        b=skQnusf8wVnrynwL2/g33QqKXGWRSzluKOy/+p4qtMtuDh39S/kasr0JVu3jpUlVPe
         pPd9o6LPlUQkSPpNnWA3hiwO1nxGKr0lla3LL//3aAgzFX7UVtoeEx0fTpy0/TtyKitT
         xkwXj/85+Eyggv+EUdU9HiWWqlTnlfUJK47eReKAJ9G0CLdpOdNh2G8gC66sqN+2Q3Ea
         uVKM8lI1Ok6Fu0wFI+f2peMN6OaRVguX0djEiLJR5xWvJGSy6oeMCN9WXgNTJdBQRHn8
         xVnhnDSzmuWmXiJ6cM//ksv1hXqVJggMkBsedBnv4gX2z79WGgHP9Uxn0Yi5fQ3kvOn1
         9g7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789431583; x=1790036383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhSnpJaF0zIlzRRxfxVLp3csW4mX+RohYNQStTeeaVI=;
        b=bs0lTwviMi/7oiOjjHHoDId/9KLD2tEHe6j+XUdo3m5DIgyWvZtShT05Ahhc9p1l8o
         Tnn/Bg6YASjpgK9l472Ez4jT6SEAsOZkIy7fFsvimRYjr1dqB/ud/z8w+vZpc7ZwkbH7
         YjcrS6y16fBvkEMbwdV6tPraAbRXPFb2pMA6W4y6tT7bwNMSFrSO7eaj0IHQGm8XKP6h
         S8Lhg0vPMx80Z+AxKNtTzi0LkWTOaj1dJnJyxEsExODbSScEDyUm/VIpC9zaA5DKGGFi
         GdDbEOQKDrFmhfl32TVvBUEZmo3Pv9/K9LjLJZOPKhTjYflHgC5j//88rCG2pHMzacx4
         aJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789431583; x=1790036383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhSnpJaF0zIlzRRxfxVLp3csW4mX+RohYNQStTeeaVI=;
        b=m7OorsB9gQp+iiUS2cxbR9ZYxEdSI4hjwn1zSi/171ItUUpJWbZXEDJQ9a05bObeYg
         5Uf+YxYz/+GhkCHlKehnwI/UkB9nn4zF1oQggTJuNXa3oGwXfIT5P+gG8KDIkN9T8/2f
         wAOm206FGc3hB7+73Jj2O0ijbF6B2LX4w6gZZ4EFPeMdel9MU8VcW9Q9mPivWcOercYH
         s+3HEENCB4vEccvkh546HnUCUD9XIEaqPuCclAYeJuqMPUUYePTZao0Hzxn7I3IUPjlB
         CXbDqOkCcajlgep4pqhpv2Va0bS6XjNtEpN4rTQ9buevgfh2kncBAbhRUn5Qjh8BJlRp
         5/XA==
X-Forwarded-Encrypted: i=1; AKwUvBx9T+g6hnZnqqLdW/Rqa20j4L+RIc7c1t5+kdqjKEmDJQGAxV7naj3DOXqNflMFWhGbm+rU6PPsczkWCL8=@vger.kernel.org
X-Gm-Message-State: AFuF++lqBmJb7ZSzePW3rehEIZHgM9BpDndRRY2b1NvweWZN2EtgdyiM
	WgdxXpxo2qfZUsHRDNX2ppKYokn6h7JwysD9+b1F/hMqYvi2DE2qf8hDWHIizvW/bJN7ZLH2eFc
	BAEfwvfZvmp/MFRs3mfemvBOyEVT/jLE=
X-Gm-Gg: AYBFou3rF/mf6jGDSUA8rbnQIlaU9/UFQxgEWZbhi2qOAYn74Smn7bjxGmjpwrb5dn8
	EGYgUup65tYxmTuxfezu5wLtivDHnLzdKQEdySzNKYdRFURUCyZCypwTt6vS03aQNKWgC9luX3t
	+NNR/hKFwAXetiO1RBlkVVKgLZWeWQJotnjCKoVvsWcCghBLnybzagYrtMemyJMtIJis3cNZsgE
	hUGSYZCol+KWMQHml+pVs8J+BpB9SuwOpj3613KIaV/S4JID5WsBjcSl3eL498gzFKCY55WVCBi
	a/RJUO2O1qRBZmxRlql8qG63FIl6XzFGKzC7eejhdSAtlTpH1+xlvnYEeEevzd47gsv2UC1fYrg
	b9/Wp+ARSYvESXR+7E6Q0M/V/KfA/eyjFS/Pc1TlF+5n/tPtrhimFLB/UfRIpX0kmFeRVY056Vr
	Fn9bnM1F01eewZFb3k9N7XnnKx74LZbVL2lppwHxAwseUopbYLVlBHS8jWra5buMC2nA==
X-Received: by 2002:a17:907:7245:b0:c29:566f:531c with SMTP id
 a640c23a62f3a-c29b870633dmr347632066b.31.1789431583089; Mon, 14 Sep 2026
 17:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914214720.2467586-1-donggeunyoo.kernel@gmail.com>
In-Reply-To: <20260914214720.2467586-1-donggeunyoo.kernel@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 14 Sep 2026 17:19:31 -0700
X-Gm-Features: AcwNN1U5EfGdgTc1xsFDmc6062Wi3vW51HrhRuGo76kBeV0qilCmtX4PEonDaJg
Message-ID: <CAKxU2N-h7ooJ8BOhFz2HqaxJfAs6=9W4oEef_9C11kNMcm61qA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: phy: qca808x: handle the active-high LED
 polarity mode
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Sashiko <sashiko-bot@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 2:47=E2=80=AFPM Donggeun Yoo
<donggeunyoo.kernel@gmail.com> wrote:
>
> Commit a274465cc3be ("net: phy: support 'active-high' property for PHY
> LEDs") added PHY_LED_ACTIVE_HIGH but did not cover qca808x, so
> qca808x_led_polarity_set() returns -EINVAL for it. phy_probe() propagates
> that, leaving the mdio device unbound and phy_attach_direct() falling bac=
k
> to the genphy driver.
>
> Accepting the mode alone is not enough: led_polarity_mode records
> active_low, so an explicit 'active-high' node stores 0, while
> qca808x_config_init() re-asserts QCA808X_LED_ACTIVE_HIGH only for -1. The
> bit does not survive the reset phy_init_hw() runs first, so the LED would
> come up active-low.
>
> An 'active-low' node needs nothing here: the bit is clear after the reset=
,
> which is the polarity it asks for.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/2026090810595=
9.70453-1-donggeunyoo.kernel%40gmail.com
> Cc: stable@vger.kernel.org
> Fixes: a274465cc3be ("net: phy: support 'active-high' property for PHY LE=
Ds")
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> Assisted-by: Claude:claude-fable-5 sparse
> ---
> v2:
>   - No code change.  Rebased onto net/main.
>   - Cc Rosen Penev and Christian Marangi, per Andrew Lunn -- they may hav=
e
>     QCA808x hardware.

In my case, qca8k controls the LEDs. I don't think I have any devices
that control LEDs through qca808x.

>     Christian wrote f203c8c77c76 ("net: phy: qcom:
>     qca808x: default to LED active High if not set"), the default this
>     patch extends.  If either of you can put an 'active-high' LED node on
>     a QCA8081 and confirm the LED comes up the right way round, I would
>     appreciate it.
>   - Say why an 'active-low' node needs nothing in qca808x_config_init().
> v1: https://lore.kernel.org/netdev/20260912012819.2072067-1-donggeunyoo.k=
ernel@gmail.com/
>   - Supersedes [PATCH net v3 3/3],
>     20260908105959.70453-4-donggeunyoo.kernel@gmail.com, whose
>     Reviewed-by from Andrew Lunn is dropped: that version only accepted
>     the mode, this one also makes it survive the reset.
>
> Compile-tested only (W=3D1, sparse).  I have no QCA808x hardware, and the=
re is
> no KUnit suite or MDIO mock under drivers/net/phy to exercise the MMD7 wr=
ite
> without it.
>
>  drivers/net/phy/qcom/qca808x.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808=
x.c
> index 8eb51b1a006c..68fd4d0fe31b 100644
> --- a/drivers/net/phy/qcom/qca808x.c
> +++ b/drivers/net/phy/qcom/qca808x.c
> @@ -200,8 +200,8 @@ static int qca808x_config_init(struct phy_device *phy=
dev)
>         struct qca808x_priv *priv =3D phydev->priv;
>         int ret;
>
> -       /* Default to LED Active High if active-low not in DT */
> -       if (priv->led_polarity_mode =3D=3D -1) {
> +       /* Set LED Active High unless active-low was requested in DT */
> +       if (priv->led_polarity_mode !=3D 1) {
>                 ret =3D phy_set_bits_mmd(phydev, MDIO_MMD_AN,
>                                        QCA808X_MMD7_LED_POLARITY_CTRL,
>                                        QCA808X_LED_ACTIVE_HIGH);
> @@ -603,6 +603,9 @@ static int qca808x_led_polarity_set(struct phy_device=
 *phydev, int index,
>                 case PHY_LED_ACTIVE_LOW:
>                         active_low =3D true;
>                         break;
> +               case PHY_LED_ACTIVE_HIGH:
> +                       active_low =3D false;
> +                       break;
>                 default:
>                         return -EINVAL;
>                 }
>
> base-commit: e6b6078ea1731b05b3b552497b3bce4bf8b014ae
> --
> 2.53.0
>
