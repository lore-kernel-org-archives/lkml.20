Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3373A7F6D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246311; cv=pass; b=KtDr37WfW1rA9JawL2+evqpiFhEO41Cvc0wQlv4kIKZR7c1yMCHK7z4w96ehxtpf16q4RfrehwVos5VqPbMf0niza31wNENwY1BA+E6UB9uZTl/n5l7tzLJDXXB7kEMVtXgYv6U373Lq68dYCJFmDw5pkXIvztmqgUZZGwHhhsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246311; c=relaxed/simple;
	bh=jjOwg+TCRrFplBxdJCOV+GxjjUmIPQXA8pNbORDwhX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmqTGIDDZaHfXoCA5TMwXr1jQu6F5PFu1g2O41pDIzCMZq39T+5jYQ+N6D5MX2pVfZNrmPbfLcqAT87sBec0DdIN++nsdmhLfPjf9whqBxWOzXFSQ6K0yv2pla2qi13qdQbDyT/yNyTogMS/6nTmelWbWrNUGP0g/ieppRQoanY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qu5bejgL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LhBHLDL8; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qu5bejgL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LhBHLDL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788246306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ii6J4y+VZeyCM2irJ2wKfdpUWZIAn2toGsIw5IdP4I=;
	b=Qu5bejgLas3OO4aphhihr5NuEh3/yBei+pfEXD3sFTKUc3IJOnRMff4uU5UstwSofDxYdo
	lhvYqjWH0YnoBj2e++fq0EMbBPzoyFnRs24y545biapwiCkwrn4TEKAfMxNm7SukN7/NT6
	t4+mLT8ftk7oZZPg7ZK8RNoDHz8X6Jw=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-PMN-3dofNCqeeYXjSv6HBg-1; Tue, 01 Sept 2026 03:05:05 -0400
X-MC-Unique: PMN-3dofNCqeeYXjSv6HBg-1
X-Mimecast-MFC-AGG-ID: PMN-3dofNCqeeYXjSv6HBg_1788246305
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-845f687dfa2so86100357b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788246305; cv=none;
        d=google.com; s=arc-20260327;
        b=B9sUUr5tGMhPW7AoaDIYjEf1NceUHeRS7zA371yDw8QwrmtMkXETCyoFDCDraYCUCY
         k2glrUT0346jpxNrEOE6hh0tCGnyMxlh1cOYHGjuz8E2H68eAMBrLviFc0S8E1Qy8iPi
         3wXqyO8SQuoqQ5hoYO8PEpUtnIEgpWrihCzqYdTfQfp7wgB15FwG6LJXN6CO2u66sPxR
         JeoyOovRPlfW2nfVkLd0URGNvZE1Mzx48YLO+2BDL/Sbem7gDyi//gQTpDWxQJeaCGbh
         ictmv0wg8qZwFkw7eEaIH0NAd1ga9Ivwe/aZIywo15x8mONpUgryfjEMM6g2xEySxHPJ
         k4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ii6J4y+VZeyCM2irJ2wKfdpUWZIAn2toGsIw5IdP4I=;
        fh=aH8uN2r5dZsL3qXU9PLdOMqoaYcS5H7aOVkL+/5cTPE=;
        b=jp63cvDlaMMxIK4OUMacGBV5uIxtJBEe6mPbSakbaLBNRjwGMRjjm9zATlmtn9BSsk
         Yp3/sLIdExCD9nnGBMSXd3tWL1ZNdrvE4redrxCZpTyT4lMhRuA+XW6mZxgdHm0dNccw
         vkuHWfvlX5tf/Y6ZZXjjVUGcgalkYjsWV+XhSzRjE7/jtn5mW2dexwBGGC1bwiBYyDuK
         WA+LuRQSvZN36sH7xKS/VPMxYrfUNeThBDnuI7QCqCF5WIoOr1UOH/Q/+erL0Nzs/aYD
         c7Bxbjcbvz6oqzfuvfKP2KqOvQfvqLjNZD9kgUSH7SQHXqsWLRJayCju22mnUJYcNw7n
         dgIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788246305; x=1788851105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ii6J4y+VZeyCM2irJ2wKfdpUWZIAn2toGsIw5IdP4I=;
        b=LhBHLDL8OwceCsTtNTuuDAlMdBD3gvhU/v4YoLSfIijMHIRpw0bK/uXy3vHuRskv1O
         r3lSvhvUvwzPDJsp8+nRR367k+e+/IVPSGutoWT0gZf5f+DE+/fPoTk90mWUa/JDSTJX
         tR1oPrWO7bFWp19a/tYdS9XnqIihhOAPcTINvwTfaC/w3hOf3excQLGxjRaUvVUKeFay
         BQcnA5muZcmA6cKXXXaVe0z4U7bRVWeJFG6EDls65gZt5lkvxCHQrBGdECh/eLDMm+8d
         I1uiFahIswORlrKF1Lw7FMUg38J5zaZbNhEI+2yCondYVxwfMhVQmtKs7202+CTBwmoK
         ty+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246305; x=1788851105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ii6J4y+VZeyCM2irJ2wKfdpUWZIAn2toGsIw5IdP4I=;
        b=h2y8tJAr22d5AQhBQOK9p4ungukIlho/yZ8+osYkb3laCl1YdLGGB7hVRgkWA+BUft
         NoyIFFzyIpp+nwKSZug4N4BXYlGB7gI4or2wogG2Cyrs2+BK+IwuXhzF4DlaavMf/oHN
         wtReKyfauuID8+6oxwuHWzbU8WD82t5QVqHT39oFRgd8a9AZAs27555VuX54XUCLBTjl
         B0JSpJKekEHoivQge+97bQOzdqh0Tnr8DBQgXE35xiDgIYsQlAbtHWAW6sBjhQ5rzoYd
         T0Nd+H4iF38hJuJAQcbf3pQYLCuJjJQkkWQbXO5Y7nVdTi4y7SGrMDK7Vq96UvfIo72v
         zWEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9zLZT8w3WiJ+hFmjCfEK8oARHChMehUAjmNQvxXyNNvQMs+ru8epQhZMMXl9uJWEX2hC/O+95RVhCQoE=@vger.kernel.org
X-Gm-Message-State: AFuF++lUgo04PC4W+FeQZ+n77k6u5M9ptWyB42ZenqhBVM6wfJAuTLql
	sljatdM/CmMTqsLwexscdWu0dEeFNK+00B6sX4jWvK/RoWZGCdjmo6HBBasH8TpvW93kqUwn0g8
	4AafTMm1cnXnCTs4Ec5cCJittqkvcMVT9l/KewdqitUwkrXkc6oo0UbXFHcAVPQw97zhyp9GftQ
	VpTeklv7HUaWiWR2QPuYGVBCeE0pRIhhArfDTkU/Ds
X-Gm-Gg: AYBFou1shUzPWa/CFOSvbJn6co84jegxvVRsEYw2jaRK3JHLiEyQVbPQ36E/GQLMZhL
	89yA+HB3NHCBtSvU1QvAuaqd///sQzKcK2/aVBMCaM3QX4mNq21zmFM3xTDX30BYTbVeJBTqk8L
	TFQuEqCQmsuYcpKbM2EyS84h/xoe+LDMZGcB9RFAa/Afo1Gn4fbmj/7As=
X-Received: by 2002:a05:690e:d58:b0:66f:8797:8721 with SMTP id 956f58d0204a3-66f8797954fmr1966840d50.10.1788246304688;
        Tue, 01 Sep 2026 00:05:04 -0700 (PDT)
X-Received: by 2002:a05:690e:d58:b0:66f:8797:8721 with SMTP id
 956f58d0204a3-66f8797954fmr1966824d50.10.1788246304228; Tue, 01 Sep 2026
 00:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-port-smem-v1-0-d19a45f583bf@redhat.com>
 <20260820-port-smem-v1-1-d19a45f583bf@redhat.com> <apYFPXLD6hLWohz0@baldur>
In-Reply-To: <apYFPXLD6hLWohz0@baldur>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 1 Sep 2026 09:04:53 +0200
X-Gm-Features: AcwNN1WucyQuE6t7XK0wCocc2Ga0r5aeLZMNmgocUFPmv3wGWds0eE4ASWtVcv8
Message-ID: <CADSE00LeKbGsqd_fBnWhAssiu5yFPH2_FuaY0ZamxK1GYHt+Qg@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: smem: add boundary checks for partitions
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sudeepgoud Patil <quic_sudeepgo@quicinc.com>, 
	Sarannya S <quic_sarannya@quicinc.com>, 
	Pranav Mahesh Phansalkar <quic_pphansal@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:54=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Thu, Aug 20, 2026 at 01:34:18PM +0200, Albert Esteve wrote:
> > From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> >
> > Add condition check to make sure that the end address
> > of private entry does not go out of partition.
> >
> > Signed-off-by: Sarannya S <quic_sarannya@quicinc.com>
> > Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@quicinc.com>
> > Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>
> I'm sorry, Albert. Sudeepgoud messed up the authorship vs signed-off-by
> chain here. The author should be "Sarannya", as that's the first
> signed-off-by.
>
> PS. It would also be nice if this was submitted with updated email
> addresses and copyright statement. But I'd not expect you to fix that.

Hi Bjorn,

I'm happy to address these changes for V2. Do you know where to find
the updated email addresses?

BR,
Albert.

>
> Regards,
> Bjorn
>
> > ---
> >  drivers/soc/qcom/smem.c | 105 +++++++++++++++++++++++++++++++++-------=
--------
> >  1 file changed, 72 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index afb21a778fe7b..194ffb2ac010f 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -2,6 +2,7 @@
> >  /*
> >   * Copyright (c) 2015, Sony Mobile Communications AB.
> >   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights=
 reserved.
> >   */
> >
> >  #include <linux/hwspinlock.h>
> > @@ -85,6 +86,17 @@
> >  /* Processor/host identifier for the global partition */
> >  #define SMEM_GLOBAL_HOST     0xfffe
> >
> > +/* Entry range check
> > + * ptr >=3D start : Checks if ptr is greater than the start of access =
region
> > + * ptr + size >=3D ptr: Check for integer overflow (On 32bit system wh=
ere ptr
> > + * and size are 32bits, ptr + size can wrap around to be a small integ=
er)
> > + * ptr + size <=3D end: Checks if ptr+size is less than the end of acc=
ess region
> > + */
> > +#define IN_PARTITION_RANGE(ptr, size, start, end)            \
> > +     (((void *)(ptr) >=3D (void *)(start)) &&                  \
> > +      (((void *)(ptr) + (size)) >=3D (void *)(ptr)) && \
> > +      (((void *)(ptr) + (size)) <=3D (void *)(end)))
> > +
> >  /**
> >    * struct smem_proc_comm - proc_comm communication struct (legacy)
> >    * @command:        current command to be executed
> > @@ -403,6 +415,7 @@ static int qcom_smem_alloc_private(struct qcom_smem=
 *smem,
> >                                  size_t size)
> >  {
> >       struct smem_private_entry *hdr, *end;
> > +     struct smem_private_entry *next_hdr;
> >       struct smem_partition_header *phdr;
> >       size_t alloc_size;
> >       void *cached;
> > @@ -415,19 +428,25 @@ static int qcom_smem_alloc_private(struct qcom_sm=
em *smem,
> >       end =3D phdr_to_last_uncached_entry(phdr);
> >       cached =3D phdr_to_last_cached_entry(phdr);
> >
> > -     if (WARN_ON((void *)end > p_end || cached > p_end))
> > +     if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
> > +                                             cached > p_end))
> >               return -EINVAL;
> >
> > -     while (hdr < end) {
> > +     while ((hdr < end) && ((hdr + 1) < end)) {
> >               if (hdr->canary !=3D SMEM_PRIVATE_CANARY)
> >                       goto bad_canary;
> >               if (le16_to_cpu(hdr->item) =3D=3D item)
> >                       return -EEXIST;
> >
> > -             hdr =3D uncached_entry_next(hdr);
> > +             next_hdr =3D uncached_entry_next(hdr);
> > +
> > +             if (WARN_ON(next_hdr <=3D hdr))
> > +                     return -EINVAL;
> > +
> > +             hdr =3D next_hdr;
> >       }
> >
> > -     if (WARN_ON((void *)hdr > p_end))
> > +     if (WARN_ON((void *)hdr > (void *)end))
> >               return -EINVAL;
> >
> >       /* Check that we don't grow into the cached region */
> > @@ -587,9 +606,11 @@ static void *qcom_smem_get_private(struct qcom_sme=
m *smem,
> >                                  unsigned item,
> >                                  size_t *size)
> >  {
> > -     struct smem_private_entry *e, *end;
> > +     struct smem_private_entry *e, *uncached_end, *cached_end;
> > +     struct smem_private_entry *next_e;
> >       struct smem_partition_header *phdr;
> >       void *item_ptr, *p_end;
> > +     size_t entry_size =3D 0;
> >       u32 padding_data;
> >       u32 e_size;
> >
> > @@ -597,67 +618,85 @@ static void *qcom_smem_get_private(struct qcom_sm=
em *smem,
> >       p_end =3D (void *)phdr + part->size;
> >
> >       e =3D phdr_to_first_uncached_entry(phdr);
> > -     end =3D phdr_to_last_uncached_entry(phdr);
> > +     uncached_end =3D phdr_to_last_uncached_entry(phdr);
> > +     cached_end =3D phdr_to_last_cached_entry(phdr);
> > +
> > +     if (WARN_ON(!IN_PARTITION_RANGE(uncached_end, 0, phdr, cached_end=
)
> > +                                     || (void *)cached_end > p_end))
> > +             return ERR_PTR(-EINVAL);
> >
> > -     while (e < end) {
> > +     while ((e < uncached_end) && ((e + 1) < uncached_end)) {
> >               if (e->canary !=3D SMEM_PRIVATE_CANARY)
> >                       goto invalid_canary;
> >
> >               if (le16_to_cpu(e->item) =3D=3D item) {
> > -                     if (size !=3D NULL) {
> > -                             e_size =3D le32_to_cpu(e->size);
> > -                             padding_data =3D le16_to_cpu(e->padding_d=
ata);
> > +                     e_size =3D le32_to_cpu(e->size);
> > +                     padding_data =3D le16_to_cpu(e->padding_data);
> >
> > -                             if (WARN_ON(e_size > part->size || paddin=
g_data > e_size))
> > -                                     return ERR_PTR(-EINVAL);
> > +                     if (e_size < part->size && padding_data < e_size)
> > +                             entry_size =3D e_size - padding_data;
> > +                     else
> > +                             return ERR_PTR(-EINVAL);
> >
> > -                             *size =3D e_size - padding_data;
> > -                     }
> > +                     item_ptr =3D  uncached_entry_to_item(e);
> >
> > -                     item_ptr =3D uncached_entry_to_item(e);
> > -                     if (WARN_ON(item_ptr > p_end))
> > +                     if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_s=
ize, e, uncached_end)))
> >                               return ERR_PTR(-EINVAL);
> >
> > +                     if (size !=3D NULL)
> > +                             *size =3D entry_size;
> > +
> >                       return item_ptr;
> >               }
> >
> > -             e =3D uncached_entry_next(e);
> > -     }
> > +             next_e =3D uncached_entry_next(e);
> > +             if (WARN_ON(next_e <=3D e))
> > +                     return ERR_PTR(-EINVAL);
> >
> > -     if (WARN_ON((void *)e > p_end))
> > +             e =3D next_e;
> > +     }
> > +     if (WARN_ON((void *)e > (void *)uncached_end))
> >               return ERR_PTR(-EINVAL);
> >
> >       /* Item was not found in the uncached list, search the cached lis=
t */
> >
> > +     if (cached_end =3D=3D p_end)
> > +             return ERR_PTR(-ENOENT);
> > +
> >       e =3D phdr_to_first_cached_entry(phdr, part->cacheline);
> > -     end =3D phdr_to_last_cached_entry(phdr);
> >
> > -     if (WARN_ON((void *)e < (void *)phdr || (void *)end > p_end))
> > +     if (WARN_ON(!IN_PARTITION_RANGE(cached_end, 0, uncached_end, p_en=
d) ||
> > +                     !IN_PARTITION_RANGE(e, sizeof(*e), cached_end, p_=
end)))
> >               return ERR_PTR(-EINVAL);
> >
> > -     while (e > end) {
> > +     while (e > cached_end) {
> >               if (e->canary !=3D SMEM_PRIVATE_CANARY)
> >                       goto invalid_canary;
> >
> >               if (le16_to_cpu(e->item) =3D=3D item) {
> > -                     if (size !=3D NULL) {
> > -                             e_size =3D le32_to_cpu(e->size);
> > -                             padding_data =3D le16_to_cpu(e->padding_d=
ata);
> > +                     e_size =3D le32_to_cpu(e->size);
> > +                     padding_data =3D le16_to_cpu(e->padding_data);
> >
> > -                             if (WARN_ON(e_size > part->size || paddin=
g_data > e_size))
> > -                                     return ERR_PTR(-EINVAL);
> > -
> > -                             *size =3D e_size - padding_data;
> > -                     }
> > +                     if (e_size < part->size && padding_data < e_size)
> > +                             entry_size  =3D e_size - padding_data;
> > +                     else
> > +                             return ERR_PTR(-EINVAL);
> >
> > -                     item_ptr =3D cached_entry_to_item(e);
> > -                     if (WARN_ON(item_ptr < (void *)phdr))
> > +                     item_ptr =3D  cached_entry_to_item(e);
> > +                     if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_s=
ize, cached_end, e)))
> >                               return ERR_PTR(-EINVAL);
> >
> > +                     if (size !=3D NULL)
> > +                             *size =3D entry_size;
> > +
> >                       return item_ptr;
> >               }
> >
> > -             e =3D cached_entry_next(e, part->cacheline);
> > +             next_e =3D cached_entry_next(e, part->cacheline);
> > +             if (WARN_ON(next_e >=3D e))
> > +                     return ERR_PTR(-EINVAL);
> > +
> > +             e =3D next_e;
> >       }
> >
> >       if (WARN_ON((void *)e < (void *)phdr))
> >
> > --
> > 2.55.0
> >
>

