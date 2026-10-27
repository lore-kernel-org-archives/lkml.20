Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793083214;
	b=t5Kj7kGhNVj+WUW/YaGOiV3h0kgAWOlC5C0BtLMxuv93XmxeUs/YWki7npJjkzetraNh
	 SjfrInpSUdltzURF/qkdVxZOwfeKOmE21erlzUWuYqERsi2Jz8iLEZrE6tKxczGcgbM+j
	 ySgpqfWdStdfxvmJ1/8PwRsenwSd8B/rzizzxQ2U35b/5VyEdN1jrc5zgSAz7+3QiLF4K
	 iV2CH2RLPpgpR8jA8+huCjSMWlVG0ikR2TN4kwQbARgnjIUJqXsXJIONfb5dMUAOnjFRP
	 P+b9ZBUPxC/ciMFyHZlbodmqpzwOctA6wfowypfuu5MMG0vP5fdBrfRcPxt60BOF0Jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oafp5dXvXRFz5XLlyaIwK3pSxcRN40X26RgUfnaYz0Q=;
	b=JVLlviSqJWgEjRdaEUNxzuWb1IO0gqG0B5QHmdbTSN/Sl2vlzacG9D6L8Mf1DQpuLoYl
	 edXONhmNhbboo6MSyeaL/bp9v26pV6S1KcRYFKNajCWBdbYSzb5NxOMYnfSU11JzBNxH5
	 vc1gQuJOlXoAU+zkAToxi/eX+UoHdixPSlcG2IaQP4qC0CA5PjIHwswCFtNVCoxYS5HfG
	 Xt8jXe0m8kbhbWIEg/bsdifNGlF4VvQyTaVgnqho82LMpIZYSPfclndN36Go+/bXavq3b
	 oZqnA3VFWLa1g/pqGtn0IrRi0912lKBtQ27UVY65cZx3djU7VBjdrKkbM8nL4DMX1sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Xr/K3ApA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2776E606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2776E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xr/K3ApA
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so4480394a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793083212; cv=none;
        d=google.com; s=arc-20260327;
        b=WXn+fFEsJYi6YNNzD2RNzLYRImxVQ0kMNc7reEVyjhIdap8XlKrl0nlYqBV1bXWl0d
         H9AFML4OBvL1BEnkfMQ/NwGWidKWK4IuC+YKcqcMLEOfQwMRLl7CTrgKDBEEJQYPrB0A
         Vf9qT88r1/NvaZmyfQSD77hiWpStImLdJI2qPrsDoEsCf3QbhNz00Ypsx3AH+ZgS4j0x
         LTJevXmsQ27v2otXXiXg7l5uPGpIp1HwxTec1R/AB2Tp2u2n26YyzEas3BaSAez2cEK0
         7W6j/bsJIWpJl08WFkA8VYYGDiEfCo7YZNA0oyUu8R+0ANTV0h4qBigWqCHgFfI7/LSs
         6S+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oafp5dXvXRFz5XLlyaIwK3pSxcRN40X26RgUfnaYz0Q=;
        fh=9Og3QDOG8jr2/YASs/xOcqy7W5Gt0B9r8aVC0XMzjwg=;
        b=MSfxFRw0q/3dab0+RWXiVCBI1EBZSONri/R+Io4sd+j51svWJL7LyDHlEtD6LfwCX5
         lRw6P4hbLQEG1ojG91jgZaLoklsqrFIwSPKEa/OGvRAui5d7NJihiyLR7xUJykwHAhRh
         wGkTf765nwt8oyfctp+ZiWhAPh/IV5SvK+MCl7HxOsuu055BufCkGZVyZ0NuLG7jHVtp
         TDrkpZakLB913BE8f8Y18E1oxbtQMiZl8KRuXxMSJRRC6Q5v9xWIfnDfEjmk8hG6TeDK
         dt3N3Kc3vWFUBuvYRA8IjWybKUKC8ap6LmnJd5vCiA7V/6ateeF4ZNwN3+o0NYYeoMlJ
         9PYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793083212; x=1793688012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oafp5dXvXRFz5XLlyaIwK3pSxcRN40X26RgUfnaYz0Q=;
        b=Xr/K3ApAlTMhLCATlaUIz3dHLPhzpCdUgcTiC5gVasGy3ATONd4P0ZArcc+dkfms7R
         JQK1ckXCLCqw/pRe1JdKwdaJiqNAo3p3DNGpHjyTaO7tKpY+ydFxVzTRMeHqatwfLJiA
         9sBpZpHKyPRb+oypyEy6IcgABUSQ52zgi8A+qpNcdDfdf3Ii52N0ch5Y2M6F4uoKUBYs
         8/2aIvUM48nAJQOfCWAp/8W9qEHMz/tQ3rjw5qOuzdugU/W4rH/42ePeS8vDNhGtgt79
         hJDrEJzF/z5zI8NStVxoJHhbHlhF1PffeNkBbvLto4Hqog8TRqfkEBnRJDF31CnN1v92
         a1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793083212; x=1793688012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oafp5dXvXRFz5XLlyaIwK3pSxcRN40X26RgUfnaYz0Q=;
        b=NS/mOUy7PQqEFIW+DpaKU8cVkTlIlFnmxYWclIS01pgxF9qhc/dRpYycqVvvoqbksz
         j9EWLo9roPDF0b9RUh9W2ySAu4rTIxx7uzUhmUnFSV+S5Jlq3shAq7dVyBYE3f5lSC5Y
         BEXt3HxRAxoxqrClV/9tsWsOnPwCWS0M3klMiCKXmlZ+3feunKuvWcosNuI5QHZIQNiE
         GkEdiT8EmTX970Ja0izd90auNsjgOGvpJWDJv9ptzCzLziDS5dfVCwaJdRmAHNrJgJph
         f+5zrR8TqlQguAhOZu43NMieKC8Z23V0VI0S3FQZAen682C9RE7/aNPpafNUhnwFdE6c
         CTEg==
X-Forwarded-Encrypted: i=1; AKwUvBze/dzhmvYjAQe43XI86mFod59wOFV3NluzRIARmz4Agc2fmKyoHNokTMXN322buZrlNZP6AsYzhNYH0c4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7nxftgH+gmrAW6JgJ8n9Td9gwr6GWJq50LHAC0mgkH7ECU3Uu
	lhgfpJJMSoMj4uCy6+9imclvVmo4UbZ0Q7FxDslN3Nbm5Q/ffDjsVEcdsGOmlxIkJvXUUJvurY6
	iJtOi2Smj1ijEuZl5V/2XDMwbxxqzwoY=
X-Gm-Gg: AYBFou2SilYk3ERvoQLqjNukZVsU0KI1pfVUIQYJG/4/XC6jYG/hNJ0KVn4PdMUeRkC
	+LjAmtPQonDv2W5ZViVisfdR5wpDGeqbPVDlhfqNTPkJXY7psRj/eEZpVKeB8HX2ts741ZXVvUo
	QNDnpoQyQwK22pmYA0VEdXjGQIJdnFU6RS9H0z/CoifDTPUVGscRBVp4HBhddLN7FKqHs36EAhp
	QnjIpLsUg0BDw6pgzJnXqCY80JZa3f/fBcImsY6p+5VcANgr3Llh5i1a204A4L1AiSjn9f6oo0U
	maE8XTAkUZh03ZKPM1Ip9tfKAc0uc0YqDO47c//fNetfWS4DW9zSSp8jteKFDHsj27F49bivM7/
	69q/xTw+nqUm+F2HLEI69fkX/YOZWeDfZqQdijed1fFt7OduyEYFHyubYUMX0
X-Received: by 2002:a05:6402:b25:b0:6b4:1902:f197 with SMTP id
 4fb4d7f45d1cf-6b442fd0001mr6794226a12.17.1793083212204; Mon, 26 Oct 2026
 23:40:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001090050.3849551-1-beata.michalska@arm.com>
In-Reply-To: <20261001090050.3849551-1-beata.michalska@arm.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Tue, 27 Oct 2026 14:40:00 +0800
X-Gm-Features: AclHuK9lj-E99WshHUaMtWkmrbT9LNYYzV79FnrI8SFTadnxc-WEa8pOd3bNFrU
Message-ID: <CAB8ipk-3pec4PCteA8+moHveHobE4FZgHbc4WnpKkJRyt=Vwgg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] arm64: errata: Share broken AMU constant-counter handling
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Vladimir.Murzin@arm.com, 
	catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com, 
	James.Morse@arm.com, seanwang1@lenovo.com, linux-kernel@vger.kernel.org, 
	Xuewen Yan <xuewen.yan@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Beata,

Sorry for the late reply.

On Thu, Oct 1, 2026 at 5:00=E2=80=AFPM Beata Michalska <beata.michalska@arm=
.com> wrote:
>
> This series factors out the existing Cortex-A510 erratum 2457168 AMU cons=
tant
> counter workaround into a generic broken AMU constant-counter capability,
> then wires Cortex-A725 erratum 3821522 into the same handling.
>

Has this patch only been applied to the A510 and A725 so far? As far
as I know, no chip has received a fix for this issue yet, including
the C1-Pro...

Thanks=EF=BC=81
> ---
> v4:
> - use midr range instead of multi cap list
> - reword comment to be more generic
>
> v3:
> - splitted the commit and droped changes for cpucap_is_possible
> ---
>
> Beata Michalska (2):
>   arm64: errata: Factor out broken AMU const counter cap
>   arm64: errata: Add Cortex-A725 erratum 3821522 workaround
>
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
>  arch/arm64/kernel/cpu_errata.c              | 24 ++++++++++++-----
>  arch/arm64/kernel/cpufeature.c              |  2 +-
>  arch/arm64/kernel/topology.c                | 16 ++++++-----
>  arch/arm64/tools/cpucaps                    |  2 +-
>  6 files changed, 61 insertions(+), 15 deletions(-)
>
> --
> 2.43.0
>
