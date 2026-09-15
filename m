Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF7C3B442B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480058; cv=none; b=hyuLgc8bYkuRuI/GLp2rgXGVgF6Zsx0kvGCe6bQDeQrVBIWWiGAETZ1/Qmw9UsacAkjXC+MWEfFJr2RnGy/KO37D/F3B8cii0d444CbAfhqxKpgKVjSzvuvWpqH2RbbntXEXD8DjTQq8qodSgXmt2d3hDoLR9eDAOxgHl1vOnIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480058; c=relaxed/simple;
	bh=av0lgor5Cg046CEuwDXRsvCISYUzls8C5RMRjdAXTEM=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=VcWJr5AO5xX2Q9wnAODfxlhQQ55Fsv326WRTqe6nBR9O1hMdrFrd03Ks3d7AIh8RvQ3PtTO/qI5kHRjHtqLwKbR3ZtzIey4rT1EUE9ajFEUnJilF7gy0K4ZAPi8qtgY/QrQ6N65eJ25/KMA/g4MEOI1Q/RMLcZYknSL5lKCTPqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NioF6exv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NioF6exv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so1795615e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789480054; x=1790084854; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnO/RFtPTLTuh551bJsP9vEYVlo8+tuse5zqKBb/5X4=;
        b=NioF6exvopxGsojoMEm0OlrZOqzF6ZfDNNCXhzp709UAdQHWIhKYSS0Uw66OD7mQEL
         nZaJ5Qxa1c92k1ty/VTCdMQzC/RXq6qHp2GkrcVK7OqtsGNUWLaeRaX9FuRB8ShpY5hP
         TJARwo7RvSrxM6FBFAq+ZkfiIgkKuot8pKhOrhHKwJyFVya67sprobbWIkl3xDtac6Ca
         6Nywz5SntDU92Paoec4OPtSXrL0/vdcyLz3gIrrAM0QcGTDNF3Qy1yw/koYPE0mgn8gJ
         hOITYS3pd3T3BvrW8tKqkxEWui3lSPuOm3O6HYp2i7CUk++8QlBKXUhdOOV3U6OKb5yy
         x8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480054; x=1790084854;
        h=in-reply-to:references:to:subject:cc:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnO/RFtPTLTuh551bJsP9vEYVlo8+tuse5zqKBb/5X4=;
        b=cWFoSMBCKMUWJpnpVJ5yOCmlBfdbgDRvf7OaBR7OiB4QRxl1kvez0OFKsbPuU5jDOj
         XADxB/VwfpxgrAzcXUIBWNKH2YSJdcmvjw7avG5UeqxRunA1MARRz8znyNw5uGaxbekj
         PVKOVAAd3XF3AnjI+g2DoNmanwVeQIn1P9NbwkqPuIO4iAP1hRWM+srfWVloROcbxFLE
         VrlVI5W3ojjZlhqgT6OdRazKZZbx1glXrgEoJ8vl2T3LpHesz6a2po/TvbwYbTBBvvHa
         hCHJUfxq1fGDX5sWV6CFG52/JEsHv4VpkjLJYg3pgOAEJUNp0Gb0wI5mSU5ENlaYZ1s2
         WD6w==
X-Forwarded-Encrypted: i=1; AKwUvBy1op1W6CyPQlU/vJ3uK8yYvzXtEHbAYbz4aixg2/f1NP6RZUIzr0AT82g/kPxHjYIbR7Hq6QDZNs3vfSA=@vger.kernel.org
X-Gm-Message-State: AFuF++l4A7BCoCzukWrw1quIcddHMjVYZ2wMBxJGQmx+EafFYHwRS5uo
	OBX5IjymtMgtGmG4PpqfgS6SpdFY/uLiJPqmUteY9arKtDQXNWccNmYHw7WrUJP+IXo=
X-Gm-Gg: AYBFou3rmwrRk7gQu9SX52NGmqLNWo+xgUjOFv1BSvCvTEc6Quz7QrXIro9Co+yAE0h
	wLjkszzgA7MJ0RCCu9DP4SD8lf/X5XoarxtPxwqzDd/zspyl/BQwXkmLCA/9EcEsceYGD0Dcht1
	wesi/EzCSts1EGzOndxie1InspHMqbU/UR7X38naHxxQAi/Gcpjj7BO0XPFaslnU+dQLSkTH9Lh
	M76rppoc0znbB1+jY1t7jG2jiQOfS+xITZ3ckAxMZorqlPYPgnUmNB39jKKg6mL3Hhr9j6X3xKk
	ngRYeqBzFZXVih1kU2G0Cp3Bi5dzuBng9ydQgULfOCJtwFLoPkM9H0wTXye3cSiKADLB1X3/e5+
	qBSS83zlL4pbX7BO0h0nDhym7wpL77IoxmsQUErOs/Q7rmyYnKNcVz7Uf1Q8vDdMo8qO23LJ7OI
	2LduTOgDlT+E00DIMtTM7UlTlKBG5KPvVREQfQVIbDjynB+s/7E40SFUwk5UJgGsi9BYOGL4rSD
	kPHRh2+ww==
X-Received: by 2002:a05:600c:b85:b0:49e:6bce:b0f9 with SMTP id 5b1f17b1804b1-49e8228f49fmr15817015e9.16.1789480053858;
        Tue, 15 Sep 2026 06:47:33 -0700 (PDT)
Received: from localhost ([2a01:11:8f11:bb70:17d2:d825:e2b8:2e8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef6bc50sm67382035e9.3.2026.09.15.06.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:47:32 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 14:47:31 +0100
Message-Id: <DLFXQIQX6Y6W.13CBS3NB0BTI4@linaro.com>
Cc: "Rui Miguel Silva" <rmfrfs@gmail.com>, "Johan Hovold"
 <johan@kernel.org>, "Alex Elder" <elder@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <greybus-dev@lists.linaro.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] staging: greybus: sdio: Convert to
 devm_mmc_alloc_host()
To: "Ulf Hansson" <ulf.hansson@oss.qualcomm.com>,
 <linux-mmc@vger.kernel.org>, "Ulf Hansson" <ulfh@kernel.org>
References: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
 <20260915132052.273212-2-ulf.hansson@oss.qualcomm.com>
In-Reply-To: <20260915132052.273212-2-ulf.hansson@oss.qualcomm.com>

Hey Ulf,
Thanks for the patch.

On Tue Sep 15, 2026 at 2:20 PM WEST, Ulf Hansson wrote:

> From: Ulf Hansson <ulfh@kernel.org>
>
> Simplify the code by converting from mmc_alloc_host() to the resource
> managed devm_mmc_alloc_host().
>
> Signed-off-by: Ulf Hansson <ulfh@kernel.org>

LGTM,

Acked-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui
> ---
>  drivers/staging/greybus/sdio.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdi=
o.c
> index 3952f3d225db..642d785fe918 100644
> --- a/drivers/staging/greybus/sdio.c
> +++ b/drivers/staging/greybus/sdio.c
> @@ -767,17 +767,15 @@ static int gb_sdio_probe(struct gbphy_device *gbphy=
_dev,
>  	struct gb_sdio_host *host;
>  	int ret =3D 0;
> =20
> -	mmc =3D mmc_alloc_host(sizeof(*host), &gbphy_dev->dev);
> +	mmc =3D devm_mmc_alloc_host(&gbphy_dev->dev, sizeof(*host));
>  	if (!mmc)
>  		return -ENOMEM;
> =20
>  	connection =3D gb_connection_create(gbphy_dev->bundle,
>  					  le16_to_cpu(gbphy_dev->cport_desc->id),
>  					  gb_sdio_request_handler);
> -	if (IS_ERR(connection)) {
> -		ret =3D PTR_ERR(connection);
> -		goto exit_mmc_free;
> -	}
> +	if (IS_ERR(connection))
> +		return PTR_ERR(connection);
> =20
>  	host =3D mmc_priv(mmc);
>  	host->mmc =3D mmc;
> @@ -835,8 +833,6 @@ static int gb_sdio_probe(struct gbphy_device *gbphy_d=
ev,
>  	gb_connection_disable(connection);
>  exit_connection_destroy:
>  	gb_connection_destroy(connection);
> -exit_mmc_free:
> -	mmc_free_host(mmc);
> =20
>  	return ret;
>  }
> @@ -863,7 +859,6 @@ static void gb_sdio_remove(struct gbphy_device *gbphy=
_dev)
>  	mmc_remove_host(mmc);
>  	gb_connection_disable(connection);
>  	gb_connection_destroy(connection);
> -	mmc_free_host(mmc);
>  }
> =20
>  static const struct gbphy_device_id gb_sdio_id_table[] =3D {
> --=20
> 2.43.0



