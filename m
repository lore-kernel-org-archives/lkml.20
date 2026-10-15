Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072084E2F3A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080392; cv=none; b=RD9eXMFVYQ54qMCUo3ARR9TLDaqqawUQBk1zT6HmCK92Or22GdiPomC3z0jHzqn+sjyrdA1YykS2eGzlBqulTtXAOoeqzf+CCqoBeSF6Po+R8jsUxvqfXNrWr+neToeQ4ylHiPA/lMf28Pb+fh5QNMwwBsZdyRxZbtkxxwC2kP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080392; c=relaxed/simple;
	bh=JRy8WuV4exW7p4qIs/BOc/PGDmmlLPaMWFRApWxRLWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hk0QFaJxnCg5ckxPTPNzM1EPXXl25j4eRYB5DNTEE2CkVtSg+Z9y8oKYcgdEHb41ZV6IVGTe+z6f6E91+coDWREiNqlcuv2JaeYxlPo5cu3pzKSj3/5m98vVoCS3nKHvHqKEntX6A5izCKpIp02g9SGOC7uKDNDVSEXkJHI8YaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAMFybCC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAMFybCC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57BB1F000C6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080379;
	bh=hI8KOglwVfLjpgYGNPmiWMcfPdIInUXk4KoNDHDeaws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iAMFybCCwwE+PSJQ7UTFD17I4XIqv7Y69ijYNpN277MGbvchBZHg0WB4nZOENpIHe
	 ni6T2o5Xqi/8cTTXZgzWBCt1aKgI30D4RzFAZhSM9JYzbzl9ll3gHMe4Zr6AldZG21
	 348G9Xnjjv6lmBytgIzJh51F42iUNcoL3KR5GqPw3pzo29sBGC2kUr9mVVcX8UDu3h
	 SryDnxJGS6k2w/wjeo++42mhFku1VI/xJuC4txTdmYonjBOLbYZ3fj8MFG7cdFZqAV
	 7kvyEjd7YB2hfhMAhI8YNSyvNs+e56hRNUe2EUNnI4ePaK5l7YD4AIDsn/zJY/K51j
	 +PFG0OGL0b+MA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so4419732e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:06:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzyh9jARIxjvFPW9HCMeUwgKyZbQzxADw9cIdMKqK5tfirHcQ46OYcASmSfNkpb0o/N/uIMOr2dXQB8bCs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuBt0YTz1SnfyXtW4MNtQn7D9lSiph/riYL54kBFcWaz/3Rhr1
	uFp6r53+xUPH84D2tEm57sZ3mzbiAWOQr0ndUf1rcDEK8Q8Ag7QbwwNieTPTOfeUuTB80V0tcI4
	ZpEneiwG75dLwIZUfbRjPZxOreKWDbeg=
X-Received: by 2002:a05:6512:12d0:b0:5bc:a9f9:b641 with SMTP id
 2adb3069b0e04-5bcde8d8464mr6434245e87.67.1792080378235; Thu, 15 Oct 2026
 09:06:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOx7e9+Vv8Pdyks=AbE5XG0ZyDgtKToKyBLTnt+H5RPn6VymVg@mail.gmail.com>
In-Reply-To: <CAOx7e9+Vv8Pdyks=AbE5XG0ZyDgtKToKyBLTnt+H5RPn6VymVg@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 15 Oct 2026 18:04:08 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jtuTdGckoMQMauPDrn1KZ9_-EyLx5LjD1Ndqj50pC7-g@mail.gmail.com>
X-Gm-Features: AclHuK_vMeKHThNLYW_RgnbUq11vQH6_X7jpU9aX6o1NklQD-30YX5Igk_rVtcs
Message-ID: <CAJZ5v0jtuTdGckoMQMauPDrn1KZ9_-EyLx5LjD1Ndqj50pC7-g@mail.gmail.com>
Subject: Re: [PATCH] ACPICA: Fix parse tree memory leak on AML execution error unwind
To: Iurii Trukhin <yuri@trukhin.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Erik Kaneda <erik.kaneda@intel.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	Pawel Chmielewski <pawel.chmielewski@intel.com>, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:28=E2=80=AFAM Iurii Trukhin <yuri@trukhin.com> wr=
ote:
>
> acpi_ps_complete_this_op() decides whether to defer deletion of an
> AML_CLASS_ARGUMENT parse object to its enclosing parent by checking
> walk_state->op_info->class instead of the opcode class of the op being
> completed.
>
> When acpi_ps_complete_op() or acpi_ps_complete_final_op() unwinds open
> parser scopes on AE_CTRL_TERMINATE or an execution error (such as
> AE_NOT_FOUND when resolving a missing symbol inside a control method),
> it pops each enclosing parent op and passes it to
> acpi_ps_complete_this_op() while walk_state->op_info still points to the
> last child op that failed. If that failing child op was of class
> AML_CLASS_ARGUMENT (for example, AML_INT_NAMEPATH_OP when
> acpi_ps_get_arguments() fails to resolve a method call or predicate
> operand), acpi_ps_complete_this_op() sees AML_CLASS_ARGUMENT for every
> popped parent op and returns AE_OK early without deleting any of the
> enclosing parent subtrees.
>
> For nested control methods invoked via acpi_ds_call_control_method(),
> the walk state is initialized with root_op =3D NULL, so top-level ops in
> the called method (such as AML_IF_OP) have op->common.parent =3D=3D NULL
> and are never attached to a root scope op. Skipping
> acpi_ps_delete_parse_tree() during error unwind leaks the entire parse
> subtree (both Acpi-ParseExt and Acpi-Parse objects, the latter merged
> by SLUB into the 80-byte Acpi-State kmem_cache on 64-bit kernels) on
> every failed GPE or method evaluation.
>
> Look up the opcode info of op->common.aml_opcode directly in
> acpi_ps_complete_this_op() and only defer deletion of
> AML_CLASS_ARGUMENT ops when op->common.parent is non-NULL, without
> mutating walk_state->opcode during error unwind (which acpi_ps_parse_loop=
()
> still inspects when skipping failed module-level scopes). Remove the
> now-redundant acpi_ps_delete_parse_tree(*op) inside the AML_REGION_OP /
> AML_DATA_REGION_OP error block in acpi_ps_complete_op(), which previously
> worked around this bug only for region ops and caused a double-free when
> region creation failed on a non-argument child op. Also use
> acpi_ut_delete_generic_state() instead of ACPI_FREE() when draining
> walk_state->control_state in acpi_ps_parse_loop().
>
> Fixes: 5088814a6e93 ("ACPICA: AML parser: attempt to continue loading
> table after error")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D221241
> Signed-off-by: Iurii Trukhin <yuri@trukhin.com>

Please submit this change as a pull request to the upstream ACPICA
project on GitHub.  The kernel will pick it up from there as per

Documentation/driver-api/acpi/linuxized-acpica.rst

> ---
>  drivers/acpi/acpica/psloop.c   | 5 +++--
>  drivers/acpi/acpica/psobject.c | 1 -
>  drivers/acpi/acpica/psparse.c  | 7 +++++--
>  3 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/acpi/acpica/psloop.c b/drivers/acpi/acpica/psloop.c
> index 24a57f971c96..0b672a531907 100644
> --- a/drivers/acpi/acpica/psloop.c
> +++ b/drivers/acpi/acpica/psloop.c
> @@ -464,8 +464,9 @@ acpi_status acpi_ps_parse_loop(struct
> acpi_walk_state *walk_state)
>                                                 walk_state->aml =3D
>                                                     parser_state->aml;
>                                         }
> -                                       ACPI_FREE(acpi_ut_pop_generic_sta=
te
> -                                                 (&walk_state->control_s=
tate));
> +                                       acpi_ut_delete_generic_state
> +                                           (acpi_ut_pop_generic_state
> +                                            (&walk_state->control_state)=
);
>                                 }
>                                 op =3D NULL;
>                                 continue;
> diff --git a/drivers/acpi/acpica/psobject.c b/drivers/acpi/acpica/psobjec=
t.c
> index 629cafab1930..f1425b98087b 100644
> --- a/drivers/acpi/acpica/psobject.c
> +++ b/drivers/acpi/acpica/psobject.c
> @@ -559,7 +559,6 @@ acpi_ps_complete_op(struct acpi_walk_state *walk_stat=
e,
>                                                                 node);
>                                         acpi_ns_remove_node((*op)->common=
.node);
>                                         (*op)->common.node =3D NULL;
> -                                       acpi_ps_delete_parse_tree(*op);
>                                 }
>
>                                 status2 =3D
> diff --git a/drivers/acpi/acpica/psparse.c b/drivers/acpi/acpica/psparse.=
c
> index 42ec8abef626..b5110d43ab7a 100644
> --- a/drivers/acpi/acpica/psparse.c
> +++ b/drivers/acpi/acpica/psparse.c
> @@ -108,6 +108,7 @@ acpi_ps_complete_this_op(struct acpi_walk_state *walk=
_state,
>  {
>         union acpi_parse_object *prev;
>         union acpi_parse_object *next;
> +       const struct acpi_opcode_info *op_info;
>         const struct acpi_opcode_info *parent_info;
>         union acpi_parse_object *replacement_op =3D NULL;
>         acpi_status status =3D AE_OK;
> @@ -124,9 +125,11 @@ acpi_ps_complete_this_op(struct acpi_walk_state
> *walk_state,
>
>         /* Delete this op and the subtree below it if asked to */
>
> +       op_info =3D acpi_ps_get_opcode_info(op->common.aml_opcode);
>         if (((walk_state->parse_flags & ACPI_PARSE_TREE_MASK) !=3D
> -            ACPI_PARSE_DELETE_TREE)
> -           || (walk_state->op_info->class =3D=3D AML_CLASS_ARGUMENT)) {
> +            ACPI_PARSE_DELETE_TREE) ||
> +           ((op_info->class =3D=3D AML_CLASS_ARGUMENT) &&
> +            op->common.parent)) {
>                 return_ACPI_STATUS(AE_OK);
>         }
>
> --
> 2.56.0
>
