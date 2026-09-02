Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DEB37204D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333343; cv=pass; b=ijWWTInzDNiHtSko+ilgLy1cDmNfWQtk/n6j80Je83r1tL4Or5qHL/0RgTNGGswVJDAglz0v4lmCsfHmF0W2w1/FcbF8UuebS/ZJqLmBoD4OSPA0BCuPy/MCFnNgzc3UAS9q/Nu7+eXO+3B6Tnl7nnSH7GEkOr98ltNR0C8TUHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333343; c=relaxed/simple;
	bh=0G7LsLuaoP9w6YDvNw9R0iIYY3icFbQ4tzpJEWmCVMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sWndbK7e2JvAah/mllMrJkAy9gfdifYxRbtxNQuq+VflU+XdO22Nz6KH5VYyhOP4AE8o5xyv1TRaN/78NiibAb+cIBbaQ7n/idyEP6/aqEoFUCtBW6eBDHO9h1eveK11oSImVSmZfUs/4fjfK339vsszpp/BhW9JOz9A5ExBhI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2T4QIfW; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2T4QIfW"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66f96e5b550so228097d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788333341; cv=none;
        d=google.com; s=arc-20260327;
        b=DZYT0Hpo6Xb3PczHg/9+A16T+bi69hF4Fg7PlYaF5Co4/nty5Uc06wKHdiL+xHMXq2
         ZCIvRs/vNM/K656wlvDhtiMZ704aSGhsJzpT9xijUl8VNfaBriKjizKdEb/bpIOKycm8
         RAXQ/tJVCL4AIF4mdUrU4eedQNIasxempyJTnZmh5tQm10CrHfz6VeC5+KX/VkO1Lp5/
         R+KAMlqYHN82tW9w1FNKC4G73mOGieh/BDQnfOSIFq4Sm4oQztRVs8x28iwE2Q4N9Aa5
         8HEAyYlijz/lXYsD6uiNL0kf39iI4PDilqE1/ZE5qbIfX/DlbWX6mkwsIf1LOOE5ssYt
         NYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NpXY1fG/hF2KYSdT5yF/Ko9Ye1GpyobzYyJewmIqaIM=;
        fh=f2RIPfGpl1iFuFEuzxdGjQ6C70rJ5BVLDzXcI+p3uuQ=;
        b=mLBs4N4yEanRvsmjUNdUGvzFFQpUYfYxNikw0XwbT9pbUVuQUW1Mt3Ec+yohAhp3Gq
         vxTLyElBHF9RW2Nd7gGzBRFnxwCLKwgIz0pLNtSicpiXad5oowXhyK4Le1jR8ZUAU94H
         rydBOW0DAwUvJFocwssjuifDWs8NhAfGyMArpqTNuVa9yqkoj8Ej5hvsSN7epz/+x16w
         kF/xxB0CDhLKTdLofU3kQGM5mpcd0PFJqUpnFJzaLOmnlXOIee9SntnlXyjgN9Mj9CNB
         W0taDimRZcr6UG/hPY03zIxP0keMcnQLWZU2BxAYOMRoeDYsnfgqgESgME9O87hv9wJB
         RTkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788333341; x=1788938141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpXY1fG/hF2KYSdT5yF/Ko9Ye1GpyobzYyJewmIqaIM=;
        b=m2T4QIfWz2+tqB8tCUoAb5vpjjNtIRM7tGzCrJ7vBaMX+Haob6PNTgRcaZyjOqtG7k
         zOgXNGKQSBbHm9YFeB2ZhbTR64/ZubWOb2pSrj+pE89uzuFW9pfQX2WISlnx9Vtoq44k
         h8/aplMVaQ/t/sWRsee3RcDycenNmOVuDz5qVXhx3d/FnQVJrXxiSxnUZqpLpScGEXrm
         F8YxD5XdzS3B0QDM/tDT6sulEH+GdgmQk2yi2ER3P0YRd9FzlRMtVs3PGcbR8DL7x0Hc
         dRaClwSeFXSFQ6Emr6bBL/UxJCp70aihZUTJZyS4MdYFJEekY5DI1biJDMuyYauRLpFK
         fZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788333341; x=1788938141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpXY1fG/hF2KYSdT5yF/Ko9Ye1GpyobzYyJewmIqaIM=;
        b=MwuvT/tq1Pxzh1L9BZO/QWbmrIvNRYfQbHC9LXet8TrUxFmMzRU6s6UBLCGY5tadT9
         56k2tqmYNRoS+t/4cEjXO+LRZ4JtpqmhdH4LzHQD90APCWJoLZOWcymx9UiyLI6i3Ft/
         EDZMpTL8+ZaiKKqcMpEK4DM8AX+lEOVhTNvd3ZTnlwgYlUwlRUkeh6w2d7FhaEiuYA9R
         qdrQ+SQUocP0bt5q/3t+G+A7XgD0/KZdMYo//s0vjtza2UUPlN16CHxIFSuPkrM+ZvmD
         hstY+YG3P4qVtDZkNxYx7FcNuoqAd7VZP6YUK3FLX2VP2FJfPbNAzHuiKJBijLU7kjSF
         zBGQ==
X-Forwarded-Encrypted: i=1; AKwUvByEysZk8LxoXf9qJynZLgcNXNfVsZXAHouw5OtE8rlZu4QWJUf9YezxiHdYhOWoj8W+7gvQ3fed3dVUP3c=@vger.kernel.org
X-Gm-Message-State: AFuF++mhfPJgQGB9gR8StqFyPi7HCAGc3RdqQ4h9Nfi9kW8+ooEpP8gc
	l7q4AqG3l2AEEtmeChQ0OFc9a/m9ekqgALYo1Ciue3re0FdL5ipFH2xZbEgyrCZKb4YwVABdLTp
	pqUhYNAPVw1/OaQTxEnhOVBJhVxN8S7Y=
X-Gm-Gg: AYBFou1nSSg//Ah6gEdL1HaH5n2EKFpA8sfAPxm5s6Ha4xyO77+74nsMxScd/CtxWDN
	EQA+iQyvzpYfM0vm8J3TdQ1UNzrKuZL8m2IXPSwyL9ytX/o8ELLt9lsm6zGOorTwTA2375mOmTU
	+r2pN2DEbgwfdWdL2BHWD/bR1nS+E8DPzQP5WlNd11xO1Oe8QlEOdIrq9buOTzEO5IqEVQmRs0r
	Mc7nJ2jAoY//dkIhjdWDkQjzPAo8+BLFjHM7JclnuRmwjPxxf3UlJO7SX+FaFWtdDlFTTPFAkoQ
	jKUR9VwThahEGQCYegmkpbccFtK+q1TuwlPP9KxOGVKizTUObP5TDt2o74yRymbwbsA5LU7wRXx
	rT8d6gqp5cCQZ4Rjm33m1Otbl153fk5PLVOQ=
X-Received: by 2002:a05:690e:428c:20b0:66e:53f6:14ed with SMTP id
 956f58d0204a3-66f9b8e8ef4mr813726d50.11.1788333340929; Wed, 02 Sep 2026
 00:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901014829.3504342-2-sanghyun.park.cnu@gmail.com>
In-Reply-To: <20260901014829.3504342-2-sanghyun.park.cnu@gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Wed, 2 Sep 2026 15:15:30 +0800
X-Gm-Features: AcwNN1USx_9Bx2w7VYwX5R4OwFihkl-WbQLEy5h86ML1H5yODg3TCGcOdS_e28k
Message-ID: <CABFUUZHSLiNg4rMtATXeNoCju899huVsf-LMjtyDumYk4nHZcQ@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Fix program BTF use-after-free in sleepable programs
To: Sanghyun Park <sanghyun.park.cnu@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:06=E2=80=AFAM Sanghyun Park
<sanghyun.park.cnu@gmail.com> wrote:
>
> Object kfunc calls embed metadata owned by the program BTF. A sleepable
> program can remain active under Tasks Trace RCU after its last reference =
is
> dropped, while program teardown releases the BTF through ordinary RCU. Th=
e
> invocation can then dereference freed metadata in bpf_obj_new().
>
> Move btf_put() into __bpf_prog_put_rcu(), the callback that frees the
> program. When teardown is deferred, that callback runs after the program'=
s
> own grace period (Tasks Trace RCU for sleepable programs and ordinary RCU
> otherwise), so the BTF outlives every active invocation. The non-deferred
> path invokes the callback synchronously, so load-error cleanup stays dire=
ct.
>
> Fixes: 958cf2e273f0 ("bpf: Introduce bpf_obj_new")
> Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
> ---
>  kernel/bpf/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 6db306d23b479f..3b6cf93c43c4d6 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -2438,6 +2438,7 @@ static void __bpf_prog_put_rcu(struct rcu_head *rcu=
)
>  {
>         struct bpf_prog_aux *aux =3D container_of(rcu, struct bpf_prog_au=
x, rcu);
>
> +       btf_put(aux->btf);
>         kvfree(aux->func_info);
>         kfree(aux->func_info_aux);
>         free_uid(aux->user);
> @@ -2448,7 +2449,6 @@ static void __bpf_prog_put_rcu(struct rcu_head *rcu=
)
>  static void __bpf_prog_put_noref(struct bpf_prog *prog, bool deferred)
>  {
>         bpf_prog_kallsyms_del_all(prog);
> -       btf_put(prog->aux->btf);
>         module_put(prog->aux->mod);
>         kvfree(prog->aux->jited_linfo);
>         kvfree(prog->aux->linfo);
> --
> 2.48.1
>
Reviewed-by: Sun Jian <sun.jian.kdev@gmail.com>
