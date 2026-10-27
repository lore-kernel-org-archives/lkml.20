Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793101751;
	b=2LI1XJpTw8sn/s6+sXUQgQJtv4k9yOrykIH8yo9UUJKCjQoL7VYixYNkt+gpyNnoMx/1
	 c2Q9Z6uNjHwv+YDOrdPAVH0uipb+iLnJ7zEjwD/HG2YL+mmwxXZ3KWdWK07hwwZcommyl
	 Usj6pvCFWuA+/cTa3zroqmb0qNL8X6Iyp89oiNDF3kyEuQBvLxz5qd+bLK8Oe5A63bWU6
	 5jyqnpKxMumIWQ2Q1IX4Fca7nkkJZBZe0DjU0v3XFqzTJcjiPPQsW1Bq3LIjhcBoVWmOI
	 Vp53EdN61ZCJmCOq2lZJ1CVDoRjzgKP+elZMaFk9gd7oxIdcxqFFI7X6VT0HBFeiwmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=n2g9BVPgPIcnwD1/br3vEj5plzxjX60zzyQRO+kbF6w=;
	b=Ue8hwJe61tT2mn0ItJlHo0RQjmz/RYSpzorqqFAIcsmwZhDA320s+mfgkjta6o8zIGbl
	 u9AcFuPvvaZEgCnGSyYoRFvCl78HlnbkdJvx0aPKK4pctIaODg3nX7HVrak6vNzh9LHJK
	 ZHJE638SG3BUItnf/WfFNyahXIR0+I8C6boNspkn3Qryv6i6ZrODYB96UBY1YnEb8dH7B
	 j0VmX5E3JUl5tZu0DK5r0aGyDVt9xW8SRMKwxxELQCK1sDNLV0yPFwM0Ybl9bhPK2CjuZ
	 gJKoGFydClnD7TlqvZE4WuibcR2QKSqnCyYoNiAsMDk6J18XmcsU29k9cUvJi0K2ILg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HdeTX17Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54514606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54514606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HdeTX17Q
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso2312181f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793101750; cv=none;
        d=google.com; s=arc-20260327;
        b=JS42eiTaEECdNjmLDlyxvILHbnn/cgpy+Coc05pAYCGLERjpo9uroIanGH+LXAxu5z
         3ZGZOm8t6gL7KPLp+yjCTQvPMIQrXglZ5qTVJx6dOZ9R8OUr0CcGIGKUnsNWGs6a/zeB
         GSU6LDVKCdERCGAKbZ5MrUmQVV9iTTbZcgumMH9t4nM+yK9o5ZpP4OplO4Qwr0+TWbtI
         V4geyUF86qVkXYKyrkIOHjV8IApIzMAZEjBGn1nz3lqSyEKDe9GL79nAgZt4Hre4zdPr
         dTNDg5QDDiB1ZVUSMX4kbo0cUc1SmeFkqBtvy3unBHuDN5h1w4HDHfJvvHP7emGjoivv
         dopQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n2g9BVPgPIcnwD1/br3vEj5plzxjX60zzyQRO+kbF6w=;
        fh=S4e/fV8O01z5FAbtQhwnj2wNez5MdAhehd0xc0kX0IA=;
        b=ceSXCKCDTSy0nX8BirBD/iteSeOT5F/k7VHajEPierdZOTVw5Z2cUYWpbukgfnEPfZ
         sBL7qlBcZUcHq0XkIWk/doBzVw93YsoZdaMfW5VTAMETYUCCJWUyiJilbx66HzpdOSjZ
         cKNYl4EuNNZfaWQkmUATx75A9AJe10GVR0T+QGOSB4EnpMwZgiaRDb9cebLX4e3Oi8WD
         OHbkTyFKh4hVyrUMuVi8m9BJj1MdAequiG0HKxHRkIz6u9vobJXpUpDp67D1mG5BTg7p
         6fNFPU/KxJ6P3jvmC9fv84VvqP2eqV0e8Y0AXALJ0h+yIJDsyGlKSzw8zTqCtKg7Kq0+
         Wovg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793101750; x=1793706550; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2g9BVPgPIcnwD1/br3vEj5plzxjX60zzyQRO+kbF6w=;
        b=HdeTX17Q2dYHH21YoUKfBxODfXZ93WNWS+0Gm1IiEY2jwKZ6NNJWIt/j9WKn41Y48A
         jIIoyF0Vkq5GC2JPg3oSf7PgaC25F523GW/cylESRM475j2+t43eDF2ysyIbnzts+j8J
         5VHlY9+RRj1/0x5dDSLabLwCtA895AEH31PPHdxKWIYNYbEEoYbwj6+Ijyw+zSQyquF2
         rHTiOOaveiPrzJZqeqMPp02TFVBcHg5HJIV3+leWDGAbxhCSaP5gitw4CHNmsb+Mjrqr
         cEhh9jwkuQocYqRV6VCv5K/sPUp7rmDVoRbMac8Z4N49mKdUjHOApzQ+NVa1tKy+wzuO
         u4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101750; x=1793706550;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n2g9BVPgPIcnwD1/br3vEj5plzxjX60zzyQRO+kbF6w=;
        b=HrtGc194OkQL2hSU5nl+siNxhNBzHfsDn2b/vJXW+iuUh8CVE3HOUQTC74yG51AfCq
         bPC73ip50prQzJ620JxX2pdYbpD01RSnBAc/i9TLZXFe+K7b/ge8xEfVZChpc6scVCWB
         NsobCerdK26vWEBNvzi3OvRJd2/cDC0ZDStmysQnu//jFbir88OCAxARcBwqi7XlDdQA
         Cu7+aj+Qt9UTl8B1QDLLtB/OFQjhZxrdPba5hKbIocjpZ3iCmOLd9/Xt9kB7OIEeXJNY
         RS/0dvN90hLq8JAk+gsAXfQyMfWlZ1ztIzAlZLrWsLpNtY8+M9ha/pGjUu4TzeLzxWWM
         Nw0g==
X-Forwarded-Encrypted: i=1; AKwUvBxOJqkYWuZITa4Oo9R5R7Nso1ejSXqZgiPd0ukf3eRjWD2M6QEQNUzTNQ+xlk3HVM1WMvCSxTwWvnl/Kpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPfpA89JDuRwLqCvxIb4BvcOpfY/1Jhdwbd3cmQKi/16BMkSrz
	zB3MXLTKxaZIATBkPbCIg1HpZOh25EYfuSJY9EgWbFek8iDFgtpF1smBqY9E84EteomTIRW/u3/
	nBulXWrix0gM8higlT2u7yAulxVJO0d4lAQpe8Iv9jECo5DQSAjVFYEw=
X-Gm-Gg: AYBFou0AP9kqe67B6r+wvYcFfcfMrGXY82gO1HZs7WrKt8PyUG2nkY5D57Z7cTX37gy
	a5MQbY71uFqx4RdUSHfJaFgdQ8ovamFViJoh5PAdTVgkPozINyEyr0aKjjS456NOw31y2/7r5D4
	DSCS/KrCgSKX4lVjAYZuAYwiu0c7FNZ4Erg9ziPheUPxqL0eOTwGxSHwrgs+S3ONoyD/iuvKDXi
	CLO2/JZIG/zsfu+4aT4ScscKOEEsa5Cd4Rl+pYGkmshHkssjcDfBfGZrpSjz7U2Y9XWzUcVFiAQ
	+BXS1Yq9U9BKH1o+O7vPfuCPFDwB6pm6G25EgVqPti9y78eCbPJ1N0cQdMRDdKvGqfGBHiLCwyT
	hUXEmhI4B74rQEEcfM1WbswLtQrhqZ4XfkvFwAZMbCMkKDkfN9vYdsKfgumoU4QxRkPUKi8P++F
	cz5vkvAv2p022fxTlKC2BA1AoTg6yQ+ypjNFU=
X-Received: by 2002:a05:6000:24c5:b0:48c:69bd:e971 with SMTP id
 ffacd0b85a97d-48e3eb859dcmr17962003f8f.16.1793101749776; Tue, 27 Oct 2026
 04:49:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1b0822425d9c76cbf7dc4e5fe9eedf62ac153b56.1793095807.git.wqu@suse.com>
In-Reply-To: <1b0822425d9c76cbf7dc4e5fe9eedf62ac153b56.1793095807.git.wqu@suse.com>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 27 Oct 2026 12:48:59 +0100
X-Gm-Features: AclHuK9xjjyPxUFOC8E53XVJHVXp005yxnBPTO3OG5ctbKV28EPtiGeGiwnD5TQ
Message-ID: <CAPjX3Fe5+7PTmqx5HNmbQLgsv-DtGhJxgF=u14mZQnTMFN-nCw@mail.gmail.com>
Subject: Re: [PATCH v2] .gitignore: ignore GNUmakefile
To: Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 11:15, Qu Wenruo <wqu@suse.com> wrote:
> I use GNUmakefile to shorten the command of "make".
>
> E.g. for my arm64 worktree, I have a GNUmakefile with:
>
>  export ARCH := arm64
>  export LLVM := 1
>  export PACMAN_PKGBASE := linux-arm64-custom
>  export PACMAN_EXTRAPACKAGES :=
>  export PKGEXT := .pkg.tar
>  MAKEFLAGS += -j12
>  include Makefile
>
> And for my x86_64 worktree, it looks a little simpler:
>
>  export LLVM := 1
>  export PACMAN_PKGBASE := linux-custom
>  export PACMAN_EXTRAPACKAGES :=
>  export PKGEXT := pkg.tar
>  MAKEFLAGS += -j12
>  include Makefile
>
> So at least in my case, GNUmakefile is really a shortcut to specify
> extra environment variables and build flags.
> Thus it should be added to gitignore.
>
> Signed-off-by: Qu Wenruo <wqu@suse.com>

LGTM.

Reviewed-by: Daniel Vacek <neelx@suse.com>

Thanks

> ---
> Changelog:
> v2:
> - Limit the GNUmakefile to the top-level directory
> ---
>  .gitignore | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/.gitignore b/.gitignore
> index 9875120ea7bd..6f018294a119 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -194,3 +194,6 @@ sphinx_*/
>
>  # bc language scripts (not LLVM bitcode)
>  !kernel/time/timeconst.bc
> +
> +# GNUmakefile, mostly to export extra env variables or build flags
> +/GNUmakefile
> --
> 2.56.0
>
>
