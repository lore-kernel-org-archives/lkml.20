Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EAB363097
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791741450; cv=pass; b=LWA1W/W8zIg/ZWG6HY3ZQW5pl+U4FiRQEYbs9lPl8yI2Oxrnz5oOQsfLYWbfe6XJ1bpp5U5VMJQr/VmbEav3yzzKMSyBNbyY6fOUtwtz2cZMLphkoJmO8/1GLZP4DlyJ5dEL+BWcCicOMXeWZ7fBGKLWW+83aKaDrRE775KhY6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791741450; c=relaxed/simple;
	bh=vv0u8vo23cbfMgzNVqcLLtv9/ElCfp9eTCctT0UEpkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thDwmjasi2v6de4J9TR2vGPIs+rN8WxiI/zhlcI6YavDtqZAl9RMW4/0IFHlabPNt+srUITxbJSPdZAgJrQNx2A9jEWli6b4NV82D8VCi+rgnShHW4gErIHdHPdphekUsdsrP11+LJPLePt5lxImRb2SqDnmSDBByDNIlZzZaAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJaVnmbN; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJaVnmbN"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so1683723a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791741447; cv=none;
        d=google.com; s=arc-20260327;
        b=sG+M6B8Y0m+MRw9Jt/kxHvLNAiOGvMDAc6IOKTyWGw4jLF3xM8L65+LRsVCQ5FJhbM
         nNFShFcQhzwk+QQEUvAGDlQ9pgMWWcWww6xKh2+L+9gizgUEu5QfBkBSn3SJMPmlEJD9
         aF+YQz2xi2VzpA8cNOpxCp8dnaTGHl5KN7he42HHoT0DNClMj7BPKZThdXN2qM3zr+aG
         jsjdB+pQCw3XgBdZ/bOM2Bk6IudIZveCcmUke0nrVNd/swQ2P0K+uTfiSNf2MGeKq8yG
         ayNa7OFOMfDMzjzjJx6EPwokDMJ2taV3+dSLNJBK/CUCgLue0b+/mLukwiH8Yq8MJ5wU
         tB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vv0u8vo23cbfMgzNVqcLLtv9/ElCfp9eTCctT0UEpkA=;
        fh=dscZChxK9RzMat9umptGMC+CQ3K8DfJTOBzg8TXO9bQ=;
        b=ggwHehubWzEWU0WiTjkYzzZvlOy5CZ9Y6h/T253yg+xLylUjEWML1DVht1FjuHCWKb
         o/tvjkJTd1lu5yLmJUZXkrZ+ACa9ocTnILaL1LAAw58KZoonbvQxyWkcEvyN+58aAZUc
         pdaP0y/0iGPsqqSLZayP8ahbxcf2EUWi/c4Tph+EyVKFucezQTCG237oiwfPo72LSJab
         wkKM/ocV9sODmnxJN73dmhFq0OZPUL1JD1bxpbJ5iCZ8FZremgJ+gRyAO7Jcb9BGW2FY
         J/bhFCwp5UzFXIV9zKllsTkHxA9S4kmFUNcpbU2yK5XdEERIGckOWkPwqbc5m7wWyUA3
         abvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791741447; x=1792346247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vv0u8vo23cbfMgzNVqcLLtv9/ElCfp9eTCctT0UEpkA=;
        b=BJaVnmbN8RomVt60emh0wOzJ1MplR3D2i9RM1O9V8MJhnilKsYhnG+qqQbzJWB8IiM
         jEVsccI6Wn2rGBnvFUd/lZW51I883Y9etPxJCdKDp+ow7oAv+3EESxnkGqT+Ypqu0AR9
         nKA4xSM+moF7wQd05dxGgx33AkxOCq27BltSZoaiqNSgB394TfFP7BUtVkmtX3Z3CDdf
         LiJCjw5b8TaneazjNTbKnyzifvYp8mJYT1K+ii60jrF0GrkZaj26aqP4O0+q+DtKqDeB
         DqGWsxiNGdfCipIFVj8MvvRQlXOdAFKedISJOnTHHa02gxUNb2ejOLWwriWm0ewD3Aqr
         59kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791741447; x=1792346247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vv0u8vo23cbfMgzNVqcLLtv9/ElCfp9eTCctT0UEpkA=;
        b=XrpvjaypiRzP/iwre3AvGnwtf+OAucOYYiDgggMCuJeBi8kohXSrev2m6mC3hTWXMp
         u1DQlX0r804VTTAcdYWn3z5D+DfiMku4R6swvLpcxrUlUH7EkaBVXXPZjG1/X5BusIKE
         tLPsLp5jYdbeOfU7yT9KfmcofRr50bDvbhSkagE48FjjABIkl1ca5rHTniq2dgST/vj5
         ii18CMJArGuHHgjbQRFaK+HKt+TUaajxaVNms/pq4/qHw4auqelxjtPcQHcTd1gMw/Aa
         joYuY6Wq5S6fEuYiHitPmsCqI+FOsdnFmGWlmwFrRKiet6jSilQMQBeMuDofQjH6v4Fr
         bJHQ==
X-Forwarded-Encrypted: i=1; AKwUvByrDco7SxxZppZ/mYiTKzOPNhw+etXFNQAAcL9MhIutLaijFu6ucZLwSIMeTROFtii0Jinp5HJYAS+4+Ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDeWIntiha8UstPUAJGVdZJXRH69uHX6TXqUfCkJdz2vQ+DTR3
	aqs0a94ppRyx0DDHd0pv8yAPm1tMhhUVc+U7WhWP0c17qAHN3NMLUjNe6+SmVy0YJVwdTi6fhIm
	n5dvpFwu0cbtNc0HZXlIkJO3sqVu9ckQ=
X-Gm-Gg: AYBFou2SCLojIZb941+mqCs+L45WyqCLyaxGj3WlNgp4CDcqRm1xHZXdArFBJn2ek5e
	NOefNr6tTNSC9g6zHE8F4yOHXSsehiMRhuoYzEa/zEwyHByLYt/xqd7vCbK7CVFatDm0+hecduI
	G7QdpY3Z+9RDymqZkDiS7c0hOeg5Mr3KUaOysq97OmHBzZJoBE4+N/qugy3cRn6aT38LLOyhGG4
	/DzPbOBx4eDsWX/dhNQt2zRX3O8PuhrGKboJzPJ0MvkT2Xl1j3iI8HcN8RGs18UTbY1CkkVcrYK
	yT3T6HX8Moq9pVCuxv905IaSr+i5UiquzFqL/5Gvq1Jl5UXiKh7lajmSNvd82koJMNYIHCtYfeN
	mo/J5K7wj1yf6yk6HQ+tT5em12j58tt2kiElMqlcaxg==
X-Received: by 2002:a05:6402:501e:b0:6ab:e30:c9a7 with SMTP id
 4fb4d7f45d1cf-6b17c23e3bcmr6751589a12.10.1791741447143; Sun, 11 Oct 2026
 10:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-2-linmag7@gmail.com>
 <CAEdQ38FAO=9V5VLbNCTE+8oyA4hcd2kYL0t=UYHkHTpWBj_-FA@mail.gmail.com>
In-Reply-To: <CAEdQ38FAO=9V5VLbNCTE+8oyA4hcd2kYL0t=UYHkHTpWBj_-FA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 11 Oct 2026 19:57:15 +0200
X-Gm-Features: AclHuK-v0A-9qIiMWYRGUniSAjPB1V_8t7ZwGE_oKW-OkEmDc2yZJTZk47qD9nM
Message-ID: <CA+=Fv5RSvMUVwCjvYnnA1ZJ3fvNiekc2XLP_SbL0oUFNiPacwA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] alpha: move Tsunami machine check handling to err_tsunami.c
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 10, 2026 at 3:36=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Subject: Re: [PATCH v5 1/5] alpha: move Tsunami machine check handling
> to err_tsunami.c
> In-Reply-To: <20261009115627.969047-2-linmag7@gmail.com>
>
> On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> > Move the existing handler and PCI error clearing helpers without changi=
ng
> > their behavior. Build the error objects for ALPHA_TSUNAMI so that all
> > Tsunami configurations, including non-generic Shark, can use them.
>
> > +obj-$(CONFIG_ALPHA_TSUNAMI) +=3D err_ev6.o err_tsunami.o
>
> Nit: nothing in a non-generic Tsunami build uses err_ev6.o until patch 4,
> so that half could move there. Not worth a respin on its own.
>
> I built each patch with W=3D1 for GENERIC and SHARK, and the tip for DP26=
4
> and EIGER as well. No new warnings. GENERIC boots on QEMU's clipper with
> two CPUs.
>
> Reviewed-by: Matt Turner <mattst88@gmail.com>

Thanks, I've moved that dependency to patch 4 in the upcoming v6.
 I'll pick up your tag for the v6

Magnus
