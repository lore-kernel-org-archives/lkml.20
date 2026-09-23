Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693AA4EDCB8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164543; cv=pass; b=ShP+1T5t+rzAk4t7jTxteuKYL+1afVeYFlyb6rQvrCvmdsvHHCyTnTckc6We1+SamCoP0bAEZN3w/S3hUosr3kET5dKNBGIWgLxtPYvWgz7f0yOPBwTYhiU1fRSx+9KeMghIUmLvpX7sRIqmtMjRU5WTln8Vl66dHHc7/THUpXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164543; c=relaxed/simple;
	bh=VZdhg/2WWxj23TMQOLxv2EYnD9sVykx5dWuo8oKJNGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYquo7eVR1JU+hjOvGm6a3+ngn/afn1vdbAvxzYmOg9g5MWfn1duA2OybQBkQgD1FA+ZD5h1VHVk7WgQiMS6oQhUA1Ao45Lvstj2+NqnA4WEmtVd//WTwrjLpp+rbLDXFEWLwZwmaJ8/SqO5/AcYYKKWZ9xK2M8QSu7qBNit0lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dPJXw+GN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=S9BD7B6y; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dPJXw+GN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="S9BD7B6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790164526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfFWfiDFRsRocPK6MajUZe1PhNrKZn5zM8GQiGakpDQ=;
	b=dPJXw+GNaO0dRiRaG7sq1P0qAC5lGJ/Lt9+9aLUgT1UnD7G5rBrVw/Kh5lGF6TH3Oyr67p
	l35UL37RfRCiZ7eE00jftcNUwbAFJ4queqFqIxBe70WttlQ1Uqad6txMhPTvo3I1t6xCwJ
	OXcxc59IdGLbrtDtBfaIPQEZaW0wTXA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-iHcgMvIUO8-f-4z77fYNNQ-1; Wed, 23 Sep 2026 07:55:24 -0400
X-MC-Unique: iHcgMvIUO8-f-4z77fYNNQ-1
X-Mimecast-MFC-AGG-ID: iHcgMvIUO8-f-4z77fYNNQ_1790164524
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c29bc25836fso83924766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790164523; cv=none;
        d=google.com; s=arc-20260327;
        b=KyPIlyTUltTwDtdvki93zBKjYwQjXaBQTFSRdiA8rK3ho6CfuZYHHpVzr/2+P7PHnp
         1ho7sPlc8HCAtZ4S/ehEtLzeW5cE5qyk1Nkwe92gIDJi+IuULoJVIV+Bfzad76ruwN/D
         Jkk/fy+e9NmBHPCakQIllU0vtqF4xl9TXmw7dUrCH6fq4HtbHtvEU9U8qAefuE4l0SbB
         T5dDh539sngh9mIUuPvyL2xJPN0tm2I8nD/aHfEIqncNA2Zeki5MAnFGux2Y+HcHT3nS
         xRRXrFPGG+c2RnxKiRg5lVxmha6RoBIBJMgYH1ojE+4+5PdmYttaNhQl4t+dE5BlU8Jo
         5Cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wfFWfiDFRsRocPK6MajUZe1PhNrKZn5zM8GQiGakpDQ=;
        fh=64R4CJKSTQNU8rOk91hfA2rotBmUY3yxX1auv0KxjJ8=;
        b=kg/C5xvaYDi7NMSk9gS9WuHtsFB3/iq/Tl/LQYZ8wzChSWS1sCAw1lwCjqZrXgkg9r
         YGEbQggvLloG9FhUN5yOSeF8uW03ijNkhcjFqsYkVxv68A4NZaVsylK1E9KeQOtbduwJ
         hqm4gaY+H3zVQN9M9L6C9C1sa4qfLsfCIqofhhoMR3sn3a/cOzFmYEEgTPk64PsiHVs1
         5dicQ08EaIO2zCbyCoK9tiXrQvEipSxauaHeUQtb57dKGiJfuGOeB6vKBE5fpoXiuvpF
         Dlf6hKtkAmg5haA1j5cd6MPQZqZcldTyYt2rPktPEvC+vXQ7OzQtphnckpgPvCCOWf5A
         pshg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790164523; x=1790769323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wfFWfiDFRsRocPK6MajUZe1PhNrKZn5zM8GQiGakpDQ=;
        b=S9BD7B6yh5Pfeev90Ukgbzv/T5j/HEUtN3d6GDMsPQ2J22MiIG/Au6rTNKjMfnxABO
         tTVqNzvNBIqdHBLgDwM6kzUrUBXSSBAypQxpZKbQUAXAye2yL/bC0ZVVhyf6jCP9ddAn
         xVOsGZPfao6sH7ZJMo7z5XD+7/SXbDIizCuWWemtiX/uoH9+0VB0zbP/1y3mOOk0ZsHc
         wH3p5BRd8SguBz9oJE8+QGikecl0YzqPKR92Mqc66vvvLtM3qVFN0Nxup1kojzquiehC
         EGofksuZTIVI0kg9rtY/0Dxcg9bjB71uusmlCqayztvmtgnUjeY3h1dsEFFSLekm0OeZ
         WCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164523; x=1790769323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfFWfiDFRsRocPK6MajUZe1PhNrKZn5zM8GQiGakpDQ=;
        b=rrUkYsy1IFnp2XSH8I0OxDqWHZlPZcf55F0l+4Av8A40pF3IhjIT9LW8XofbsyvHkK
         XiDV/kFc8hux/NVquVBNZVOc5PWUkvl8qGN2wEFz7b3aVk3rVjx0GJI1aRpA/OXEYk2h
         fvRISlpY0/GlDsZDttYGbgOKEHWl09FFd9LjYhcHaEAciaY1hrjjhhQMatddy3vg4MLH
         EotT1vp6fSn7Fvj/Tn0J8NT4U8AaxjFvFgnlWbmVj2W0xlJ880KH+u3dMLjVOB2Pn/70
         WFdn/+ptqZrCIODt1WWv1p2kwbOLPbjWYQVavXBCgfSq9aIZDbURcyr7oo7TbI8CWXxO
         dypQ==
X-Forwarded-Encrypted: i=1; AKwUvByRCyuE9JCFLwGeF6gLg83Lb/BlNJ6Cmp6kJETOWvAQxCfb7uuWjllrO2u0my2Pk44fBl6T5z2OZ6xH+kU=@vger.kernel.org
X-Gm-Message-State: AFuF++mUz7j+XJDyK5FdiZDqFa3xPb/3gfZ8vN/rYAxTFmiOH9X3bPDs
	vlaBl1PogwquSkt53X2/QH3E1DGh7cSqvK1TbTxpwrk980nQOCqncQjY6pT3j8j2HdXRGyAkwWc
	OoKXCG+N0a5oTy9MZ31Sk+Ie3fuGVde/+XQiq61sbtjuVArvgYLUgQ4ZemK8XvBFcV2Gu7dJqOx
	zD8whgweB1jySc3hKByFZ9hAA8DsSSXZIQNpcspENarFc/ab73k6G7Xg==
X-Gm-Gg: AYBFou3ETBhvkkb197kn5XGZVJn8H6FJ6wZGc5NrPy+XEfAnNQ+4re9i/tldndiaMHd
	zq2+bAK+nY77OiJFp/wPG8u53k5djYct+6GULjNWls073plo+1Rhs+pKeX7RrG9P099PLHBV2Gn
	kux1LciIC4FiDw19r4RE//llAIJ3g7vzYOZ3FBnRzGlHyBr4Cy3qKmYXXbgAX2ct65PUUv8hylf
	EjpbnWnLJak/fL37jCiikjwuHybqIFkfb/53Og2eWD93JFViMDQL2Ujf1kCxxHeCls/SkZ9lZ53
	GXg=
X-Received: by 2002:a17:907:6d28:b0:c28:fb3f:fe20 with SMTP id a640c23a62f3a-c2aadf9f210mr198480566b.30.1790164523617;
        Wed, 23 Sep 2026 04:55:23 -0700 (PDT)
X-Received: by 2002:a17:907:6d28:b0:c28:fb3f:fe20 with SMTP id
 a640c23a62f3a-c2aadf9f210mr198478466b.30.1790164523216; Wed, 23 Sep 2026
 04:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922202734.1344770-2-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20260922202734.1344770-2-Jeremy.Jean@oss.cyber.gouv.fr>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Wed, 23 Sep 2026 08:55:12 -0300
X-Gm-Features: AclHuK-nUTKQQ2wWEAK3vYcbaNjq3pmLpdcICbfm-hJLNCAdjoG-ETE2fFTin9k
Message-ID: <CAABTaaD_DA+=ywGNnZzJeXnwonh_=Abq8dThprJFQpM7Lc6eGg@mail.gmail.com>
Subject: Re: [PATCH v2] audit: fix exe mark UAF in kill_rules()
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>, brads@mainlining.org, 
	audit@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 5:34=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>
> kill_rules() removes mixed AUDIT_DIR and AUDIT_EXE rules when an audit
> tree is pruned. It drops entry->rule.exe before removing the rule from
> the RCU-visible filter lists.
>
> After a rule has been installed with AUDIT_ADD_RULE, which requires
> CAP_AUDIT_CONTROL, removing the watched directory can race with another
> task that is still evaluating the rule. In that case, fsnotify can free
> the executable mark before the reader reaches audit_mark_compare(),
> causing a use-after-free.
>
> KASAN reports:
>
>     BUG: KASAN: slab-use-after-free in audit_mark_compare+0x8d/0xa0
>
> Unlink the published rules from the RCU-visible lists and retain them
> on tree->rules for cleanup. If any rule has an executable mark, wait for
> a single RCU grace period before removing the marks and scheduling the
> entries for freeing. Otherwise, call_rcu() already provides the required
> deferred freeing without a synchronous wait.
>
> Fixes: 34d99af52ad4 ("audit: implement audit by executable")
> Assisted-by: Codex:gpt-5
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>

Looks good to me. I've checked that audit-testsuite passes cleanly.

Reviewed-by: Ricardo Robaina <rrobaina@redhat.com>
Tested-by: Ricardo Robaina <rrobaina@redhat.com>

# uname -r
7.3.0-rc4+

# make test
make -C tests test
Running as   user    root
        with context unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
        on   system  Fedora

amcast_joinpart/test ................. ok
backlog_wait_time_actual_reset/test .. ok
bpf/test ............................. ok
coredump/test ........................ ok
exec_execve/test ..................... ok
exec_name/test ....................... ok
fanotify/test ........................ ok
field_compare/test ................... ok
file_create/test ..................... ok
file_delete/test ..................... ok
file_permission/test ................. ok
file_rename/test ..................... ok
filter_device/test ................... ok
filter_exclude/test .................. ok
filter_exit/test ..................... ok
filter_inode/test .................... ok
filter_saddr_fam/test ................ ok
filter_sessionid/test ................ ok
io_uring/test ........................ ok
login_tty/test ....................... ok
lost_reset/test ...................... ok
netfilter_pkt/test ................... ok
signal/test .......................... ok
syscalls_file/test ................... ok
syscall_module/test .................. ok
syscall_socketcall/test .............. ok
time_change/test ..................... ok
user_msg/test ........................ ok
All tests successful.
Files=3D28, Tests=3D303, 69 wallclock secs ( 0.08 usr  0.03 sys + 36.64
cusr  1.87 csys =3D 38.62 CPU)
Result: PASS


> ---
>
> v2: Address Sashiko's review with Ricardo Robaina's improved patch:
> - Batch executable-mark teardown behind one synchronize_rcu() after
>   unlinking all rules, instead of waiting once per rule under the audit
>   mutexes.
> - Skip the synchronous wait when none of the removed rules has an
>   executable mark.
>
> v1: https://lore.kernel.org/all/20260921195921.4174830-2-Jeremy.Jean@oss.=
cyber.gouv.fr/
>
>  kernel/audit_tree.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/audit_tree.c b/kernel/audit_tree.c
> index 1ed19b775912..f2e81be8265e 100644
> --- a/kernel/audit_tree.c
> +++ b/kernel/audit_tree.c
> @@ -545,22 +545,38 @@ static void kill_rules(struct audit_context *contex=
t, struct audit_tree *tree)
>  {
>         struct audit_krule *rule, *next;
>         struct audit_entry *entry;
> +       bool need_sync =3D false;
>
>         list_for_each_entry_safe(rule, next, &tree->rules, rlist) {
>                 entry =3D container_of(rule, struct audit_entry, rule);
>
> -               list_del_init(&rule->rlist);
>                 if (rule->tree) {
>                         /* not a half-baked one */
>                         audit_tree_log_remove_rule(context, rule);
> -                       if (entry->rule.exe)
> -                               audit_remove_mark(entry->rule.exe);
>                         rule->tree =3D NULL;
>                         list_del_rcu(&entry->list);
>                         list_del(&entry->rule.list);
> -                       call_rcu(&entry->rcu, audit_free_rule_rcu);
> +                       if (entry->rule.exe)
> +                               need_sync =3D true;
> +               } else {
> +                       list_del_init(&rule->rlist);
>                 }
>         }
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
>  }
>
>  /*
>

--Ricardo

