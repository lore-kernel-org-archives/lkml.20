Received: from mta0.migadu.com (out-104.mta0.migadu.com [91.218.175.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA182F7EE4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643460; cv=none; b=YHYOiTFe6+xOEfqDHHgcbR55jqNoQObYvo1d95G4eTEL8OAIrFA5TtPxkkdYOel2BxKCgBpd2cRcb6uRPNzgFwj/vcPnsB1lGM5O87b0QWtyje5HyhUKHfvDw9b5/jvT1FRWyY31Jp3FOe3OUFgfNMkAKjkReBz2HwhVTUApXfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643460; c=relaxed/simple;
	bh=5hh3I/m4orWpsUVsDP4+Yh/0I6vIU4pHHsleLblqGjQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dEPPntEGzruuJaMkT62Kw7hMqXvPqLB2qmPuxHhZSuKmiuBD5RqmgHEtR9QUgZaRTzR1Z7mOPtk7ZO9LUw1dYDpZYoobLEj2CqLzXSreG2UXV4mYE0XW9SOgJyfoBP56eN1uXI2Dy3Q81idkztg0o5DPBU7IVqjZ/SQ9YJp5dVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N28GiIEP; arc=none smtp.client-ip=91.218.175.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N28GiIEP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5hh3I/m4orWpsUVsDP4+Yh/0I6vIU4pHHsleLblqGjQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790643457; v=1; x=1791248257;
 b=N28GiIEPRF1vGiZ81ffZ9p1faHc1blJESjVHFUFEplNPEdUvXGvJ2X1suy0kKb3vmRHNpNZC
 K6YeiNhB9bGJ9huwLcqk7WRi58rszp/MN9kwOkH5AxT5WWdFwJH5wwV0zLdAqS2E323fzkRnJ+y
 /0TEVKGLSq2QBaUCAx5teD2E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 318fa190a6eb30d5;
	Tue, 29 Sep 2026 00:57:36 +0000
X-Mizu-Trace-ID: 318fa190a6eb30d5
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
In-Reply-To: <se2tjmpk.ritesh.list@gmail.com>
Date: Tue, 29 Sep 2026 08:57:16 +0800
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
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
Message-Id: <655A7615-5885-4733-9E4E-3BDA1FE39362@linux.dev>
References: <20260924075259.2013039-1-songmuchun@bytedance.com>
 <607759bf-59f2-4ad6-b95b-e780ed2acba3@kernel.org>
 <8385F749-0F72-494E-9CA2-2E433A066712@linux.dev>
 <se2tjmpk.ritesh.list@gmail.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 29, 2026, at 01:43, Ritesh Harjani (IBM) =
<ritesh.list@gmail.com> wrote:
>=20
> Muchun Song <muchun.song@linux.dev> writes:
>=20
>>=20
>> If you're planning to review this series, I'd suggest waiting for my =
rebased
>> version.
>>=20
>=20
> Hello Muchun,

Hi,

>=20
> Thanks for taking care of powerpc side of the changes. Is it possible =
to
> share your git/github tree somewhere? Sorry, but it's hard to follow
> which series is based on which and the overall multi-series is based =
on
> which upstream tree. If you could share your updated tree somewhere -
> that would make my life simpler.

Thanks. For now I'll follow David's suggestion and explicitly note which
MM branch each series is based on. That should make things clearer early =
on.

I'll also try to set up a tree later and share it once it's ready. Until
then, let me know if a written summary of the branch/dependency order =
would
help.

Thanks for bearing with me while I get that sorted out.

Thanks,
Muchun

>=20
> Thanks!
> -ritesh

