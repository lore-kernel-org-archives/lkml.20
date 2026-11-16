Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826388;
	b=SWBjWWVoroIhBuSdDmUN5bpNQTkfmfOXNyN9hWOYOXnVESKM0nRQ+Bdbuf/CoCq4XXQi
	 tI0+y06viAIK7hzdolb7GLlcDd/gtoVnshqKX0QQRitnmEl4nlW6kAHr0IlRgtFitVs+O
	 XRBUgODAFTOPHQfN0rYLCHATuPawf2LFUxYPQr0vbO75ejaQ6UJ6sjV8xhKz5U1TRoxZ3
	 hg7oKDuMFYojvfE/6U+HpC0VNt38DQZ/nhbc6uOJMqcxmMVoP8dkRVnKDOI/gRSaZKRrk
	 6PH1pXVT4nrpzPjdm+RlBhGa6iaxPAap4fNBuhNWdfYL7ZyWyVzAtEs4Y1KMaN9oRxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826388;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=NsVyf/Eh739256Lt8KexYgfuWst8mEdj0Tcojks+JIY=;
	b=5a4jrNd1/6UBW3Av8PdgiGdL4yuRsfFdmOz4ZdM1rPVCZwE1pKwZGfF5iHZ44bJYTiuX
	 pLPU3h1yEepCXGIYe1uBK5TCbZA58JYXokwZNRqv9iDLKwLW/3DXIa6e66pWMUlGWG9p+
	 u4heCz8nT4Vg2XuCepNwyltC6aZ/BFmOPPJVqAYwebwgKFJNXyaJaIND0eonKqYyuKSxF
	 BRHU3LFYpwgxk0j0nSGjIoa59d+5CXv0+XgDRWosGEl4cOk0US8B9n5Lx9fmo+q2N6O+A
	 3XLzKVNyylnPGKTXBZDOiy2v4hB6bK7gOngq9SmZJsNpuwy8HigJRNN9QG+eW0hw6wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bI8+6lYl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB52E606A89E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bI8+6lYl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72CE1F000CF;
	Mon, 16 Nov 2026 10:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826388;
	bh=NsVyf/Eh739256Lt8KexYgfuWst8mEdj0Tcojks+JIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bI8+6lYlyuFNEvgexVeFAv1KnceC/KqVyWEJc6Fg6ZQ69oVcXbyKBkrbWP7LBTdUQ
	 UZ3D1NJv1uVPo88zLRT9VaY5QgamkNcUOjwi17R3BOYH9eit4krVc1R3+1TAGYuAK4
	 E3J9UnK3xE9d3F45zZTYJioaSR348U620yQxrdLu+MW80+HUd+hYjLe8wM4VD2/b/1
	 XkSBs5qFaeHm6oQAdPzcMvzf6baKwkCgNgi3NgnTLweEW52b+TZP+gUN6ORubajShc
	 FO9C8LsrjC4M3/UnYL4bSSRA0DTCbIeXFcRJhCCfS0pzz6UkXZREnQkpMlpcvZVRbA
	 RhJAqJvSx95cg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id A290D198003A;
	Mon, 16 Nov 2026 05:53:00 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 16 Nov 2026 05:53:05 -0500
X-ME-Sender: <xms:jOD6arHbBDpbSjMbSvRFccO32RM4SCBWpqPS2PjvHSb1SWgXuJY9vQ>
    <xme:jOD6amyhD2lOcKuuXXKDbwkxoy4aKDpfUyIJW9FyO1EfjXc2R0zcL2XEacDOXyPHG
    q5oXon1J5EN9xOsq_2h6yU68xtX1Qym7FfemeFk4nwPoDPSRqQK1GYq>
X-ME-Received: <xmr:jOD6akRKqz0MPdSD8kNUrft2CaAAFy-qRx7xYTUQAGHBkyB_GrAdbWNmj7g>
X-ME-Proxy-Cause: dmFkZTFG5jkGbtKQz+KGXv6DVcdUEvWZSsyE9ahIjR2txn73RzTRa9O7nCYJLLKho03THN
    kIcI6bk1JWvKgrACd3MeIyH/ItCs5ocrfrQlgBBAtTK+8cUnU9dva1V94OFKzYh9Q45wLh
    wgYa8t8gWpHZTq+fMVNAzFXuPM2oWMKFirGFrX1d4bjjdlBDjZWOLHk6xQ1UOgE19k76dg
    KMwcoWXsLpaqsh1YNLfxGlzUI5Lf1YABKNxKfHVQfhJ3fBiwYOpRnzTIaC1lFykVWNp/lc
    eG8T/kEyhaU+f0dGoSCn7SwrEFm4dlwZZDTny1YZKQVkn+D5ZxNC7jiBTui0awWbf3GiDJ
    66dhhCq+9NInds/qJRYRfX0u6DmEQR3Eke068vTtjJDhfc6x6h7q6Zfic1h1KhN9c/o4s9
    fXGNBVCthuOuFLhGB0mCC1lVdj9F+EzthsJCWrSnqM8m9WGSR+RTutZrnwPJit1tTtEi2j
    mDwaR5MGvGHykZckIYpdhXxPg15jad9RPHS+ek702xHyrPI25/zMwezMComYrYLqFm1+0A
    eMtn0gk1Af+8uwiHHandzEFqWxl2B9BA7i2mO0wJavaKFX1exmZRSZi+jobOLhBULyakYw
    OI+SIuCRTa5nyvu2zNx22SirO/dSsJNQjZfOzwa3z46IiWQwGOAbP9d9923Q
X-ME-Proxy: <xmx:jOD6asprkkehzNqaCaLAhLutc9UtnTp6gqRXSfdzVE3ZijSoaqfVEw>
    <xmx:jOD6akt9S7LsRgqeoXBV4hY_bC0DBxO4YIMur2oktxnkch36whwsNw>
    <xmx:jOD6ahtwexIrbav5m1a-df-luGcRQcIi05tkp9yTRIj9-WvMl0IxiA>
    <xmx:jOD6aoqwWQI7tNz83LxXoJ-JHIaKPZCUJgO7uO9De14R0KJsuTUN8A>
    <xmx:jOD6arELcjIfTmIVVKVcB6A3NHHtsFPzlD8Yz9LCB2vMv6C12kQRAsj_>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 05:52:59 -0500 (EST)
Date: Mon, 16 Nov 2026 10:52:58 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Dev Jain <dev.jain@arm.com>, Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 1/3] mm: page_alloc: add a watermark check that knows
 the migratetype
Message-ID: <avrgcyxYFBd_JHrF@shutemov.name>
References: <20261102093939.3340540-1-kas@kernel.org>
 <20261102093939.3340540-2-kas@kernel.org>
 <auynaZkzdzL6Aeyo@thinkstation>
 <avTEezDIsJBhsPmi@thinkstation>
 <13c40a66-4ce9-4d9a-801b-a3debfecee22@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13c40a66-4ce9-4d9a-801b-a3debfecee22@kernel.org>

On Fri, Nov 13, 2026 at 06:03:00PM +0100, Vlastimil Babka (SUSE) wrote:
> > Looks good?
> 
> Not really :(

My bad. Will do better.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
