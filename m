Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3715D347533
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120231; cv=pass; b=Sidu6H51VEroOMKr0K/wrkQrmpNecJeSeVA+wisk166u3xw+HWYXunUyYhcJtByQdT28JQMJau7qo7Y2v9p8IssRM8Dd/Ci0o0BBtARMVr+l+qPRfgUKdE5XRFrx9DnoUYW3+Gk/x4tf83osfOT3md8iLhUDhBgHgZDmCIxeeDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120231; c=relaxed/simple;
	bh=WVQ/j1d2JaRchY/iDZaPslSfywaOQoJpll8D3v4G/LQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L87obhKVbim910V0lpsXUwxaovqJgZqn8nszhNSPxYgFj8Z3bhOScU2CdQyYXAAq45k4ZmsxZXzjC45O1pcfGBDoB1Zdjd/lFQFWJNzRlIfEs78hDQXfAvEfd6694M5ww1i/axByXjTqpGqmbuLVivR6Ye2P36KZuWEMnSKi9RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDQUGevn; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDQUGevn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso6169845e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792120227; cv=none;
        d=google.com; s=arc-20260327;
        b=DZMiTX1fe4We1SY64L2iDCl9gwRfzFUvA65mGjmxdCxa4a8opjrRGfg1fDdD7tmuK/
         4raTD8J7afPhHV7VAx4cACSVzcXAzafiMTkwdxYxM8LrCoJ4EfzcbJAIGlLyfAcnuwAm
         2Uu9X9K/cjgOavcYTN3QDwtYfsMYcaTE2UVPtELxeJ7CFzAMYTaOaZNtB4a+M/X85jfa
         yI0r0a4hRSv40RTJ1sMSppKDPRAVcOJNWgJdnhQxKKiBpTq5hD7RyWpNLzOtU6SCOrhM
         9TBSY+px43nmq24RCEFdQCcB/cUuBOgqhhOXyGr5aSrZmHrj2Sjrf9pRgUAhq8e/LGdH
         i71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xlTg1ZA1llUS+f5Z9F7BKuAG/CC4v+1NC0B32dFPZWI=;
        fh=3RfMdlwolKMMbL4yJRY7/CYYLIo5InONDCKWger/sOk=;
        b=gXGxHQ87mDc/YpqGljyJ7C2l+iBHnSGcoZ/uoc9IOnfQxggPe4hiIgy/bOssnJT321
         XQEmfasPJ8aJS6C5VqW6j9xvjLJs1Voav83MczBvwB2RV2uRopL+3jvlMYfS7jZpXyUS
         FtPxzJnXc90MF54N0HsCPEFwLe3UZt3R8cKDCPnM5gSCEHLz/0bVYUAdmqbnjYOiQSXb
         CExfJ+RfEPgvC2zYjXbZstFCgkRgkaqd3XIU5/u8wRTAbz63pVrjaHKLfmf64od6sj/O
         LDbnHeiElwgfqMD9TAnM8SD8tlyDmZeJeHAnvb0JkCDYPYg9frSXS1TqkFBqXYQzhwtL
         Zfxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120227; x=1792725027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xlTg1ZA1llUS+f5Z9F7BKuAG/CC4v+1NC0B32dFPZWI=;
        b=HDQUGevnZicrjXUQrDR0JNaZLlrGx1TGZvw2y7u6iZekbSseMFxveLn8swWGq1zjpN
         Js73iJYQq9ZzzQGA7t6FwrpLoiTljo1i7FMyylM9qou4b2YHQY3+A+DbS277bj+id060
         gv9udJfWoYoqykpiW101e2yQGd7YHD/ZRoitndm/YTiTTn5seJ4m1AL+WcpqF34o91eD
         JRkDs7XB5apZEcKSpZam0EbpxK5fYBDAwdFB3tYwQEwmJjuvWVyZjEmS+pBrWoY6asai
         kgp5AXsLMkPNgkc+eZa/tph9BCWt3keKTyZFOFEmQYdxIKD6TF3u0ptyDx/5GAltlH3g
         FQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120227; x=1792725027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlTg1ZA1llUS+f5Z9F7BKuAG/CC4v+1NC0B32dFPZWI=;
        b=rJx7hnNQwokqjWgsql62+qOsp4xAYJneZpJhUNxJPK7RaxaOWwAmo6Vv2ERoVCYWBv
         wqo4/wR5yeHEgTXYnAQ8IXQc8ae2KwQjsc75A4rBFfNiJ2YLQ1MaOTaCbX/0Xwpxrv1f
         gVZSEByj6zsG95YKIDZRKg1UD/05Pde5SyMgsWosK7EE9NkHXnFXqelDBu1QRhQNYiXm
         xBXWvjDn/e4ATn95gW9XjOv8p0wCzFSpascfPhMRK4DTZGEfb1sSmgy4mM5pqjNOEhvI
         cAVu92kGib+SfgyASDH5JLWfmpLap4crqUK51NsoKnHKRdEQMv6SG9QzjAVHVWPR+VzF
         KPLg==
X-Forwarded-Encrypted: i=1; AKwUvBylZ3wllcbvqJ9SEe17mFo7P55s5h9VwDGcakl8XPQEj5142uImxGVp3BF+C5tDex1lRTIAZ6D9o3IzHRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2JSZ1Hnrzj8Kn5U+nZlPpsoJ6jzO5l/Mf/Z5ZVGFHmdiqp0fO
	YIFFKDhlBJrzJR80VwnWi6vqOAic3OThQQLnqwfimOcn5VEoGtyPzlT958rUcbxuh4vtiWcyY0j
	fz8al2ZnQ6WSGBARQl1DygV6bwbeokWM=
X-Gm-Gg: AYBFou0JwrZVOCnT3V4yrPhM0Vmif/btlRYV7iKlFlKy1lDRepwCZkWIKLSjqdWefnv
	ioAv0PFjhqxI3zltHgyBMjE1CNib46IdKcAFqerIeOM0S9SiAgdCmcw62hCTmppVJoTAWbINQoU
	3s7JbC7UU27cBFgBNZqDVQ5zK8G7KZWKpuirSSqYrkpnocnvYFuH5B/312C48gj6FK+wPqlikeJ
	/nOjAtc0BttLlTfbKbO/3NkGNF8/FI63V2ZI1MJjxjRX9nlWciSGJTY0rzbo8UVOYTlDiSHAegg
	8oAF7a3THuB8w/Y2GnR2A88HUSFSUrc+4mmpNvyAAXeTHmJrFcwdZa62yrq6jrK8GGs=
X-Received: by 2002:a05:600d:82f3:b0:4a0:ec5:46d9 with SMTP id
 5b1f17b1804b1-4a1c65b9d1cmr49895815e9.0.1792120227297; Thu, 15 Oct 2026
 20:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
 <20261005171529.1378809-9-kunwu.chan@gmail.com> <as3aMmPdCHCXW6Ci@U-YXDQC754-96.local>
In-Reply-To: <as3aMmPdCHCXW6Ci@U-YXDQC754-96.local>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 16 Oct 2026 11:10:14 +0800
X-Gm-Features: AclHuK-luj00YvB6W0gzUZaHST8ZYYHX_eNK_3NZlyZFFvQwwdxXevqOtbkN0mU
Message-ID: <CAN_Opa9V-nXQ8-PyntDGaQDw4jQs0Z99J07pdApH3+EoTHyTcQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 08/15] locking/lockdep: use hazptr to wait for
 dynamic key lookups
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: paulmck@kernel.org, corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, lianux.mm@gmail.com, stern@rowland.harvard.edu, 
	parri.andrea@gmail.com, will@kernel.org, peterz@infradead.org, 
	boqun@kernel.org, npiggin@gmail.com, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, mathieu.desnoyers@efficios.com, 
	qiang.zhang@linux.dev, brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:40=E2=80=AFPM Lai Jiangshan <jiangshanlai@gmail.c=
om> wrote:
>
> On Tue, Oct 06, 2026 at 01:15:22AM +0800, Kunwu Chan wrote:
> > lockdep_unregister_key() waits for is_dynamic_key() callers with
> > synchronize_rcu_expedited(), which requires system-wide coordination.
> > Make is_dynamic_key() protect the hash bucket with a hazard pointer
> > and use hazptr_synchronize() to wait for traversals of that bucket.
> >
> > The hash bucket returned by keyhashentry() has a stable address, so
> > it can be used as the hazptr synchronization target.  Keep the key
> > hashlist lifetime RCU-based with hlist_del_rcu() and call_rcu().
> >
> > Protect the traversal with the hazptr scoped_guard() added earlier
> > in this series.
> >
> > This adapts the lockdep use case from Boqun Feng's shazptr series
> > to the current hazptr API.
> >
> > Link: https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gm=
ail.com/
>
> Hello,
>
> I think this is a misuse of hazard pointers.
>
> The bucket has a permanent, static address; its lifetime does not
> need hazard-pointer protection. Instead, this patch combines a
> hazard pointer with that address to construct a read-side/synchronize
> mechanism in the same category as RCU. However, this construction
> lacks the generation distinction needed to separate pre-existing
> readers from subsequent readers.
>
> The object being removed is the key, but the synchronization target
> is the bucket. Unlinking the key does not prevent new lookups from
> acquiring the same bucket address, including lookups for unrelated
> keys that hash to that bucket.
>
> This breaks the forward-progress argument used by the underlying
> hazptr implementation: after removing an object from publication,
> there should not be a continuing stream of new readers acquiring
> that same object. Here, the bucket is never unpublished.
>
> For example, let B be the bucket containing key K:
>
>   Updater                    Reader                 Scan kthread
>   -------                    ------                 ------------
>   Unlink K from B
>   hazptr_synchronize(B)
>                              Acquire B
>                                                     Observe B;
>                                                     retain waiter
>                              Release B
>                              Acquire B again
>                                                     Observe B;
>                                                     retain waiter
>                              Release B
>                              ...                    ...
>
> Every reader critical section can finish, and the scan kthread
> can keep running, while the updater waits indefinitely. Readers
> that could have observed K may already have completed; later
> lookups alone can keep the waiter pending.
>
> RCU does not need the reader population to become empty. Its
> generation (grace-period) machinery allows pre-existing readers to
> drain without letting a continuous stream of subsequent readers
> indefinitely extend that wait. This address-based construction has
> no equivalent distinction.
>
> So this is not merely protecting a different object with hazptr:
> it is using hazptr as a different synchronization primitive without
> providing the corresponding progress guarantee.
>
> I think we should retain the RCU wait here. If the intention is to
> implement bucket-scoped read-side synchronization, that needs an
> explicit protocol to distinguish the readers being drained from
> new arrivals; a permanent bucket address is not sufficient.
>
> Sorry for the lengthy reply, which was written with the help of an AI
> agent. I noticed this issue when this use case was first proposed, but
> I struggled to articulate my concerns clearly back then. Well, now we
> have AI. :)
>

Hi Lai, thanks for pointing this out.
And thanks Boqun, Mathieu, and Paul for the helpful replies.

I'll look into adding an RCU-stall-like mechanism to detect
long-lived pointer waiters, and work with Boqun and Mathieu
to find a more suitable scenario to exercise this case.

Thanks,
Kunwu

> Thanks
> Lai
>
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  kernel/locking/lockdep.c | 25 +++++++++++++++----------
> >  1 file changed, 15 insertions(+), 10 deletions(-)
> >
> > diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> > index c56a7f91d72e..d1ce5ace7fbf 100644
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
> > @@ -1280,14 +1281,19 @@ static bool is_dynamic_key(const struct lock_cl=
ass_key *key)
> >
> >       hash_head =3D keyhashentry(key);
> >
> > -     rcu_read_lock();
> > -     hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
> > -             if (k =3D=3D key) {
> > -                     found =3D true;
> > -                     break;
> > +     {
> > +             struct hazptr_ctx ctx;
> > +             void *bucket =3D hash_head;
> > +
> > +             scoped_guard(hazptr, &ctx, &bucket) {
> > +                     hlist_for_each_entry_rcu(k, hash_head, hash_entry=
, 1) {
> > +                             if (k =3D=3D key) {
> > +                                     found =3D true;
> > +                                     break;
> > +                             }
> > +                     }
> >               }
> >       }
> > -     rcu_read_unlock();
> >
> >       return found;
> >  }
> > @@ -6683,11 +6689,10 @@ void lockdep_unregister_key(struct lock_class_k=
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
