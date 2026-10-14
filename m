Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9995853A8B2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000339; cv=pass; b=amVGHDfsOgTLtRbWznRdCqFsNrN0tiyoCFdeXCzySVL+ufUx7t8USG0X5jesRDVD74lNiOdZx8coCrc/A+5pblTBfGdbBrdhH3DGWrT1m1DGO5SIr+qtUl5xKM45APQn0XJldOPEsthoYUQaoicIxAHJ45/ZnN4nzhQh8BepppE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000339; c=relaxed/simple;
	bh=hbHSPhq87+/pwYwNvx5gX2zfxPRsJyJzwGcwpxxTEbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJWYcTRhQhOaRJhxQ2CQiht3P+QGyxBt3d9Z0P1N7IADU8PJNpc43xPSI+nscGZkh99J3eBJZuvyejKNPs/VarhxIqnCRdTchFj69TR6wt+zezHn3JaV3SHZwKiPY3+bzN6N+A3sasSlJxbmKXmF4BwlZAxr3nMB3oCPBGBAfIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6Qu1L4A; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6Qu1L4A"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afdd46afe0so868833a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792000336; cv=none;
        d=google.com; s=arc-20260327;
        b=sSLsZunkLxbHn9JiEl1onsWKrVcabSMmck2r1Kx++UXd2zhjkL4Znc6yM72sRT6Ltn
         6QGfNe7DUPwzvY2IppOIC/vdtWQ/CiT4wM9D3ylypASlek5MvZNnkAoCfTmf5IJbOv/m
         QgSD8UMJtshchBV5tNeo5a4YZUzYA4NLtJWDz1V5Wy58omkNNO8Cq0Axw7ySr9odzd1c
         2I12p7fLXf5hhZ1ly0PhDr/Yi6ryoMZLy1Ir1LPHZBDzjxB1kzUAja74+0Xv0xcWJgE9
         arPhs09RO2eJF93NoYl/2cll9KtEvvcrJ6G4VXacjCoSgWJdwfBqCYGRFMiY7ooGHYVW
         vW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ug622xXr9QyPlP/Ov7DfPJB4MLhUVndJohGbmWVpREY=;
        fh=wZCLO4E0/1PQQ7P+C+/eVnYdLWKht3rUvvzazhEBlnA=;
        b=Djv+q8ZJxJgIiILHkZb5XeopzTviwV0yI8D6dMUBBI2pyuITVU3J+yhkdcMOkeRkzH
         a+Amc9rrP1NU+1vqLRdpxY6ZGiV9EHgWOHip3J23lARl6HIAADfj1shvlL8X3BvrfbYd
         aF3+Dx3sxnGYjZTur6CFdbrsSTrh4tnwxZ6NfaSkgA4f7DundaDr98FGai/RrweBvbiQ
         yydKcVKS+E425j99igRpg5z3JpbERF660R+pnt5JgVPRT2nNKbeZ7Dmg/6rwSrSlm9at
         DlZ5jS3F9oxSeda2G/IIkqUrVwMkPrzdhnjXc/NLMebxNjrIU5Tc0m8dAA61oNBxWjnD
         9BNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792000336; x=1792605136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ug622xXr9QyPlP/Ov7DfPJB4MLhUVndJohGbmWVpREY=;
        b=R6Qu1L4AHJBuDACn4coyHjQUcnDafj/0vdancQ/EnPgGCGymLwW5yN7BGIb8tu4op9
         GM6DhSbKUn1RKLznNwv8otDYFe/HrSkHBsxMnC0dx3xlyM6pemKy5Lvyzn/Siy1OZn7Y
         9NlHfkHnFWqAW9bSdePJC56aeKpMsIe5LZJZQAjENpYq1V8KepoSzZcpUoUYwoeZOSwy
         JMSs4/jvpiIne23lCw6AkLphAae6zCfINStfEv3WeubyjoFELyK2UM7/c7BJz2eohVUh
         vDzturfzThHADm8teuq4PkDxmWb/sBVfHK5Z/ABbT5Tzi6qo5JSiAr7aujYldY4/6Mx4
         SHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000336; x=1792605136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ug622xXr9QyPlP/Ov7DfPJB4MLhUVndJohGbmWVpREY=;
        b=d2rbFRgq1kp4GXA4TseC8B6J4qiloyYCO4PXlNp0DML75VGsZcUTwvCoPGzhi4Juby
         5Wv9UOn+dVpE2GH+JmkI6i3FN/Kzxv++7AOSOMUOAJfQtEW3fDHpZ0xiKH0X8zlYUpnF
         aaeBRhL1XHnk00Ff8Etu+BCFoKOB/1teXV2zUwLkev8FmPYPMjNKKND/c80gLN0ck4hB
         QoTgkeq+GrCG2ZEko853+F+FN01RVuyreRAYTCBULPGI0btD0+1zrTrsQJWlWIjFrKw1
         8njtRrVxmaGAGJnnot3x88v3raYCy0LXvTalwnkxU1/rgNGkGlgJRnXIswkTLbHaJIFj
         Dl1A==
X-Forwarded-Encrypted: i=1; AKwUvBzJzk/JjixgCLRqlwnseTfaEksh5w0vP6IrMyZvsMWFbNxqpfAZ+DtxDfb+DucvMzfbEiW7wHDliYeHbLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWEenxMi0502NjYbjy9E4kqsFzeKPHksu7DoHipuD8LFn9VoiA
	RslW91lReLI5h1MjID2fBMAvJtaL8iOj11mPRO+FRxjCGZ1afgy9c5B5MR4yPbF2oJVPO9FgH2h
	iv88lTpuWoSdyq/VppgBmIvYVbD/VScY=
X-Gm-Gg: AYBFou1VpP9N+OO13tYQPwH9HcI+GGJaik/2CWZE8f5Njf7LcijinjuarBq8IMQMRqv
	h9bpV6XQ3uzkqcChcleX/tHjLNcY6cDo1q2xfd1yCoBHyfHjNrACQEQgUJK2udJ50aq4U4EgJap
	mBJLuOdWTgCQmWSYmg53Dlu33jzpfB3uQucjh3W5736Y4+GLDEhPr3Ya96uOGJdB/fU2m78tTRp
	ZU7oDiTHrZnvyYLA4wF08hKxNXGNU4QYwkTAQBl3QUSmTU1yIaorRBX+sgMFge0YiJ6dp0Nceya
	mDROj3mZUDU0MlkQuHLxGk1Y2HwEEe14ZgpRhzssjynKn/FA9AXEFDGkrg9WJFyxDOLt5VrzAiN
	oDRhG7b3S
X-Received: by 2002:aa7:d496:0:b0:6b1:a51d:2091 with SMTP id
 4fb4d7f45d1cf-6b1a51d2173mr7110113a12.3.1792000335396; Wed, 14 Oct 2026
 10:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013084056.1070923-1-nicoyip.dev@gmail.com>
 <20261013090358.1178367-1-nicoyip.dev@gmail.com> <as9otxVeOLbhkIMy@kernel.org>
In-Reply-To: <as9otxVeOLbhkIMy@kernel.org>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Thu, 15 Oct 2026 01:52:04 +0800
X-Gm-Features: AclHuK-mF7f2-ToQFw5yb6eWZea95LJSk6oMoOQo82NHSzDQBf9ruJ97DzyUm-E
Message-ID: <CAAo+4rXGputXtxgkLLAtFSS=utgr=S=ajbqDFZV=jySZ1yz+sw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] keys: Protect quota-owner reads in namespace filters
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jarkko,

On Wed, Oct 14, 2026 at 7:34=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> On Tue, Oct 13, 2026 at 05:03:57PM +0800, Chengfeng Ye wrote:
> > keyctl_chown_key() replaces key->user under key->sem and drops the
> > reference to the previous owner after releasing the semaphore. Readers
> > which do not hold that semaphore can still be using the previous owner
> > when key_user_put() frees it.
> >
> > For example, namespace filtering in /proc/keys can race with chown:
> >
> >   /proc/keys reader                 keyctl_chown_key()
> >   user =3D key->user
> >                                     key->user =3D newowner
> >                                     key_user_put(old)
> >                                       kfree(old)
> >   read user->uid
> >
> > An earlier instrumented run reported:
> >
> >   BUG: KASAN: slab-use-after-free in proc_keys_start+0x353/0x440
> >   Read of size 4 at addr ffff8881128abbc0 by task poc/88
> >   Call Trace:
> >    proc_keys_start+0x353/0x440
> >    seq_read_iter+0x25d/0x1190
> >    proc_reg_read_iter+0x19e/0x260
> >   Allocated by task 86:
> >    key_user_lookup+0x1b4/0x540
> >    keyctl_chown_key+0x3cc/0xbf0
> >   Freed by task 87:
> >    kfree+0x149/0x330
> >    keyctl_chown_key+0x7b0/0xbf0
>
> Last night I missed the text below.
>
> It is somewhat messy to the point that frankly I could not read it, or
> at least I did not understand it. Have you read it yourself?
>
> There is a whole eassay and I can only see that key->user can change
> unless key_user_lock is taken, and READ_ONCE() is required to pair with
> the writers.

That READ_ONCE() should be unnecessary, since key_user_lock now
serializes both readers and writers. I will double-check whether to
drop it.

> I don't understand what is going on down there, and what's your goal
> with it?

Yes, the messy commit message should be cleaned up before sending...
Sorry for that. Basically, it describes why the three `key->user` use
sites should be protected by the lock (because there's no
synchronization) and why the remaining access at other sites doesn't
need it (because other caller sites are synchronized). I will rephrase
the commit message to make it human-readable.


>
>
> >
> > Take key_user_lock explicitly while /proc/keys and find_keyring_by_name=
()
> > copy the owner's UID. find_ge_key() is the initial/seek lookup reached
> > by the reported proc_keys_start() fault; key_serial_next() applies the
> > same UID filter to subsequent entries. find_keyring_by_name() reads the
> > same replaceable owner when looking up named keyrings.
> >
> > key_serial_lock and keyring_name_lock protect these traversals but do
> > not exclude chown. Taking key->sem would sleep under those spinlocks.
> > The embedded key->user->lock cannot protect the dereference needed to
> > acquire it.
> >
> > key_user_put() already holds key_user_lock for the final reference
> > decrement and tree removal. A reader selecting an owner before removal
> > blocks its final release until the UID copy finishes. After removal,
> > the lock and reference-count ordering make the preceding owner
> > replacement visible, including when another task drops the final
> > reference. Mark the pointer loads with READ_ONCE() and the chown store
> > with WRITE_ONCE(); the existing lifetime locking provides the protectio=
n.
> >
> > Retain the quota-owner UID rather than substituting key->uid, since the=
y
> > may differ for thread keyrings.
> >
> > Other owner accesses already have lifetime protection. key_alloc() uses
> > a referenced owner before publishing the key. Final key_put() cannot
> > overlap chown, which holds a key reference. key_gc_unused_keys() handle=
s
> > unreferenced keys: serial-tree removal excludes /proc/keys readers, and
> > keyring_destroy() removes named keyrings under keyring_name_lock before
> > the owner reference is dropped. /proc/key-users already holds
> > key_user_lock during traversal. Quota reservation and instantiation nee=
d
> > the separate accounting serialization.
> >
> > Fixes: 454804ab0302 ("keys: make procfiles per-user-namespace")
> > Fixes: 2ea190d0a006 ("keys: skip keys from another user namespace")
> > Cc: stable@vger.kernel.org
> > Assisted-by: GPT-6-Astra
> > Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> > ---
> > Changes in v4:
> > - Move the quota-reservation and instantiation scopes from v3 1/2 to
> >   the complete accounting fix in 2/2; retain the combined lock coverage=
.
> > - Isolate the namespace-reader lifetime fix and make it independent of =
the
> >   accounting patch by relying on existing lookup/final-release locking.
> > - Pair READ_ONCE() pointer snapshots with WRITE_ONCE() in chown; explai=
n
> >   lifetime ordering and preserve the quota-owner UID filtering semantic=
s.
> > - Include analysis of of the other owner access sites in the changelog
> >
> > v3: https://lore.kernel.org/r/20260927162528.943886-2-nicoyip.dev@gmail=
.com/
> > v2: https://lore.kernel.org/r/20260904080940.575882-1-nicoyip.dev@gmail=
.com/
> >
> >  security/keys/keyctl.c  |  2 +-
> >  security/keys/keyring.c |  7 ++++++-
> >  security/keys/proc.c    | 15 +++++++++++++--
> >  3 files changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> > index d14ace88e529c..c89a4d6efed40 100644
> > --- a/security/keys/keyctl.c
> > +++ b/security/keys/keyctl.c
> > @@ -1039,3 +1039,3 @@ long keyctl_chown_key(key_serial_t id, uid_t user=
, gid_t group)
> >               zapowner =3D key->user;
> > -             key->user =3D newowner;
> > +             WRITE_ONCE(key->user, newowner);
> >               key->uid =3D uid;
> > diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> > index 15bf4af8f2821..4a13749bc54cd 100644
> > --- a/security/keys/keyring.c
> > +++ b/security/keys/keyring.c
> > @@ -1148,6 +1148,7 @@ struct key *find_keyring_by_name(const char *name=
, bool uid_keyring)
> >  {
> >       struct user_namespace *ns =3D current_user_ns();
> >       struct key *keyring;
> > +     kuid_t uid;
> >
> >       if (!name)
> >               return ERR_PTR(-EINVAL);
> > @@ -1158,7 +1159,11 @@ struct key *find_keyring_by_name(const char *nam=
e, bool uid_keyring)
> >        * grants Search permission and that hasn't been revoked
> >        */
> >       list_for_each_entry(keyring, &ns->keyring_name_list, name_link) {
> > -             if (!kuid_has_mapping(ns, keyring->user->uid))
> > +             spin_lock(&key_user_lock);
> > +             uid =3D READ_ONCE(keyring->user)->uid;
> > +             spin_unlock(&key_user_lock);
> > +
> > +             if (!kuid_has_mapping(ns, uid))
> >                       continue;
> >
> >               if (test_bit(KEY_FLAG_REVOKED, &keyring->flags))
> > diff --git a/security/keys/proc.c b/security/keys/proc.c
> > index 4f4e2c1824f18..aa42ea4becec7 100644
> > --- a/security/keys/proc.c
> > +++ b/security/keys/proc.c
> > @@ -68,7 +68,13 @@ static struct rb_node *key_serial_next(struct seq_fi=
le *p, struct rb_node *n)
> >       n =3D rb_next(n);
> >       while (n) {
> >               struct key *key =3D rb_entry(n, struct key, serial_node);
> > -             if (kuid_has_mapping(user_ns, key->user->uid))
> > +             kuid_t uid;
> > +
> > +             spin_lock(&key_user_lock);
> > +             uid =3D READ_ONCE(key->user)->uid;
> > +             spin_unlock(&key_user_lock);
> > +
> > +             if (kuid_has_mapping(user_ns, uid))
> >                       break;
> >               n =3D rb_next(n);
> >       }
> > @@ -80,6 +86,7 @@ static struct key *find_ge_key(struct seq_file *p, ke=
y_serial_t id)
> >       struct user_namespace *user_ns =3D seq_user_ns(p);
> >       struct rb_node *n =3D key_serial_tree.rb_node;
> >       struct key *minkey =3D NULL;
> > +     kuid_t uid;
> >
> >       while (n) {
> >               struct key *key =3D rb_entry(n, struct key, serial_node);
> > @@ -100,7 +107,11 @@ static struct key *find_ge_key(struct seq_file *p,=
 key_serial_t id)
> >               return NULL;
> >
> >       for (;;) {
> > -             if (kuid_has_mapping(user_ns, minkey->user->uid))
> > +             spin_lock(&key_user_lock);
> > +             uid =3D READ_ONCE(minkey->user)->uid;
> > +             spin_unlock(&key_user_lock);
> > +
> > +             if (kuid_has_mapping(user_ns, uid))
> >                       return minkey;
> >               n =3D rb_next(&minkey->serial_node);
> >               if (!n)
> > --
> > 2.43.0
> >
>
> Br, Jarkko

Best regards,
Chengfeng
