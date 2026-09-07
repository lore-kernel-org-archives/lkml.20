Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C2146F482
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778768; cv=pass; b=VwucsyuX6odmeGvATrDg0mzrNw3/7LqQv9NGhQmJeW5AmB1g4i9bXY4RlGh/fILCu+ThuZ4jeloy5f3DF4J+Kff8crnmMVGZHZVF8zwCOtKZ5TMkKuE0426vSk7EUoqESSphwwlECD8P4BUVk9EYCZf3zIU7fwdeF3ayEDNYy0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778768; c=relaxed/simple;
	bh=X62nhmJb9WbKAvRTAFiqwCbXKzcaidhj4nTbLOE1G+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ha3Pi0y0yfVkmkCVgK7cdNAitS45arMOV0sTYWO3JRGG5pNNGlKTBgrw77dBWK1QRGNht9sh3ktJUeWj8zgI1j+RihkY8u+JhKXwgV73NRyJ6mzUA8TBI+8LcRQd0ewHZcFABxo8Dur2PraQK4anZtBRhcSyeMGiJzJ2kas+RLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=JWzcZz4h; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="JWzcZz4h"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c252c7270faso484142866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788778764; cv=none;
        d=google.com; s=arc-20260327;
        b=VEzy5HdnOLOVDbOe9T4D1u+ll34OudpRDlU+nhe3CyfyCcuZfNV5fu489PcCUT+vKR
         P1AAo8tFZuewWBEJ9u879uoKAafXNYXPisplSpV9QBn3cA/ebgWofYJ8f0GsQSShHVHw
         S+RbjmXlgNxmUpoToJ2pNFSR5PhgjrkznP1mv4DLCAasOeh9zQOkx9D4FIzegOTlAJ5B
         qq3NohxzHi/T57OiNI9QYIex5dnNtSiw7gx511u0jEOd3xsiX3K0amfyR0PxYvSjfDKl
         ujcbhOz7E7wtaYmVXnBpFCIuqudyCsuKO26Vwa+iP/0ZWqPTvG0Uzf9Cu8iXKWT8stvh
         gzgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MbExSQ9FoZY9t8VR3AEn0egDax+aEYlzeOz7ZAlCuSY=;
        fh=MOF9Z4GKpGtlYd9jRdVdWhj7iV+FVdVBzh/V17StQO8=;
        b=G876mb0zBuqBQwsA9B4AD7ZdRqtcCwlmqjvT2exO6beJ2G4tCZpKqtXgrMw3h1MKpV
         cRJ7Mvhv7maPSGV6uf/UakdPSPOrEhquugpcMeGKc517Ux6cvi+7NuLnF0NMBTlCnmZP
         Th1ZAC7EWbP1pU/LHkefow9Ie4oEtbIAyusiQ4LsDc+m9mA4eqoIgDS3nkHYPbZuiScG
         QMYN4tJT1EIBhZWnYcAjdtbAFwiYHWfDtwq/1x+yzC5OGIxaqu7P6BbUjfkz54kp+/1e
         p+GCR0O86Vxa6TouSuO6Q6uyjg5h4lBmKujMt4iqkQ66O9l4VHnXIK29KHL0L2ElSqbY
         gVsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1788778764; x=1789383564; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbExSQ9FoZY9t8VR3AEn0egDax+aEYlzeOz7ZAlCuSY=;
        b=JWzcZz4hCMmPIVL01Q6H6mbVP+lrRq84c/PkmjxxObN+TXFijYupJ950JURNRcwdIz
         5zU7ZQVI+XHyL4q/lZbjCegSKBS6pgLZyjsb/RAP6ma96iZjTAtkBaz91pW3AzGFuuXt
         XEXZrEy/4MqzkNoNuU+gEl6KXf+lMl0s8x00E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778764; x=1789383564;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MbExSQ9FoZY9t8VR3AEn0egDax+aEYlzeOz7ZAlCuSY=;
        b=aZc61UxKyfghStQYmmqV6JpQDMHp5v/sNOjQ85s46mLV0gl2K33i60XYqgCLhfr7Oa
         I1JhbzrHBpp5R8/Ksb7pNsRIGx0fM3hlbRD6De0g9HSo3kvK9hyeuqce3TIejaHTHRIh
         4PdCFAF7mVmxkQxUWu5k1djMrn2JkDqmVCFz++k0K/bOPci75bvQfKfKliSPsfNKm2Jx
         4K/fjcYFXOa2v4/hunosQt4SigqHrCNCxLLyrRPGOqeYshDya1gIuh/sVKWRS8EIcVEM
         dUP2+uXJT2S/OCbmLah7Dv6Ck8qX/AwJJI7quwKfKfeA0EyrUGs/4Z4NHFV9iOzDshQP
         zcvA==
X-Forwarded-Encrypted: i=1; AKwUvBxYDeUYoWuWhH6dB/2+RsPC7A7fcBmaRkYEZcNJcC6VQV8BMhTwJJwTWjiBQc8fDDUbTZW5kdiX7aC/V6I=@vger.kernel.org
X-Gm-Message-State: AFuF++k6oD4v1v1ZVzMleyJms1IlqCXs6YfY8ojXsgpH+Bm3fdLG+m58
	QIn3dNam5oJhBpy7bdv9IwVJ9BZOTfiSQZT9ZT1VMepTqpwiEUzwcz/RseGift8govc0zlzLEqO
	CPO4zZBvIxDZkHT7T72b/pUw6HDB5+bcKH7XjtZqKbg==
X-Gm-Gg: AYBFou3A1P3fg4kr+1pzYbQn5AKs7CLs9tjNkVwzV+ZuAizNrAzvZHNZpOZG93msLI0
	/9O4K2aRMbizHFNUmTzZr8hBZcMYiW6mwo5eY3UfBq03S8nozKYKVfP/Fgp8b4WvNsJMBvQ1yIh
	VdB1szY/Yq3gn0NHe35+6763upenF3OQN9RtGTvGuE8JxAykGgfhLkjk01VQ6tMfdX6NujZXyoP
	bR1n72/bX0gNYeFXGIIjl3VctshV8NaDj5BWk2KCEivkr8Qqn9w6i4UMi9Lh82OCLm0vUeQLTox
	J3FKZzQ6cq9Cvq57Xll3Upv1hMtHIBFU+fik9Wpn7SXXLv9upJVDUM+LPo5EZUvPmITNClJiIau
	DBPlzMnPRnQ==
X-Received: by 2002:a17:907:3e1a:b0:c24:87e5:6491 with SMTP id
 a640c23a62f3a-c260c971f12mr1413746366b.2.1788778764003; Mon, 07 Sep 2026
 03:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-work-unix-passpidfd-v1-0-70cbfda0c7ba@kernel.org> <20260831-work-unix-passpidfd-v1-9-70cbfda0c7ba@kernel.org>
In-Reply-To: <20260831-work-unix-passpidfd-v1-9-70cbfda0c7ba@kernel.org>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Mon, 7 Sep 2026 12:59:12 +0200
X-Gm-Features: AcwNN1Vx-Y23Xmb_efJJLNqRBHN_dmcZQwnSFqUbNzzKkLXuOfCIfHCVcoWksEs
Message-ID: <CAJqdLrozRL7jaKPzmF1ksjVNz11Qyn2V9-xAQ342yDVJP76-+w@mail.gmail.com>
Subject: Re: [PATCH 09/10] pidfs: record the coredump on the dumping thread's
 pid too
To: Christian Brauner <brauner@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mo., 31. Aug. 2026 um 13:22 Uhr schrieb Christian Brauner
<brauner@kernel.org>:
>
> If a thread-group coredumps only the thread-group leader pidfd will
> return coredump information. A pidfd for the thread that took the fatal
> signal cannot be used to retrieve it.
>
> Record both the thread-group leader and the specific thread that took
> the signal and register both in pidfs. Mark both the thread-group leader
> and the specific thread with the coredump information so retrieval works
> for both pidfds.
>
> Now that both SO_PEERPIDFD and SO_PEERPIDFD_THREAD are available it's
> easy to get the coredump information for the specific thread.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

LGTM

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>

> ---
>  fs/coredump.c            | 22 +++++++++++++---------
>  fs/pidfs.c               | 11 +++++++++--
>  include/linux/coredump.h |  4 +++-
>  3 files changed, 25 insertions(+), 12 deletions(-)
>
> diff --git a/fs/coredump.c b/fs/coredump.c
> index 71a0093ada1b..b5ff4b3e1831 100644
> --- a/fs/coredump.c
> +++ b/fs/coredump.c
> @@ -454,7 +454,7 @@ static bool coredump_parse(struct core_name *cn, struct coredump_params *cprm,
>                                  * leader we know that the thread-group leader
>                                  * cannot be reaped until @current has exited.
>                                  */
> -                               cprm->pid = task_tgid(current);
> +                               task_pids(cprm->pid, current);
>                                 err = cn_printf(cn, "%d", COREDUMP_PIDFD_NUMBER);
>                                 break;
>                         }
> @@ -626,13 +626,17 @@ static int umh_coredump_setup(struct subprocess_info *info, struct cred *new)
>         struct coredump_params *cp = (struct coredump_params *)info->data;
>         int err;
>
> -       if (cp->pid) {
> +       if (cp->pid[PIDTYPE_TGID]) {
>                 struct file *pidfs_file __free(fput) = NULL;
>
> -               pidfs_file = pidfs_alloc_file(cp->pid, 0);
> +               pidfs_file = pidfs_alloc_file(cp->pid[PIDTYPE_TGID], 0);
>                 if (IS_ERR(pidfs_file))
>                         return PTR_ERR(pidfs_file);
>
> +               err = pidfs_register_pids(cp->pid);
> +               if (err)
> +                       return err;
> +
>                 pidfs_coredump(cp);
>
>                 /*
> @@ -695,12 +699,12 @@ static bool coredump_sock_connect(struct core_name *cn, struct coredump_params *
>                 return false;
>
>         /*
> -        * Set the thread-group leader pid which is used for the peer
> -        * credentials during connect() below. Then immediately register
> -        * it in pidfs...
> +        * Set the pids of the dumping thread and its thread-group leader
> +        * which are used for the peer credentials during connect() below.
> +        * Then immediately register them in pidfs...
>          */
> -       cprm->pid = task_tgid(current);
> -       retval = pidfs_register_pid(cprm->pid);
> +       task_pids(cprm->pid, current);
> +       retval = pidfs_register_pids(cprm->pid);
>         if (retval)
>                 return false;
>
> @@ -722,7 +726,7 @@ static bool coredump_sock_connect(struct core_name *cn, struct coredump_params *
>         }
>
>         /* ... and validate that @sk_peer_pid matches @cprm.pid. */
> -       if (WARN_ON_ONCE(unix_peer(socket->sk)->sk_peer_pid[PIDTYPE_TGID] != cprm->pid))
> +       if (WARN_ON_ONCE(!pids_equal(unix_peer(socket->sk)->sk_peer_pid, cprm->pid)))
>                 return false;
>
>         cprm->limit = RLIM_INFINITY;
> diff --git a/fs/pidfs.c b/fs/pidfs.c
> index 586af2e5811c..29299b2c7ca7 100644
> --- a/fs/pidfs.c
> +++ b/fs/pidfs.c
> @@ -793,9 +793,9 @@ void pidfs_exit(struct task_struct *tsk)
>  }
>
>  #ifdef CONFIG_COREDUMP
> -void pidfs_coredump(const struct coredump_params *cprm)
> +static void pidfs_coredump_pid(struct pid *pid,
> +                              const struct coredump_params *cprm)
>  {
> -       struct pid *pid = cprm->pid;
>         struct pidfs_attr *attr;
>
>         attr = READ_ONCE(pid->attr);
> @@ -814,6 +814,13 @@ void pidfs_coredump(const struct coredump_params *cprm)
>         smp_wmb();
>         set_bit(PIDFS_ATTR_BIT_COREDUMP, &attr->attr_mask);
>  }
> +
> +void pidfs_coredump(const struct coredump_params *cprm)
> +{
> +       /* The dumping thread's pidfd reports the coredump as well. */
> +       for (enum pid_type type = PIDTYPE_PID; type <= pids_last(cprm->pid); type++)
> +               pidfs_coredump_pid(cprm->pid[type], cprm);
> +}
>  #endif
>
>  static struct vfsmount *pidfs_mnt __ro_after_init;
> diff --git a/include/linux/coredump.h b/include/linux/coredump.h
> index 7b38ee2e7913..0bbb7de6a402 100644
> --- a/include/linux/coredump.h
> +++ b/include/linux/coredump.h
> @@ -5,6 +5,7 @@
>  #include <linux/types.h>
>  #include <linux/mm.h>
>  #include <linux/fs.h>
> +#include <linux/pid_types.h>
>  #include <linux/sched/coredump.h>
>  #include <asm/siginfo.h>
>
> @@ -32,7 +33,8 @@ struct coredump_params {
>         int vma_count;
>         size_t vma_data_size;
>         struct core_vma_metadata *vma_meta;
> -       struct pid *pid;
> +       /* Dumping thread and its thread-group leader by pid type. */
> +       DECLARE_PIDS(pid, PIDTYPE_TGID);
>  };
>
>  extern unsigned int core_file_note_size_limit;
>
> --
> 2.53.0
>
