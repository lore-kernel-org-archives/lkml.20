Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794321083;
	b=xaBDy3brBPusl8UDrjZEzIbaRajkKPRnOiKGwa8wYNRPJb9KQdERyLXHun8I7JnRV644
	 EaSpYWaBdS8vS6nOCSb/QSCy4uKm+i55A4V6/cxfstvFZxJ64fb/2CBtpmBSK4f0ftk0t
	 uUzON3al0chnrCXStEsSTbhHgm8dek9PZ6fJUQKFfnfA5pz7Ima1+yX/30CpadDs/AFRn
	 UjvREc7d/cwUQQaemsawrCmdPTuF0RXrPwYGRl2Rir10wngkFqvtccooaFt0KhRzP4UZw
	 ivZj8Iy+8ZizwuV1KZS7/UTOzKGktQ60EFqSh0xcDQnUfJ8VzHDk23iIdUTRgn1eILA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VN2C42hTSkg0KU2a7wZ+MLbopQWA8HT6dYbN/a2Rpa4=;
	b=li6oUfUCZRTQeIClnwPu1ENdct53pqzadsmUE30IZIVnbydcyUrKpaFEFK7lBy6egtHM
	 TTi40fV0zSypX8+XN/rOVvsvsqkwdn2bWwTSeH6x/qIUS8JphBIvDgxLu9KCbgpwrFvYO
	 OIy1oodVXbRwGsl6kh/0kLNrCYII0s8tn8+zlF81ZUGAKgggCv0xsSU97Q1ui6uYOtkoy
	 QSxvMeNS98ovo5zW05o9LuEhcSw2SPSeSVXdxDMPh9yN5XgmQeLjJIZTctHmF61K6xjaK
	 jdqc1zeJwAnX0qpinjXK52xA+1Uqn5ebNMlmRJpCdwuwR4suEj0JGY6ykdwZm0cN1sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=s2u1ttrh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E628606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E628606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=s2u1ttrh
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-704597ef1d8so733824eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794321082; cv=none;
        d=google.com; s=arc-20260327;
        b=GCSlpESBI+IYlmygxgixDxgEsQRXwyUVP88EM6o2wrydcBs31heOkE6rMHVj5sl+OW
         5ghPpcXloBrQlt8W4HtADF0rUL6CA6wYjrTWaPsG91Jjfl+jf4UBDVqdO9fLud23z5Rk
         +E5JEK5OwnDphTn+Ffpip93ZwMDMvifPediOe7JjY0XIZKyFSuaDH6kXs2D+7Mj+L+pf
         8TrUhEPBHSVfgZLzQ/BHE/1iSQlhsB0DSySbvqx1JD3EyBXIosWDTQ/v7A2LLDUOTcaY
         y41YsdojjoVHBC3jn6WrIsPDSo4yVAvG5KGVSbW/Kc0TVyzrie18JoD7Uwdf0zPAV2vL
         3oBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VN2C42hTSkg0KU2a7wZ+MLbopQWA8HT6dYbN/a2Rpa4=;
        fh=9Dm8Ps+vUeFX7gZfFrpANj46kHF3LtqgwEl2Bgf3i4c=;
        b=FEgc9qA7kugHMEw9JqrEKb42fKbQngwEEY8fvHpz1KHZVC/wXOX1lMD2cWvrU01B0c
         FaZPJ1vZ44LHYDdG+SKgvx6wiWHyPnuBdSXQDXaMM0innQB9+4PUMZHdMLhHno2AnDbA
         sA8g2kAPxILeIot6St7kc7BI50sR8T1+AOP5VgteCFYsIrs6qt+vfsGLrZX8FXn8nOCN
         iCzjJYGcsfwMqdqZ3a8fOcf0o7F5XuEtdLvReaufCwyuchWgF6V6bTwicg22kHjcEIAs
         bJS1J4UR33gaVwwY/QUKzhUrtMZADLQa2SvBfKoiZKvcTOC2t4k5N6dr9Ywzzns/xfgo
         Brmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1794321082; x=1794925882; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VN2C42hTSkg0KU2a7wZ+MLbopQWA8HT6dYbN/a2Rpa4=;
        b=s2u1ttrhX5AmUNl3Tnp3e0Zwc1EpMtqqNoi4LRUWxJhDxfbtDFUeXNNHzlZtQEPekB
         z75iH7JkVY3Q3uHZIi++1c0TYzouyFDe+JkuGXKJ1e/UoXSq6KpsLMXrCOGXRfgqpfhf
         OaGBR3v5waPeNut++si8sV44FBRAt6+BO1ztQ9aqZsJoMSIXss9xKVFLh+wf2OxDRUGN
         0RIYGnjkNBPZn3huvoDzbRlnwbR6f2iSGgQZeJB0jH6Fu+Sjp6xrD88CcoVJ6npWrMb7
         7dFon6efKVH52iKvyxaSCCcVWD+OntRRAZWBPB3zB1RfkU9rgfRR/V62195xbJdhwBQs
         AeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321082; x=1794925882;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VN2C42hTSkg0KU2a7wZ+MLbopQWA8HT6dYbN/a2Rpa4=;
        b=MDakkYxYq0u3ahDM61LnkaP3RFRoVd4PxchOmLIM8lmS9fFe7k83aBkhT5h0DJ6guH
         h0Dcr8kJGhP+sZ4edIYIJXYsU0wspNw6b/4otwHHyXonwecx8gPaYf2Cs/qKGFdiIj/h
         a3NYKubmXPxf713gOtHwZz0i4S2HH75euyesaJNJy7FgAJqJ/KW9uK9icLmaOfl5VUYw
         NGKOc/SyR1Qm1e79hpjJ8bw8O2lZLnxofZ96TWxqk7PD/afNoPxC6GOZ98aod8NtQmcf
         ENFnh687BX39Yjpd9ubKOEe3aGDxDYSyokG+pinKZ6lcPLFjqHhHmVmsKCU5cEhN2SZ9
         Wq8g==
X-Forwarded-Encrypted: i=1; AL+hErFDdbUc1Ba0zJWI4mc7lzp4aeGzGHaK7YhxF+AUN6JSlRI9waMTf08skumdyeqiHCnzCXrSMlfxtTiUVRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZtUBxVkmuTK1fJV6JFDXr18gWIVQw5CTxrp2t0Svu6MTT2OdO
	w30XUkR7BTO6BOgKKAUTGvWq0i+tacFvoogUmULeociHqL1cZut0zWuu5AbPB46hLarJjmnD0D6
	hezyzPvjll+ru8ZznD9KzrwvM+dd/zXE+cti3QonoOQ==
X-Gm-Gg: AYBFou1whdIucdXD/6tO7vUr2q+QkpgBtB28vUXuTTfdv5jivc3Bi8HUS8Qf9rSp2dp
	0zZrQacv0ZrMdZZb2VvLgRE1dd++vSi8+w7vFLhaDZmhvfX/SOIFhIpK9FobG9g2RGaVM/qPraY
	9iUYhnLHZ9/vvK6x/8z8lj7DKiwtfoZexlf4J18eLPmOLcWu30XLd8EtRz77cRQ3v/fhUwDHLIn
	1Xm3r0oOcY7ud0BXRYLJaCqjqycRbbeQlMXhDrODb7oK78NUcUNtl2wevaaOxeKimc5hT67gtuj
	fVfYPHqYn9iSRtcUScWe4Hz0lOsFdM3LzGRp+3E/308IfmrmgNIdhe7LoUDG0B9R/9zIKoptLtq
	44/tRqGlkzkWfcg0ETDn9AOS2BqO7fTAc1uzmksmzsOlzPUL7pyxKxVAokTHj6nNf+UxgAtQpS/
	tbJYnrVIbTcnSAeQd7ar1i3uDxluyRerKycJlE4rhz7O0ISYSTw9UZb6VWTICHfWa63qFyEncE2
	Q==
X-Received: by 2002:a05:6820:3395:20b0:6f6:96f1:1bb with SMTP id
 006d021491bc7-718a4993108mr819221eaf.36.1794321081581; Tue, 10 Nov 2026
 06:31:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-media-remove-dont-use-autosuspend-v1-0-cc07e71b30f9@kernel.org>
 <20261110-media-remove-dont-use-autosuspend-v1-1-cc07e71b30f9@kernel.org>
In-Reply-To: <20261110-media-remove-dont-use-autosuspend-v1-1-cc07e71b30f9@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 10 Nov 2026 14:31:03 +0000
X-Gm-Features: AclHuK84_ic0UdOeQ2rcg3KxPlmvl592YOsU0rOC64Ni2y4sJscVe72p5w5VszY
Message-ID: <CAPY8ntApNSnG-iAVpkez-qsWeEOW061c4ABBwaadWkXZ+KCQ5w@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: i2c: imx355: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: Joshua Crofts <crofts@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, David Heidelberg <david@ixit.cz>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 14:03, Joshua Crofts <crofts@kernel.org> wrote:
>
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx355.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index c0dafabf5dc9ad6237c9c9380d6122edfedc96f3..89e42312265822428cbf0b909627c66415b3282f 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -1298,7 +1298,6 @@ static int imx355_probe(struct i2c_client *client)
>  error_subdev_cleanup_runtime_pm:
>         pm_runtime_disable(imx355->dev);
>         pm_runtime_set_suspended(imx355->dev);
> -       pm_runtime_dont_use_autosuspend(imx355->dev);
>         v4l2_subdev_cleanup(&imx355->sd);
>  error_media_entity_free:
>         media_entity_cleanup(&imx355->sd.entity);
> @@ -1329,7 +1328,6 @@ static void imx355_remove(struct i2c_client *client)
>                 pm_runtime_set_suspended(imx355->dev);
>         }
>
> -       pm_runtime_dont_use_autosuspend(imx355->dev);
>  }
>
>  static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
>
> --
> 2.47.3
>
