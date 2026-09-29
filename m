Received: from mta0.migadu.com (out-33.mta0.migadu.com [91.218.175.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119282BE656
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643120; cv=none; b=A40258CbzGWT418VWc/WMME7nueMYx5CxWtvFwwoSho/e7d3bi7tAsHfeeJNHyi8zTzgzow8zN5LDq3YnVErvF1KCtiirG7Z1TvuTR0L7UJLNFo5+SldpEjriLLqyEV5OB0+OzbI/nxXj9V7oEt9BU7yY1aaJ5lpCi3OBDEvlvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643120; c=relaxed/simple;
	bh=dxfGKXsjt22oMjT3e9zqK9vh34ayPH6ktSFXgULNLw4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=iioku5hLTwKhoVks7TIWOVk3XwlmJioIxnUymGSAGHBbvxgy669yQqMjV/EGq44srClwYu0Xy4cEzJmwiUWdYQPO06+W0Zyc8l0pwWayBpiXlTYELaOta1mgQCjkDPKn/c6+PpmQwTdswQYvt6z47vEFV25SCdKG9ihqSC/80HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MTeuINsu; arc=none smtp.client-ip=91.218.175.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MTeuINsu"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dxfGKXsjt22oMjT3e9zqK9vh34ayPH6ktSFXgULNLw4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790643113; v=1; x=1791247913;
 b=MTeuINsuF52A64HtkeS9XsiohdQs8roZkjQliWVTYzVthb9Z5/zgWrW2H02RF2MQiP6CwmDb
 7oGCZtKa9j0Y/8OVOZf/VaUmOqCA1IJ89H2hG4qZrO/hSOjHYIPpxocgcWkGr1jSXfM4G9ivC/9
 3zdEOrDEFUADlB7B/mOKXIBg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id d9a95586af9c48c9;
	Tue, 29 Sep 2026 00:51:53 +0000
X-Mizu-Trace-ID: d9a95586af9c48c9
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v2 0/6] mm: Unify device DAX and HugeTLB vmemmap
 population paths
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <e36e8b24-81fc-45c7-8eb9-8b363e3d89be@kernel.org>
Date: Tue, 29 Sep 2026 08:51:37 +0800
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D999F950-DB51-477A-BECD-B68E8F414F81@linux.dev>
References: <20260924075259.2013039-1-songmuchun@bytedance.com>
 <607759bf-59f2-4ad6-b95b-e780ed2acba3@kernel.org>
 <8385F749-0F72-494E-9CA2-2E433A066712@linux.dev>
 <se2tjmpk.ritesh.list@gmail.com>
 <e36e8b24-81fc-45c7-8eb9-8b363e3d89be@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 29, 2026, at 03:03, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 9/28/26 19:43, Ritesh Harjani (IBM) wrote:
>> Muchun Song <muchun.song@linux.dev> writes:
>>=20
>>>=20
>>> If you're planning to review this series, I'd suggest waiting for my =
rebased
>>> version.
>>>=20
>>=20
>> Hello Muchun,
>>=20
>> Thanks for taking care of powerpc side of the changes. Is it possible =
to
>> share your git/github tree somewhere? Sorry, but it's hard to follow
>> which series is based on which and the overall multi-series is based =
on
>> which upstream tree. If you could share your updated tree somewhere -
>> that would make my life simpler.
>=20
> Yes, that usually helps. And next time better clearly spell out the =
current list
> of series, where they currently are (mm-new, mm-unstable, on list etc) =
and the
> dependencies.
>=20
> I was a bit confused :)

My bad. I will specify the exact branch dependency in a future version.
Thanks for your suggestion.

Muchun,
Thanks.

>=20
> --=20
> Cheers,
>=20
> David


