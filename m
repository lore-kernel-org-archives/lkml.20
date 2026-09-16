Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85147451981
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548117; cv=pass; b=jVJ13HtdNH1NnpYk5UA/rNmw2LXAJ5wLordMs7KHviD8TyF9u+7mVti4J2I6fsS5OdIrEJr0J+eXkxnqKZO19rcsmgMtk3Ztf8z9mMyjnkdEapJtW7ZaXcU2d5krpey+5bFt+/f8zLPBW19VO0Sj0WzF4J2dTVFZsyHlHw3lvcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548117; c=relaxed/simple;
	bh=e7/xAqBg5IT11bE2uezos0Wp78AbzJMD12bimotik18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRAk1XPNRHZLKb766LskUtpOfBSZtiKnvmJw1X9YFAXaB6ISBFbUHXZvc0GXbQO0QknEQkLpMFnYRvEcZLOZN4ZHXe+8dMJLNjsYIPBfGfsaQEp36W1hC8jOr4vC/ovtRoA6XUxbU+vxP+s/iYjmLUgkcXH0U6XdWXiFii3oIoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkrYwwpJ; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkrYwwpJ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a56so102613666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789548114; cv=none;
        d=google.com; s=arc-20260327;
        b=KKCZCSoe3dbpAHiHXGCORaQD2fiOtbK5eP5e9/Qe8rEli/Qat6w1RFcegmPyy+XUbm
         yRPGWYVOdUuYDjlbhinuSrjebgnIy/y+XeR7AvipjU/PIX9Au9Edg81d4kqcOzjuJdMQ
         e6EmTHqZPLt3lwh9YhNkZKaG3JJBOQUPMfrtCdIdGRhW26eN9Ond8dgBdj6tU+kwvb9r
         RHOJfp8ijr1cYthGlIF3jq6VYpofvL7k0BuiHPd1yhQ0EyjrLcKRnJr6v5sUZ2bE7eVB
         WUCp5WtQ0b7DrOSZ604A2ebZSeXIQ/Nd9P9PN4oh3HUnPNey/llp+Ss8iM4Fht5IiZdu
         qBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0S1eETe3LJ+QwVBor/DGsf/X/yEwY9BbUlBBosf3mxM=;
        fh=QCQ+po1klMHdu51fzTUfqGFcWFduS68MG5CjHTHYAbk=;
        b=Fh4oCFWWvruF0ivJ7+oA5l9uBHxKm9JMTAdB2cZJdF0n354iRbo7akCZn0DcvEpsYh
         wMZTUi5B6V1X55pvlLJlUQqgg2aBCdHmDctc4f8amRpT+wJsDQVSDvLcVl3KwqC0/III
         W4QuC4IaJemhPX5MFQzKWZ5J+NIsF35v6Hq/0ipJByu5Za0MpJJOXEVk09kcyK3QLYAm
         t7AEb/cZD8DosTDVt6vLZQzg3ZoO6s3RCdXV6ygMDDUSuXylg6aQg5krMaQotP49ASxS
         THfZYRK45vqxzmBI143NWrE2rJjmsju5t1kb2EjpXYuj8+hb5N8jOtuU7EGbSGPnctVk
         6C+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789548114; x=1790152914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0S1eETe3LJ+QwVBor/DGsf/X/yEwY9BbUlBBosf3mxM=;
        b=RkrYwwpJILp+mkIrHL455z1Q9VcBOYNKNSr+5ue4UnnuEmFMWlUD6OrA0kh0+9LLxH
         y4mwY3zgaP4IUP97zEX6b+v/Sbktt99dpfzr9Y1hOkCwuVhRodGDoW25OjA55E2OB++c
         zLHm0CA0BfRf7m73z4BDm6mu/YKf+UXE+HDuOjA0fJAxcf7rRg6RF2g9WPEcG7VkZ3Yb
         ThKIBKN94blzly4z/g6zN/Gv0g/0tkj9yEmQiaUxSHXQkfp2sNGh2oClpJTCe8f4R/Dv
         JGYQCuG93jJgfNLxcLqqCkYT0OBPknV/mrXrHYffOwKBS+UqSt2knHpEicOrBLuZ1nVQ
         Ho3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789548114; x=1790152914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0S1eETe3LJ+QwVBor/DGsf/X/yEwY9BbUlBBosf3mxM=;
        b=EXHqLOJ9Ok5UiP9iGwlb6twHchYsQ1IVoU2RQvjIiq5uX+vgN8TaDzOf14Rs6UZqp+
         x5Zpv2+LKFeGKDvTP21b821lzQwvJ6rq0+OHuOGo8EzVbYB+inBSN8oJw4NKisfX7d5U
         4LQzA76xEfThypoJgl3CVHSL2J4x1TbU/Sh+g9UhWwUjLY8PMzM4dmY6qhKfb/ftBl+j
         Z2szBgpFVnOapEPx7ec65W0osDIPUUMM/q7jnbbRx1Dh1c4C/+Aw7zLdH2iKWE/KEQXq
         kpWtC2lh+4hfDTClFtv1WWrQ/UU0BWs0C0ESDZ77Mag4XlmhPNnoAYI2AImAihzjXghd
         vDHA==
X-Forwarded-Encrypted: i=1; AKwUvBy6MA8Jl8qNi3qnIRVjstP2FJerUp6vY0r5n4alehwPh4Tv/Gkq/F7H+ADYawUjSjQDM/i++36z2wmr/0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mkzsHjsaol70ZNBKThUWjF1Tka28bfcENAlJqRDQwj+/d2WwsR
	ZCG+r39Xo+TcHD3cHfnxEGK5AAKIohjhvVYJMIkaQ+JWHDIgOdnk8qBXclTABZ+agDvGugf0HbX
	8WBO4YXsHPSGwEsGh52XeUvidX7KJsps=
X-Gm-Gg: AYBFou2O1meP9bBPRH9FyE4t8OblgS70RH2Lum5E+17PYK7pdvtXJNNLh0ydFn7+OdH
	T1vP9efqvWUOTVFpHGWy3J+wRakwz2/nz/QUQBk1flqr+a73hANlRgvsDp1JqpmLom2qxxRhgZl
	fXNN9iJrwJJuO9XgYtUbVLZ7GZkznCB77CF06Tu+2P45H1RRufwqneqItrQB/lz2XIvKbUpJSUX
	prPQAkB5O5bSpPv8fkwJAUSQnL6fjL8syaCGC50LZbbj72hS01tKa8bkj6W8rfb/ULyMl7kUU4y
	pOVcvxMjnnYe9q1oXQnBZV1eWm90HrrZwUCoOLMPJ+omE0yTYmAgYuxzyJU61lUOjqrOpNik8ls
	oxSq9RYuAqX44WtlTKJBYk+Q=
X-Received: by 2002:a17:907:9621:b0:c29:4415:2ec6 with SMTP id
 a640c23a62f3a-c29e520778fmr118715666b.12.1789548113486; Wed, 16 Sep 2026
 01:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915101556.50467-1-baohua@kernel.org>
In-Reply-To: <20260915101556.50467-1-baohua@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 16 Sep 2026 16:41:17 +0800
X-Gm-Features: AcwNN1XUCBpeSCoeBmmtadQkp77vo0wkXI40Lz2QNWuVRwMGQvQZ3f_HHG0Gorc
Message-ID: <CAMgjq7CL7r_P-dw42uoymCd5TgFME39aBkm8u2BxKg1ia46LJw@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: restore accidentally removed seq < max_seq check
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, baoquan.he@linux.dev, 
	david@kernel.org, hannes@cmpxchg.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev, 
	ridong.chen@linux.dev, shakeel.butt@linux.dev, weixugc@google.com, 
	yuanchu@google.com, yuzhao@google.com, 
	Chuanhua Han <hanchuanhua802@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 6:51=E2=80=AFPM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> Since commit 798c0330c2ca ("mm/mglru: rework aging feedback"),
> the following sanity check was accidentally removed:
>        if (seq < max_seq)
>                return 0;
>
> That means we can perform aging for any value less than or equal to
> max_gen_nr.
>
> This has been inconsistent with
> Documentation/admin-guide/mm/multigen_lru.rst, which states:
>
>  Users can write the following command to ``lru_gen`` to create a new
>  generation ``max_gen_nr+1``:
>
>      ``+ memcg_id node_id max_gen_nr [can_swap [force_scan]]``
>
> The correct semantics are that writing a value smaller than
> max_gen_nr should return 0, since the requested generation already
> exists.
>
> Fixes: 798c0330c2ca ("mm/mglru: rework aging feedback")
> Reported-by: Chuanhua Han <hanchuanhua802@gmail.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 5354eb8d3a07..18c4d3595749 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5827,6 +5827,9 @@ static int run_aging(struct lruvec *lruvec, unsigne=
d long seq,
>  {
>         DEFINE_MAX_SEQ(lruvec);
>
> +       if (seq < max_seq)
> +               return 0;
> +
>         if (seq > max_seq)
>                 return -EINVAL;

Reviewed-by: Kairui Song <kasong@tencent.com>
