Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794554280;
	b=kz4HrgDRWGow6j735sE5+UaE2/8sVkSy970Z2R3gGU+TwjrwFeph57LzQNoqKuCuptp7
	 ptbK37oE6J9mjjFPpchqJJI3M09DlGw6emounJQk1Z2UVuBHKxzi2HIOVD4Ak5SdCt2ea
	 jsWhsBE5tPiQkQqq6uwvfYsfRWZSfvLA5y5LXN1LQ+nJJJrgL3a8+UdNYRo9uBV83IWb9
	 R6SlhoHVLLQc4hvtjhzZjaRyNhLB2Y5LuqoPF4efWN5jPpXmLfuT9XBT3W1v8crw1MRw1
	 aoO3F4mIx9G64jnaBR6BVEybZnvhKddr6W3ULD08A9GJRuOBSuk803lkuWEFk5szmTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jbKSRLmz7AprKYWxSmdsCwUxL3t+E9S5Fb7xZH5aS6w=;
	b=Cgn8HYwxqr9jpMn/CsS+oJDVYBu0Tnao4ANujI+F2AUFqxpVjSWc2TGEbircISaae6NE
	 B4XcE6yq04tNgPE4e8VyugfkL6H+M1IgO7Pn/ZYL8xt12OvIApxSS+YZkVBPXrBXi/27h
	 5Vl68dYBLHObZcjbXAhVZMAwmsAgr3YILgpn0TFqyhrKlWySOsKLA8lcgaJitUKiO7Cxy
	 ojJQNHalaTdVY2iP6DhTWMUA/E4NGkB1oduJwbUhEESahYqKnnfHJfZ4T/vEsNEpcwWTf
	 IqrVI8wyfCJ5zaK27/DgoAe5aESm8DUJhQFGY+jJx0pQEknKVuVWLbhtacv6QL5M6HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sh33LIHe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F3F606A88E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F3F606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sh33LIHe
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ede7cb02daso12444225ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:17:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794554279; cv=none;
        d=google.com; s=arc-20260327;
        b=IEFpsqqJfrXT9VkHnGc1B/iiN+MTB4UM6vmkaIKIH+Rq8mVE/sZHIn8wybm5yMgbPu
         YfjpJJWmKuXT4yyL0AYnzZdrH28TptwJzwiv49GZLL7Vm2FbjVpy/e/PrbdDBKvE+2TW
         UwhEXzpD4hcT+nst10jjZV9mtrD67yQinRy6LO7U+2QhDG0qIsSvvflb7H9mByGxL4Ci
         UGbNBkbFx0V5a7Nrpmp1c7YRKTdr1n7ciAqH5qw+714Df1nD4xYHKVhYBk9ZnZXMtrK/
         wdUR/DdCNpQCNIhhNkvaKUmsSPjkf+uG/guTrd0sKfcJie9dXymlBRDz66lSUCgQ4txA
         e5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jbKSRLmz7AprKYWxSmdsCwUxL3t+E9S5Fb7xZH5aS6w=;
        fh=YBRcPGB/IB0T5s/ci6zFJc2LTOqZ9LcN8tVGsGjlMBg=;
        b=SCP1umoYcgw/Mo1x8ynw/x/Je1tkxYRJeeSgVaG2TDTCMe33L4hQdUyOVtdmQgNKCS
         RVlgkRQp/1YLYxleUSFcSLKDQ7u8L79DXUI4HyyJZGRnNxqwHoeBr1xvG4AhpnZmKHDU
         4Z+GBBtmPDg765OhTcurikwM/p8kxJWSIRbFykUHy9jLMVSyCntZlwUtgiuKUUkX6UdR
         Fmp+uMbw/wuI07t7PX6qpPaCqV/r+L48YplFR5saAihQwkLu1fJWowFIK4TUfsxl1Iw7
         M19izmal3n+OutHSuEnB+2eH8IYq1Y6NYk9r8pLxlengzIqJC6M0rnEiYIEu1rXB9XBV
         oqfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794554279; x=1795159079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jbKSRLmz7AprKYWxSmdsCwUxL3t+E9S5Fb7xZH5aS6w=;
        b=Sh33LIHeO5IhWI+6vT9hMrMHZ2MY8ie+WnxuedyB8mSsNnfXN6G1T4IK5+j3wTRxbG
         Z2rPaIFuMYYXNa5LUbPzizDQhsLc3lhABqmg+rNBEZFXJ+Qc11BV2p0/vp2gCRi0mjES
         S6dFXmAV1McmhOWTMSBHu30g6HJ2Z1erAH2LsY4DzJSPa+PJ6ixLsHTyyCQE6JozUIU0
         HtrMkf2ZFiUNaDtaWecK/8RdOL1wPmvQ4H9wHv+rpLQT/4wWFjHqKVmlT4ZXR65sfl2E
         Bi2YhL1A8IhzGBSrvdkB3ioyxIdEWwYIUwQLi0Cac5g3Udpoj2mL/2Qanpwb1yFsbgx4
         y3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554279; x=1795159079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbKSRLmz7AprKYWxSmdsCwUxL3t+E9S5Fb7xZH5aS6w=;
        b=2WZa3Glu0rKxWHkrl336+RtXzFGjPTr3gAAZDtwQhbECQLe/M0UBqtAMtzG5wWSgB2
         eHItbFnuLEL2HwCIpCXrkoRiA81bp/a5MQambXiXoH37vcvy6Lw0Nvnm5t5P3MHVYl2U
         GHuBDpAX4q1nN+6IipTyLhX2BU8RMG3vnBpnktmYFAq21QSv6TFoyPJWorsHsr9H/fOZ
         wm5Pq+c+YdTChJ/1L9k2t2JopyQ7zrbBJSnRwYhq6cWHF8tBvIBdjK5o/6zUisvKaKKI
         0SNGEAy8OeYNUaqh6MchCqOGWfwXBabfBLq3qNHx5BhGhXK6OkYzruYANkPUoPA/rMAk
         Ln4w==
X-Forwarded-Encrypted: i=1; AL+hErGq2kkLODIW4vVM5ig5mB/RUkOM7xVNZ0mByEd5/ZOO6KQvC+sOqL4Ur2D0rziUz9wZ5hZLP1D1BOyWtWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3ghmoZmZqqYC6jjqCqqpCPqS+jZNetPto0ObQMyZkW9tWHRxZ
	L0eGdtJ2/pcxvqezo9d1YA03W3y5Mq06c0ZfdR9e/1DTmpOCnYeC/dSsSeZGiq6U8P7rxrc6Y2N
	9fdMw0PFC9jioa/O//QFImJx0bMORTmc=
X-Gm-Gg: AYBFou3YZtpcZQ2PPapnIL31lutATOQyBDknmlxAuBLNhGmwT1tIm4kU3am+4Ho/vcb
	LYqw9x6YT9gGmKBv7Sv2OSabILKg20divsvhNHZ4iuA1r3vR3r14UOUr2t5m7VKgj5qNh/fgf30
	NKOokBJTnXGjrhU6hZ2DqEpqpKP6CFyWsTyFAMoobMuy7r24n6Q77Fxc0uP2HlNZJQnt4bGrQUV
	eaz2ylMhGAweJKd1J6PV8Nk/8E0L1X7dV+MshalpUau9Q4YLkxzcBReLWJ57XQ8Tr9IrJrCxHO5
	mGJS10PJI3oFJUHfobpWHlvFDNpWqxOl9TTQhL0mgkbjRStaEISO0UISUeKX+3n/XvAwvV6Ma1e
	cYhI98WaxDmDe6gKoNfs/zpMDzZ3NByA0IN51cA==
X-Received: by 2002:a17:903:3b8d:b0:2ed:fb0:bfd6 with SMTP id
 d9443c01a7336-2edf1e7b485mr31047135ad.11.1794554279295; Thu, 12 Nov 2026
 23:17:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110075841.12104-1-phucduc.bui@gmail.com> <20261110075841.12104-2-phucduc.bui@gmail.com>
In-Reply-To: <20261110075841.12104-2-phucduc.bui@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 13 Nov 2026 15:17:43 +0800
X-Gm-Features: AclHuK8Qa8UhTmu61wA20WzrbFp-wCX63PxUgDbDHkpoSTkKO8stJMNsRt0tw2w
Message-ID: <CAA+D8ANZB6jviDGAdLTc9K1ZGmmfRCSXrkpqLCuy3DVqcB8uNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_sai: Make fsl_sai_reset_hw() return void
To: phucduc.bui@gmail.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:59=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> fsl_sai_reset_hw() has a single caller, which does not need to
> handle its return value. The function already reports register
> write failures through dev_err().
>
> Change the return type to void and continue clearing RCSR even
> if clearing TCSR fails.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/fsl_sai.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 430e896d064e..59c9b8c28133 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1410,7 +1410,7 @@ static int fsl_sai_check_version(struct device *dev=
)
>         return 0;
>  }
>
> -static int fsl_sai_reset_hw(struct device *dev)
> +static void fsl_sai_reset_hw(struct device *dev)
>  {
>         struct fsl_sai *sai =3D dev_get_drvdata(dev);
>         unsigned char ofs =3D sai->soc_data->reg_offset;
> @@ -1421,18 +1421,12 @@ static int fsl_sai_reset_hw(struct device *dev)
>          * Bootloader may leave SAI running causing interrupt storm.
>          */
>         ret =3D regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
> -       if (ret) {
> +       if (ret)
>                 dev_err(dev, "Failed to clear TCSR: %d\n", ret);
> -               return ret;
> -       }
>
>         ret =3D regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
> -       if (ret) {
> +       if (ret)
>                 dev_err(dev, "Failed to clear RCSR: %d\n", ret);
> -               return ret;
> -       }
> -
> -       return 0;
>  }
>
>  /*
> --
> 2.43.0
>
