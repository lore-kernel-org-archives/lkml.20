Received: from mta1.migadu.com (out-34.mta1.migadu.com [95.215.58.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF23559CB5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958713; cv=none; b=S7H2/0a4kwIY/7k3tVCNfPIKmhHq8se1lL7lRHrQl0tHfTTSqgHA7sN8obiCiW8MphOm0zbD5QW8aNfURMy9QaUBXt2nV50Fgm/qsUJilCjaCeOdmVepGdGgO36IwNrq30NjXWylUUewFPjlMCs5UpjEXzE20DTErR9Iifo5vds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958713; c=relaxed/simple;
	bh=+53+2vjJaQFoCiKj+C56qien0jFLMDUHHh3iJ/cgrBw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QKxyTbOhprjTttzViVBFUUMT+L4hNuXZY8Hs3AMVM6W9JIK9xwt/naZ3rwODW1J1YnX/zzhazgDabNZiMzfyH47zlqYK2VtJcPKN1Za9qH3tQnQ+g0iOi9psoDxdtHKtZdRoWRHnJbmsGOTyO+Rp+bSZp4N8vC04f2rxaKMYes0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kpiWHW+P; arc=none smtp.client-ip=95.215.58.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kpiWHW+P"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+53+2vjJaQFoCiKj+C56qien0jFLMDUHHh3iJ/cgrBw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788958704; v=1; x=1789563504;
 b=kpiWHW+PKUzOQnFxZqUeS2tTgUacZxuC1o/xnmCU2+iPhwEmnX52wK3+exNOJTiawZt/TYuw
 yAFtm9meUKfqcUSKDdZnCjPlq9zcCpWBzAVj/UKEAPV6htl/8ZZl7DAkaaKSuCaaYU6eMbBX01V
 oVhfdrOc+jOwrxRGNZPvmnao=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 256877c780270637;
	Wed, 09 Sep 2026 12:58:24 +0000
X-Mizu-Trace-ID: 256877c780270637
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v5 09/17] mm/sparse: initialize memory sections earlier
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <e6335c78-a20a-4024-8980-097a922eb257@kernel.org>
Date: Wed, 9 Sep 2026 20:58:08 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>,
 David Laight <david.laight.linux@gmail.com>,
 "Liam R . Howlett" <liam@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7A0F5F1F-F724-478A-A34A-E9F9771E2EB7@linux.dev>
References: <20260825084608.47437-1-songmuchun@bytedance.com>
 <20260825084608.47437-10-songmuchun@bytedance.com>
 <a2016390-28ce-4199-a063-d2e9101dacab@kernel.org>
 <E54037CE-6CE6-41AB-A525-8BDCE55996AC@linux.dev>
 <e6335c78-a20a-4024-8980-097a922eb257@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 9, 2026, at 20:48, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
>=20
>>=20
>>>=20
>>> I have patches to get rid of __section_mark_present() and just set =
them all to
>>> SECTION_IS_EARLY|SECTION_IS_ONLINE such that we can just iterate =
early sections
>>> and get rid of that PRESENT monstrosity.
>>>=20
>>> Apart from that LGTM, even though I don't particularly enjoy =
splitting us now
>>> having two init entry points
>>>=20
>>> sparse_init
>>=20
>> Maybe this one should be sparse_memmap_init? If yes, it could be =
another separate
>> cleanup patch.
>=20
> It does way more than that. In my patches I factor some of sparse_init =
out and
> call it sparse_metadata_init() -- memmap and usemap.

OK, I'll leave this part untouched since you've already done the perfect
renaming.

Thanks.

>=20
> --=20
> Cheers,
>=20
> David

