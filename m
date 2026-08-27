Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4218E3F20F9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820398; cv=none; b=bhaLOJg0n+s8AbCBAz+xu55XmMpyf1blLW9r0Qk8rbxgJm3xLzKHx5k5mI+jRcleQagof76C3gxZlWJ0Dehm1y6J3o/87OVVMLZA6HpZUGe6oMwU03KJaYZ6m5E4m339JfGwnoskMydpajNDVXtK9dkp2fNnUZf0mlmRfT62RB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820398; c=relaxed/simple;
	bh=VlK+yu9CQ1afWmkVemM9w7NYmgEvjZktOW/P/YBnAIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGWoFYnlHEB+q4m869uo4KG3LZJ+4TsAbFeCDOKanWPRLGBhFv79L36mY59rxch90HzdkoOQTStMoaS3oM2T/LW3kdgCISbOnvLhtqfN9EhVRa00yohWDh1sAyXTbBBCMuEgrzLECg+sM+wZBg0u3G08mQXoi48v/zCxGHLy7Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXuyidQw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXuyidQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429071F00ADE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787820393;
	bh=784uPUxnXmdjZQ1kRjJ32yFBkoMi7jJfSK/kdFBuyNU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MXuyidQwk/Zgk8w3+NI/w6MPMB0OZaxTRIF+B5IMhGA6+unsx5mB9a2TjK+3k2tU+
	 iQpk+r2+hbejWmApYL6ddCwUCw3jZLkPfN2mikXQNfErSGTOxRaY6RSzvqtMKiCmSE
	 CNkjDou/Y1OH2P27FGjWSbYOYIPVnztjqsjJuAlCLGiZCLNt20C0kVYuPPBC7F3ruV
	 qzsXV7pvIWlyJ0TMwkZkaYJpaVTiUMcNtJaYaVog2x8AxIq+E84hasVdXqkIAcbkvn
	 13O2+SOJoCMnniOXCabhv37O3k8EtvChRejhnQoWJQdmzF7kEoDcyhHNJ5lpqnQ+7/
	 v/Y+fTiAXAJ4g==
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92ed3993c1eso103920085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:46:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpVosKXjAWhSiKsCfOqjR4p5WZXDUroxXu75cEnu4rHTNLNm+fH7pIR3DrQFEGJgIeXSrwAyOH7cEvoa4I=@vger.kernel.org
X-Gm-Message-State: AFuF++kzg7zytKFWJ+gz6xraKx+dR4hDglVW0NoASp+FObsiJ9g30fWu
	HJbxcBgofGsM5UnWaGAUHeM4lEehCMA3rBFBqJ4Mh8RGNeQZ9jsQE/MRyPZyX8LRpB3TDskSFDz
	4CgCyTB5xuEop2Siu7ZELtaxG8mwXHi8=
X-Received: by 2002:a05:620a:4056:b0:938:7751:c0fc with SMTP id
 af79cd13be357-9387751c37amr858807685a.39.1787820392579; Thu, 27 Aug 2026
 01:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com> <20260821-swap-thp-cleanup-v3-2-9b43f5163238@tencent.com>
In-Reply-To: <20260821-swap-thp-cleanup-v3-2-9b43f5163238@tencent.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 27 Aug 2026 16:46:21 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x7ukyX1nUikuZd6fWtCdAJyfH8zJt+yRPByU7pZ8PPag@mail.gmail.com>
X-Gm-Features: AcwNN1WxikwbEEtqYbvwE85-9z0wXWh1NODJWyhBapFeBjNBDCZFC5Ry8jne0oc
Message-ID: <CAGsJ_4x7ukyX1nUikuZd6fWtCdAJyfH8zJt+yRPByU7pZ8PPag@mail.gmail.com>
Subject: Re: [PATCH v3 02/18] mm/huge_memory: fix rejection of swap cache
 folios with a mapping
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, 
	Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <ryncsn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 2:55=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> A folio in the swap cache cannot be split if it has a mapping (shmem).
> The split code does a defensive check for this in
> __folio_freeze_and_split_unmapped, after the folio ref has been frozen
> and the NR_SHMEM_THPS/NR_FILE_THPS counters have been decremented. It
> rejects the split and returns -EINVAL without unfreezing the folio or
> restoring the counters. That error path is buggy: if it is ever taken,
> it leaves the folio frozen and stuck, skews the counters, and fires
> the VM_WARN_ON_ONCE_FOLIO for a state that is actually legitimate.
>
> Check for this case up front in folio_check_splittable and return
> -EBUSY before any state is modified, so the split routine always backs
> out cleanly.
>
> Also fix a bracket style issue that checkpatch.pl keeps complaining
> about.
>
> Fixes: 00527733d0dc ("mm/huge_memory: add two new (not yet used) function=
s for folio_split()")
> Fixes: 714b056c8321 ("mm/huge_memory: convert VM_BUG* to VM_WARN* in __fo=
lio_split")
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

LGTM,
Reviewed-by: Barry Song <baohua@kernel.org>

[...]
>
> -               if (folio_test_swapcache(folio)) {
> -                       if (mapping) {
> -                               VM_WARN_ON_ONCE_FOLIO(mapping, folio);
> -                               return -EINVAL;

BTW, I=E2=80=99m really curious whether you=E2=80=99ve ever encountered thi=
s warning?

Best Regards
Barry
