Received: from mta0.migadu.com (out-216.mta0.migadu.com [91.218.175.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3F247ACD2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856475; cv=none; b=VhNnj2x8HdOEzZhd1DWTDsw5UMqOYj/RaVGnZOdPRsQRcbKiC8ecM0pAj+O9CgNiu8l2jfQqPsUAwtcPKH4BKTksVT34QtGaM0n11BP6ZvKXHVjjvwY2EbEOV7Ug/KDzXui/w9+8/g4DselTti/ywSSCvCZTGWM+w/rlGFNeZ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856475; c=relaxed/simple;
	bh=muqKO/Q4TVxj/cNMo0pajKXnu4hE0n3bdHEU8buxoq8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=o58o4nWtbQDKzG9H8AKfkxqbhqjpTwdMoR9VBqCg/P8J3vIi9cw0uc12CZRChL6muFsv97hVkqmv4qbc3ZJ0686HnyQMa0dyQTbt20YgGDEdOrfvBc156AytY5k1doybzch2SvrQ8zD8FRTmpdOeJTFBX2KpMuSkOJfpKxP0mnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D1jHnePe; arc=none smtp.client-ip=91.218.175.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D1jHnePe"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=muqKO/Q4TVxj/cNMo0pajKXnu4hE0n3bdHEU8buxoq8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788856471; v=1; x=1789461271;
 b=D1jHnePe0V4ciMBZCMxMasOtc4cKvJVt6lourzn0WRXEOIWa13FSmnBG1UlNRwmzzibu46Z3
 URSggi7RkDubbhayrtciCEpXZ7cmUAIiLzU8pnQ3GXviL432XWuOw2oQxP7aRWDC0ajFgZAUHGH
 ck+VEf/78XgN6wjM32+moGvU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id ef271c2c22e4d45d;
	Tue, 08 Sep 2026 08:34:31 +0000
X-Mizu-Trace-ID: ef271c2c22e4d45d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v2 06/11] mm/sparse-vmemmap: switch device DAX to shared
 tail vmemmap pages
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <1fc41803-a0b3-48ca-84a6-caf965fb11f9@linux.dev>
Date: Tue, 8 Sep 2026 16:34:09 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B05E15FC-62A2-4F8D-8624-F3DD16056DF6@linux.dev>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
 <20260908030335.96549-7-songmuchun@bytedance.com>
 <1fc41803-a0b3-48ca-84a6-caf965fb11f9@linux.dev>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 8, 2026, at 15:46, Qi Zheng <qi.zheng@linux.dev> wrote:
>=20
>=20
>=20
> On 9/8/26 11:03 AM, Muchun Song wrote:
>> HugeTLB vmemmap optimization now uses per-zone shared tail vmemmap =
pages.
>> Device DAX has not been switched to that mechanism yet.
>> Switch device DAX to vmemmap_shared_tail_page() as well. This aligns =
DAX
>> with HugeTLB by using the common per-zone shared tail vmemmap page.
>> The optimization is enabled only for DEV-DAX through =
pgmap->vmemmap_shift,
>> which is assigned when a DEV-DAX device is initialized. Unlike =
FS-DAX,
>> DEV-DAX does not modify tail struct pages, so sharing them is safe.
>=20
> Got it =E2=80=94 adding this description makes things significantly =
clearer.

Aha, also makes Sashiko happy. This time, it is no longer confused
with FS-DAX.

>=20
>> Since the shared tail page can now back ZONE_DEVICE vmemmap mappings,
>> initialize its entries with PG_reserved for device zones. Also skip
>> poisoning vmemmap-optimizable sections while their struct pages may =
be
>> shared.
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> v2:
>> - Explain why sharing tail vmemmap pages is safe for DEV-DAX
>>   (suggested by Qi Zheng)
>> ---
>>  include/linux/mmzone.h | 10 +++++++++
>>  mm/memory_hotplug.c    |  5 +++--
>>  mm/sparse-vmemmap.c    | 47 =
++++++++++++++----------------------------
>>  3 files changed, 28 insertions(+), 34 deletions(-)
>=20
> Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks.

>=20
> Thanks,
> Qi


