Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E1752FE4B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921034; cv=none; b=fo9hPmVYjXToRf+XeEq88oVXuD1C+WXwJ4IsPxOxHYpQ+5qWbSujAp3HvLpdr/BEZf06F7JFzwtx7HdlU6/hjJ+Qz4uHRk4r9gjzqbDla6NU3SAbMBb3g5RuiRzO9/6ngwy1pQQi4pwW6LBDTDahh7AC07wq8AanJYWxx9aDNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921034; c=relaxed/simple;
	bh=CyOUO4Sx/ZyJqPpL1Zxkksriyh1i6LZYX6N/K5dHvVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFM6ZSSBey3kT5/MYKOa0FvnVTxkoiQqiGGK8QWbFTHBjDcB0R1u0EjKAvbDn456GyRjrQPDESd2o4XUQmKiDhdxxkusKGm8B+2N6MTCa7Ql8dBLz6vHwhT01qOdA5ECll+5YVJF8wcB0u5RA/yygdsYw0ikn7UU+uTk7M/mjdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuXclzDH; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuXclzDH"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6756a01fa01so3294227d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791921031; x=1792525831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZoueUT4k+fvI/0qSlszD3UoR0/L5xBDuP8ZwVEmfCM=;
        b=YuXclzDHdSYtyt/W9IVzo3IKA4tAzIdoUb6yc+fdZnNi1S8GUUS5EorS75zVDkoN/A
         kjWUSeY/yTjXHERyEjzzVpvucnjfGaNeMRh17ebnxCsuNOtgPz2yXm4yk/Rmr6Fo6O1K
         qCUDjDnnIBmLVtiYg38YdQyoiy+SloMQ/Lwu4bQUgZ2QoF9xDe52oUttCBoEGNsMD6vt
         9oxhU948knF0B32igUhZC953hYlYYqN1bSLHZOJEE7PcB3fCBBD1epZyspuqxvlMrnDq
         UYF+A5128lSLfvfn3isYt3yG2DjukJcMuK2UXAwp4kBHe7XEK7R6ozY5zV4+G6G3DXpU
         3ImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921031; x=1792525831;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZoueUT4k+fvI/0qSlszD3UoR0/L5xBDuP8ZwVEmfCM=;
        b=qn6E4blvZG6EsOq02+0rUgTEW0z3lz5kF8Qh0CGrMuQzdv9TtEhwrOcPtRlgrQIQ8v
         E1e0LyjAalBCZlqUa9BY3RW0gdPDuFLQVQ809osTdZbWAGrRABy7Fh/JZnxchUx754dj
         qxLqYRXgZRFbwyM13jXUTDre5VpzHssxovgbvPxcM/KD7CD4ZtpeCAPNk5sS5kekOXy0
         HaJsMGjMQL8ntLKp455m7svHgVHyFNKaGAV6jioAEABo0I4DVGj0dxOaJWGoSGg5CRdC
         plS1VZ+6wQ/gOvNXXLETD4jc50DPwe4JVsUnIP2ae958923W4kiPjMAbhlxd8fFk6B8V
         zz+w==
X-Forwarded-Encrypted: i=1; AKwUvBx2H+iH1V4Q0MEFb+sNzbHHamkDL4cfk24HwFx3Ydq/2O8q6Qb1T+dCAKBdCQVMfXht7RAZJflMlCz/dFM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdIMMZ6SXUiHPTjl3gIf5RwHYXcEGw9sYV1vBKUopDIUfMUH8p
	/GlyX+U2nYHq7ie1c2K43+QD4LEFH696KvwYsRxLi9PeDVaj66DVlM3D
X-Gm-Gg: AYBFou3Ut5NDQUQbPNNpfz6mZPpbBaIOR10s8QFkqjkvXf6PH8U6kQu5KeVvDx+4bAI
	+4P44iRg7D4mYkJ8H+l+NTlxqD9vo+qPZjhnTtPIpK5Zhemgngc4+jqWSe3seGxNHOyRA1LMqer
	QbHxrKgrgDCN2OtZ1sBxjQE1lJuNfdU11Nxd1QmUmDj1IqR4tIUfIvpdEJOsny1LPHwe2YKqEin
	dVjUO4RwzS6rnM79xVaPm/3AU3BWJCYpLbxxQtIYLmcsQPWGf0pblswzzXYj+gC1pF0bA+fMOVW
	d03we0eXCfgBQ8JykT6h64FsZnQtD/hj5WS6VZTH47hzzJX0nA6AY2Oyo4N64EidhQmZvEDCq6H
	kvD97q36qOyWgFYI9mEwMWqtoILon1ClfKitBpLVJBWhB1MqbhANvNDdN5Mq/dNo/dQ+xc4MUVo
	lNNnsdWUJp4N0n3k1tWaAxNZALu+6o4slF3oNMnCsjVDpQ597DiQ9yRji1jnDyM+/O0PmjqgeQH
	vSlymhIPQ==
X-Received: by 2002:a05:690e:1914:b0:676:97e6:d7ac with SMTP id 956f58d0204a3-679369b7774mr5187959d50.43.1791921031355;
        Tue, 13 Oct 2026 12:50:31 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:d326:f863:5ae3:683])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67986a66262sm240180d50.11.2026.10.13.12.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:50:30 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:50:30 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jiri Olsa <jolsa@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Mateusz Guzik <mjguzik@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Tingmao Wang <m@maowtm.org>, jose.marchesi@oracle.com
Subject: Re: [PATCH bpf-next v1 06/11] selftests/bpf: exercise the path
 ancestor iterator
Message-ID: <as6GG4NMzLrnpKXK@zenbox>
References: <20261013164800.2906577-1-utilityemal77@gmail.com>
 <20261013164800.2906577-7-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013164800.2906577-7-utilityemal77@gmail.com>

On Tue, Oct 13, 2026 at 12:47:55PM -0400, Justin Suess wrote:
> Walk the ancestry of a mkdir's parent directory from a sleepable LSM
> program and check that the iteration reaches the root: the temporary
> directory, its parent and / are visited, no position comes back
> flagged, and the flags read back after the loop show it ended at the
> root rather than on a failed allocation.
> 
> Hold the first position across the rest of the walk and resolve its
> pathname only once the loop is done and the iterator destroyed: the
> acquired reference, not the walk's, is then all that keeps the
> position alive.
> 
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---
>  .../selftests/bpf/prog_tests/path_ancestors.c | 57 ++++++++++++++
>  .../selftests/bpf/progs/path_ancestors.c      | 74 +++++++++++++++++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 tools/testing/selftests/bpf/prog_tests/path_ancestors.c
>  create mode 100644 tools/testing/selftests/bpf/progs/path_ancestors.c
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/path_ancestors.c b/tools/testing/selftests/bpf/prog_tests/path_ancestors.c
> new file mode 100644
> index 000000000000..d1bd26bce10b
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/prog_tests/path_ancestors.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2026 Justin Suess */
> +
> +#include <sys/stat.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <test_progs.h>
> +#include "path_ancestors.skel.h"
> +
> +void test_path_ancestors(void)
> +{
> +	char base[] = "/tmp/path_ancestors_XXXXXX";
> +	struct path_ancestors *skel = NULL;
> +	char suba[280], subb[280];
> +
> +	if (!ASSERT_OK_PTR(mkdtemp(base), "mkdtemp"))
> +		return;
> +	snprintf(suba, sizeof(suba), "%s/a", base);
> +	snprintf(subb, sizeof(subb), "%s/a/b", base);
> +	if (!ASSERT_OK(mkdir(suba, 0755), "mkdir_a"))
> +		goto out_rm;
> +
> +	skel = path_ancestors__open_and_load();
> +	if (!ASSERT_OK_PTR(skel, "open_and_load"))
> +		goto out_rm;
> +	skel->bss->monitored_pid = getpid();
> +	if (!ASSERT_OK(path_ancestors__attach(skel), "attach"))
> +		goto out;
> +
> +	/* mkdir b: the hook sees dir == suba, whose ancestry is walked. */
> +	if (!ASSERT_OK(mkdir(subb, 0755), "mkdir_b"))
> +		goto out;
> +
> +	/* suba, base, /tmp, / at least. */
> +	ASSERT_GE(skel->bss->ref_count, 4, "ref_count");
> +	ASSERT_EQ(skel->bss->ref_flags, 0, "ref_flags");
> +	/*
> +	 * The referenced loop ended at the root, not on an allocation
> +	 * failure.
> +	 */
> +	ASSERT_EQ(skel->bss->end_flags, 0, "end_flags");
> +
> +	/* The acquired second position, used after its step was taken. */
> +	ASSERT_STREQ(skel->bss->second_path, base, "second_path");
> +	ASSERT_EQ(skel->bss->second_len, strlen(base) + 1, "second_len");
> +
> +	/* The first position, used only after the walk itself was gone. */
> +	ASSERT_STREQ(skel->bss->first_path, suba, "first_path");
> +	ASSERT_EQ(skel->bss->first_len, strlen(suba) + 1, "first_len");
> +
> +out:
> +	path_ancestors__destroy(skel);
> +out_rm:
> +	rmdir(subb);
> +	rmdir(suba);
> +	rmdir(base);
> +}
> diff --git a/tools/testing/selftests/bpf/progs/path_ancestors.c b/tools/testing/selftests/bpf/progs/path_ancestors.c
> new file mode 100644
> index 000000000000..6287f5099a18
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/path_ancestors.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2026 Justin Suess */
> +
> +#include "vmlinux.h"
> +#include <errno.h>
> +#include <bpf/bpf_helpers.h>
> +#include <bpf/bpf_tracing.h>
> +#include "bpf_kfuncs.h"
> +
> +char _license[] SEC("license") = "GPL";
> +
> +__u32 monitored_pid;
> +
> +int ref_count;		/* positions seen by the pure referenced walk */
> +int ref_flags;		/* pos flags seen by the referenced walk */
> +int end_flags;		/* flags after a referenced loop ended: 0 unless NOMEM */
> +int second_len;		/* d_path length of the walk's second position */
> +int first_len;		/* d_path length of the first position, after the walk */
> +char second_path[256];
> +char first_path[256];
> +
> +static bool monitored(void)
> +{
> +	return (bpf_get_current_pid_tgid() >> 32) == monitored_pid;
> +}
> +
> +SEC("lsm.s/path_mkdir")
> +int BPF_PROG(walk_modes, const struct path *dir, struct dentry *dentry,
> +	     umode_t mode)
> +{
> +	struct bpf_iter_path_ancestors it;
> +	struct path *pos, *first = NULL;
> +
> +	/*
> +	 * Keep first's init opaque: gcc-bpf otherwise folds it into a
> +	 * preceding loop's exit value, which the verifier cannot track.
> +	 */
> +	barrier_var(first);
> +
cc'ing Eduard Zingerman + Jose Marchesi

This barrier_var line was necessary for this selftest to pass
under GCC BPF.

Othwise it will be rejected by the verifier:

  84: (85) call bpf_iter_path_ancestors_rcu_next#63514
  85: R0=rcu_ptr_path(id=30) ... depth=9
  86: (bf) r6 = r0              ; R6=rcu_ptr_path(id=30)
  88: (55) if r0 != 0x0 goto pc-64
  ...
  101: (85) call bpf_rcu_read_unlock#64876
       ^-- R6 downgraded rcu_ptr_ -> untrusted_ptr_
  ...
  146: (15) if r6 == 0x0 goto pc+10     ; R6=untrusted_ptr_path(id=30)
  147: (bf) r1 = r6
  151: (85) call bpf_path_d_path#64649
  R1 must be referenced or trusted

I think it's trying to optimize out the "struct path* first" and make it
use the r6 register. It tries reusing the R6 register between the two
loops, and doing so causes the program to fail to verify because it doesn't
understand that the path was reinitialized with r6=0 from the previous
exit.

So I had to add the memory barrier to force struct path to be
instantiated outside the register.

There's nothing wrong from a *correctness* perspective with the code
generated by GCC-BPF. But I'm not sure if this is a GCC-BPF bug or a
bug in the SCEV widening series (merge 15b578b1715d). It depends on
the contract BPF bytecode is supposed to meet.

But clang works without the barrier, it's only GCC-BPF that produces
this issue requiring the barrier.

I can give more details if needed.

Justin
> [...]
