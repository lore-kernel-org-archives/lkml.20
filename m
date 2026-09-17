Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91D53F4122
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683278; cv=pass; b=FdDP9npPswa5FF6l5NMF1BziGZkE4nztTPPC99+4H/nUB9ZqfOmLhBh6F1EjM14gU7GJPAVeARn6LKHVmTKYZRan1jcRvMFLKvm2LEHoEAbj7RfOoXRl8XHWwvJ88pXsn2YPs3yn00VYlJ+fuCrha9DkgP6Ka1G/DTmVRjEgJj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683278; c=relaxed/simple;
	bh=33JrJP0eBoMTWOsObcZUnprsGVGyOvYEXvVWS++emGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKJDzA2jp/RMqUMAfyWRYqPJYjvpV5p+Vj7Rsdb6TmDauIAcCBCc5AJiR4HpIJFXP0M3XOSw3em8/3LoclTI+i18aXM2SPjWqkbF5V0ZriUmJt3U7mZLLBsBVJdTCUUg3M2lxzKhOr4gsGju8eJV6XVLVkT9ylV4o374qMsKwY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3kDpzW4; arc=pass smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3kDpzW4"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so87589a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789683276; cv=none;
        d=google.com; s=arc-20260327;
        b=cBx71KPDyTmaX87aagcp1TJcdFFIFd6v1j67A80leSPwez8L8HGIC/O/yyS6pq9KAI
         ku3Bo4HXbxOnKGYABQwNWcjwxSdL2EzzJ0PpNEjqfjb7CdZZSamzOBkBukbaTGxH8dqQ
         Fi8SqaoYx6U+Znei3s5yRae1K9VfwBLekmssIZBnUpMotriMjONDuLJ4hMsRS8Z0BOK0
         QmVSEO/XZgwPKLgqTZjl6lLSbvqW96Zu7O68oW2nZTg5vHHJgQ8JM+7rD4v1K5fJA1zt
         NDs+5eLczwAws1YXME1yK7BGVaToeuOpF37nnMt49qQkgGxZ8ZUckzzcHiD+r+ZJUTRu
         iiEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wVkLWZwDcftHWkygPUCtZEPadhVhHno/qCcQeOr4QFc=;
        fh=Bis6AVPCHlPo2A8CRMEfJypMAlm3pUr7kpJe3pblX20=;
        b=o59e9hXlnK+fYKqPIRr2ICVqEwiIHffnptvTCzoJCG16HFwwCeWxGVyqTCigwqe+nX
         owy5q2Zx1bJBYxLRpLRiFlj5MsqAbulxS9DL7eA5QshtFLbcvMqQfkZsNoRrcD6+et83
         U4+4VyT3skX1RlzWfsOnYw4CtSRvOHGov3cfVjlm2lWBemfFbvuxRIuMUcW9FWjU961I
         FQeEawIYhbKz/7ELN3V2ES+z83v6So3b6z8toxiq151YWKTrB9ZQFhfmTNfMQCIYV9h7
         YlQ2MqkXFPB/ip85SZ9wHZgX734T1jfo02PlR2cadmXWHqSiECTsSmHHXg9WKRsumlhL
         Q/vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683276; x=1790288076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wVkLWZwDcftHWkygPUCtZEPadhVhHno/qCcQeOr4QFc=;
        b=k3kDpzW4vKUzzrFj57AwwCBiREk823rOjan43sFdP/3nZarIjD6UXejVsp6S3DJ6bw
         DWp6M8uIvr+GH3ulXwRqbnXJZa0/faHb+CCGptCIen6JGk4hdlpnXW8LXAsPAZKH8fE3
         XsKW0Sbu8b/RshFyV4XXLD9HCCfKxOxXo3npy+0FFqeBjvQ0Y3JsL7LOf7kcTqQXf+kA
         nyU+d9h14etwa9XgUCWZ18k6MjGIdTsonnFgqx194x3zZ8UV2ZfXyEnvvR0amCmKQUBK
         bDJOLWmp91AtfXD4zXFA1vFTrM1z7+AY/K+j/ZDyqN4OsoA2+crdcu7h468Zqc0x4F6n
         mIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683276; x=1790288076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wVkLWZwDcftHWkygPUCtZEPadhVhHno/qCcQeOr4QFc=;
        b=MJagobhchVxm+B7oOOyIv5JwXL9Rio/rcUEZoV//dwvjv71lIb9zZV16R/p4SyUusk
         znbaoYLNQNmD6e64URFEZEUqah41GoN7NGcbwgxA2RFuG1PxIZCo+LLgQ8zoM7MmZrmD
         0V3unJohavfxWwRDNk0jqjPUz6YnoV+213u6yTgv17jttZg3S+gcLgtC889pcrRpVge7
         SpYe7m96xDWjInnB2OOj6q8M88rIFdWuO1hQUhti1bwZuvQdySTQz5BhrjdaOgBFOnEc
         Qb3d5MY2PQceDgr/7V5cZ7CvVFjjQBMcEwKWrzxFPUaO6YRXQAeuMygkfbnh+VXIWo+O
         e6hA==
X-Forwarded-Encrypted: i=1; AKwUvBzDI0uaTs0yoX0ZTkKB1nW4Tv6sK/Ssptu/cUA9pnSbrhLKu+G/dFP4xzi2+WZB3XO0bhRNytSfp68sGi8=@vger.kernel.org
X-Gm-Message-State: AFuF++mDSjoUWGLgURJflHTgQMYtAv4LXXyAXtDqH/dsFw/GIzRx4aim
	aBVw+W3f1oRNwLwPcY+szKtmAHvIRpg2SiVDCWsylF0TsYK8q4zW1LRGvUPH+Qa3zjImdo9dw6l
	AEidOh9RWIuvapZe9jNQwR4bvDH+8xg0=
X-Gm-Gg: AYBFou2ZCp0WVb1NO+qHSshlWmdFujASJInvJknfnEvtu7UMjTawyagtQI+7Zsciddp
	MpqSuO0KFV23GDjP+z6o+DlVPYD1xoCdkMs/BYroZ7Hs5x5rM8HMsuElUdM7Guo0pVNFxKMdg29
	tu5vBKfJz0Pelt3x+GDCUupmlmj+1G7bye0gsMzAjq+he05LUdGgegl9oT6I0ESqzyMsOmZMhuH
	VVl6CWXiWLadkCc6bCTBxctkpnD2JZGPoJUu+kehn78agzs+a4RJganKnjgD9pRA+Cyeep1AQdi
	+uBDybD9Y/keLiK163d1H8TuMoey7R1FOtrk+ltNOcDUYyL/PMrclsOrxlT8vRqNGxsRqKRjt9B
	DjbvRcLAIIagYKNuqiJ6vDuV9dBNnx7wHuHiJ98OFFAMnjH6+17u2
X-Received: by 2002:a17:90b:53c3:b0:39d:f130:8f13 with SMTP id
 98e67ed59e1d1-39e54e3c624mr985500a91.21.1789683276095; Thu, 17 Sep 2026
 15:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915080255.48929-1-tasos.papagiannnis@gmail.com> <20260915080255.48929-6-tasos.papagiannnis@gmail.com>
In-Reply-To: <20260915080255.48929-6-tasos.papagiannnis@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 17 Sep 2026 15:14:22 -0700
X-Gm-Features: AcwNN1V6otsO6IWksnCzkd743-EAl1OOZ6ho93SkT0O5q69xaMVQFn98PY1WbH0
Message-ID: <CAEf4BzZui5ywrdEz1Sz+XuSEOyFVBnGR_F0SU0vNuhBpaGpqGQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 5/5] selftests/bpf: Test mm_struct user memory
 kfuncs with linux_binprm
To: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
Cc: bpf@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, david@kernel.org, 
	akpm@linux-foundation.org, andrii@kernel.org, ast@kernel.org, 
	brauner@kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	kpsingh@kernel.org, ljs@kernel.org, matt@bobrowski.net, memxor@gmail.com, 
	song@kernel.org, sun.jian.kdev@gmail.com, utilityemal77@gmail.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:03=E2=80=AFAM Anastasios Papagiannis
<tasos.papagiannnis@gmail.com> wrote:
>
> Add a sleepable BPF LSM program attached to bprm_check_security to test
> bpf_copy_from_user_mm() and bpf_copy_from_user_mm_str() on CONFIG_MMU
> kernels.
>
> Starting at bprm->p, verify that bpf_copy_from_user_mm() can copy the
> contiguous NUL-separated argument and environment data. Then use
> bpf_copy_from_user_mm_str() to read each argument and environment string
> separately, advancing the offset by the length returned from each call.
>
> Skip the test on !CONFIG_MMU. In that configuration, exec argument and
> environment strings remain in bprm->page[] until the binary loader
> transfers them to the new process stack, so they are not accessible
> through bprm->mm at the bprm_check_security hook.
>
> Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
> ---
>  .../bpf/prog_tests/copy_from_user_bprm.c      |  72 +++++++++++
>  .../selftests/bpf/progs/copy_from_user_bprm.c | 122 ++++++++++++++++++
>  2 files changed, 194 insertions(+)
>  create mode 100644 tools/testing/selftests/bpf/prog_tests/copy_from_user=
_bprm.c
>  create mode 100644 tools/testing/selftests/bpf/progs/copy_from_user_bprm=
.c
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/copy_from_user_bprm.c=
 b/tools/testing/selftests/bpf/prog_tests/copy_from_user_bprm.c
> new file mode 100644
> index 000000000000..ef351cda9348
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/prog_tests/copy_from_user_bprm.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <errno.h>
> +#include <sys/wait.h>
> +#include <unistd.h>
> +
> +#include <test_progs.h>
> +
> +#include "copy_from_user_bprm.skel.h"
> +
> +void test_copy_from_user_bprm(void)
> +{
> +       char arg0[] =3D "first";
> +       char arg1[] =3D "second-argument";
> +       char env0[] =3D "SOME_ENV=3Da";
> +       char env1[] =3D "OTHER_ENV=3Dsomething";
> +       struct copy_from_user_bprm *skel;
> +       pid_t child;
> +       int status;
> +
> +       skel =3D copy_from_user_bprm__open_and_load();
> +       if (!ASSERT_OK_PTR(skel, "open_and_load"))
> +               return;
> +
> +       /*
> +        * On !CONFIG_MMU, exec strings are held in bprm->page[] rather t=
han
> +        * being mapped in bprm->mm.
> +        */
> +       if (!skel->kconfig->CONFIG_MMU) {
> +               printf("%s:SKIP: test requires CONFIG_MMU\n", __func__);
> +               test__skip();
> +               goto out;
> +       }

I'm not sure I'd bother with this !CONFIG_MMU support, tbh

> +
> +       if (!ASSERT_OK(copy_from_user_bprm__attach(skel), "attach"))
> +               goto out;
> +
> +       child =3D fork();
> +       if (!ASSERT_GE(child, 0, "fork"))
> +               goto out;
> +
> +       if (!child) {
> +               char *const argv[] =3D { arg0, arg1, NULL };
> +               char *const envp[] =3D { env0, env1, NULL };
> +
> +               skel->bss->monitored_pid =3D getpid();
> +               execvpe("true", argv, envp);
> +               _exit(errno);
> +       }
> +
> +       if (!ASSERT_EQ(waitpid(child, &status, 0), child, "waitpid"))
> +               goto out;
> +
> +       if (ASSERT_TRUE(WIFEXITED(status), "child_exited"))
> +               ASSERT_EQ(WEXITSTATUS(status), EPERM, "exec_errno");
> +
> +       ASSERT_EQ(skel->bss->bprm_argc, 2, "bprm_argc");
> +       ASSERT_EQ(skel->bss->bprm_envc, 2, "bprm_envc");
> +       ASSERT_EQ(skel->bss->data_len_match, 1, "data_len_match");
> +       ASSERT_EQ(skel->bss->invalid_flags_ret, -EINVAL, "invalid_flags_r=
et");
> +       ASSERT_EQ(skel->bss->copy_ret, 0, "copy_ret");
> +       ASSERT_EQ(skel->bss->str_arg0_ret, sizeof(arg0), "str_arg0_ret");
> +       ASSERT_EQ(skel->bss->str_arg1_ret, sizeof(arg1), "str_arg1_ret");
> +       ASSERT_EQ(skel->bss->str_env0_ret, sizeof(env0), "str_env0_ret");
> +       ASSERT_EQ(skel->bss->str_env1_ret, sizeof(env1), "str_env1_ret");
> +       ASSERT_EQ(skel->bss->data_match, 1, "data_match");
> +       ASSERT_EQ(skel->bss->str_args_match, 1, "str_args_match");
> +       ASSERT_EQ(skel->bss->str_envs_match, 1, "str_envs_match");
> +
> +out:
> +       copy_from_user_bprm__destroy(skel);
> +}
> diff --git a/tools/testing/selftests/bpf/progs/copy_from_user_bprm.c b/to=
ols/testing/selftests/bpf/progs/copy_from_user_bprm.c
> new file mode 100644
> index 000000000000..07ca96d9db45
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/copy_from_user_bprm.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include "vmlinux.h"
> +
> +#include <bpf/bpf_helpers.h>
> +#include <bpf/bpf_tracing.h>
> +#include <errno.h>
> +
> +char _license[] SEC("license") =3D "GPL";
> +
> +static const char expected_data[] =3D "first\0second-argument\0"
> +                                   "SOME_ENV=3Da\0OTHER_ENV=3Dsomething"=
;
> +static const char expected_arg0[] =3D "first";
> +static const char expected_arg1[] =3D "second-argument";
> +static const char expected_env0[] =3D "SOME_ENV=3Da";
> +static const char expected_env1[] =3D "OTHER_ENV=3Dsomething";
> +
> +int monitored_pid;
> +int bprm_argc;
> +int bprm_envc;
> +int data_len_match;
> +int invalid_flags_ret;
> +int copy_ret;
> +int str_arg0_ret;
> +int str_arg1_ret;
> +int str_env0_ret;
> +int str_env1_ret;
> +int data_match;
> +int str_args_match;
> +int str_envs_match;
> +
> +extern bool CONFIG_MMU __kconfig __weak;
> +
> +extern int bpf_copy_from_user_mm(void *dst, u32 dst__sz,
> +                                const void *unsafe_ptr__ign,
> +                                struct mm_struct *mm, u64 flags) __ksym;
> +
> +extern int bpf_copy_from_user_mm_str(void *dst, u32 dst__sz,
> +                                    const void *unsafe_ptr__ign,
> +                                    struct mm_struct *mm, u64 flags) __k=
sym;
> +

these should be already coming from vmlinux.h, no need to explicitly
define them, please drop (and CONFIG_MMU parts as well)

> +SEC("lsm.s/bprm_check_security")
> +int BPF_PROG(check_exec_args, struct linux_binprm *bprm)
> +{
> +       u32 pid =3D bpf_get_current_pid_tgid() >> 32;
> +       char data[sizeof(expected_data)] =3D {};
> +       struct mm_struct *mm;
> +       char arg0[32] =3D {};
> +       char arg1[32] =3D {};
> +       char env0[32] =3D {};
> +       char env1[32] =3D {};
> +       u64 offset =3D 0;
> +       u64 data_len;
> +
> +       if (!CONFIG_MMU)
> +               return 0;
> +
> +       if (pid !=3D monitored_pid)
> +               return 0;
> +
> +       mm =3D bprm->mm;
> +       if (!mm)
> +               return 0;
> +
> +       bprm_argc =3D bprm->argc;
> +       bprm_envc =3D bprm->envc;
> +
> +       /* this is the total size of args and envs starting from bprm->p =
*/
> +       data_len =3D bprm->exec - bprm->p;
> +       data_len_match =3D data_len =3D=3D sizeof(expected_data);
> +
> +       invalid_flags_ret =3D bpf_copy_from_user_mm(data, sizeof(data),
> +                                                 (void *)bprm->p, mm, ~0=
ULL);
> +
> +       copy_ret =3D bpf_copy_from_user_mm(data, sizeof(data), (void *)bp=
rm->p,
> +                                        mm, 0);

single line (limit is 120, not 80), please reformat the rest if it
fits under 120

> +       if (copy_ret)
> +               return 0;
> +
> +       data_match =3D
> +               !__builtin_memcmp(data, expected_data, sizeof(expected_da=
ta));

nit: keep single line

> +
> +       /* arg0 is at bprm->p */
> +       str_arg0_ret =3D bpf_copy_from_user_mm_str(arg0, sizeof(arg0),
> +                                                (void *)(bprm->p + offse=
t),
> +                                                mm, BPF_F_PAD_ZEROS);
> +       if (str_arg0_ret !=3D sizeof(expected_arg0))
> +               return 0;
> +       offset +=3D str_arg0_ret;
> +
> +       /* arg1 is at bprm->p + sizeof(arg0) */
> +       str_arg1_ret =3D bpf_copy_from_user_mm_str(arg1, sizeof(arg1),
> +                                                (void *)(bprm->p + offse=
t),
> +                                                mm, BPF_F_PAD_ZEROS);
> +       if (str_arg1_ret !=3D sizeof(expected_arg1))
> +               return 0;
> +       offset +=3D str_arg1_ret;
> +
> +       /* env0 is at bprm->p + sizeof(arg0) + sizeof(arg1) */
> +       str_env0_ret =3D bpf_copy_from_user_mm_str(env0, sizeof(env0),
> +                                                (void *)(bprm->p + offse=
t),
> +                                                mm, BPF_F_PAD_ZEROS);
> +       if (str_env0_ret !=3D sizeof(expected_env0))
> +               return 0;
> +       offset +=3D str_env0_ret;
> +
> +       /* env1 is at bprm->p + sizeof(arg0) + sizeof(arg1) + sizeof(env0=
) */
> +       str_env1_ret =3D bpf_copy_from_user_mm_str(env1, sizeof(env1),
> +                                                (void *)(bprm->p + offse=
t),
> +                                                mm, BPF_F_PAD_ZEROS);
> +       if (str_env1_ret !=3D sizeof(expected_env1))
> +               return 0;
> +
> +       str_args_match =3D
> +               !__builtin_memcmp(arg0, expected_arg0, sizeof(expected_ar=
g0)) &&
> +               !__builtin_memcmp(arg1, expected_arg1, sizeof(expected_ar=
g1));
> +       str_envs_match =3D
> +               !__builtin_memcmp(env0, expected_env0, sizeof(expected_en=
v0)) &&
> +               !__builtin_memcmp(env1, expected_env1, sizeof(expected_en=
v1));

I'd put env1, env2, etc into global variables and do comparison in user spa=
ce

not that this is broken, but there is no point doing this in BPF code

> +
> +       return data_match && str_args_match && str_envs_match ? -EPERM : =
0;
> +}
> --
> 2.55.0
>
