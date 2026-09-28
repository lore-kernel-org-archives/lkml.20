Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADCC3630A7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577736; cv=pass; b=FdKvisu7wz0CL3qbkeRwMlmv1Ko5nGvs6gHTnzlbktZYPc7loewwNpRJfwMC3TVIbskWUO1N9pVHeXd5qkvSDC8P5CldP2qmhwPGYslyikjdas4tu45KJzRprNZigh1oK9rwGHnb1IqKkMkHMkZYiCB5WNSWWi4K2uPPUHqh8Xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577736; c=relaxed/simple;
	bh=hTEIRZ6c8CGBsiEY22+3KvOmCoGOgc2cqDVTYQqzn/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOXLQjrWkIRud6Muy08ZttM7lkl2ZxyNyKrfCQ+KBz21sFwewsDgq448H6dOST3fnnpL6h5n/Z4DD9O2tNqqpaFe8E7GsQANungsEV+4jpaFmu3pV+b5UjZB5vEL+dIvYVqjCKJvfXXP2sFIJd/J16I1qGJlPu8Pi7nWTqONTUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hQSBRV9I; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hQSBRV9I"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b8c42da963so8926e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790577732; cv=none;
        d=google.com; s=arc-20260327;
        b=gX4UUfT46T/UaxH3Y1paOqEeGBnFNXJDlBrXPZvHZ2eLPZJHU7pmybE/i71TrXTnCP
         +PBiwGcYWV7u0x/xV9Fgd+3jkT2wph+FTq3bpMm5VPjeuGmx3oNtp2Wt9vKw9QwwmjAy
         s0bLGjfBlI1HU7PB7UznYybcAYx/1leZLXmuE+RR1CN+S6GHSF1KpSAP+k9KG2dJqxeq
         g29NT5xRZFOXxkv0iQKs1b14AudanR9KPV52XURj0A3dh0Yt0LNLnDyTQDaO8FP1jBum
         1EqSaqprWfRClrO9aNHK5dUoVzbyaJl9NE7oC/Da4sOW1izlL5SPyF7vxeTw9BMw9cby
         cefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Bf5Ra9GZUy8aIwIwYwR9PT31QHZBEGPbUTatiNyuQNw=;
        fh=iHU15+bAfMw2FPZe6SKdRGxT6G7mX10GKwsu2IroH2I=;
        b=aBLJV6pBte96QLyLZBc8eVSa5tGk26RdzPZeBXnnm4UouZR2w2PM/83NakkAMmuSSn
         YcNly19/wGa90GcGy0kW6ZE21DZiDWbo8dawmKgiVbrRV/TQi4RwgR0s2N1ZqbqBGNKO
         LoasI0cy6nwI9p3tGk9a2zC1YS4YB7giknEpkM/Xr+u7iTN5+YJ/EtBYyBL1MkZrH0Ab
         3KmN2ZnDB4oce1uloXsNlV8eyeZSBV48V52aAMkrKUrVv2o7jWLqo8uL+BmB4tvGgX5Z
         DCFH+7bpQoPdYNLiclRRzZSCLsML6gSjvnJ/rWYKvW+T5EHRYTr4ANzBbiLVBLPOehXc
         LK7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790577732; x=1791182532; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bf5Ra9GZUy8aIwIwYwR9PT31QHZBEGPbUTatiNyuQNw=;
        b=hQSBRV9IbYZlhqyPN2lL25CtIkjrQAeJ+Zh9YbRCYTwimH8PZ/nMQ70Nnkg8LsC/xr
         73V24QmHN21NkuTwVr1hVUFZd1rALhMAZtmx7vquS6IVzDDQYhJeW0EVpxRQzYplsVaW
         jRnbsq/0QSVJlFgu7dT8uoaX7zjBu0vH0vlwur+zzRbwpHTTd1M9xXxiU30a++wWZTzS
         PvMud++jit1PZC7tBtqyl7l202GRpvdxwsQdYz2TFwz7f7FAphY69GC9d375dKvQmqC1
         h1QZuILkDj/oKH6x3MoWjqH28fPZ0AsczAppsjFC3X2RVEkUtO/fhJT7R/Jiuy1hQp7i
         vLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577732; x=1791182532;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bf5Ra9GZUy8aIwIwYwR9PT31QHZBEGPbUTatiNyuQNw=;
        b=qxpnvSOFAUF/knQG5w9ba2rvGOuTgtxS61Wd4TiZFWR4Guf0ZVVNJGOttq0X6uduOq
         BP1mCXiJcJ/CfcAAdIqTg0EGelk8ctyATJPDtync8cQiegh1bzW5061gozVbraAqtsdE
         n6bqY+TkiOUB3IWviHjD/WszalxG6WCMWNVTkMKxgrl1zMGcO+ydyzZrzYSBHcUu85A7
         SaDoFDkpImlTxvLv/wDUexYJCU/mV/91RVELjet3J79gNkOwow5/jHer3VsNzId1TDhc
         WzifEk/c5LH6cZWG6JGd80N5gekFrN6XVyXcM69OcHOmEHVGnQwx2NQF5NCChoNzgYb2
         fhNw==
X-Forwarded-Encrypted: i=1; AKwUvBzypSwq7lY6QqzBcFsmPlB4/5ipA8HrubLHm3y14M/WprWDodjImqpaKzOANFY1rykHtjABcmEllM5GCp8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJEfvPXcckBeJaUSKjGyrlsyna1Gx4JR3jWceu0UwXd4iB+ed2
	XozlHyp7ClALptIbohVPxUtwUMcCIGvT/UZJSW7sBXLMVYoaLBfB3PWuYbKscvl9243X26S8MSq
	1N/C8ZpiPLsLsXGyL7BWmGifx/3NhXmru/p/9GMgC
X-Gm-Gg: AYBFou2vz9+kFDC9yn40mXud1Pd93LuhOEExNVmkx/VyeBON5Ptny6beEjb5Yf1LtrE
	lwOrO90BYUC/Kb/CmmNYYoEiPHqKJoCHRnNuxw8GvOmvUsWkhGLrRl2t+DDutNhGH4lhA/mHe6v
	uGk4g9kTssm2T0lIlQP888D5UJoElje6NosPod87vcc3inEbcJRvTZlzMKerPxNUSgPSwBJDULz
	RAUGUVv437K+nmDmO8lYErYodekjHW6IJEN08fllFiGOf0xVmX0fR33tPfE3btMktJwcKCUODfz
	Pp3+43qcUgrgW9PF9RsjpzWSSWvmi+tdayOYFcDzY3jPbNCIOZE9KRopwD/FAsI39nGOBfrY/qr
	amDUk+X29eWQ86CELUIbsQHY=
X-Received: by 2002:a05:6512:118e:b0:5b2:a967:c0e1 with SMTP id
 2adb3069b0e04-5b8ef0d8197mr147876e87.0.1790577731865; Sun, 27 Sep 2026
 23:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908142632.2795308-1-fuad.tabba@linux.dev>
In-Reply-To: <20260908142632.2795308-1-fuad.tabba@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 28 Sep 2026 07:41:35 +0100
X-Gm-Features: AclHuK-BFXQVxwev1h4oFTaX98t3AUrNTYP55S4zDU1gVDwi9bqTXCzyYzdaWQM
Message-ID: <CA+EHjTx-MGu=Rh90WDnTWMS4=8vcOdbhR35g42BtRBy7wqXBXg@mail.gmail.com>
Subject: Re: [PATCH 0/3] irqchip/gic-v3: Lifetime and range fixes in the GICv3
 and ITS drivers
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Will Deacon <will@kernel.org>, stable@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 8 Sept 2026 at 15:26, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> Hi folks,
>
> Three fixes to the GICv3 and ITS drivers, from reviewing the GIC series
> floating around and chasing down Sashiko's reports.
>
> The first releases the partition node that gic_irq_get_fwspec_info()
> takes from of_find_node_by_phandle() and never puts. Sashiko raised it
> on an of/irq patch of mine, and I said a fix was forthcoming [1].
>
> The second widens the per-device MSI clamp, which truncates to zero when
> GITS_TYPER.ID_bits is at its maximum and then denies every MSI on that
> ITS. I couldn't find an implementation that reports that maximum, so
> this is one value at the edge rather than something anyone is hitting.
> It carries Cc: stable because the commit it fixes was itself
> backported, so drop the tag if you'd rather.
>
> The third clears vpt_page once its_vpe_teardown() has freed it, so the
> NULL guard holds if teardown runs again on the same vPE.
>
> Based on Linux 7.3-rc2 (df2908090cda3).

Gentle ping on this one; it has R-bs from Marc, Radu and Zenghui.
Anything else needed for it?

Cheers,
/fuad

>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/CA+EHjTx7eP_30vP47=UFk_wMAut-2uf+2DF-MZqn2SLE_k-8qg@mail.gmail.com/
>
> Fuad Tabba (3):
>   irqchip/gic-v3: Release the partition node in
>     gic_irq_get_fwspec_info()
>   irqchip/gic-v3-its: Don't clamp nvecs to zero when id_bits is 32
>   irqchip/gic-v3-its: Clear vpt_page after freeing the pending table
>
>  drivers/irqchip/irq-gic-v3-its.c | 3 ++-
>  drivers/irqchip/irq-gic-v3.c     | 7 ++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
>
> base-commit: df2908090cda368b01ff43709f51890076c56157
> --
> 2.39.5
>
