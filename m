Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D457C3E3D9F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078414; cv=pass; b=Hzc3lK9Otebxctk0e6YuwEk60FvKBrJj6FxpbQMj2E+4A4EywT79zTOvSoyd2MvGp8YfPoDimOKFJR5d5dsheIT+oUXPNP+OEfcmqlOIZBKDycx69WuxN1jPgR+UTGJ09ZMax0HRgAXwIqw/ybKFXVCHP5rmZLZp1mxETz1b064=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078414; c=relaxed/simple;
	bh=EwFBEjpzx+AogMUYstrZjzWsEBgz1yLeWchGZwFuIWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=av6JrllD3g3OWgGimsO2BbUQ70HdfVSFkd0AjqkbS0DEajUdVwetlz1n5Yj6TuNt4iGWXNPWL8NesKHrEB1GaGrpgnUKuyG0FQf8DvSPIZCAQKuUVoaxTFkao2yagxdDBqIXj/rgKKmc5r62w6z2IMR4+w3e54cPYH0AsT8IAL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HSK65X0L; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HSK65X0L"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso2517653f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792078404; cv=none;
        d=google.com; s=arc-20260327;
        b=ZiVnycK4EYv8vNv92lzmNQzkRpvTprL9QHkuXoriOKom/IGY07Qconi1jyATHY58UO
         38oUgtQPEfkGyq3JzxGNoL7fC2T/H6iUbeI8r0IYt9rtEaR2IL58glTgWef7tVJ4qHnO
         ODmHoSXNmAtvhSC3zNYt9j5rYlR8A3bEa5Wx4XqhJdVWPQh8l4S9jOBBPign5Y6yIUaN
         2NxQDRT/yTShUMPx0060mGVPD5BdaPtLhBxCXJBjU9dqXvF8ALvu0ReNqsY3mKiUgKzb
         NIVZuw5Offfhh4wcXKN/MLaHpPK1nsuG5AnkvY6O1H43ckHoPEJy1c+NaEVpGB9RBgY4
         A84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RnXdeLR8uLxWAp/EGqtkD57zfy4KroVSjFqtijIOcj4=;
        fh=Xh0BArH5aRMphy+E3HSWD6C5fzbPeuuh1eThMrWUo3c=;
        b=pe2zKab/4Gl5Dq0eBgPdXxSrUQBUcuTFw7bt9o0ROpQSqOsC1wzV0qfzPkkWhHTh8s
         wcKzaUtmvZ07sH7jTjiPOnGx8ZNsKrHlmSBJzSOg3uvmc+PtdxwGCHXOTpKaRXacoCJV
         MEXHfKtLZ/O8L8r2G1E0RPqwTip/sUnt1R5tL3exWyl61t47i1rUG69t+QCViVcuIwy6
         yw1GFmUTMcKPDM1wdt671WSBjdipA9RBPZ5Z/jlXfhWOvoS/unMWtNk5c8sc36R0GYxf
         Raeqb/B9e1vILI+dxxw8t/DiYV30HgnqlUYvCLIZzdZnxtSq4gMvfy/5SqXSD0EtzxI6
         zUsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792078404; x=1792683204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RnXdeLR8uLxWAp/EGqtkD57zfy4KroVSjFqtijIOcj4=;
        b=HSK65X0LNqT0Ci4EaY+eB94FWP835oDQI1qBeaSJhuvNeb7VLUKY9UQh5eIEKkJ5pQ
         /e3cbfen3KmKK/cvG2fkQDR1axxCskdahJnk8dAPkTXoNX7bk/iVyr9WT5wtja7BiKIV
         GQBbgCZ5WLIGQTUWTnjhL+rysI+lihafiypvlcab/UQfOSZbRxIYL3k9bsr3z+SJ81B5
         pFGhIt4YcsMGC7wx8CaNNkOtNj9xlXib/5qZDuQMf9K2Ax8dbS9xiFUwkK4xiqSvGeQz
         o8k3GUlINUoYh8XENQ2WTE5l2EimA4TsTvAx5R3GCVGUp/8YkqSRHIdxOVeRBbM0FBkB
         DrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078404; x=1792683204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnXdeLR8uLxWAp/EGqtkD57zfy4KroVSjFqtijIOcj4=;
        b=CHoo3+x2tSphIFoUbYDQhUOocbslmoobQa3aqCcsBohu2huMIAJYp5KsJlQw76h1Rb
         5KIaHfC+2LU1NZphwZ9qT2iF9Pop4RP/2jAEU9v1GE1rSeEI3RhTA7Kr7vX2iNbeY7FL
         qVD/uDKd4qjlzJExJ10KTqEYS4TaAQt4hmkiqkvXy2k1cUD4S2DvCjqOzCTlhEF+kXAx
         92bJJhNu3afz3Vl7ie+5DJWlSLfIh3y+cMxfq9SdVlRdQAtWHlOBSEOJc4hfQtMJvE5V
         pZZyDGYPJI6EV+5QVr1N65NKk0OuTldL0NqzRFZLdvPMZVxjEKyplwnrj+34HQE6ACC8
         jpZg==
X-Forwarded-Encrypted: i=1; AKwUvBzf7+S+uCsY5kjlbxtN4t0brsHOGDa/yLk3DOC8Ks810NlIPiBtgY1TDO6hNQ/vO9DO6T5Q7MJYBkmlvjw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnGoD385Wanh954Gw2q8sXJIGsIdkUBgYpjz/Q4P3tPnpLU4xd
	/Y/Wfmucl5vRWugcNvDdiw8kWT8KApATPsp34+fUbInL62NLPoSGW4dzInx6fUnIiYac5eYnPql
	l8EtUOOLCy1STbskM+XKueBFgjhSgqKHnta24uTKo
X-Gm-Gg: AYBFou2Vbe3buBEzKSa/R3Z0THdzkdzbDwe3MiCkkj8nEUQeDeVMVv7e2L1vDHn/yHI
	dSGfYs/o6FOZcwf/I3B8bd/Rs6yi55e0k/zne2lioKuEQAicBs3XQL7SEMb57TNvDjwXejoEc2h
	sfLl+DksLkYH7SGHfVYCwx7IN3DD1jRVCqF7nU6wxQoTs2Zz53dj3uIXihsTZsGxAdIh2Ia+eUa
	yonY13g3SKhsDGupejbsPLHvHveK76rVsY6g8ZoIgvXQXiTLXkQ2K5oz7xan24Z8whQQkHMKBSv
	olmHS4CCn3x9JB/AtzQTpKXCzUfqXvAJiJMG0FZhJOrZr53TrslcJjsdkOM0iNKd963JkFQ3teq
	geqZfGkJp40T/b+mk/4pBkVm1D+nYwlUkdNN8jEmxgKtneY0sWPy4qG3p4y4X0aPKMPENXohwpZ
	jmjNsBLpPJWS1rGgGZfdT9DTGI0gJ+VYnmW9Cv9xi/rIu1283vu3l5
X-Received: by 2002:a5d:5d0e:0:b0:48b:1147:3d75 with SMTP id
 ffacd0b85a97d-48dbace44ebmr35131681f8f.45.1792078403051; Thu, 15 Oct 2026
 08:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015135752.17028-1-vngocvan@gmail.com>
In-Reply-To: <20261015135752.17028-1-vngocvan@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 15 Oct 2026 08:33:11 -0700
X-Gm-Features: AclHuK9_V3VROI7C5QHxcUZo9gsmpWA-9dqcNZ_FnjWuoNsZd9_ENKv7AbFgjHQ
Message-ID: <CAKwvOdnkS7AnuJkQr=5-TO6eRL+joSNUKGfqK-mbim9_y0NW=A@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: honor the build directory for modules
To: vngocvan <vngocvan@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, morbo@google.com, 
	justinstitt@google.com, masahiroy@kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 6:58=E2=80=AFAM vngocvan <vngocvan@gmail.com> wrote=
:
>
> When invoked from outside the build tree with -d and a modules.order
> argument, the script opens .mod files relative to the current directory
> instead of the specified build directory. This can fail with
> FileNotFoundError or collect commands from unrelated artifacts in the
> current directory.
>
> Pass the build directory to cmdfiles_for_modorder() and resolve both
> the .mod files and their associated .cmd files relative to it. Absolute
> paths continue to work, and the output location is unchanged.
>
> Fixes: ecca4fea1ede ("gen_compile_commands: support *.o, *.a, modules.ord=
er in positional argument")
> Signed-off-by: vngocvan <vngocvan@gmail.com>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 8d14b81efd73..149135f85f19 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -124,7 +124,7 @@ def cmdfiles_for_a(archive, ar):
>          yield to_cmdfile(obj)
>
>
> -def cmdfiles_for_modorder(modorder):
> +def cmdfiles_for_modorder(modorder, root_directory):
>      """Generate the iterator of .cmd files associated with the modules.o=
rder.
>
>      Parse the given modules.order, and yield every .cmd file used to bui=
ld the
> @@ -132,6 +132,7 @@ def cmdfiles_for_modorder(modorder):
>
>      Args:
>          modorder: The modules.order file to parse
> +        root_directory: The directory where the objects were built
>
>      Yields:
>          The path to every .cmd file found
> @@ -142,11 +143,11 @@ def cmdfiles_for_modorder(modorder):
>              base, ext =3D os.path.splitext(obj)
>              if ext !=3D '.o':
>                  sys.exit('{}: module path must end with .o'.format(obj))
> -            mod =3D base + '.mod'
> +            mod =3D os.path.join(root_directory, base + '.mod')
>              # Read from *.mod, to get a list of objects that compose the=
 module.
>              with open(mod) as m:
>                  for mod_line in m:
> -                    yield to_cmdfile(mod_line.rstrip())
> +                    yield os.path.join(root_directory, to_cmdfile(mod_li=
ne.rstrip()))

Thanks for the patch. Can we avoid os.path in favor of Path from
Pathlib? Here and throughout.

>
>
>  def process_line(root_directory, command_prefix, file_path):
> @@ -206,7 +207,7 @@ def main():
>          elif path.endswith('.a'):
>              cmdfiles =3D cmdfiles_for_a(path, ar)
>          elif path.endswith('modules.order'):
> -            cmdfiles =3D cmdfiles_for_modorder(path)
> +            cmdfiles =3D cmdfiles_for_modorder(path, directory)
>          else:
>              sys.exit('{}: unknown file type'.format(path))
>
>
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
> --
> 2.56.0
>


--=20
Thanks,
~Nick Desaulniers
