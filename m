Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D818B43A80A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887676; cv=pass; b=snx28LsywA1ntHdHfqGCkMLwzyomWNzlSGz6UPxDLuaXn6VTRUbMqup8eFgfbjB1nWx5HAVEv6a4T+2gB/tFAalPljgeyM/vZ+bbNAcZNJhkvLQ+ZJpfelIXcEvPTOF+L1gsPwUzIaSQDzp5dIKrFvYiwPbkvnGX0fMh7EuPkMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887676; c=relaxed/simple;
	bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xygv7pxXVini8iQOPA+3Jzn6dii8ANTgoTRUJ19UZQ0wpoegXxCtawB5I+uFJmNZOKQdkCdW2XOxzVQp7pa7MD90uTn+001QM7AhQJS/uilB29KK1KJNAhs2DWakpKS5oClU9avcq8jxFhOZFjwCIqpkGdj5LhT3B/U9rmujT8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=modQlBSG; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="modQlBSG"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c315869241fso385428166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887673; cv=none;
        d=google.com; s=arc-20260327;
        b=EabwBzeJzeM/yU8Kfl8fxW1oZ0lejjfd+inQNUI9qitaQNMco0WhxAmTMHpXFI0djb
         n8pEz2z0jww5+AjzGX5Nv8hGbmEuzTpLlWLFmFlLUEmfEq/fldVL8nwzL/Tb/LhvzObH
         0S/Ew0WGOiH/irTZlqzeM+FXmFv78RFhP1JZytn1P6dVStxjXdShYnpN5g1czz07InJz
         oc3V9KqT8n/+91HNnJtkT/J7WpnzYN0Wek8lrPbatFC3dT/wrGCD0x9CTzjadyzYp+ef
         62dXbJxE12dGpw8SVU6AN4Gibqk+kUfBzRxzypFgjeg30EkwwAOU70OVOJoeZvLW44Ts
         NnJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
        fh=psW3JaVdIkiKYwTE9brROfIiyLK8XFBNkxV+2Iy7zaU=;
        b=AjDzF8m2yMUjtPm8o6f/CD7IK8mcBXQDXltwJvvC+fji5DwI1uTZPF4ORxvpBwKOuv
         Qkq92sBeCKLnyMtRNtlzFOwJxz2CDDX5cGSslOBJrhVd9919tSp60twDXAVlGwsFaXKn
         IT1ASevwiijGF2Feck9eIRSoZyRFjIBKCheZm7mg5F78D1hLvboR6SlIiNRs5jNGiw9g
         2dEvyf5114ox3BK/yg3BOEkpOOdHmKP7YOPqC+0YMeDOoTw4/09nn2I7DMSVL2lJE3cF
         jaKE3YgoF3QaOqCPt/JguH+rV60LgCZmqaiur8hOa/5aGGNQ2t8Na+QDNYF1iOo1ooN7
         RCNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887673; x=1792492473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
        b=modQlBSGfgzv3q0bNjcyiwK30WKaPqitYEsHfpfBs/TQmJTgRJEumDwiDTqIfJc7wO
         1VL0Y0Na0+Zjuj/UYULc6EZ6QP3/7abos+mTyJb3dpspZ8FOJ3KpLtIaan+N3vyZ+zAh
         r8ZKo3dwoLAkUqHep1xMNoxsSXwwJb7M109U3Y81061wTtiVunL+QQL2Uq+EeU4wcpCX
         OAPs/V4+BNonjTHuEouVUreJZkY0rW3X0KmIdI7Leyc+eHm+RzzcjQt7QLRkSCX/kVMF
         pUZRIMzXzSTBlEpiY4kyFDRkejNyYQ6BHe51FtH2dIru6Gt5V6gtkyex3HUHWZLLSbZd
         +RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887673; x=1792492473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
        b=iPT6l6seTlLilLKh5MdpKYDlZYAInihAFFLWhZoAedO8ytmT3JttEfLJ4AK88F8MS7
         CewN1DjaGu7SsaTq3rdBHCIUK8up5TwH4NILNPto1c1f/dNiWgKZ7siRn+xuXZpLEIjj
         JiNhsgarZ7DgQLgr85iT/+i4nOPAo0jxwYGlgwSXYNY3WPeBhhspOxqVU+Tsaw1cV9TM
         uLTAC0ksrpODWhHlOQcAG4o6WfeqQqrMmbFWAkwLt8bxamlEJf8EI+QoFILe2yGe8jTm
         ESsy53SVnwDbfp135P15bCYNT2AAea4H2Sxv8yJIO8vcfmfFLiXp9qYYutC0uxFQVZ6S
         nj6A==
X-Forwarded-Encrypted: i=1; AKwUvBxc6NEr+CITRITlZxHzFqCwC5vi3x7cpKmHgUKz4qbUerib98s918ncveeFRIegDLYXDisHRIiQWJ70O08=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnvG02Nc+gWS9KzoxHic+jp+Zt33ERmXapHwA5ubl5JNwtsrSb
	sE+Peb46B0t/Nui0yFNdIb+jXn25J+/31d1ILzBv8SyKrE3Qw5MeBSmRJp7l0L1QpeZbIei7lok
	7QfYmVhIcZ0zBe+1P8ucVuNGa+cZqi46xAXVD6jw=
X-Gm-Gg: AYBFou1gQ6/PqyH8bQS5xoPk85Ey3GcQz58JeYwdQbq04NF1ZblvJI8eEnl06vo3Bl3
	WWMS0UF8LxAPypsLF6YBniyGk1UXJ1a/jZHqSuzuk5zd0rtB+6GtEaqAgEcQs73jr4sdj3LdIl6
	IlqXSePsogqwO2DZ8KqljzLsEcR+VPMaTBJDCHu7ck1JElOHMJwT6x5LMQqo16DhCFofEZMQRbN
	3OgD/hUgxQNB08fauez5B0GnXH6MlQj4vkcaosktVyx/t6x5FShM3N9Qlbnc12PuawuHpdvprIE
	jlZM1NU3/2QWDCIfBGXoQePKpmhriMhUthdqYdyVO7DgC5dDDMwt9q1QsBDWQoPWUggonOVNayL
	EybFDbQlnYsidJp8TY6nBDpbA2lz8m0WTv4nJYw8UPZQW/yQO5D/FopWFwQpglOHyVYF/Im6J/z
	XI37Y9/6IEyaWgue0jJxtkzsy4zNqxXp/StPB99atkh2CzHRrBtN8=
X-Received: by 2002:a17:906:6206:b0:c2e:7da9:6e6 with SMTP id
 a640c23a62f3a-c31a9b0b9bcmr1021852966b.11.1791887672983; Tue, 13 Oct 2026
 03:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com> <20261013-gpio-mxc-cleanup-v7-3-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-3-c4d769587d3e@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Oct 2026 13:33:55 +0300
X-Gm-Features: AclHuK_kuegeo_16KZLM0-Cx7ehUYRa3QfvyF2aUqaBfecJPa1rxTPSqFEfgNHU
Message-ID: <CAHp75Ve6KduhGHyaNDBM9MqjQV4dTzOz-_1o2Zieq0EKyCtiSQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] gpio: mxc: fix wakeup_pads bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:04=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port. The writer-vs-writer race is the concern: two concurrent
> gpio_set_wake_irq() calls for different pins on the same port both do
> a non-atomic read-modify-write on the same wakeup_pads word. The old
> |=3D and &=3D compile to separate load/modify/store instructions that can
> interleave, losing one CPU's update.
>
> assign_bit() uses an atomic RMW instruction, so concurrent writers to
> different bits in the same word are safe.
>
> The reader side (for_each_set_bit in noirq_suspend, wakeup_pads > 0)

for_each_set_bit()

> runs in noirq context where no concurrent writer can execute, so
> reader atomicity is not needed.
>
> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
> wakeup_pads to unsigned long and reorder to avoid wasting words.
>
> And fix the enable/disable path unconditionally sets/clears the
> wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
> Only update the bit on success.

--=20
With Best Regards,
Andy Shevchenko
