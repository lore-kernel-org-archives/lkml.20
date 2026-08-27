Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B203319601
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852920; cv=pass; b=nYRVJrCkKov6ghBo4Br+/pZMZc8zbFxLMqO9XrBWvxa2QGZP3SvTKNvrVkpfvqWE4O6PUTH+FmukRqYddMIaeHH0HVDL6rnRaQsFtKVvIpVN52caibvff4A3nfaYlUuLObUfmgX/4PnSBG2W3Q+fXP5qy4xDeUc5jSX5QWV08XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852920; c=relaxed/simple;
	bh=tKl7Dj7JmpH1LVwes3xnKLYl7xF6DJdsYhI6PQ2CgpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LbNZCr5OZFnpHMRE8+di4E9P1wGzAI0i1pKDq/AakOhqqREaAvU38Ytt3xYnRmzIeOHDh3GIlsBRUpbd7QcYqf6DCa0Xmz4VkxFdumiobVm14tRQCx+HMozHhyKx/Hf4WTHJhkvpUN96DyZ7UZbk/2XVeCR0eUWWDuAzjv19yd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rn1hwcev; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rn1hwcev"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2530cabcf4so23123166b.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787852916; cv=none;
        d=google.com; s=arc-20260327;
        b=qNOFFGXt+BAnhAPGFQaXlOwnETuSK3IkCdf/PG2fMJgyhmNvObdngDnRS7dXsiDDFQ
         FNjz06P3ix9iSnFfxZo8CHLlPjLJ1agCiMXymJ/ZVJpKABBtsNyNV4w/OwaulzQKNgHJ
         QC8m601kzdEB0i562Q2v0ELA+utabovPoBeGEl1wrpp7Bmp5SpxJXhjF+4NvSk5ECOUj
         RBynZ8JdgX28Vqywe4XjwDrIvwjs1TiIAk2Mi05UB43vXyicoGm1mibAJPs+GvYONV/n
         J1WgBa16ujD/VMixrexLPlXLnuE4WCkdWg2Al60l5VeaBcKKOZ5NUFq7QzVNXC8PWJIy
         Pnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ki/jHERIN4Hv3jSUFZztXyDphrusQOq08taXm86VOSQ=;
        fh=SoZz9iaspGeISiP8GocPmKhph3qgJGJ8ROUHpm9cmGQ=;
        b=Spm4L9FRYie+K5Xv/JDA42fQCLTOYYCvoH1GsEvTd6/hhnVa1dnkiDebdpp8/wGR1F
         ohUz0axM7KJAZmGXNAfm2q2LWo48/5BQdVD24corWTjBL76+8K16aEOfiXRs++QeXkgU
         hNmioaAFhx4s9tb9ZB3gc5b7jf98rGarqJjCroGKitZprUCBdBmC5NZ0rm09+CoFRNKu
         W9GuR/pJcnIOavoe4Q2EQe27VlutFhewDBmR3rCnopuPRTeQjugnvjBkhV1zOw6WWvw0
         Q3H3A5ezA2Pwh1d/Xy9eltUEQcJI+20103mpGJ2DZHJNCOcmvEu77azwhexnKcj8ZZYj
         iN7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787852916; x=1788457716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ki/jHERIN4Hv3jSUFZztXyDphrusQOq08taXm86VOSQ=;
        b=Rn1hwcev+el+zYEB94/4uQNclcf4XV6bHlco0FKHMcuyiMNxdnuaehnuljRpIPRp92
         +JMIPR54Laa0aJmmVAw1Ncgpl0evrgkdOdyz6VUq7ocwm+knPyLXDvVwkQ9SOoP7CcVT
         gPHAMnVKwdMPWuP+jDP5xiYD34n4N8zq491uMQPvWI86C5WmDXHdLsnQXlmmpDTGn8FJ
         QfWzoLB7MzcAOLqEp+Mcp/ngALFa9P/CHQmFriEboBD5ZCeubRjLN9881BGWkhesTDZd
         oYqlBaJW1j278CPHXg7S9oBj3zzqzcPX5kf05M5G9aagRLvGyUewTxuL2wRR7hlY4sK8
         gKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787852916; x=1788457716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ki/jHERIN4Hv3jSUFZztXyDphrusQOq08taXm86VOSQ=;
        b=fckswWwm/7mCgazHx2y5/49erXEt4ySOvsajACu67JbSAPf9BLLvb5Nx5ZHSG4RwOr
         f/sIK2viot1LyiFsvSMhkEGgPnfIL1yLpwtOrCDDsqhqB2P3rUvl+5VJr0UGPrlsccPa
         J6j7dDeu98ZXFbcZOgl9l70O0zthano/Co4E/C1q2HB0KVTDBs9L8nJ/mcxYRV3OehcG
         mmD6Ga/TgzVhkpq5ne1+fPE49C8CQETpdHLRfwzEGUejXP/nhJFZTpuchkdO9jIqSUek
         kIGsTAOZ0SXohikQeCIH7Kc40SRDUVaLDPjILe3/yIoCFSxlQQTtKyCaVgz8UUSbahoq
         ifHA==
X-Forwarded-Encrypted: i=1; AHgh+Rq79ti3kQo7ZW8VNLgR7e2tnhLABSC7ULZqsRr7Rn/MwUvSa6qIWh1jdQclpMx/yv6JUBcBUaZBwou/b9A=@vger.kernel.org
X-Gm-Message-State: AFuF++nHFLgFXbrsZrZaykAFqCSBvp3Azqp9ag08bVNP/CrUCx+rQOwY
	TJk+GxLmGVQSax7zhaZLkXD3+y6cL2l7u0r/SCH11lvQv/mNf/5nj6j5uicTrtuBcfsKUM3/rua
	VN0ycf3/QPNm9+iYPpLGsIsU4iXsRNxA=
X-Gm-Gg: AR+sD11qFMBYnj/QJw8XyNgYXDGwgFr/L6uuljFvITSuWFAcD7VydlvZ8Wq6tD9/cXj
	27eKPi7nWRdhZdlBuywW4C3xUOjoTxo/oBUJCsWb76tibP1Mglf1gVno6TcB0c7I+e9UzixKuCF
	vISyIDfwFnpeNLNVm4xgw17kCb9ednmtV9l/GOfrTOi/9TAbc2DkGQsGnAseKKjH7VRRhnZ476U
	QTZZQKqPspAdA3qBYCm1c1JsN9TstcKmVBBf8BAwqevgurPuyR6MfAs/sadkRE4XG55ckJFte33
	lZpqQicOq6YnzH2BJoqFhLctnSyGiPzbgcyYOrxF3wHbdpGlgY/a6ayzMxeLs+NPwCT7Nz5HBax
	g
X-Received: by 2002:a17:906:730f:b0:c1c:6f0d:5b22 with SMTP id
 a640c23a62f3a-c25570166d6mr33555066b.11.1787852916422; Thu, 27 Aug 2026
 10:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-15-9b43f5163238@tencent.com> <ba386e23-1b05-4897-98b0-ced78df6dc25@kernel.org>
In-Reply-To: <ba386e23-1b05-4897-98b0-ced78df6dc25@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 28 Aug 2026 01:48:00 +0800
X-Gm-Features: AcwNN1UewL-cuQ-vSgggye_rWK2vi1yOvz8HHS6k5d9ejkD-Ea0vd1P4dZ-uXL0
Message-ID: <CAMgjq7Dg5pf_MR=C_KqixYmyfXyD3UpKoR_6aO=aBpZsY4yJEA@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] mm/huge_memory: lift order-0 restriction for
 swapcache split
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 12:51=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/20/26 20:55, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > The restriction that swapcache folios can only be uniformly split to
> > order 0 dates back to when the swap cache was managed via address_space
> > mapping (swap_address_space).  The old split loop only created order-0
> > sub-folios with a fixed stride, so non-uniform split and non-zero order
> > were rightfully blocked.
> >
> > After the swap cache switched to swap table under a cluster lock,
> > __swap_cache_replace_folio already gained the ability to replace any
> > number of entries for any sub-folio size in one cluster, and the old
> > swap_address_space locking and limit was removed. The restriction
> > became obsolete but persisted through multiple refactorings.
> >
> > Drop it now: swapcache folios can be split to any supported order with
> > either uniform or non-uniform split, except order-1 which is not
> > supported for anon folios. Mappingless swap cache folios could be eithe=
r
> > anon or shmem, so for now we just simply forbid order-1 for all swapcac=
he.
> >
> > Acked-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
>
> In contrast to the other cleanup patches, this patch changes behavior.
>
> I would suggest to send all cleanups first, and send this out separately,=
 such
> that it gets proper attention and doesn't get buried in a sequence of
> harmlessly-looking cleanups :)

No problem, send this later then :)
