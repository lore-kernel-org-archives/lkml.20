Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144D750EBF4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541450; cv=pass; b=Pb+LPA+B3s70n42vNROQAtaaO0RBZPzgF6Zt3kl0AQkf/QTzWCvgOWIKhzPt343ENfukT3Mwcsk2bpPhAdtY9iux7cKzYIc4fRu4o2747Uy1FoxGo+Gns1ta/vEFJKJQJDIHxok6tD2MIPJfqQmJTJaocZ+/88on0ulPchscYjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541450; c=relaxed/simple;
	bh=1Zani8KVUN1LcbKX3On5KmxvOITUPxxLp5xuxtknAFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWRTmAAwmlc+pLoYE+N/f1dr7H1sTkvCgePktwxff3ffs09sXbG+R2UunuEYt8MsdT212IQBFapyrnNEVIqInpt0q1CWlKOvhNRqnEnUhvDzlLIgzIt3ir04Kooc+GUiC++0xs+pshPDwe+COJgs9V7/4mAPM8ox/v89kVJnHG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p68DyCcJ; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p68DyCcJ"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-46ad7304688so2215518fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788541448; cv=none;
        d=google.com; s=arc-20260327;
        b=puFbbpGZQesCCm/D5eSBE4qAdhNdHH+p0YDsxXedtIATXylCtKQr5Euw0sTzmCGE03
         ENoKDv63hk5/cGgxby2t/yxfqhokKLFTMw7V/QQmOMuCGBc3bYE2QZLEViOFraJP37RO
         7z+vob1rCQbCfw7tvC+mDV3RUZVYNMgddDp1bOpxenHNbw3VHwsRC52J+uSvCkDyWR1v
         NElloTdrzh9JxPrkeY6oxvHFNdzxUMpwkv4LX5o4MuNAxrXw1b4sPPRHpEqs3sWjPBR8
         KPXtHhK4XVIqhzEvYhpg3fPBUoENVru6nQ67ArkSWzMxjYrMh+Ybe1/kOLd8wrrGwpiD
         V3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z+rZ3J/l5NmsTe1xvBjQosJrBLYmVyGgJsZt6vb+Ldc=;
        fh=IDeKJHFE8qX3jWw1wsFUZOjqd0rPJTQkBfYNpumht5I=;
        b=Y/y6qT8t7+IDwyeTTMZGcDkxqrtwcToFY18I49943fsdmXP0vgxBeqc7I4Xf6MFGZZ
         JlhuP6OsdM/IiZsB+iMmu21b4xW+KVDpjI+SZmqzr9JJ/K4AD9LbrmGb7nFWk61JmeHX
         XrjwDIzqc8nzydipcPJK0DOGq6/H977KSlpsypgA0LKIxomFAZs6B4lXrx8BnAAI8NAK
         r8b4KMQq6QYjeL2e6RpxaJRvMd78J9DUhMee8F8E0Kibq4OwBx5Mc7q0gPgF6He1EIMM
         2tQnCF4eNbkaB6nBfiJjxip5nGTqtBrLa+QmhBYt+ANwsoPFxpNqgGvuNEliYxbU5GJm
         uEnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788541448; x=1789146248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z+rZ3J/l5NmsTe1xvBjQosJrBLYmVyGgJsZt6vb+Ldc=;
        b=p68DyCcJv9LknoRy7M2Hnz9V+i/TJgWi3e8F+tSgxKU5kInH88mHrOetnCtQIx7zQb
         9i2LZn3B5ia18JP/NNcO5Vq7xT4UR4R23u2MuTze+O9kO2RoqUaUpTvgUQ8Cu13GXBQA
         yNFWTEl58VyqZvkrDnGUIA4OonlJBMNra063njK7yYsBdA/M2R8We7MYYPyua5RPS4yf
         5tGBxxPqin5svAu8uO8G2IaH82hfX+n8Etllhl3e5QOtZScqyQhjE/dnC3Qd6WzXsUmy
         3uEI6STgcwbZ11j38RIsgZhtQ/D0vxFn/B2YsYU8aBzLps1IkDoTID3gtL0OIK8U8nRM
         b94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788541448; x=1789146248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+rZ3J/l5NmsTe1xvBjQosJrBLYmVyGgJsZt6vb+Ldc=;
        b=RGrFw47bzH72rbpxISEzaRZ3s+wWQ/yCA2reO2uK0pOXOX6WYdCFvasPT3UdvJuRvi
         JKaowgodAEn8DRpFgwl0gPMfB265VNhDE8upQgB59MMmaSFzpk/bHrae1AfgU+OhyGIC
         jk7AHgORyytg41NKTiZ2RohCpoiiud5qWH9vit9sjrIkJgGFa0hpRmhyTSngJ6UkGBTk
         lNebV1PSp61eh9DDugUjNw9NnYvZIJbOQv/qbVEzt8nqK5yLkMbkdoJD8CscQovyAxVb
         7rqFX++J4Bktl3znAnz8oVsA73KIRBqPopn3WgFg5octqFdleKwz66ucWCkEh2rqTqtx
         y7iA==
X-Forwarded-Encrypted: i=1; AKwUvBzYILFBEOy0xh1iixs3ldZ0h4iGU4/IJibMLXpAFHfkJydDYBWD78rlHBqixzU7IDLKQuMiOqy9JzoMo3s=@vger.kernel.org
X-Gm-Message-State: AFuF++mokjAMJNNGiW7Y0aCYeuv1aw2A3Hz2NjKh4wgcQXkoAUEXUNvX
	c5Wp2brlFk6a+MTlo/U1N6X5u0pCXkNBEvLkS4/vr7t9BC6DlkCfI0aIP9/Z4OuMeeAI2Mvh+eg
	oZbTBDKi8CecDcW33JJ/rPRI0d5qSyio=
X-Gm-Gg: AYBFou046o3IK0SR+NN24bOCHy7YA3dUY2keRwXmbNWE7h9s1V45meW1UXinVrlX1ek
	XGDbGSwv0PqcGx57mDvK9g6Hs7WdSlTd0XdLweDIsJYoJ1N/UhHm34GphVjCin36ZtYt719Opbn
	siUKHMyXhb5bnD6UxfPOpO22uta424/RMjLvJMDe86hUOyvga+ngIprpB+t2yuZCNBifqkq6LYz
	n6uReRsrwvEj7j+HefCFKCljNkNej6eiaSsZOjehlIYMSdyVTcDkVkkR7ST30lOeWo0VrzmD6OY
	Xt50aT/OhkpddHl10Fz0TdS4rrziVtP3UqB1mrYY53os/+yPbtDBuSTa8XNSQgrr3LRvmc0QiMz
	90g==
X-Received: by 2002:a05:6820:5602:b0:6b6:5bf3:e226 with SMTP id
 006d021491bc7-6b65bf3eb3bmr2532642eaf.26.1788541447608; Fri, 04 Sep 2026
 10:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904095416.1692962-1-kyle.switch@motor-comm.com>
In-Reply-To: <20260904095416.1692962-1-kyle.switch@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Sat, 5 Sep 2026 01:03:29 +0800
X-Gm-Features: AcwNN1XYLN1qFGsXZ4jRJsNWSBsrhdl5lpMgs3AOgGB-bLEI4bhHOu3Xla1pthg
Message-ID: <CAAXyoMN-RX1aY_isyajES5LgiDMp7_YTbM=jiS6d-8o2kKQXqg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 1/6] net: dsa: motorcomm: refactor
 registration path for upcoming switch families
To: Kyle Switch <kyle.switch@motor-comm.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com, 
	jianmin.wang@motor-comm.com, wei.zhang@gl-inet.com, sijia.huang@gl-inet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 5:54=E2=80=AFPM Kyle Switch <kyle.switch@motor-comm.=
com> wrote:
> +               .name =3D "YT921X",

nit: We usually stylize it with "YT921x".

> +       if (major =3D=3D YT9215_MAJOR || major =3D=3D YT9218_MAJOR)
> +               mode =3D YT921X;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(yt92xx_series_info_table); ++i)
> +               if (yt92xx_series_info_table[i].mode =3D=3D mode)
> +                       return &yt92xx_series_info_table[i];

Redundant if you use both indexed assignment and lookup routine, since
you know the index already.

>  static const struct of_device_id yt921x_of_match[] =3D {
> -       { .compatible =3D "motorcomm,yt9215" },
> -       {}
> +       {
> +               .compatible =3D "motorcomm,yt9215",
> +               .data =3D &yt92xx_series_info_table[YT921X],

Redundant if you use both runtime identification and the match data.
Also I'm concerned with early IO operations, although I didn't see any
incorrectness here.

> +enum yt92xx_mode {
> +       YT921X,
> +       YT922X,
> +       YT_MAX,
> +};

nit: Use prefix/suffix like YT92XX_MODE_YT921X or YT921X_SERIES to
avoid too broad names and future name collision.

>  struct yt921x_priv {
>         struct dsa_switch ds;
>
> +       const struct yt92xx_series_info *series_info;
>         const struct yt921x_info *info;

nit: Better to use const struct yt92xx_series *series for simplicity.
