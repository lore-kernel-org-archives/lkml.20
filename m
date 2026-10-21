Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792599060;
	b=TTkzZiyV2JOXrEyD4iA8DRjiCyQK4+A+RPr0UkebwFSPiOSUj+HVlMlFTZTQoHObe8s1
	 cnuQ4jqbtBJuSV2+N4X9kWWS6dnq4kFa2/X0I35sRdUfUoEjO6aMpAc0K3kSPf6uKTmMs
	 PettDQxvlf7LFCG8vjybhOPup2sANpEQ3sp5tFMrkA9HaItcUkFQ4ZEcRktGHb2BQCOB1
	 xc9H55D0zLqvsdHnY8qRVJg5aKqOCxYNrJ9a5w1l0kXd/yLihNcfZnbD5PnC6LEEmXclQ
	 X0DaU/LWUxJh6fz45MeuITCR1BjTRLAifkJyX9EujfCiPkUSVeSbC0FJhcoXzy96AqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=dBMzagSihcLR+OgRyCjXq3R/npWvu2cSWMevTjvmpMA=;
	b=If5VtX7IjdTGyckfeopV9e9trhB8P4RjlVtCzINJWOIGDKfVD/02jH6QwnAOJ46JC1cD
	 U/rKxipaZqREAL28cIcsGtj6DYNLPyERew2hOlQZsb2JYvf5bOGQ6WNQYFkzrfzrg1ueA
	 tXOcUkZDl0lLIHtXiX4q4mEd+fwLLZnNk059b2URdtsDlVwBec2xgtznfFaRUUOcQs1rw
	 PqW4uFqIwlrrxIzdy+UF0FumQHUzEFR+SLxL235ZLXtd8okOmrBWk5JSw3rS0k4yk5nxm
	 z74V/3asVCvU4d+/TkAOsAphSdPk8ZcexiNJ8TuwMvRllXB9Sadehj139jMQ8PqUHEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WOlWRiXV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21588606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21588606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WOlWRiXV
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9f6a16afcso66585ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792599059; cv=none;
        d=google.com; s=arc-20260327;
        b=jEOlJU3KsfLgjNkPKM+pTpRY0MGdzA2f8TycNcVDFakqgpUDGye23yh+Lmawt15Eyf
         8JLRzvwr6pYlMKFcBKTMwJBMh4FPZ59GiEndMjNoBeWdLfzyMY5/aL0MGhY/jK8LJXkT
         lxSDxVx08ndldmApo7i6zC5btbnCUGw9C92m6uih+G7Y5MSgkQa/pM3YsMq7zADIDI6a
         pg5pBzkFwfbQ2SxjU6HhrkSqOfgEo0K2q62DhGIh4hAXCGevbgUtO/RBPguUN/cnP9KR
         CnzHU2Kzqxl8M+K20EFIMcZy9NXfYeHHgjL2ZYUyXArhGyYQXze0+JHZF1L06zXXHdd6
         onWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dBMzagSihcLR+OgRyCjXq3R/npWvu2cSWMevTjvmpMA=;
        fh=Z9uNAAAPhvIhz5RYf5uPBEC+coGyboyDLQu+YCUmhEA=;
        b=YKofhAbJK7Mf6BxrCSA0xpr5qBHaaIxbYUHeKhSn+pY2/KodxtkHmAItUUcZDja8Yr
         RL1fZobzOQk5JBrgRpp+LI2bYTO145stLQAbvS+xFFRPHsHvE6CcSsJuUsFW5BkKdshd
         BNm/J5UIt+iseR8bfyYjklg+4COp1OCOgGY+vZDTaBbTyxBvzeymoMeb2QQEeAM2YEBb
         eYfRmEb8OfiDiy1LM6VIZXW6mLEMcApuanVQHiTbweddMeM4Hcu0gTqPuHFNd+zCEarI
         URWhXt+D1I+m84vOmTiBzEdGP64+qhiwFGbAyPz0tuWRpjtzfvOOuOpR+K3Iu74vXQ6E
         4J8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792599059; x=1793203859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dBMzagSihcLR+OgRyCjXq3R/npWvu2cSWMevTjvmpMA=;
        b=WOlWRiXVavEBBM5vAIph0iQUch6mB5PUDFp8xqBWZ6LohrmiMsn2Y7E2HLyhNP/zof
         wf3uLhcaX2N2x4Q7b6lNhyPa6bsx2Zyw9amFhZztMOSxQIC+R7Ur61PS5jjiqUnhsrRA
         gaEuruvHUCI1VtxKi7humVmBR0F4FUZCX1rNDPs0LbsgqBRjCIYETNYDot9PwIIb2iXE
         BI4YOVK7a7qRJHEx5wTHGKW/+PyR73dj6+Q+YuaKg7iseaicGXpQYhNWvsEs/w+sD+Gj
         xXR+AqwZwoGOAxT2OhNn4hIU43mtLUe0QbGquaDfLOV9LL1aEo2d+e6/OAe3XHeLKPf0
         ow2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599059; x=1793203859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dBMzagSihcLR+OgRyCjXq3R/npWvu2cSWMevTjvmpMA=;
        b=BCXUH8VnFlYsvE4LRGS1RW8BDVAD+IuqEqvsjQ+rgb/opxWXEFCE78ukCXDPIgnXym
         JrTw0NC/V9S69Os+L2eITYHKbVL27Qy9I8lW6Gb5TqAzyK2212NCaLVadwKrSj6Q/x0D
         UfCp+hfHw7YcS7tyl8IRI5hfgBWVq2J7I9CdnEQ10s1IwasuJVccacXT2hmHJ7ldkQ8I
         +r0xdmzRoeUYi6TWfHTZeWS3lfEu7Oq/rbvdKjlEv31dAlx8mhbcyzc9pEezbPC59C59
         PTdbY07eHjHyaSFXIGScaG4hAbX0xTI3mEQGjJM41s2TZux/rgQQQILZf8ySHm8Z6sGN
         2cvA==
X-Gm-Message-State: AFq9FYKJZOoY3kvamqm4wc6mySdDPeNodNxN5R8O2QiNxgCwFsCFsL9m
	rCwcaISkK6lrrOTJYWY0ncKe+ogle6r2LLHbjnntmp+TBoElqIgzLBfzzCbdvqU5mXNDDXwH5iZ
	ww/uom9H0UmiTCSSkehlAbkPBatCwtN6MzVSqkyLC
X-Gm-Gg: AYBFou0PqJ+nGSPORVMRzg0GWx2f3J+/DNdaFvjgOj6Nh9IecEzPkEFoqn5mqpYIo69
	1XhEdftpHI+EYSKGtc58aJ5QWmySWA+3s578/WYjHElMmE9EXQzLhwdzeIEfzl7cpoKRVsQyj5y
	OJfM2gJq/NCdqWeuGBOKeSC9tuqgK0KbC8uZB8nVADQRqMtEJETIZDw1XSouNBWAdHKATXqdBgJ
	Eb9KnQkFUuv2CkjJaXoQlCmRGfj52Vs8zhYp4Y5zmfQ3AsaMA5OIe8wDhEmhfOohlRqBzVdMmTt
	kf1JUtQWn5c+T7cJIK5VTE8MVATIyw7RCrEkUQmwjkOg1EdOV8HeBY1Xu/H6AL2hEBqdHHkpDQh
	h5VXz+mCAKtsu9+QWtRKKKvM/5GHZhja/HqfWkQ6o5gUHccgSm4c+Sg/TKjeQCOVVIQ==
X-Received: by 2002:a17:902:f606:b0:2e3:981:4cc4 with SMTP id
 d9443c01a7336-2ea1e3c3553mr10748135ad.9.1792599058774; Wed, 21 Oct 2026
 09:10:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018133032.24467-1-breno3011alves@gmail.com>
 <20261018134322.26445-1-breno3011alves@gmail.com> <20261018134322.26445-3-breno3011alves@gmail.com>
In-Reply-To: <20261018134322.26445-3-breno3011alves@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 21 Oct 2026 09:10:45 -0700
X-Gm-Features: AclHuK_C5BpDKqLu193wcVkXT5s0qoAMdlZwM9YFf1CsJCDKK7jQ0mXPyuVrBug
Message-ID: <CAP-5=fUs-+Tdv1XNcDX4o=tM_KXh59JuAewVPTsoi8EZia476g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] perf/tests: convert check_*.pl helpers to Python
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 6:43=E2=80=AFAM Breno Rodrigues Alves
<breno3011alves@gmail.com> wrote:
>
> Faithful re-implementations of the four Perl test helpers in
> tools/perf/tests/shell/common/:
>   - check_all_patterns_found.pl
>   - check_no_patterns_found.pl
>   - check_all_lines_matched.pl
>   - check_errors_whitelisted.pl
>
> Same CLI, same output, same exit codes. All use only the Python
> standard library. TESTLOG_VERBOSITY and TESTLOG_ERR_MSG_MAX_LINES
> environment handling is preserved.
>
> Update all 37 call sites across base_probe/ and base_report/ to
> invoke the .py versions. Update Makefile.perf's install-tests
> target to install *.py files (in addition to *.sh) from
> tests/shell/common/. Remove the four old .pl files.
>
> All four were verified byte-for-byte identical to their Perl
> counterparts on synthetic inputs.
>
> Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>

Hi,

The build in perf-tools-next is now running mypy and pylint (when
available) on all python scripts:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/Build?h=3Dperf-tools-next#n100
We disable some options:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/Makefile.perf?h=3Dperf-tools-next#n317
Applying this patch breaks the build for me because of this and 1
pylint issue. I see:
```
$ make -k -C tools/perf O=3D/tmp/perf12 DEBUG=3D1 all
make: Entering directory '.../tools/perf'
  BUILD:   Doing 'make -j28' parallel build

Auto-detecting system features:
...                                   libdw: [ on  ]
...                                   glibc: [ on  ]
...                                  libelf: [ on  ]
...                                 libnuma: [ on  ]
...                  numa_num_possible_cpus: [ on  ]
...                           python-module: [ on  ]
...                             libcapstone: [ on  ]
...                               llvm-perf: [ on  ]
...                                    zlib: [ on  ]
...                                    lzma: [ on  ]
...                                     bpf: [ on  ]
...                                  libaio: [ on  ]
...                                 libzstd: [ on  ]
...                              libopenssl: [ on  ]
...                                    rust: [ on  ]

  INSTALL libsubcmd_headers
  INSTALL libperf_headers
  TEST    /tmp/perf12/tests/shell/common/check_errors_whitelisted.py.pylint=
_log
  INSTALL libsymbol_headers
  INSTALL libapi_headers
  INSTALL libbpf_headers
************* Module check_errors_whitelisted
tests/shell/common/check_errors_whitelisted.py:13:17: W1514: Using
open without explicitly specifying an encoding (unspecified-encoding)

------------------------------------------------------------------
Your code has been rated at 9.76/10 (previous run: 9.76/10, +0.00)

make[3]: *** [tests/Build:124:
/tmp/perf12/tests/shell/common/check_errors_whitelisted.py.pylint_log]
Error 1
make[3]: Target 'pylint' not remade because of errors.
make[2]: *** [Makefile.perf:690: pylint-tests] Error 2
make[2]: Target 'all' not remade because of errors.
make[1]: *** [Makefile.perf:343: sub-make] Error 2
make[1]: Target 'all' not remade because of errors.
make: *** [Makefile:82: all] Error 2
```

I like the change although the perf tool and kselftests may get merged
through different trees. It may be better to separate the patches.

Thanks,
Ian
