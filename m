Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005AB37267A
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 03:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791083679; cv=pass; b=HsupZkCaNFcZvaH8Y0BnPlIqF1bBHthGozY7YfL1eDIYgVOvKNVKWnhwKdBgkJrX76WxJxgWL7gyojwxkzXqZ8DGiIjz30Elooaxfuujj+/zzwP4LzrWleZEvm05WjQUkcnazhnc/8//tmkRC8+/CvWLVKVX4SGK8HoKWgT188I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791083679; c=relaxed/simple;
	bh=sl/5kpdqq7oCS/615jSGKDB2QHShvcfRBobxTNn2gwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kC+RuC9oG8AqVBtBv5T96pnd34IQFMLm/16Xs8Jw2Y7+6ix/8V+EAAiQ1xgCofSAye6zRd05fPXCKUuoq7HgebsTLMd6EJcyabmEZcNsAJEcy2t3tLzJoiSmOCpqBltsZudRcblbAiBR3gu5eNyCgeq4oLKGlCzAOHQAhcXD3GE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZecpqE9H; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZecpqE9H"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso5502525e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 20:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791083676; cv=none;
        d=google.com; s=arc-20260327;
        b=d2mhjl0xfil64lT0Z6EerNZwofFx+6AkDOhilTc+JbxTlpSiHjj7+L2eFmhpPShWj6
         yyHpmjW6D0fFZzL2DxYlZo2KbACVtrkv6ninQHVDufAJ6TyEKNrVeH1/JxrSnYjUqR6/
         BPk5LUYmt4tume2isuwt3AT5rT2B0g3rhyGUi05wCaR3cW6V5RGaSoUiEel1rBfpTsNK
         XAho4RlCork2BAmK8cIkLFQTPJW6y2b+rHog9ABzzWhZeTiumk0+jn7vmhVSRE2d24k7
         XcaLxsAvAt/PwlrPW0kx0n7TrFvpL9yJwshunhfNKl32PPZzysgUk+KbDLrcMPuXmQiV
         4JEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yGWaceVkz5Xz8qhNjYwI3DguvqbsK6e+q4JRbvgjBo4=;
        fh=l6gF324suoZzyK8wSJYBLxBU5ih5Ksxu7LF8SzUTrBE=;
        b=YjeY/I+3JOwnIHJdS5dxJdY4kfTgsE9oC6QVDdQ+Lc7Wtd18yz2P0roY3iYb2iXkAQ
         lQaISq8pR2mW+w+Zxys2Z9gZsw6+1fQOgLqtVdXr549oFRhzkEW8A/zvUDoPllcuQd4O
         cMTJylQEg0pqa15UFS8or3apOIU9O9gjIJn9GfM/Vhqqu30Bgjhk6k/8KBB6WxEkG23A
         7OcNHpGtz396CNn/b2PNfhr1eyNjTEWTQuOIZVZD3/POVwJytvXHU6pzns0EhNJtun2M
         VtZ4Nddf1ZV8N3KNCNQs/6tobHRkvrwURvf9p47VvhzGXRw7aytqgCuwaqqAj/cZNEud
         D2Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791083676; x=1791688476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yGWaceVkz5Xz8qhNjYwI3DguvqbsK6e+q4JRbvgjBo4=;
        b=ZecpqE9HlIpfix9FJ1qMZ9KtHaQo2hj/2rX4WyAtuI8aSv/Med/aWpRlfEsbx+3k4V
         m2sYuC+hnlGYLPePYUhne6TSLHiei+ZEwhZKBHR4S/DjghkK6rNtKqIHnWVgqgpuS8Iq
         s8U902Nq2OW+HVR+hMLLdTUGUhlHJF9FcZrdVE4mtOb/XOCARNfXpKY9ECWKSr/3lQNp
         u+QN7Hkoos1HM/ILUqA8Gk4g32XCuVi49wFA7+fX1X12uSm41vicDgSA1Ego05GCngsj
         CSa6I1QAK2A3RDxn9wE0FriUiygw9xZ1rsA4WIYwWCbI50JYvle3ohCE+BFiLgjYB7/y
         Bl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791083676; x=1791688476;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGWaceVkz5Xz8qhNjYwI3DguvqbsK6e+q4JRbvgjBo4=;
        b=Xh8xSMsiY+1JUTjLVJ9HyZ7T4FOdNTMZn4fPSFhVH8poXGZqwoENr4anlvucueF7n3
         8A/yl+wmygjSRVG/nT2myjOwdk/VDvRv6qXtixiJ2a4Gwi/cVx/mK6wZeJL6qXVnKGgl
         fLN+/9sKsdpcz690X3DtF6sr6r6vzVih1rN0x/+5CNgxVV1lT9SKNwa9VjHdKtb7/Ph9
         O+9dittkv7j/OCvXQHG8nKbfXkiw7ex3ytd5hQaTSfCDsrPTDCbGjrEuqsWx4Tt0a3hM
         ONSFlWuMU7ovz7twi8fDdIcVkCv2a9IdNv8pFFaguV334QR6PQlWqXWLO3OZJkdjhq64
         B7hw==
X-Forwarded-Encrypted: i=1; AKwUvBwpon/fSCk8eLicO0E+grAI8agDob+UUS7IhOnP2RDCVnjq6t7M6oxOTwuZ4OHfTntYCZig7vOKegb5do0=@vger.kernel.org
X-Gm-Message-State: AFuF++n8+uRFO/a3DXhNcdEV1KHUF4Tbb79UfmA2JOt5IRqBZ/0Gndsb
	QEGqgfJdZJgg9XDmbfj8JJB6WhW6eXEP4NnN2hIbkOaJXUh2EYaGlfjbLyDm9PHvWsYGAJrE5wn
	2HD1b62q4mf5zXPuP7KNGMEYpkLdhLyg=
X-Gm-Gg: AYBFou0Tp+G3vF1WBbEmjnSuv2zGrNLKmjlsv8kjvrfaFIiIkC9RyyuZ1HmGmr4C6ZP
	EyC/I7SqijtrpRKFg0n0NhI/Mcjlb62xlRg4ejYPBYlfF6nvudDuRFFuDyGSxiueEVrrIawjiYY
	ZZdMWuuXPoQxZnOk6D2CpgKqVQ0Aj+z/pi6bm01VtSzZGoT8XdtvFALcyYtFIw64geQz3aHqfAT
	sjioRj2GW/JEa8ZJ6fEf1va0yYtK/IwlpUs0gk69Zl0bINLTZJKDS8yQHUIR8TywhgIcB2NlMH4
	aknbTSK/JRtxWh4wyGOrLOamVAY5aXjSrNFeaWIuqteV0KLXpeu9v0xVIDBRSNAMi9jpAcMTy41
	TKzraxaOgIbGmwg==
X-Received: by 2002:a05:600c:34c2:b0:4a1:7093:40c7 with SMTP id
 5b1f17b1804b1-4a17093424fmr2264725e9.8.1791083675677; Sat, 03 Oct 2026
 20:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003161720.240855-1-kunwu.chan@gmail.com> <51ffe989-9a0b-4715-b434-3e4cead5af0b@nvidia.com>
In-Reply-To: <51ffe989-9a0b-4715-b434-3e4cead5af0b@nvidia.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sun, 4 Oct 2026 11:14:24 +0800
X-Gm-Features: AclHuK9tUu2uKGwH8HXQNHJenmt7uhQy2FnWm50hGJvU0CGtug0hW9-O-ZjyO3k
Message-ID: <CAN_Opa_dXuRVp835DrL4w0gGk0oxGE7-TdbAkUw=4m3YBfMt+g@mail.gmail.com>
Subject: Re: [PATCH v2] rcuscale: add srcua scale type
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: dave@stgolabs.net, paulmck@kernel.org, josh@joshtriplett.org, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, boqun@kernel.org, 
	urezki@gmail.com, rostedt@goodmis.org, mathieu.desnoyers@efficios.com, 
	jiangshanlai@gmail.com, qiang.zhang@linux.dev, linux-kernel@vger.kernel.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 8:33=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> On 10/3/2026 12:17 PM, Kunwu Chan wrote:
> > Add support for scaling atomic SRCU grace periods using
> > srcu_read_lock_atomic()/srcu_read_unlock_atomic() and
> > synchronize_srcu_atomic().
> >
> > Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> > Changes since v1:
> > - Rename srcu_atomic_ctlp to srcua and reuse srcu_ctlp for
> >   SRCU operations, as suggested by Paul.
> > - Reuse the existing SRCU cleanup and completed helpers by
> >   initializing srcu_ctlp in srcu_atomic_scale_init().
> > - Add .stats using srcu_scale_stats().
> > - Use "srcua" to match the existing "srcu" and "srcud" scale
> >   type names.
> > - Use synchronize_srcu_atomic() for both normal and expedited
> >   scale tests.
> >
> > v1: https://lore.kernel.org/all/20260927100359.3903688-1-kunwu.chan@gma=
il.com/
> > Tested with kvm.sh --torture rcuscale scale_type=3Dsrcua on x86_64 and
> > arm64, alongside gp_exp=3D1 and PROVE_LOCKING=3Dy: no warnings or lockd=
ep
> > splats.
> > ---
>
> Maybe some performance numbers too for an rcuscale patch? ;-) But either =
way:
>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

Thanks Joel for the review!

Here are the rcuscale numbers. All tests were run with
kvm.sh --torture rcuscale using scale_type=3Dsrcua on 12-CPU
x86_64 and 256-CPU arm64 KVM guests, with and without
PROVE_LOCKING.

All values below are synchronize_srcu_atomic() durations:

  Arch    CPUs  lockdep  gp_exp  median   P99      max
  x86_64   12      n        0    0.82us   1.57us    864us
  x86_64   12      n        1    0.87us   1.54us    857us
  x86_64   12      y        0    0.72us   0.93us     11us
  x86_64   12      y        1    0.66us   0.85us    160us
  arm64   256      n        0   26.2us   71.2us   3389us
  arm64   256      n        1   24.3us   60.6us  10513us
  arm64   256      y        0   13.4us   43.6us   4066us
  arm64   256      y        1    8.86us  22.6us   8004us

gp_exp=3D1 does not significantly change the distribution for
srcua, since there is no separate expedited primitive for
atomic SRCU.

For comparison, synchronize_srcu() on the same arm64 guest
takes about 8ms under the same workload.

All runs completed without warnings, lockdep splats, or shutdown
issues.

Thanks,
Kunwu

>
>
>
>
>
> >  kernel/rcu/rcuscale.c | 41 ++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 40 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
> > index 1097ec15879c..b172882824ac 100644
> > --- a/kernel/rcu/rcuscale.c
> > +++ b/kernel/rcu/rcuscale.c
> > @@ -293,6 +293,44 @@ static struct rcu_scale_ops srcud_ops =3D {
> >       .name           =3D "srcud"
> >  };
> >
> > +static struct srcu_struct srcua;
> > +
> > +static int srcu_scale_atomic_read_lock(void)
> > +{
> > +     return srcu_read_lock_atomic(srcu_ctlp);
> > +}
> > +
> > +static void srcu_scale_atomic_read_unlock(int idx)
> > +{
> > +     srcu_read_unlock_atomic(srcu_ctlp, idx);
> > +}
> > +
> > +static void srcu_scale_atomic_synchronize(void)
> > +{
> > +     synchronize_srcu_atomic(srcu_ctlp);
> > +}
> > +
> > +static void srcu_atomic_scale_init(void)
> > +{
> > +     srcu_ctlp =3D &srcua;
> > +     init_srcu_struct_atomic(srcu_ctlp);
> > +}
> > +
> > +static struct rcu_scale_ops srcua_ops =3D {
> > +     .ptype          =3D SRCU_FLAVOR,
> > +     .init           =3D srcu_atomic_scale_init,
> > +     .cleanup        =3D srcu_sync_scale_cleanup,
> > +     .readlock       =3D srcu_scale_atomic_read_lock,
> > +     .readunlock     =3D srcu_scale_atomic_read_unlock,
> > +     .get_gp_seq     =3D srcu_scale_completed,
> > +     .gp_diff        =3D rcu_seq_diff,
> > +     .exp_completed  =3D srcu_scale_completed,
> > +     .sync           =3D srcu_scale_atomic_synchronize,
> > +     .exp_sync       =3D srcu_scale_atomic_synchronize,
> > +     .stats          =3D srcu_scale_stats,
> > +     .name           =3D "srcua"
> > +};
> > +
> >  #ifdef CONFIG_TASKS_RCU
> >
> >  /*
> > @@ -1110,7 +1148,8 @@ rcu_scale_init(void)
> >       long i;
> >       long j;
> >       static struct rcu_scale_ops *scale_ops[] =3D {
> > -             &rcu_ops, &srcu_ops, &srcud_ops, TASKS_OPS TASKS_RUDE_OPS=
 TASKS_TRACING_OPS
> > +             &rcu_ops, &srcu_ops, &srcua_ops, &srcud_ops,
> > +             TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
> >       };
> >
> >       if (!torture_init_begin(scale_type, verbose))
> >
> > base-commit: d21906b0aa1e9573cdb5e7acaca44966b9d1dcd2
>
> --
> Joel Fernandes
>
