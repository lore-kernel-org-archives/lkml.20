Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9806A1F30BB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468742; cv=none; b=HWOaz1aQuPPI25YAGADj7U/P6+Nmuhab+TBXFU0Xv/gPIHVl99q+E78+MV44zNFJwrQKHjrSTgKhsz4bfHdW5dwX2Fx+voqTuAr+JmDVcjADtA/OQ+V3z8W8LXzf+yRnDxyOEKnpDuWk4jIwypjk9JjGguIHs/LWAYe3gSd4XvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468742; c=relaxed/simple;
	bh=MJwTrP4CVwGddIK6J5OAaQDSOlc0mGdIiD8769a/zNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rajigOfpWvn6Y2E9Z20SBgg5lzO4ZujCjkXS/W/zPM1YQCCFj7V2fFjX0yns0lmHMBlWs2YfhAhL9bTmrwSV+IAkP4eqOBfI/sp9yTiL4bnYKNRaVP3NZUYmZ9oSAJoTHCPE/WY+mzeIJLnufioj1omnKjow7aACVaszI+kQZc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkgcNu5B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkgcNu5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D60A1F000FF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791468741;
	bh=O36gv6hlKGTB1dGwK8PnWmjb6kQ34dtwDZu/ftfPJIA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EkgcNu5BSyXIyahsHdzEONGetFWujVkPYgj2oYqFEILZaCtXHN6ufbTuNMiEQPRcU
	 taP4OCyhOXYNhSCVURRhhJnHkY/I8vIp0PIRQGDVnWdKgHAKCPEXnRsHmrjtF4KQYN
	 qz+JVfqHfYllPJ84tJnE4xDIRtb8pcOoY+g9ljzLEbG1i1S1se9zjOtVCToITy8BvQ
	 aQ3T/SJSSheFZNWRT3RnpPAG2yIhbgvULAoI1Q1ymP1JCmNMeFhjhiegZkgote1FfU
	 bA9CDuUp2Xaw5d7K+G6rO91NWX9ykmpditYZNZNPDzA0jKyuwpFVraq0igoLHGZACD
	 leXE0lSol0X9Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso238757e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:12:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwsDrfhVOqpUwAdhHW0vNLpR3HeyF3ax35NmUK3Iwwa4Xdvl/N15JuUFZ/hxYbUxhX8BRm6CgYxpA6B6cA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT7w8tfHUVbKy44PvyFn6EWQaqLKy7kJ8wY1w6mqQ8xtW04Y08
	/jFGFQWCww2/JNQX7nrgo0NTQDmrBRP0bNZS7MBFH/bpfwEnjNUybJOB2ZvkKBbR9sHaBeF8ivJ
	Y61loWD5hHc7hWX9ddvPSMr4tfbXoLig=
X-Received: by 2002:a17:906:dc8d:b0:c2e:378c:8cee with SMTP id
 a640c23a62f3a-c317bf5bc3dmr595588366b.34.1791468405551; Thu, 08 Oct 2026
 07:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-selftests-bpf-cgroup-stats-bpffs-v1-0-76b9a6d1be34@gmail.com>
 <20261008-selftests-bpf-cgroup-stats-bpffs-v1-1-76b9a6d1be34@gmail.com>
In-Reply-To: <20261008-selftests-bpf-cgroup-stats-bpffs-v1-1-76b9a6d1be34@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 8 Oct 2026 07:06:31 -0700
X-Gmail-Original-Message-ID: <CAO9r8zM86_kXTpAdsOAFvesvB-yenCMLSGYa7sS1uLVDQUH_fg@mail.gmail.com>
X-Gm-Features: AclHuK80zBKuPr-w8TV96q0Wje7e_GRnQyZXP68dEjes43wo6RtpVGexSq9898Q
Message-ID: <CAO9r8zM86_kXTpAdsOAFvesvB-yenCMLSGYa7sS1uLVDQUH_fg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] selftests/bpf: Unmount the bpffs that
 cgroup_hierarchical_stats mounted
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, Hao Luo <haoluo@google.com>, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 7:03=E2=80=AFAM Qiliang Yuan <odys.yuan@gmail.com> w=
rote:
>
> setup_bpffs() mounts a bpffs on /sys/fs/bpf and records in mounted_bpffs
> whether it did, so that cleanup_bpffs() unmounts only a bpffs that the
> test mounted itself.
>
> cleanup_bpffs() checks the flag the other way around. As mounting on
> /sys/fs/bpf succeeds even when a bpffs is already there, the test never
> unmounts the bpffs it mounted, and every run leaves another one stacked
> on /sys/fs/bpf.
>
> Unmount the bpffs only when setup_bpffs() mounted it.
>
> Fixes: 88886309d2e8 ("selftests/bpf: add a selftest for cgroup hierarchic=
al stats collection")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Yosry Ahmed <yosry@kernel.org>

> ---
>  tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c | 2 +=
-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_s=
tats.c b/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
> index 3bd27d2ea668c..a93b16ed629e9 100644
> --- a/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
> +++ b/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
> @@ -110,7 +110,7 @@ static void cleanup_bpffs(void)
>         ASSERT_OK(rmdir(BPFFS_ATTACH_COUNTERS), "rmdir "BPFFS_ATTACH_COUN=
TERS);
>
>         /* Unmount bpffs, if it wasn't already mounted when we started */
> -       if (mounted_bpffs)
> +       if (!mounted_bpffs)
>                 return;
>
>         ASSERT_OK(umount(BPFFS_ROOT), "unmount bpffs");
>
> --
> 2.43.0
>
