Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335999;
	b=Pg5qHi273a73O6S+xZnWM3MO5q1dYHpYS/2CH9djeIdT1JnOKPgCQ9vLAiTIEYlyi0uK
	 Xvc1bB1rEI1elBS11nW1pgenb7U1MMhnJqktxCErNN/STvzZP75+LBWTrkVL9SCyOZiE3
	 kXm4BZEl3CbJKjZbC1xuhE6aqJYDGQ+KnD3f6BF/noMhovcdK9HHUAQN+7g0eK6mBPGGS
	 FSeZ2mBz5m9uEiKwgys+LBBDmBSuWsJX1ZWd8teq53ZLugbZvbqsatpIq2d2JbeDRkGSj
	 oqkmZnVv4eQGWtmWMvHdpCFs9jaVDV0JBwxETI4PkbizxMQ+QcqCWY0k8h1IfWUCT3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335999;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mSu9huz2P2BIqLg4VSlrw2IyVyTMF0S9AWcYah892oM=;
	b=MRqH3CdEtCkZYZl15Prq8VDx4apioXbdNd3+5RDw3XWDy1a+oxKD2I1ZbRsOvxLkjKrY
	 cEemBcXhHz4LMA9vj/Vd5Ld/rz/Dv6QMFF8qJIYUO1OWpgcWAWXiAkFbTDe12K8fMVfY7
	 wPy0a/eEW8xqj4pK45VCBxE0LR59Eutph7Pm0dJl9M0pCdyGptB/D89YTU0ER8+ihO5Wg
	 RcJVAC8d383lgBp9ne5hJE6hpEkJzy621zhhUSy7RXHz6++bw8Vd1oDxNzJ99Vxb7cNQc
	 ei7MgdEPy0DAZOisJbLiUehk5MykTB360ZsqC/qgPi7Tygpe2WB3uDdVOKqEVdvc1eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIwA3mBj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A428160A3818
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIwA3mBj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440141F008A5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794335998;
	bh=mSu9huz2P2BIqLg4VSlrw2IyVyTMF0S9AWcYah892oM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MIwA3mBjcMiwzyXcF4mOl4WWKNheL+IHPTTrsSsa6czIfNgy6P1pQrFNo1jIMdQkh
	 BjwIMXhii+k1jM8zGZN0IRMH5F1eDkRzBVckw1n1tpekM0rfJorpqUx1qYw0DNevZn
	 SFY6BcKECj5+AjdnkqyGhqpF0JA4t8f2QMDr4XkoEbyccj8Pe/9Tq9S3YuLYaUf61b
	 pRKX9nFwFFIpH0SR0FcAU06sFDP3vWMtVDO4fqXb/zVvuD61rHsUH90/Fej5Gy4bQ5
	 I7rFT/ky0ub6+Ap/jv0hlie2j10UgAiqdxGhevEQ6KQqS6GPO5UDF5et8filZvLFQA
	 /HWJmFiUdHcZg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae0eb56ba1so6659811fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:39:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGtYX0uaD74Y5QWEJJAXzQnTw3T3Mckr/ypdmTJyG9LfzHv655I6xELusnsJxBQEMvEN9d0MnE5fVJGwB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Pgc/VselauGx1XKpCOFjJQ0W5PGIhJgmuMM9B30vSyogoPoc3
	kkowuNRhXaXRU1cTDaVYja6SaeDWodcHALvJWoRHJ2HcOLZ+HiW6dpVQ76N9+sLblAtQbtwaCKY
	oYEeiLFb1HwDgD4eGzvJ5LrMjFmiZXmo=
X-Received: by 2002:a05:651c:2124:b0:3ac:efa7:24ac with SMTP id
 38308e7fff4ca-3ae0964d8d2mr7801731fa.22.1794335996711; Tue, 10 Nov 2026
 10:39:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-powerclamp_mwait_msg-v1-1-18c03fa17ebe@debian.org>
In-Reply-To: <20261110-powerclamp_mwait_msg-v1-1-18c03fa17ebe@debian.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 19:39:43 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iOxMR-de1yYRGmzz7ekqhP+jLPtdPm2xBSmi4qVkc6GA@mail.gmail.com>
X-Gm-Features: AclHuK-FRRfShesNcbCbTIaHFA5P5FBPVmGJrODfxHyZQW8sXGtDOLTL2HQnFA8
Message-ID: <CAJZ5v0iOxMR-de1yYRGmzz7ekqhP+jLPtdPm2xBSmi4qVkc6GA@mail.gmail.com>
Subject: Re: [PATCH] thermal: intel: powerclamp: Do not log an error on
 unsupported CPUs
To: Breno Leitao <leitao@debian.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 4:30=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> powerclamp_probe() returns -ENODEV unless x86_match_cpu() finds an
> Intel CPU with MWAIT, and logs "CPU does not support MWAIT" at KERN_ERR
> when it does not.
>
> As a result, a kernel with CONFIG_INTEL_POWERCLAMP=3Dy logs this error on
> every boot on a non-Intel CPU.
>
>   # grep -m1 vendor_id /proc/cpuinfo
>   vendor_id     : AuthenticAMD
>   # grep -m1 -o -w monitor /proc/cpuinfo
>   monitor
>   # dmesg -l err | grep intel_powerclamp:
>   [    0.485728] intel_powerclamp: CPU does not support MWAIT
>
> At KERN_ERR the line also gets past "quiet" and lands on the console,
> and on kernel metrics.
>
> Reduce it to debug, and also name both conditions in the message.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/thermal/intel/intel_powerclamp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/intel/intel_powerclamp.c b/drivers/thermal/i=
ntel/intel_powerclamp.c
> index 1ffcb0a699e57d..82587dc8b0156f 100644
> --- a/drivers/thermal/intel/intel_powerclamp.c
> +++ b/drivers/thermal/intel/intel_powerclamp.c
> @@ -695,7 +695,7 @@ static int __init powerclamp_probe(void)
>  {
>
>         if (!x86_match_cpu(intel_powerclamp_ids)) {
> -               pr_err("CPU does not support MWAIT\n");
> +               pr_debug("CPU is not Intel or does not support MWAIT\n");
>                 return -ENODEV;
>         }
>
>
> ---

Applied as 7.5 material, thanks!
