Received: from mta1.migadu.com (out-129.mta1.migadu.com [95.215.58.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66725B08D
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791628459; cv=none; b=otovpyM+WPcDRX5lBrmmSjyqiHyCgLEVqVyZHeBCz8SkbW+Uuen+f3U8NMGMbjpQkCW3TJMI1kgn+p/aGcF5BYHMrQ1XzldhkZObciKggm34Z87kuuvfHoTwIvV//LkL0NlWFW+VdAPQs+cidvQqAuxIz2r6TQP53bRSIguu+BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791628459; c=relaxed/simple;
	bh=g2VyDxK77mq7FOSsOuc0VjLLB5/X+CTe8SCo2xbPUpo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ggEucVb+CkYZTcAEzO21BS9esNtk2Lb+tadx+ira32haas+MHno4EqadojJi+aAJ3U1nXbsMTg9LL3VDGH233OYNqjvgJR1/vPgIBowhuLGyA+CxnTUxNE58AEmmBnSfhWMFCxcJSjWTgJIseZCED+Kt0unGTD9HfIamvNAKnxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o7v6ZlxE; arc=none smtp.client-ip=95.215.58.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o7v6ZlxE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g2VyDxK77mq7FOSsOuc0VjLLB5/X+CTe8SCo2xbPUpo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791628454; v=1; x=1792233254;
 b=o7v6ZlxEAY/w3T0uAInbokQuLcImEW3tq4ieDxhluOmHWMHdYELr/fwxx8FY6ovKgcaAPvIR
 sgstR7BOlg1LcwRisOLKHZ3kZtaNkiKDvz/NSS6mpN/mOefcvCMaQLWpESuYIHQvXXBpHV2t1qN
 q8IXJ7HYo6HeXnL1zi+H6nSU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 44cd96bd31e91f15;
	Sat, 10 Oct 2026 10:34:14 +0000
X-Mizu-Trace-ID: 44cd96bd31e91f15
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v4 6/6] mm/mm_init: add zone mismatch warning during page
 init
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <asoMN5F-3qvaW5w0@kernel.org>
Date: Sat, 10 Oct 2026 18:33:59 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Ritesh Harjani <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 Lance Yang <lance.yang@linux.dev>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7E20DFEA-72C0-4417-92E3-66A077904AE5@linux.dev>
References: <20261010075755.83339-1-songmuchun@bytedance.com>
 <20261010075755.83339-7-songmuchun@bytedance.com>
 <434B0573-BF18-4413-9BDF-C5873CC13206@linux.dev>
 <asoMN5F-3qvaW5w0@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 10, 2026, at 17:58, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> On Sat, Oct 10, 2026 at 05:32:59PM +0800, Muchun Song wrote:
>>=20
>>=20
>>> On Oct 10, 2026, at 15:57, Muchun Song <songmuchun@bytedance.com> =
wrote:
>>>=20
>>> For vmemmap-optimized sections, tail struct pages may be backed by
>>> shared vmemmap pages. Those shared pages must carry the same page =
zone
>>> ID as the struct pages initialized for the section.
>>>=20
>>> Warn in __init_single_page() if the shared tail page has a different
>>> page_zone_id(), which would indicate inconsistent initialization.
>>=20
>> Please ignore Sashiko's report [1], both are false positive. It =
didn't
>> realize that shared vmemmap pages are initialized early before =
__init_single_page().
>=20
> I didn't realize it too when I read this first :)
>=20
> How about a short comment above vmemmap_optimization_verify_zone()?

Good point. A short comment there would be helpful.

Thanks,
Muchun

>=20
>> [1] =
https://sashiko.dev/#/patchset/20261010075755.83339-1-songmuchun%40bytedan=
ce.com?part=3D6
>>=20
>> Thanks.
>=20
> --=20
> Sincerely yours,
> Mike.


