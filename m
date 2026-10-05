Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA6A22AE65
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199376; cv=pass; b=XOatBG4Um9KSVBRKpQ6gqxGsk0UZlJniD6VO9Z8kygDLUqCEWJ8Fqc0rM+a4Q6AuBAW8Bz4oU0cTELmYCm7tu7ZdynDHD8k9cNZ4Mp/Ep7J7r+RCRK8M15/Klk5q2NXdR46QJKIRJF69sja2Hy+voVXkgh8Zwn0BI2S/vAJO4CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199376; c=relaxed/simple;
	bh=hiS3wQPL4xpqTN5F2IqPBGqIk9dWUDtGuqM7Cx0Bf0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vA2NXCgClMjszRYGiniX+ZpaYVRdK6rLsSfQhUlj1UVPVjZoQ4//zjrKMuKMcPSOHPAFD3K0bry8R5Bvy5AUFISukr2w99LcQj9YZbko7nigPYJ6UY6A1qqxxaG/Yxw7X7zV8JnIjHyspNIDp54TUfe2SDJ/aes0f4tJDQtDYsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ygl+MpPo; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ygl+MpPo"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b08452cafso1110511f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791199373; cv=none;
        d=google.com; s=arc-20260327;
        b=Qs/PkjAOomKD0jkY8AltZqr3VLMRMi8HCexI+Q4OV/koVXBBKT7APwyobXLGkwECVC
         L0E7df79dY7tlFtGsETNnNn9vIS4/DplkH4UL9eHe0ih1B1J2wNen02fSdYcM8XI9zVE
         lf3o3sPO4cZh1xG91REcOPxd9FqxMXX4RhSqywXlJ6YavvDKm51eSEHCEIbIF1ZloXgv
         t6Rz+qbLQbmImohmP/1YCcc5r9dzm/WB/3IGSWCY+QlIPM0q7V02eNqCMvyj6XR+RI1t
         MgNgo4ZjP6JWGh3ra5n5a1k8ymFz7R46B8LmMOLk0HXm36tw+zGr2S33Hbcc/KRAE2W3
         Qzvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yxZI1soPxTmfDPPU+JgwdQfVtmxFB63dai3uLQf2Sjw=;
        fh=P6mWVDVDIQydnWtBheMgNkW9pg+pnSNUyZB6IBkqVRs=;
        b=Z3AO//IGFine8WoQchdKtQ8pqhfn4ewTQLG1MqDXs73XwweKK9uYvqb69+67g/lT8s
         2cWar7L1SkVMiHey9gAJWr7i8g6hPK3x9pEHfTo2XaPgupZuFFLnlzeFVf2P095QDuQD
         BxEnEOEs6pB6pacF0kl/OsHmdPUt8h6aio9nEEEikJQ+2RGrOpK/vay9S3Vmn2xNIdnN
         02rU2EsvVktKb9OBjbXnsIV8k5B1Dj4kT9S55X8DRZCgz8sFZobbPLUoBFwZ3IP0X6HZ
         DcT99X7zb1E90XkZlFvocKfQcM6OWIZerBBg8M7Z3KhX02g8Xfmr9t9leb2xMD1zYZFt
         stlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791199373; x=1791804173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yxZI1soPxTmfDPPU+JgwdQfVtmxFB63dai3uLQf2Sjw=;
        b=Ygl+MpPoTsuqVeSMepNFftkjXPWm8M7/wyj2SEVMyFXj/7YeD3HhZf8XsykeiE+Hz3
         TfzjuE5VyuGkHYLCC/SLkn81TND23whPxNH3+HzzZw6GIi3Hs8NKQpGugY13wdlzllao
         GYMQ7vqhZrzVgaCr36Dm8f+xBnxMjrivyxdJQIWry6DQVeTsnsy9lq7oaiv9PjC/Wj5F
         3ZaqNBfUJvvN7BOiVsNoBD1GfqoTFXrqLntYgPMMpsp/4Tv3iy0uTSUODjicr002vfBm
         r/YuCgDvMsv5NHgBq/Md4nYSeGMHBQFBJkp15wmiq7ow+CpQfAXGHVs0saw2jv8I1JUz
         FAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199373; x=1791804173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxZI1soPxTmfDPPU+JgwdQfVtmxFB63dai3uLQf2Sjw=;
        b=CdmuIX6mdghMM8NHKA9Rceu+Zxk44+v2hAUr1MGjXp+KXDPr/MjUdqmCh5/aI6fgW1
         P1QwqIDk4cN0r0APbSkJJGw3LUNMzOK6+r0pyf4TGxeTWG0/1F/wNHxOAafkgosY72wt
         ZHnKHKVeu4P8MLDFHYxN4P50ql69OZK1CsLiUNnKMN5Q3mAPxdWo1TP9WC/Fs5RzsRzv
         DK90/B5dUoph2b2tvM4hUI2L1llaZ2iG4tlfg5z8m7aN3D9ZDn/RQDvcKhSNgB9wMTN5
         DABPa8Yu1AzcKIhBEY991QxBconwSEF8um4YK1lbf4YMsSVUHw4+fotXJyfxWQGM2Ly/
         xyew==
X-Forwarded-Encrypted: i=1; AKwUvBw4SJLzVBwV8ZfHWR3EF0nUFxaw9Y5O76SFVMGc5DRk3ukbZd8RGIKqC2qljcfT278lY7jvTcrIck8xbGw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXAwILvGAjC7H10D4e//0RsRT972Zcsg5mbgCbW2wRnR2qQ7k7
	NhL3XtyG76ma/vz+d2HqtR/5r17YpULYqJXW8+UijepTtv+Qjhnv+vK6UHHR6h7QuYkCfx8vN49
	IdVDcrAGtDxP/sBhxeEfcifwtbsm6n1WmyQa98GE=
X-Gm-Gg: AYBFou2eDsq7UcFtPaAnzbN0RwWAZPgcMsjJG9wLOhHXijia27j+GWEKHZol3Px6h2v
	DzpGcYsAG81cpxV6TBrg527UaHTfsn34wP+qAq4PwGwRmvtP+i1FVS0YqwPZ9hFG/tBXa6Em1Tr
	gzGbffvqEcfegYQy0oePeE1DWmgDKN2stwhbS0o6eAjknKzRwuirLGD7PrzlS+wJ0fx+J0cA/lz
	PVd2kVjhxMW5fBMrAyjANMjK88ZpBaX7GXKgVTLBCUYX8H3X9ThQTJwDkS9nN9H+/R8RZmhcn6r
	Cak/SjKvpl/AJ0IpUNkfGwJxJ6kbRhalr3PeOddpgeBUfy3a+eOrx9m4pyoCIKmh2cFXoZAsYw+
	VEXR7f4qcvIOIfWBmlyQaeqWiYwznzhoOhXnVsOKwrJiNp0VUzNYGS/tnIh1qvoHyWNyonI+5+L
	rv7VmZ6h8=
X-Received: by 2002:a05:6000:4210:b0:48c:571a:a1aa with SMTP id
 ffacd0b85a97d-48c571aa959mr7447673f8f.19.1791199373177; Mon, 05 Oct 2026
 04:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004125601.c06953a6f0660df9859b0c2a@linux-foundation.org>
 <20261005093756.22709-1-neganhat@gmail.com> <645204ff-6c50-4ef3-9070-78ac602560b1@kernel.org>
In-Reply-To: <645204ff-6c50-4ef3-9070-78ac602560b1@kernel.org>
From: =?UTF-8?B?Tmjhuq10IEFuaCBOZ3V54buFbiBEdXk=?= <neganhat@gmail.com>
Date: Mon, 5 Oct 2026 18:22:41 +0700
X-Gm-Features: AclHuK_C8DWb7keJEldBGEQQGJ_SM_ZaF6oftPzgImWFpm52x1_XSGgSqgP23-E
Message-ID: <CAFJkwZx9zmz2sxMyByFbYgfCi9zMN+iLxKrypKBCZY9NsLQz1g@mail.gmail.com>
Subject: Re: [PATCH v2] mm/gup: document unlocked invariant in fixup_user_fault
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, jgg@ziepe.ca, jhubbard@nvidia.com, 
	peterx@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

Thanks for taking the time to review.

My motivation came from running Smatch over fixup_user_fault(), which flagg=
ed
the dereference as a potential NULL pointer issue. Because the relationship
between FAULT_FLAG_ALLOW_RETRY and the unlocked pointer is subtle when
first reading through the path, I initially misread it as an unguarded
dereference in v1.

When Andrew pointed out the invariant, I thought documenting it might help
future readers or newer contributors who hit the same static analysis warni=
ng.

If adding a comment isn't the right approach here, would you prefer leaving
the implicit contract as-is, or is an explicit runtime check (such as
VM_WARN_ON_ONCE) something more fitting?

Thanks,
Anh

On Mon, Oct 5, 2026 at 5:29=E2=80=AFPM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 10/5/26 11:37, Nguyen Duy Nhat Anh wrote:
> > Static analysis tools flag potential NULL pointer
> > dereferences of 'unlocked' in fixup_user_fault() when handling
> > VM_FAULT_COMPLETED or VM_FAULT_RETRY.
> >
> > These warnings are false positives. 'unlocked' is only dereferenced whe=
n
> > handle_mm_fault() returns VM_FAULT_COMPLETED or VM_FAULT_RETRY. Both of
> > these return codes require FAULT_FLAG_ALLOW_RETRY to be set in
> > fault_flags, which fixup_user_fault() only sets if 'unlocked' is non-NU=
LL
> > upon entry. Therefore, if 'unlocked' is NULL, the control flow branches
> > that dereference 'unlocked' are unreachable.
> >
> > However, this part of the code is subtle and can trip up
> > contributors or automated tools. Document this invariant with a comment
> > above 'if (unlocked)' where fault_flags is constructed, explaining why
> > omitting FAULT_FLAG_ALLOW_RETRY guarantees 'unlocked' will not be
> > dereferenced later in the fault recovery loop.
> >
> > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
> > ---
> > v1: https://lore.kernel.org/linux-mm/20261003194846.205918-1-neganhat@g=
mail.com/
> >
> > v2 changes:
> > - Instead of adding runtime NULL checks at dereference sites,
> >   document the FAULT_FLAG_ALLOW_RETRY invariant above if (unlocked).
> > ---
> >  mm/gup.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/mm/gup.c b/mm/gup.c
> > index eb898ea1ee22..58fa75441da1 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -1570,6 +1570,12 @@ int fixup_user_fault(struct mm_struct *mm,
> >
> >       address =3D untagged_addr_remote(mm, address);
> >
> > +     /*
> > +      * If the caller passes 'unlocked' as NULL, FAULT_FLAG_ALLOW_RETR=
Y is omitted.
> > +      * This guarantees handle_mm_fault() will never drop the lock or
> > +      * return VM_FAULT_COMPLETED / VM_FAULT_RETRY, making subsequent
> > +      * dereferences of 'unlocked' unreachable when NULL.
> > +      */
> >       if (unlocked)
> >               fault_flags |=3D FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILL=
ABLE;
> >
>
> For which audience is the comment targeted? For people that know what the=
y are
> doing? No.
>
> For tools that report such problems? No.
>
> So I don't think this (4 lines of comment) is the right way to improve th=
is.
>
> --
> Cheers,
>
> David
