Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793007900;
	b=jdR6eclbDAHEAhNwZim9YCCrbU1S0fygG8Xbv4SI4DLXvgyq4RSm+L2mqcZ+YzDTFq89
	 Wx5bYYp4rQ6sJ4OIGHawiMEkj9nucFTC1ZV50E6G2PJBqbUIyGfa7dMpWS3Qwsmo61nHo
	 Re4mH6dFCdo5SfKG6e6W/WEDXLbjI0uVYEYjhN/FkwA1VNbSLosZKqFbvc82LTO0avAeL
	 pHGM62aWxMZr+kkZeEh2W3a4zgCHzeyO1mLbly3w7jKn3D/fWO2QsbmcBQh4JPZ4D1XN9
	 zmnAWobdsvumulxCozWL6rD2MIqJSOpeomggHH7ir49peaMphuWlUUyTeFrEhq7E0TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YySXXUFBOHmytywvVTLMkHqN01ZYut8GdXtuh1QQB84=;
	b=JuGLTBRjVgiAIp6gv1UpxW0OedwywscOIyCned4LLEOBjo3mCcgM+x/X4em/ACZfrmW7
	 89q3xAlJNLz6TQ7yhFo/1mBN8J6gDqsBERD7KQIbTlQ57ZBVwjQGFTihW0xGJk35Q1Ka+
	 UnZ5JVyX8LVOFuLCmqrYQK4p4rU9jUwzEduHeU5/5ab1ELDt+YIWoaG0RG/w8562T/UoG
	 fMz1hUjfyuuI+b8aanA82TxFZmG2s278ldrw64qGbV6NQ/YtPWFdK4iMuDXDbfFvh/cNO
	 1u24R6hWOglGO53QoOjsbQ44ZCRALDTIumcgDTMa5+UVoXMqQh+ZRSpBEI94GPABF6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NUZUoxMK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF631606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF631606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NUZUoxMK
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6dde81a6820so2177270eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793007899; cv=none;
        d=google.com; s=arc-20260327;
        b=NhFTskuY/TQPQobiZZJMJmzkhnGedXnUqL8FbHui/e/AAnLuU7fqmaJXLkG5zGkAIK
         kDQUOXCvYRCHbmjW+EW/Bkh0IVeYh4Ga0UOCvCYv/gHjo8yy9AsISYqGkUd40uD3O6ry
         TML6iMs8xDRiGuCZtjg4gn4ewAyJDvM5QVXUPikJBPxcy2AF4vHfuM5ehW3YIA2lw4j6
         Yd3wUlvODT8BpH0YWkh/ARvWKMqEbAoSNE2REFqqP6a+ZuAqu2AV3so7Qeq8/Rj+JRaC
         Sndf0InHbg+nQvSFQYlara2gG5iTMFkEqACMtw/2rDMc8ojnJBrX/aROFa4+KWYP4Oi7
         UIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YySXXUFBOHmytywvVTLMkHqN01ZYut8GdXtuh1QQB84=;
        fh=it3/sEpJiEjmV/7sFY/C8RL4MzcZjMVS9KOA/FoV7x8=;
        b=Nt8wNEfRiob0TD/nBDUFgbQoauvtFLO6tNW+yKgzx0/Vk6kxJc+pycWFEVzGn/jOY9
         g2M2M993pEKlZUgVzZHEaZcOdE/veipiFS2PqhY05iWdFoy6KOyuC5+gF3Wzun2IFSfx
         a/cIeLWa449sATYL4IegW1ZG0ZFAlDnt0ddyXSwptb8DctBmChgHMEth+7OaxPTIv5/N
         9Vasp9HwXlbMvxx0sG65sDAXhxgI8O/x7Co5aiE8WYa35Kmn1ltQYFCdjiu+sfwegjkg
         MQiIy+qT61BNQSoyQWsGQ7stSJMQ0mVWesz382Zejb93gzcSkUDs1PR00LqswUsCIjVt
         A12A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793007899; x=1793612699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YySXXUFBOHmytywvVTLMkHqN01ZYut8GdXtuh1QQB84=;
        b=NUZUoxMKd/nYmtJjraqzUOqRFLTCG2q2gNuxUIv6FD4SNV1axuZFNIlO+6+e9Os261
         chW0akAj9m5q2STjwcFa2UZsQWbj0EYRBh96NHHhwQs4Tgksv7c7rPNHx1jPGMsNShqs
         X7Jx9XFVJJb210Lhbb1ehdpCmtIuuViK0AAvG20wjnSVhOdtPy0e5UgP5eJmUK2oGwB2
         bs4pwW23sMIHnbMMT3tCBeaSoj8IOUBtLCANoYosdLYt7VKV4umpGyulyybFgS44Cyvx
         68KTVojaNcd11gOWCbmxVMSmQGq1JFxHSRsUDslDhCArN/IbIvHqsxBQdNZH5zRAuW0J
         C7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007899; x=1793612699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YySXXUFBOHmytywvVTLMkHqN01ZYut8GdXtuh1QQB84=;
        b=pkrUtLNvxFT+YhIfDQoa5SS33///Ba63Xx6eiPeWGTFOdCw2bvWra4wr3WfFeb1UHV
         9I9lHDqq0SLyUbAm74Rwd3Q6w/rkr1SG8qU+sGoEyF36nA2t8UkPBpr7wf741dlkjaDM
         Ve590sHYCG31sqJh59W58xGVbn8ghFBfbTRZu1jUvfvAU8igVKHR+hSO09f03Anj2q2Q
         km715wgNFCO0i+M9pFeV0InTJGMfz/b8gFhMLU9hIL5Cib3kTyYD5V0aYj94Ymi9LNGn
         NrKYSdRcaoa4McA4ya8jGu/449HcLhy06McgLuEq2IGz1nDzCFmqpIG4/DllwHaww6m/
         ddHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHP1PCxq4UHvJjvQsE/dIg4xpE53GOWw7XloapCmogZi/0XQwMVXfG+yvRMGLagDUtEv+JO3ADRteckSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPg/WxfYGMVpt5J0rdll5cyf3mxzfASXdozoqjrimPn/i0A8tg
	nDwBtpWXCqzbkBq+zvhUDPFnZYPK75Kz1KXnMPPJ0k7z0vSEGUgm4sFFw61prTie5H4I+0mgni4
	jusx3qvnn+aOCwV9X7xxC8FjslSsOfBE=
X-Gm-Gg: AYBFou0oWZFzFh5KM5u/kTdzm1ElxcbRou7XRtO6mGqqWzqV4gvaVkwwjmTyTWq8VLz
	/PIiCEA8SoUbePTsEn3fs2M/xZUSq9S3HSY30F5PfPASL2itz+BoIGr1xkcogFDamPp+peT9bcK
	hRXZUzx83tAk3jjCzW/+2pIPta4AyBkFxZ9ZScYbzI6fyzQUcFL2u12rXvoitIJ9UvM4gLrSFY2
	/CaswoYy7sd3OLyE1VykzS66dy2T67h9YkjFY+d7FBkkjJHvqcMoapwa6P7hQ7R5gJgCrvwDVa2
	HtAXJRIN7rT+NNP7C9aoWpv+EQbR/qLnnYq3l2VS2gXAHrEcOipuW+KFO2rDWMQUvYadHsAII2R
	cdLSheS7rKorUX7DKgmutxFD7CNf1wckNgUec55TXmvNV7e1UQbFfFngpNAb2/qSOiL5xZ7xpBt
	+z5Ln38NU9CJPHtoHk
X-Received: by 2002:a05:6820:7089:20b0:70e:2096:8098 with SMTP id
 006d021491bc7-70e20968319mr679857eaf.83.1793007898903; Mon, 26 Oct 2026
 02:44:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026092423.66168-1-himanshu.bakshi478@gmail.com>
In-Reply-To: <20261026092423.66168-1-himanshu.bakshi478@gmail.com>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 15:14:47 +0530
X-Gm-Features: AclHuK8g_L7SXnsINc9C_3whJRkCHOJJj2ujrSiDjnaE7GbNryakHGpTdm_klP4
Message-ID: <CAGLmz9KsGrVEFRO-dQv559ArJRKs7yOiR5wY4T_aFAeuvNhg=Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Remove unused fbtft_init_dbg()
To: andy@kernel.org, gregkh@linuxfoundation.org
Cc: dennylin0707@gmail.com, cenzhang@linux.microsoft.com, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	error27@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:54=E2=80=AFPM himanshu bakshi
<himanshu.bakshi478@gmail.com> wrote:
>
> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
>
> The fbtft_init_dbg() macro is not being used, so delete it.
>
> Reviewed-by: Dan Carpenter error27@gmail.com
>
> Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft.h | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.=
h
> index 40a7567df1eb..16459e4e0ba0 100644
> --- a/drivers/staging/fbtft/fbtft.h
> +++ b/drivers/staging/fbtft/fbtft.h
> @@ -420,13 +420,6 @@ module_spi_driver(fbtft_driver_spi_driver);
>  #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
>  #define DEBUG_VERIFY_GPIOS          BIT(31)
>
> -#define fbtft_init_dbg(dev, format, arg...)                  \
> -do {                                                         \
> -       if (unlikely((dev)->platform_data &&                 \
> -           (((struct fbtft_platform_data *)(dev)->platform_data)->displa=
y.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
> -               dev_info(dev, format, ##arg);                \
> -} while (0)
> -
>  #define fbtft_par_dbg(level, par, format, arg...)            \
>  do {                                                         \
>         if (unlikely((par)->debug & (level)))                    \
> --
> 2.56.0
>

Hi Andy,

For testing, I have compiled the driver successfully and
verified that  fbtft_init_dbg() has no call sites in the kernel
tree.

Thank you for the review.

Thanks and Regards,
Himanshu Bakshi
