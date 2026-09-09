Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1B857F731
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970747; cv=pass; b=uZW7MXAR1cay7tQGnZ+I3u9I61cpCRJYxwLBO+aV2o3jv4guYDSijnlEWObs3STq9Vabo8ukzLV2UeA63aPfIhhfK4Qw3pfKXQB0jbbUVqjlKWJSuGBbq8YoLu6AL8kaekEIzUc2XAclIYKmRMVQkaMFigJboRPUI5y/6Mu/r3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970747; c=relaxed/simple;
	bh=jNYZ/e9tA0bZ+daU+gREuhraXiyCzcdRSOIl2qdMcWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rn8sciuRmoKB1z5HhECoWpHwWOWbBkS82eoS64ruxhkQbnrIz/W5d5KG2ghBiXPrtAoPBGytIpvsgHEUmw/wUsTlWtThVo5Hd92AjsDV4rupWc+WZab7FvLv55znQsk4b9gA5bqdKtMZL4qw9vFOErPYhwNiNa01lGzsM1d4FYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6m3Pr6V; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6m3Pr6V"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae716892so553889eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788970745; cv=none;
        d=google.com; s=arc-20260327;
        b=ecmmoypLaXBJmxFZm/vsbUnvJxqD+8d+6f/JbJfYC8tv6CAy+nxW85/ouZe0agLbnx
         2gurH0czhBEBk9a/YqKTII6SrDZB1P18iT4W6ZYlRlv2Kw/w5FefEMd5fvWHnbi/CGXH
         DEroGSZRc631+BW/AzxkLMB5X/HcLPZJd+533B+LIA4QgpLZ15ct2Z68HaojGgeHI5Ht
         8XGRMy0YIhSyWRQGqPhZKk3W01I8pwbXuj8NfiviTF29D3q18E3WAwa06Pi08iL7BBwt
         GIcAiKdD6y9S9UvHxiBkStvzSajzJ4s8u17oe1qrFcpAmYkTzsHfRVJTIQLJapASIm4K
         wmCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hAUbchDH9m45dgmc18rC+fxqU5ICx7ntiYK3bF/7BEw=;
        fh=d4xZGfcFhOjWRfhuiPREeiByUAtvDuewYwSZBTu9zGc=;
        b=F/QH72t3QkmhKFz9PeNfnWrkaoVfULj0IJsrR7jp/QaeSgA7tGk0KguIiSQAcMm05P
         7sRX5auyuVKfMTEYKzjt2fFri/wqei1z/Y0sH0CyG3LUwpEC1RlNGIZiOoD3tx67NdHO
         7em+fvGss3a3Pny0CsmNHXXlViF9lhrS1VrJ6lsnLtv4AVwrv5z2xmmp5wH24VrHj6gg
         amzkWu3vVgbHyfDuG0WXf4Ngz7dZ4TXF1z54ePym8vm+53wg25cExCPReXq8le39W20U
         CeU0WE2mOpg9EZtzEY+U687/O+MjAsiNPVn1jJDSwy+MDj3pp9+fC+PesMrsFP8zRwlQ
         UDEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788970745; x=1789575545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hAUbchDH9m45dgmc18rC+fxqU5ICx7ntiYK3bF/7BEw=;
        b=X6m3Pr6VVhpvjgQjK1nepn79bcB1/ht3RripIDXTwx2TBUxQxS5G7l8KOqZG6nz/Zh
         FwXiJspPnxBqgbcBy25r0esh2HHyE6PsPsdEAN9noKdHODPXXHf8wYONY77oC9bW56LE
         C+n/2PuxOXREvykaeuK4KMoNDJ2BIsetvftganLOm5gcZv9M0El7JR44Ta35L2WoYHzb
         52Rx81HUPylSk0wxvYzqS7wyI35FbqcvWPitoghVZzc3/V+lCWysHuTQplqDoKMYm1I7
         NizaIIjKrA/YCMsgzq8a7SL0BOyJG5jZTPq+8UxCJzQMr9/IdFvKuPfAF6DsXUzuHveS
         IUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788970745; x=1789575545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAUbchDH9m45dgmc18rC+fxqU5ICx7ntiYK3bF/7BEw=;
        b=llN2DAT+eB0sEc68OUXc+AFEYDxcOcmGmEGveSyh/K7YOtjoZ+5glF9ksMdVY3pXIY
         /aK5jXzQj7+rhBmfMS5Lo1y4JYZRWHGiKPclbu7xBtDDfuTMJn43TAW8qqlB8F4pwQu+
         MTwjrsxGVHddxTJpL2d8zUhvLR255KszNzhcwOEP63NrYOcx30vUgInob0de7AgouhB6
         kFzU8UeHWgTsbtHsPREI9SulB7/9LjJ8/8cnpKIxj4lwT3tNqIUmQXXzmXDfCRa4EcT4
         HMPfS7zsiFnTBLN5Ibv0dP/4xivLAUFjLi9la6rT7GbhR008vxAkDLojmMurN8sOI/xk
         5PXA==
X-Forwarded-Encrypted: i=1; AKwUvBw9h3KA3t5T5huvl51KqiDYJXxZJsIxWpSXzueJi9r3E4mLJdFP0YzlXZ8JHD7JQcSEET6Dl5YVnNJ6VIA=@vger.kernel.org
X-Gm-Message-State: AFuF++k5lACkw7GDKqDNtzf/xurHHBunerUVgdBER55KShHWk1//Q4pc
	3b7sTTO690tEWTrfGyeJPG1ZLKK4D5pPwrdomUWbamIMctkrDd45VNHaT1BSAFVayzaW/L9/cEb
	m9Sl9AAqHEAEUB3A44C2lQvBMx95oipw=
X-Gm-Gg: AYBFou1T6x9Kdc05Od6FIxhwEVEHKnpseiICphUrExv5WdRnaA/usnoDt3dEpp1Gdwl
	rlAZnZt05E51D6bo+u7Eq7WRK5Aa6a6hmMhGX0I+UzJzHq04pwkXfXcdkLvRGlBDHuc3mmTiYjz
	8nrVQkDCApCuUsTBIfjRIpWruAvGyie5aPCKVU1uVXBv/fEIEX95gj7ZhVDWNIwvRgsnmSXCsUc
	BtboU+8hOYFgOkYGQBeityyFpcC/WKbLx1QR9BocSCFLVazdLCx9cpxETDPU9kZcy/AjZKxEfGn
	Sd2Qj2iI5bqrH0n2hWAXaopbNEuSPxFvkLchgquK3K/uxY15fF8lkeO4gaR1tk3XqZb1qB5Uqn6
	wvO5hq4PYCsoeIxFjGw6NBjg=
X-Received: by 2002:a05:6820:4c10:b0:6b1:62fd:3b4d with SMTP id
 006d021491bc7-6bdcc1a4333mr7206501eaf.21.1788970745040; Wed, 09 Sep 2026
 09:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908083614.2210505-1-kyle.switch@motor-comm.com> <20260908083614.2210505-2-kyle.switch@motor-comm.com>
In-Reply-To: <20260908083614.2210505-2-kyle.switch@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Thu, 10 Sep 2026 00:18:28 +0800
X-Gm-Features: AcwNN1WNDNfMVmBhvlW6uZJv5v4eYnI30Ge-2mYnVT8Vfeo53MpIQ6A1zZKhmlE
Message-ID: <CAAXyoMNkvyVN435bUwWuN+q8UmKbwnWbn+=uWt-nC2omBk94Lg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 1/6] net: dsa: motorcomm: initialize
 dsa_switch based on chipid
To: Kyle Switch <kyle.switch@motor-comm.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com, 
	jianmin.wang@motor-comm.com, wei.zhang@gl-inet.com, sijia.huang@gl-inet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 4:36=E2=80=AFPM Kyle Switch <kyle.switch@motor-comm.=
com> wrote:
> +       if (major =3D=3D YT9215_MAJOR || major =3D=3D YT9218_MAJOR)
> +               mode =3D YT92XX_MODE_YT921X;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(yt92xx_series_table); ++i)
> +               if (yt92xx_series_table[i].mode =3D=3D mode)
> +                       return &yt92xx_series_table[i];

Still redundant lookups here.

> -       ds->priv =3D priv;

ds->priv is gone in the new register.

>  static const struct of_device_id yt921x_of_match[] =3D {
> -       { .compatible =3D "motorcomm,yt9215" },
> -       {}
> +       {
> +               .compatible =3D "motorcomm,yt9215",
> +       },
> +       { /* sentinel */ }

Leftovers.
