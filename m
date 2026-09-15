Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C3D47CC64
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467969; cv=pass; b=Oi+8SuahoeauMmHiCmeqvm2JktZ0cznKhUkCc2yYYquTsJnX7khAheoMCPS3ASmG8P+sLwpNKClWoWa4w0oFaAGqFxzNnA9ioCg4zO37HrDUkZyNisQ9q6485jMpQbQKPwvL6AeQrszq5HLJ21vGtpHazQRzDp+cziClHIdelns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467969; c=relaxed/simple;
	bh=JBUy+nz8yoNC+BZ+++kswfX4CT9SuhGl69xtoGeYccI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtjnyiWMurxFbz5WCQnYiX5lud7xVC8rJxB3zlzOPfv6YhPZmO8HQ6uZ8frAUlSPvnxiefXciP6T3Ak5tWJN7lFNT8EQZ3IcRhnhTMz01CRVmcqz1cwre6CLJZvMPAxe81ywcZPL6znBFrYwoHfPNhCILVF7Me5UhDeccsLcqWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDeeb4TT; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDeeb4TT"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91235f46716so4851316d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789467966; cv=none;
        d=google.com; s=arc-20260327;
        b=EXEPZ3iYi18P/8IlxVXhaoKLLykJ/1SrpcGIjIaq559IP4V7ib8JmDAYTy8wv1SBqF
         UQQZ4lnlAvVvHFR4TSew6ShuFii5Mxula5PQKIg6j8T7zEkliglln0jDofmPt8UvVqkj
         7i2LhKZ+5TitLBLXYle7pcWs+12CuT4zir2sdqcj/I1ApR2f38r7KaOCwTFo9Rz2ZiFp
         whC8HZfcN5mA2nvt6gQthK4Qf0ldyQK/Em0MEOZyrbmQsb6e+5anEJICogolx5096k8H
         YZE5OvzCqY8I3YXYZOtMQWBk8G1BeDX+zSsWAYSaukWUE+aVRZJ4VJdJTwzUULxiWLMA
         wKcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TmqZCDgFfpZ8cNrOODbC41NVyTbNreASHxYyKCFmeq0=;
        fh=Rl3XktDGdLZrTlAWGnKqCy9IMmsMePmZ7doHBO8HKt0=;
        b=g3vZTgVl+PbruWl7vr4BuD2Sgl7bFSr/cfLn8ZYhr+OagzhfFG4c5nyo21NueTHyhc
         atZB7cg3ZhwwZbXlzGdo1Lnt4AlqcdVF15wtew2QMsuY5C7Oab6Yf63QrU9TmAX8399g
         h/crZNducWU0qsdrsBWzoCkNZOgCLJMzP7G94bIdNn07+D4DxxPNfMznA8uhwBpLcZbH
         mXLltCmr5vrvDRK7kDzBBPbZ09bMs19xPi2BaQOhU2mLPp//Qqccp3raYIHlw8/qThd2
         2AtCf+p9zmxtP0xz1rZEq5X1ih76jF1IiB4Q3AiCJpjd8WXDmgel8A0ewEsq42vCFMEB
         Bjow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467966; x=1790072766; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmqZCDgFfpZ8cNrOODbC41NVyTbNreASHxYyKCFmeq0=;
        b=jDeeb4TTmliDBWyDkhBxUQ/XHnCS0QKZvC65IAMifHD4q1oUfOho/THOonXqg+p7Np
         E28VsyDwBPuuaXEMNwAjapDB3aXXSMW4FARVzt8v4mrVeefS8WU5DyrM5jVrb/JBWeIQ
         YhkDMevzzlb4lvWLj7kB5+jvZ87PRT0uM0iOhGxqzUsJ76Yrd3rUTfBuWMVWDE/ohj1Q
         v1pDp3ouiORLcie65UTh4msG/vEKed3cFtHOZx5vooM9gOQaOoBPLqlxU7mqvjF5sfff
         gkGYItt+qdsjr6aqvWpLNRFmQcJt9gFEn4P3T++YLHMMt9ULMT9DrsrHwp4U1aKEY5VO
         Grag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467966; x=1790072766;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TmqZCDgFfpZ8cNrOODbC41NVyTbNreASHxYyKCFmeq0=;
        b=oYembF/qXkE3JfAii/HTeisb0PD2hS6kA1NAJOEkKLp4J0KxKIFcfqTnnLaUzxFEnp
         lctV7/Bxp69DR0RKOj2xjuvD2pZ0DKy0uUIIS2EgFTRmCSQvGE4x3TsbkJoxN49EljOE
         vc0v83aiZX7CALFLeXyxLHW4vk73gt9GGGV5vCxlX+b5ixd3sNWAYZEiRDiNlYkfTfFP
         wuc/ipb3IJnNiWyGIhqtv0epE7QEaMz/AWpdowIYxVVknuCjAVrQk3m5LyjKAbGJRNt6
         1YusLWH/jYwHBIbEXU8Okk6nJQvDNHbBdxFsBdcwCQZSVMu3Hmwh/vw2ltNxu6YkepgS
         gEDQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8zaSBzYlIE+g7X+q1WJU9DFKPLbUPIgP7kGLpXmuq4w1C8YAWpXno1L3cTFzSLY72Yw54/nFCVDxpGKg=@vger.kernel.org
X-Gm-Message-State: AFuF++mmWwvdw7ixxAcq9IsGHKk7sBMCE5lKMiv+nEeEoqGBSdDNsuLY
	mIwv5RW3m/bozrjL4AWzlQxhx2ZBM4WpS6WGz2eR5iFUqV1MHA2gWbKphEeJqR2ueRgtnm+9PEh
	2aZLeLu56bESYeFzsz4Lakl1VbxWtoj4=
X-Gm-Gg: AYBFou0SG86CuHQr5jBiU1tUMCPZe9o49cEY/DzihnOfhYqKB2oMMXTDbELjbxi2C8C
	z6VX5AhkSf704QuIjtiSt9Mz0Y0PMlIr6xhfdieeFri/Y59HzcPWcW9qcTPkmSle+F4jIaJEGdo
	N81/NcPAB3r35TDkCzfmKBU+RUdCqL/o3fi2PBOT2SPvrzmmwovRtQZZSiP4hPu4l2MWJ7sIlMT
	TPy5E1jKlGx24nSVMO6d8tt0u6rQ5ThAymlt1penNCtVBq2Ao5w5jsjtuoYaexYVdy66eVDNkhw
	9Z4fnM9xr1ETxpRYCR48H89/YYas90d5FZiSfUfOnIsQenY1PHV6qYFmxksxeW/Rz3U=
X-Received: by 2002:a05:6214:6285:20b0:912:3162:523e with SMTP id
 6a1803df08f44-9123162551bmr69922176d6.8.1789467966144; Tue, 15 Sep 2026
 03:26:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914214720.2467586-1-donggeunyoo.kernel@gmail.com>
In-Reply-To: <20260914214720.2467586-1-donggeunyoo.kernel@gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 15 Sep 2026 12:25:54 +0200
X-Gm-Features: AcwNN1U-3EGl1dwa2s6HBcl5buSVBgdBb0MTb6m6SgGCBXYkYsN7vkg0bISTlEY
Message-ID: <CA+_ehUwT_RYztjGJ0P_czx++wxNShT3Zv3JhjQ_eBbaoGQoNRA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: phy: qca808x: handle the active-high LED
 polarity mode
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, 
	Rosen Penev <rosenp@gmail.com>, Sashiko <sashiko-bot@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 14 set 2026 alle ore 23:47 Donggeun Yoo
<donggeunyoo.kernel@gmail.com> ha scritto:
>
> Commit a274465cc3be ("net: phy: support 'active-high' property for PHY
> LEDs") added PHY_LED_ACTIVE_HIGH but did not cover qca808x, so
> qca808x_led_polarity_set() returns -EINVAL for it. phy_probe() propagates
> that, leaving the mdio device unbound and phy_attach_direct() falling back
> to the genphy driver.
>
> Accepting the mode alone is not enough: led_polarity_mode records
> active_low, so an explicit 'active-high' node stores 0, while
> qca808x_config_init() re-asserts QCA808X_LED_ACTIVE_HIGH only for -1. The
> bit does not survive the reset phy_init_hw() runs first, so the LED would
> come up active-low.
>
> An 'active-low' node needs nothing here: the bit is clear after the reset,
> which is the polarity it asks for.
>

The commit description looks a bit "dense" and took me well 2-3 minutes to
parse the english and understand the change. Was also the commit description
assisted by LLM?

Anyway more comments below for the patch.

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908105959.70453-1-donggeunyoo.kernel%40gmail.com
> Cc: stable@vger.kernel.org
> Fixes: a274465cc3be ("net: phy: support 'active-high' property for PHY LEDs")
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> Assisted-by: Claude:claude-fable-5 sparse
> ---
> v2:
>   - No code change.  Rebased onto net/main.
>   - Cc Rosen Penev and Christian Marangi, per Andrew Lunn -- they may have
>     QCA808x hardware.  Christian wrote f203c8c77c76 ("net: phy: qcom:
>     qca808x: default to LED active High if not set"), the default this
>     patch extends.  If either of you can put an 'active-high' LED node on
>     a QCA8081 and confirm the LED comes up the right way round, I would
>     appreciate it.
>   - Say why an 'active-low' node needs nothing in qca808x_config_init().
> v1: https://lore.kernel.org/netdev/20260912012819.2072067-1-donggeunyoo.kernel@gmail.com/
>   - Supersedes [PATCH net v3 3/3],
>     20260908105959.70453-4-donggeunyoo.kernel@gmail.com, whose
>     Reviewed-by from Andrew Lunn is dropped: that version only accepted
>     the mode, this one also makes it survive the reset.
>
> Compile-tested only (W=1, sparse).  I have no QCA808x hardware, and there is
> no KUnit suite or MDIO mock under drivers/net/phy to exercise the MMD7 write
> without it.
>
>  drivers/net/phy/qcom/qca808x.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
> index 8eb51b1a006c..68fd4d0fe31b 100644
> --- a/drivers/net/phy/qcom/qca808x.c
> +++ b/drivers/net/phy/qcom/qca808x.c
> @@ -200,8 +200,8 @@ static int qca808x_config_init(struct phy_device *phydev)
>         struct qca808x_priv *priv = phydev->priv;
>         int ret;
>
> -       /* Default to LED Active High if active-low not in DT */
> -       if (priv->led_polarity_mode == -1) {
> +       /* Set LED Active High unless active-low was requested in DT */

Why the comment was changed if it does say exactly the same thing?

> +       if (priv->led_polarity_mode != 1) {

This change is O.K but I would ask you to better clarify this. -1, 0 and 1
is very confusing here.

I would introduce a simple define like
#define QCA808X_PHY_LED_UNSET -1

And set this in probe and change the condition here to directly check
for the macro PHY_LED_ACTIVE_LOW.

>                 ret = phy_set_bits_mmd(phydev, MDIO_MMD_AN,
>                                        QCA808X_MMD7_LED_POLARITY_CTRL,
>                                        QCA808X_LED_ACTIVE_HIGH);
> @@ -603,6 +603,9 @@ static int qca808x_led_polarity_set(struct phy_device *phydev, int index,
>                 case PHY_LED_ACTIVE_LOW:
>                         active_low = true;
>                         break;
> +               case PHY_LED_ACTIVE_HIGH:
> +                       active_low = false;
> +                       break;

The ACTIVE_HIGH wasn't a thing when this was introduced if I'm not wrong.
Anyway this change looks good. The only problem is that I feel it would be
better to split this patch in 2 different commits.

This really addresses 2 different problems and splitting also makes the commit
description easier to understand.

One doesn't account the case where phy is reset, the other doesn't account
the mode in led_polarity set.

>                 default:
>                         return -EINVAL;
>                 }
>
