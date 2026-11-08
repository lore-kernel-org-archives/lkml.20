Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794155070;
	b=cufM65P0F/Ia1ITf5FtLjDDFOseybeCsvbIwTBtu0T8gdaBZE5D3900SMqLiYw2e7kZc
	 IVv0eRncnQCq1Gh1VbcJqYa2M7iKcLnOewqiK2APiyYFt551iqdhpZ3HISHZ+Isp21PTK
	 K6s5+qj9lDLzp/VFUPANmBxB1GgL4BcUR+c4Qs5YMBD4U2/CnivNwybkt2JehYh5mCpTI
	 UJVv9MgYifu0EBeAIChwUW9D55RXlkZVc015gc1Ku6HZWU/ZPqYzmi4JaaUWVRbM1AK5M
	 K2qCXXK+VOEwnEt55MpQx5wLJd0zZxu87VZFL6nFnHzoVGv/zs18G+rqmrtBKd9LHkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794155070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=827oxpvjkWkctgQ6hvzAoUN7ol+XidN1sTe8zrMicvY=;
	b=hJOAvxdcdflqYLGafAKthlDnStInvcNV30sxxzUTeBDTo7jlSUsJBXF9cb1KuLH6jpjM
	 As00URenkaRhSOlwx1g+wVavtfml/Cm2u1hJMuUuMy4pWwaGYAXios7JPemnjMYB04oig
	 CSY0q9e0441ELfXzjJNQRQRqHCEWwV/XNVryQlCv9/ome1W0+j1Etg/6/0gkhbdgUMcjg
	 CYQDnYoZkgSxkXJnXsenHBZy/dF5BQWojVL0m4iVr1FHe1maabcvNgl41291Fh9ajBblK
	 uUCUde/zJZJeeXnsMEfzonEHfDbwRVyunp4+M6z2VM+daIovPZj477DgeV3SmX0rEXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMXVqYdO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B0A606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B0A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMXVqYdO
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f8cdd30beso388089eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794155069; cv=none;
        d=google.com; s=arc-20260327;
        b=izVyN6FHIFrxe9Mzgvq+8mTYHIp8Jee4Ljzm9gNYs1GsdcnIZAhMuGak76kJN907t7
         q1iqKjLpGOKxZJcWYWtgpqLxDyno7NwbhMMi126SCFBcfaPcJhOvIg9KvihMyBjIP8YB
         yVcNfuFl2+LOAqKn3WtySHz5i2BeA1WyE4BuOm5MVKkg4Ni0zfCyma4SGHjTTyz85Cou
         q6VmOg2MrWpZ6vn0b+EsAhQxSPyMpkq6f3cR82dkq0BIEFg2ZMUOiLdB07aML902pxdq
         varDr1Im4b7fXXblgcGsc1iHI2hutJ7Df4BQTILTKaB3cgeYTYQyeHqSSTpv65M1WdEY
         V21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=827oxpvjkWkctgQ6hvzAoUN7ol+XidN1sTe8zrMicvY=;
        fh=vDEOv9GGGrjycyI6Y+71631mEUy6hYi357qvTqvJVFg=;
        b=HRr5WA4RPUWE7jL9TkMlDMoqo/5M2pMvm13pMsm1Qqzgz17E+h/i2+qt6XiJpyLe/r
         Xl2TAiOwH1F1Y6zp02qHSTKJswOeVR+5yOQrtDFD4DnB+BxriRE9KxXybs2Apm2ieQ85
         U3KgL6VTAJqwdzhF9jGa5T1ZB7Pdc6zRLY9iL/kJGpA1VbkxCdthefG7JSGymj9E102O
         A3h4srM+hNbU7z4jhT9QoU3XUGH8lcTHxTuJ7ba9E5J9szPzgHOI7xqpm/USFrFAAptD
         v+8nKEfj9ycoTeLXOSD0RlxgyF11MrRlDjPwxFgskqY634/porjZndnBlS4ID3nsujse
         lrIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794155069; x=1794759869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=827oxpvjkWkctgQ6hvzAoUN7ol+XidN1sTe8zrMicvY=;
        b=gMXVqYdOKGpeE0ZyIRfHSoSl4oQjlp+rLnHHgN7y6RqM0iSXx+fcjMcTa17sWckAKN
         IIc1cyk2peWpn3tJ6uNsLR7111ZwaYftxcCBHTi0AmkZx1K6eXf4FxiYzIPg2nv9KMRI
         ZuTBY+t4zdV8xoEasqGLQ/uVOxC3yMx9DvYiwGmpUauaRNRrRlZWC+zoIrJAWM0Un3nZ
         Il66GfLmzNaB8mvc/yOavt2SpDKwR7Mp3oXmXudr6WXZGUIc/cRx8dxCbuyPE9rrtyja
         IVpGpmfSVE5UaRwcCVbnX+j6uxUTVGksb7/OyzorFiMW/Bp6Lq/zOmga7pAspVw+cJlI
         yqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794155069; x=1794759869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=827oxpvjkWkctgQ6hvzAoUN7ol+XidN1sTe8zrMicvY=;
        b=asMhQMV+P8bHfClGqz17XizGkz5wY8DDSETqQip7Z+4+w7Z5NlW4ycpG0Ik7J8TTch
         w/hTfwr7HCtkG18Vy3ObuIUbwjGZkrL/W1fXDr7S5frxD9uMuKnQJG5NG0crRSBBuCH7
         PcDILrzwJTMurMcBqHfSEhO1eHpR5srYm7LjyGXDrHTvJLmAuoNBqHyuDCSuZ7HKWfMI
         Ee+YhvMfqCddh315wZH5/6zkB3uKRPLdaC9EdAwcEbqqkVG556Yz+k8XTPS5LskwKi3C
         m9MCFw1Z+NzwSgPjEzQzkH7Ub1WY1bTpCUgvfxCebdSt1y4oANTxPfYyRmK04l7iyfIZ
         TAmg==
X-Forwarded-Encrypted: i=1; AL+hErG79r7IpP9WD1ZkfQTCLrgH6TciaVeX/tLGK6gSeGUCDZp6U80/8C1sCNDTKqDXeZtNZLsjnd/HXOckXA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xoJGBT/RQdr8xJc9zBPmuHqTdmFQ9L3J+HAiq/ujU1KmS6Snn
	b4fInGZqmzjR6MeIgv+MGhsaRLziQF2LOdWEy+XGrbbTyeAXExM/bKwe1V/BRdfqUCPZNnZDn9V
	b9CkEofeiKTYWYy8ecMN6w19uOwpM/ec=
X-Gm-Gg: AYBFou3R1GbIBffay6u2q/XR1vr+beU9fyuR42v1lVE4okWSwhLFSNBvz9EEv9hJhfe
	2sRkxRnLoY4hoh10Q3ulg4Gbxek6GAuZTpCAZFPt1I8KgnuqyXPrbvGsJAkVteFnEB0sWgzvMZ+
	clUZFHQNyZ3KaC4LDqNVkfrN8jkH5IecFqFdn5l3e7wZuSf1QX6Gr896SmcMCkSszixu6Oe1/2U
	elncuRlPrNJ6DP5N9JeigW2EGxbcQRdGwhMYwfYiV/4gIlGphph68ICrrML1Tb7atcsK8AEjDsd
	E1BFnpkvUiZh35Bf+MzK1SovSqiZWR9yaFUJ8DJyIyJBSC8NhrZ3/UwYDFiWYkdStdHe7adQoLh
	w8PqbQyXw8fWZx/ZRG2S0GwqNTDDsOERneVSelADWaNXpd4HmK89rEWfYF87aJpowx/mnuO/yJS
	zHHtRELasoN07AcPpSW3fgyUsvieKaxA==
X-Received: by 2002:a05:7301:fa8:b0:369:fbc1:89c2 with SMTP id
 5a478bee46e88-3725d781c18mr2866533eec.8.1794155069181; Sun, 08 Nov 2026
 08:24:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108154241.198160-1-huggek@klattorp.se> <20261108154241.198160-4-huggek@klattorp.se>
In-Reply-To: <20261108154241.198160-4-huggek@klattorp.se>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 8 Nov 2026 18:24:16 +0200
X-Gm-Features: AclHuK8haPGhR5EbzUiUC7sL-4qlDpHLHWGRvVtS9CSkjnJVx6gK3zrbS0hvDCw
Message-ID: <CAPVz0n2dnuiC_bkMTTtjQyQJfo5o-t10LrbR9mQ0Ew77bhqvew@mail.gmail.com>
Subject: Re: [RESEND PATCH 3/3] power: supply: max17040: clamp the reported
 capacity to 100 %
To: Hugo Karlsson <huggek@klattorp.se>
Cc: sre@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	matheus@castello.eng.br, me@iskren.info, krzk@kernel.org, 
	m.szyprowski@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 8 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:43=
 Hugo Karlsson <huggek@klattorp.se> =D0=BF=D0=B8=D1=88=D0=B5:
>
> The SOC register can read above 100 % when the cell is fully charged,
> and max17040_get_soc() passes the raw value through, so
> POWER_SUPPLY_PROP_CAPACITY reports values above 100. The ABI defines
> capacity as a percentage, and userspace that rejects values above 100
> then shows a full battery as empty.
>
> Clamp the value to 100.
>
> Assisted-by: Claude:claude-opus-5-5 [Claude Code]
> Signed-off-by: Hugo Karlsson <huggek@klattorp.se>
> ---
>  drivers/power/supply/max17040_battery.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/power/supply/max17040_battery.c b/drivers/power/supp=
ly/max17040_battery.c
> index d93c3daebb..98574dcfb5 100644
> --- a/drivers/power/supply/max17040_battery.c
> +++ b/drivers/power/supply/max17040_battery.c
> @@ -14,6 +14,7 @@
>  #include <linux/i2c.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> +#include <linux/minmax.h>
>  #include <linux/power_supply.h>
>  #include <linux/of.h>
>  #include <linux/regmap.h>
> @@ -210,7 +211,8 @@ static int max17040_get_soc(struct max17040_chip *chi=
p)
>         if (ret)
>                 return ret;
>
> -       return soc >> (chip->quirk_double_soc ? 9 : 8);
> +       /* the register overshoots 100 % when the cell is full */
> +       return min(soc >> (chip->quirk_double_soc ? 9 : 8), 100U);
>  }
>
>  static int max17040_get_version(struct max17040_chip *chip)
> --
> 2.55.0.windows.5
>

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
