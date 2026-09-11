Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6434E4A5EA8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145800; cv=none; b=GAqT7xc2pHY8/Ym0L4uUgfa7lASCGrxpyhlr5lTf4Vmuiq3BVq2tm1cgEP2tx6tkmN5Zr74xVXz338ygfyQ0woMh3npi3/jrP6jRz/p/Irtnx1LW/wD7EHc16fXsI2KYEujPwrvnz3eLRVyVwNbMwz6du3jF3Hh/f4qs8TjiYEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145800; c=relaxed/simple;
	bh=K6uKwxCqsJUgJksWYso7qHsjK5lXDAeKCW7NuDXQn5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcWCkFIf7vN0HefMAeSH6RRyHYKwX8bz/CWQIe1ziiicihS6g8SBcRGhh+RZa9GAYRWMe/ii2/romkHDIlVAXYjhOKk2jU/FHWTLZN/EvNSRlcsgqZNaQ5ldM+dzJ98vX+0WXpxCG+ECQRbWGsWQfan1JUdJ3MJIQZZfubnarw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KtwlYSgl; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KtwlYSgl"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591bb18so114693a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789145791; x=1789750591; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPeZSQUTfz20wSkb3gqNeqHVB/Cjwdp6OU88/IJVki0=;
        b=KtwlYSgl437v66vqiOSdZ2escmfEtrszqpTnqVT62vOqWi+/xLiLnNmgEpqZEA9B7Z
         t4dcpebnHBiZARyaLMzFfSblHQsYMmS0n22HlEQFiNIft4YTPIFE0xenLiUv37fOaTG+
         fNd0aezWKJ/ZucvoR/30CR+Fdp/KT87hqWNj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145791; x=1789750591;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cPeZSQUTfz20wSkb3gqNeqHVB/Cjwdp6OU88/IJVki0=;
        b=BxndQW2B9PhVx9q6lf3Xv8ExwqGhfdCtvyQTizO8FniAlHfWXB90H+l6yf3I02VaWc
         /mugaAImLvPHq+HIpHA/MOI6XnkNngTQxzJ080P4mrhwdElbdulMCL9Mj9j6FlqSujxy
         e/3iSrly0YQPTH4lTI/Ae+y32wBLRprO4SIWVfrjlEgQB95GP5/YUA1QznGf9DQWbFAm
         rzRnmVbxE993Fo0hae273nkJhTA/OWEi0S3eD4eKu1H4/22aj2Gf2A6DkloxpZuqlcxY
         r8XCPjNpfTVS/+Dxs4aPznAq5GmMj+VEzAKmxO7E6h5uqb6HoxjH/OPaeiryGe7eGZQF
         myfQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+bKPPK0IrOCutM+pfeJuHPjf8lMaJT+r2PwrmLm+v7OoXlBorwf9kBHIJ7cUenDf6ryBYCm5EANZX8RY=@vger.kernel.org
X-Gm-Message-State: AFuF++nOTGt5b/H9NBGHWZRVtpz91DPur9hm1Ji432uENl3VVR6N10LV
	9Yo1thrrcldx5KBlj93jB7uN8bNJ+geFoBsgdYQRZrYUN+e9sWF9bDdBSrq4bOh147JhxsbwgfG
	K3yeMOtM=
X-Gm-Gg: AYBFou3G7kjGk4SCKGPTjAAvGC7hIav6dHaSeO2Q8ROKsMxDxJzwTEYG9TXSOx8fgzn
	WP7WqcdiRCmu/WJDl6/0HkNSf2TFFr4CAbN22bmEocaxrzsVC+Uvum3cVfGCROXikSUNssdq5m4
	aiB73oysApbDpcaYQmbTB6vGWjEHPRFIgU074SR6I726gvB9MKz7KMHoyJa2JYK8KC0xA+q1mGO
	TxPBnTA2QFqxwqlpr9QQB57if4eFnv6yOhL1upDUCu52CgiUUAC16ursmUmzPQLHH2w0FQfwhyB
	Aola21YiahyaBJhp7boBJm4D5kj950ia8yfYq3fx6IaZlplOVmuezSHwFEa0cde7c/R9fXhg0u5
	1VHXqMaVp+4qe7RfEK5P/dBs+O6P9IpHvF/X4x4ojFD7MsLfSUhelQ/R2DzGRAsw9ySLU2BfOsn
	spSQ6fBuaob7X84l/TZ31R4AuB1TfeefHcNiGlDKU49V5fHaAjxOqBNnLGvXXZD2iXBlJaDbGIg
	t4RVFPNOVC9jpRBSeq40sY1/3BxHaGP8WIt4GFjexaiRd1zV2ujQIJsjhM=
X-Received: by 2002:a17:907:3c86:b0:c25:f7db:4bef with SMTP id a640c23a62f3a-c2962c9944bmr294814866b.21.1789145791317;
        Fri, 11 Sep 2026 09:56:31 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966066b75sm107495566b.29.2026.09.11.09.56.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:56:31 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c294ad260fdso147444366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwCEzO8J5sdiKV0VM8CeowP6iHo9L0LDRDV9HTnLC5TuyVYdu60+N11WcNrKvPmnVxaZFyFzbJOIKTEDpk=@vger.kernel.org
X-Received: by 2002:a17:907:d0b:b0:c28:fdcc:901a with SMTP id
 a640c23a62f3a-c2945ece84emr569757966b.16.1789145790391; Fri, 11 Sep 2026
 09:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911101757.286dbea9@foz.lan>
In-Reply-To: <20260911101757.286dbea9@foz.lan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Sep 2026 09:56:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgxFsT-aBLvaaWY=rzXKAnsETMGGBYeXnidPMoaEP29wA@mail.gmail.com>
X-Gm-Features: AcwNN1XMz7nZgWf_yAotYnqXcdS3AjXLSYrStUysBHfg_4lM5kL497I75V2wctM
Message-ID: <CAHk-=wgxFsT-aBLvaaWY=rzXKAnsETMGGBYeXnidPMoaEP29wA@mail.gmail.com>
Subject: Re: [GIT PULL for v7.3-rc3] media fixes
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 01:18, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> - v4l2-core: add bounded tile-count helpers for HEVC stateless decoders
> - v4l2-core: validate AV1 tile counts fits in array size
[...]

Please don't just do the shortlog. That's not information - that's
purely mechanical repetition of what "git pull" will give me in the
summary anyway.

I did some minimal grouping to at least make it sensible for human
consumption. That's basically the *minimal* effort you should put into
a pull request. It's not great, but it's better - "human consumption"
is what that part of the merge message is supposed to be about, not
"mechanical information that isn't adding anything new or useful"

                Linus
