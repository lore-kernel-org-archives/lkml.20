Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D13381B1A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420689; cv=none; b=rHPGBih+qFm0NvKjq0lu1f7eTy8JNOsXt07e2KJzwMTJUhxUo9p9TCxrFgmLqVCOVRlczMCmwBrmGFRqR7WlvtUSYw1p6uCq4srspJmAk+cZBpwXDwPGhFKhcoDNaH3N/ooY8UIpiCQCr8g44drO+uflazq2EEPNj1L0Ouv9XJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420689; c=relaxed/simple;
	bh=7zG9u9TuXc8+YswrK4qwj5egTXD+ot8bDs8IYn66F54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aPMdQmrLsb4gP8nfed9hSbno8xMzioO0z25eHBYbSJBPKgK3bJj5VsIkby2npnd7yklcjoMKjrnDVRu/gh6sOph4Z5KHop+OAuxEDm8isSL/4kNDbEZIZlJ1486cjNPDDv8w0va4m0PP8LcFR8WYztdric9gMCq+7gZwGLLchDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZ7Tj1gd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZ7Tj1gd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974BD1F008AB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420688;
	bh=7zG9u9TuXc8+YswrK4qwj5egTXD+ot8bDs8IYn66F54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZZ7Tj1gdm9SrxtbdCgk6ReL1sdwtzsWMEvNxd9JCUG8Ji0Xcb/d9zdJemIX2O1AQQ
	 AApQXGEXAoK0K2/iGycyA6NWVVBmbSXfGidRiu2aXny/LyxoW/ab5sc+eCxPFQPugl
	 p6+49opeEPqFbfeU+vC9Y200X42XE/AQz3orkztqZyKH+uURIehFRT/X9AC5v6+qXo
	 OOB5ixVvwxLCNLpSCu538j4bxX0rBY0XjwUNyfGqrWrAJ3IbZxoJmnZxV5gsuOY1lX
	 vujTwy4HdqWUEeFqEnezZCi+5izLM2Tu2FxmyY+2Vu4YaNOfjWJYVdrfHzpVHiVD/U
	 iOXghlqady6OA==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cadeb4so363561985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:18:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwkxPdi6fMsb7uJvnpj9xmrRCegjnQMQIZaov7yaxyJWEfIFr7fLI66x9uCu3fJlXGGLb+AOfPydiIJENw=@vger.kernel.org
X-Gm-Message-State: AFuF++m7TmXPgGSuwuJkw9d6ZZ67aiTnlrLrpxMERAwABgKXSlPmKrS3
	rHRFYS5jhHr0iWSeBNwLOhTrCCyqJpDpFhTTKDvxXAMAg3+JGDTdB7qOlIhho0/Sr/BYPB/MUfH
	J0GNP31Ms+1qby3WFJsdvHc3YxO+OMY8=
X-Received: by 2002:a05:620a:4885:b0:939:5f4d:67b0 with SMTP id
 af79cd13be357-93a29766649mr728782085a.8.1789420687917; Mon, 14 Sep 2026
 14:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914122950.3283997-1-usama.arif@linux.dev> <20260914122950.3283997-2-usama.arif@linux.dev>
In-Reply-To: <20260914122950.3283997-2-usama.arif@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Tue, 15 Sep 2026 05:17:56 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x54z4afiLwNwgs2u0RP1WEBbCgtFQpszqi5q_pkydeUg@mail.gmail.com>
X-Gm-Features: AcwNN1XhiKWzoaffDJcnpMgvSmrkdNy-g5DUkTJv57ChGKG-Ex_IRrRos-wQ8IU
Message-ID: <CAGsJ_4x54z4afiLwNwgs2u0RP1WEBbCgtFQpszqi5q_pkydeUg@mail.gmail.com>
Subject: Re: [RESEND v7 01/29] mm: rename pmd_to_softleaf_folio() to pmd_softleaf_to_folio()
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, chrisl@kernel.org, 
	kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org, 
	ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>, willy@infradead.org, 
	youngjun.park@lge.com, hannes@cmpxchg.org, riel@surriel.com, 
	shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org, dev.jain@arm.com, 
	baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com, 
	Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev, linux-kernel@vger.kernel.org, 
	nphamcs@gmail.com, shikemeng@huaweicloud.com, yosry@kernel.org, 
	qi.zheng@linux.dev, luizcap@redhat.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 8:30=E2=80=AFPM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> pmd_to_softleaf_folio() reads as if it converted a PMD into a folio. What
> it does is decode the softleaf entry stored in the PMD and return the
> folio that entry references - the direction softleaf_to_folio() already
> spells out.
>
> No functional change intended.
>
> Suggested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGMT,
Reviewed-by: Barry Song <baohua@kernel.org>
