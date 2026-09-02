Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7431938239E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386196; cv=pass; b=km0dK8qqFZUYU5PDt9y/q5hYyzCIBZ+Uz6+YljNH8uAkxroXOWE7EU1BeeoVPsSUk/MNGn9GXyJ+ygfWN6eD3rWOqM5NyMFYIgI0TuCnF7XuB2HLroWiKINvUQQ0TydagPZpH5tsFtO7+8bd70kTi6DL6kSLG+JfGix+AZgvIzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386196; c=relaxed/simple;
	bh=21/nJ2JG86ZmyudvdGJFQmlHwpTTr1KQYUF2u8EakGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyEjMVtvAzwa2SdcYvLNQhfGCBIKfuGlMYxFEjH0izU7bM5Y6krbVsfyvNFi677k1mR76HjQZGr2bgnl8S091tMVegN2mwVVb86WXCTPSPjbxV0yoeGK4NYATFoMNHNcKw1Nv2/iecaW3JLlUsCG4SYIGs4FwRJgN11mSMds1Ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eObhKXzc; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eObhKXzc"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a623987d32so2693101a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788386189; cv=none;
        d=google.com; s=arc-20260327;
        b=EVFf3Eet08B8VP2IZnsEK3q2J1QoK2bTeWI9DNiCX+HUqfwdc8wWyxvE7Mgfo+qw4a
         ZUV5MNf1xsa/0HWjKklpzPLXpgYEuejHk1bc/DpHnJFvUa9cTu9isaicatjLLjIhKWfW
         pZwqhea4pRmACpFygqrmzRoRbWCLuTS8cKIJ2GPu8K+DSWIf+n9XZN5//40pisbNWGwh
         pYouuC0HNkbczyMdCeGknMxuDYrMyDsXBhW/Ekzi6N6Wj9fjBcq+EETuaSwtXEvnRG+D
         RfmPIfgcj36wlWTUq1e47MjscgLT6gyvt5r8cXcfF9MwKx8UPDiwZg6vwZOK6VuyydRY
         VnFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lcF/ULVELGwtuvOq9i4Lf+ITn8c75wezBXYyv+4wehA=;
        fh=R93fSNSBEI6GDqVtgrdcVy2+v1/tpjlWOFZqv/KTaeM=;
        b=g2+LSM/P2NEWtgeAzUAxGo1ap/+W0T28o9s3Ob3CMvpwDH/IlMbXqXEX6zNtaLo80/
         cqx0WKio6QjthsXWyiL7h3ImbOJvw0YUjGYhevDzPZpQfnweP6pd/vURReiX+fYBCngf
         nkzqlqu82Bo0hwK/Iq8Ly4KfClvxV+VJTvlliE1NFUacNAEQAQ6h7GKmj0jNbriGj9sk
         rzu43z7u6BBykjZmfidrUMzv514tIU42+2Dpfd7pCiQmChdbvrtOJGz9c6qdqEnMyOoh
         zjf7aQx97v900mByXTs1DxGrzPYMmBKkBO+JKScnCCr1agDsZAb29FVfvn0ycUgTR1OQ
         vsoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788386189; x=1788990989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lcF/ULVELGwtuvOq9i4Lf+ITn8c75wezBXYyv+4wehA=;
        b=eObhKXzcfiSaSbeB0/f2H2ZtvP4+jCVvM9EG+w0o424e21gOheXiA46MQq48SXYNHZ
         4/zc4Y8v+LY5Ri/Ks2GhCXQf3ExMK7MQT5xNtGGy+z9Rfm6XzXzqmAS+vkZbTMQFY2ig
         rU7nFo/9pO5nFrPhXw4DL9/DAF+uqSeZK7KaJc/mri597WzbuPCKPRaoo5jm4I+Cu8to
         b8Jd7yWlp+76Wm2Ayjjg/5IsfHopIeHg00rIJlIzr8BAypJXQj8i5sTEu3CZyiDp1p+b
         lIeZfpJbz+68BnLxGWhdRrYkGURwxye1zcsOpASLxVyO82QFg8kSSvTYuyatd51Lts/G
         Ad2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386189; x=1788990989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcF/ULVELGwtuvOq9i4Lf+ITn8c75wezBXYyv+4wehA=;
        b=PNOPGhaW5kOmmR0ZvBDNmswOfjbxbsw1cXIu9fY5kGXJiT+KfVujXZKLeV6p9Dr8dk
         vvpQnEJUAa79n5y4Ijz39R1iVFrM9Kf5to/IIOMLeBVYsKfkGcD8n3DdmkjQ/QxdLurA
         AT1oANICiBz79j40fkvM/ldhIXcZRu5YtWYbkZd3HETOg0mh2BzuG//ROFN3ClS3PwZM
         njmDmHubKuj26H12RiJx4iF4w47UEBHIybv+CJ1zlUOcBPtQFISIyxuxwooAkuQmEwc5
         CDpdBF5xyW1NJ+c94MXZIi6uVyK7J8S3hDcj2vF+tsGMEJAsyUoplnE/XOkzcpIaBbe3
         UtIA==
X-Forwarded-Encrypted: i=1; AKwUvBy/Pt2JZClQKenNjaIrQuaPM5rlmBqH8FUOl4eYfJASfHBz5t2PF/JACw/cZmLxJPAcI/hcn3fdarkb+aE=@vger.kernel.org
X-Gm-Message-State: AFuF++lxbaIKVyapmz1jKYW0IkdUtt8z811ODzOMw1RQ40LJ/VVZG+nS
	GhybEVDbpd/McOW5NmBKxEd0cNlDsziQoXzMgaKaqN65UgKGLw3+Qezf7ldItyNMFFMXzscToqI
	8udNBDtFYVjzSyTbfNO6H9s5c1ybryxs=
X-Gm-Gg: AYBFou3+5W2kMh5oCyndUj7SfLrnTq7/ZrketZdW8KkuogrHTto/tNyHtSV6uAPx6a/
	4BckfFdTCvqaooN9GBq1ys0Vl3O3R+iGc5K4EPF68ZbKbmNo9aRJWJ3Nl5xxE47NafLqef0rno6
	xQFmg6COGu4WnbaatIokJ/LfsRtERJalyh1WrJoE48eh56siz9Qv/kO70dRqOqA9EQsiSOQWrRq
	LRMrPX2Ek49czvw2fGPT+L4JdF0png9nhS5MJE9dtHgfpmqBtVzbOklfZvcgeaqKDsb5yfvSGsM
	YQFug9XxMqFpDPoXJARslZ69v7DiS6bEHX12Wtj2mSMyiGXtN+Bviatmzm5tNYqdQcf8U3l0rXH
	EVXNLd6JRn8cMprQ6nmuDz7UNEEkbBAnOFx1r0COjxyk=
X-Received: by 2002:a05:6402:46c5:b0:6a6:4004:4ae6 with SMTP id
 4fb4d7f45d1cf-6a682566eb2mr5060996a12.5.1788386189035; Wed, 02 Sep 2026
 14:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <21e157eb4865cb6d2d9388941d5d1dfa2e0fc42c.1788277742.git.mattst88@gmail.com>
In-Reply-To: <21e157eb4865cb6d2d9388941d5d1dfa2e0fc42c.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 23:56:17 +0200
X-Gm-Features: AcwNN1VjYq87qITE7Acw5kFbCny_dOG0XnyqA8y65CBq98Ml7GCwlC7kFUqBG_g
Message-ID: <CA+=Fv5TY5x0e+NMaYWV1u7=Xb2fZELQ2AjMXv9a8E842orTPCw@mail.gmail.com>
Subject: Re: [PATCH 17/24] alpha: select ARCH_USE_MEMTEST
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Wire up the generic early memtest from arch_mm_preinit(), which runs
> after parse_early_param() has picked up the memtest=3D command line optio=
n
> and before memblock_free_all() hands the memory to the buddy allocator.
> paging_init() would be the natural place, but Alpha calls it from
> setup_arch(), before the option is parsed, so the test would never run.
>
> The test range starts at the first DRAM address rather than physical zero
> because low memory on Alpha is owned by the console and PALcode.
>
> Tested under QEMU with memtest=3D4: all four patterns pass over the free
> memblock ranges, with no bad memory reserved.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>


I tested this on an Alpha UP2000 with CONFIG_MEMTEST=3Dy and memtest=3D4.
The early memory test completed successfully and reported:

  EarlyMemtestBad:       0 kB

It would also be useful to add ALPHA to the memtest=3D architecture list
in Documentation/admin-guide/kernel-parameters.txt.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
