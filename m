Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D400C5427EF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921203; cv=pass; b=J6aUEhMhD/MjiUT0bJ2dRSAKVAEd5OhVQOxVlCLDkkkbnUMGbbYwK4HUyvJocvIb++wILSuoeWMylM8HD5ljFNY5fGV3hiCvn9sTY/9ozNBNhZpqCpPGzVxqWLXxfbugn7grEEB6DuCf0ykm6FDbCoyksbdMDKusOlveIceaU14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921203; c=relaxed/simple;
	bh=kZcNHRKweJx+iHr6GYPUVcEw90YDQL8CUNxb6aSZzLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iML0CJJvork3SRxvQtxknTpyMyRzV28b0lse8PtjEguIu69sn2yZhulZZlUzfd7GknTeY6fae1564qiq+vS7ceMZaELZtVzMshhbGeaJQvi+xlBzHCW9Ps5WbI3fZzNkAJpAIAFVSrpFeeqg6h/t2KPdbSJ8UHRzbgdcMHmPByY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QVGlPl2q; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QVGlPl2q"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-77bf892b496so397326137.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791921201; cv=none;
        d=google.com; s=arc-20260327;
        b=ZwZw0UY80UkD7uGeU4YsVEK7P8HpZSucEw+BwOCF0jQUqam2wgQeWAACxhnIE2tgrA
         MfawY28+l+n0Ysh2Xgz+D0MIc9gQiw81E2M1oYvUjT7g+MuxDVrOin3xEJNE9L1NIh/F
         Ff9VoUtsi+IDvi61WIpS7AHj2eeVRuUo+PySS2ixTl8XDgQZaNres2WfMwujaYb7I8uJ
         wuKEeVRRu/I2CNey17uv0FUg6AG+y0ubiXZtsVuqjp11fmfjf4Vof0w1aPHrd0FL2aJW
         9vF++1fLr1N8QP6X04cCSbCe4HZxHz/mxZfPol+wWOXCrgTayYkw6JNLDBwEntHyzb3d
         3ApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Itq5Kt1Cpx9UyAaFaUspzDtgaSrQMGirNxVH3aVF5nQ=;
        fh=6v1Nye8mImUbvqDZE2KToA9qGzgj6EASbqVSySIpCTM=;
        b=nII8w5wjoZpiaP6I+xXZFxP6GAGYRJdJn4nnpWLCIND+b1lbuDJFCWMpim/hr2szZr
         V3eqt9S9j/OvfLhgFT6KVcLNQN9OlEBK8ju4+0kj+FpgQ4VkGKApBA7/MwwswoR2dLsa
         o3Q/lyNyxPiWErefTiRdyfYE0GbKTmfTWPV3JpYWrI0M62ZJ19HYnfe3448Avyi7KdpB
         gVVtSOmt5g9iQEQiztowVD6L1iBzlgBMh/a2bNJfljWVrBu0851mTmuTcb97VB6JTu86
         3kcJpLGJitvcH3Do0/FrKBwEcTm/PtUoe+jZkl1aaIi+w8J0aRpmo3Ema4DaWO+A2+n8
         b+5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791921201; x=1792526001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Itq5Kt1Cpx9UyAaFaUspzDtgaSrQMGirNxVH3aVF5nQ=;
        b=QVGlPl2qfCpHQIJgYmlMoeB3u2b11/EgHKdBkxLXkrqIRszsvgZ+YS1iE/ALMsS5YL
         INUhh1ygHTwoTIY1s3pQUTKlxAUo4Y1Bv6AAeRsigQmYuWgJNuWM4clCnXYDcAtXFg0y
         2lW+5cpfox7mzC5lkBbHhJ5usDndqPbfUa5kZnL9vNSg3+BtacP+QtGjbL68xZNJe24w
         UxYWt8lDGnk+tqtWuDiPkA/BkNRVpev4dJ81iDYcgQiuIazACV51jFpOw0xn4ZDoKkGh
         nCyRZPWB8yNq+LuyVM+KDbaHWto9P86I9CssWfl0xIsugXxwuMSYw9ySa29knrR1zrpD
         kJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921201; x=1792526001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Itq5Kt1Cpx9UyAaFaUspzDtgaSrQMGirNxVH3aVF5nQ=;
        b=apOajhjA7mzU7t7FjQxwOlWba45uLFGHqSbBGMUz8dVeyzyHCf5gQSuaAy9DxH68EN
         1cThyTXj1UDanFcWfTJyohnpLFH85cmebNIPm4Ekz1iiLR4v0+jqRJ7Qm2StIioKY5sj
         h8L13A/UxOwKj1ULKhVWxwjWAaUXXkZhc8/GRQ9Bfm3Ftd2/5JWImw/vBrcGixIGH+y8
         LGWVbjYzzpQeHVwkzJXZVODUtG0yfMsLqGY8r/S7nqkIP+ZE9xTkru2fUdl3ThG5Sddw
         NM7MLlVKA6cWXiqd9/cDjGHMx4lsCn6GE8Jf9CZZ0+675Ji8jERxZ+9VsmBxEXPoyAp5
         STUw==
X-Forwarded-Encrypted: i=1; AKwUvBwt1wybHcEyMXnY5NQuPP5aziyPPjEnJL8jv7vj7TCUL1jUC1SPmj5BdQHOOGZlDOWSq+bi2tFPqSPHLFc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6uS91kW/ihSmfji7NVZGnUAdqCpkXkK5GAmwyLG8rGWKjdgAY
	nyMpG5V0ZCS723o63/E4HBcxwOgAl2ZT08ygfgdhw0WA7gWinHNzdAmhGZHkqX/I6SP5BgaTA6w
	yw4JkG7qNQLwACPQrcSCRdiLntJzdHdoz61rHDnug
X-Gm-Gg: AYBFou3c16cOkYIV/hR98ih/e1eGeS3iR+/KF8KGAasWAXqhwMoE1rPu6Kkwmwvycdp
	CdcvNQhyc6gExFO/Moc5JmgaixjDKJMPk4Xr8IgocN0Ix8T694jWxkqaqJpB/KoI19AcFoF8aOY
	3oQaYlySU3mPWG3ErbO0MYoOG6p99fvEe7cIYvDjnsfK5ZdmOcHXVecgCX1QQnU57GxUTXuF6+d
	UxCLKPyA29UUgPYV4w+2a2pi5E51wjh7zk7yyipE6YwPlVR65ROjMOu0iNDDZAOQ3N6db17bA0t
	3C+o8njvUOWq9JiDK5zc8iysi693pUsUoLko1oNVDnWbMVuGulQV2ZGyKm2D39gFLGltPxUOAjm
	jJmUU484MaQ==
X-Received: by 2002:a05:6102:38ce:b0:7c3:3c75:db89 with SMTP id
 ada2fe7eead31-7cb3a117b27mr3126273137.25.1791921199874; Tue, 13 Oct 2026
 12:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-kunit-parallel-v1-0-f4be28c895e5@kernel.org> <20261013-kunit-parallel-v1-6-f4be28c895e5@kernel.org>
In-Reply-To: <20261013-kunit-parallel-v1-6-f4be28c895e5@kernel.org>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 13 Oct 2026 12:53:08 -0700
X-Gm-Features: AclHuK8z2hwcwxCnPzLLSbjbaXHYfi3CL2D7DyPENfay0wYMSMnrgT2M8XDF-Lw
Message-ID: <CAGS_qxrRMoy2fB3zzpD=bOf7R4not5TqpDXE3a-dRKJOpyRt8A@mail.gmail.com>
Subject: Re: [PATCH 6/7] kunit: tool: Serialise output written from multiple threads
To: Mark Brown <broonie@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:52=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Python's text streams are not thread safe. If two threads write to
> sys.stdout at the same time the stream's internal buffer can be
> corrupted, resulting in lost output and runs of NUL bytes or heap
> garbage being written in its place. This isn't an issue currently, but
> will be when we implement support for parallel test execution.
>
> Add a lock to kunit_printer which Printer.print() takes around each

Firstly, thanks for taking on test parallelization!
In March 2022, I'd written a proof of concept that worked, it just
leaked some memory on the C side so I never shared it.
(Instead of using the existing test filter glob, I'd added the ability
to specify arbitrary test indices to run a slice of tests)

I'd have to reacquaint myself with the code to actually review the series.
But one thing that sticks out immediately is, my version had added
this new type to avoid the need for any locking:

+class BufferPrinter(Printer):
+       """Like Printer, but only prints to an in-memory buffer."""
+
+       def __init__(self, parent: Printer):
+               """Creates a new printer that inherits parent's
settings (use_color)."""
+               buf =3D io.StringIO()
+               super().__init__(buf)
+               self._use_color =3D parent._use_color
+
+               self._parent =3D parent
+               self._buf =3D buf
+
+       def close(self):
+               """Prints the contents to the parent printer and frees
memory."""
+               self._parent.print(self._buf.getvalue().rstrip('\n'))
+               self._buf.close()
+

It required passing along kunit_printer.Printer objects to more
functions, but I think it might be a cleaner end result.
By explicitly calling `close()`, we could control when exactly output
gets flushed so we can avoid weird interleaving.
It seems in a later patch, you write each kernel's output to a file to
get the same effect, but an object like this could be used in more
places.
Thoughts?

-Daniel
