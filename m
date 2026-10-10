Received: from mta1.migadu.com (out-97.mta1.migadu.com [95.215.58.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7693343A7FD
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624803; cv=none; b=PaR+cMZvUaGpY5T9IkCSIUI0szWT4X23ZC/ce/qYIU3uD2GHNVpTTNOzDEP7+c7GJlIPHdfj5dnq9cAfutW6+PhBqKn8mHDEnHv1YyrT+r7FsgQOpQAp3HsMoeCdNwVGaNUmiN54rPeZJN0Fod01FuimzR15f0yVYFQfp+Fjcg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624803; c=relaxed/simple;
	bh=PJo4tkODSAwLEOEkEK57eCbPFUflApjAg2dMJ+9QYw8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UrvnNV+2J1XsSHIYzRX7cRD+Aa13vMdFA1cmSv/1/l9RnkDwwrTOQM5hSerW4SsDwYOUGeiAnxzBGh8YBa60DHOjCY1XPGl3CyGeui7da7ySFK7kZ1sFsy8v/B8QAP5U8DCuBrZUZGSUXskUW6SwcCLA4YGYGxTy9vq5JZAkuwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OyPnlKQX; arc=none smtp.client-ip=95.215.58.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OyPnlKQX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PJo4tkODSAwLEOEkEK57eCbPFUflApjAg2dMJ+9QYw8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791624797; v=1; x=1792229597;
 b=OyPnlKQXDU0GjsJLx16l/N7aNyV8TV32uB9UZukrSCGkeF5RGj1NCuGGupG39RNppVPtQ5oN
 koTlLvsrJdtPj2rdeTmh+Tkf1ycbtOZ/cj0LLQ3sQemFmRfdKOU0jgiJ613ClP4P1Y1fShzIAWH
 IWs1Ig2eykQZ8GcgtKNfDXvc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ae1b224da00926d1;
	Sat, 10 Oct 2026 09:33:16 +0000
X-Mizu-Trace-ID: ae1b224da00926d1
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
In-Reply-To: <20261010075755.83339-7-songmuchun@bytedance.com>
Date: Sat, 10 Oct 2026 17:32:59 +0800
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>,
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
Message-Id: <434B0573-BF18-4413-9BDF-C5873CC13206@linux.dev>
References: <20261010075755.83339-1-songmuchun@bytedance.com>
 <20261010075755.83339-7-songmuchun@bytedance.com>
To: Muchun Song <songmuchun@bytedance.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 10, 2026, at 15:57, Muchun Song <songmuchun@bytedance.com> =
wrote:
>=20
> For vmemmap-optimized sections, tail struct pages may be backed by
> shared vmemmap pages. Those shared pages must carry the same page zone
> ID as the struct pages initialized for the section.
>=20
> Warn in __init_single_page() if the shared tail page has a different
> page_zone_id(), which would indicate inconsistent initialization.

Please ignore Sashiko's report [1], both are false positive. It didn't
realize that shared vmemmap pages are initialized early before =
__init_single_page().

[1] =
https://sashiko.dev/#/patchset/20261010075755.83339-1-songmuchun%40bytedan=
ce.com?part=3D6

Thanks.=
