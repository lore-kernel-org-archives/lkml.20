Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793987586;
	b=qGWoQsVpCiY38dz5xTSYDqRA54tphV16228SdeYCu5/frhmRN57izz16B1fKOQjRVRc8
	 iO+2VwCqgmx0YuZjjc3samejLtU/SO8UHIWbnUllm68ZX40f1GCGMDow5KM2d/ZEWtQLj
	 7gsyxMRb6MIWiRfoDIA2FM3Bg0m3IPipH1zvRLx9TMXUS7j+C3Jk7hkiZY6RltYF7Z/Sw
	 PG96bCnFbV4iU9eYQt62VnTtluEOxq3ulIMJL68ukLCdnbHZTVYSZUDF0wjWAAFUn8x8d
	 VUbBBkXjWJHY5r9ORyhcTkqXWW6T9LC5Y4x8Ez+jyP4EHpko3P7Rz0CezHKx18OFKow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZZ43LFlhd+sk5fh/FJb4zHzz1CW3FUt2jfsXu1lejAk=;
	b=P+fHBemHaOabgQEUONnNpWpLsioX2eHXegPJK3x1xqbFWYKLGnWaBqEDKcPvdfztM9UZ
	 05pYDG+8OZ+dLubPmg93CnC5pJSe3peduKj8s64lYGMgFYKOhyD4LHgW7ahAM4VZPuYOH
	 dRMm42pYidy39wbmFzp2g14EFsi2gqAalwKKDRrfAgeKf17JwGb+bpGca156N01SlPYNk
	 rHK2N44JHLhlvBLsK0iQ/DSMX7J3e/1Q5tKO6uwJzFXOxCqdGoWwXnDnfIJemS6klFKmB
	 5e20UynFLM8zsQNL1zB32k946jt4sLFhHq/hCNaPaViUPzNOqO4I5UrxxpLMhw2PI7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NW8uuGdo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15D9606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15D9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NW8uuGdo
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so8516605e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:53:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793987584; cv=none;
        d=google.com; s=arc-20260327;
        b=hvJiwueeEXE7w92xcpwMFSbIbLgYscYR+ligx6dUOwQ/ST+esBjZDxfcdWdOg/MVdd
         ARbdcBy+C4Hv3g7wp5W+ZfknoH1nTQw34gTJmnvFEiYVUnsbWJTW97EyBz0GayHnspA7
         ukMUPF8aq347+Rx7ogrYIh0QMho9XgL5f1dbcZ2Ny60fh0mmCTJGbVFCluqWAbRjmow6
         IRoDl1UwX9QbwjqUgLYOyKb7ZSVfWwLiqlVOzgTOocF00kFKAEKSXzB0nkBA0gGbbbRa
         zAvBqxJUaaR3/3eyDkiRLuPs8H+/ENzhtDEphwktf0SfWBAgDfCr3e4xA1CTc5iVd99m
         NpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZ43LFlhd+sk5fh/FJb4zHzz1CW3FUt2jfsXu1lejAk=;
        fh=wrwW1+uJjm64BjRYHATcMUIGTYc+gwTUpftMQZYKIuA=;
        b=W5JabC+gzoi+vpdX8VR4Vv/6zBC3PG0VJxhbKPDkmaA2Di6p5mymX0uD4wNQMjY0Gq
         hU7fFF8f37lUUAfGmjKTa21G8gj53M/nR/e169Hq106IdrdgQE7rI6y9gvlTRDL3DMox
         L/dpiTAVWKeoz4SNyBmGFB8Hed1OpiT7f2o9WyeaMqutaTT46ho+xQIIaKXXwADZA+AZ
         I/DIQ7gST1IiUUFddcCDvQc2UjyFQBiuc6TkAS0h0m1EyMbOZMl4ZGi+RLKG03xUtYUu
         EPoyppcm8JpSyyIxj+NSJuEefS2PjRXoCKWon6kFDXQlRcgLrKZwAzqA5VeUT3qLZcrI
         KhFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793987584; x=1794592384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZ43LFlhd+sk5fh/FJb4zHzz1CW3FUt2jfsXu1lejAk=;
        b=NW8uuGdomYzmuDtrXAWjZ1gtLZzmP/KNhlvC6gK50mW7XxvuKLLOP7EtsCLtPqcsjr
         CVhVoqc/CQmnXOg48fJnD/JELJAgh4f17SX+kNmO+Swc+gsoVLoszlZRfBN9BT/HYA1Y
         pT0aN7LyWPUNYf6+pfUM4omNBOYoHsgyvTFoj9xnJMSx305fiCvitTUSnTMK+hwxYgJF
         8X/qVB0ZP36kaX7C1IBDUGacr/M84c8WJU7AAUqSsSFBymFezWmF3SGZ+dLclXmyfNYp
         /hkKQ/z7Z0+SBl7ZAXfJHodjznt2X7lj8z6XBADnHfKKdxjOaUQIAGL22I30sDPxKhWT
         AzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987584; x=1794592384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZ43LFlhd+sk5fh/FJb4zHzz1CW3FUt2jfsXu1lejAk=;
        b=hTLLpB5AVtr9ng0HGW/wA17ceJ061Yj5MkPJVw1bzEFMf+HpC7lkCLWr/ZTUdoU20X
         HHz95pxCV6cDIIMp3MdWbBcfDFkijLJv5cb/OAEao6wPscWgsY1PunCtyKhRfrDU15R9
         zA5ZX25auFiA33YpMsSwnNPBE7/5po8yca/kOh80BgfzX6/M/QHwEkMDR8HykTN7PeD+
         cOaeiJTxPJrxnpYiF4gjI4h14cy8X77ZahpfjXY1j6StMaG9fzTgknbtOjRI6XUZLfi6
         krHexSDUyiz30mxS/84UAWbyYrxl25AHnkkC37stXEq/ZzECwCcHYndQ6SXZOtwFreAv
         8DFg==
X-Forwarded-Encrypted: i=1; AKwUvBx+Kz4kS2u+2YryDgDLq3QoGiRVgYndLFsbnbr5tv5hmCpl1HvVR64pcAMHb+WrPQggBGCJ8L54yBpqDsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XrdVwH+8IZ6Mtt+vjvi+7XbpUGQqfIuG2cBj3kQc+MkwLcBvn
	xHkcDE0wyYe3mVm6JvLMK5XsVG2hcf498mORqco02QwMrZRi5WUFUFUGvipZZkZ0O+chpL3/gtb
	uMmsSSSosDL/wwannyeUM/+ha09/Wf/8cqyf7rIOJ
X-Gm-Gg: AYBFou2UctNOWSX5zh41AIFtuyojEHvC0IJCPIEwbj7rVotncYp2SsCMh5JUPqg8dr0
	MEmbKF3JGMx5+Lt4FY4g+NmjGjyr/3Z9zb3Zi8lTRk9hyl7TIZQV1IELiYp21L7GEMGAAykQgN0
	JOUY2EH7Ltq6ZzWfuqOWP1XQeeDl3pmeAATOtsLqMIHhS1PAk2B3DgDt107vS0bKVG2iNs6yuX0
	t918Ofqa0I2zQqRo3r79y+CosgvpCzLOVMkVITXdVgZr77U98bNu34/vBfX+/W6DiC+jVKlEZOm
	yw9UMHfMzIsWJGvrBodzuoQip0muJ57OqsD+jZmDI0V1cC5f9fgdyNQA2+7Z7HObfHBDYGiNcfR
	wXpxORQ5yZTvgakjsAzL5IycYrfo3fQGpc7DthQiVVz/stGnZ3OHhPp0+Wg==
X-Received: by 2002:a05:600c:6387:b0:4a7:9025:5c3b with SMTP id
 5b1f17b1804b1-4b6de1c6450mr56262855e9.19.1793987583819; Fri, 06 Nov 2026
 09:53:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com> <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
In-Reply-To: <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
From: Snehasish Kumar <snehasishk@google.com>
Date: Fri, 6 Nov 2026 09:52:27 -0800
X-Gm-Features: AclHuK9INR2TnwJM3Zpn1cFZ_averI8IiQe0rbAuzb--L9go7NViW8h1McGlP0Q
Message-ID: <CA+aGii5ZbLRMsvOZ=Xk_gS10O_WgjEc=oW9vJ2yYPrRdwpZbZA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Rong Xu <xur@google.com>
Cc: Douglas Anderson <dianders@chromium.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Nilanjana Basu <nilanjana.basu87@gmail.com>, Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> Just one thing: I think we should also have this flag for Rust so Rust
> and c are consistent.
>
> Rong
>
> On Fri, Nov 6, 2026 at 9:38=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > This looks good to me. Thanks!
> >
> > Reviewed-by: Rong Xu <xur@google.com>
> >
> > -Rong
> >
> > On Thu, Nov 5, 2026 at 3:12=E2=80=AFPM Douglas Anderson <dianders@chrom=
ium.org> wrote:
> > >
> > > Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> > > Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> > > automatically passes -mllvm -sample-profile-use-profi whenever
> > > -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> > > inference algorithm (Profi) by default.
> > >
> > > However, as Rong Xu noted [2], the kernel's AutoFDO implementation us=
es
> > > flow-sensitive discriminators (FS-AFDO), and Profi has known issues w=
ith
> > > FS-AFDO that degrade runtime performance compared to LLVM's original
> > > profile propagation algorithm. In addition, Profi's min-cost max-flow
> > > solver (applyFlowInference) can hit pathological compile times (30+
> > > minutes or hangs) on certain kernel control-flow graphs when profiles
> > > drift slightly or when combined with GCOV [3].

LGTM. I've seen degradations without FSAFDO too, reproducible on SPEC
workloads 531.deepsjeng and 502.gcc while controlling for profile
drift with newer versions of clang.

Reviewed-by: Snehasish Kumar <snehasishk@google.com>
