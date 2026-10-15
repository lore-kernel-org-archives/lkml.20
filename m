Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF722FE05C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099166; cv=pass; b=r28RLmwDPk94Q41U+kNw7PIaaTGsjS7rMemiOKSyW3bIFdmC+OWaY0ABeECk9qAYPLs+VInSNO4GD2DLJPbKYrVhyRjlx9I9ssiwUweq+WYVtNQ/W8u8pYv04NAszvPKVXITPBeaSxCA2/I514p/OuiYQOa1tCALEl+Z0cTQCe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099166; c=relaxed/simple;
	bh=Uz/5hctKvlaqdWO6KpHIaPRKCJnqvXCmJd5cUbHaT7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAu82/3R9TqG5RPUeTHJKNR0w6BWjYDFY0lagJkq+VVYHhAmGjjrfDwCfL5ddbcfKTGqSay33DR7RN4zlotwMp3kYx8ZVkR/rISnLgDpvNi6RatshF1TjBHv6t+PyGzQh3vj3ttf09sqwGgsh/RdKmiLQ/fHTTFQH8kJHT4b0F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=0LkLPT2h; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="0LkLPT2h"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so802688eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792099164; cv=none;
        d=google.com; s=arc-20260327;
        b=QfobB5VbV/I4B2KiSV1FfTfHt6YXmfiiDcMQWMo3cPXWXKHdua1Otg6Qt3f4Po1wp2
         uh63CXObd1QoTJw/PkNWfMZInkMRBKNfcP+NFU/IPm/OdCO01jofDC2zYCJ2wZhl+1Te
         ZLjR47pKfa10GAOAHMKK7GYKaHFrw0D2Se080RUYsLl6GMDXvOIvYN8jY1wPYPRBtBsa
         82wY7xAxu8ncCs4nzyz9xZ5aANjkHiDu75WFLjT+GsxP9oWs2w0FbshI2JWJ0sATny4T
         n1kudXHHOBwyItSX1D9HyjJJ9qDVJ4JuRZlom14D4yQ+ISh8dzQluE2ZsRHsIW4ehWlD
         NjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WFhecx82FkxQ1C38UPIvum31gQyjmwYifrg5hB5ZM6E=;
        fh=M9eMDxXOqYx/YxrGk0/UIcKT0rNHvZPEVPVwjY3QtUA=;
        b=LXDFs8pghaIrp5mSmZX2qzY2+F2v/2dSUSx46KgWjVCa/CcARnQVwVR1lPb0k/+2z1
         4IbgRUxWyhrXex+JTuSNpTs0QtPb9oH8FhbtqFnPKECjhDmpKsIBiRHEEzVgGGMb0u0o
         c2VcdlnpJHOohTm9MQ3Gc0qcdlrjUXDQul9Hs9XjorpG7KUZJohOKoiBG9sR9FSHDQZR
         mt/Mv8dUq4Egb0f51cgRhA3JDwvYbMyXFWGjBsU4XBJt6hwBa0nKm72NekpZKKtF8a8Z
         qDJ6+iCDfiNSu1qZ40ked3eknO1WD476/8nFTbubGA0cs2LTrqx5NDCEZhE3vFLNIVfv
         +NJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1792099164; x=1792703964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WFhecx82FkxQ1C38UPIvum31gQyjmwYifrg5hB5ZM6E=;
        b=0LkLPT2hrKkXY2CZBX5DPXvTJtNPaaYR2ncurNgOJ9XF5KdaPDw9in4Uoh20GkCY7U
         56u7MXyHVdGIhKPze4p4NBjIwjcEoWNGrfDuzcdg6FXx+NjBDUfepT/Gafots4TNFFUQ
         2k1/xJIma8uTtJ0hXZx+1I+omXPo7Y2Evb5t3h+YbHXUNCMMBstkDzc1ug7MTt4xPxFW
         kPyz1gwhR8shckEdhlft0zgi1Tozd8JX0nlBfn4VahMg/lsX9JARgIgC6mrr3kB3XiqY
         4YWPv0hSPiib7f8LLWOYP1ZmYtoub61GSWJavBywdDmKxNpRvvyHEHF1gbjQ20s0ZjQ7
         8Q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099164; x=1792703964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFhecx82FkxQ1C38UPIvum31gQyjmwYifrg5hB5ZM6E=;
        b=jw7vO8ubhBGRVACL8IAIsc01N6m7XtQVdSpctqtYNfHG7aqtU1pSihPrYgQpphdsm+
         DG8G0yL+1XFfoQgGA8jJWPH7gYkFmzvOhhkrIhb386XRBjLpIYrYMvZrXGqKNXiN2Hiz
         3vbgbXBW25raYPjepS9evGLAeH8V47CrFi9vZmZW4x9h+p3XUZ7V+en+D9taGZolp0Uo
         baSLPZpgfwrG31+Vp5FgCikkpzDue9d6SxErnJ/5YL7i5WpLgD4bSgDyawHQZEPpcW3O
         U+6bmM53R3HWDv+IaHwMZrvi7xdonWYFbLO/+2SezRp5xMtzEhVlp0fp+S9EN8YSBafe
         SQOA==
X-Forwarded-Encrypted: i=1; AKwUvBwhB3cgALOo7mM2Wu1vKb4q3R82Y3LBozJ2AVD204jgnL0zOF9CECJoIA7dailX4MXHRpRsRYFVKIsSvPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJslTbLAGS2phtWzsXGFJ7D8HqkuGp5VQZVMhIddlxLoV7fjxrK
	FvoYLxR8FYiLeyJ3UYJVUoxCtcil3Wxwd72bdn4MFPyKkgZe03bNzayzNfx9o3B2CThK9zE9QIA
	KuTamKX9YO3XPz1SxNoa6ks46k0SjOgg1CXm5QoPz2UQ=
X-Gm-Gg: AYBFou3J5v/2/2YZKl5hQPzlnY3In/S2OywUpUG/6+evVsknmzrGHnjGdRVXCVc6PHm
	ui5GTia3d/tXcV005hF34ohiau1ecBtd/zUcupbogMaH1gERW2cpQkuX0vOjqHb+qTyVzlU/EMZ
	v79zh4Rmm6eCghKMHU895WC3Sojqk/b5MlMhAl63vleEQCJ4SevWMwslQtpwc5KH7X6avVbCPtT
	kWc/KMaRa7SItqtGES7zwPZO2q5XIBm99Drd+CyGWOETYVRfDfAGA1PLPqS9RGJdOIKC/ipeLbV
	HRVuGYCOuQHQH7EVe4CcYXe1pvVFszI59jhITOKEjBR+Vp4snGmS5KHJCxYM0oI5tvNzOAThFzb
	suP+WhGtudvWo9Zo4X4zTG1Dq+uEd014Cb0vcAQCnHA==
X-Received: by 2002:a05:693c:2503:b0:35e:5db8:2ef with SMTP id
 5a478bee46e88-35e5dc756c3mr5975575eec.24.1792099163746; Thu, 15 Oct 2026
 14:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015011940.4122452-1-dhu@x6u.co> <20261015011940.4122452-5-dhu@x6u.co>
 <20261015181713.GB219304@unreal>
In-Reply-To: <20261015181713.GB219304@unreal>
From: David Hu <dhu@x6u.co>
Date: Thu, 15 Oct 2026 17:19:12 -0400
X-Gm-Features: AclHuK983uRNo0pxUvQDGtecJUcInNsMhMtPfO5CNth4ZI64eLju23gowvdoTn4
Message-ID: <CABdL-LQK+hQkJkZVA8iwSVYTnBLtX7VYJ=VjhP534MR7d2ep5w@mail.gmail.com>
Subject: Re: [PATCH rdma-next v2 4/6] RDMA/irdma: Split CQ setup to umode and kmode
To: Leon Romanovsky <leon@kernel.org>
Cc: Tatyana Nikolova <tatyana.e.nikolova@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, jmoroni@google.com, 
	eagleshaw@google.com, xuehaohu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 2:17=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Thu, Oct 15, 2026 at 01:19:38AM +0000, David Hu wrote:
> > From: David Hu <xuehaohu@google.com>
> > @@ -2624,6 +2624,126 @@ static inline int cq_validate_flags(u32 flags, =
u8 hw_rev)
> >       return flags & ~IB_UVERBS_CQ_FLAGS_TIMESTAMP_COMPLETION ? -EOPNOT=
SUPP : 0;
> >  }
> >
> > +static int irdma_setup_kmode_cq(struct irdma_device *iwdev,
> > +                             struct irdma_cq *iwcq,
> > +                             struct irdma_cq_init_info *info,
> > +                             const struct ib_cq_init_attr *attr)
> > +{
> > +     struct irdma_cq_uk_init_info *ukinfo =3D &info->cq_uk_init_info;
> > +     struct irdma_pci_f *rf =3D iwdev->rf;
> > +     struct irdma_sc_dev *dev =3D &rf->sc_dev;
> > +     int entries =3D attr->cqe;
> > +     bool cqe_64byte_ena;
> > +     u8 cqe_size;
> > +     int rsize;
> > +
> > +     if (entries < 1 || entries > rf->max_cqe)
> > +             return -EINVAL;
>
> This if() is impossible.

Hi Leon,

Right. That is impossible following your series in [1]. I'll clean up
the checks.

[1] https://lore.kernel.org/all/20260213-refactor-umem-v1-0-f3be85847922@nv=
idia.com/

> > @@ -2689,109 +2806,12 @@ static int irdma_create_cq(struct ib_cq *ibcq,
> >       info.type =3D IRDMA_CQ_TYPE_IWARP;
> >       info.vsi =3D &iwdev->vsi;

> > +     if (udata)
> > +             err_code =3D irdma_setup_umode_cq(iwdev, iwcq, &info, uda=
ta);
> > +     else
> > +             err_code =3D irdma_setup_kmode_cq(iwdev, iwcq, &info, att=
r);
>
> No, the idea was to actually implement and set ,crate_user_cq() callback
> and clean as much as possible from existing .create_cq() callback.

Thank you Leon for clarifying ! =E2=80=94 Will do. I will send out a v3 sho=
rtly.

Regards,
David
