Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793967171;
	b=bb5RsWOETzj1g+f+npgEEUnGk/8i4o1425LtyzohBFiMuiTOL+0oatW5v7mUYxqi/Qnd
	 geg0uCIlI7C63QEljJQDG5HVqtjJ8d3L2D3FWEzeJ6/hGeGeqJHB/fTIi2UXS8Bvsno9S
	 w84gWOdGAskQA75WqdEEDqoMivTw8ZMqy0JYM810NPNUxnX/Ttn2qFdHnLH8bus1Z7hR9
	 s5pzkXUGmcdQfz3hMGEHDMfpijuzdNMpTcIV2mJ3h8CwnpNhRYKc8OOhN+wIuQ6+Hrhgy
	 kFCpn2PCVJGc6j2WfxJbWf2sx8mNPpi147RvpDLwsjE/Xvi2QWweRCghu66rps2DcCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x1/cuWPUTv0vs8CRRmZ6/x/mFtko9mxhwsi/tFyavW0=;
	b=EZn9geZgmTRjG9srhSbNVavfg9maoAW1oGhRTzmWlkiRLy+vQjGJeW/FYc7qvG2cLCMV
	 wK2Nwb3HkRRiiyCFWFU/NNeeGu+icK/bB0n/o7mTsWinqu2huWWnMpwOLtWZ6f30Q9m9U
	 etWX4cyKYZRwFG2ENrhJcqXvaUmanSvG8CzKhOaVZJgHFpN6Kf6v34c+sVMv6JKGPMvVT
	 PSlkN2n/gDXkUOMw+vtY0KfzjvG2zFWgZ9pbkpUE4kUsVUiF9I5cmBzPeXS4xsjf8xEnY
	 uOXZ9lLLFwu0fhgNUE+Q1Qh5JNWq456zOxf4i7KP3fUapzLndlFaN7rfQkE0aUbldVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xDYrVneH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DB2606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69DB2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xDYrVneH
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so654966a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:12:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793967169; cv=none;
        d=google.com; s=arc-20260327;
        b=LaLOTQFiUjzSMp3ygnRbv3SEPvAik+L9tpcJKVnnSL7QL/s8bv1+LdpazwGIMSVIAx
         SqG3zBSf8pdRJcyByxOvvBOXPq/DxtKOV0Hj+igfvt9zM+Jn9aLvECspsKcG+gGIFln4
         Z6YAheGNqbGuyKt6FBzwBWN5Wt9zBpPIUAgOdRXThkOcCuuLiOyFy1No9IFBvqd5bdhz
         elHb8JP09Xk+0RSnRLEjIPh0vY1l0egUzUoBpKNB4LpUGtOLcYRKAtGcMfx4c3YO8XPJ
         lru1yDApRxnQEUEw42yXBxJdev8jgJIOHAeUQUZDhwK19iHXRnP8r4SguLUIEJsl/bXE
         Ic2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x1/cuWPUTv0vs8CRRmZ6/x/mFtko9mxhwsi/tFyavW0=;
        fh=6Gx8w9ujLR3ED4Q5oUP2bgOSShSObHVCOYMWY3Weti8=;
        b=fs0WtfyiPCQ1WI9YXlKKT3K/+eYGvBJCj5p9bCulSztJ7bqkM5rQGqMw5eCCwPJStN
         4FgGbCr0D6S3PAladQqS4/okzqIqQSOtZwBVRRJ45syeeJKJQQnvQ5Njowl64Y5t8qH1
         IfRYT8jxF6TOFXJVVmP2UTcFpWD2L3svpDvXE06pBp/lTPFawYBqSqTVjImV26u3VtJd
         iAy/Bp35/ZwY3ykATF7asFdWK6ggf07yirbcCAxzWvUO7aqQQ+EZpTpzwb9QlsanY2Wr
         pGn/ZebhnKFO/q0N5+Rf9b5OGP+s9a/bNofIEGL1IiVmMio4X9d1P+EHI8oneAyT29pL
         4RRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793967169; x=1794571969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1/cuWPUTv0vs8CRRmZ6/x/mFtko9mxhwsi/tFyavW0=;
        b=xDYrVneHd9NtSZJg0aPJWE2CrXqH1XhMoEBmuZu1Aq20xV6zyQmbDXClWwhR5sMHH1
         RifzHNcrt9zUYGkUN0udrQlRIcs28wCcQZt8AY3ZsXmNAG0m1KfOViGsnbgKseghiwis
         OEoziMx0kBGsIQWK/5GDVyMw6GnwIKEBEQhZ0m4L5moDCZUpWRoHJNOg+xxtJEDD2VB3
         UK1PBd+qffmb0RXq92LwXbuXDPw8lios74hyBidrpWWaeOsqVwEIpaCKo2sLUtO5OQxo
         1zL0DGnTQcMTY6sYyHvCqLGEe0kev4324IiqG1ZzM7ttp2pJK1cr86cPsszoMSCf4Z75
         cG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793967169; x=1794571969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1/cuWPUTv0vs8CRRmZ6/x/mFtko9mxhwsi/tFyavW0=;
        b=kUWgsI0bt1A97g+1CVpDZernoLcIMbVtdnGGWdl7oI8/n+Twlo9kb3YCfoYLg3SIH6
         IpwzgKxYzey5i5layIbzHBwqXMmtwTB2c2UaOsPalPlpyxbLrOLtlRL3Vh4/vjEUHoEp
         VhMXbqcShRLstRne3Q3+UxoXB0FzBDPn97wf+rIs6YYs9aZWwcH5sPLjJqfe/UT9V1yg
         Rx3ZbNfreJG/xVPXjIvr+oPJK/D8svUJCtYCrRaFM+htsTh21xAbtBpv14eoFGgYK/XM
         HBTNs5FJtnDkD2vTW2Jf/rCTaquZdOQLItY/EpX7LQM/3VScp4jMHt8AscVHXZG86Sux
         RTlg==
X-Forwarded-Encrypted: i=1; AKwUvBw55Brs/6j2xGbw0jeUwrNuYUlOPam+pcujU/vLOlS9pRWj5E1gGi4+yQzF3ZTqteOpCVEnpj0SRCN0fTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vyE0TboWozUEPIsNTguLQVhcWRK16m7CA76f5cbAXl8d9cf5u
	4sT/2A6Jz5IRfLqdRUPeGOq73v0Ta6W0v4UmayjegDyTf0NPtlfgFKMGrW1+sFpn/bAQsSmUfFH
	Wlu9Ef1XXgu8fv+LVOnvru2/e1ApFCdU=
X-Gm-Gg: AYBFou0+79eSx4wymbKmCbg7ySQ1humHgJBK7eJVRJUrSZjdCjtiNJ3I1fB508G42zp
	UU7lXDY0bKhFq47TZHuLqyt3oDn2dNJEjfoj6TBy5LW4GnSdwFsmpkYArNeqxBvdoug+j5lsshR
	jG0j7gueOis7KKAscpn3v0FfshirbkBhe4tWHoqGvntu1w5YHEFZNPjXrfsb9gCOkQhekwZNbrL
	bB/ycIYVYktGDhSNlFs+GkuiT2zL5rlI2zyDl5ozAHcnTfJIpWm1d3gFJRnbpyW1fm8wCIs0XnY
	lIlNmZmLcEN1bfCv6LIuC+0MD0e0H4oLYT93ep+2t4j4rtMD6ag2titFbkMIT6DPvGUe880gViE
	lUr1sSSVkyQSdRAd7o2vcKeFM5JTs78cmRdQ3z6XLo2F91+DnduSfCPUbjheogWBXS0n5vZguDZ
	APFBqETxjqLrSV2T/mv6vgzw==
X-Received: by 2002:a05:6402:2708:b0:6b5:96e9:ae95 with SMTP id
 4fb4d7f45d1cf-6b5977c05b4mr1611439a12.10.1793967168580; Fri, 06 Nov 2026
 04:12:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-alpha-force-success-fix-v1-1-8c26d60c5fff@gmail.com>
In-Reply-To: <20261105-alpha-force-success-fix-v1-1-8c26d60c5fff@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 6 Nov 2026 13:12:36 +0100
X-Gm-Features: AclHuK-imma2RB3IIgOI8b1RYP__FJLRZ_l9IgLeNTSprdfcIZVW6dvD-NI_UWw
Message-ID: <CA+=Fv5RXzRvCwmzJ8FY8=fxmHCF1X6XAj=LtfbVD5gVJJxi1mQ@mail.gmail.com>
Subject: Re: [PATCH 7.1.y 7.2.y 7.3.y] alpha: honor force_successful_syscall_return()
 again
To: Matt Turner <mattst88@gmail.com>
Cc: stable@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Fri, Nov 6, 2026 at 12:39=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> This fix is for 7.1.y, 7.2.y and 7.3.y only.  Mainline is not affected
> since commit 83bd31c2840b ("alpha: enable GENERIC_ENTRY") in v7.4-rc1,
> which replaced the saved-r0 check with a flag in thread_info.  That
> conversion is far too large for stable, so this patch fixes the old
> entry code instead.
>
> Syscalls that return data rather than a status, such as PTRACE_PEEKUSR,
> PTRACE_PEEKTEXT/PEEKDATA, osf_sigprocmask and shmat, call
> force_successful_syscall_return() so that a result with the top bit set
> is not mistaken for an error.  On alpha that clears the saved r0, and
> $syscall_error and $strace_error used to check for this and take the
> success path.
>
> Commit 55b22075f784 ("alpha: add support for SECCOMP and
> SECCOMP_FILTER") moved the restart syscall number to r2 and dropped both
> checks, so any negative result now comes back to userspace as an
> error with a3 set.  PTRACE_PEEKUSR of a register holding -1 fails with
> EPERM, which makes sandbox abort when it traces static binaries during
> Gentoo package builds, and PTRACE_PEEKUSR of a register holding
> 0xffffffffffffe000 fails with errno 8192, which breaks unwinding of a
> ptrace-stopped thread in elfutils (run-backtrace-native.sh).
>
> Restore the checks on both exit paths.  On the traced path the success
> path also has to stop falling through into
> SYSCALL_SKIP_RETURN_RESTART_GATE, which is meant for skipped syscalls
> and would turn a forced-success result of -1 into ENOSYS.
>
> Link: https://bugs.gentoo.org/985765
> Fixes: 55b22075f784 ("alpha: add support for SECCOMP and SECCOMP_FILTER")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> This is a stable-only fix for 7.1.y, 7.2.y and 7.3.y; it applies to all
> three (with a 16-line offset on 7.1.y and 7.2.y).  Mainline fixed the
> same problem differently by switching alpha to GENERIC_ENTRY in v7.4-rc1,
> which is too large to backport.
> ---
>  arch/alpha/kernel/entry.S | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 9f2608de2544..fe88cd598492 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -603,6 +603,14 @@ ret_to_kernel:
>
>         .align 3
>  $syscall_error:
> +       /*
> +        * force_successful_syscall_return() zeroes the saved r0 (the
> +        * syscall number): the negative return value is data, not an
> +        * error number.
> +        */
> +       ldq     $18, 0($sp)
> +       beq     $18, $ret_success
> +
>          /* Restart syscall nr comes from saved r2 (preserved even if r0 =
overwritten). */
>         ldq     $18, 16($sp)    /* old syscall nr for restart */
>
> @@ -700,9 +708,11 @@ ret_from_straced:
>  $strace_success:
>         stq     $31, 72($sp)            /* a3=3D0 =3D> no error */
>         stq     $0, 0($sp)              /* save return value */
> +       br      $strace_leave
>
>  $strace_skip_call:
>         SYSCALL_SKIP_RETURN_RESTART_GATE
> +$strace_leave:
>         DO_SWITCH_STACK
>         jsr     $26, syscall_trace_leave
>         UNDO_SWITCH_STACK
> @@ -710,6 +720,10 @@ $strace_skip_call:
>
>         .align  3
>  $strace_error:
> +       /* See $syscall_error. */
> +       ldq     $18, 0($sp)
> +       beq     $18, $strace_success
> +
>         ldq     $18, 16($sp)    /* restart syscall nr */
>         ldq     $19, 72($sp)    /* .. and this a3 */
>
>
> ---
> base-commit: f2c53ea949c5048f96b3dbb5a5ee7131ce4ff2de
> change-id: 20261105-alpha-force-success-fix-6df76c50033a
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>

Built and boot-tested on v7.1, v7.2 and v7.3 using Alpha QEMU
with stock Clipper PALcode, with one and four CPUs.

All 56 raw r0/a3 checks passed with the patch, covering traced
and untraced ptrace PEEK returns, including -1 and -8192,
other forced-success returns, and normal success/error cases.
Unpatched controls reproduced 32 failures on each release.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
