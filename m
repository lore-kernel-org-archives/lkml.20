Received: from mail-lr2-f24.google.com (mail-lr2-f24.google.com [74.125.230.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D928440A2F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790579068; cv=pass; b=n49rhCSmByunWl94kk8Q9UV56rvTSj5rIUXZV+2Oy26jvntC9c+JjQIfS8t+BJMYIFhPnJGqOIjGEn/oG57P884baXayRru20AGGRLFAkEdypgFxxINZKNQncnWAch8iTeJOItcdi7mJJmmd6SLNJRUDKDuPykKN5BirWnHYHTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790579068; c=relaxed/simple;
	bh=gpZb4HIT9lQgl71Mws1ZUbxCVnXNihqgKuERH+ysVlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+4zrPxHIUCNyTqv/uLEoLTQMHK3IIJgQ5w/8/2zvfGUZ4zjIrfDD/sAbVTs9E+ODwBc81mHj4OElc/JapzAf3BQrCixTdOgydIm+xcPRv4fGuZ+i/AaSNhG/Hmd2vyaeWkF8gxrBUysxtfU0ckMscw9E5JNtzskjhzfBO2QkQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlmF54x2; arc=pass smtp.client-ip=74.125.230.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlmF54x2"
Received: by mail-lr2-f24.google.com with SMTP id 38308e7fff4ca-3a64dff7acfso24370791fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790579063; cv=none;
        d=google.com; s=arc-20260327;
        b=pXhmoKIfMmurYxt7+sJ5UIgjxU3hNjy4Pd7FzAhECVXTiK4THHDC4ppEk7LMH5ugpv
         8H6/JBHjFA3HqyczlIWuvg2ISzeIWRJS7EAcS9dNXf+OoqZAkPbIwPvk3RPbC/5p68cS
         DFgmAUoudefxgmhAPo4GY5rw+Evqkuj0LIYTsAln/Ji/lUSVDG9tieAyb0l+F7/GuF/U
         2Ga+pDgoPcrc/LbEm+FUnd+gkADs34qBhfl5aMx7EXqRLx6bY4XK6Sz0M2wgs+YNrT98
         bUlH64AytALBOrf/Wr1vepV0EYlS5RJNnqyIor0QyzgUA8NiouA78j7IvGwFd3gX928w
         1IJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8fmUSDAgYoEUGpnG4dyr2raLElAF9zIG7tCsXwnwAGw=;
        fh=0V5YfyxWWFozcS6iqomD2uMcnOvYQi9/1VN5Udb+F0Q=;
        b=h1OIxZBPYnUL7ER+462yJSCgC63Tq1mgwXnVJ/SVaj3z4Pyent4sK8ulDoDAIuy6Oi
         9pyWUW4jWOEMbYgEy4WEyLRKDRVSIPuixNPKkz6NBs3SKwqgJsT9IcR0u7ahkpAOp4Kz
         UZA0caUFr9tPNbN61cVHnYAgBArCaObS9GK6pl/hiJKr824gO3I+X9nG9yxEXaMp6Xut
         mU19T7eylhgTTh6DNVUmEjz7sBAdfLnqIrLhdzP4M2dRCWSwHNCLLq1+VjItzBk6dV1u
         QBBbM6Z8tNDYzGnYG3uEnnl1pHXX5co+ODTp1qjlAVT9hWDhGQwzYuew0CwqD87frVow
         bEIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790579063; x=1791183863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8fmUSDAgYoEUGpnG4dyr2raLElAF9zIG7tCsXwnwAGw=;
        b=MlmF54x2Kig/8jfHKe88EK0h81APiUWcYZP/z8V/l93PA5K76PPlP8wPYjmp9YAOTS
         xPd4vk0FgwLQI8hCpFqs2aUJWNV0j956jXMwnp24bAxj5nKMhdW5sHCNfupvJELRCb0e
         dXNODSI4FLP+6aAwhadHnnuWI+0Crr4nFwbyHPQglLTKZ0mPXkHB+5MEBskHRqdReMvq
         4/hyIX+NZKkReo3nKUj2+E5512zKavqz/SCNl69H87kkG1fETh0WgK338wpHmD4CIOQ9
         qiSoV6FCKz/tMw4EvGQT3xR8VPGocY1suIU4FwAMgE3qKZfOocQkzfAhIz7hgpjYMBLT
         RR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790579063; x=1791183863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fmUSDAgYoEUGpnG4dyr2raLElAF9zIG7tCsXwnwAGw=;
        b=pyI7qU9UTSxv9BLQZS9bY3LZGkaGlh6AczPOyqGO7bLAF35Xzm5zrunGmLd94F/Aj/
         opVqkEwFi+2bzXiSX4S5tTdy/5EPiaHZgnx/Xoy8euxid4jbTA0jv1SjkcmaG/hoF28h
         nhQ4jkhuaG2od+edghS9oi7CASU4PYmYo1acR7zEMi965fZFAxvu/7U900vuEqdbzgt0
         HYwwUvPc0PMSBpP+xKKoBJy6LL0HqI6tvhg/CtCIjGCCrZwWfXLgtaudVnNgWIcC1ilp
         WA4lpDXBql2uwEH+GB4051DkKhuWKk8mUt1q3g/3XNCeEbDS05MGAHh0D135wxb42X85
         7mcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxObuU0u38NBHolxt26DoDNAkUazy16wAUUcVey71Gy9BIHqJexpVintMybDAsw7ditVf2nicp7fovXpIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOzzxwxMgtKNAc+1ALdHnjX3Tjkw52EdplISTz/VJ/8PHzRBO6
	sokvQS85GSJsIZEPzakdbL3Mv3tQzHvdIt+qvIaVrtOPQa8ldsqPeyv2rF/8sY3c8FRiKl3qm0e
	eUN9F8Vpue66kEc7LmGDFy+UtasAywUM=
X-Gm-Gg: AYBFou2MPZv8UPHe08CkZUK8G6cBcmci5p3qjBJE4+iazf4y/tV2w45NVpg01r2hiAJ
	UMRp69sqGpxOAaChujdz8BcH+dYSuQOxWwxjttICSFmPmLKieDdj/J7AF/ZEderFVbyVe1VImF0
	6lzSQDxZyC6DGrXEsQVS3LlNeURxIB58OsA6TDL1L4R8jdsynUS2NnfSUMdMA/fGcnl6mRFG06J
	1PKMKIL0xtyuIBkqhAYV8ZFdvzQ7WjBHQ6XC3MNgJLLA5T/+JC1UDHO74NX90YqRnNDdLCu/NzN
	V6Cf9gFDnKIeOPGmbrtp1qUVaMtwjVCAyPlgQa+TU7zJ88HpJZPeIQ==
X-Received: by 2002:a05:651c:1990:b0:3a6:16aa:23c4 with SMTP id
 38308e7fff4ca-3a63c435595mr33846191fa.26.1790579063267; Mon, 28 Sep 2026
 00:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927073843.346910-1-maimon.sagi@gmail.com>
 <20260927073843.346910-2-maimon.sagi@gmail.com> <6ab4896c-c4d0-499b-befe-045cafa8e470@lunn.ch>
In-Reply-To: <6ab4896c-c4d0-499b-befe-045cafa8e470@lunn.ch>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Mon, 28 Sep 2026 10:03:57 +0300
X-Gm-Features: AclHuK_wqe69CS137GKI_RXY7GDJiYuGuITU57U4UyfMY3zuTBaG8dDbNTOU8AA
Message-ID: <CAMuE1bEvTE5-MyXyP8Y_qekXEk8Uf0QUUFJ6DfFpc89TdYd4rA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: axienet: use device_property and fwnode
 APIs for probe-time config
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux@armlinux.org.uk, 
	vadim.fedorenko@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 8:55=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > -     lp->switch_x_sgmii =3D of_property_read_bool(pdev->dev.of_node,
> > -                                                "xlnx,switch-x-sgmii")=
;
> > +     lp->switch_x_sgmii =3D device_property_read_bool(&pdev->dev,
> > +                                                    "xlnx,switch-x-sgm=
ii");
>
> What version of the core is being used:
>
> 6c8f06bb2e5147b2c25bdd726365df8416c13987
> Author: Robert Hancock <robert.hancock@calian.com>
> Date:   Fri Feb 12 18:23:56 2021 -0600
>
>     net: axienet: Support dynamic switching between 1000BaseX and SGMII
>
>     Newer versions of the Xilinx AXI Ethernet core (specifically version =
7.2 or
>     later) allow the core to be configured with a PHY interface mode of "=
Both",
>     allowing either 1000BaseX or SGMII modes to be selected at runtime. A=
dd
>     support for this in the driver to allow better support for applicatio=
ns
>     which can use both fiber and copper SFP modules.
>
> If this property is not needed, please leave it as OF only.
>

It is not needed here.  The X2's MAC is wired to the FPGA fabric over a
fixed link in "internal" mode, so there is no SGMII/1000BASE-X switching
to do.

> >
> >       /* Start with the proprietary, and broken phy_type */
> > -     ret =3D of_property_read_u32(pdev->dev.of_node, "xlnx,phy-type", =
&value);
> > +     ret =3D device_property_read_u32(&pdev->dev, "xlnx,phy-type", &va=
lue);
>
>   xlnx,phy-type:
>     description:
>       Do not use, but still accepted in preference to phy-mode.
>     deprecated: true
>
> This property is deprecated. So it should remain an OF property and
> not get expanded in scope.
>
Agreed.  v2 converts only what the software node provides: xlnx,rxmem,
phy-mode, the MAC address and the PHY connection, for the fixed-link.
xlnx,switch-x-sgmii and xlnx,phy-type stay OF only, and so do
xlnx,txcsum, xlnx,rxcsum and the "dmas" test, which the X2 does not use
either.

Thanks,
Sagi

>         Andrew
