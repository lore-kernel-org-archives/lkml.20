Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73835187E1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984023; cv=pass; b=Nv+c/NNbVMV1BKpPBNgrn+vzLYUKeiysIpuC0586dNyjH2x5vSNaB+RIr4t1F+CAbr3DrXkq7aeUfc0fh0O8DWwH/WBgZ8NBkPokd7fg+5RwiuTzhybd3qmowpGZMt0cVzmhcElRO9pyHIcocFwhDNtgL3fdTawDawYkRwZRap8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984023; c=relaxed/simple;
	bh=qYqZpnHxt46bTwCQrjgfaPtEhf6RbkOYsrPyT5c7kNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mib6kuf/SU9njWD/xHRmTzTuS8e/jD1UrcnLxzK9zelooWhjMqXkQJ8jnufuvbA2hBBv6/iflExzE2mwc8KQqf8qYclqGz32nIKs1nTmMVz4u+lh9z14Fen0BMdpfwdP3tO5Ws9+j6azjGAdWFTIuql3vXYH1sri6YusKTT6JIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=et9ClaKU; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et9ClaKU"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8819033dbadso2505678b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791984021; cv=none;
        d=google.com; s=arc-20260327;
        b=nv5jR/UYNJ+KSFgkcfHJjbmTJjq1FaezerU/ZZmLPq7dECIUJ1V1GkAT/6jvQsDalP
         tMYBKu5LBJOoGFfGKVZrz6dMXVRnMqdOhM/KtTh14MQ18GgHuX+KE8iH6zHI6gQRc96c
         vjardL1obF3SYz8F86RQN7WzgKErJwLguL+JIL16bI75ZOywt6HCpLP1USDUP9TyYPpa
         85aJj8Y+a17HNIMllo7ZZut8ssKVDT+SQ7+iZdtoacZYMYxPcfll6RhxZb4x8xMPay2V
         IUyvl7vh7w6YyyZTHvBhpVk9gj+3gUig0/rMtFIMb9ipJEM90KzTmNhHnRVK49XzO0P5
         CEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DgFVuw3Nx/1CxZ7+35KCrm7X62fckoU2iflNvarBRIE=;
        fh=45M81APSr9mjjyyJPbO1C7tij0l2VxLXM0EpEeJMk6E=;
        b=hEhoa2U9hp2gH82HwmH1pvqZFv/8rpdZ1/LYDRwyKfbodl9WSvhgkzhvQVPR6Gyn8G
         E9SSItRnf8HO0rUH4kaCLJpmKtNxpGIu5FeeN3pxc983w/fBBhPdQUFYNwcLFSQBV7Fe
         TRimwNtubJIJqz6VlF1kV0RJFQFFd9MQsfk1vjvhetwxRkoY3ceXCcMxW3uxbKhGf9kf
         MB9+aClkUCT81GgBqiaGv6y1lEFqlaIUK9wEE8rz1kBduk4q5Ezk9FzgZgv9PWzFh861
         NpKY8pQlI/NnUYFPeCjfsZb9tBdrKZChh9ggZVM1eH8qhBNhrI5blnqGZSJNfRNAoUdQ
         qLUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984021; x=1792588821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgFVuw3Nx/1CxZ7+35KCrm7X62fckoU2iflNvarBRIE=;
        b=et9ClaKUzS0HcDc2QuATHXXL7pn0SXR8jiLWhz+zuaZidBtYc6+mfqXdupaABDEzlh
         OfGjTMaNgJuYXm5Fq0WS4EnmgAmNaTf1Uhwjss1bqjgYSHP0tYtJ/vGsgTTDFy8Mzp7x
         3G+MPEHN+VZsKXXHYTbuKZogR+AM48d6An2c9xYXjwTAadbAct/A39qLNvwhKkiDFV+C
         jtIbpA5UtX2KdiqVX8G7ndKyAYRF63gBvXHWELO+KpLZdbwtFP99jUc0rfDXVZGUnCgm
         3m+EPz5iLPCJcVMsmra01d1aA1hw0pP0a+JZDjhfCXMESYe83Xnezz7+dljKs+ix1Cp/
         gGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984021; x=1792588821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgFVuw3Nx/1CxZ7+35KCrm7X62fckoU2iflNvarBRIE=;
        b=I24WzseS2D9eg+qkYKqbRDKUM6XsAll1HXSe9njpLaEDUzXgwYvVIqDwJOlfzbtqV6
         s5CTu1OhenDEmt5t+d5ZZ59jVIxU9q+RK71qctsZTYAv+AGxl0fqcdZzAazoCu2Sfxrt
         F5dBkVD/vni6kxMFp449Se1LFNO4O4t/8QCvbVK3HKJ4kk1Qp+lA9M907pq0blfz6KBy
         hhlYoPxzva2D0YuZoSmuYaWanOxiaPsuF+OXBtnEMXXaubcC0tFpYUprZ8Qtyqv+OVtP
         1NS2j8bTDrmNySm5E+j85LZZtUl7vfKCu6NdWUEnIi9xlG3u3MO3uB2CiJ+0GtO/lSrZ
         4sjw==
X-Forwarded-Encrypted: i=1; AKwUvBwCoHxCzRTU/EhKoLo6HcNmdMja8kdZAcRSqxx7J1CUg8xqaP6dErAeiK0FPJ8+6MDH3CkgJjz99HQKsQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqrBCSk/uUFImdMn6wDt589zUHeyS+VqkxlW2AfbLu6LPGuAs1
	0O20LJP1PP3D+NeT1ZJ6TEDxx+3hfX/TyhZtLdyGTrhT46FBETEbtWOdR7vXMM/t5giFXVp4KG3
	hRFoqTrnr3wCkvOrjxxaIeakWf082Pvw=
X-Gm-Gg: AYBFou2T9yTlGjeog3fnsGX6MGpMnkdGeyzTXAItn/vmQ4MZKFY9vxqlJC/IKx0bV6Z
	2IVUO7jlcn2b2l5WQKLbK8YLijqYjxzpbXXmvSR2BEs+l3TfISXN/B445gXLdR3U/TiaKNRu5PL
	NGM6PSuePQKNQDdPAXEfd8exUrzxRSQ2gYb7z+27bHyy66HC0OSCzlHBvWKeJac8LYKqg1jJKiz
	WpsA/gauzdhliGKQDuorTTjRjR18WWfQ8iVbUZwMlgSaP8hUVAU0VwX0+GdFIY92srs3IzOv9m1
	yGLiR38I/UQT6YcmLIWh2EHvlldrIu4Fh4iKWGEkAzMrv9AoCk6r1QVY
X-Received: by 2002:a05:6a00:2e05:b0:878:34d7:697c with SMTP id
 d2e1a72fcca58-897c79e2162mr12761852b3a.42.1791984020749; Wed, 14 Oct 2026
 06:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013101947.2478989-1-shengjiu.wang@oss.nxp.com> <0f34ec3308f8eca73c949f8c40d47564f6136efd.camel@pengutronix.de>
In-Reply-To: <0f34ec3308f8eca73c949f8c40d47564f6136efd.camel@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 14 Oct 2026 21:20:09 +0800
X-Gm-Features: AclHuK89yypPEdgKSvx5Pcium5yTMRxN0uzAubBuRlMRaP4PupK3xCeEg4XfL2I
Message-ID: <CAA+D8ANFn3E5MKY7kfay3TDANnbn6ot7CBbQv5sQtPUqVH7+YA@mail.gmail.com>
Subject: Re: [PATCH] reset: core: Serialize concurrent assert/deassert/reset
 of shared resets
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: shengjiu.wang@oss.nxp.com, hansg@kernel.org, linux-kernel@vger.kernel.org, 
	broonie@kernel.org, alvin.sipraga@analog.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 1:47=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Di, 2026-10-13 at 18:19 +0800, shengjiu.wang@oss.nxp.com wrote:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > reset_control_deassert() is documented to guarantee that the reset is
> > deasserted after the call returns. For a shared reset control only the
> > first caller runs the hardware .deassert(); all later callers just
> > increment deassert_count and return immediately:
> >
> >       if (atomic_inc_return(&rstc->deassert_count) !=3D 1)
> >               return 0;
> >
> > When two consumers of the same shared reset (for example two codecs tha=
t
> > share one reset GPIO) call reset_control_deassert() concurrently, the
> > second caller can return before the first caller's .deassert() - which
> > may sleep, e.g. for a GPIO-expander based controller - has actually
> > released the line. The second consumer then proceeds while the device i=
s
> > still in reset, contradicting the documented guarantee. The assert and
> > reset paths have the same problem: only the first shared caller perform=
s
> > the hardware operation while concurrent callers return early.
> >
> > Serialize the shared refcount update and the hardware .assert()/
> > .deassert()/.reset() under the existing per-control rstc->lock so that =
a
> > second concurrent caller waits for the first caller's hardware operatio=
n
> > to complete. The lock is taken before the SRCU read section, matching t=
he
> > ordering already used by reset_control_acquire(). These paths do not ta=
ke
> > rcdev->lock, so no new lock-ordering inversion is introduced.
> >
> > Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
> > Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/reset/core.c | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > index 38e189d04d09..7536b61cc5df 100644
> > --- a/drivers/reset/core.c
> > +++ b/drivers/reset/core.c
> > @@ -51,7 +51,8 @@ static DEFINE_IDA(reset_gpio_ida);
> >   * @triggered_count: Number of times this reset line has been reset. C=
urrently
> >   *                   only used for shared resets, which means that the=
 value
> >   *                   will be either 0 or 1.
> > - * @lock: serializes the internals of reset_control_acquire()
> > + * @lock: serializes the internals of reset_control_acquire() and the
> > + *        assert/deassert/reset of shared reset controls
>
> The lock is also taken for exclusive reset controls.

Right - in v1 the guard(mutex) is taken before the rstc->shared check,
so it is taken for exclusive controls too, which both contradicts the
kerneldoc wording and is the root of the atomic-context concern below.
In v2 I will take it only inside the shared branch.

>
> >   */
> >  struct reset_control {
> >       struct reset_controller_dev __rcu *rcdev;
> > @@ -382,6 +383,12 @@ int reset_control_reset(struct reset_control *rstc=
)
> >       if (reset_control_is_array(rstc))
> >               return reset_control_array_reset(rstc_to_array(rstc));
> >
> > +     /*
> > +      * Hold the lock across the shared refcount update and the hardwa=
re
> > +      * reset so that a concurrent caller does not continue before thi=
s
> > +      * caller's not-yet-finished reset pulse has been issued.
> > +      */
> > +     guard(mutex)(&rstc->lock);
>
> The current wording of the API documentation does not require this, but
> it clearly makes no sense that the second of two racing
> reset_control_reset() calls on a shared reset control can return before
> the reset pulse has finished.
>
> Could you update the kerneldoc comment, for example add "After calling
> this function, the reset is guaranteed to have seen a reset pulse at
> any point in the past, not necessarily during the function call." to
> the shared reset paragraph?

Will do, using your suggested wording.

>
> That being said, this is not required for exclusive resets, and I think
> there may be users handling reset controls in atomic context.
> Unfortunately the API never explicitly declared that
> reset_control_assert/deassert_reset() calls may sleep, and this just
> happens to work if the specific reset controller implementation doesn't
> sleep.
>
> I'm not sure what to do about this. We could split the shared and
> exclusive paths and only lock in the shared path, or fix the atomic
> users, possibly by introducing
> reset_control_assert/deassert/reset_atomic() first.

Agreed, the mutex must not be added to the exclusive path. For v2 I will
only take rstc->lock inside the rstc->shared branch in
reset_control_deassert() and reset_control_reset(), leaving the exclusive
path (and any exclusive atomic callers) completely unchanged.

>
> >       guard(srcu)(&rstc->srcu);
> >
> >       rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> > @@ -503,6 +510,12 @@ int reset_control_assert(struct reset_control *rst=
c)
> >       if (reset_control_is_array(rstc))
> >               return reset_control_array_assert(rstc_to_array(rstc));
> >
> > +     /*
> > +      * Hold the lock across the shared refcount update and the hardwa=
re
> > +      * assert so that a concurrent caller does not observe the line a=
s
> > +      * released while this caller is still driving it.
> > +      */
> > +     guard(mutex)(&rstc->lock);
>
> Nothing in the API requires shared reset_control_reset() to be
> serialized, why is this necessary? The comment doesn't make this clear
> to me.

Since the API explicitly does *not* guarantee that the line is asserted
after a shared reset_control_assert() call, there is no documented
guarantee to enforce, and no need to serialize that path. I will remove
the lock from reset_control_assert() in v2.

best regards
shengjiu Wang
>
> >       guard(srcu)(&rstc->srcu);
> >
> >       rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> > @@ -599,6 +612,12 @@ int reset_control_deassert(struct reset_control *r=
stc)
> >       if (reset_control_is_array(rstc))
> >               return reset_control_array_deassert(rstc_to_array(rstc));
> >
> > +     /*
> > +      * Hold the lock across the shared refcount update and the hardwa=
re
> > +      * deassert so that a concurrent caller does not continue while t=
he
> > +      * line is still asserted by this caller's not-yet-finished deass=
ert.
> > +      */
> > +     guard(mutex)(&rstc->lock);
>
> Yes, this aligns the function with the documented intention for shared
> resets. The above points about exclusive resets also apply.
>
> regards
> Philipp
>
