Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D1A3F929A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887763; cv=pass; b=RzQmWWwMEgH5QIbHOHtV477b7zBaG13A7491IuE1ElwdKB8HlDy/azuDtUoujStDL5y9wcRGJpUuwefSUlIu5h8GcP+++EDfb7ZUjeDda7hRnutG0wDJu+yCoWowc4czsC9OEQQk78/mAx/cwqTI1NTh+3FM5dYVBeMew0M8Uo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887763; c=relaxed/simple;
	bh=ATKKoMBtvH+x+NnwXS+Q5BPcXq0fntwxaTtd2Uh64EQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Im4Op/AUL18BgMEMISPzVsgtz3XZClK1MuJGCfJpuN4X04c21L8raHui4vg+lsenbW/iqjgF/BiDp2chPXHCUb6r3cqekpj325q2Zutzi/IrvDqaz7qYkUcIuDVWE0Vo1Ohjn16SiVGdKbYIMRzG8rbltmeZlchErPEamoHSJyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr7pBV4z; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr7pBV4z"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2a4e013a44so412712866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887759; cv=none;
        d=google.com; s=arc-20260327;
        b=QPkbtiMEoLf73EcmRGzZ+mgW40UV9Dix8peEid3z2iOAEcsdyy67F+fzYewB+pU607
         w2ZpM+9HxQAYI0wNLPnYofd5Z+iAhoOJPdSSnSLWLD5Z5Fc6RUE3nYp//ukZvqQ2WI1p
         QipNCqLERURL3nWXiIzbKwukHMG8lSeWl33jpUeCuG5ZyNKDWJcQ7YFxFshOkBGu7Erh
         nR8xyMeBNtHer6bVPUTOeuNWrDOzSEOU1D8bt3unnz6FMTEEOfjVWMtpIWKeM5nsvPmr
         XWT6/bDQkB6SqhannU/+5MRKTNuCyyx97G1vzyXo+E4rX/fHvNPNu9q084j1bW8g6ujh
         EMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=;
        fh=pLhhJzIyRBwtKCPi1XLK2BLFwOJedFgW8+zAGtT6mA8=;
        b=FNFLTRXSEhidwsP4uS7hhXMNyNdamwp1cNEWDcWkZj2Z4XFxQ1Ncs003h8TApw6cir
         0/jTGl1DYXApSUeaCgZqEw878riIKPqQaM8k2l2ZGzL2t+myLmU9WL/Wl/xPbcEshHE5
         gD1GfQ/MrRDksj6bgM0NVPjvZpDVQWqNm8OtJ1Qp6TPt2TXy7BLKTCi0zPC0T7wrAF3p
         LbwKnOa/FvmjOYIf0EIOFVbs4xDInGS4yqWoU04hydgWSFDbxuiyy4GOXdoEoo06Tp/2
         ClSOeZhbsDOG2mifVabLLL5Ix+boH0UiAZHqMbw2/RpbWgl4yKess+TLEFM+/ZPE6I6A
         0VfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887759; x=1792492559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=;
        b=Qr7pBV4zhwHarFh0X0bLh3QNCgUKbYJ7Nas8wlDHrLY56Kuj4+ZiWvi+LMwCPVDwXl
         BSguCYaAh3Xm18xWVsQMWiflNd2YQKyEZCu2SZhA3XWAhB11Aw5jh2kk8hY7X2CH4TcZ
         KZEQa3EZ4yH7muY+Pfbd+I7xHf/QlyixiM5qkfdv6/yXDD2VnvCE1ZqVI/GwuunORnj1
         W04/AMRt/K5+PIzg9ZjDdTcUoJfWEz/XUP6stMORztZPf1kv1PZRQN1uC+pLhVuLzVnI
         Uvp5Q/yHLGhT07SvA6rre38mrAglovXFrOxPGRBjAiI4cTNDbU2sfKZKN2vgLOS3B+fc
         f/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887759; x=1792492559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=;
        b=AWV5Q6Z/HR/I8t03LLxFWPcu3cLicEN9FE8Gv5tiOrRiAvJWLu8jxvxlS0OdPUbhlm
         +ANMAHitfDX6w7fkltiJ+GDcfuztiFBl+EOndmkhP8/O/UrfkZ5r0rTu+yJl7P6kWvfW
         y/dBRWsDR6kPN1940HK1FAAwx61at6PwhTNWCR16D8zR59oltZnXPTxuXSrGqbSYW5BG
         K7SIZxY7VAMZA73K4yh5NQLMvDduBWXXXxJ8HxJ18sexBoksOBY5XNf2rC6/bUwj+wor
         uPLtcsgJ56wDRCZsSwGUw5C9FSJnayK1nvhYYRHH5DxhlyLklkKJ7HpE8HZX6rRJ0o6A
         cRGw==
X-Forwarded-Encrypted: i=1; AKwUvBxA5KgL2YvYX/eaOw+QBxJ//5YUzDXFYJCn2VzzgCa6JryTxM8G2laMJe71YfTIIJnAAUrjRCXtI6Epnyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlx6NuoyoAzi//l4z0QD8nliIRCXfUet/hk1miEYbnzfWQs87V
	Nd2g9NoeF6RlJTmI2/S63NDbUUhDo+nAqtM0sNQzco/r91I4T3UPzJy/een1KcTJpofQDb0rklu
	BwMODddhiPP4XYmCt7w59TSlquZJq3GneOC40f48=
X-Gm-Gg: AYBFou2BZX7Oc8xyGD/JQmASKyH2sTv2UsCCigcXl3xX3sBLmLxNQEgPbRmp+dRbdMO
	+GEydLnuZZdpbg1PdlpFHRQQ/e6wwRjfGfVK7fR+oIAxHnyt0yYBlF/PRITLF1sMr/CFWnXu4Xx
	nc5oOb6Yq76HPxgVOqLliAuxcJbqNhBqDzW2vN7wt8La7ysZyWIvRzJnM6XvrS58yII+F66WTnW
	UdGo3UqIK1NpWaPFtHlknEEL39/sYXltGA8/VXkotKMpiA/qjwZ6ilX+Plkzih2tEyC00rA/MRW
	HdZAIvDBdH5gRBkiYc0qZdgjEBVInGbj3cKeYRkdFKroGI8KUAjQxa96D5ajG1+eoqK0YtGQet1
	l2tpYbeWxhoSfSN2NmnLzhn0mLYNP0dI2Y/zbC3lyyYDFO7frrajfW88QlVeCLWvno4YIOJQJ9J
	nyqTZQmVuLBHw/nvm6RqA/iKfSqB/EYITTgx6IrYBsJn61NqJNizY=
X-Received: by 2002:a17:907:7246:b0:c26:19de:9adb with SMTP id
 a640c23a62f3a-c31a9d56575mr1092545066b.26.1791887759359; Tue, 13 Oct 2026
 03:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Oct 2026 13:35:22 +0300
X-Gm-Features: AclHuK_etHkgfHNMFVBnkCMnseRcVeyJYO7O0Oj_IyfMyFzvQ7RtNYlt2MPQbFQ
Message-ID: <CAHp75VdaDyfDL=34kOV0u_nHnJ+XXNwJU4=33v_Q8Eq=tHrYng@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] gpio: mxc: misc bug fixes
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:03=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> This is a subset focusing on bug fixes, that separated from thread [1]
>
>   1. Fix a race where the chained IRQ handler is installed before the IRQ
>      domain, generic IRQ chip, and port list entry are ready.  An interru=
pt
>      arriving in that window dereferences port->domain while still NULL
>      (mx3 path) or walks an incomplete list (mx2 path).  Move the handler
>      install after all dependencies are set up.
>
>   2. Fix non-atomic read-modify-write on both_edges.  gpio_set_irq_type()
>      can run concurrently for different pins on the same port (different
>      irq descriptors =3D different locks), so the old |=3D/&=3D on a u32 =
is a
>      data race on SMP.  Switch to set_bit()/clear_bit()/test_bit() on
>      unsigned long.
>
>   3. Fix non-atomic read-modify-write on wakeup_pads, same class of bug
>      as both_edges.  Switch to assign_bit() on unsigned long.  Also fix
>      the bit being updated unconditionally even when irq_set_irq_wake()
>      fails.
>
>   4. Fix a race where devm_gpiochip_add_data() makes the chip visible
>      to consumers before the IRQ domain and generic irq chip are set up.
>      A to_irq() call in that window hits a NULL port->domain.  Move
>      gpiochip registration after IRQ setup is complete.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
(no need to resend for that small issue in the commit message in one
of the patches)

> [1] https://lore.kernel.org/linux-gpio/20261011-gpio-mxc-cleanup-v6-0-cb4=
7ce2ad758@nxp.com/T/#m49d6a5a14a64774eda299bb711c8d316681e652b



--=20
With Best Regards,
Andy Shevchenko
