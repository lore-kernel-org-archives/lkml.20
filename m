Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0008E3F412D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365606; cv=pass; b=UCmYB+ctbe5dpw2sAo+OICFxKY/XvWiIxHM/ybw6J51CnbvW1hpu1HPhIfvyu5wAXV+pTAtPmuwvefLjBDCaCdvgcjwSym9vtNIzoT5o6Jcd0bmmdU/V9GI6wd9S+7saJAAX2mdoLafZz2ESC+pvXwM4y3yoNs9EmrFqV3y7UMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365606; c=relaxed/simple;
	bh=Xwx+i8ie8iWt9T1gkOr8D3LhF3LdmlPxqV7GjAiFZAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXIae5Uh4L870ljk8Wj64btah6g4Xl6VJZebm4MdcYBrd9D6E8XgB0ZDKs3G3oKLku9OOE8iz3DSei600+kN1hNrJ4d5l36CZ7UqJHCV/WLn5ipF+9jWuIClXEk5K7Ic1TX0BhG8jf3mXsdlUk5a0+hjYMCtk5viznNyZuJ6yJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XM2RNVB+; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XM2RNVB+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4957eefd361so8386765e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788365602; cv=none;
        d=google.com; s=arc-20260327;
        b=b8M4qsz+gQodecmT+58jhGUOjBl9BEQT2QPnio6/r/oQEDlUw805CtEUzzrITpTTZE
         vwLqWqI3B5tJQ+uH43H42yzuPdrvWkvGaR1UBWydZgJqWVHMwsFvpWzz1LuCNcTOXZ7l
         BvvWGd8JkUU1INTBpE60UOy1Q8yiixh//W28za6eiWKtZ/ZjpW7Ru0O/JaQp2R2+XQFz
         5NbnZGqusYpXVrCI+x/BcrCzk6RC0GhrAipOT62RpTnwAFS2LoTTZTol4vYHSilt8g5z
         gYhcbJuq5zjgbByohGOPbN1d6/0kH9g2Pe/FC9IM/npluOV3K8ns70CC4NMX00MmikAI
         okkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qdS3hS3kVE/eGxKJX6EKacC7t5SUHZQkdHOd2e2KnX0=;
        fh=wypwwOti1u1+P9DMi+gycSgOAVzzYCN+IV9Wm5usIAc=;
        b=LxwKLbBcOiSCcD2nEENoi+gUxmPYyA2634UCOUgu3Uq7jjrrIVZzBQMISGs75PzT2M
         bBTMSYzNCRlZlkbP0TffKMwt101fDcpcpxXmDeZ/DPueWrWx3Xq5iE5HDd6WOLq4pjhF
         U+B9IzC5dVFf8pb6x1HKDxuJm127yNVykoZcbov/LVTq2UEJCJh6Uqwwm6RWdU20Y2pG
         2fZR1EKWd9sox5vtuOMVrfUEHVNy6S7WGjfaq6/Aql/j9Bdk9+wHnm/Y8Mp+S0RVdFQs
         eFfXbYJeVDSqGrPKHFdpa3kciWZo+h3WqZ+sNvV+EDLjJaMk90rWwHXSZ7xX2pAAKx5B
         cSfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788365602; x=1788970402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qdS3hS3kVE/eGxKJX6EKacC7t5SUHZQkdHOd2e2KnX0=;
        b=XM2RNVB+duezqXN8bttNExi9usm0mzUJXgXovPdymOoPnOs4P+Y+O/vd7Mn2jT9dCB
         kMheAFbBuAiLDurgsqgHKsK2sVv4mJeaqjjDOB9L2YqpV/BhF55kdsExZFbc1StTGCv2
         qJG2t9WERoL1Q82RlFzyeovr4LRhqf04w8UC4RixWSq1QibVxpvCO6fXelCVKwFB9X5V
         hdqmdL1CX1ozyXJRQu4y7/xfPyae8pXGH8K+Ytw5cxzyVBybU0mNvOa3wIH/WKlSH7/E
         Zhw2/gxzouHiNxib4H9j3LoXMX3NwIkLITYflN9Di4vFZ48Y4xPZ3wRprRQXt8IBlFqn
         XhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365602; x=1788970402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdS3hS3kVE/eGxKJX6EKacC7t5SUHZQkdHOd2e2KnX0=;
        b=Qe5k4CTwGTgiz4DT2JpsDe3Fl2wRt9hjyzFkhg8t8DSRYhDr3oZyVI+OXeo4oSWDul
         eQFoXPfyMaw918gSymgK2rM56xQYUeOLPgqEg0WwpIhQ2rd35j2jC/TbLZkYnXEfDFKK
         ptQ8BoSNad0qhlDsQKWemKVnXrR11FsItfd2/KTQkeh9Y42aun7BEwyBw/Q4/sZkuQVk
         Q66Ix0ZR3meghY9Vpb4AP9yzvVkF0iuNCi+9tpU1Jb9GEsJ/XuFBz6pi8XvTT3EBWarA
         9Z2h52mdsNrz9R3fcysLsSTDWw98FTRUGEN/76t3/cZfee6I+WblmDRYkE6EmuAufhF1
         rNqw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3X8L81kTJI5/6/LLsdU/ArMGGBSX2FbxuMA40DJ7+pwS7kaRV9qxsOiChATEFEkodZu541PjsdJ4mnF4=@vger.kernel.org
X-Gm-Message-State: AFuF++kgWCTpafSOl+lzyZj2Hc/J8x04sLX/hnIzm2QiMfJ33Zty4MZW
	xiX7ORPk4vGHyIQVeMTKmYHfqARnfIJCOD9PG4TH3eskq/TZHvYF6z1F9EohikdLpCovCFGNC9l
	mkVl0Tidjg+eBR/uyxfFAaH2ZVNsZesU=
X-Gm-Gg: AR+sD121wiugHoU6dielSNN2y/oBF+WIs7mgVmiXfVW8XHG6+Gj5lHprhLsfLexhmgm
	nscdIOmhUrtca8aPTiXuvlKOQpNoAwEug0oL4rtXqGow0fPS7fxGDsZIvkN1RcRefXDG8erMtxN
	KwrbzsxxJzw7s/adGBoIhohhV0gUj8zrg7AK+SiJ7WRrlZP0G7DzyAA/DSgZP5dkpNDD940CmAZ
	bIh6y5dURTPg9AnB75S5dhJ6h4XBKxx56qGf/yzRXAlLrHmNTmhXl5LMQiipVjTnA+8qp+KWlM9
	Rx3a8aYSf3FIe3Ip6dWbk8M7sVbQribGgdwQgAL2cFAO3dqDt4fxWgU873+ap8s6mcGgcZkuQLP
	9yA==
X-Received: by 2002:a05:600c:4e87:b0:49c:dc14:d681 with SMTP id
 5b1f17b1804b1-49ce580a50cmr82648105e9.3.1788365601129; Wed, 02 Sep 2026
 09:13:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831074937.2380914-1-kunwu.chan@linux.dev>
 <0eac36c5-acd2-4d8d-a498-f56a57cc3d6a@paulmck-laptop> <CAN_Opa_z4e8fLM0=+QV82r4oveKKUWitvNrBnsfJhXd+2-QQLQ@mail.gmail.com>
 <ce1789d4-7a78-456c-9e6e-e9af824e5285@paulmck-laptop> <CAN_Opa_AYw-KSA-u5=fjGLOP9z-Cf1Dk2Fba==MSLAX7TZSYWQ@mail.gmail.com>
 <e521bee4-e8ab-40a2-b22f-325d37fbcd63@paulmck-laptop> <CAN_Opa_7gKNuibT07tM=TcMYoTEzjeBO_=9WCoxVnY=-Jq2hcg@mail.gmail.com>
 <eeba30f0-5a74-42ce-b559-dec079c8b84a@paulmck-laptop> <CAN_Opa_aRqEvnni_3yuAMkugZnY9L7C-_OxQqaYhEp-E9amtzg@mail.gmail.com>
 <ab114f9f-ccb2-4d51-a7e7-f66275d2cd57@paulmck-laptop>
In-Reply-To: <ab114f9f-ccb2-4d51-a7e7-f66275d2cd57@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 3 Sep 2026 00:13:08 +0800
X-Gm-Features: AcwNN1UDipEhtIq8JbPgQQ0cCAU-NWAW9zxEaU3zTtwHovBlImSy3NwElXbihD8
Message-ID: <CAN_Opa8yY072zV=pVnkGPZwY8z9Wg0-vGHUCXM9R6E8mjnhCsQ@mail.gmail.com>
Subject: Re: [PATCH] srcutiny: Add atomic SRCU operation checks and state
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 11:40=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Wed, Sep 02, 2026 at 05:47:14PM +0800, KunWu Chan wrote:
> > On Wed, Sep 2, 2026 at 1:20=E2=80=AFPM Paul E. McKenney <paulmck@kernel=
.org> wrote:
> > > On Wed, Sep 02, 2026 at 11:05:22AM +0800, KunWu Chan wrote:
> > > > On Wed, Sep 2, 2026 at 12:52=E2=80=AFAM Paul E. McKenney <paulmck@k=
ernel.org> wrote:
> > > > > On Tue, Sep 01, 2026 at 04:29:05PM +0800, KunWu Chan wrote:
> > > > > > On Tue, Sep 1, 2026 at 11:10=E2=80=AFAM Paul E. McKenney <paulm=
ck@kernel.org> wrote:
> > > > > > > On Tue, Sep 01, 2026 at 10:00:24AM +0800, KunWu Chan wrote:
> > > > > > > > On Tue, Sep 1, 2026 at 9:04=E2=80=AFAM Paul E. McKenney <pa=
ulmck@kernel.org> wrote:
> > > > > > > > > On Mon, Aug 31, 2026 at 03:49:37PM +0800, Kunwu Chan wrot=
e:
> > > > > > > > > > From: Kunwu Chan <kunwu.chan@gmail.com>
> > > > > > > > > > Add atomic SRCU operation checks and the associated sta=
te to Tiny
> > > > > > > > > > SRCU.
> > > > > > > > > >
> > > > > > > > > > An atomic SRCU domain does not use the normal SRCU call=
back and
> > > > > > > > > > grace-period machinery.  In particular, a callback queu=
ed with
> > > > > > > > > > call_srcu() would never be processed.  Use WARN_ON_ONCE=
() to reject
> > > > > > > > > > call_srcu() and srcu_barrier() on atomic SRCU domains.
> > > > > > > > > >
> > > > > > > > > > For synchronize_srcu(), redirect atomic SRCU domains to
> > > > > > > > > > synchronize_srcu_atomic().
> > > > > > > > > >
> > > > > > > > > > Add srcu_reader_flavor to the Tiny SRCU state for these=
 checks.
> > > > > > > > > > Tiny SRCU does not currently set the flavor for atomic =
SRCU domains,
> > > > > > > > > > but keeping the flavor in the common state allows the o=
peration
> > > > > > > > > > checks to enforce the restriction once atomic flavor tr=
acking is
> > > > > > > > > > enabled.
> > > > > > > > > >
> > > > > > > > > > Also initialize srcu_atomic_gp_flag, which was previous=
ly left
> > > > > > > > > > uninitialized.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > > > > > > > > > ---
> > > > > > > > > >  include/linux/srcutiny.h |  1 +
> > > > > > > > > >  kernel/rcu/srcutiny.c    | 12 ++++++++++++
> > > > > > > > > >  2 files changed, 13 insertions(+)
> > > > > > > > > >
> > > > > > > > > > diff --git a/include/linux/srcutiny.h b/include/linux/s=
rcutiny.h
> > > > > > > > > > index 47a368f945e3..2b293336525a 100644
> > > > > > > > > > --- a/include/linux/srcutiny.h
> > > > > > > > > > +++ b/include/linux/srcutiny.h
> > > > > > > > > > @@ -20,6 +20,7 @@ struct srcu_struct {
> > > > > > > > > >       u8 srcu_gp_running;             /* GP workqueue r=
unning? */
> > > > > > > > > >       u8 srcu_gp_waiting;             /* GP waiting for=
 readers? */
> > > > > > > > > >       u8 srcu_atomic_gp_flag;         /* Serialize atom=
ic GP work.*/
> > > > > > > > > > +     u8 srcu_reader_flavor;          /* Values: SRCU_R=
EAD_FLAVOR_.*  */
> > > > > > > > > >       unsigned long srcu_idx;         /* Current reader=
 array element in bit 0x2. */
> > > > > > > > > >       unsigned long srcu_idx_max;     /* Furthest futur=
e srcu_idx request. */
> > > > > > > > > >       struct swait_queue_head srcu_wq;
> > > > > > > > > > diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutin=
y.c
> > > > > > > > > > index 26ea4bfbeaf2..22f7716cbb0e 100644
> > > > > > > > > > --- a/kernel/rcu/srcutiny.c
> > > > > > > > > > +++ b/kernel/rcu/srcutiny.c
> > > > > > > > > > @@ -41,6 +41,7 @@ static int init_srcu_struct_fields(st=
ruct srcu_struct *ssp)
> > > > > > > > > >       ssp->srcu_cb_tail =3D &ssp->srcu_cb_head;
> > > > > > > > > >       ssp->srcu_gp_running =3D false;
> > > > > > > > > >       ssp->srcu_gp_waiting =3D false;
> > > > > > > > > > +     ssp->srcu_atomic_gp_flag =3D 0;
> > > > > > > > >
> > > > > > > > > Good catch!  I will be folding this into the base commit =
with attribution
> > > > > > > > > on my next rebase:
> > > > > > > > >
> > > > > > > > > 9a2e9996ccec ("srcutiny: Add an atomic Tiny SRCU")
> > > > > > > > >
> > > > > > > > > >       ssp->srcu_idx =3D 0;
> > > > > > > > > >       ssp->srcu_idx_max =3D 0;
> > > > > > > > > >       INIT_WORK(&ssp->srcu_work, srcu_drive_gp);
> > > > > > > > > > @@ -289,6 +290,9 @@ EXPORT_SYMBOL_GPL(srcu_defer_drain)=
;
> > > > > > > > > >  void call_srcu(struct srcu_struct *ssp, struct rcu_hea=
d *rhp,
> > > > > > > > > >              rcu_callback_t func)
> > > > > > > > > >  {
> > > > > > > > > > +     if (WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D S=
RCU_READ_FLAVOR_ATOMIC))
> > > > > > > > > > +             return;
> > > > > > > > > > +
> > > > > > > > > >       if (should_rcu_defer()) {
> > > > > > > > > >               /* A re-entrant call_srcu() during the dr=
ain would livelock it. */
> > > > > > > > > >               if (READ_ONCE(srcu_defer_draining) && !in=
_nmi()) {
> > > > > > > > > > @@ -319,6 +323,11 @@ void synchronize_srcu(struct srcu_=
struct *ssp)
> > > > > > > > > >  {
> > > > > > > > > >       struct rcu_synchronize rs;
> > > > > > > > > >
> > > > > > > > > > +     if (WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D S=
RCU_READ_FLAVOR_ATOMIC)) {
> > > > > > > > > > +             synchronize_srcu_atomic(ssp);
> > > > > > > > > > +             return;
> > > > > > > > > > +     }
> > > > > > > > > > +
> > > > > > > > > >       srcu_lock_sync(&ssp->dep_map);
> > > > > > > > > >
> > > > > > > > > >       RCU_LOCKDEP_WARN(lockdep_is_held(ssp) ||
> > > > > > > > > > @@ -415,6 +424,9 @@ EXPORT_SYMBOL_GPL(synchronize_srcu_=
atomic);
> > > > > > > > > >  /* Register any deferred callbacks, then wait for all =
in-flight ones. */
> > > > > > > > > >  void srcu_barrier(struct srcu_struct *ssp)
> > > > > > > > > >  {
> > > > > > > > > > +     if (WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D S=
RCU_READ_FLAVOR_ATOMIC))
> > > > > > > > > > +             return;
> > > > > > > > > > +
> > > > > > > > > >       __srcu_defer_drain(ssp);
> > > > > > > > > >       synchronize_srcu(ssp);
> > > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > The rest is good as far as it goes, but don't we need to =
set the value
> > > > > > > > > of ssp->srcu_reader_flavor somewhere for atomic srcu_stru=
ct structures?
> > > > > > > > >
> > > > > > > >
> > > > > > > > Hi Paul,
> > > > > > > >
> > > > > > > > Yes, agreed. I have the flavor tracking changes implemented=
 locally
> > > > > > > > and am testing them now.
> > > > > > > > I=E2=80=99ll send the updated patch shortly.
> > > > > > > >
> > > > > > > > I also have draft patches for the documentation and the fas=
t path, as
> > > > > > > > well as rcutorture testing for
> > > > > > > > tiny atomic srcu , which I=E2=80=99ll send separately.
> > > > > > >
> > > > > > > Sounds good, and I am looking forward to seeing them.
> > > > > >
> > > > > > Hi Paul,
> > > > > > I=E2=80=99ve sent the flavor tracking changes as [1].
> > > > > > [1] https://lore.kernel.org/all/20260901074815.3145037-1-kunwu.=
chan@linux.dev/
> > > > > >
> > > > > > >
> > > > > > > I will admit that I am curious as to why Tiny Atomic SRCU nee=
ds different
> > > > > > > rcutorture testing than does Tree Atomic SRCU, but I will ask=
 myself
> > > > > > > that question again when I see your patches.  ;-)
> > > > > >
> > > > > > You=E2=80=99re right that the existing SRCU torture configurati=
on can exercise
> > > > > > the atomic path with rcutorture.reader_flavor=3D0x10. I had pre=
pared
> > > > > > the Tiny atomic torture test as a separate draft, mainly adding=
 local
> > > > > > configurations for convenience while validating the Tiny and Tr=
ee
> > > > > > atomic paths. There is no Tiny-specific torture model here.
> > > > > >
> > > > > > I can adjust the final rcutorture configuration and naming base=
d on your
> > > > > > preference.
> > > > >
> > > > > The best approach is to add a section to this script:
> > > > >
> > > > > tools/testing/selftests/rcutorture/bin/torture.sh
> > > > >
> > > > > This would require adding a command-line parameter such as
> > > > > --do-atomic-srcu and friends.  The effect would be that people li=
ke
> > > > > me would run short tests of atomic SRCU frequently.
> > > >
> > > > Thanks Paul. I=E2=80=99ll add an atomic SRCU option to
> > > > torture.sh so that it can be run as a short, frequent test.
> > >
> > > Very good, looking forward to seeing it!
> > >
> > > > During my atomic SRCU testing, I noticed that kvm-recheck-rcu.sh
> > > > can report =E2=80=9CReader Batch close calls=E2=80=9D even though t=
he kernel reports
> > > > End of test: SUCCESS with no WARNING/BUG. The atomic GP rate is als=
o
> > > > much higher than normal SRCU.
> > > >
> > > > I=E2=80=99m still checking whether this is inherent to atomic SRCU,=
 related to
> > > > my earlier fastpath change, or an interaction with the torture read=
er
> > > > delay. I=E2=80=99ll continue investigating this as part of the test=
ing work.
> > >
> > > The close calls can happen due to memory reordering.  But this is new
> > > code, so please do check them carefully.
> >
> > Thanks, Paul. That gives me a useful reference point.
> >
> > > The high atomic grace-period rate is expected behavior.  On my x86
> > > laptop, I see about 75/second for Tree Atomic SRCU and about 300
> > > for Tiny.  But at your end, how high is high?
> >
> > On my x86 PC, with the earlier fastpath change, I was seeing:
> > Tree Atomic SRCU: about 250=E2=80=93530 GPs/sec
> > Tiny Atomic SRCU: about 290 GPs/sec
> >
> > After reverting the fastpath change, Tree Atomic SRCU dropped to about
> > 129 GPs/sec, while Tiny remained around 291 GPs/sec. So the Tiny result
> > is close to your ~300/sec reference, while the Tree result is somewhat
> > higher than your ~75/sec observation.
> >
> > The close-call behavior also changed with the fastpath. With the fastpa=
th,
> > batch[2] was non-zero (6=E2=80=93334 in my runs). After reverting it, b=
atch[2] was
> > consistently 0. batch[1] can still occur on Tree SRCU, but I have not
> > seen readers spanning 3 or more GPs.
>
> These results suggest that you should very carefully check memory orderin=
g
> in the fastpath code.
>

Thanks, Paul. I appreciate the reminder.
I'll carefully verify the memory-ordering assumptions in the fastpath and
run more torture tests with the relevant configurations/architectures.

> > I'll continue checking the close-call behavior with repeated torture ru=
ns, with
> > particular attention to the memory-ordering aspect you mentioned.
>
> Sounds good, thank you!

Thanks again!
Kunwu

>
>                                                         Thanx, Paul
