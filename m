Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874733;
	b=mXnrTv+TA5FortsJtwtCcvbljuWS/4sPi8q70QzK01/v9o0FpuUxul40wAoCCyNZNeYc
	 eqcwZJ6sehkwekLad32ucFLFAxr0p2ViVlvOFJ5dq3niZX8RuAydFlbAZn2am1ut0LNZ8
	 mLPrEnTwNM3zRxzy7dpHHVuEpCQyqvtcsT6LrkqeMWTD7wkbfnWaj0KCN1KW6ExV6YHbM
	 I/d4iDTpsamxRmO9nRxbbv3jb9ddfNN4Qwax/OhJHLaxElV9kJtpXPb/pZlj47MBB/LMU
	 WzsaaVB9MpYxKcjIVWSBOrlz6F3J8y2PTm/jIxUIhhbkowtu027aKHBIza8+P/WLYAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874733;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Lrnsp6197nXbKfz7bzeAhyKJ69gwaEJNrVqWiF67Y5k=;
	b=R9sT2NFJemBJRJqn1HCka2ptw5J3nN1epOqA1zjykPKp0fEyIbOexvvAWNOPC5tJHot4
	 RwEsKeT1HjG0hzQZmxaRxi1AAKhTfVduZ5XwyZjKyjiw+5Nl3vMmagayV1i2RQBAX64nO
	 /inDMA0XSt6BUCBN3AFuqRO+5gxlp2XBE41xsDpw8U3tWYjC57NVlys8KjumJbN/ZHHCS
	 ELxL8qCxePj0TI5zB8K4iPLr6nAQuECmow4kICj4o9ZAu0U9wGJSlgw2+V3jAST46WaFp
	 YWgJH0GxjJCXRvwAkQsjz38uheWAcbAfgjrdvRKbW8ELbk91jYrZ192gH7722ROWZPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f9zNBmkH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768DC606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f9zNBmkH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCA91F00A1A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793874732;
	bh=Lrnsp6197nXbKfz7bzeAhyKJ69gwaEJNrVqWiF67Y5k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f9zNBmkHXUDiM2i79TBUhngAJT/offW9uUYj7IT+ay84jKVv+24MqoxOIEqQ6AMRR
	 SWNwxvFW6yWgHhGLXyjZVMGxvy75ZtGcEfKqcisBvOrr3Jhv84zK355MGnsfx7DgzM
	 GcV3i/+acM8IEYqtLbs3IEY7/GNq/7h8vmDVZvM+xH0cDbgDF55i74kmNVoNhYyfgl
	 PgBc4oQ1XPHtaEXCozt90UoSz8PU54zFAO4YNbMj+OwxMZX4C0FJhZp8b8AgBoRNpo
	 +5S/srbbWH3rHda8ianAjjPMiFJxQoJtzdkuVe0U7iS2Chtkkxil7XFVKE3PTqKTMm
	 FwmwY4nf37uHQ==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4697404c2bso232990866b.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:32:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByf+pdyepyfCBE0w1mTwQxaSplrjKNtVOfXf0NhHscVzO9xxDAbAldj8aKSE5jsM60CYxV6AbaaUxrgOkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bkPJPmERMl8AwygSVFRm5OyCfEwWGENh2DOPlujsjbwLY8JPC
	w7vyfklg7v+0x8cVkaL2UN8GVuRNKTtRlj5GEFxWiNpZt7GQ1xM9gGMS8QidrzjP6DUWJf+CjP6
	ZHZDTfGQXr4GgW2kv/0rQ/eK4443QDW4=
X-Received: by 2002:a17:907:9446:b0:c49:a571:c4f9 with SMTP id
 a640c23a62f3a-c4ca7a4205emr1647597366b.13.1793874730739; Thu, 05 Nov 2026
 02:32:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260922121058.972734-2-maobibo@loongson.cn> <10bd45f8-2d37-42f0-b7d2-a4a84933c9b3@loongson.cn>
 <CAAhV-H7Vq2ayLJNLRSo5RRiWOcmF2BXT_QOhEDg_jWOzYteqWw@mail.gmail.com>
 <6f8a9203-6fb1-268a-8d37-37e69fbf2ee9@loongson.cn> <CAAhV-H5k8EJrAuqPH44y_+1gcXGCjCoozzK5ii9cLtiLDj5eog@mail.gmail.com>
 <66b9d482-d577-748c-729d-0fba70701d3d@loongson.cn>
In-Reply-To: <66b9d482-d577-748c-729d-0fba70701d3d@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 5 Nov 2026 18:31:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6PL6RLM3KA4BLQEt804FnsDE4CtKeB0KaW7Gj8rm2PMw@mail.gmail.com>
X-Gm-Features: AclHuK80sIQTIxtcfwQ99SF2CCbdvpwZDrcVmzv31AZq50iDlL8vqX3SPfF4FJ4
Message-ID: <CAAhV-H6PL6RLM3KA4BLQEt804FnsDE4CtKeB0KaW7Gj8rm2PMw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] ACPICA: actbl2.h: Add bit constants of the Flags
 field in the IOVT IOMMU structure
To: Bibo Mao <maobibo@loongson.cn>
Cc: rafael@kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, lenb@kernel.org, linux-kernel@vger.kernel.org, 
	lixianglai@loongson.cn, loongarch@lists.linux.dev, 
	maciej.wieczor-retman@intel.com, pawel.chmielewski@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:49=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrote=
:
>
>
>
> On 2026/11/5 =E4=B8=8B=E5=8D=885:31, Huacai Chen wrote:
> > On Thu, Nov 5, 2026 at 5:14=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> w=
rote:
> >>
> >>
> >>
> >> On 2026/10/23 =E4=B8=8B=E5=8D=883:59, Huacai Chen wrote:
> >>> Bibo,
> >>>
> >>> Now I have applied this series but with some modifications, please
> >>> double check and test the code.
> >>>
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loon=
gson.git/log/?h=3Dloongarch-next
> >> In my v4 submit, it is:
> >> +               case ACPI_IOVT_DEVICE_ENTRY_START:
> >> +                       is_start =3D true;
> >> +                       start_devid =3D ep->device_id;
> >> +                       break;
> >> however in rc1, it is modified as:
> >>                   case ACPI_IOVT_DEVICE_ENTRY_START:
> >>                           is_start =3D true;
> >>                           entry->start_devid =3D ep->device_id;
> >>                           break;
> >> Here entry is not allocated and NULL pointer, it is allocated in
> >> ACPI_IOVT_DEVICE_ENTRY_END switch case.
> >>
> >> I really do not know what is aid to modify it and let others to test.
> > Sorry, it's my fault.
> >
> > In theory I should point out the modification (eliminating the local
> > variable start_devid) and refresh a new version. But we have no time
> > to do this because when the first patch is merged into the ACPI repo
> > it is near the merge window.
> Maybe our work style is different, I do not care much for the coding styl=
e.
> >
> > If you agree, I will submit such modifications to fix it.
> fix is welcome.
> >
> > diff --git a/drivers/acpi/loongarch/iovt.c b/drivers/acpi/loongarch/iov=
t.c
> > index 87cee4f0fc80..4cdac28a1fd0 100644
> > --- a/drivers/acpi/loongarch/iovt.c
> > +++ b/drivers/acpi/loongarch/iovt.c
> > @@ -115,6 +115,10 @@ static int __init iovt_add_iommu(struct
> > acpi_iovt_iommu *iommu)
> >          for (i =3D 0; i < iommu->device_entry_num; i++) {
> >                  switch (ep->type) {
> >                  case ACPI_IOVT_DEVICE_ENTRY_START:
> > +                       entry =3D kzalloc_obj(struct iovt_device_entry,
> > GFP_ATOMIC);
> There will be memory leak problem if there are START/START/END in the tab=
le.
That means a broken table? I think we don't need to consider broken
tables, because there may be kinds of broken pattern rather than just
a START/START/END.

Huacai

>
> Regards
> Bibo Mao
> > +                       if (!entry)
> > +                               return -ENOMEM;
> > +
> >                          is_start =3D true;
> >                          entry->start_devid =3D ep->device_id;
> >                          break;
> > @@ -122,10 +126,6 @@ static int __init iovt_add_iommu(struct
> > acpi_iovt_iommu *iommu)
> >                          if (!is_start)
> >                                  break;
> >
> > -                       entry =3D kzalloc_obj(struct iovt_device_entry,
> > GFP_ATOMIC);
> > -                       if (!entry)
> > -                               return -ENOMEM;
> > -
> >                          is_start =3D false;
> >                          entry->end_devid =3D ep->device_id;
> >                          list_add_tail(&entry->list, &np->ep_list);
> >
> > Huacai
> >
> >>
> >>>
> >>> Huacai
> >>>
> >>> On Mon, Oct 12, 2026 at 3:16=E2=80=AFPM Bibo Mao <maobibo@loongson.cn=
> wrote:
> >>>>
> >>>> This change is already merged in acpica tree.
> >>>>
> >>>> slightly ping.
> >>>>
> >>>> On Tue, Sep 22, 2026 at 08:10:55PM +0800, Bibo Mao wrote:
> >>>>    > According to the IOVT specification, define macros for each bit=
 of the
> >>>>    > Flags field in the IOVT IOMMU structure.
> >>>>    >
> >>>>    > Link: https://github.com/open-acpica/acpica/commit/352f750e4cc0
> >>>>    > Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> >>>>    > ---
> >>>>    >  include/acpi/actbl2.h | 7 +++++++
> >>>>    >  1 file changed, 7 insertions(+)
> >>>>    >
> >>>>    > diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
> >>>>    > index baef525367b5..76e4a5bc79b4 100644
> >>>>    > --- a/include/acpi/actbl2.h
> >>>>    > +++ b/include/acpi/actbl2.h
> >>>>    > @@ -919,6 +919,13 @@ struct acpi_iovt_iommu {
> >>>>    >       u32 device_entry_offset;
> >>>>    >  };
> >>>>    >
> >>>>    > +/* Masks for Flags field above */
> >>>>    > +#define ACPI_IOVT_IOMMU_PCI_DEVICE           (1<<0)
> >>>>    > +#define ACPI_IOVT_IOMMU_PXM_VALID            (1<<1)
> >>>>    > +#define ACPI_IOVT_IOMMU_MAGAGE_BY_SEGMENT    (1<<2)
> >>>>    > +#define ACPI_IOVT_IOMMU_HW_CAP_SUPPORT               (1<<3)
> >>>>    > +#define ACPI_IOVT_IOMMU_MSI_INT_BYPASS               (1<<4)
> >>>>    > +
> >>>>    >  struct acpi_iovt_device_entry {
> >>>>    >       u8 type;
> >>>>    >       u8 length;
> >>>>    > --
> >>>>    > 2.39.3
> >>>>    >
> >>>>
> >>
> >>
>
