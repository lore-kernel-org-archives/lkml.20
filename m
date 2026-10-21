Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792593889;
	b=5BoXI+1abS070KjY+rvbgjucboBxmweSScj1GdTfmt7+EWdCMFNsH314WNFv+0KXkDcq
	 u92vnRIsCJaklMdVgObGX0oA4VGlWsDNjF4R34GnJ55fv+tbguAB+eAW1HVR0eGcgwqxJ
	 E6MBzf/hdC7vE8a1yWvemF3Ij1XNtZFAuJiP44znGOyi+tGGnO79gFIxb+36Mtn6tzmzg
	 FGaoYJNv2ljFTGgrVdR7YL5ulkmq4sQvedehp2pYV15IwfSQGV7XtPsP1cDlY+Plft4zy
	 WlpSF4C/x54MBT4/2BO1/7tD8AR3nnWPp9bLALCiMsfVePNC3w3lTPBOaQnGIYdHUeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/SdtQTNimM/c3u01Pfi/YBznj47rzAqOlWwKwD5tFqA=;
	b=PFZWAiHja+wD/cyVVHT+5hMz5r2q97sRwLhoMllby8lIONCYMvzlUNBCdyrymWiqE96D
	 5rFhAOMjA1I2udq+p4kTMFEtojCM9IV7vfvzYeJMlWim/BepMVgDb6FgrnkndGdKZ0TBJ
	 bDNvVPf76hJsNkF6PlFqQj1jxs+TtWHw+sNZ7aOEdbMg1JBxXT9m9mA5v3knqqZpfn24P
	 Azf7e9rXiaBzwg62zF0oj2wxpYJ3OgFUWdzndJfUF0nqYyopOy5kZyunxS7vgTn8ZPcxO
	 cQgBKeR+YKRq3GvNj6BUhnWbPrp0Q8W/cPgWJLFdN/wR7h0LvK4ItO5am4BIqoeevtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nouA8OrF;
	arc=fail smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06930606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06930606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nouA8OrF
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso1306966a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792593887; cv=none;
        d=google.com; s=arc-20260327;
        b=Lt44CH+1rnOxx/M0c95QYk0KiqvCT7AecwZUivTxBHVQUc5oYUuR/qul+e90EkbrgB
         m7VFrSuQATJ+5ZznPqJxSbFywoj5eaZ9mZfzuJ7VKHbe/FtN9+Kos7BtPzVXZ+ibF3nC
         XORRoc+7OsxMDGH3dffCiH5os3aSZa/DRmpR+blfHtFZceEnrXM9ZXCyXT1eqV9L1x2w
         s07TTg+WLgo5i1WO+ctKlByjefsvvbZaOMSMRp65f192rnZ94jbNIVahrhOKY0XHGaNq
         zXRmLC8xgfcjvlk9utCcLxrlYoZ+n2AFKy4eNg2gcnLadCqFx758mAruffSKRqAhWpoS
         XIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/SdtQTNimM/c3u01Pfi/YBznj47rzAqOlWwKwD5tFqA=;
        fh=/FZumscSPQ3DboFtZPSYx2xa67IuwuQdjbtt1UMhJJo=;
        b=bPv4JNa6voIg3yiywCDZ9UqGAK9wgs4Z7K14Bww8OHkkHxdmgJps86b/c18t9KQbr1
         xLfIVG6hIrrldKKHyMH4gFOKNZJpSAd41+toZc8Pwt+aziTly8Bwl1NVtjk9UjMhWkDJ
         pJ5BW56/CaOAru1yWTCA9EkY5H9HH70CrUWRVFaC1E97XipolMmAU3itJ9Dlb3iijZ03
         SGa12cMUY639bA1gE6XTtyPuettbYXZlrsZQpT5nzoR+QCv0SOAZd12b7vCS1XHq4Ml9
         2+YXcm9nMjj4JVGC2KKsi1qM1PZXjlmCvtqCTYtiWoV7ZWSz31pEvopGJPjivX/7t9di
         1IvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792593887; x=1793198687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/SdtQTNimM/c3u01Pfi/YBznj47rzAqOlWwKwD5tFqA=;
        b=nouA8OrFHl9fL+Lbh8UUUMpO7SjMwKij2146wVdw/8LZq1UUbu+8UIAa+Vk9Oz9N/s
         fHFJcw2EBJ1AqJ7qIiN/kt7dDUMJdbaeeFSyMam0lLrXPsQ3AFSlbHM6y9S9mkTDLsUR
         rq9+QlbcqzvtPCEpXU57Nltj2xyy+vGjTfByAjPGYvr+dXVBWcsP/PY4/Gwa8d5j0o3G
         vvrgpmDNWIW9WMitGh1inycGZaVfZYy1R9g+LkHa7aNdEzM0PNAv+TL5l8IJ9Ba+q5/d
         vE2aywY1pKC1tI3n2CivL7O1i2tKoqrqq8f15D8JnSiPql0b6gbolg7acmfuMJZQW4hu
         Gu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593887; x=1793198687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SdtQTNimM/c3u01Pfi/YBznj47rzAqOlWwKwD5tFqA=;
        b=vBgmnJ1IG7L87EpyQ6m4rXslDTiVZpFxRzY1Twq6afRDAJQKN4FL+004fx0U8tAvYG
         YrwBEzcv5RuHt61kCTtL5usFmoKTi2H11QmSoOgikSqOMnCAI2JeXVbSdnP3xA7si3jM
         Htksps9jK08O5LPrXBXO15IUO5NXMUI9DtPwHKoAYhIHrRXpFsjy/Hv6V2RNc/2bTmPe
         oWN9M2b20kwGnwECma7qMRBvANnrNA7CtZ4Vdn9FRQy8L+A81QvIrW2/hsZqe2qfw0BQ
         fIwcY+dBUloYm+tFaAEZXm3yuPuqavUwfAfMkIbaUYrDFObzh9bKWJIb45brzshixZvf
         3wDg==
X-Forwarded-Encrypted: i=1; AKwUvBwQaeapBFr/dNXpu3Cbm1dhiZiHvyBwNf6GbMXu0yX3jLSWZsq4RZMYIXaM493IkJ+3Tk6ybnFfcgRAsEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI655KrCag2VJ6suwy7ELXzfFL29dQI1ZpJbNMDM7ciXiXnyXSr
	70oeOl9iTrylvEzdtC3LsPJc4qqGV/jPnzDHLmtt6WM85oiwkf0x5FWBzI4+Lk+N140+g/S9Eps
	GyPwBjFPEveanYxq09acB2Hd9ydZtbzpYrTrudIc=
X-Gm-Gg: AYBFou0B5P3xwkjeuk7nZB3BtH/1E3csmpftNzGDa5lfowDxEl/CWyj4TGtgyLcMybT
	JFsoQXjenWYhPThouc0dkxcpfFx+TkDsxjrxWkzCS79O2h68qsnLrILfoNVJeh263dJ3KVBB9+D
	zjiq3kt0WzA4QKGIGv/t8mDqZ56N/qIynTvUdOGZWPSzn8YLYLs1NHCHzLqZZzLSuCp/2fdmxGZ
	0ThOo8+mUREHJTPeRFSyyZOkaKEXmp7lNFB6vDCH8P5ypp8oli6b+A7dClU7EB2CyPXRSQRh2GU
	KntCVJ7CjsbefoYmxGbymfr3CNqoQF3ujzbAWyIcqBd0l1WqRNOpB4fLXr6HZrRyPHlcQo9excv
	0HeMKEdcyH+Vh+dnISnabbk5UzGABvRm1G2U1v/Xr1V+cUbrfsO71CVm1I87f44BPT6qv5w==
X-Received: by 2002:a05:6402:5291:b0:6ac:62aa:e3dc with SMTP id
 4fb4d7f45d1cf-6b408eb3552mr1639911a12.26.1792593887204; Wed, 21 Oct 2026
 07:44:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ati4xX95dHM-JY3c@sirena.co.uk>
In-Reply-To: <ati4xX95dHM-JY3c@sirena.co.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 21 Oct 2026 16:44:36 +0200
X-Gm-Features: AclHuK9-_oEVXrOAJj0SwuXd-a1VmqfYh3sfYNg3IqYu3jEkHopwEjZfieqzVbM
Message-ID: <CA+=Fv5Q5Lg4pS47Ki=Mnx3r9oEHrx9Fa588y8g6zmgSjjK3N5A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mm tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, Oct 21, 2026 at 3:42=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the mm tree got a conflict in:
>
>   arch/alpha/Kconfig
>
> between commit:
>
>   0d4c9dd06c364 ("alpha: select SPARSE_IRQ")
>
> from the origin tree and commit:
>
>   35e340a47888e ("mm: userland pgtable freeing is RCU-safe now, remove le=
ftover bits")
>
> from the mm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc arch/alpha/Kconfig
> index 8fafbfabd1e51,9063c7bda4e41..0000000000000
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@@ -71,10 -42,7 +71,9 @@@ config ALPH
>         select ARCH_STACKWALK
>         select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
>         select MMU_GATHER_NO_RANGE
> -       select MMU_GATHER_RCU_TABLE_FREE
>  +      select SPARSE_IRQ
>         select SPARSEMEM_EXTREME if SPARSEMEM
>  +      select SYSCTL_EXCEPTION_TRACE
>         select ZONE_DMA
>         select TRACE_IRQFLAGS_SUPPORT
>         select ARCH_WANT_FRAME_POINTERS

The resolution looks correct to me. Thanks for resolving this.

Regards,

Magnus
