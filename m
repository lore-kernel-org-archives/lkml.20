Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852875;
	b=IDUCaMveyTLmHiMGAdy8QHfHLiPQ+kCsAx7oD7OFmt0AHfY3NL1SFMWS+wN7Yi3ggI9F
	 bl05Xm+wfPab37Oi/7saSpMoTEaEm6mSfCUKK0S6WIydfy7onkbtMeSr2oxv1T7tExrCY
	 AC1DjYA1OsAxJCnuHBMPu8sZXmEAoYVee/tnGnihXHjdSCZNRMSbFjbq5Y8lbOe013iO5
	 8Mr1ZrVqL6ZtSmCpUHcAraz9B/7/TBWLMEFnNuwKaFn5dkQbHNAq8eVdD8Kz1wn/4aDCk
	 hx1TPoegzZrisPtYbPtBYA+tg7zZdyt3chFkpnydSlEwbzc7GGZqpz2TF2Oe2f7QkqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tbwNSvGvkZ6FGvVLTIjJxQ3bE6+PehswRYJGBnKvxtI=;
	b=gfRuIXrhMmpm7Jo/Vp6jcpt1z2KaGvVozZg16UDGQfpSR8Brs9uOx8bUlNTFNhmfCFst
	 Th3hRPz282FF4viNJQIgyw03A9MH25c0vUvnWxUUd5Qk1omYv/fWJXMSIqa3v/AygKS4c
	 SBNvIqnqmT6psXQJzey8L43dNPiLVss7Yf7DLhyiWcI1r/zWd5i9hAytuYWT4+omisXm1
	 bS2yh4QwD3LWC1Nm4qdOOMhs+fOczfp14iQ5NNTjRFYWP8Z+Wc3gaHnPKQwvpLBYtwvk9
	 jZvgPwNyFSJ89psxDkOQ1qLSav237dfq+ZgJTnBNlpCdMmm8GEiIB0WNtyslnKsnvFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=REtwaOnD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC1E606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC1E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=REtwaOnD
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d581da0aaso455616766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852873; cv=none;
        d=google.com; s=arc-20260327;
        b=kv2gvDtB+HgNTGhqZBhCPngETO6UrEk0JjVxTZTeSgiu3YRWeIvNVsWkN3VAozw7Ty
         cIMIjktc/Q0T0EU2fDCqWawOiYt54F9u/sIA6wv8C7p3rxyiPSEqoDzD1xcWY+nUQ/B7
         gwJE2QNDyFoICLkr27meu3JAnwZytMd13bG6ejAGjjiFRE/PxUqS9dxDSTfK6BmaLF4x
         bCnzu4GzNFzFUwvj9zzHViOD85pAkgygmMHtg8glJtzixd/nC9ZazZ8+/LDNwbTe0Wua
         +vkFhzXJ07EU7ZDHYdFm8tksf1CjwBIdjuW6J2E6RwQ9l/u37dy9D6NYMTWUThf5kJN6
         vKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tbwNSvGvkZ6FGvVLTIjJxQ3bE6+PehswRYJGBnKvxtI=;
        fh=mUbTANdRT6hpL5NN7rkxI1CcvfF0+7sc5Po+LHYnTqI=;
        b=SDh7uJLyFvyAHaFd6c83MSyXshiSHgMnWtXyIgK3M0PtKuS/1brEYxtVUbaG0hhlrH
         8yhb/Aa1yiSLcpxjknrAGQc8JDYeCkZ8Pe6Pg4+DBywoRAzgbajge5scu7JZI1F/BCeR
         o/7DCuRGat2uH1FWLsOnXeJ+YteHQM1NQ92LiuCyO723KLRFtNY3QsPEJVrmkkXGg3UD
         R56OeGmjW/yfGmKlgz/f0yeyZLFeKBn6JXR8vA1l88GK/IhfRH7V46dTGcT4DF629ivw
         IsXFWr9vQX0QHk7oVx+7UQUwl9OjReKpBOhQ8xvWlY67bQzKudcdNC7E6++7GjIeaoLb
         ZMyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852873; x=1795457673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tbwNSvGvkZ6FGvVLTIjJxQ3bE6+PehswRYJGBnKvxtI=;
        b=REtwaOnDQoPmhuzfDWBecqvY2Nej4BY/Jc4KPgXp1NH++xbW04qqs5XLWElU23N/Kf
         JT129YSY9gG87GzUgRtmPPU7nYEKhNe7HzFsEnt/iUqSYBZUvSUmK5XCYL3rOgR/hWkg
         r5bgTY1lUh7wS2Lbao3cD8uS9cQAUZemxzLXULZHVyKKhcvKLiIZxS/FtShIFca0fXDV
         RJjhaLktOXMJzhtbTg7TEcdaFfcB6cd8GTXsdJ8UkF6yvS05qEbeimYnaXQwHM3DhO7K
         Px8BixiJP2UdTiHOBgaKbygtKt2z61AwQ+CYPuD9Ah9l5olPiDAcmFd7h4I+lTgm/3Qw
         c12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852873; x=1795457673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbwNSvGvkZ6FGvVLTIjJxQ3bE6+PehswRYJGBnKvxtI=;
        b=1GKfQIp/sPYoVHmAi4pXgciNSiSDc85urAfe+WddlR/SwMEzLxHEsz31CUY97ZkzWH
         Tvyx5VxCxB9VlZRHF3W05+qJrAvMd6BdRwo+A4ZIo7Oq/8sAgKWoHvsitUN/Z2Oiw7B/
         9xWKCtIDVzLsBSvJQumba1/nDNoMiVqGEGLN4lN0eIAM5/3dQt3O9bqpJVv1dzZaFZe0
         6yNZPqWAuLB2TG416nj+3MjWlEWpXGuyExUfOVu9MdPROB+M6SJP8E+nq47dzTckMMK2
         0bNjQ1Y6HjNLH6zGH+O7dzKhcWQ7cwF2+omiEXfbfxsyvJV9L1Fuw/Hj3AAV/NpKm8lH
         YWew==
X-Forwarded-Encrypted: i=1; AL+hErFhvFfaC8TidF0EIUId/IBeM31mSyyL+UXsysTwnEbFtLUoYUKQxEjbTsRtx4ysisyVWejgRiYPKhoAG10=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eW68Y6jdGtUumBy4Teb9rtoAPKVTxES+gl/QHIvbZp/Z+OAy2
	zx0ylDXq/M6cGTZ8AlI7ItDV1O6vha8RbhjOQXnlyx61mL6jCoiEgyrVelNNX5t8jM88RAKYpYK
	8xurODREEcl7fyQZasnRmCjH0Y+kd4Gg=
X-Gm-Gg: AYBFou0G0Z67jL7jki5pY2IMv5SQQn2Q0fxtQivu/Z/DCVbW1PJuRTAqsfbJBtjfplT
	Exw9nL9Rtm0961+wQ3/moq/chNwnww3mbObTpv/HwYAfhQXo42TslicmpykUOSVNSJusrBj2Uco
	8AJRsgRVfOkF6NxGbobJuBUYOnKK9Us/tY1oGW3CvwqxEI0JigHJj9nsh74hgqpmTQqf/DZ5utc
	/ce9AM7waJiZayXr1qnPeqeE4fL/nV0tKNIcIUf2QNzd6Y4cNFpVP+fWPfuoeTYem7a7w8G+nrv
	kZHGrQICIvPG7exQ+Lg13qMbcF759lyXKTyCgFys6GLL1cRosrzSI2qcc65MSvGQFvAa03zHz2m
	04WVBu5xlSfOM022P2bFVF+NUAa6u23b657FboOLJfDuvL25vPzABEWvuWB35k6sL1+M2DA==
X-Received: by 2002:a17:907:3ccc:b0:c49:a235:8e0c with SMTP id
 a640c23a62f3a-c509637e31dmr934233266b.22.1794852873007; Mon, 16 Nov 2026
 10:14:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025164719.1831477-1-sashal@kernel.org>
In-Reply-To: <20261025164719.1831477-1-sashal@kernel.org>
From: Sasha Levin <levinsasha928@gmail.com>
Date: Mon, 16 Nov 2026 13:14:19 -0500
X-Gm-Features: AclHuK9sfeiUUhkQOi4L3FtpqX1XWSWrAtRgGWBj0BPLzcNiTLpwmGT382OC52c
Message-ID: <CA+1xoqcxAsRij1j10TyhNX9JXNXNkdWO3sMaVRXCqYdEXi45fg@mail.gmail.com>
Subject: Re: [GIT PULL] Kernel API specification framework for v7.4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping?

On Sun, Oct 25, 2026 at 12:47=E2=80=AFPM Sasha Levin <sashal@kernel.org> wr=
ote:
>
> Hi Linus,
>
> Please consider pulling the kernel API specification framework. It has
> been discussed on the lists for over a year: five RFC rounds starting in
> June 2025, then v1 through v5 this year, the last on October 8:
>
>   https://lore.kernel.org/all/20261008084956.2911790-1-sashal@kernel.org/
>
> The branch has been in linux-next since next-20261009. I held off on
> sending this until the first week of the merge window was over, to let
> things calm down.
>
> There are two conflicts with what you already merged. linux-next resolved
> both the same way:
>
>  - Makefile: kbuild added '*.header-check' to the clean rule at the same
>    spot where this adds '*.apispec.h'. Keep both lines.
>
>  - fs/open.c: vfs added filp_close_sync() just above sys_close(), which i=
s
>    where this adds the sys_close() kerneldoc. Keep filp_close_sync(), the=
n
>    the new kerneldoc, then the existing "Careful here!" comment and
>    SYSCALL_DEFINE1(close).
>
> The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf7=
8a:
>
>   Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/kapi.git tags/ka=
pi-7.4
>
> for you to fetch changes up to ef777ef05ebcc5ea5393b4bd5af6fc3ad1b3aec9:
>
>   kernel/api: add syscall enter/exit tracepoints (2026-10-07 18:26:44 -04=
00)
>
> ----------------------------------------------------------------
> Kernel API specification framework for v7.4
>
> The contract of a kernel interface (which arguments are valid, which erro=
rs
> come back and why, what context it can be called from, what it locks and
> what it changes) only exists as prose in man pages and comments, which
> tools cannot check. This adds a way to write that contract down in a form
> that tools can consume, next to the code it describes.
>
> A spec is structured kerneldoc covering parameter types and constraints,
> return values and error codes, execution context, locking, signals,
> capabilities and side effects. At build time kernel-doc turns it into C
> data in a dedicated section of vmlinux. From there a spec can be:
>
>  - checked against syscall arguments and return values at runtime by
>    CONFIG_KAPI_RUNTIME_CHECKS, a DEBUG_KERNEL option for x86 and arches
>    without syscall wrappers; a call that violates its spec fails with
>    -EINVAL before the handler runs
>  - read as JSON from debugfs
>  - extracted from vmlinux, debugfs or the source with tools/kapi, which
>    emits JSON, RST or plain text
>  - followed with the kapi_syscall_enter/exit tracepoints
>
> The first specs cover open, close, read, write and madvise, with a KUnit
> suite and a selftest in tools/testing/selftests/kapi.
>
> Everything is behind CONFIG_KAPI_SPEC, which defaults to off. With it off
> the syscall definition macros expand as before, kernel-doc output is
> unchanged, and the only change to fs/ and mm/ is the kerneldoc text.
>
> ----------------------------------------------------------------
> Sasha Levin (11):
>       kernel/api: introduce kernel API specification framework
>       kernel/api: enable kerneldoc-based API specifications
>       kernel/api: add debugfs interface for kernel API specifications
>       tools/kapi: add kernel API specification extraction tool
>       kernel/api: add API specification for sys_open
>       kernel/api: add API specification for sys_close
>       kernel/api: add API specification for sys_read
>       kernel/api: add API specification for sys_write
>       kernel/api: add runtime verification selftest
>       kernel/api: add API specification for sys_madvise
>       kernel/api: add syscall enter/exit tracepoints
>
>  .gitignore                                       |    1 +
>  Documentation/dev-tools/index.rst                |    1 +
>  Documentation/dev-tools/kernel-api-spec.rst      |  648 +++++
>  MAINTAINERS                                      |   13 +
>  Makefile                                         |    1 +
>  arch/x86/include/asm/syscall_wrapper.h           |    3 +-
>  fs/open.c                                        |  557 ++++
>  fs/read_write.c                                  |  710 +++++
>  include/asm-generic/vmlinux.lds.h                |   14 +
>  include/linux/kapi_syscall.h                     |   35 +
>  include/linux/kernel_api_spec.h                  | 1226 ++++++++
>  include/linux/syscalls.h                         |   42 +-
>  include/trace/events/kapi.h                      |   74 +
>  init/Kconfig                                     |    2 +
>  kernel/Makefile                                  |    1 +
>  kernel/api/Kconfig                               |   74 +
>  kernel/api/Makefile                              |   13 +
>  kernel/api/internal.h                            |   25 +
>  kernel/api/kapi_debugfs.c                        |  553 ++++
>  kernel/api/kapi_kunit.c                          |  720 +++++
>  kernel/api/kernel_api_spec.c                     | 1470 ++++++++++
>  mm/madvise.c                                     |  549 ++++
>  scripts/Makefile.build                           |   26 +
>  tools/docs/kernel-doc                            |   12 +-
>  tools/kapi/.gitignore                            |    3 +
>  tools/kapi/Cargo.lock                            |  679 +++++
>  tools/kapi/Cargo.toml                            |   20 +
>  tools/kapi/Makefile                              |   33 +
>  tools/kapi/README.md                             |   33 +
>  tools/kapi/src/extractor/debugfs.rs              | 1704 +++++++++++
>  tools/kapi/src/extractor/kerneldoc_parser.rs     | 3335 ++++++++++++++++=
++++++
>  tools/kapi/src/extractor/mod.rs                  |  442 +++
>  tools/kapi/src/extractor/source_parser.rs        |  531 ++++
>  tools/kapi/src/extractor/vmlinux/binary_utils.rs |  461 +++
>  tools/kapi/src/extractor/vmlinux/mod.rs          | 1160 ++++++++
>  tools/kapi/src/formatter/json.rs                 |  659 +++++
>  tools/kapi/src/formatter/mod.rs                  |  220 ++
>  tools/kapi/src/formatter/plain.rs                |  679 +++++
>  tools/kapi/src/formatter/rst.rs                  |  802 ++++++
>  tools/kapi/src/main.rs                           |  123 +
>  tools/lib/python/kdoc/kdoc_apispec.py            | 1391 +++++++++
>  tools/lib/python/kdoc/kdoc_files.py              |   12 +-
>  tools/lib/python/kdoc/kdoc_parser.py             |  101 +-
>  tools/testing/selftests/Makefile                 |    1 +
>  tools/testing/selftests/kapi/.gitignore          |    2 +
>  tools/testing/selftests/kapi/Makefile            |    7 +
>  tools/testing/selftests/kapi/kapi_test_util.h    |   31 +
>  tools/testing/selftests/kapi/test_kapi.c         | 1163 ++++++++
>  48 files changed, 20350 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/dev-tools/kernel-api-spec.rst
>  create mode 100644 include/linux/kapi_syscall.h
>  create mode 100644 include/linux/kernel_api_spec.h
>  create mode 100644 include/trace/events/kapi.h
>  create mode 100644 kernel/api/Kconfig
>  create mode 100644 kernel/api/Makefile
>  create mode 100644 kernel/api/internal.h
>  create mode 100644 kernel/api/kapi_debugfs.c
>  create mode 100644 kernel/api/kapi_kunit.c
>  create mode 100644 kernel/api/kernel_api_spec.c
>  create mode 100644 tools/kapi/.gitignore
>  create mode 100644 tools/kapi/Cargo.lock
>  create mode 100644 tools/kapi/Cargo.toml
>  create mode 100644 tools/kapi/Makefile
>  create mode 100644 tools/kapi/README.md
>  create mode 100644 tools/kapi/src/extractor/debugfs.rs
>  create mode 100644 tools/kapi/src/extractor/kerneldoc_parser.rs
>  create mode 100644 tools/kapi/src/extractor/mod.rs
>  create mode 100644 tools/kapi/src/extractor/source_parser.rs
>  create mode 100644 tools/kapi/src/extractor/vmlinux/binary_utils.rs
>  create mode 100644 tools/kapi/src/extractor/vmlinux/mod.rs
>  create mode 100644 tools/kapi/src/formatter/json.rs
>  create mode 100644 tools/kapi/src/formatter/mod.rs
>  create mode 100644 tools/kapi/src/formatter/plain.rs
>  create mode 100644 tools/kapi/src/formatter/rst.rs
>  create mode 100644 tools/kapi/src/main.rs
>  create mode 100644 tools/lib/python/kdoc/kdoc_apispec.py
>  create mode 100644 tools/testing/selftests/kapi/.gitignore
>  create mode 100644 tools/testing/selftests/kapi/Makefile
>  create mode 100644 tools/testing/selftests/kapi/kapi_test_util.h
>  create mode 100644 tools/testing/selftests/kapi/test_kapi.c
>
> --
> Thanks,
> Sasha
