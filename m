Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B03424D5A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822625; cv=pass; b=UKxWiE0ctr6k7YXqBqMo5Zhh0wqlkDEb/cz5TLI0tABg8rVksP0tVpaQByAQKJxMTU8wI3SbkVJSmTkXi1IeTaUOA6RYUNQERhPlTTcJcotEbWzLhKByiCPCFtCeN02If7WV2RMAdG2jZnuwyNroFdo+VhJHGQr2pOTsJu9Yaco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822625; c=relaxed/simple;
	bh=DBHBD4i87XSNXLCWnW2smU6A62RZ/Q1PR1qnDwQ3R8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dOfjUzuzS7ru9xLFooIH3ElPJf/AiD57dxNF2zUTkl/Yt+ivi0gxN0/7EYEyBhi4KPRqaR/CvJuhh0ejm+MjUKSKoIeTWoV998BkO3IxV89YXvXd9I/f6cwqJBugDpyeOv+aQbPcfap/RZem7zI0VE9UKJxq0L1WvanVn0uFogs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com; spf=pass smtp.mailfrom=clyso.com; dkim=pass (2048-bit key) header.d=clyso.com header.i=@clyso.com header.b=N/9CXmyH; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clyso.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clyso.com header.i=@clyso.com header.b="N/9CXmyH"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2531f453eeso63982166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787822618; cv=none;
        d=google.com; s=arc-20260327;
        b=rfNeoX7fsKSjBSYLwQ4rQEnNQ90PNc/0nt7Oxp4QDJZ2pK0JK9FYUgr7a0WFm3Ml9P
         3GhrLOZTTWSokqK2gl+2yG/abqSfkAJS3vYzyFry9uUmkIyJeqZDOmNdUIupi0pPrWuv
         MRDQYJc57MLgItTrWcFC4lheCGBmyEV+N+Omi8+iJ17yY6X6vjDZp5wdKWGRJF/W7ZBZ
         rpe1F0phE99z3kaL2bOhjm1x4v/bN4XBXNfpADjOlPR+pD6f8mPr4puvDWROW2hQIkfg
         BMkKhBjHCkPi4ERkJl0BTYm4+r4iOiqYnnEdO6oIP9RNGCOH7In+KW2ZezSurAJJO6GM
         rrDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Fph5DeMJCI7nJtUOB89Y9QP1q6g7bQDJlAzprLWOYQI=;
        fh=s1qt0DwQI69/lSajuXmw9jw2F2oRsqM9GqTS7vxRshA=;
        b=P03C9sUsZOkH9O9G6ADXxbcpKuOjOYSpIUHRUG193ipMFw+IFlFnupVgtiPF7c1o41
         RwCsCIqByVIeuhnwjMF7Q4E09rI6Pz3zbyeW98kFvez2cb9J5wwLKVgQbh2ASelv8SSw
         4jDJGgF4FfsWfjGhb2XVJ8QUXNHKiszc4HJokyUdmreoAMYzLDMFKq0YHHvAsgBREKaC
         b0uoK+lWcLnOxi8K0j3uLJGQrIIec+60OJ/VgdDGJhPCmTsRKuIhGNXxs1aANis/T6TG
         b68kobt2qsClw6TbcWG0sHuQf3TYCpYH3Me0xEjLywYlSOeU++nOjCbBnNNnWUG7ZA5Z
         1sfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=clyso.com; s=google; t=1787822618; x=1788427418; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fph5DeMJCI7nJtUOB89Y9QP1q6g7bQDJlAzprLWOYQI=;
        b=N/9CXmyH5ZA3yuT5sWoq6ccqE4jFAIAbKZDuYmufvz5csYrdBvAypgbiYduatTIWAH
         r+9JZ1d9Z9/oCn7vHw8hxEaHnVfvTFowEBFqSxV/mMvLuXMgvv8Y+9ECu6DMx0ldMvwf
         rrDwNy13uSIX9WCQXL31vz9UIXDnOGZNg01x7FInncPFC6kMNEiRJPtf0uU50/91Ujd7
         5j1LaTrWgqY+prhgPpQyiwuf5fDijvlTELVYj9lcYnK5lWdp4KvgLwRyxC/n2a167PHA
         F9nwX7EVvwZXFi0e92O8t7Hfr2ygUN6aZ/rgxy7SzjNEqJNDd97Jisv9/LTzAAAGm0c4
         hJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787822618; x=1788427418;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fph5DeMJCI7nJtUOB89Y9QP1q6g7bQDJlAzprLWOYQI=;
        b=p/WNxOy4QCUtOMyCNhGK/JITa0KCtHHVAl2dVh3FhVHlOzOgOQLYEAYUBNohSk00A2
         MuykhBDRtZdzOigtPUrgZvSl5jJNnq2Ag5vlLQbQGr78RZwvsByshfVhOfVv5vm1lvZq
         qyZ2ogVsNrlARv7apjTRXu0fNS3OUhKyxP7Jt53FtAlXlKczqgH2G0QFKk7JDSE84vt5
         SrUDR2NXYftdGHAHrcI0yChymhkbu8AD15a52U1TwF6niO7OrSb2v3XQSaZ0OLWobj4C
         3H6fcDqgQ9VmOuaX/hmq51iwIAuKeHNYJHZqCk3b38wS2ZFUHqDa2+GecXTKujbs4BMn
         ASkA==
X-Forwarded-Encrypted: i=1; AHgh+RqO41iSwGG9gCrssASTJprgb90sBlu4j4G3xgazhB/oIGnel0OFLymNXM+BXinmC4DYrjg9tFaIMm+Kvsk=@vger.kernel.org
X-Gm-Message-State: AFuF++m6XsduJLtgWZEkwSz6XtJI0CP6+7eylVAEfEtlyqccCpVrTleJ
	0rUS7QI01CxvDypMScosAfkWt92ra+f0cQMyWpFpzLHveqpIxvgaFhA6krdioPSO2LfZiMsByx4
	Xtvj7vOGw0ew2vTu9SqhvkBnxWmIX3KzOlts75WleRQ==
X-Gm-Gg: AR+sD11KovowmnIVqMJDRH9jfGm71VqfJNgv6apRi1O6IYW+Cn52IEStoeTUOGs6A/7
	yf5rpzMYkwuYiUnkGDtG73Lzf5XN24n8qveHJSCd9RLf6t0yJbW8oC6OD5V4ysZPi+zgIaKbbN4
	reanM8YR8ym2dRUM0c2Jm5K604OsmT9lZ4zas8mTOqQORHowRm0t5I++mm/qChPssfgkFd81p9Y
	mHvf21ZeYsS3ef9/O/Jjn04n3XgEczDW9xcSsLREqY9WCSVRpXHWZcg382dvM+UYzbHRcZJ91Oh
	pU206CZEPE+ZQ582dmI+Olihq8i4FAOo39tYXhN+onbYXwvtfUPqNGcc
X-Received: by 2002:a17:906:9fd1:b0:c25:362e:fb8b with SMTP id
 a640c23a62f3a-c25362efe10mr476489366b.7.1787822617738; Thu, 27 Aug 2026
 02:23:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824164707.225547-1-max.kellermann@ionos.com>
In-Reply-To: <20260824164707.225547-1-max.kellermann@ionos.com>
From: Xiubo Li <xiubo.li@clyso.com>
Date: Thu, 27 Aug 2026 02:23:24 -0700
X-Gm-Features: AcwNN1UwIC-FqqFXy9MiN3M9lqUGjoxGkQeIpqgmUwjYu1w1OyWgOlMiaP06l8k
Message-ID: <CAOJNxR+vqTNU-1k5tCO1XPBbaVYi+GK_X+x9M5cOtN+BFvecdw@mail.gmail.com>
Subject: Re: [PATCH] ceph: lock mutex in ceph_mds_check_access()
To: Max Kellermann <max.kellermann@ionos.com>
Cc: idryomov@gmail.com, amarkuze@redhat.com, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

LGTM.

Reviewed-by: Xiubo Li <xiubo.li@clyso.com>

On Mon, 24 Aug 2026 at 09:47, Max Kellermann <max.kellermann@ionos.com> wrote:
>
> MDS session OPEN handling replaces mdsc->s_cap_auths under
> mdsc->mutex, freeing the previous array and its strings.
>
> ceph_mds_check_access() traverses this array without holding the
> mutex.  A concurrent session reopen can therefore free the array while
> it is being inspected, resulting in a use-after-free like this:
>
>   Unable to handle kernel paging request at virtual address 003aaad64b2c8bb9
>   [...]
>   Internal error: Oops: 0000000096000004 [#1]  SMP
>   Modules linked in:
>   CPU: 56 UID: 2953037534 PID: 1253231 Comm: php-cgi8.4 Not tainted 6.18.45-i2-ampere #1146 NONE
>   [..]
>   pc : ceph_mds_check_access+0xd4/0x550
>   lr : ceph_mds_check_access+0xc8/0x550
>   [...]
>   Call trace:
>    ceph_mds_check_access+0xd4/0x550 (P)
>    ceph_atomic_open+0x138/0xbe8
>    path_openat+0xa24/0xfa8
>    do_filp_open+0x94/0x158
>    do_sys_openat2+0x88/0xf8
>
> Fixes: 596afb0b8933 ("ceph: add ceph_mds_check_access() helper")
> Cc: stable@vger.kernel.org
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
>  fs/ceph/mds_client.c | 4 ++++
>  fs/ceph/mds_client.h | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
> index 3c692ad02c85..0348e8b848ff 100644
> --- a/fs/ceph/mds_client.c
> +++ b/fs/ceph/mds_client.c
> @@ -6532,11 +6532,13 @@ int ceph_mds_check_access(struct ceph_mds_client *mdsc, char *tpath, int mask)
>         doutc(cl, "tpath '%s', mask %d, caller_uid %d, caller_gid %d\n",
>               tpath, mask, caller_uid, caller_gid);
>
> +       mutex_lock(&mdsc->mutex);
>         for (i = 0; i < mdsc->s_cap_auths_num; i++) {
>                 struct ceph_mds_cap_auth *s = &mdsc->s_cap_auths[i];
>
>                 err = ceph_mds_auth_match(mdsc, s, cred, tpath);
>                 if (err < 0) {
> +                       mutex_unlock(&mdsc->mutex);
>                         put_cred(cred);
>                         return err;
>                 } else if (err > 0) {
> @@ -6558,6 +6560,7 @@ int ceph_mds_check_access(struct ceph_mds_client *mdsc, char *tpath, int mask)
>         doutc(cl, "root_squash_perms %d, rw_perms_s %p\n", root_squash_perms,
>               rw_perms_s);
>         if (root_squash_perms && rw_perms_s == NULL) {
> +               mutex_unlock(&mdsc->mutex);
>                 doutc(cl, "access allowed\n");
>                 return 0;
>         }
> @@ -6572,6 +6575,7 @@ int ceph_mds_check_access(struct ceph_mds_client *mdsc, char *tpath, int mask)
>                       !!(mask & MAY_READ), !!(mask & MAY_WRITE));
>         }
>         doutc(cl, "access denied\n");
> +       mutex_unlock(&mdsc->mutex);
>         return -EACCES;
>  }
>
> diff --git a/fs/ceph/mds_client.h b/fs/ceph/mds_client.h
> index 0ece4c9e3529..8774c7d7d18d 100644
> --- a/fs/ceph/mds_client.h
> +++ b/fs/ceph/mds_client.h
> @@ -603,6 +603,7 @@ struct ceph_mds_client {
>         struct rw_semaphore     pool_perm_rwsem;
>         struct rb_root          pool_perm_tree;
>
> +       /* protected by mutex */
>         u32                      s_cap_auths_num;
>         struct ceph_mds_cap_auth *s_cap_auths;
>
> --
> 2.47.3
>
