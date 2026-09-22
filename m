Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4B53CAE7F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107671; cv=pass; b=ChA+lkDizCyPfCQlQk+UfYy8tPFMFTmtdWjZn4OlRnjm1a15nHPpWrLA75v1C5yCJHJQOtI1caj8PSXTa4FRx8HTcaLDhPTHX49wcOYE7zDd8m+HDCUtS1DTM2DP/JnWcX2ekkdfo+HV97IfGwz3BGAwxac/isFeGf9a9wlWrNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107671; c=relaxed/simple;
	bh=SrJaGHHbv8gk4RfxUwzPYTQZYzC3ejgqVQBh7or0lxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KmO+6kyakh8dtWMUimRuKOnu9ZROln1XTvHcKgVhvGnG3fOD+osF7F3KDSGLj/9z9+Dac4j7a1lAAlS82r1RCTE1pfvQ6sTYriQZBpq9s3G4ob50FhKSanCLNctfOKpVj6OV4WxmQoSRJxgCZj4Nxosd1+daDmAkYsVRhKmchts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ihY8WyH4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CvYiRZOm; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ihY8WyH4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CvYiRZOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790107643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyOXKWFvSris2DY7q+sIhRXpq5TeCWL3zaIqbcp2AzA=;
	b=ihY8WyH4U3apUx7dbkmjfqU77+nXPqFZ0xozBviWL8etbUqxJfjMUB2aU0DhkGCI/Qxu4v
	KMI7blt1TPNI4qcZ3oDgbsT6mAxOnxadZ1LnMF90EIuzNVRzkiY8Sn8p0M1vMRcUTVb/tc
	cnegQaFHWwYQL8vBSz9BGFn/Q35ERQk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-eC8fHvGdPJCWUvyAtVFvLQ-1; Tue, 22 Sep 2026 16:07:22 -0400
X-MC-Unique: eC8fHvGdPJCWUvyAtVFvLQ-1
X-Mimecast-MFC-AGG-ID: eC8fHvGdPJCWUvyAtVFvLQ_1790107641
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c251c140b41so13227466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790107641; cv=none;
        d=google.com; s=arc-20260327;
        b=gqykSw+ojTourmzoipqXU2Z+w5J3dlpQxKjRD5vTNiuQIPPZOzAuMtdDOJkSDDJXpQ
         fXRRNBRnOWIPyAoZiTVw8IEgX7tX9XKdDEs3H1nILGJ3cXdhJqhbvy5pWZ/DouDFfn0y
         3F6KCv4rczbT3r6mWkFcE8BpVYG0ZgGAxlY+hgb8SeAD6UX/8nSy54hld4v6Pc9q8WRo
         cMiDnlAoKEBsPsxnFz1Bys92FCyB0Dqh34GpXow7Twgw4C/o9HL/ZrtlybPQ3mf4OL4d
         cO7wP3mEZFiFL3rhzx+wRVJyk9r1f4a9L1nHzUDdjYvGkNXKTtk29y5TWb6WDf1r9IMG
         W0xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qyOXKWFvSris2DY7q+sIhRXpq5TeCWL3zaIqbcp2AzA=;
        fh=sfHG9/isVZwb+7lTrH9Va4N773yS10hVcinVyJoNPfo=;
        b=dHvunVgyJJTGVqWCzOgQH1uffxxggBPIDuWMJ/UAExg+XVWLKXguMJtOndXFEcrAzH
         NZV4F09x/nbkR92lmPQvdrdLSphetCHHAtPQ9uWsWeAgT/+A19F25BLdkGkKhwkWtE5Z
         SSsb4wNIQ4KnTLfOkb87hH6DItoP/YIkpE5WJBZAPCh5bGCkeGrbxCsV/Vbmb+ibzbkQ
         oWNXj0T2R5CZ6o4Ox4XUY8sc8aWBxaV4G9Sif1E02sCXFwy0zdodqclJhmHJA5jOn28g
         aqVlcZUnQEy4+mRiXf9k8J2O6hyBENWjDDVzgO+ijz1J3Loj5QD0FJ+8G5/3fmKP83QV
         +7RQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790107641; x=1790712441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qyOXKWFvSris2DY7q+sIhRXpq5TeCWL3zaIqbcp2AzA=;
        b=CvYiRZOmcxokFhHByQ+2O81DRNEVhqy66woB3KsVOFddMn0IHgSM9Dk3KC4tS4IWZ1
         ZjPubqysF18V90RMnuWub9XL7p0oT2eitrj8zb4OItEjiQnf401tX/kzOgVOUu1rk1t+
         X0SWuLo/8Fogepm2VZSv4/zj5WHXsfnJhqN5zP7dLRQ0Avbv0nTrVi+9Ll/uzmkDTd+E
         MiEzjWAQlyxcAYFjArlQ65o/3HKukl5+aobGVChLb9aFCrEBuF+7pUy8e+8cYtwFj5u0
         r9vAaUSbgQu1O33+930W+j6EukjU5rkm3yuufq9rTNPQtbFX2up+xWVwHXgEyUUExaYW
         /ytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107641; x=1790712441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qyOXKWFvSris2DY7q+sIhRXpq5TeCWL3zaIqbcp2AzA=;
        b=if1u4Srej7J9v/VdPx9OJxigpIvHoRioF2eP1AIWjff1VXatL+/e1K6z2cE+oe0DSJ
         h+RZnS8e3IFoWJHJH4tVo3MQYXM6BC2tyqZjf6XF+LXGvXo8VaB8jiuE+2oCfbPs5wPP
         B5n/paCRkMFzo8aMldbu52x3QILZ4QklJH9ZdjkMOmoCPMbAnmt1cBUKyFMmawiGyqNO
         7oqLq4jz8Ex/RJejFJ3zy8fwS9FAtdrHTa7OcN29eI0+i0bXFPBkmJlpcbhcw2jwohj7
         tPCrR8zy+N9HHOFQPqXTbjPbNbKheqOxwwyL/yyPVRqWGMKDAjGS28ivlDr8IoNgkLE9
         bhYA==
X-Forwarded-Encrypted: i=1; AKwUvBz1VVZJOy7cqewU5ALfsKqlfirvspkE8BmIpkc/QMG2f0Nb8TVwzGhMHp/xep1JwXzO8tRqgDmcbNuIgMM=@vger.kernel.org
X-Gm-Message-State: AFuF++kXhc6IcuJkhr9glPIDHk5qAUpIJMJOx2ObKL8SeQ27n/0URhs6
	2JLv8AXXFGtg8Z34MPHIZ4sdZQayo9Qm3qR40dQROza4nrjDNs/T9s77vHwWZ+1X2bE2aIZSiBt
	/GvdftNHd8bJO1UBQfJqawtaoiaCnZnsJgo9oViQLHeoPyDLr+RGxVaMxrbdEbkj9kzrU6Kp/Yw
	HzGyhPRd14y2etNI96YzAcegTLbdYUBbY0ztdUBbM3
X-Gm-Gg: AYBFou0CeUJ3LTNAkxcCbYpbBEKNYJY1wpQyfhbEBwFfn0GX3f16iO3nkb/oN/Rja7I
	v9mi/tXCzPzeIW1gsqAFoqoQlrQJVRdu2p8tOUQ6XzDfBkcXKIAdLsfUEIzb7aeQJo9zoHzlJ5I
	ITY2Yr70XH/srAVUVI/nfvf/RqFvL4vC8NSD8NodxsnLdwpMsQzbLMGiGYZT+BR+ai/W7c9iWSC
	s2T4FP25oypNXkB6rm1X9FFFd4++wjv0Knz2Wk3XeNTTLs96CRLByepFlXFQXOK1ylEEs5BjT2J
	emg=
X-Received: by 2002:a17:907:3e91:b0:c24:6445:d19 with SMTP id a640c23a62f3a-c2aadf138d9mr32189266b.17.1790107641291;
        Tue, 22 Sep 2026 13:07:21 -0700 (PDT)
X-Received: by 2002:a17:907:3e91:b0:c24:6445:d19 with SMTP id
 a640c23a62f3a-c2aadf138d9mr32187066b.17.1790107640870; Tue, 22 Sep 2026
 13:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921195921.4174830-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <CAABTaaC+vZmvg6s26oaYzkmnEvR42ZYcXutKfVNAa8VsK5ApDw@mail.gmail.com> <e4872a4b49c279e792adb228281d1513@oss.cyber.gouv.fr>
In-Reply-To: <e4872a4b49c279e792adb228281d1513@oss.cyber.gouv.fr>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Tue, 22 Sep 2026 17:07:08 -0300
X-Gm-Features: AclHuK__KqL1ADBhQwjfIgYv1YfYiX7v6X14rqvorp2ogNXHNUGZYZtWa0wta80
Message-ID: <CAABTaaA3A34wWdaWbQaSxepDtwZk9_UsV1ihjEXM3kcfYVQ5hA@mail.gmail.com>
Subject: Re: [PATCH] audit: fix exe mark UAF in kill_rules()
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <jeremy.jean@oss.cyber.gouv.fr>
Cc: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bradley Morgan <brads@mainlining.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 10:47=E2=80=AFAM J=C3=A9r=C3=A9my Jean
<jeremy.jean@oss.cyber.gouv.fr> wrote:
>
> On 2026-09-22 13:26, Ricardo Robaina wrote:
> > On Mon, Sep 21, 2026 at 5:07=E2=80=AFPM J=C3=A9r=C3=A9my Jean
> > <Jeremy.Jean@oss.cyber.gouv.fr> wrote:
> >>
> >> kill_rules() removes mixed AUDIT_DIR and AUDIT_EXE rules when an audit
> >> tree is pruned. It drops entry->rule.exe before removing the rule from
> >> the RCU-visible filter lists.
> >>
> >> After a rule has been installed with AUDIT_ADD_RULE, which requires
> >> CAP_AUDIT_CONTROL, removing or moving the watched directory can race
> >> with another task that is still evaluating the rule. In that case,
> >> fsnotify can free the executable mark before the reader reaches
> >> audit_mark_compare(), causing a use-after-free.
> >>
> >> KASAN reports:
> >>
> >>     BUG: KASAN: slab-use-after-free in audit_mark_compare+0x8d/0xa0
> >>
> >> Remove the rule from the RCU-visible filter lists first, wait for a
> >> grace
> >> period, and only then drop the executable mark. audit_del_rule()
> >> already
> >> uses this ordering.
> >>
> >> Fixes: 34d99af52ad4 ("audit: implement audit by executable")
> >> Assisted-by: Codex:gpt-5
> >> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> >> ---
> >>  kernel/audit_tree.c | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/kernel/audit_tree.c b/kernel/audit_tree.c
> >> index 1ed19b7..864a58b 100644
> >> --- a/kernel/audit_tree.c
> >> +++ b/kernel/audit_tree.c
> >> @@ -553,11 +553,12 @@ static void kill_rules(struct audit_context
> >> *context, struct audit_tree *tree)
> >>                 if (rule->tree) {
> >>                         /* not a half-baked one */
> >>                         audit_tree_log_remove_rule(context, rule);
> >> -                       if (entry->rule.exe)
> >> -                               audit_remove_mark(entry->rule.exe);
> >>                         rule->tree =3D NULL;
> >>                         list_del_rcu(&entry->list);
> >>                         list_del(&entry->rule.list);
> >> +                       synchronize_rcu();
> >> +                       if (entry->rule.exe)
> >> +                               audit_remove_mark(entry->rule.exe);
> >>                         call_rcu(&entry->rcu, audit_free_rule_rcu);
> >>                 }
> >>         }
> >> --
> >> 2.47.3
> >>
> >>
> >
> > Hi J=C3=A9r=C3=A9my,
> >
> > Thanks for troubleshooting and fixing this bug.
> >
> > sashiko's review makes sense, though: synchronize_rcu() inside the
> > loop waits a full grace period per rule, and kill_rules() runs with
> > audit_filter_mutex held, so a tree with many rules stalls other audit
> > config operations. Below is an untested suggestion to use a single
> > grace period instead.
> >
> > diff --git a/kernel/audit_tree.c b/kernel/audit_tree.c
> > index 1ed19b775912..5a3d7c7ba5ce 100644
> > --- a/kernel/audit_tree.c
> > +++ b/kernel/audit_tree.c
> > @@ -549,18 +549,30 @@ static void kill_rules(struct audit_context
> > *context, struct audit_tree *tree)
> >         list_for_each_entry_safe(rule, next, &tree->rules, rlist) {
> >                 entry =3D container_of(rule, struct audit_entry, rule);
> >
> > -               list_del_init(&rule->rlist);
> >                 if (rule->tree) {
> >                         /* not a half-baked one */
> >                         audit_tree_log_remove_rule(context, rule);
> > -                       if (entry->rule.exe)
> > -                               audit_remove_mark(entry->rule.exe);
> >                         rule->tree =3D NULL;
> >                         list_del_rcu(&entry->list);
> >                         list_del(&entry->rule.list);
> > -                       call_rcu(&entry->rcu, audit_free_rule_rcu);
> > +               } else {
> > +                       list_del_init(&rule->rlist);
> >                 }
> >         }
> > +
> > +       if (list_empty(&tree->rules))
> > +               return;
> > +
> > +       synchronize_rcu();
> > +
> > +       list_for_each_entry_safe(rule, next, &tree->rules, rlist) {
> > +               entry =3D container_of(rule, struct audit_entry, rule);
> > +
> > +               list_del_init(&rule->rlist);
> > +               if (entry->rule.exe)
> > +                       audit_remove_mark(entry->rule.exe);
> > +               call_rcu(&entry->rcu, audit_free_rule_rcu);
> > +       }
> >  }
> >
> >  /*
>
> Hello Ricardo,
>
> Many thanks for your nice and constructive answer.
>
> Indeed, sashiko's review makes sense and your suggested v2 is a good
> fix.
> I have replayed my reproducer to ensure that it indeeds fix the reported
> bug.
>
> However, I wonder whether the wait should still happen in the case where
> all removed rules have rule->exe =3D=3D NULL. Doesn't call_rcu() already
> free (kernel/auditfilter.c:96)?  If yes, could we skip synchronize_rcu()
> in
> that case? If this question is valid, how about this fix based on yours,
> which
> simply adds a bool to detect whether synchronize_rcu() should be called.
>
> If you think this addition is good, I can send a v2 with that.

It looks like a nice optimization, good catch! synchronize_rcu() is
usually expensive, so calling it only when necessary is an improvement
for sure.

One minor detail, I'd use 'entry->rule.exe' instead of 'rule->exe' in
the need_sync check just for consistency.

>
> diff --git a/kernel/audit_tree.c b/kernel/audit_tree.c
> index 1ed19b775912..e2cd27b17590 100644
> --- a/kernel/audit_tree.c
> +++ b/kernel/audit_tree.c
> @@ -545,22 +545,38 @@ static void kill_rules(struct audit_context
> *context, struct audit_tree *tree)
>   {
>          struct audit_krule *rule, *next;
>          struct audit_entry *entry;
> +       bool need_sync =3D false;
>
>          list_for_each_entry_safe(rule, next, &tree->rules, rlist) {
>                  entry =3D container_of(rule, struct audit_entry, rule);
>
> -               list_del_init(&rule->rlist);
>                  if (rule->tree) {
>                          /* not a half-baked one */
>                          audit_tree_log_remove_rule(context, rule);
> -                       if (entry->rule.exe)
> -                               audit_remove_mark(entry->rule.exe);
>                          rule->tree =3D NULL;
>                          list_del_rcu(&entry->list);
>                          list_del(&entry->rule.list);
> -                       call_rcu(&entry->rcu, audit_free_rule_rcu);
> +                       if (rule->exe)
> +                               need_sync =3D true;
> +               } else {
> +                       list_del_init(&rule->rlist);
>                  }
>          }
> +
> +       if (list_empty(&tree->rules))
> +               return;
> +
> +       if (need_sync)
> +               synchronize_rcu();
> +
> +       list_for_each_entry_safe(rule, next, &tree->rules, rlist) {
> +               entry =3D container_of(rule, struct audit_entry, rule);
> +
> +               list_del_init(&rule->rlist);
> +               if (entry->rule.exe)
> +                       audit_remove_mark(entry->rule.exe);
> +               call_rcu(&entry->rcu, audit_free_rule_rcu);
> +       }
>   }
>
>   /*
>
> Regards,
> J=C3=A9r=C3=A9my
>

--Ricardo

