Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E543443E3B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099600; cv=pass; b=KjSfiyTVcyXY7pP30KKM1ujDwlRIkqq5y36fK1urP0h5lYBSxDvlGWEK4ZWYBMKf8VKIc/hyJff5sm8jbMM2M6VtGGK3w/1trLIexw2wDekE8/p3xGS/eYELG4EsDez08rqctoc8QjFNuibvybDxLf0PtK9/04RvC3PPyvL7oy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099600; c=relaxed/simple;
	bh=S24dOVcDoMu01ibSOw1+bNFyN8uZ1WIV5X5lG+8sUTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBWXJ4jM/p+catezrOp0lrlfCgvY09JVFfRYp7Kv5kLQ6X19u2nGnjOmpmeaujs9G8P9uMxOUCbBB/jG2ounWrAbU2w2AaCTVOjn6JdqLhGhdNu+TGZMBPiG9W7Zg+7Y9pvfBS2yyfVHAYMRyHRqvtrsts15LfQ7jXgApvvbB2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oKrckloV; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oKrckloV"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-535f598d126so38651cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792099598; cv=none;
        d=google.com; s=arc-20260327;
        b=jsbtBjqkjIJQHPO7KckxP+XLoGPWciZqqbs9bInatREISoTSE4/o3elRoRTot9xSsf
         77fmoSMT7BWNiF8bRrHdYDs4MMfq4oF+fK/7DWOvGWluPQEMjfRW0UEY+cQUJV5Y/P0H
         ljE999uqPC4aCsSpE8VM8wY7OufpMNIhfFw3jmzYY9G2qtqw6dkBxHcbtHKklVI892wv
         daJcYrE0r2WPdF1xcUQAoaUe/of8R24R7Y8vGKvTLIQYTqgJpAfoboelw6cuJ/XQuGxG
         rJQkku42JV02sidGQyp54S2ncxOPP+/cyyTTe+H6OAdPmG8pr2+oeoK/lSMcjDq7GlAp
         ZuIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OgcgdziUoCAQVTSOyr0xkG5j6Rc5FznnZ78bB8A0JZM=;
        fh=5GQg1OmRkOeSJ8ewKrsT6ikb6gyF19kP5LKYwkM7yo0=;
        b=Bk6npPIG2ZpKs0tFQffsagfm30Nz0MqfyD9kyfU9Nunrq66X0yJ5/RMVoxSZJ/6KoT
         iy+WAwiD/aWZ/5MU10epmbRbQ92ugFBH3mH+2xIaHQsQklvjHS5MGGBmfHN7O7Sq37MS
         QBkUcn9hCuMVc6ibHP+VcHlBGEtuOzHFFlKS2yLkVPtFXmxoPygFhOmrxrMq5c46mKX5
         AMEo/Aaaeo/WFztyfhbyWYNzN52GBFauKuV1drh2hBxF2tM2KQshm30a/+ztibzFZcqc
         8U5CD+vygr+t4aH+H6DRwjLHbPPok/SEuLt+K2LJHRsJzT1atV2yYGi8SpW3gqhBo9FP
         a+xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792099598; x=1792704398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OgcgdziUoCAQVTSOyr0xkG5j6Rc5FznnZ78bB8A0JZM=;
        b=oKrckloVPBkqU275fV0Dp0vswVpn9xI3pbBF0luDu5tSShg5dkG2YFZkgn8FRW6zce
         SC6ce0/U2RwBMT7UdzqImKj7Zwk5S0nhq6OPLHt7tgXeMAaz7CD4ePFHyCr43fJxXA0Y
         2jw5Oyrx7g+KPlc3TkA9w3oG2VFtEizziz3jHzVGNBWpDorHwNjHlbHymuYcu8CVQyzI
         mvaz+FJ/xCsHJnZ4uSZEhOWijfOu6wwnL3wJ1s+dxyrL6peIWJod70X2U1Wzemtm1L0N
         CFqg8wwGGvxXUvAYmKzgnxuDknpyeEjx5L1091lujDB82PDgTH1VZb4IgR3IDFsb64PI
         K/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099598; x=1792704398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgcgdziUoCAQVTSOyr0xkG5j6Rc5FznnZ78bB8A0JZM=;
        b=uayXe4XoAvccKNF3ZdtBSmVPxHAyFljg2SBPiCbqdZUgaKtyXUElN1JrFl4//xNgSM
         LsTMAqf+OkCd6XCG5erAfv2GEASyhK6tuBhLtib3ij2sXnmiK2i1MlNjYWZBZekUhL6j
         1UUkd/hmjChlgOh6MQIQ8hKiXQ6P1Vli6O0XeQGLDZLaFl4R1/EOSUXYzBKitsezzLoG
         fEGSRjGOvv/oT2yK2Rbe0YIg0q6vjHZw+UO+Nm/3IeZ/XDbwMf/ngiu/gljzd98+dtUF
         CF61aCApKSPutkFOrAA/hlv3Zm+HNXeKcaUummckuF1QKFWW704Q50QUi/S2ix0Tl2do
         JK5g==
X-Forwarded-Encrypted: i=1; AKwUvBwW4D9NoAPZ+f88ih7cGcytnQJBmefxzsCoWmB7pJwTrYbbqRM1emaA4Wjn9Q3PiL2+2bPAtKxP/SJYTXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeLHF5DYb4Y5+YwDowdwWJ63Ge8fULVDoc5Nb7MGZyUKj5f37N
	lWOALVistSSZCb6siQdhXmxeIwnv9X7a8zTdJTElnLiUhev3SgkLbE5UF09nnm0988/kNMg358w
	BBoMRkhTld4G8eSNzt88h7nP1515Rj5EZt8q42ATG
X-Gm-Gg: AYBFou333RHyVeQ6cAbOWJYhYtX/J2PPtGXw+xkoLJQDz3U7J/8N2SasnbCcz93nCuP
	9LByG7RvgNMwnUUJTepwlKnUyTjQ8Y2tzaUwSGYockcBFQP3iM//I7IiJUBSpiHcf6qvic1Tec/
	kOfhl0VF0b5Ju9Ql50gSOxbXa0tPJZOMe01tDcDrYcuohKu/fw9NOHgSO9ORQpgg+335RR04Q4W
	d4KAkcxoyv1UrILCHlWEt+y60z6aJzdlwYI15klyzSEN4AuWZKs61TONaZCcLVvIK/G8wRsaaKv
	XzG1iG8Kmp/UsCtI4QKfEmkdDg0VJ0ixiTfwFS8HugIXg1Nz4h83moLiNF5QWOlFIfys6BNMwWC
	bufnKZgOIgw==
X-Received: by 2002:a05:622a:580a:b0:535:cee9:78ee with SMTP id
 d75a77b69052e-5362b4d91b9mr2154821cf.15.1792099597789; Thu, 15 Oct 2026
 14:26:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011233647.2454648-1-sashal@kernel.org> <20261011233647.2454648-4-sashal@kernel.org>
 <CAP-5=fWFY-tpJz2vcBZvurwdZY5gwd8cuTemE9q1rtZ0Vi0dng@mail.gmail.com>
 <20261013170854.647305-1-sashal@kernel.org> <as6SxXELnoIJenIX@x2> <atEo6aIQbgww4G0y@laps>
In-Reply-To: <atEo6aIQbgww4G0y@laps>
From: Ian Rogers <irogers@google.com>
Date: Thu, 15 Oct 2026 14:26:26 -0700
X-Gm-Features: AclHuK-FmTfmnNngMCTHGyBJ-W37rLbDe_VKRvUNDuHeCzq-aOwVNF9WYcEKmR8
Message-ID: <CAP-5=fVq9rpDm2v8EjrQBVz6aV7SLaYzAwncQBwut0QDnFJ-kA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/6] tools: build perf in tools_build
To: Sasha Levin <sashal@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	linux-kbuild@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 12:26=E2=80=AFPM Sasha Levin <sashal@kernel.org> wr=
ote:
>
> On Tue, Oct 13, 2026 at 05:21:25PM -0300, Arnaldo Carvalho de Melo wrote:
> >Why is that difficult to run:
> >
> >make -C tools/perf install-build-deps
> >
> >To do a recommended perf build deps install?
> >
> >That would be useful as it is what we expect users to do.
>
> That's what users do, but it wants to install packages.
>
> We need a path for unprivileged builds on bots and CI machines that can't
> install packages, and many of those builds are cross builds, where perf n=
eeds
> the target's libelf and libtraceevent rather than the host's.
>
> >If that is too difficult, for some reason, there is a minimal build in
> >tools/perf/tests/make, that is tested since forever:
> >
> ># all the NO_* variable combined
> >make_minimal        :=3D NO_PYTHON_MODULE=3D1
> >make_minimal        +=3D NO_DEMANGLE=3D1 NO_LIBELF=3D1 NO_BACKTRACE=3D1
> >make_minimal        +=3D NO_LIBNUMA=3D1 NO_LIBBIONIC=3D1 NO_LIBDW=3D1
> >make_minimal        +=3D NO_LIBBPF=3D1
> >make_minimal        +=3D NO_SDT=3D1 NO_JVMTI=3D1 NO_LIBZSTD=3D1
> >make_minimal        +=3D NO_CAPSTONE=3D1
>
> I tried make_minimal on perf-tools-next. It still requires libtraceevent,=
 so an
> arm64 cross build without the arm64 libtraceevent installed stops at that
> check. With NO_LIBTRACEEVENT=3D1 added, it then fails building the Rust t=
est
> workload. Natively it still enables aio, libLLVM, libslang, libtraceevent=
,
> lzma, zlib and Rust when they are installed, so the result depends on the
> machine.
>
> I'd like to go with Ian's suggestion then: a MINIMAL=3D1 knob in perf tha=
t turns
> off every optional feature, which tests/make can use for make_minimal as =
well.

I can put a patch together for that. Just for discussion, I did do
some work to break perf dependencies with libraries using dlopen/dlsym
like:
https://lore.kernel.org/linux-perf-users/20260130233439.647447-1-irogers@go=
ogle.com/
An area of controbversy with this approach is that it is still nice to
use the header files for the library as library authors are bad and
will do things like change function APIs over time. If the build uses
the header files, why use dlopen when you can just link against the
library? I could imagine using dlopen/dlsym for libtraceevent, but it
would end up repeating this header file and library argument.

Thanks,
Ian

> --
> Thanks,
> Sasha
