Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8090941A8F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883254; cv=pass; b=OTlGnFWbfPqghw8FweshV0HtLUc3S/N1O018DlCITzmfwGtcQX0cxC+X8hLObQA4xXVruQQWQq1agntj9idbCAIY1lrSQS/YI5MVu+blW2jLoTMSXB4fyw4o6xJrQhSOe6GNjMVP5RGJudO/kc7RDVJt3hjTLk6YuoJ+DXDEI3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883254; c=relaxed/simple;
	bh=JvpGORMbN0f3B0RLWaA7oEm9RnNQKxZ8y3nKuSFivAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVPz5XKJRAeUtTVNOHWduoB7ElQSw8mpoPJP2J5SWmNOtGsoOi0oq8vMHXwxEXaOCYkRznGBeP/r32hl0iEnSgiEoGl+6VfkoN5PkCmr/zZfiJa49CGCpARhi2LyAIrRgivb5kf8KR5DuhbGN8F09g8ioYSLS8olgorXI/+h8og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=vZOhEZ8+; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="vZOhEZ8+"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d4eb63f16so6854437b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883251; cv=none;
        d=google.com; s=arc-20260327;
        b=ZkwWoKM84Wms0bmcTdTQF7jYTqRhBmb77Z+5sPpRi7orvCOOQWBulDJgNt1lOeYp3l
         DTGFxAYYEb6oQMyE3p5FRq2WBfKJ/4U39CedhLrB/JQHrknfIM6uEk3cyfA9rw8Cmng4
         O01dIuytrKMBn0rhjyslEK65btc+DVSEqFYFAb5UluF0t4OQ1GIGxyDVx3tdw2PetuMt
         E7YAWDeKBw/lJEcQa/vmbBV86b/5j2z5zubGIqvLCKNhx+T42Zy0DZDhBk88fw5AwiUl
         okPDbATP1kFTt3R0mlbsHac9E39Vuf3MrcPbcnTczcHVGq+tGPj9E+kBbELLaRxwFNtQ
         heiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zLFcLibqgpv9VVaA1mPgIouxF6jt57E+rWme6slCmhY=;
        fh=yUkqO5f8vfRwrZhdra+LwzXLh3tAM7f5iqEF6r+Shjc=;
        b=B4Lbn+uCh+J4htEzchX6fOKmW6K6CoNT6YNjMNOlXrzsFPuFuuWpCpHKkxfvhO7VfX
         M+UaZlC2NZLFISXCj+SSRFwLdbW0ooxlCpuJJm697RA90egP71RQHzzEuO6iJc/o7+zM
         KSGci32JejMw70fvBeSJl9fcJYHKEiuz8es9RYAq2GJNWeL9IY5qBeVjJiCr5adGCoPC
         qPVBTjKyc9WJsWKUX3TLl736EqI7VgC3ypAe3HY7iAhNA1M4Hvn7o+vRWXVufBNqM0es
         HLKKpTvSvtfy+NMxSEn++MfGXkG8q/EvruzLjon6rnSJBVj8EgWoAPlQaxHfsZusu77B
         EfkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788883251; x=1789488051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zLFcLibqgpv9VVaA1mPgIouxF6jt57E+rWme6slCmhY=;
        b=vZOhEZ8+UPsUYTdkRGYnGllympBUNzxLqElgR3TB2eHBw71vVOrqGJCbXF8YIKEKaZ
         Si5imTk0K2anAAiVmi6+sxAHX2Hyd0FwBYbw7y0msv6adFxpyq3ifAxFj3082s1A/ojo
         LJDeFyfk5ojnuQHc7U/PqVB+aDHoJjCvAfjNvtoDfKk8mbm0NpD2CDeAT8e4uO19bzNd
         KB3w0oGSL/0MjspmXRZEe3S7q/uHJUgZiQtiMo918TWP/BbWzPMTjoR5E6ezXFX38F2e
         Fi6NAufmdBm4hh+gVvd71hZrXmuSndXYb3s6b0qVC/G8Z7lavhzRf7CdD637qLG9h4Mh
         mw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883251; x=1789488051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLFcLibqgpv9VVaA1mPgIouxF6jt57E+rWme6slCmhY=;
        b=WlUybohEJqpPmQlg0xW0NNwj3fwDNcWi0FleVQdKxOoQI7yaBdenA8tSMkoiS5IcMj
         aYdd64oFUwxPWtgjvwa+/FIsQFa9wjtRSegp3pBhny8SQMf+aaaRfnRmwupEqAcdnhOR
         YDr2XekLafP88nxexlaqIR5HQ1jxVUz7/3uJ9eoErzwRWpnRlUjIOmRLQ0ecRQyOxzU+
         7d8MuPrE8J4LHCon/ohWQH4bWmCDkgsmReyut/3QXaLKJdZ8PDHX0rrHhkPzLSTQ7OXE
         I/543W0+BIsgnm3wqck4NH01IgUIgF5iTkn2cyZto7vWsVK/yQVrS6eEiPF2kj7dlood
         30cw==
X-Forwarded-Encrypted: i=1; AKwUvBwfa2mwAa7nHzEGlidtWIUBBmRqsSsURwaouyhYb8QfS9iX1fAfP4rJU1vpmSd29/GGQQ25GaYt6amSn0E=@vger.kernel.org
X-Gm-Message-State: AFuF++kFf8cmh4Bw6gJpzojeC9S1RFg8IHDJMkUFZGUpAXtJv5UCQvGt
	+tb182Eoy7YkKgs7YqDXcEPC6fF4YGdnrMvwC09meYZpEU2/w4EU9YJCILxBBq9nezFiRizoWLl
	apwapeFXidx8lENZtS4vqGCZtyUkOyKLrl8V5BHWU6g==
X-Gm-Gg: AYBFou3iPQbhGrLStstH53G8lnYMgc6pmtDtf4du0dt7F3py4o7CdIC+ed52H4YAwSG
	vABPoft4hVklhB8K/g0JGtb/HMYBpFMX/kltFh4yNRvbv9Rnv6bsN6lCLQ7sPtvOMmca4bqncrR
	V6IYzGAzkQeT6KKS2J0iY7fEvL9ZVEvwQM9nSeE5MaRJLLQap6o9h+26IuFpi7TxSn64a35j4wI
	iAVRQVOC37POwTxbdH3My1nL9L5A2xOgbaEVNNnmviNzgp17hLVhMAWm+iJl6KmL4vVww50TQA/
	ZAYSOsnAJzWBr+YYMYI48iRHkQLcuQnKXE+5ZvLhywKF
X-Received: by 2002:a05:690c:6610:b0:81e:d001:e0ca with SMTP id
 00721157ae682-87c0cb08accmr20725467b3.17.1788883250501; Tue, 08 Sep 2026
 09:00:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902090220.16395-1-liujing@cmss.chinamobile.com> <286de7d2-3750-4a44-a8e8-7054c8cf51d9@linux.dev>
In-Reply-To: <286de7d2-3750-4a44-a8e8-7054c8cf51d9@linux.dev>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Tue, 8 Sep 2026 12:00:39 -0400
X-Gm-Features: AcwNN1XfVvWGsgSwn3ZqzKUvYXDqD4jVjYsyRGGjLTX1m5l-xdM6zw6YWnAE0_o
Message-ID: <CABFh=a5no3rKs-AzBNyTXUCP_DogzdA00_EMvB0y8ewERS6M+g@mail.gmail.com>
Subject: Re: [PATCH] bpf: cgroup: fix null-ptr-deref in __cgroup_bpf_attach
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Liu Jing <liujing@cmss.chinamobile.com>, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+1, this patch implies the error is possible which afaict it isn't.

pw-bot: cr

On Wed, Sep 2, 2026 at 5:41=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
>
> on 9/2/26 5:02 PM, Liu Jing wrote:
> > In __cgroup_bpf_attach(), the expression "prog ? : link->link.prog"
> > dereferences link before validating that link is non-NULL. If both
> > prog and link are NULL (a contract violation by the caller), this
> > causes a null pointer dereference.
>
>
> Both being NULL is unreachable, so the new check is dead code.
>
> It's meaningless.
>
>
> >
> > Add a safe ternary fallback and a NULL check for new_prog before
> > it is used further.
> >
> > Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> > ---
> >   kernel/bpf/cgroup.c | 4 +++-
> >   1 file changed, 3 insertion(+), 1 deletion(-)
> >
> > --- a/kernel/bpf/cgroup.c
> > +++ b/kernel/bpf/cgroup.c
> > @@ -814,7 +814,7 @@
> >       struct bpf_cgroup_storage *storage[MAX_BPF_CGROUP_STORAGE_TYPE] =
=3D {};
> >       struct bpf_cgroup_storage *new_storage[MAX_BPF_CGROUP_STORAGE_TYP=
E] =3D {};
> >       struct bpf_cgroup_storage *old_storage[MAX_BPF_CGROUP_STORAGE_TYP=
E] =3D {};
> > -     struct bpf_prog *new_prog =3D prog ? : link->link.prog;
> > +     struct bpf_prog *new_prog =3D prog ? : (link ? link->link.prog : =
NULL);
> >       enum cgroup_bpf_attach_type atype;
> >       u32 old_flags, old_pl_flags;
> >       struct bpf_prog_list *pl;
> > @@ -833,6 +833,8 @@
> >               return -EINVAL;
> >       if (!!replace_prog !=3D !!(flags & BPF_F_REPLACE))
> >               /* replace_prog implies BPF_F_REPLACE, and vice versa */
> > +             return -EINVAL;
> > +     if (!new_prog)
> >               return -EINVAL;
> >
> >       atype =3D bpf_cgroup_atype_find(type, new_prog->aux->attach_btf_i=
d);
> >
> > --
> > 2.43.0
