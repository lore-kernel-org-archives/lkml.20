Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12C53C3B9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175002; cv=pass; b=JvroHnhBgR8y1REGXfgYtJRq63GaMIZKDENf6Sxv/VU4A9RKmQm2zQ/2NxKOqJBkUv7SYESQYN6+yKlX4VDhMAi6PNJ6uDNTl+CHdrptNBwmOgtDTxhdkipnvIMVntrwIDLnykvL4aA6zbvmVUYGX+PLZNZexC592alp32QiHdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175002; c=relaxed/simple;
	bh=WebFz/x2kN4bRHuJPHFy9SuIkJELXXm1xUzthNsPI38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oga3VXCLq0oBqNe2J6lSWYivrDQH+2kSxrAwSHIbvNSNeRHhzbdU90eTKKFXLMjAB0JLJAVHLgEPDLcOPlHtiK3oXsU0RHIQ/o4HKXMXzfIagiAvpiXEe3pld6ZE1NTWnOHM44/2UVvcR/CcCJGO8sjk4K7ZQe9AcwFwMP/bS3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SB1oIBBS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ljOz8B0e; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SB1oIBBS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ljOz8B0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790175000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjtigGpmQBYCeWjN840ZGVkbkxHuJotFRoc5rNE0Iz0=;
	b=SB1oIBBSpYWhQ1FdaDJsLpWZEd4SthLycGl3nJKVbp+IpfZlVphqg4lZNpCeYY4i/696cP
	rN0M6MEBBZIXUZ38TiE0cr1yqK9AokWQbEP5pSdFYVmPfMc6fXGNmBiBVtxD9QMLJieoaa
	xnX+0qP/aQIxhDtMC8rvDC50AorXKkE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-30zmHb4oPwuXyE34kvq4UQ-1; Wed, 23 Sep 2026 10:49:43 -0400
X-MC-Unique: 30zmHb4oPwuXyE34kvq4UQ-1
X-Mimecast-MFC-AGG-ID: 30zmHb4oPwuXyE34kvq4UQ_1790174979
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8789206f693so13050677b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790174979; cv=none;
        d=google.com; s=arc-20260327;
        b=UT4NdPLj26O/hmvqpyy2vPSA5us6fOg3YvHwX2a+M2yOKaZzXMxPEU6VG+yOX+o8lY
         5jT9rnq5sFuZvMduoNrXCambRCXe5F6HVr9qZ+5jqaeEESdfaiee4vMVmFjEyKYxLtCC
         EbhwQ1EXkY/3g/v+FAHR4RiPgFp5uaBayOhEe+gncsq1od9kmWWRHoqrk/fwsU9z00ox
         yF7EtvQZBnPrWlmWXHoyFbFGY10U0hSfBG0Afxid8U2zSQ2r3izlxUPoh9sK/6s80DzF
         zpjXST+Y3cVuxgvnrLPRLButD5HQQX3YYJudKVaIjkBsTCt0Bu4UxlGqbd8y1DYaDUh6
         ljIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tjtigGpmQBYCeWjN840ZGVkbkxHuJotFRoc5rNE0Iz0=;
        fh=xaZtelCyykVfghOvGUHTpxhVsgJuP3CSWzZTdLuTbBo=;
        b=O3qCms1bUfXnkxi9bnhx42fMaRaNzZ6mqQlkZTz6LZhyH49qFgKKSf5pSzNlln1+kb
         HwCl9k1zAqzLDU4MjuyUiMVzJKeyArjKmW0rkxzBHEiRlBB0dsHw++RIPuYib+OIu3i0
         IED+hvFN2C8MBrY9GIhdm7+PYyaWnUorgLwTFHNuDdv5ZY/p5XMg9yg8fkMfLTt8bKAz
         gRS1IvdE5RRfYlIlN69bO4FJJwwVvqK6KkZOHWfW8ZxnAPuxxtisQEaMS05FzaFvZyFr
         wuuOTNa4HOANdmfQqIqcC8yJTGE99KhU3OgYi1pqahbP0eKTow87vff1bjr4KU1lvn2k
         8hDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790174979; x=1790779779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tjtigGpmQBYCeWjN840ZGVkbkxHuJotFRoc5rNE0Iz0=;
        b=ljOz8B0eTXfRZu74H5vh5d4lU26ogBQ5xFf32Rcmn8afynzBXCCcUroG9rxb/sc49B
         Yj4vUfvAJach5g+1eldy/hto4QtutX5sjD1u++Fcth4HovbWVhSKuTvOJfN6ekCxMDyw
         mqCmVSQw9E8N3aYvOxQ6XZc3vLf2EUdi9kIITFx9ItuizuOYwdfLdA2LgqUhJ/j/TsaH
         6SDNnFxJsJb4Jn7R7nAvvMuf131rL3Op3P5j8YqUAiKZkytAj3R9I2gy1LdG7rY5cZxV
         iPYD/Fko3RO6h+IAMnRh1txWri7Wg1LAdA8OZNCSU0vqFeiigLyvxH0DvRRBCkk5rKtm
         XHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174979; x=1790779779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjtigGpmQBYCeWjN840ZGVkbkxHuJotFRoc5rNE0Iz0=;
        b=NwDel01HVZ3JZECDw1GInWCIf+CMHxC5FFBpuihH7hNHyNiKONnOiTD8YE8838I1WP
         VQSp91edGQPg9p62KXnqzzJXE5GmF6A7UkZtYWT0JMEtFbYfnAX0A7Z6iXk6KEMMOdvr
         0Hfrj0d/G4vC6tudDkn5+/IHPWeAMsR0opXq/6b+XVyptoW1uMNkghWiDAdneh4iJgdC
         fZtjW8EurGhDHG1HAQyUYipB94vh2KLKK3robYKqGxipFCWzATeFKBcozisNDtC9pEyG
         cDqcb6PgdBYrCDP26+dGRZgF5RIszwa8HSV1j4FtRNzzcJcaShCevsnpO1qj5j0lPVXk
         d/lA==
X-Forwarded-Encrypted: i=1; AKwUvBwZtdVnEJ4mYKNwJtuPIY8yHCfPIa152OGhzbQmsuXytsij9321j51zP4LqwHJ7LGIYAd9TE8PGiQCqj3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++njl7kWSFcIWkzy46pwyNvYtafPov2lJqaspEGp8rBYoPoLcc8T
	j2M0FgW8gejB8dDVZZ3c7bwI6lFbTvgXWFlB5pdlZO1JiaPHPg+eroI+K0kdO9Tog8u3CkVV5DJ
	5roiYJroaRHmDgxxen/aANJ/ztqsM/R0SMpWxjvmhrfvo6Yps77Pm5tgdF8OcSTQk4Gj6jrf6cY
	T8F9zNr4Io9aHL22medW5cF4qS/rbJrBn8Wi04mO89
X-Gm-Gg: AYBFou3x2JvoZ5c0LaF1nzmu0EGYbFCvrsmgILp+ub67TGbzX3voKemBpzklsGhSfmt
	WdEntVbG8iMfzj4DR2gyWvN2YuG7ngaEwzQYD6Qxq2je3poL4muPqGWwxSnI8947/zJh4//q51W
	9FrfaU+j1yCaW1HD7AXWQRCgMj4hlRAwVBNt3qZU0z4hsx/9DJlufEow==
X-Received: by 2002:a05:690c:5689:b0:873:5ddf:d85a with SMTP id 00721157ae682-8a45921c328mr11363447b3.37.1790174979059;
        Wed, 23 Sep 2026 07:49:39 -0700 (PDT)
X-Received: by 2002:a05:690c:5689:b0:873:5ddf:d85a with SMTP id
 00721157ae682-8a45921c328mr11363327b3.37.1790174978696; Wed, 23 Sep 2026
 07:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-port-smem-v2-0-bb497dd3c48b@redhat.com>
 <20260904-port-smem-v2-1-bb497dd3c48b@redhat.com> <b3ae48e9-c2fc-4d04-8926-503fa6192c1d@oss.qualcomm.com>
In-Reply-To: <b3ae48e9-c2fc-4d04-8926-503fa6192c1d@oss.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 23 Sep 2026 16:49:27 +0200
X-Gm-Features: AclHuK8MZPm7Kj81Y7Rq0M_C-YZuLWYmQS8ZOOU3IYOzjUo1jgQ8cF2XkT5Nu_M
Message-ID: <CADSE00Jrn4E4bac7xoym77jujHuE0+n3Ta_OXpRco2oaORUaWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] soc: qcom: smem: add boundary checks for partitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sarannya S <quic_sarannya@oss.qualcomm.com>, 
	Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>, 
	Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 3:58=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/4/26 5:18 PM, Albert Esteve wrote:
> > From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> >
> > Add condition check to make sure that the end address
> > of private entry does not go out of partition.
>
> [...]
>
> > @@ -409,6 +421,7 @@ static int qcom_smem_alloc_private(struct qcom_smem=
 *smem,
> >                                  size_t size)
> >  {
> >       struct smem_private_entry *hdr, *end;
> > +     struct smem_private_entry *next_hdr;
> >       struct smem_partition_header *phdr;
> >       size_t alloc_size;
> >       void *cached;
> > @@ -421,19 +434,25 @@ static int qcom_smem_alloc_private(struct qcom_sm=
em *smem,
> >       end =3D phdr_to_last_uncached_entry(phdr);
> >       cached =3D phdr_to_last_cached_entry(phdr);
> >
> > -     if (WARN_ON((void *)end > p_end || cached > p_end))
> > +     if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
> > +                                             cached > p_end))
>
> strange indentation
> >               return -EINVAL;
> >
> > -     while (hdr < end) {
> > +     while ((hdr < end) && ((hdr + 1) < end)) {
>
> I believe the latter implies the former

Yes, the check that matter is the second part. I'll fix it in the next
version, thanks!

>
> [...]
>
> >       e =3D phdr_to_first_uncached_entry(phdr);
> > -     end =3D phdr_to_last_uncached_entry(phdr);
> > +     uncached_end =3D phdr_to_last_uncached_entry(phdr);
> > +     cached_end =3D phdr_to_last_cached_entry(phdr);
> > +
> > +     if (WARN_ON(!IN_PARTITION_RANGE(uncached_end, 0, phdr, cached_end=
)
> > +                                     || (void *)cached_end > p_end))
>
> The || usually goes on the end of the line, please move it there
>
> This patch changes a lot without much explanation, could you please
> split it up so that the changes are more focused? I know the general
> theme is overflow checks, but a lot of conditions change
> simultaneously in its current form and it's hard to track, even GPT
> is slightly confused

Yeah, you're right. I was preserving the original patch as is, but I
will try to split it in a way that makes sense, while keeping the
original SoBs.

BR,
Albert

>
> Konrad
>

