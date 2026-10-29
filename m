Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793298232;
	b=gWqdV3rIAgcb8iefTnFONKtCFcHYimxGaIiUek3lQGnMNNb/8yvnCJ9q3kmpfhxVPMoS
	 DPo0vNobJKmzoiSK9Abvvz7cUvhbd8ah38KLyZDaYoblcCBHFTxDxm6PcakSruUEJSViY
	 L3eLrgpC3xcw6FqzgAYUUj81N1hNoDzEEG2L5W94c+cNJ4ym3cgoHFIlCX2j6Z2P+P2AP
	 TrF4CwiyYFDSySwq14bk40b23y14LWfuwm0pq6HwvrIVaKHtyds0Kx4qw3PQ74L94gzyT
	 RHVt/xeoZwN29ajm5WljlzWhy9jPec4fWsNlFsdjP9Qp0jXHCaZvVShEWxtRbgFURIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
	b=XLCeQIw1tgC47bC8AcKvFlB5sXssL1zdlGfNT7DjWQSyyFOHaB11THafTiuX8if5jaXa
	 f67dSzArSIkkg2sHmjonPBunLqcizhUSEjnZ8/Wmtv+I3rQGaY06MSimMs0DB33OM1MgH
	 W6rb1WiWOGZFAa1ZYpQwR5EaWxl4ERQpE1pR5r17Nm1RWz1U/ivzTXqXdpZF60iy+g3EH
	 htaPcue1Gczr405f/s+BWyYjN8QbP8LOsKiBzllAFcp4DEtaXPPPKELN7ObiGTP5qQnig
	 MCXTtmP/g1HqdOngf4dQk/j9rhxRYRTFLTnglASHRaW2r3DI6/V68cz8KDq9c0UgnLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DxY9NYue;
	arc=fail smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709E5606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709E5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DxY9NYue
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533202fe429so46251cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793298231; cv=none;
        d=google.com; s=arc-20260327;
        b=SN2QXri9QyHenvlsHaL6ZCsPzndFQ8kudwofHzeKqwzy5oSs2WiyJTvF5apLfR0DuR
         xHQMvH8k87XF1llHMs+X5scy/CsiFZcbAyM/kI9nQLKIu0dreZRKn+S6eXzxDyrIRyv/
         24UqKeCAjqn37QCL3tBW3Nm2N+SflcqEw2aKTjcs8hTkzZu4xGuxVE6NEFnYdINteFPN
         2rGQNrFUa/AlvThgn5F/bCbcEUh2DuDOfHC8yaQYj9Gdr+KEvyVuB92TsyaltlvqofvJ
         nQ3Vwo6XuJJ2uwSX+7KafobLq4P+mhpwXMx1MQe31gqU2Y7ZaJKGJd71mpBIpcdgbaPU
         9GJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
        fh=7rOAGtGcYS5rcrghehw4v6gweNoBMhBtmN1PXg1eTSA=;
        b=etQC9TvoIo1823p7lTgKx7a5kAw8+EhXnlLvdYqDqEhTzhzpBnsmgJrwDlOEdBk1I7
         NJ5TZ7KOzwBx2gT0M8/2heRv+YvXIBR19wXizRrNmCwwA05lctAO3U7fp3jNLGdnOQKT
         n+qVtZpcc3wYlTGdrFxbFTGFixqEGObfbQUzzqVp7795tAQgPQQwSK+KKG8Wo8tRljoK
         FF7pS+dN037IaFaeTPl+dC4rC5NHP/VHXXXfUjsIUaN7tdsKeZZEAJY010BejG05IWO0
         M1HHwVAnGwEnqa4I169T+bBFtDXV5wZdv8s/Y2hJKKQl4+q0HUIhWrR2A5d0Z49VWPIc
         iMSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793298231; x=1793903031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
        b=DxY9NYueYpPUw54/1LuKABfDp60AROnzubbbXy7OzS6fWMrILGyAPx+k/TBUzTDoQf
         0+estVcf3DGr+NqskgZltpKjiTwBj0vHxfiZlAv1hdCBqEV+qUGB+fKraqRqaZGJI9Ad
         aHuqa1XDAyOvsrzYt4e2fwVCkmevUnXplUQksj+fp6M1ZkXl+zkUCRvmoFsMOA3v0kwz
         Qz991YYvpNKWfDlgqHmAUX1bJTSVeq5mbReuEAT3YssNt+yd0jN+OmcLTEbZqe3twO31
         DfUU2J0jeNSxbzemGGGlU75TQqjY6sTlc87Wxa++VyWhSCCSHud20YoCA1co6FakOgHn
         lsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298231; x=1793903031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
        b=YYCqH0hKv4oOML21Rg7JEfWevblHYsf1W9rjxN6FYq8V1IaO+hcP/+kWbLvh5fs7qz
         J8GgqJ3uM9CGqhN8m239R8PO7TynFJr/S3ZSHVKMZB6qPIaTnjNh8sypJmBqNseckPzK
         LGLrVPtW721L0KHpdvmXyW23xwNt0HTCWHKozV1NhNZG25DOQrxqEPzghtH3xEVwaWJ7
         kB+EuSDM3469Qpx0CGPrIty6AVZhs488NQ78L6WV9q8R/6w03N2lQQ/YNk2X26dK1kN5
         Bvfb3kBfHhNwsUNXg9aNvEatu5MI0UBv7hEJhrqtj2525MrtqgtwxuWY3z/rRRE8Gnxl
         a5Tw==
X-Forwarded-Encrypted: i=1; AKwUvByF/6TrkCVKlxlsEX04y/0VFC079T7roWCrRyIeq4pNpN2RGj9vY6MqKAJwgp5sd51FbTdYE/tvo6augG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQgrYwFCIS+LaM3y5Nd1iF7U0qaxGij1EhouHLK1DbfvlxEZge
	B+y9gZoTDewf+EdKA7mGbDqYAblbOSHndf/PhU6Qps0h24Z17wlFQu4Y91vli/CwRh/TPlF6RS2
	lf44KMyRnZxd5YzZY0ZbZ/ayO24KeoEKG21BX/dR0
X-Gm-Gg: AYBFou3NYV18XZOWZnkM94D619LGftCRjuLJ9F2dupbi1nrFLJtkZ0DcDL/iHIzk2TX
	JjDJ+qN+Y0rfAoJWSTCSgq4cKVIEAzmX5PdWlHjcHgIFyjQC2lx32GWaqI6D62iZMLMkuPFSx6R
	zTRhbcGKu8rphDfgjNZmOJRyCYHgJO+TbiH4nJxsLdwEHOVn6Df3VYzeDRccTKsIeLy9Yjjmnrt
	wWM3IDbjCqp33Cpdc7CR9cRCQrahvvM6b5zKWq4n3O87iG31ewUEHp1+Le5NJDGLCRiKn0nZBqd
	Vh0hpl42OBm9mafIeT07y45MPuaKKORloUlsL/jpzIQqLH3i6eLFlMl7gmogxsASTJfW3hw+IHn
	T8CGdPQ7pUEsFaR/HAAe3FcWakDO3kUZ6Rbq+YIvgiIB0M3GrSy1yZIsblDG5DsMIDA==
X-Received: by 2002:a05:622a:2b45:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-5414ebdf590mr23748491cf.14.1793298230692; Thu, 29 Oct 2026
 11:23:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029162958.3224280-1-irogers@google.com> <CANiq72nrhqK0NP5q8_G=936++gZR3=zrES+cK96T95-ThVTpbg@mail.gmail.com>
In-Reply-To: <CANiq72nrhqK0NP5q8_G=936++gZR3=zrES+cK96T95-ThVTpbg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 Oct 2026 11:23:39 -0700
X-Gm-Features: AclHuK8I2R6ZBL0M8gpXX54gY1Y2jQq5EjXVV3xSH1Vs5_u0FZ2MTRQeP10WsJs
Message-ID: <CAP-5=fU8K4as51_Vi2vKAC-kGMVEFn1LDjCg1WvP8R0Y=8SbcQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/3] tools: Add Rust library build infrastructure
 and prefer zlib-rs
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Quentin Monnet <qmo@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:32=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 5:30=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> >
> > 1. **tools build: Add Rust library build infrastructure and zlib-rs fea=
ture test**:
> >    - Adds `tools/build/Makefile.rust` with helpers to locate Cargo crat=
e
> >      sources in distro (`/usr/share/cargo/registry`) or local Cargo
> >      registries (`CARGO_HOME` / `~/.cargo`), map `.rlib` prerequisites =
to
>
> When we were discussing whether to vendor crates for the normal build
> or whether to fetch them locally from the registry a couple years ago,
> we discussed approaches like this one, i.e. picking a version from the
> registry by folder name etc.
>
> But that doesn't work too well. For instance, the graph of
> dependencies may change, there may be several versions available (and
> the highest may not be the proper one to pick), there may be different
> major versions available (i.e. not backwards compatible), they may
> change the build scripts, etc. Even picking the highest major wouldn't
> always be correct, from what I recall.
>
> I also asked a few distributions how they felt about it, and they
> indeed said that it wasn't a great idea without querying properly the
> registry.
>
> So one should really ask Cargo for the right information about the
> local registry (i.e. offline). It has been a while, so Cargo (or maybe
> `pkg-config` or whatever) may have better support for querying it
> nowadays too -- I would suggest checking that first (e.g. `cargo
> metadata`).
>
> I think depending on Cargo for this, especially nowadays and for
> `tools/`, should be fine (we were considering even back then and for
> the normal build).
>
> By the way, checking Cargo's cache sounds very strange to me: that
> means the version that gets picked is even more "uncontrolled".
>
> I hope that helps!
>
> [ In the end, for normal kernel crates, we decided to vendor for other
> reasons, e.g. we wanted to pin the versions, to customize sometimes,
> and most importantly to avoid any possible user misconfiguration that
> could lead to a subtly incorrect kernel. But for `tools/` it makes way
> more sense, of course. ]

Hi Miguel,

This is great feedback, and it's why I thought this was an RFC series,
rather than a full blown series intended for immediate merging. I
think the other obvious point of contention is preferring zlib-rs over
zlib. I'll incorporate your feedback into v2 along with addressing the
large amount of feedback Sashiko has given, which may become
irrelevant if we trust in Cargo more.

Thanks,
Ian

> Cheers,
> Miguel
