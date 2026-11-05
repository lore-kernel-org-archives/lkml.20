Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914607;
	b=HHPx7N2pTdT0Fl0HOxABCFx9txfGOtDUIvIavEi6wEKYlSUbJ7rM4A81m5BLYJp9xb+n
	 9+W3S4mT1YeKRPlrnuMIDIQ2LTT93m38fyKcZwAocazyfD0zrOXGJcLy9e5er6XFk06Qc
	 Sun7N0UBNR7hTdsH0eYSaolDZXenJKMkKjPXTPu7nz71LcNlxt/TfY8NtDrXd9cXhqYe0
	 TenPdhm50ts6+2jZhaGJUT4d7yxIM5AjhygQIavEEa6ywroQ16HwKjpha1V8lw4Aysukn
	 zjPXeTu8XfRTviIeqg97smjmb0OT/2vIGwVbxchd4Rj6t3zU6qFbMfBUvn6ogXayQ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vM+JVI5ou9wldEifJVsxeGyTetK3uxHfHsrd/HXw/z4=;
	b=AQzfEUIyvRwpWDq2IjMchzSlzRAecnFbzNdVKvmVVjcOK0EXivWwUc8QJo2Uy1iuBfC/
	 PybgTGwjbWSd/z70zdkgZCym49lnoG/MSgISiLFrjjLDmke4kSYGbXTroxrjFfCYoJsYo
	 hgjN2R1qoCcl6XFNfCfDAVftKMxyCJC0TeCebV5J4P+F0JnLoJT2ywBQ2A9BgwN/X57Nw
	 RZaFZ0q1wp+UNJgB2W6F6nWttyPmUzV7JrM2w8+OXgSnVPUKWQIGssYEXsp/EWhaYmByS
	 7WcMwM63s9qLnnvklz19qDjOo8QLBMoksScxcpO8ZRsVtg1pQyOFkTmiZxepINi5I+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kliKIKab;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D900606D802
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D900606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kliKIKab
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so38550366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793914606; x=1794519406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vM+JVI5ou9wldEifJVsxeGyTetK3uxHfHsrd/HXw/z4=;
        b=kliKIKabEACqkyERCWqWoQPfwtgG9JZ6W3k7sp8Aa+8NW3OiVFTw3gwBicWPpPsgTK
         0oVdCp1cUd89lBRZxD0U/IaoMlIsdYiLVCf64/2cJOsR46C/2ZOCaaWxhDVH63w1zNsX
         Gh5ezqCntThFPer69FEJ3sfkje6BPeCD91Ypg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914606; x=1794519406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vM+JVI5ou9wldEifJVsxeGyTetK3uxHfHsrd/HXw/z4=;
        b=tArdbUos7beggIwKy36IgbBbvox2UGNR8XCHHL+mx7a5qHR1iGeXjr0XBoOsfcwbfa
         Vd5gmhnCU32u5SP27tIchBTrkcwVbeswzgagMWjtuLU3Z0+cm92xcnw/72peyofR2u8o
         ih6d8mBMGmIqG/UUh/R95N+JpS6LkF0p+vL3Ww7S2Bkbwfhj67NP3o9Isf200PkReWeJ
         pwWTGMgUhnFZdeUxvfhVDpT6EjbjIfCDKaVpbQia2gGQLTXvVdaSeVTe1ZlMwx3JXV1T
         atRYjKZZD6cHVjJWAidSrm/nC4B+jf98QDc5dUrOeWQKVxwe3o9BGyrtptNKfke8KaJS
         pk1Q==
X-Forwarded-Encrypted: i=1; AKwUvBw5FhxmwaCHjHMNbbc+n6ZgqZz91yKpttk0BBo6h/RC4VvIL9ROSjd+BuQPvhEArrucRZY8/aTZ/H+xU04=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M7ecY/zx+vuOEnphoGUaB+TdzNSZ3sU1cjZh1V5uVMkF9cy1E
	dc71I3ZERXC32jeKgmN7QMa1gHusY/2g66OUp8FrPdYyNxDagUPa3hjxdJ/YMKoxnxHzTlVMBGA
	GnFZOfreu
X-Gm-Gg: AYBFou0qF5sk1yFSk5M6T3+h2mv2k3Ki0XVQxiHrW1B0jh26tVhCOToZKGBC1hssQwr
	8BHb5ujNt/90o1yT4z9CcZDNWyrrMyXZLi8nm0kgEudSyLYh2tvKtx8LRnmiUZqcwslpPrbBvPR
	VKa0CzGRoMyf04W6lO80e4C85IAcmiNh/qkz0j6o7hyS44gOZbfH3TD/WTl5o0KWBZbQtFJ7u/s
	xTpOACIuWl3u0eUady1HkyBf0759vg6FANJR5kYwGhrTv92M82uhyFcXiWOn7Xe4P1TZo89j6om
	UN8g96j1haEHDq6YL+2H+iIwNwldrDRniWyCkNI1tlAjKZUggXxAeOPQDnmthavymnIzOGNnzFB
	D3YX2ty7qssjEnCgKaIRlC0Kh7oOMTjv7nPgCoYki3Z3vLq1naTT2Wk9hJBSNnr1sX/Dwvgcu8n
	+9nztpKRkDOnIs1KjTVIBh+FHU5IzNvB2864Fs7XMJ5d34I6QzEXSZLfLFzT0h8UMEoMLQevgHx
	ojwA8TwlTBM7zZo3zxtGCQqfR+MmbU5lOF9HQ5hSfjwdOny+HJui1JecJAK82ZhZXG+3w2iYGRt
	JTszRVh7zRwbJzQ+GrK9JiEOohSxNpKdgOXXcWiceHmd81UJZak9zQtixKs01/q6Dcif
X-Received: by 2002:a17:906:9fc7:b0:c31:e958:408c with SMTP id a640c23a62f3a-c4d353a39dbmr60127466b.38.1793914605785;
        Thu, 05 Nov 2026 13:36:45 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356c5b76sm19120366b.68.2026.11.05.13.36.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:36:45 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so3899356a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:36:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz4hWlc6TST5pyIN1oF1H6YE1MdxLzEQpdZQpxCypYPvw1sSlq2SJRseAlKrlcdtRgAaf7mN+0x3cyAzXo=@vger.kernel.org
X-Received: by 2002:a05:6000:46cc:b0:492:a72:92fc with SMTP id
 ffacd0b85a97d-49277e91d94mr899867f8f.44.1793914223349; Thu, 05 Nov 2026
 13:30:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
In-Reply-To: <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 13:30:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
X-Gm-Features: AclHuK8NeWv7Eqboity3c_xvquX4Ve8KJUxgkkfaa6zSURNg96EK107B0KPq_54
Message-ID: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> The issue you mentioned regarding excessive time in applyFlowInference
> comes from Profi.
>
> The AutoFDO implementation used in the kernel is FS-AFDO (which uses
> FS discriminators). There are known issues when using Profi with
> FS-AFDO; enabling Profi actually degrades performance compared to
> original profile propagation. When we tested and worked on AutoFDO for
> the kernel, we did not enable Profi.
>
> While I haven't looked into this specific bug yet and am unsure if it
> is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> to disable Profi for now.

Interesting. I can suggest that to the team digging into it and see if
it solves the problem. My AI agent says it will though. It claims that
the default flipped recently and "-fno-sample-profile-use-profi" will
restore the old (tested) behavior.

Should I send a patch adding that flag?


> Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
> reservations about adding it for the following reasons:
> 1.  It is heuristic-based and not enabled by default. I am unsure how
> thoroughly it has been tested, so we should assess it further before
> enabling it.

FWIW, we did find that Android seems to enable this globally across
its userspace, which suggests it has been fairly well tested. You can
see the change here, which landed about 1.5 years ago.

https://android-review.git.corp.google.com/c/platform/build/soong/+/3524291

A few notes:

* That change _also_ adds
"--salvage-stale-profile-max-callsites=3D2000". Internally, there has
been debate about whether adding that would be a good idea, too.

* This kernel change _also_ adds the flag to rust compiling.


> 2.  The recommended usage model for kernel AutoFDO (as documented) is
> to use the same source. While it might help in an iterative build
> model, I don't see a strong reason to use it if there is no source
> drift.

Hmmm. I guess in the purist sense we'd want the AudoFDO profile to be
for the exact source. ...but from my experience, that's not what
happens in reality. If nothing else, developers locally working on the
kernel still want to keep the AutoFDO optimizations so they're testing
as close to what's in the field as possible. However, the act of
working on the kernel will touch _some_ of the source. Keeping AFDO
working as much as possible seems nice to me. Of course, I'm by no
means an AutoFDO expert and mostly just got dragged into this issue,
so happy to defer to the experts. ;-)

-Doug
