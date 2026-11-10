Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304461;
	b=CkkiMPkrF6PRhGKAzfQNHdQcANy2n+u7FYHSj5348ruwfojzwacBsntO8d+Hrt2G/vc/
	 0WWs3pjlXz82hz4CjvEpDOFoasHjNTX7nD2H0c8A8C1WeQGHSOANQQAztPaZVqD30dPwV
	 BBiGbFLMxgsmhdGDae3lssAxXf6IHlBwZwl/NJBjs6mDzpjZ4DccPv1jdwB8dyQOii4oe
	 h5wJo1bYtdB8apO+qGOmkoXCy33+h3uapjW5kbVTiReiq6jPnnqRtLMi9fZZxM8jvdFhU
	 W9tOnfHGvjX0KvB8HKOHD/xiXvuAIl414rKPl09wSbu51/32usEi6dqkRgTL0cAABUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304461;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dv+juQSa5jdjyDwYyEB7CxuxwRRYVallMJB1NLgyTUA=;
	b=1WtI/K247TTtdVqTfUYi508jpifskov8F9F+XHz4+rOz8ZyvA/oYE7e4AAaaqwUUkGT8
	 NoXk3X6x51CsPK2sSr2BgPPhBi3mwgHVv/5PS4wgrlE8wFbrPDEY1mssbiEdTimptILyV
	 n+SiqHyu02NWDDQ90ruJJ6LIuLIIRC3Jgx8eTleCHNhs1SrT3+O+kKj9K7HAe4qvx9b0k
	 ZuPQTfMaWIXnGOy2kUiDEQIw/QFIUuLj3DhyhmY8etq1mWdljhsiNuav7Y23Qsba+c7Rd
	 MA4obd8qodNd4KqN9uGDlSaoebi/s13m6OU1MwQo7S7BTCtOay84BbG4VA+b8yknAHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KND9vpqb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8152606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KND9vpqb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEB61F008A6;
	Tue, 10 Nov 2026 09:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794304460;
	bh=dv+juQSa5jdjyDwYyEB7CxuxwRRYVallMJB1NLgyTUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KND9vpqbeujQxLQxxuvvJ3vk2yhiAk+oF4tUnVR8O719EClhHZ6/0kORrruacKOJD
	 XybHdysDYPpiThqt8b6zTNhKYYxU0tRWlYEz6OCVH6pzQERdNH3jvWwgwfHJhXzul7
	 8B5PK5gQ94MI43Jq02DKuQ8G1nMWlIA3S/uKLUxFiJY9KNHktT7AMD9NxNidtRzP9n
	 3kZyhWE1kv1tluEljw6Z9egYEiEUdD8xbc3pnQrJlE0rquDv9Y8YrjFu3e13m4TA/I
	 vi7z0IIrNbsHizoeoHqAX619sFiX7UlaCAIb/bz9D36dU9l7aotOp8GePcv0Ax0CpR
	 ThQ3UOdJ1/WUw==
Date: Tue, 10 Nov 2026 09:54:12 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Lance Yang <lance.yang@linux.dev>, Ridong Chen <ridong.chen@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MAINTAINERS: remove myself from MEMORY MANAGEMENT -
 RECLAIM
Message-ID: <avLppG5vGNIOo6zQ@gremlin>
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
 <20261109-maintainers_mglru-v1-2-c25e6de60bcc@kernel.org>
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
In-Reply-To: <20261109-maintainers_mglru-v1-2-c25e6de60bcc@kernel.org>

On Mon, Nov 09, 2026 at 07:31:54PM +0100, David Hildenbrand (Arm) wrote:
> I don't really get to look at most reclaim related stuff. For things
> that are actually relevant for me, I'm sure people will CC me.
>
> So remove myself from the MEMORY MANAGEMENT - RECLAIM section for now
> to have a bit less noise in my inbox.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Understandable! The ML is crazy of late.

And... Hmm... maybe time for me to pare down some of my R:'s too :)

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e7ac319a570c..7dc8548236b9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17808,7 +17808,6 @@ F:	tools/mm/page_owner_sort.c
>  MEMORY MANAGEMENT - RECLAIM
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Johannes Weiner <hannes@cmpxchg.org>
> -R:	David Hildenbrand <david@kernel.org>
>  R:	Michal Hocko <mhocko@kernel.org>
>  R:	Qi Zheng <qi.zheng@linux.dev>
>  R:	Shakeel Butt <shakeel.butt@linux.dev>
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
