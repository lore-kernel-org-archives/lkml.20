Received: from mta1.migadu.com (out-224.mta1.migadu.com [95.215.58.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C3349CF50
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671485; cv=none; b=Yng6TIbzaVMJRf02MHSqQ5eiXnz2ou0m/V/TEXNDxTKcz2oryUTVN+Mqv+7iqXgU20hJhjBlD9WXfAtFCRzC9kO36x5uHGCxTU7nvqFWRXWfLa59ehKYBkRgbF1+py40K/yqm8Pz67a8GLwTtXZkdGs9+RmAu+2sx1wFDnUIJtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671485; c=relaxed/simple;
	bh=AIq4JLQVY9rAZekwghkIHYtXVxO8+vtHFHY+tB0MmZo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=nOgR3akEfpzx5Gjf4aTSODgx8LYWxW+8kK0W54ELJE0QsfynLDesJmG3gMgJliIhqaw2U2zBdX4e3R56Fbfk+x6gNjAYuaGFtDiQc8gezecylYri6Zd2UFRTURRseXWTIudpPfSOKIay3zL4CkE5s7p7sID9vrMSzUDOUzArsg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jpnb5YLZ; arc=none smtp.client-ip=95.215.58.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jpnb5YLZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AIq4JLQVY9rAZekwghkIHYtXVxO8+vtHFHY+tB0MmZo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790671472; v=1; x=1791276272;
 b=jpnb5YLZUTaeVIpKJR7hFlBx38u0kCwIUa2zf+tJ1Dvz8tJ3xRjgQtT15IsL+rjui3tHu51F
 6HqOzO7QTzwJ5Xty+ayz6HuwtrV3GJoyWBUDto5YU4aEXMoZ+lw2rvPPsljKPpEYvvFUNXz2ASX
 OGunm0fuQci6D5dMs7tTsy8k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 199085bad9bec430;
	Tue, 29 Sep 2026 08:44:32 +0000
X-Mizu-Trace-ID: 199085bad9bec430
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v5 08/12] mm/sparse-vmemmap: move vmemmap optimization
 helpers to a public header
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <a31cc06a-c22f-41c2-851e-4827869e9df1@kernel.org>
Date: Tue, 29 Sep 2026 16:44:12 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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
 Qi Zheng <qi.zheng@linux.dev>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lance Yang <lance.yang@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0481F7BE-F912-4E83-80F1-6E7990B447C1@linux.dev>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
 <20260927025441.741633-9-songmuchun@bytedance.com>
 <a31cc06a-c22f-41c2-851e-4827869e9df1@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 29, 2026, at 15:39, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 9/27/26 04:54, Muchun Song wrote:
>> The vmemmap optimization helpers currently live in mm/sparse.h,
>> which is an internal MM header. That works for MM code, but
>> prevents powerpc from using the same interfaces without including a
>> private header.
>>=20
>> Move the declarations and inline helpers to vmemmap-optimization.h.
>> This is a preparatory change for powerpc, which has its own vmemmap
>> optimization implementation and needs to use the common vmemmap
>> optimization interfaces from architecture code.
>=20
> Which raises the question why powerpc was special and will remain =
special. Wha's
> the big problem here that powerpc must do special things?

Good question. I also don't think PowerPC needs special handling,
but when HVO logic was introduced for PowerPC, it handled HVO on
its own. =46rom my preliminary analysis, the reason it didn't reuse
the generic logic initially may be related to the fact that
PowerPC's section size is 16M. With a 64k base page, a single page
can cover the vmemmap range of multiple sections, and the current
generic logic doesn't cover this case.

However, completely removing PowerPC's special handling is already
in my follow-up plan. We need to wait for the current series to enter
the mainline, and then we can proceed gradually.

>=20
> Change itself looks good.
>=20
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks for your review.

Muchun,
Thanks

>=20
> --=20
> Cheers,
>=20
> David

