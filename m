Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0350A448BA0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775675; cv=pass; b=NPBU15+3+Be9WlQ2Dmy4WIRenpo23T7ry/lDzDdjwlVtwZ8uCvzT/lV3jZv0t6qmzS2Kmy/hpVEuu5NEsdDsNChVuDH5hrC2awShOD63sT0RiFy48jsG4/eOgaHpRJ8yT3NlyROAxGveLc79hZM3rBMoZVmTNV4BF1TSnudgId4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775675; c=relaxed/simple;
	bh=2Ll82zU9YTcjyoerXCYANDbZSFwKQrbdnSaKvUSG0rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EaiFcyWoZcjTsR8JBVRk3hMtVuiiJEh688OH16jH27of8tib5tFgtV2pXF+YHTWf/P5iO0WaPeguXtcCXfQhZfpmj9iwpFyhfYf1chuXBaO3G53RpjqB2j1It6+3u0ri9/ScXtercDE6qKO4FDBJnkzoVbpTCWPJvXZMTNo9RiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=f8QQ8XiX; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="f8QQ8XiX"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9c60b9so404566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788775671; cv=none;
        d=google.com; s=arc-20260327;
        b=O253DsmZf2049ZBFw43sCy7Mq/E75cd+FVTVvZUeDFx1a79uikbM9q7GS4q92fFuK0
         JMd7Pywy3aufo69qvAOz4GViRfOH1As0geukaZjAc4Om/G7JrfRbUNtV8NZGe3VE3Yjs
         MzwO8mmaJLxXARqCu2joEEnV0FEjWsBAGtg/KOJBbLxyOz9rVBakiuj0ZLCRzeZVu00V
         Jsn9bJSL/WKTGcaYl5N4C66cKUw1BB9kYXsqRUG/hvUP3tOTStG8ibnLfVAIBr/l82re
         OyBtj/9Lz3DiRoddgBRkAjHe87855tu0+PVDZ0AVMs/sBbqZ/XT4jZTXuK+Rd+bsvWyz
         cd2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BNaEPel1NdtIe+zUUZDBwTrn792D672lVbXfid2E2LE=;
        fh=Qlp75lMo4qX4UifSMKXGxapdn9W85AhA4746m6OzibU=;
        b=oEa5E2XEOmhFINXxHb5o7b7WJN4xJLYl+2BpMsX4pb6e73T5ODdhf1PQ64ccqQsC8e
         exzuFKkU+IaAxU5bznfjPvhSzisi9bgAr9NtA3f3/5c6Z1ZU+yW1rgNE7a9jzN+MQTOs
         AF61EO74YJrsQaNAGqM63mRqTS53jozwzJK1/kcphEPGTo7UajEXuP6Azo7rsDwgSKqi
         DRLCbudqkvJcAo0dKzwTbIaqZyMQtlXtuUJdkVIdgzd0xgB4m40fAuxN8ONwXNwwoHT7
         3gBWeNk1/zcrVgcDFnpPm9vlrustfG+4hROjFePxpPgmmBEhklLGzFQ4KuqtzlZQ1pGX
         3/Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1788775671; x=1789380471; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNaEPel1NdtIe+zUUZDBwTrn792D672lVbXfid2E2LE=;
        b=f8QQ8XiX0mMbv/5/uythpObXlnDkhytxt/gKhOrPiqNNOa4Pc8Oclr5yMCj4w2vL1g
         n3OOfAaIaF6otWkrmwzZai/GAvvMCzTL/wp5sTRxZuz8Wx2hiS0JW21ryXt9HCAqLv+h
         ewYbMFqbwMw+OFrLBEuKDknPWE36bb0LGznYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775671; x=1789380471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BNaEPel1NdtIe+zUUZDBwTrn792D672lVbXfid2E2LE=;
        b=cIbFZ4NZErxnDuutKTo2wwi2YhhUbghgGABVCK4F+juBYpuUmeHnGoznt18LxFYPsR
         7S5SLZmGraXbt9p7ouYoB+nv/s1pLJI2GsZp5IseTOvGql4A2QMCA9DgNSk4Wy4SwtjJ
         IXxwPA3VbJTzeAkp0GtBE45ZMoSV3DpO10fXp8dfyTZ3/7elBrIM4Iwgu7J2R0HO3ouW
         cKnjwi62UITt+JHr36ApZpkAr/QIfr7hhuAgEVjxVvCIEzJyOWtiI6/XAuaas+WoXttP
         PDAPO1DTRzLkkarx75KC31WzZ2F556o7HrYoQB0iAJztKeTw74rkPvQ6gi5e0WHrunk1
         gJ8Q==
X-Forwarded-Encrypted: i=1; AKwUvByl0VfU3OM8h/o4Osg30Omtrm6TOWPdjU8G2XQZQh20Khbj345VRC9GOYsJ3JPufRdGP+mS7xug7nnFXQA=@vger.kernel.org
X-Gm-Message-State: AFuF++myLo+g2TVOyap+v068Sc7IPa32H+wzQX2lPypxCkZTDGIicz2s
	6YUhdELpy7dLrx6wTVyUczFqjJWUXW7pDbZC1HakxBSjYAaOZuqitXwNrogoWULHattDs7g+9Zl
	Lk0FPD+jc5A4o6t4ErQSpq2pJ36WSjHFq3LKEG6gnWA==
X-Gm-Gg: AYBFou0b+g0ACK0rSky20cjYaA6KmaT4rStetcdDB4pPwivxCVLFE3180qhyAQ7Mn+G
	xYGYej0EMfiBL4GsH+CsU5n32G8i8hvrmUy4DAgXGCGT48zL5+jjCVZIh/9Oz7DNICQRLR2KnLV
	TefEUN9YTKCTcPnhHA2RPXJ71WBkBAdNl/t6amCeOSRgIG+b/dfGq8rCbo70ar7GuadP8SJ0O33
	AvtN34/xNKxvqbWUNNi5On0Se/L2drWIl1k8yhw8h1XQ0C3AbX+lRaxHU3bA7kn4U0B5fYvLB+y
	GyLkH9Wbu79XcGgCwAb1Ykj5jAgDWkHqinXG/o1Qhv4nLbYQssMMOF8IiJhv8r+aodRjKky/vlU
	8
X-Received: by 2002:a17:906:f597:b0:c26:3377:752b with SMTP id
 a640c23a62f3a-c29042b7343mr2628366b.3.1788775671134; Mon, 07 Sep 2026
 03:07:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-work-unix-passpidfd-v1-0-70cbfda0c7ba@kernel.org> <20260831-work-unix-passpidfd-v1-1-70cbfda0c7ba@kernel.org>
In-Reply-To: <20260831-work-unix-passpidfd-v1-1-70cbfda0c7ba@kernel.org>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Mon, 7 Sep 2026 12:07:39 +0200
X-Gm-Features: AcwNN1V7LPSWnyROmwcXNgMOTNDk9p2-2d_HjS0RFfSlm_TayeYshLabGwoOGk8
Message-ID: <CAJqdLrp-5zkpUOzA8WeAyTq-KqQ0f=BERy0PcniSmXYmOJ2wZw@mail.gmail.com>
Subject: Re: [PATCH 01/10] pid: add helpers to operate on a struct pid array
To: Christian Brauner <brauner@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mo., 31. Aug. 2026 um 13:21 Uhr schrieb Christian Brauner
<brauner@kernel.org>:
>
> We're about to extend af_unix sockets and coredump code with the ability
> to hand out thread-specific pidfds. Add a few simple helpers that allow
> to operate on multiple struct pids up to PIDTYPE_MAX with automatic
> bounds checking.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

LGTM

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>

> ---
>  fs/pidfs.c                   | 16 +++++++++++++
>  include/linux/pid.h          | 53 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pid_types.h    |  8 +++++++
>  include/linux/pidfs.h        |  5 +++++
>  include/linux/sched/signal.h | 18 +++++++++++++++
>  5 files changed, 100 insertions(+)
>
> diff --git a/fs/pidfs.c b/fs/pidfs.c
> index a6a643f15d08..586af2e5811c 100644
> --- a/fs/pidfs.c
> +++ b/fs/pidfs.c
> @@ -1070,6 +1070,22 @@ int pidfs_register_pid_gfp(struct pid *pid, gfp_t gfp)
>         return 0;
>  }
>
> +/* Register the pids up to pid type @last of @pids in pidfs. */
> +int __pidfs_register_pids(struct pid *const *pids, enum pid_type last)
> +{
> +       if (WARN_ON_ONCE(last >= PIDTYPE_MAX))
> +               return -EINVAL;
> +
> +       for (enum pid_type type = PIDTYPE_PID; type <= last; type++) {
> +               int ret = pidfs_register_pid(pids[type]);
> +
> +               if (unlikely(ret))
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static struct dentry *pidfs_stash_dentry(struct dentry **stashed,
>                                          struct dentry *dentry)
>  {
> diff --git a/include/linux/pid.h b/include/linux/pid.h
> index ddaef0bbc8ba..87635d0cc1f7 100644
> --- a/include/linux/pid.h
> +++ b/include/linux/pid.h
> @@ -2,6 +2,9 @@
>  #ifndef _LINUX_PID_H
>  #define _LINUX_PID_H
>
> +#include <linux/array_size.h>
> +#include <linux/build_bug.h>
> +#include <linux/minmax.h>
>  #include <linux/pid_types.h>
>  #include <linux/rculist.h>
>  #include <linux/rcupdate.h>
> @@ -92,6 +95,56 @@ static inline struct pid *get_pid(struct pid *pid)
>  }
>
>  extern void put_pid(struct pid *pid);
> +
> +/*
> + * Helpers for arrays of struct pid indexed by pid type declared with
> + * DECLARE_PIDS(). The array covers PIDTYPE_PID up to the pid type it
> + * was declared with and the helpers take that bound from the array.
> + */
> +static inline void __get_pids(struct pid **dst, struct pid *const *src,
> +                             enum pid_type last)
> +{
> +       for (enum pid_type type = PIDTYPE_PID; type <= last; type++)
> +               dst[type] = get_pid(src[type]);
> +}
> +
> +static inline void __put_pids(struct pid **pids, enum pid_type last)
> +{
> +       for (enum pid_type type = PIDTYPE_PID; type <= last; type++) {
> +               put_pid(pids[type]);
> +               pids[type] = NULL;
> +       }
> +}
> +
> +static inline void __swap_pids(struct pid **a, struct pid **b,
> +                              enum pid_type last)
> +{
> +       for (enum pid_type type = PIDTYPE_PID; type <= last; type++)
> +               swap(a[type], b[type]);
> +}
> +
> +static inline bool __pids_equal(struct pid *const *a, struct pid *const *b,
> +                               enum pid_type last)
> +{
> +       for (enum pid_type type = PIDTYPE_PID; type <= last; type++)
> +               if (a[type] != b[type])
> +                       return false;
> +       return true;
> +}
> +
> +/* The last pid type an array declared with DECLARE_PIDS() covers. */
> +#define pids_last(pids)                                                        \
> +       ((enum pid_type)(ARRAY_SIZE(pids) - 1 +                         \
> +                        BUILD_BUG_ON_ZERO(ARRAY_SIZE(pids) > PIDTYPE_MAX)))
> +
> +#define __pids_last2(a, b)                                             \
> +       (pids_last(a) + BUILD_BUG_ON_ZERO(ARRAY_SIZE(a) != ARRAY_SIZE(b)))
> +
> +#define get_pids(dst, src)     __get_pids(dst, src, __pids_last2(dst, src))
> +#define put_pids(pids)         __put_pids(pids, pids_last(pids))
> +#define swap_pids(a, b)                __swap_pids(a, b, __pids_last2(a, b))
> +#define pids_equal(a, b)       __pids_equal(a, b, __pids_last2(a, b))
> +
>  extern struct task_struct *pid_task(struct pid *pid, enum pid_type);
>  static inline bool pid_has_task(struct pid *pid, enum pid_type type)
>  {
> diff --git a/include/linux/pid_types.h b/include/linux/pid_types.h
> index c2aee1d91dcf..3302690a2a28 100644
> --- a/include/linux/pid_types.h
> +++ b/include/linux/pid_types.h
> @@ -2,6 +2,8 @@
>  #ifndef _LINUX_PID_TYPES_H
>  #define _LINUX_PID_TYPES_H
>
> +#include <linux/build_bug.h>
> +
>  enum pid_type {
>         PIDTYPE_PID,
>         PIDTYPE_TGID,
> @@ -10,6 +12,12 @@ enum pid_type {
>         PIDTYPE_MAX,
>  };
>
> +struct pid;
> +
> +/* An array of struct pid indexed by pid type, PIDTYPE_PID up to @last. */
> +#define DECLARE_PIDS(name, last)                                       \
> +       struct pid *name[(last) + 1 + BUILD_BUG_ON_ZERO((last) >= PIDTYPE_MAX)]
> +
>  struct pid_namespace;
>  extern struct pid_namespace init_pid_ns;
>
> diff --git a/include/linux/pidfs.h b/include/linux/pidfs.h
> index 0abf7da9ab23..3c1e82f1a369 100644
> --- a/include/linux/pidfs.h
> +++ b/include/linux/pidfs.h
> @@ -3,6 +3,7 @@
>  #define _LINUX_PID_FS_H
>
>  #include <linux/gfp_types.h>
> +#include <linux/pid.h>
>
>  struct coredump_params;
>
> @@ -32,5 +33,9 @@ static inline int pidfs_register_pid(struct pid *pid)
>  }
>
>  void pidfs_free_pid(struct pid *pid);
> +int __pidfs_register_pids(struct pid *const *pids, enum pid_type last);
> +
> +/* Register the pids of an array declared with DECLARE_PIDS(). */
> +#define pidfs_register_pids(pids)      __pidfs_register_pids(pids, pids_last(pids))
>
>  #endif /* _LINUX_PID_FS_H */
> diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
> index 584ae88b435e..9444b47789a0 100644
> --- a/include/linux/sched/signal.h
> +++ b/include/linux/sched/signal.h
> @@ -677,6 +677,24 @@ struct pid *task_pid_type(struct task_struct *task, enum pid_type type)
>         return pid;
>  }
>
> +/* Fill @pids with the pid types of @task up to @last, without references. */
> +static inline void __task_pids(struct pid **pids, enum pid_type last,
> +                              struct task_struct *task)
> +{
> +       for (enum pid_type type = PIDTYPE_PID; type <= last; type++)
> +               pids[type] = task_pid_type(task, type);
> +}
> +
> +static inline void __get_task_pids(struct pid **pids, enum pid_type last,
> +                                  struct task_struct *task)
> +{
> +       for (enum pid_type type = PIDTYPE_PID; type <= last; type++)
> +               pids[type] = get_pid(task_pid_type(task, type));
> +}
> +
> +#define task_pids(pids, task)          __task_pids(pids, pids_last(pids), task)
> +#define get_task_pids(pids, task)      __get_task_pids(pids, pids_last(pids), task)
> +
>  static inline struct pid *task_tgid(struct task_struct *task)
>  {
>         return task->signal->pids[PIDTYPE_TGID];
>
> --
> 2.53.0
>
