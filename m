Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4819725B09E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131950; cv=pass; b=aGfYTCWuS15Ae6v4yZZE9hpbOwsp2uZvqU/JPQEwqjPqKg4b+lLqr3BEWk4CYd7TMtEcdDjiK/48cxcHvPw800PhzkTYvFy/2p3+HLxoFoi1QJF9sh2Z5lf5PBh/Go76QwsaFJ7Ipc56OUvMs+XSuMy9hCW/WMgFlWJX3jq0wMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131950; c=relaxed/simple;
	bh=mFA9Q2FmqawUFaWLuwiXo5/4OEiBaFAX67xYIrf45uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFm/6nT8oDKK0+BviuOyh/Af3WkIYC5muErJsa9KvlkawIjWHWn8YLATmvYraHivDaMYSSCJZu2nbciQaOw+j/fbpTn4182Ba5p4JJkZYgs3FyC+YkqlThllSvoS20qhgKj86xzF3lm6fEXaGa2f5MuAQ9MPN5rCIfOkJUOON7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfsbqNvS; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfsbqNvS"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso1911790a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792131946; cv=none;
        d=google.com; s=arc-20260327;
        b=VOSyYEnQ3d+N5I2nKgdmtZ0mT5Bmi0QlT7LSAmyvIga29cR4PvLnFz6mVcfJudRz1w
         QqaHQy/XYK4CbYHv3BrM0IEJ6XzHUKn7RMX9WD6uZhS5wKa4829Eyu8ofZmr56Qbn1dm
         uu6QIi1ahxZ0OFmIt5+gV8yrY0yWZtXx/qsY1KFb1E0Wkd6IzrScY3HeOIO5HbCs/CPl
         IHqosZcDcP0WuVRugQKD2mEnV+8xprsj0Nqbtpw0NcAtuNjzo4XZWDrOKrtpwa9CgEJz
         jvLh6zeomcDUOKfv9MXjkVDjujO6OZCpR1fMyp/DBab5tIhw1fY7QZhevBtLYprPy/8l
         Yv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYkBVAxBwxemaXNK/O+MVQ6M8BBzDgxhjefXexxmn+8=;
        fh=sUsT339MDFkMRlqIa8F+t6Ts9WE76S+6nE/VmbT3t9M=;
        b=owUZjsZC/arQ0YOFzNLaeAW6yeG6c2CB4BI64BddD3f5AvFVZ1JhVG9Q+lUxrXdIA0
         y47+SpAjab7Ptz2zCFu8zJruyjqtE8JQ2pNR02qAaaSc69stMtiHFmxuvFKTwqaayjvK
         pOJ6uGoYQcTyTWOG2sWaxIFNb9hjQ2PF9QuQ7G2WzpqKs5PNOioG7Vscd1MeKB8vt4N0
         tXJMbt4HWCSXLWli11j56gbtqn9TqMF3AjI7HNu3Rygw/vWHrIj+ZBkDGndqyHiRP2d1
         MMzqxg/ywixv1dUvbGbiKKqFbF1U4ex3k1DR/aPQYlxaJ/bDiqhBXRqCWXDak921tx82
         ETJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131946; x=1792736746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYkBVAxBwxemaXNK/O+MVQ6M8BBzDgxhjefXexxmn+8=;
        b=FfsbqNvSCQMmXmnw8FvNDm2OTWI+iG062ibcGc8y5XFYilneV0l/ouU4gT769hklFL
         V4oMp7GkCQJNquxNE8i20fUf8DF+oG3T0jiheKaq8kJ3rnpLEy78OHX9xI97DY43ndZG
         w8mA5B9torIBLKgRYLbFNS8IuWFffVFEzP52FLeZXuUCwnmBkq9d8F6oPsLFxlkWRmRm
         3qDrQUwvMi6xMTA79ZYf4K692pRCG1/qCgu7gjA8aQYGlyZzS0aSmul1wQer075nTepa
         cdA0IdVLSVY31cf5EAchaKtYL/kDrVoiyWMNo6FsSLXQ2pub9zC0C2QVCQlwYYrYoOW4
         smfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131946; x=1792736746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYkBVAxBwxemaXNK/O+MVQ6M8BBzDgxhjefXexxmn+8=;
        b=ycypLLhKZsC3KhZpOplRuwRMcvcP1tQxwFCTckhaJcBbBv56YxjZ2R1p/KmuS1F7B6
         3w2QgBk8BKJUO+wfGT/FmLtEiayIEe7m7NrJXiScGf5b/lg0pR22jatwqjSJoOTDfkup
         IVIq8qSw0BO+kWNE5/09CcLwhLr2m/tjyTj9TZCVVACO9db9uXwKtFSnBvgMsOeIOfTs
         E4/lyntUO2p06JnZ2bwFJx+3kTOBi3IqTY35GPM6eXTJ6efpez1pFbLopZMKITfLK+cO
         HLwjAhJof+ouvOM9UPb7AsfTTyf8ZJD8kWfwehhQLnaLak37hISjzbHfrBH2cvvcXfS6
         on8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQRXyczI8ddGFqoDBRwxozEMqBn4OQJ6SKdcq9pW0L0KZP1EwB1FP6K9/FufRhq6PLs16J2dfAdj+bAZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPlBCeJ03RMjPWjyeYm7JQiE/MQaUEXzmGD0+QVDFGvFrrqO5Y
	7fmWEstiBkTDE40UDQvhjcWCGyxmfHMhdBbtCtrjhmkTpCd51rxTpb327sx1dWdMxj5OX4rX+3c
	Z7y8LFX7LHeTkLPgsJwg30s3RAucc4Ts=
X-Gm-Gg: AYBFou3q7H/FZeGcftES/t/08UKJAurA9lzkrDQFHCxqFBlQVw9esLosgwVD9Jvf7wS
	KD2V/RlTmgvEqo+puK0UjW/Em2JFGdjYcvTJv56hq+KrDbw5jYmjRslWi3nAHD+k7EarPfAABuO
	IlcYQjbPVeQJXxh2NDsRgORjBk0G3qu8fg1ayvkjg9hN72H2nczLKh5l4GodB9Td3JUxRJr0YD4
	RR/aCNN+SqCJkd/S22ELH+ntwJ+5sxK8NVO54YBtJCkNtfSneQD3HR9olk4VwQHVOb7vmtYcVRC
	ww0gzUXUlZkOs+p5o29wwwFlltYkdk/J3TvHMMGxN9lgMraAqkovVMZOos/ztKutek97/RvKPha
	6d5vacAw5N+HVsiAoJEtmy6M2vAbW0TN8mX1qovWL8uHCxriE
X-Received: by 2002:a05:6402:4554:b0:6b1:ced2:dfd4 with SMTP id
 4fb4d7f45d1cf-6b1ced2e477mr7532991a12.21.1792131946100; Thu, 15 Oct 2026
 23:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015135752.17028-1-vngocvan@gmail.com> <20261016012148.GD3329673@ax162>
 <CAJavoFk+zgySyNps5tuKmntmvuAyev=kKL640TFrfCc-njeWBw@mail.gmail.com>
In-Reply-To: <CAJavoFk+zgySyNps5tuKmntmvuAyev=kKL640TFrfCc-njeWBw@mail.gmail.com>
From: Van Vo <vngocvan@gmail.com>
Date: Fri, 16 Oct 2026 13:25:33 +0700
X-Gm-Features: AclHuK9hFvot4yht4VqK2mVl9LZdXL_L1i4Fwbnceb4ZXgxpDMQaKbSEhgkboxA
Message-ID: <CAJavoFkpO29P_oD_YLBkkp6_k080mN-ctRPXSvB+oj_-vpcR0w@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: honor the build directory for modules
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, masahiroy@kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

> How was this discovered?

This came from code inspection of standalone use of -d with an explicit
modules.order argument, followed initially by a constructed reproducer.
It was not a failure encountered through Kbuild's compile_commands.json
target.

I have now reproduced it using real Kbuild-generated artifacts from
0fcb05b72344f40806cbe810de8872f1698bf053 on Linux/aarch64, with Python
3.11.13 and GCC 12.2.0. This was a partial lib/ build with CONFIG_TEST_LKM=
=3Dm.

The following uses a disposable source tree at that base. The guards
prevent overwriting an existing output directory or result file:

    (
        set -eu
        test ! -e out
        test ! -e outside.json
        test ! -e inside.json
        make O=3Dout -j1 allnoconfig
        bash scripts/config --file out/.config --enable MODULES \
            --enable RUNTIME_TESTING_MENU --module TEST_LKM
        make O=3Dout -j1 olddefconfig
        make O=3Dout -j1 V=3D1 lib/

        outside_exit=3D0
        python3 -B scripts/clang-tools/gen_compile_commands.py -a ar \
            -d out -o outside.json out/lib/modules.order ||
            outside_exit=3D$?
        printf 'outside_exit=3D%s\n' "$outside_exit"

        inside_exit=3D0
        (cd out &&
         python3 -B ../scripts/clang-tools/gen_compile_commands.py -a ar \
             -o ../inside.json lib/modules.order) ||
            inside_exit=3D$?
        printf 'inside_exit=3D%s\n' "$inside_exit"
        test "$outside_exit" -eq 1
        test "$inside_exit" -eq 0
        python3 -c \
            'import json; assert len(json.load(open("inside.json"))) =3D=3D=
 1'
    )

Kbuild generated lib/test_module.o, lib/test_module.mod,
lib/.test_module.o.cmd and lib/modules.order under out/. Both .mod and
modules.order contain lib/test_module.o.

The old script's invocation from the source directory fails with:

    FileNotFoundError: [Errno 2] No such file or directory:
'lib/test_module.mod'
    outside_exit=3D1

The same artifacts work when the old script is invoked from out/:

    inside_exit=3D0

The successful invocation produces one JSON entry for lib/test_module.c.
The patched script succeeds from the source directory and produces an
identical entry. The old script also fails with absolute paths for -d
and modules.order; the patched script succeeds with those paths too.

Only the standalone generator invocation is outside the build directory;
compilation itself runs under out/. This is not a full kernel build or
a boot/runtime test.

> I think you can omit the final sentence here, it does not add much value
> in my opinion.

I'll drop that sentence and clarify the standalone scope in v2.

> Please fix your name, this needs to be a known identity.

I'll use V=C3=B5 Ng=E1=BB=8Dc V=C4=83n for the author and sign-off in v2.

> os.path -> pathlib.Path but it should definitely be done as a separate
> patch.

I'll keep the pathlib conversion as a separate follow-up patch.

Thanks,
V=C3=B5 Ng=E1=BB=8Dc V=C4=83n

On Fri, Oct 16, 2026 at 10:53=E2=80=AFAM Van Vo <vngocvan@gmail.com> wrote:
>
> Hi Nathan,
>
> > How was this discovered?
>
> This came from code inspection of standalone use of -d with an explicit
> modules.order argument, followed initially by a constructed reproducer.
> It was not a failure encountered through Kbuild's compile_commands.json
> target.
>
> I have now reproduced it using real Kbuild-generated artifacts from
> 0fcb05b72344f40806cbe810de8872f1698bf053 on Linux/aarch64, with Python
> 3.11.13 and GCC 12.2.0. This was a partial lib/ build with CONFIG_TEST_LK=
M=3Dm.
>
> The following uses a disposable source tree at that base. The guards
> prevent overwriting an existing output directory or result file:
>
>     (
>         set -eu
>         test ! -e out
>         test ! -e outside.json
>         test ! -e inside.json
>         make O=3Dout -j1 allnoconfig
>         bash scripts/config --file out/.config --enable MODULES \
>             --enable RUNTIME_TESTING_MENU --module TEST_LKM
>         make O=3Dout -j1 olddefconfig
>         make O=3Dout -j1 V=3D1 lib/
>
>         outside_exit=3D0
>         python3 -B scripts/clang-tools/gen_compile_commands.py -a ar \
>             -d out -o outside.json out/lib/modules.order ||
>             outside_exit=3D$?
>         printf 'outside_exit=3D%s\n' "$outside_exit"
>
>         inside_exit=3D0
>         (cd out &&
>          python3 -B ../scripts/clang-tools/gen_compile_commands.py -a ar =
\
>              -o ../inside.json lib/modules.order) ||
>             inside_exit=3D$?
>         printf 'inside_exit=3D%s\n' "$inside_exit"
>         test "$outside_exit" -eq 1
>         test "$inside_exit" -eq 0
>         python3 -c \
>             'import json; assert len(json.load(open("inside.json"))) =3D=
=3D 1'
>     )
>
> Kbuild generated lib/test_module.o, lib/test_module.mod,
> lib/.test_module.o.cmd and lib/modules.order under out/. Both .mod and
> modules.order contain lib/test_module.o.
>
> The old script's invocation from the source directory fails with:
>
>     FileNotFoundError: [Errno 2] No such file or directory: 'lib/test_mod=
ule.mod'
>     outside_exit=3D1
>
> The same artifacts work when the old script is invoked from out/:
>
>     inside_exit=3D0
>
> The successful invocation produces one JSON entry for lib/test_module.c.
> The patched script succeeds from the source directory and produces an
> identical entry. The old script also fails with absolute paths for -d
> and modules.order; the patched script succeeds with those paths too.
>
> Only the standalone generator invocation is outside the build directory;
> compilation itself runs under out/. This is not a full kernel build or
> a boot/runtime test.
>
> > I think you can omit the final sentence here, it does not add much valu=
e
> > in my opinion.
>
> I'll drop that sentence and clarify the standalone scope in v2.
>
> > Please fix your name, this needs to be a known identity.
>
> I'll use V=C3=B5 Ng=E1=BB=8Dc V=C4=83n for the author and sign-off in v2.
>
> > os.path -> pathlib.Path but it should definitely be done as a separate
> > patch.
>
> I'll keep the pathlib conversion as a separate follow-up patch.
>
> Thanks,
> V=C3=B5 Ng=E1=BB=8Dc V=C4=83n
>
>
> On Fri, Oct 16, 2026 at 8:21=E2=80=AFAM Nathan Chancellor <nathan@kernel.=
org> wrote:
>>
>> Hi,
>>
>> On Thu, Oct 15, 2026 at 08:57:52PM +0700, vngocvan wrote:
>> > When invoked from outside the build tree with -d and a modules.order
>> > argument, the script opens .mod files relative to the current director=
y
>> > instead of the specified build directory. This can fail with
>> > FileNotFoundError or collect commands from unrelated artifacts in the
>> > current directory.
>>
>> How was this discovered? This cannot happen within Kbuild because this
>> script is always invoked from within the build folder, so was it a
>> manual invocation or something else?
>>
>> > Pass the build directory to cmdfiles_for_modorder() and resolve both
>> > the .mod files and their associated .cmd files relative to it. Absolut=
e
>> > paths continue to work, and the output location is unchanged.
>>
>> I think you can omit the final sentence here, it does not add much value
>> in my opinion.
>>
>> > Fixes: ecca4fea1ede ("gen_compile_commands: support *.o, *.a, modules.=
order in positional argument")
>> > Signed-off-by: vngocvan <vngocvan@gmail.com>
>>
>> Please fix your name, this needs to be a known identity.
>>
>> > ---
>> >  scripts/clang-tools/gen_compile_commands.py | 9 +++++----
>> >  1 file changed, 5 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/cla=
ng-tools/gen_compile_commands.py
>> > index 8d14b81efd73..149135f85f19 100755
>> > --- a/scripts/clang-tools/gen_compile_commands.py
>> > +++ b/scripts/clang-tools/gen_compile_commands.py
>> > @@ -124,7 +124,7 @@ def cmdfiles_for_a(archive, ar):
>> >          yield to_cmdfile(obj)
>> >
>> >
>> > -def cmdfiles_for_modorder(modorder):
>> > +def cmdfiles_for_modorder(modorder, root_directory):
>> >      """Generate the iterator of .cmd files associated with the module=
s.order.
>> >
>> >      Parse the given modules.order, and yield every .cmd file used to =
build the
>> > @@ -132,6 +132,7 @@ def cmdfiles_for_modorder(modorder):
>> >
>> >      Args:
>> >          modorder: The modules.order file to parse
>> > +        root_directory: The directory where the objects were built
>> >
>> >      Yields:
>> >          The path to every .cmd file found
>> > @@ -142,11 +143,11 @@ def cmdfiles_for_modorder(modorder):
>> >              base, ext =3D os.path.splitext(obj)
>> >              if ext !=3D '.o':
>> >                  sys.exit('{}: module path must end with .o'.format(ob=
j))
>> > -            mod =3D base + '.mod'
>> > +            mod =3D os.path.join(root_directory, base + '.mod')
>> >              # Read from *.mod, to get a list of objects that compose =
the module.
>> >              with open(mod) as m:
>> >                  for mod_line in m:
>> > -                    yield to_cmdfile(mod_line.rstrip())
>> > +                    yield os.path.join(root_directory, to_cmdfile(mod=
_line.rstrip()))
>> >
>> >
>> >  def process_line(root_directory, command_prefix, file_path):
>> > @@ -206,7 +207,7 @@ def main():
>> >          elif path.endswith('.a'):
>> >              cmdfiles =3D cmdfiles_for_a(path, ar)
>> >          elif path.endswith('modules.order'):
>> > -            cmdfiles =3D cmdfiles_for_modorder(path)
>> > +            cmdfiles =3D cmdfiles_for_modorder(path, directory)
>> >          else:
>> >              sys.exit('{}: unknown file type'.format(path))
>> >
>> >
>> > base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
>> > --
>> > 2.56.0
>> >
>>
>> --
>> Cheers,
>> Nathan
