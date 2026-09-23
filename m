Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A9033F8A6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790136936; cv=pass; b=ItlyQjlRlNAO7vRrQGJdUTlFizlOVJDlcmeA1aUI2ho6vOqVubPiv0jOVhNoHYo1vKNSF/ZkbEGaSiv1zNDI37t5zSDiJ4FO+YPuV7H9BXDZpl6li03qAIA03GHPROAceEVsW9O4imZVJgmOgJ/ngunxrl991INLp/8/l7c5czc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790136936; c=relaxed/simple;
	bh=oUewmwn77TqWmsD8jxMMcsLsXwJkucdFvCNJu5PgVaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtHInkcVYBh43Ib+Y+5WNdPxSBYEuRtrvnbYzjoxI6IPZ2mxGJhJn7NMhbS7zq14k92BGh7FQDEeFUza5QPkkrHD6vK3JpB2cR/8wgFkzlHSGsqPKASeOWQqsLsEjxbda0xbbI+7R5BTulwyWG+kQ/ZNT9bK71Ip05RPYtdLgkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwzOicOX; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwzOicOX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so3650055e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790136933; cv=none;
        d=google.com; s=arc-20260327;
        b=oAvhRWWjLukZo5c7n1wQ+WaMEf0/yTDYqMiEl9f/WX+gb2CDsOsshWgkMMVlVRnBzI
         YgXp8sJxXWsK3+UXtl6W01/z8V09JO1Q/GTSpeasfwyWhghOcimTd/d4q+5xdwyQksqw
         +NZOQK2DPHr+431yLMAf/h+cwP4JYXaSNAl5bka9nVPr0prOe73L7pS38nade3O/aheM
         2BaK+uuWX4rzfh++VNh0hBFvSiZx/SwW+IL8OcPXxvQZ7kHLTHJavc+7LmSmlHypQBpZ
         ZaRgr8xDCxF1VoIyjuvw3i/YIlE8HOgeg/bXmm9Bkn5AUzcKDNiNINP6bH6t7lrcTIUe
         xFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i36f7xtnWKpVJBn7KVPs9Rgrmv9naoWJLljKyz9tnJM=;
        fh=PtepVdIY1zOT0klpGshl6QkTnKtWP3Ny7nWHrJGRY78=;
        b=OD4SHSNrEDmmoQtmw7WmXBKajpYwQ7jNdKQy/1h1YPMOZnbhyBh1N7owZ4wAGZ0mod
         R7lelIw93z7bdGBko6myQPf9Y59CT3q4M0SNSB9WyOuAc2ojKUD9f+9mI36dDyzdfFez
         br6COg1s80ZIApPYM9PIyhgkWY3LM3f4M0wkk/JwiqEJkRp39QBdyLFBejnY3Hk9BRPi
         dTVSvBlYGktrOHggH3tkZjT3tGj6BA489w7XMGs10au322Rfq7XQuBJEqj/cb8KBFtN+
         wc+5ma0nTD+V3WjT27Fsrv2Ilom0C+r45DSDprrlsUlW8xzIwoIs62zbK0x95/iTBjfo
         gLRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790136933; x=1790741733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i36f7xtnWKpVJBn7KVPs9Rgrmv9naoWJLljKyz9tnJM=;
        b=FwzOicOXBvQWomnpL+aYG0N+i5jLMO8MrDsiVI8l1fVS6XdW9fDMl1F8zGPSRyu1l6
         9pXV3H5lJPr/F6LU6XohEkHofNQNHW+AI/wfR3LWzUa8/qCs4rmigEc7HPdLaowwehw/
         8m3gECfEYmr3+ncR4W7x4fdVYGE9EqBTLckDN+i1iTbZc0gNk7Xcmc1JPgOOQBs0pNq3
         2YwQnj97ivnt6ArNZvaCwLeAO+TBECusObiifCgVDruPsc6JGbU0VDLU/1z6Qo+bk9gB
         bho5bmJJXRvC54EGqGbs5HXmdV2r2uCM2ZMPREqsnCKBi8GXCWzWlZ46L7takwwiqtSc
         TcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790136933; x=1790741733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i36f7xtnWKpVJBn7KVPs9Rgrmv9naoWJLljKyz9tnJM=;
        b=ufK4W4nGYXcw0LRzXL8ZhSd3V7zdZoTZDO76577LF6/INyUX9UZnMuRbuX4Fotw5xR
         5g+eU+8TY+ek3jC2ACGPm8QPKsqI2GN/J5Us9i6QQ0h0hF+cTFUdBaKhRsbGjdsX/JTZ
         jU2yalB+Qb8bCp86Xe3YmVFiIpHmkDiwHUP7gV0Sstz/mu3CXJZha2yEOWjFY1D+ANC1
         QS+oHJS0uRjJ6ZbPQFDm0OqBxlbSZt0ktAmaIk6wxgAw9WjXtWx3yW30zBVYW8nSOu7/
         +ql7dplzx+Q5vzJI+jKFV4ctMcU5QZIGaL7s3N6/ClaOKlmUQK30iCv/poXVFzi7eiVr
         KuQg==
X-Forwarded-Encrypted: i=1; AKwUvByAVosIwd5xanI+sbqqMYbn5ZgzXL2q8N+/o+dpaZT5YpzHJeDShCojemcOGHb3TTVT3/o4WRa7UciJ1+g=@vger.kernel.org
X-Gm-Message-State: AFuF++koe19g4HpNxb4rPu+7wYGWTSSuHdMUY/rFAs401l3uj9FDovYt
	lgvzmfRJGm7BX5lc59kPhoVjl90UxrjTAqM3IR4hoeaoWphsVl+GpeeaVZemLTfnU6/3P1wlC4E
	zTldZAW/jroj4iDu2hb+OMJ4vu+VysmQ=
X-Gm-Gg: AYBFou1xUTQztmHb3NoW8tV9hnkNxSk4MeJ2yV/cQkRG3/5bb+wxnF4iLUL3w/G+w9j
	99xUWlndabBjbaxiBZ1RHZD2zU0ar3q0fxUjNSsUoxlJvyLQnYDYzVWsmkxes097exDleIxgFOZ
	orkR3dt9NcrpdqhLQCKfylr6gxUYUdYifNkdyiXUXTrpu52qnNd8lN34z6jghFkgqXKDa1GLQLV
	/ktyE5D7lI8IWuOD3Szb0qTsZsqzEyybIbN5wmfeRY8G1Te7AcXO2lutUS3lBRWNKZ4RJfkY18/
	DJXHNFrOLzKlSb6hb6vk9w3itTTey79gI0GlLZ20il51yjHL7bIOeWOy3X33ADa4YPUB31QN9TU
	cVW4EPZyexlpYTg==
X-Received: by 2002:a05:600c:46cf:b0:49d:797:8488 with SMTP id
 5b1f17b1804b1-49fdeff7112mr14786765e9.1.1790136932220; Tue, 22 Sep 2026
 21:15:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922070950.4173245-1-kunwu.chan@gmail.com>
 <20260922070950.4173245-3-kunwu.chan@gmail.com> <arJBpQyOQf3AJ4cA@MacBook-0RXW5>
In-Reply-To: <arJBpQyOQf3AJ4cA@MacBook-0RXW5>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 23 Sep 2026 12:15:21 +0800
X-Gm-Features: AclHuK_nckJ12y6T2Aoov6rc7a6r-smUS_AxTu-iCekyh8CIGeC66Dch7H_GWTo
Message-ID: <CAN_Opa9fyOApv8u-WxcdHDgYDLkOkv4tKLacGsuHgnz7GdNVTQ@mail.gmail.com>
Subject: Re: [RFC/WIP PATCH 2/4] locking/lockdep: use hazptr to wait for
 dynamic key lookups
To: Boqun Feng <boqun@kernel.org>
Cc: stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org, 
	peterz@infradead.org, npiggin@gmail.com, dhowells@redhat.com, 
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, paulmck@kernel.org, 
	corbet@lwn.net, mingo@redhat.com, dave@stgolabs.net, josh@joshtriplett.org, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, urezki@gmail.com, 
	akiyks@gmail.com, dlustig@nvidia.com, joelagnelf@nvidia.com, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, longman@redhat.com, 
	rostedt@goodmis.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	qiang.zhang@linux.dev, include@grrlz.net, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 4:51=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote=
:
>
> On Tue, Sep 22, 2026 at 03:09:48PM +0800, Kunwu Chan wrote:
> > lockdep_unregister_key() waits for is_dynamic_key() callers with
> > synchronize_rcu_expedited(), which sends IPIs to every online CPU.
> > Have is_dynamic_key() mark the hash bucket with a hazard pointer
> > and use hazptr_synchronize() to wait specifically for those
> > traversals.
> >
> > The hash bucket address from keyhashentry() is stable, making it a
> > suitable hazptr synchronize target.  The rest of the key hashlist
> > lifetime (hlist_del_rcu/call_rcu) remains RCU-based.
> >
> > This adapts the lockdep use case from Boqun Feng's hazard-pointer
> > series to the current hazptr API.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  kernel/locking/lockdep.c | 30 ++++++++++++++++++++----------
> >  1 file changed, 20 insertions(+), 10 deletions(-)
> >
> > diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> > index c56a7f91d72e..f67d847f9abf 100644
> > --- a/kernel/locking/lockdep.c
> > +++ b/kernel/locking/lockdep.c
> > @@ -58,6 +58,7 @@
> >  #include <linux/context_tracking.h>
> >  #include <linux/console.h>
> >  #include <linux/kasan.h>
> > +#include <linux/hazptr.h>
> >
> >  #include <asm/sections.h>
> >
> > @@ -1280,14 +1281,24 @@ static bool is_dynamic_key(const struct lock_cl=
ass_key *key)
> >
> >       hash_head =3D keyhashentry(key);
> >
> > -     rcu_read_lock();
> > -     hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
> > -             if (k =3D=3D key) {
> > -                     found =3D true;
> > -                     break;
> > +     /*
> > +      * The traversal is protected by a hazard pointer rather
> > +      * than an RCU read-side critical section.
> > +      */
> > +     {
> > +             struct hazptr_ctx ctx;
> > +             void *bucket =3D hash_head;
> > +             void *addr;
> > +
> > +             addr =3D hazptr_acquire(&ctx, &bucket);
> > +             hlist_for_each_entry_rcu(k, hash_head, hash_entry, 1) {
> > +                     if (k =3D=3D key) {
> > +                             found =3D true;
> > +                             break;
> > +                     }
> >               }
> > +             hazptr_release(&ctx, addr);
>
> This looks good to me. However, we probably want to use scoped_guard()
> here, that means cleanup.h support for hazptr.
>

Thanks for the suggestions. That makes sense.

I'll add a DEFINE_CLASS wrapper for hazptr so is_dynamic_key() can use
scoped_guard().

> The other thing that could be added is a debug option that force we
> skip the fast path, so we always go into the show path in
> hazptr_acquire(). This occurs to me because the slow path here means
> acquiring a lock inside lockdep code, it should work, but I just want to
> be careful. So something like:
>
>         void *hazptr_acquire(..)
>         {
>                 ...
>                 if (IS_ENABLED(CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH) ||
>                     unlikely(slot->addr))
>                         return __hazptr_acquire(ctx, addr_p);
>                 ...
>         }
>
> Thoughts?

Agreed on the slow path. I'll add CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH to
always enter __hazptr_acquire(), and exercise it with lockdep-heavy
workloads under
CONFIG_PROVE_LOCKING.
The existing hazptrtorture module can also cover the forced-slowpath
path for additional
stress, including per-CPU slot contention that can trigger the backup-slot =
lock.

Thanks,
Kunwu

>
> Regards,
> Boqun
>
> >       }
> > -     rcu_read_unlock();
> >
> >       return found;
> >  }
> > @@ -6683,11 +6694,10 @@ void lockdep_unregister_key(struct lock_class_k=
ey *key)
> >        *
> >        * Some operations like __qdisc_destroy() will call this in a deb=
ug
> >        * kernel, and the network traffic is disabled while waiting, hen=
ce
> > -      * the delay of the wait matters in debugging cases. Currently us=
e a
> > -      * synchronize_rcu_expedited() to speed up the wait at the cost o=
f
> > -      * system IPIs. TODO: Replace RCU with hazptr for this.
> > +      * the delay of the wait matters in debugging cases. Replace the
> > +      * expedited RCU wait with hazptr_synchronize().
> >        */
> > -     synchronize_rcu_expedited();
> > +     hazptr_synchronize(keyhashentry(key));
> >  }
> >  EXPORT_SYMBOL_GPL(lockdep_unregister_key);
> >
> > --
> > 2.43.0
> >
