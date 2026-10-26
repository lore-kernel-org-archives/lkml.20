Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041681;
	b=XVpRN/h+nXXY3jlyAmsEOdPz1fynXH/ORdR75Hweo7LveDBKZ1MjwJSeG0UE2Fdue2pW
	 cr6sUDT7bZlyR2ck2b59tfnmNJ5XrucAZvlsIHOtn4G2Um6MsX/NizB0E74sbC8wJB86L
	 AiOuLJsn5t6sYKzqU2ztY6KdHxK5TP7JkqpKP+2C+vxeOgAbI06EJ+eUuq7EVwvUE6xa7
	 s4XVh+lLl5gebcbVDb5+q9ItctsWKZCQSWWUPhceJtP/Jlm2ICaep/zT6jZ1IrWPOTd89
	 wDgLzPTNCli9deTqELAV55+2Lz27xpMOGc7Ka6/B0z2OqtorsnYCN/RGaZXTpLyGaRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041681;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=urfO6D4hqsaWObIrpF6xBqN7wc2zXiiEIXZMlS0+D0s=;
	b=ybE9c2ZfLwxYDHIJ49VoBgik2fKO0ZZkfMlEJ3ouhcZsku+QJFbUK2y8uzVhpXtu8pN8
	 WsM63Xwvl8TSN4ns6RJc075MBAsmuritZbX42d+cWOkSjXidqcNfOmjaqfGr4ki9VmR+P
	 0PChaKa7mwUBzlvN8hvJTkInSj2Q7S1H64UTR9ivI2uNFDl/xMPQaRCO3Gz49lRgCGYiO
	 /IL10MC0iM2JZKKTlxFhoxpDhcGP6y4F95NAa+t9sg276X6B/84O0ZS2BwN/jFGLjlh9X
	 ZwI9G5d1n/4NBRwpxyHHsdGW9PnU5pwyRCZ6ItlJKN2l7b1Ua02dOIRBvKiL1LMzdQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UY2ho6jA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2E2606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UY2ho6jA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C31A1F031E4
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793041679;
	bh=urfO6D4hqsaWObIrpF6xBqN7wc2zXiiEIXZMlS0+D0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UY2ho6jArPqIFaWq+Nzej3FIZZMDU+HH3zUAv5RWoTZJFF26qENwlX/PuSzeave9B
	 up8sNePlt/i79wnID0Z/QzG6yOp22f8t2E8ojlYTLzLcdvr7CpUlNjlIVBpKtqKliR
	 f6xADGHY9N43BI2fSnDjZC6UuGKYf+ZBeTykk9+zwmk1kaVMvCuVi6fI2WbKuD2y3m
	 PZ01ROgqxUWWOgz3acwz09J7CWAKdmIs9IhIMlDBIxHYoOVIDgL9OqyUhOKbMtWXAt
	 1O6MY7L4QAYAI4Z1EBBQA52A7u5aLR3P/7ZVDxz08JM6067J766dpceYp7Zfopvhun
	 h0Z3AENqJiBLw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be47aa555cso3843315e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:07:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwg92ncDDsJi2jIN8w/nUbutMwSYbzLtu6P/TgnOKRxebdAyIq6WMOgdHEcU/ZZPTCQhrvmPXJlz0qMMP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI46H2v00M2am4H2F732SJQPsHqviu4oUlFegRs3PV8VQJZOszM
	5r/iWPdHv/8YMHcA0Hfbx/iaVzty9EmxHHr3HkucwDiuYSKonAztpruYUU7F/hYY8Qv4ue33eO1
	2ati0t55b/v2Mo3v+9Y6Iwu21R7RusUU=
X-Received: by 2002:a05:6512:3d91:b0:5bf:c4d2:b074 with SMTP id
 2adb3069b0e04-5bfc4d2b178mr465139e87.55.1793041677961; Mon, 26 Oct 2026
 12:07:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014200127.1363472-1-sashal@kernel.org> <20261014200127.1363472-4-sashal@kernel.org>
In-Reply-To: <20261014200127.1363472-4-sashal@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 26 Oct 2026 20:07:44 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hN1xj6wnf53QAD_OZxJHyy3DNAXeMWBnVrTZ4xcBBG5A@mail.gmail.com>
X-Gm-Features: AclHuK8f4uksRxlVflTjoQx-AJmosU8fA-9vAMQQLIJZ0eA6F1YTlLjjzwLCkvw
Message-ID: <CAJZ5v0hN1xj6wnf53QAD_OZxJHyy3DNAXeMWBnVrTZ4xcBBG5A@mail.gmail.com>
Subject: Re: [PATCH 3/5] selftests/thermal: allow cross builds of the Intel tests
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:01=E2=80=AFPM Sasha Levin <sashal@kernel.org> wr=
ote:
>
> The power_floor and workload_hint Makefiles build nothing when
> CROSS_COMPILE is set, even for an x86 target, and they include lib.mk
> only on x86. Other architectures therefore have no install or
> emit_tests rules for these suites, and their installation fails with a
> missing target.
>
> Select the x86 tests from the target ARCH when it is given and from the
> host's SUBARCH otherwise, and include lib.mk unconditionally so that the
> suites install and emit an empty runlist on other architectures. Use a
> private ARCH_PROCESSED instead of the ARCH override added by
> commit 5a1292137e89 ("selftests: fix ARCH normalization to handle
> command-line argument"): the override changed the value lib.mk uses to
> pick the clang target, whereas leaving ARCH unset lets lib.mk use the
> compiler's native triple. A command-line ARCH such as x86_64 is still
> normalized for the selection, while an ARCH spelling that lib.mk does
> not know, such as i686 with LLVM=3D1, is rejected as in other selftests.
>
> Fixes: 27801542b2b8 ("selftests/thermel/intel: Add test to read workload =
hint")
> Fixes: d4d27e5a1a88 ("selftests/thermel/intel: Add test to read power flo=
or status")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  .../selftests/thermal/intel/power_floor/Makefile     | 12 +++++-------
>  .../selftests/thermal/intel/workload_hint/Makefile   | 12 +++++-------
>  2 files changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/tools/testing/selftests/thermal/intel/power_floor/Makefile b=
/tools/testing/selftests/thermal/intel/power_floor/Makefile
> index 07463c2160e09..16d26eab55652 100644
> --- a/tools/testing/selftests/thermal/intel/power_floor/Makefile
> +++ b/tools/testing/selftests/thermal/intel/power_floor/Makefile
> @@ -1,12 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0
> -ifndef CROSS_COMPILE
> -ARCH ?=3D $(shell uname -m 2>/dev/null || echo not)
> -override ARCH :=3D $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64=
/x86/)
> +top_srcdir =3D ../../../../../..
> +include $(top_srcdir)/scripts/subarch.include
> +ARCH_PROCESSED :=3D $(shell echo $(or $(ARCH),$(SUBARCH)) | sed -e s/i.8=
6/x86/ -e s/x86_64/x86/)
>
> -ifeq ($(ARCH),x86)
> +ifeq ($(ARCH_PROCESSED),x86)
>  TEST_GEN_PROGS :=3D power_floor_test
> +endif
>
>  include ../../../lib.mk
> -
> -endif
> -endif
> diff --git a/tools/testing/selftests/thermal/intel/workload_hint/Makefile=
 b/tools/testing/selftests/thermal/intel/workload_hint/Makefile
> index 49e3bc2b20f9d..e53d6ecd9f8de 100644
> --- a/tools/testing/selftests/thermal/intel/workload_hint/Makefile
> +++ b/tools/testing/selftests/thermal/intel/workload_hint/Makefile
> @@ -1,12 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0
> -ifndef CROSS_COMPILE
> -ARCH ?=3D $(shell uname -m 2>/dev/null || echo not)
> -override ARCH :=3D $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64=
/x86/)
> +top_srcdir =3D ../../../../../..
> +include $(top_srcdir)/scripts/subarch.include
> +ARCH_PROCESSED :=3D $(shell echo $(or $(ARCH),$(SUBARCH)) | sed -e s/i.8=
6/x86/ -e s/x86_64/x86/)
>
> -ifeq ($(ARCH),x86)
> +ifeq ($(ARCH_PROCESSED),x86)
>  TEST_GEN_PROGS :=3D workload_hint_test
> +endif
>
>  include ../../../lib.mk
> -
> -endif
> -endif
> --

Applied as 7.4-rc material, thanks!
