Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD51E5540B6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791925670; cv=pass; b=c8z/UFm9vtFBYykQDEG8lDA/tTPgueWCCIswlIK84fdx8XcDWazUhHQc5hRpyreNIB9AEzQ33JRr9hS09xsxaNi8NDZWI1WQY8aAMgYVpZVMVEdume/da/RBKunpm85z7iTegqAy29llxZToclFjmSoPjyzzAeO/UlwkzA+9AOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791925670; c=relaxed/simple;
	bh=DqDEbYEh/GJ2vJ0RGLy9Z6paqTuoI8W26g9AmRu7lXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8OERM2dN1kWE68bSLJPshg216m+UXw6NqoyxNIeeKunlsI/xI4bxJ3ZD7mkyEoFq4ZakDiYl2zfUtHznvuzHptW7Z3e9Xwcm95Fn3YUVp+xAHNntOOUQvFDZ/OsHHOr1DeHcLW7rzUAHE6hKbpusjR0mb9dZ605w2KrPHBZwN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L5aPoAAD; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L5aPoAAD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1af482519so8679875e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791925662; cv=none;
        d=google.com; s=arc-20260327;
        b=ZcspjDjCUylYCHgZ88dOXoSbbuozUM0X9aZ6c51EdJxGgYIRfFA7Sa7ykEkIMyzkj2
         NMA01BeKqN3Z8FSqtuXbqxUwyNhersg21KclkLb20JJPXZU4mzztaOHLgjkpDMSFYkZW
         tsWm9duI2rEyppkLxiA4Qy99NOLkvWwQlDFtKyq3DS3s2epcVVcjD61i8EJbKAaBNJQm
         DJXYk+stYbkPLGV/9ty6dOXNkktKxSyyRfVrnw+OSC178t5KYVUyH6QB4H4OhuEb+Vpk
         32ZCEBrIYPKXEabICqswyFk5Q60stu4AQPjZJUiNvrjpDdlwLeKvmPxEvisu7VFztGVk
         L4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GdU3BV11kOoBnWVHLMCH++e866lXi7j3hvDE5o3xs5M=;
        fh=9hMM8okPdijjWjZO4I9iIVpukColn9Z2/o4IVnEKnOs=;
        b=Q6U8bHAN0QawzmthE4+epg7MEL6GxUh11mklEWWjJeeVR+MJZtwmDhNfYSbk5i/EH/
         QnwvGEON3/+Z/rViqrwKIkV4/SYrZIUr9OacawsqRRRyYJNDUnMXTvop5x/RQuO6h3Eq
         F9rDobqxitCe25BDciB3ZTf+rW9N2io4JivuDmQa/t/kpE4qGBMxloaUGz+qLks6Zdgw
         YPQCwQKdls/2CiW0l933Vsa7gOIRUyyTFYe6FJbS/qzNLhLFjTVsgALFpcOewitgVTfJ
         7eECk0i8M/+MhgRMrnCkEWPF054q4BgyeYILPI+PghllmZtZIGObRI1t/uhn8SzS+4Ur
         KpzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791925662; x=1792530462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GdU3BV11kOoBnWVHLMCH++e866lXi7j3hvDE5o3xs5M=;
        b=L5aPoAAD+NNDVx6W09G10m3WAuR3G3sCX8BqPX+J1bnvovjGj09mqmXXPQ+4YriBX9
         X4n+P0FUOkbJsZCBrNIP/7a4St1ZPIt9iEhkTLZWjtQN6xK/Ad1v2pLxg1AdvuuOHEDd
         /zxkU4OPz1cClI5fk3UxKO2ewyWNwqLvJoNuuVQ5NcAzTH0ci2TyymoV9SdcJgJuKQII
         fDRCdX9KVOEI3Hc9HJgHNn7RQYRwMQDmADo2AjOy4LkZOoKw85TGBdwC5IIeorTr2ghk
         a8N+kNN7M4S0ZrDMMDPz83ql/N7Ji3i3aWEf7WZyD/HkLVZSwNC2bNFxU6UJDkAf6vfv
         pxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791925662; x=1792530462;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdU3BV11kOoBnWVHLMCH++e866lXi7j3hvDE5o3xs5M=;
        b=qgYFohtt+9+r8aSRHhW6emmombrSmm+UXCwgcU9hRIRnAbjOw4UV1fiM6rUmpLvsRv
         f5FvMjjrP3O7GpV5drbCcA2Jq5UdxWkL4rpgboyxdVunDrruDT6ktXxO+IVoBwe5t+j1
         W2AUdhfTWcXk4JzFJ36ktcvi9w0ByAZ9/SLJiJET59lbNQXaT0LNwKmQi/IwdxU6mqUM
         4CPOV22/Dn3Kw+z8sBVrqlypmon5oT861GLtKCshSZfX2a629zvz62+33O+8U7im6Sd6
         h6j+43IhRHO0hdJTUlEIMW7f8CacOib9a8ojLFg53YsjzEDMY/u18vY5eu2g8dHlLyts
         tVAQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2/j8L6KGJPSZQ6m6erKXHTVna3OvQP5mOteEyminAqwv6jXHttLY4IhAsKzFLKjtvqD2EL2DW62DnZbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOFzYsWJxS3Z/C4IGxNdGwL1wS9kQ8Iy4ine3ShMM8JXwfqYYc
	CYoby2FDBHTe8lGRZ0nvS+ioo3y367AKmjIr6ZOxniCsD9Y+nd8BGaDZEgrw+v12tMl70PrZBDk
	gF/C/9rNaq9B+1wJL/e2S8xkmKwXeNgdPks1v+4ygxMWuhim8SbpR5tug
X-Gm-Gg: AYBFou0wZiqfzaIDGIGPB1nBtXSbzlfWNfIpR0lFvNDBr//DIkDHL8YGClq8Y22HkuB
	nLJKzr2kz4vGMqrfZeRXAY41I/zWJbipGEWuBDx4zqSptJ/0B90R4frIYh82TI84be+VXAstcKj
	GtKBzgjfZ4dOtpIUjEmJ5ocqgNK3UAxZFWzS84oxT77dWui7ynLKGng3YH/vj9PrW7OFOFCJ5MD
	POKYoPeJP3qzjAsfxF8lqC3rY83o79q/9oY+fh5m4Lr4KDZekC6ICtJEjR4Jfw3D/ZX+1rcYCFG
	x4wScWcM6hvDdIWC0gkD5qsO687BnefI7UHKF8WDekRdnuZmgKHfSyJhQx51NfG6ldenYj+7cps
	A5IASAkGa8T/lneU0R3vE5seTdR2mUp/KKBzcO4KyM7EcxlRj8aiPYikLL1aA6fPlPKy1T4KP6j
	QJu1jXqhhA0PhLvhbRlb2NStXJxaBa/orkcTZqdP3zbk+GoW2QrzrN
X-Received: by 2002:a05:600c:a40a:b0:4a1:8eb4:46e2 with SMTP id
 5b1f17b1804b1-4a18eb4483bmr286389355e9.2.1791925660275; Tue, 13 Oct 2026
 14:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
In-Reply-To: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 13 Oct 2026 14:07:28 -0700
X-Gm-Features: AclHuK-BheBwPa0wu_bGJfIf0QRgUTJ9CBEgZWAxAmPkomjPVar_Q74zd4MM7Cw
Message-ID: <CAKwvOdmQkYy3xqTsumSxLdHpaXnt1Hb9g++DVmAYcx=cvjFBeg@mail.gmail.com>
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
To: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:40=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> The kselftest_deps.sh script currently takes a compiler as the first
> argument and uses it to check that libraries needed by the selftests
> are installed.  This works well for GCC where a separate binary is
> provided for each target architecture but is less of a good fit for
> LLVM where a single compiler binary can target all of the supported
> architetures.  Extend the script to accept "LLVM" as the compiler with
> an additional optional ARCH=3D argument so that it can be used when
> building with LLVM in a similar fashion to how the actual build works.
>
> The duplication with the main Makefile isn't ideal here.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/kselftest_deps.sh | 83 +++++++++++++++++++++++++=
++++--
>  1 file changed, 80 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/kselftest_deps.sh b/tools/testing/se=
lftests/kselftest_deps.sh
> index 487e49fdf2a6..70b834361cb7 100755
> --- a/tools/testing/selftests/kselftest_deps.sh
> +++ b/tools/testing/selftests/kselftest_deps.sh
> @@ -10,13 +10,20 @@
>  usage()
>  {
>
> -echo -e "Usage: $0 -[p] <compiler> [test_name]\n"
> +echo -e "Usage: $0 -[p] <compiler> [ARCH=3D<arch>] [test_name]\n"
>  echo -e "\tkselftest_deps.sh [-p] gcc"
>  echo -e "\tkselftest_deps.sh [-p] gcc mm"
>  echo -e "\tkselftest_deps.sh [-p] aarch64-linux-gnu-gcc"
> -echo -e "\tkselftest_deps.sh [-p] aarch64-linux-gnu-gcc mm\n"
> +echo -e "\tkselftest_deps.sh [-p] aarch64-linux-gnu-gcc mm"
> +echo -e "\tkselftest_deps.sh [-p] LLVM"
> +echo -e "\tkselftest_deps.sh [-p] LLVM ARCH=3Darm64 mm\n"
>  echo "- Should be run in selftests directory in the kernel repo."
>  echo "- Checks if Kselftests can be built/cross-built on a system."
> +echo "- Compiler can be given as LLVM to use clang, as with LLVM=3D1 in"
> +echo "  the kselftest build. LLVM=3D<prefix>/ and LLVM=3D-<suffix> selec=
t"
> +echo "  the clang binary as in the kselftest build. ARCH=3D<arch> select=
s"
> +echo "  the clang target architecture, defaulting to the host; it is"
> +echo "  ignored for other compilers."
>  echo "- Parses all test/sub-test Makefile to find library dependencies."
>  echo "- Runs compile test on a trivial C file with LDLIBS specified"
>  echo "  in the test Makefiles to identify missing library dependencies."
> @@ -53,13 +60,32 @@ while getopts "p" arg; do
>         esac
>  done
>
> +# Pull an optional ARCH=3D<arch> out of the remaining arguments. The
> +# environment is used if it is not given on the command line, as with
> +# make.
> +args=3D()
> +for arg in "$@"; do
> +       case "$arg" in
> +               ARCH=3D*)
> +               ARCH=3D${arg#ARCH=3D};;
> +               *)
> +               args+=3D("$arg");;
> +       esac
> +done
> +set -- "${args[@]}"
> +
>  if [ $# -eq 0 ]
>  then
>         usage
>  fi
>
>  # Compiler
> -CC=3D$1
> +case "$1" in
> +       LLVM|LLVM=3D*)
> +       setup_llvm "${1#LLVM}";;
> +       *)
> +       CC=3D$1;;
> +esac
>
>  tmp_file=3D$(mktemp).c
>  trap "rm -f $tmp_file.o $tmp_file $tmp_file.bin" EXIT
> @@ -178,6 +204,56 @@ exit $?
>  }
>  # end main()
>
> +# Mirror the LLVM handling in lib.mk: LLVM=3D<prefix>/ or LLVM=3D-<suffi=
x>
> +# select the clang binary, and ARCH selects the target triple with the
> +# host as the default.
> +setup_llvm()
> +{
> +       local llvm=3D${1#=3D}
> +       local llvm_prefix=3D""
> +       local llvm_suffix=3D""
> +       local clang
> +       local target
> +
> +       declare -A clang_target
> +       clang_target[arm]=3Darm-linux-gnueabi
> +       clang_target[arm64]=3Daarch64-linux-gnu
> +       clang_target[hexagon]=3Dhexagon-linux-musl
> +       clang_target[i386]=3Di386-linux-gnu
> +       clang_target[m68k]=3Dm68k-linux-gnu
> +       clang_target[mips]=3Dmipsel-linux-gnu
> +       clang_target[powerpc]=3Dpowerpc64le-linux-gnu
> +       clang_target[riscv]=3Driscv64-linux-gnu
> +       clang_target[s390]=3Ds390x-linux-gnu
> +       clang_target[x86]=3Dx86_64-linux-gnu

^ should this be either i386-linux-gnu or i686-linux-gnu, or does
`-m32` get set somewhere?

> +       clang_target[x86_64]=3Dx86_64-linux-gnu
> +
> +       case "$llvm" in
> +               */)
> +               llvm_prefix=3D$llvm;;
> +               -*)
> +               llvm_suffix=3D$llvm;;
> +       esac
> +       clang=3D${llvm_prefix}clang${llvm_suffix}
> +
> +       if [ -z "$ARCH" ]; then
> +               target=3D$($clang -print-target-triple 2>/dev/null)
> +               if [ -z "$target" ]; then
> +                       echo -e "\tUnable to run $clang ..."
> +                       exit 1
> +               fi
> +       else
> +               target=3D${clang_target[$ARCH]}
> +               if [ -z "$target" ]; then
> +                       echo -e "\tUnknown ARCH $ARCH for LLVM, supported=
:"
> +                       echo -e "\t$(echo "${!clang_target[*]}" | xargs -=
n1 | sort | xargs)"
> +                       exit 1
> +               fi
> +       fi
> +
> +       CC=3D"$clang --target=3D$target -fintegrated-as"
> +}
> +
>  all_tests()
>  {
>         for test in $l1_tests; do
> @@ -285,6 +361,7 @@ print_results()
>  {
>         echo -e "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D";
>         echo -e "Kselftest Dependency Check for [$0 $1 $2] results..."
> +       echo -e "Compiler: $CC"
>
>         if [ $print_targets -ne 0 ]
>         then
>
> ---
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm =
master
> change-id: 20261013-kselftest-deps-llvm-51be8d160008
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>


--=20
Thanks,
~Nick Desaulniers
