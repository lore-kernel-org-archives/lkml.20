Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0933BB9FA
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791730632; cv=pass; b=basWuZoiblYNQG1/g8hHl6Uoa/FgtN9wvlj74Yjd9Ddx15e6F+GJquMzRscvcnEsdYAUGRB15GfVl4UqeOd0bR0wbWHpdx+JlvfDpZRPJUZS+AwAQIrKZUqKmlj8HXrPxbhJv5451WKJkFUG24ATVqWYQ1i5tTK6wackjj0VIfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791730632; c=relaxed/simple;
	bh=7a8cSShZ/qMj+tJyNWKjrBEs8maoUp4p4bZ9r6GxGyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WA46YPMYuILwM2wcrglg4F2XL2x7yctLsgq6gyLKCkESAEqRQJf0rJDIl5b6uBaHIi4IPdyXDduMUHR9vfLBB99w4WDlrsn7ML6uZ7qnn+SwGK9QdKRCdp/iHq4yfbhqq/RkydNCmDeK7qfkfqxkxt1KhLuRULn99O/CWXx+kZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0xJpInk; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0xJpInk"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c247f6687dcso186589466b.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791730629; cv=none;
        d=google.com; s=arc-20260327;
        b=EQfYLaHoETzGKb3rHPcycCwjdclv9E84570jTNTIGu68zFy/zVv9+V8VXDws+5An1q
         VOIFZbF6n8LYRbxaIdi7DYC79LrhM1DZe1xYjlepTRnnnXRit/8umoRdwqco8qNruCfd
         KbyOx+g5xO8K0el0xXeV4PZfe7xIOUvnGXhBRHjcJZmYbRfzJi6EoGC82FKz9kp9wrG8
         FBpuKIh+23W3/mo4CK3Kuusk9AaUBzC+51/8XClskRQEB1To3vBsWjo5TI0WQ86tQbgi
         0PBpu+o03iGQhL2BJASTnzX2vxwcloip3R0PXcTOadrUAyLBCT8J+dqb5djM6WvprAFz
         ffdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7a8cSShZ/qMj+tJyNWKjrBEs8maoUp4p4bZ9r6GxGyI=;
        fh=Da1BEQ7aOmjcl4dmNja9JW/+c8ZaiCXsyF5Ua3AfIsM=;
        b=Xal/aUPAbhP8HW+Cn5cM3tIamUMfV4IfT++B3IrY/FZQ/Fw6juAAmlQCacS/7SjsFW
         OQ0mKzbW6cKfp6CP3HYplH1l8yR5sl47fxShEuVI1Yg4xWa+MuHOOmGkAhKfvsHiFuHB
         4sjzsQnTjYgX6AWP1pIg4+PIjLi+kOrvoepdxjA4n27HFvByHozcu2wQSHJo+XShCwVL
         aDHn/9oTbf/gXXQlZHLk1WV5x3aTdWmtja59YMohYP+DFXVMOAVNl7X7KPsoRzg5TK5C
         GRhub+I4C3xR8apzkTEI8vbfH3xllLVsPwaUB5lrU5/S1csciTvfQWbCBsRaDYNo+dFP
         9QAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791730629; x=1792335429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7a8cSShZ/qMj+tJyNWKjrBEs8maoUp4p4bZ9r6GxGyI=;
        b=T0xJpInk527P5Uc+kfKw9g1/+JuinmdKqKRLOSMytoInRtojBvFdDpsoO347ZbpSth
         hvht1KCrikk6yKfX5/3vgRYcaU+cbAo3AJWTKZdH8RuwgWpGvhT+lAw9F4hp9OWEfq1R
         USneKZoGAgTh45Aa4pfCLGDAHju3f2uEFHHcyqo7CBZ8m6pJJgF4+TNEokUx4KMiudoS
         ezIzflUGTgeDBKu5XQRtQTira9RgARSlsN2x5wLSdIRu7x3biO9EF7/d0yG2X/jkZczP
         vIEHkjo3Z69iuYLpxg/sPi2V7wDo44se+n1UD2Yq7y6npJjRZ2yqSE4Ei6MiQMp26MYw
         8EPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791730629; x=1792335429;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a8cSShZ/qMj+tJyNWKjrBEs8maoUp4p4bZ9r6GxGyI=;
        b=D0eFxmnalMVh5BfSn/r4hTiJX5Ytf/QA74HsDPFYdEKvb1EOrHg0ZCSdDe+SAzoQ3m
         5HNET8Fo30DTH/9BZzEUcGTCfJNrPF6LL1W5MDYcLIcZGQPjl57LUiZEITZQoeQlt8d1
         dJ8Y+Vr1LWXT/l3bNgNaE2/TEFIsS7gaCkDzfbfom3vKCO0/tvmIIyJUXL/NOl6dtHND
         L89SISgVdYnayG0sRd/jdn2DTVCVT/NsJB7hHjV5ct99c7uSBVpWmEIfLeGWQMpP8cDS
         1VJhW37F23EZT3cHuLRr9iJ3wicGFF+E/j1ZGHWx7Qz72ckGIlMOxPG2p7wIYGkbeRTl
         Q7Vg==
X-Forwarded-Encrypted: i=1; AKwUvBzt7ZnmF4AYnktuv/FXK9xftpwS7wNeHp/8z7TREIjO+fZZvx2vuOwFMaS96rafKr+zjL/aYnrdBSl382c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDjY+7e8rjwDVj/vEr4Q5aUyF66sPFW98EY+VCbHQ6TVdPEwBh
	17JGLeKM4TIcwj4qOEz34YLwx9rnnZItbHGXppLgpVUy1FQFt11f2QIRQTL0QFYbtNr+P4/aSU1
	GToPYPE1tfNnIIvJ09Rknwu6URmpEksE=
X-Gm-Gg: AYBFou2b9l9CkL5K8JgPGVMZYv2WCSy7UrFyS5Ks3R7AWfRH3VsZa4we1zvsrEYpqt1
	r3zubqVRzekQ6LcZKjQkp6OPL6yPvfuOHM+4zs+4c7IO11mON88OzEcxp64mk7qNxmaGJNCtuhv
	8HIbfKh/4uYOnJzaYMQeMk2zQUjxJX8MQu+0kkFYIzetpOdnJNkQHQnH3E1IgQ8s0AJo+Lls4A6
	Usr60DeCt+q0Gf2oodlp171u+IXB0WmjteC6BEQPzxbsc0OkmYKF+dsDpH9mUACO0PVXSruY3Sj
	zNJvhvU9MXMrJ8DP6GFGnOBpe7UL5U41Cv82HYP1HxFDP3NvLTFowfteJtYnAL3O+nsyZSiRPtg
	7zA+6xCINXeCxR8F5Sbl1qVElVHikyoW39uYdUo0/Ug==
X-Received: by 2002:a17:907:9801:b0:c2d:be57:f73a with SMTP id
 a640c23a62f3a-c31a9fcedffmr817973166b.13.1791730628876; Sun, 11 Oct 2026
 07:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010142533.974797-1-linmag7@gmail.com> <20261010142533.974797-3-linmag7@gmail.com>
 <CAEdQ38Ep+cu5ssTGtb5OQwHGRB5wz+crTfbV9GM6wVDdoZqfmQ@mail.gmail.com>
In-Reply-To: <CAEdQ38Ep+cu5ssTGtb5OQwHGRB5wz+crTfbV9GM6wVDdoZqfmQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 11 Oct 2026 16:56:56 +0200
X-Gm-Features: AclHuK_oI4gPnyqjertogQ4m97YiIbt4SsFZC0bAfaR7XMCYgwEy5pWfnhxRf0Q
Message-ID: <CA+=Fv5Tpq1i+YbkqPUZBTxv-m9=q3iFPNGfmAKwpiwF2FdkZvg@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 1:32=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Sat, Oct 10, 2026 at 04:24:28PM +0200, Magnus Lindholm wrote:
> > code following alpha_switch_to(). New kernel threads take the same
> > path through schedule_tail().
> >
> > asn_lock is left set on that CPU, so the new task can run with
>
> I missed this in v4. New kernel threads do take that path, but
> context_switch() does not call switch_mm() for a task without an mm, so
> they never set asn_lock in the first place. Only a new user task leaves
> it set. As written, the two paragraphs read as if both do.
>
> Changelog only, and not worth a v6. My Reviewed-by stands.

Thanks, fixed the changelog in for-next to make clear that only new user
tasks leave asn_lock set. New kernel threads reach schedule_tail(), but
skip switch_mm() and therefore do not set asn_lock.

No code changes; your Reviewed-by is retained.

Thanks,
Magnus
