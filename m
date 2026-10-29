Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793283578;
	b=l18d7seopmRs4/4tgvvPhN0kKnVXFvx3klKFw+IOoT53DIPa/c3gHppmdMtt144djVUT
	 TuoMwerFB1W86kjohZiYrp6lWg1VxLJ8TIVJijIaX4i6Pm8ms4r9ydU2e4w3teUoPOshO
	 G3t9tR51ftYyKb4V/WpzFFM+ZYGyk9YRa0Fug9aVIYkUgiajq7CgzSC5/jfCyrO/vspW0
	 VYq2Oww2qX6J4g2ahIq84+/zlDsMkLe1N79ECllwbT3gFHVX0l6EUEdXXbX+yzmfQmRkL
	 BCtEZuUenyiN7v9kQFgqbR/MzqiFEwPGu1RYAuXTn/bAt/9xX1ug1FL1Q7QrkW5fo6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9by/+qn28kcO71UCrIacSXbOC8dVdMUGgB4hEtIS4Ow=;
	b=UTUOaglBz1cZsLzFH1WMm451ptH8iOv26KL4pa5/B3YFuQf39Ctjgg1xobO6JL/Z0YKj
	 FcW4ATP2+TOp+mRJdrm6wrcnp1xsLEdIRa+RKSbaws0iz1K6rhQIAR9k5SW0+zVIHvJ5s
	 7MdAlFmCfQtTw5P3uQMKzTpUgqU8/PpvuYuTjAar1Df6s74eeTWUZpE5Dldhr5+UwIEQ2
	 ej2MObkgNBAyYp4YHstxDjxsmVsKDb/Qhn44/x05kEwer/d3Fb5i2DwaCa0n+16G1m3Wn
	 EsD9/e7zlLe3VQE+l1vRDC675SwAxEevbknbeEAbRyM7hCTHdv5JIdD8KEL+ZNzLTaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZV6gnFWU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1EE606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F1EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZV6gnFWU
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso1188014a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793283577; cv=none;
        d=google.com; s=arc-20260327;
        b=BbDv+dSQ1pRqTUQmeSumgnbgz31S/i+pna+bzp6xz/e2OCPWt/+kGhKQtwrLjmJzNK
         64EsV+YaqTLOk/T7Kf62BZshjm+gAX5u4su9lACqgtpEpw18Ve1cgd28l+ZhfL04HuId
         wMy4qawP7lqNoWYPvmeXWTD+/sjXf5tkPhCs94uYPV3/hTBMjlwnYSbCvE7D778Ka5fW
         SX/LRzHtJiwb6fO4cOSRPAogvacAwZ+z9YqIc1q9A/Y7D6Ngs7wqm3vq/eW88rYpZqMG
         hWY/pAS0lpnJOzzE+b0ef/Bk4dTwwpnsTrl1rYApIbWKE3m2fjvWXV1KptiOlE+yL2mD
         t0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9by/+qn28kcO71UCrIacSXbOC8dVdMUGgB4hEtIS4Ow=;
        fh=eOj6W6KMxR/l63iIuA1aFk0uk/6Ld0Tm2OsreQTgfcg=;
        b=Xxq7T2KMh+E7bdCg+7okZX3fqttgCcMRIIRQWUdnPaw11DOBpVsWPkF+cqD7Lxsjli
         nLc4Gn6aG/jjzb41FU1jSIMavAHiAmFGMLOBeQKU/NLjVkdvJj45kJ3P7ZJJH0Glr+6T
         mB9OehwR4rEX8MUiGo2bs9Ipg1rYLSzazml12r4++umLnkBikYHU/ojGKcxHcqbVJita
         mRVGhwlekopHOH+cVLsOiOhH17vENEhe4ENOmEYo0jVz2Cd1pB7NGc/gQ5GV6pGsZ0xO
         SpmvP0WJ7vIUoupe3ErfKYzTc6sg3GJJl2nHqxnD3j9XaU1Qdg7KcgUL65pPOOop4Niq
         0AaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283577; x=1793888377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9by/+qn28kcO71UCrIacSXbOC8dVdMUGgB4hEtIS4Ow=;
        b=ZV6gnFWUEjF2W22PhBo1hYXFtgLZ89QQmovrCEZzBWPoP/4N16PkqWj4HrxA3HeO37
         KGi1spKvsnQCNQTkzowIz8/lS7ImaonvUjMTlrIZ90EZv1tsQXr26WYGXtEu/LmjH3mY
         Sy689n/gnYwDkhbKZ8blHDhOdDIt+HWekavFgA6dJEDZQ+6zcMXhBnn43AmaiCOqJ6/x
         DnwxwbfiXh1LcEswRIiMSF3T4fwkcGmR2qEpi61MjJV8Mt7+buguqeFubW0q6kEgL734
         xV66RovXQaZAyeW49LXGA9GQD0Bd/NfrFYX9+NrOSliA5r+9ngUYu65AdWTQxg+e87NC
         utIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283577; x=1793888377;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9by/+qn28kcO71UCrIacSXbOC8dVdMUGgB4hEtIS4Ow=;
        b=IxEdU1ElFupKpl5NLKKfWdV8YgzjWwTsPu2DZK+cb8Wck+XQSfV6kbgTChdps4lfxu
         pX0xHCvBAJ2lRfzTx1l6MY5fvjhysuTmKCFgC8kW/wKFJyYxaVw76axtOzWh2ZB+s0th
         iDOBev0zuQmLJsFiBPHX7Zp2iH8fSQfqyHHH/KNJZATNLee70IDo76bARKuF3cy6+WHU
         8wGPpL1VslOckrtiwLXaBAWBnoSraKTVzJOqn6BT8Oeda9DSpJAqx/sZuYaAhHHQmgnk
         9yUuQk7dxbNt6vw00B4lPm/YdHiDykdZ0HvFawpAELdJO6M66jQznZtJe/zvZvX9ufZd
         B7Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzjarcdlGHkzG0JhLBHUst88gLPd355qFqj//g+6ogQSgMUEqfeatSFtZSFuiQYj/KumyMhc/nbM09Ty8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb0ZmNGDpTOazEG+GOr+2CUt/ya6VxSr58dqMvccPIFaNzT+yn
	u5tmWezAG9ep9PrRmUaw5vmyXLuPTnSd3JFfRlFuLGJd/ozJR9rHgiMXbFYFasfZycLOGxUrqeu
	ZpZNpDHvJYcXKhRZBfufyA5MitjQEE8IG7V1T
X-Gm-Gg: AYBFou3v9CueMW1f7KPpYLCgJy9TBnHtW19d4IylVGI6fGnO4zgYHPUX47LVbOELPxe
	k6mm/1tQbam7nGQ4XrpO1VKIv/nkaLqH9pKVCboc/sCBsmc37buUAWoxCgejjhVE5DhtfRV8EAF
	yAuQYjkhbN8BD6SrKcHiFi35O0f3hHMgAT0UXnjL89qmnvyHKkQrbFloG0c2CHQ8KhiUK3ElXrx
	3sKSfsqOYnIbpUA64aANkuH7gnptI4d+2AoRhY0m4l5ozk2yFq+44pXTZjWAyPAt+bs3mVPS//B
	fmWZVeUJUQfZj3ijho9OYAJcYhiFgPGIFsaajFn02hTHXqFSB5EEi8FVIaT1ty1mj110G/XRNOP
	Tuf0leyAiUBo4DidlaXy+sL+jM0jsENdsl1Ud
X-Received: by 2002:a05:6402:1ed0:b0:6b3:d0a0:39c9 with SMTP id
 4fb4d7f45d1cf-6b4b0b1cf11mr2209106a12.6.1793283576657; Thu, 29 Oct 2026
 07:19:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929100625.50380-1-ayush37735@gmail.com>
In-Reply-To: <20260929100625.50380-1-ayush37735@gmail.com>
From: Ayush Yaduvanshi <ayush37735@gmail.com>
Date: Thu, 29 Oct 2026 19:48:59 +0530
X-Gm-Features: AclHuK8YRd7esRwJwQxXZsuBWfYGyAmxvBoyXjMehkxel03w8u9xNskEzG-b4IY
Message-ID: <CAPgWTUTQti8Z7Kkw+DfTdsYd-SGsq+NpX2vD7TVmfLDdgcAMQw@mail.gmail.com>
Subject: Re: [PATCH net-next] sfc: siena: fix kernel-doc description for efx_ptp_timeset
To: Edward Cree <ecree.xilinx@gmail.com>, Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-net-drivers@amd.com, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linux.dev, 
	joe@dama.to
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm following up on this patch to check its status.

I found Joe's review in the public archive:
https://lists.openwall.net/linux-kernel/2026/09/29/2834

However, I haven't been able to confirm whether the Siena change was
applied to the maintainer tree. Could you please clarify whether the
patch is still under consideration or whether any changes are needed?

Thanks,
Ayush

On Tue, Sep 29, 2026 at 3:37=E2=80=AFPM Ayush Yaduvanshi <ayush37735@gmail.=
com> wrote:
>
> Remove excess @valid struct member description from
>
> efx_ptp_timeset.
>
> Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
> ---
>  drivers/net/ethernet/sfc/siena/ptp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/sfc/siena/ptp.c b/drivers/net/ethernet/=
sfc/siena/ptp.c
> index 0b723a127364..d643e41ae773 100644
> --- a/drivers/net/ethernet/sfc/siena/ptp.c
> +++ b/drivers/net/ethernet/sfc/siena/ptp.c
> @@ -196,7 +196,6 @@ struct efx_ptp_event_rx {
>   * @wait: Number of NIC clock ticks between hardware timestamp being rea=
d and
>   *          host end time being seen
>   * @window: Difference of host_end and host_start
> - * @valid: Whether this timeset is valid
>   */
>  struct efx_ptp_timeset {
>         u32 host_start;
> --
> 2.53.0
>
