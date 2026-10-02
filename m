Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA41023ED5E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790901212; cv=pass; b=U1ePAo+GaUn5xmI4K8vSCzbfGfyMY3YBLpPtMH7QipA7eaXa5Ni3yNskn8SB3BtKk887l1tFY4UE5OrIn6ZxBO5MgMjVXdey+4QpQaeiEQJY0QsdFi6gA/NRTh1sYLX02JvAbm/n3FxevMMLr32v9j1TC8j5Z6A3ukuasQfDUYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790901212; c=relaxed/simple;
	bh=bYabJjtwOJnu9LtbmZmJTdXpdlbi97usRjh2CIJhQWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G58ePoXmjeKtMoTD4Cku5LQ5Z1Ll1KX3Cgb9nNBzKGXGiBmhGp/K/1JfGjjUa8O4Xw3APoiWMYYvu3GSUvmvSjM80G9kzo3PnraRbcYTlLlTjYJjb3Sz2khfFXrQ6/Pewo3kBdL5KyzhzzIT9ewb+hKGWTCuj0YchuFez2fWHNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7hwy1PT; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7hwy1PT"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4c2c368cb3bso3524012b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 17:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790901209; cv=none;
        d=google.com; s=arc-20260327;
        b=TgrWAfteXw00HC47C5dRt7CR+VgN9BotASJCYuJEO+9BZL+Po7zRTqAeMMVP/ovVwy
         qHO22kceguaVawOzSKUqAeV4gU+WsDOscpKFgCP2NTzI0xA0/6+R/9FFyKoyOQy9KD3D
         Sn9r1fhYFqdBeeSZZ4LMjamEC54C0oVihhWLl/Pgr6863Z8DtAKLl8HZLSdrBQYmiysY
         qMxN5NhbAbTWpc4ycVzeIpVd/uWasvwXYbdMUaKlycTr2jEuFu1/AACrm4vSAvIF9M1O
         IKL1iJSgOmvYsWlWDObAUUWq2lIJedVcL71fAZUXhluBFzzLDXpLimovqi1kYHkQWIMy
         TyWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WWpsUMNlZs+RUsKVOAxmXszI92yXtYeCX1oLIS2CEuE=;
        fh=5+6bYfN0w6t7HeAQgLo6lSZ16TK7ruth3G/QaAQbKEI=;
        b=SqvVMjNafk+xRh5rKoeu20JTHbCJPXKvdX6eRp1VaXyUhD2bxZkBImcAvg5V5ITIW6
         lHbUZZ0fJ1Zh0bA09TAY3vgG95ot4AFougX+cZ1+lGLuXlCdi7NKvCJJvZlwHWTbp72Q
         2J6VZy6/nMX63XjPceUtM3d7IoGohcPMyeo/2JExeR8zwDHBQZMtRQ2I0sESDlF7VGlY
         g+By6kfdj831vFdDTPO6OGLojNvRPS3p5OiRUcpziI+emdSskhekbkfQCI/Y0FetXbTy
         jUw1XW+xZTjHZ7mR91fGx9/NTMz+iK/wq1TdTrquxZ0ccLmKa8xUE4GzdJ8sS9elrond
         5D5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790901209; x=1791506009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WWpsUMNlZs+RUsKVOAxmXszI92yXtYeCX1oLIS2CEuE=;
        b=I7hwy1PTFCZGfomdWaVmcUB+e0eZhPnhxrHfCp7vJQ8tWpxRxbfbvs0wQTC00FXxG3
         VAt/KeCN+ovDKeNm3piqRPKcdmPSKQooZsm8kp3IeojSuMN14xhTqiuclp5TK4bWzoI6
         eOSFZBD+6y0IHNOAlqK9eyrDM0mzu6qNzLILKIiY9J4q+3IIy35+imxhIsZ1PXyJzH6E
         +kuaepQS2YvnU8pcdKTp1/KFT43NNwyU3d6K6zBPGflXYySXJ3+gOFlsacaU81NDDx1x
         VE2g8ODcKfSxwQOz7g2DrgZTqffX2TKwBv2b++UMOJk7npKEO5x4lz5HorffV/NJhK16
         IFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790901209; x=1791506009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWpsUMNlZs+RUsKVOAxmXszI92yXtYeCX1oLIS2CEuE=;
        b=j60SA/QKQQ0vkrsfYzx4VTaOmTPh35tL6oZc3GWNeb9OA7ZZ8ejL7qKKTH8h162EcQ
         10lyXvLMvby2Sec+vyWnwRqPqHbflGiy37//oEZClqbbelMXCrlhcPtCQPNNYibnVCMo
         KXqFJKrgfUsP9h6GSeNlOkhGZp93QLEazVwBobkXjCN3OWDJ8jxZaVos63Q4bZTZgn48
         xOg0cpJgKZrbFgLrOH7ddbzYzbgM/GjUJtySXMgxDc5u1SqYti/Gg3qRpx2Wi7VZjtTK
         OWM1E/DarXJqBHMkdLQkrlYYFdO9ZmwwZUMHXg34rO4qoL/Tm1K+kwcz3Ypqsx21zyXM
         uf4A==
X-Forwarded-Encrypted: i=1; AKwUvByy96aQRCXAx6rtuGxOlFCM0+iRALQ57EFpXTV17/8D2NAjaVNrSsogBgS38O6OR1QhXPA7SjUpu2S6ClM=@vger.kernel.org
X-Gm-Message-State: AFuF++lEPPtNo88fSXrIn9ViGPgRG+botwygwyujCKueYzskJem+ZjbK
	HJ5UpKO9hNqgipUAQv9jXFN/bvle4WTtPHWAgZI6MwAlsXcbCfX7rSgFxsaGItINCjguBJDsDFB
	0EEVI1InDp33R9+0VAqslJ5+7bYWbEsI=
X-Gm-Gg: AYBFou1kMxAGdB00kxw3wFVe6YAkBBoMkB5t0tYcZ0De3gY2GClwQO9X7w1gg1lQjiy
	ymKrVZSFT7f4ZWJUYpQf6Fg40AVvt4eXV37EocrqKA14Z/opajZigjLHmNet2rtSjYk5e3S1b0A
	xY8MZ8k2sGhBZ/xjiW8uv9jJg+bwOWoaUw0UMUfjwoK4f4z4MayTO0gjC7GX02tEPk7T7c+i1+g
	/iZI4wWlpy/1ikGdU09DzaD0OiACrrhjFcDYF2KTIlUEqq/JbQv3hjam9I2+hGQKJtiMNmL3UOa
	fvMwe4J/6rDaD1LCuFdk5j2w5WWuCMnc45f6ozFBsJ7q48QNIe6z5TBrm0Ik7dKe+1nk229Oe25
	RSFzgdmU3aTpe0g==
X-Received: by 2002:a05:6808:13c2:b0:4e7:86e1:7e25 with SMTP id
 5614622812f47-4f52b3b885dmr857032b6e.65.1790901209465; Thu, 01 Oct 2026
 17:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929025414.313641-1-kyle.switch@motor-comm.com> <20260929025414.313641-9-kyle.switch@motor-comm.com>
In-Reply-To: <20260929025414.313641-9-kyle.switch@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Fri, 2 Oct 2026 08:32:53 +0800
X-Gm-Features: AclHuK-S11c8PrkNEL_RkSTGvJlPdotZtVOzHYvX5zldJmk5ccsB7b8ftdaa-Kc
Message-ID: <CAAXyoMN8KsnY1RsR-YGd+mRs_R+QrzXMZVHxGavsRU8PCS05ig@mail.gmail.com>
Subject: Re: [PATCH net-next v10 7/7] net: dsa: motorcomm: Add support for
 Motorcomm YT922x
To: Kyle Switch <kyle.switch@motor-comm.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com, 
	jianmin.wang@motor-comm.com, wei.zhang@gl-inet.com, sijia.huang@gl-inet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 10:54=E2=80=AFAM Kyle Switch <kyle.switch@motor-com=
m.com> wrote:
> +static int
> +yt922x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
> +              phy_interface_t interface, int speed, int duplex,
> +              bool tx_pause, bool rx_pause)
> +{
> +       int ps =3D ethtool_speed_to_yt921x(speed);
> +       u32 mask;
> +       u32 ctrl;
> +       int res;
> +
> +       if (ps =3D=3D YT921X_SPEED_INVALID)
> +               return -EINVAL;
> +       ctrl |=3D ps;

../drivers/net/dsa/motorcomm/chip.c:4500:2: warning: variable 'ctrl'
is uninitialized when used here [-Wuninitialized]
 4500 |         ctrl |=3D ps;
      |         ^~~~
../drivers/net/dsa/motorcomm/chip.c:4495:10: note: initialize the
variable 'ctrl' to silence this warning
 4495 |         u32 ctrl;
      |                 ^
      |                  =3D 0
