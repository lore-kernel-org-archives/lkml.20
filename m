Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048296;
	b=40OsSAg8jkyYrbHMf4FxtSYYd/D1yXk5pmQb2R8jjpQ5KTOQrfMFkgVRCNKsgek2JK0d
	 v224PKbNCNwBW2W31debhiDiN6ik6bR5Bpj4Hs+G9Gdb1ggQjdNZfDtT3SgI4t+tm/CBx
	 n2Z1oOjzGKkTYDvG3B7Ylx2R7mMQUFNlnvsViS7eMjU3wnY43QI6Hnq+pH21AtKMWIsVo
	 qA/S4LnPN0JlU/IoTF7Z801u49eJPGYVIWjab2oiMXdkAwxli3DyM0SfywpuJS1X8WFLy
	 0WbaYDcknZkKPySkhWphFGOR3k2xyeHsm7o+fx7wscVX3tJRRReYeEFAnm/+D7+WR4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048296;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=icmUq+qL2c/gwZjRUiz00O2bxdKoJyT2ITQRS8SDc+k=;
	b=peGZpMtSJUrjwogwBH1A3AiCsq7cZTLuqdvNeQ4skEXpV2xduwRCXwG5rHzSoqqh25UN
	 JqsgmAWpSaXO8ASp6UH2Yznx+OICHiLrlSK5EaZmKqjE97UhhBKYFiT7S9TswjnbDlr0y
	 r9nrjoy1lsrtui6jHhBeZLFM/+HTtNhf5m3VOYYVWucFkbp4ntqom8wRAFgzNYbsLUIE2
	 ssHqgxG80efsvFMfEIECALz6vfJX4zyscJYwC7SJzi4aeg49OLzVROzDRv8iCVSif7e/V
	 g2vD52NgJm0u36ec3IlpFIWXgvN2t2cqiZGl7/vbP7W2WwryGFvynKBMknIatGdgkNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c8Ahxz+L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057C6606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c8Ahxz+L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4BB1F031E0
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793048295;
	bh=icmUq+qL2c/gwZjRUiz00O2bxdKoJyT2ITQRS8SDc+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c8Ahxz+LtK0cK80zV6kg8UGyAghjfA0p3hs9m5IKO7imlTjuRbPZ+YWwVA8GXrV1J
	 vHHpMylEfor90qdVsHO1EWbJ711CTvV5FnEqmxY+jAh+oj16Uu3g4JU/ULctNeQBT8
	 M81B/4dEEle7aqWzOV4XkJqegLUGDxysOYzRVj6ddtAUxeJP47tcufPOhTXsEIQMd/
	 d1prtaXbqKqDbuQtZpXPZTcbpNO9gMrTeWXNbCbOJvPcWLij3ylBetKULwzCWyWkbU
	 QQRvZ3kC+eMRggyFSpjcmFJPkmo+Wdko+nPmjJNTXclQgtZlIJtITyoXQMnL9OxBMW
	 GsnMkvZrRP4mA==
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e7ad9f78dso411895285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:58:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6IWrXgKABiRQsO//1b+fwl5qMXpMXSxN40SE0+pbLaveNyo3NM/vcwwFjegoAkWZUQxJbh+3Q3WpHy5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfo7vIlb4r0tF2GaUf2ktJ1BPCAbE4AmTGZEc68aoyKwS860r4
	5sik8zdQbo3Wac/24w0tyHWwG7Um8SPtCwwZZqN0zAoEDTZPIm4PVy7aeGvwStI1p7PObv18ZGT
	XNTOKwHUuD9nxg0fqfQ8rmqjlMKX96zs=
X-Received: by 2002:a05:620a:271d:b0:93f:e53:a55c with SMTP id
 af79cd13be357-940ef95200fmr1180262885a.78.1793048294632; Mon, 26 Oct 2026
 13:58:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
 <20261025-b4-ksm_fixv2-v2-1-8b61ad0491f1@linux.dev> <CAGsJ_4zUVpBJazRxc1CzN6u5XvpUaGnaf-_7JMz-rGK_ZTYMtw@mail.gmail.com>
 <e865f7f0-087c-4fe5-b729-6e6946cd20f6@linux.dev> <CAGsJ_4wp_jCtCeMx39nW0Z1Jm5pja7_V6XNwLB6p7zTan0c3VA@mail.gmail.com>
 <dee39669-b726-480e-8ca6-10f19512da68@linux.dev>
In-Reply-To: <dee39669-b726-480e-8ca6-10f19512da68@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Tue, 27 Oct 2026 04:58:02 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w4ozXM+=T0qGBAhC323F49Y4LxrrKKt3GFCs+en_TVCg@mail.gmail.com>
X-Gm-Features: AclHuK87m9cZBrXF70X-vghHkwSRiCol7Tl6VccIZSTsfEiuILsGNXgum-WwE1U
Message-ID: <CAGsJ_4w4ozXM+=T0qGBAhC323F49Y4LxrrKKt3GFCs+en_TVCg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm/huge_memory.c: skip zero-page remapping when
 underused THP shrinker is disabled
To: Nico Pache <nico.pache@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Yu Zhao <yuzhao@google.com>, Xu Xin <xu.xin@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Usama Arif <usamaarif642@gmail.com>, aarcange@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:02=E2=80=AFAM Nico Pache <nico.pache@linux.dev> w=
rote:
>
>
>
> On 10/25/26 10:52 PM, Barry Song wrote:
> > On Mon, Oct 26, 2026 at 5:48=E2=80=AFAM Nico Pache <nico.pache@linux.de=
v> wrote:
> >>
> >>
> >>
> >> On 10/25/26 2:28 PM, Barry Song wrote:
> >>> On Mon, Oct 26, 2026 at 1:40=E2=80=AFAM Nico Pache (Red Hat)
> >>> <nico.pache@linux.dev> wrote:
> >>>>
> >>>> The zero-page remapping in __folio_split() was added to support the
> >>>> underused THP shrinker. When the shrinker is disabled via
> >>>> shrink_underused, gate TTU_USE_SHARED_ZEROPAGE on split_underused_th=
p
> >>>> to avoid scanning subpages for zero content unnecessarily.
> >>>>
> >>>> Suggested-by: David Hildenbrand <david@kernel.org>
> >>>> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage w=
hen splitting isolated thp")
> >>>> Signed-off-by: Nico Pache <nico.pache@linux.dev>
> >>>
> >>> is b1f202060afe a correct fixes tag? as
> >>> commit b1f202060afe has no even "split_underused_thp" there.
> >>
> >> I believe so. IIUC these two series were merged together. While
> >> 81d3ff3c6f7 introduces the toggle, b1f202060afe is where the behavior
> >> started.
> >>
> >> I guess you could argue that the Fixes should include both?
> >>
> >> Not entirely sure!
> >
> > Thanks for the clarification. I guess it's fine.
> >
> > BTW, with the code below, we no longer add fully mapped
> > folios to deferred_split_folio. So the scanning code only
> > handles partially mapped folios to set up zero-page mappings
> > for their subpages.
> >
> > I'm still not quite sure whether this is really harmful, though.
> > Am I missing something, or was there some discussion I missed?
>
> The issue is not in the actual shrinker code or the deferred split list.
>
> The issue is that any split leads to this zero-page remapping
> indiscriminate of the actual toggle. The same way this toggle is gating
> things going on the deferred split list, we should be gating the actual
> zero-page remapping too.

I'm not quite sure this is true. The toggle prevents fully mapped
folios from being added to the deferred split list, so their
subpages won't have a chance to be remapped to zero.

For the remaining folios that are not fully mapped, or those
that were added to deferred_split_list while the toggle was
on and remain there after it is switched off, allowing
remapping to zeropfn doesn't seem to violate the toggle's
intention of preventing fully mapped folios from being added
to deferred_split_list.

Anyway, I don't have a strong opinion on this.

Thanks!
Barry
