Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869965;
	b=0moIuCF04wflg+gyEvjnca1wWo0BVj4ctX/ZlHrZnGdDe6Bmsxu1Vtrpkor11BeGUSIj
	 osUw42/43/9z99tEJbLhl9d9MxVUxVbW1ZChFSLeElTDUQ6/PBJdKi24d0S5kDaS9QK2w
	 IrnRTxXu3vtnsrLbXtMw5HkQrG7LVJC3qPYQeVu8IJvc02ARtbMv8pcsL6HsBzkE04uBu
	 4ZJIbFT/5kqZ461oO+8/dPvFtLl9xCLXcrcibAE/IMqeJvhnRUBEjaRnDjAzSUs85PLAb
	 tO+5XhMwSA3tqYmm6hSghQMiv6Zq7jsrrMRRw7CEjMgMF/6Wetj9yzqfupS8TLVQ7uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Z51ssyJ4msyJMPO5cu5It/w/N6kkoJUIReQl84tAXVI=;
	b=Yc5V9HwWD6UUXyaqNjSXpUF5xgFm4WfY6oxhD5/Oo+YpzBIc9p36/WNv07Btp9qntbDB
	 MfxKPwcQPVxvvJBND45EFqvdQiPPAUSfuNQ0hkpL9Hr9t7rC1VOXvf9EXq5FugpNtq+N8
	 QNK8lKV1Z6yOSism+zI2W3Yhcr5aDSJLd6vkHcqwsdx/c84g3hi7/CnezFxj019Tds5LZ
	 Cd4brh4JNPrfpFRV6funli3lLht1kbBGHH3lPqeSflTKlQCt/XYoFFEYoI0A0YNMnA6Qp
	 BiJSEOGD59EdbOEsNruJ8ZdNT421jpruV+uW0Ojbt5+oEx5+IhxtWGEaEFbmS6yWatA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxenQFBZ;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EB9606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52EB9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxenQFBZ
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-490d838b425so2638844fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794869964; x=1795474764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z51ssyJ4msyJMPO5cu5It/w/N6kkoJUIReQl84tAXVI=;
        b=sxenQFBZOuzPBDsMN8tCYK3DYADLtwQLNBop+6CaHJdDnhJ39lJoOqMYW3FAXKJkjg
         S/MBYiO04m40U4/IDyU90/sGJoWA3dZ7EdnZkW25z3Rov894nWLS1eN9hX38Ll9GtQyS
         ctccK4cG4d2kg8UZFPXxXmEb3q0R+9kE1Ru2ScOM9X4CtHMn2Vo5DmbAjItNBZTiOUkQ
         24oVHL0UfrggONa6kgU8eA6Jt4aPcPY8XGvwVgN3rkCHLyCZ7KR08bnuXrx0G17NY8QM
         nxNNPDG8488iEc0wjSotc1FA0gNm8SrHeI5/lnqJK6LsL+/h4d3TsHYN6C0paC7GPpOB
         WUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869964; x=1795474764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z51ssyJ4msyJMPO5cu5It/w/N6kkoJUIReQl84tAXVI=;
        b=iS2LHOe5AOyVUMeJfvMxR5uSxysz4/q2gJD1IC+t+KnmB6GJqVOLc6Ysl8iogKLOP7
         tLRzcVV6eLtLEBtiqUeqVv/Z99Go9Sf/H9tgj04Ga+QPVo0krySZgkzJ615GXVWI0LFQ
         iUyZRbdPHLdPnzZ4eJ9YMesHoCOYZypf/YDezYS6otlayAaE3RhLxI8d3KyK5nfXy4ca
         b7iE/1iONNWhR5qs026dsmwtrEbFR35SlKiMSG1ytYmt5ojQFjTm1bMttqNSJ9idXNWl
         U9NiKDwZxQzj4Pt/A3CFyYRUALgfs0QpqK4bzc9n/g7TK3n5U8wHl50Oe9GWE6fBPuqH
         DaPA==
X-Forwarded-Encrypted: i=1; AL+hErGNP1XCMpG1UfSpKQ8F0H4g+wJgzntWgh75PJzQ9T44ippt0IkVi70zYiB6l2UK23MLRR3JQXtjogi8rUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gr09+FH+ihsf1yXRzLLNKmspDWIBAJNCtIV7jWFBEl0C8txBx
	xZETk9nrQwqm78qtoZwS+BiVEBgTXgE+4eQMVx7VI1mEpvCkSqOqh+ii
X-Gm-Gg: AYBFou3PT8eYFV1KMwUePXrx0rvP1PuJapJJUQShILQUVdykJy3ordmyC/7k3Z7rKrC
	9FVNBV1I8ljNWmyKCoCGDChLRkU66UkXN4/ffcypqhcWaDGXpwRfYKhVMzUGIHIPJ2AT6Xi0+UK
	Jo2D/p9Xc9MRJO0yKh6Sd4+cSqkqxlGUbRXaAD4h5GDC+45VhrjghL7eTdrNaPc4ZJCwur8qsJR
	Z9B3RSKjK1EYWxILuAhc0Fg7atC1WdIC/gUm+4ikpdqs3Aawpj5T+XN3YSIDMJWMJxS0n2O3JuN
	wR8qSbd3pvmNwq/jQm0iMlJn7ye/dAJi9yYVKHK6tH0Wm2CEykLZPwPkqRp1hWYcPUhV0XaISS7
	/GzFCmfRO+4cUU6h781a570M0/xUBFxh7Uy9CXJq7cB56MnlhRzs7XKrYJ8U0NgqEiWIAm/VHOk
	luxAuxc59Qxtbb0yA1luj3YgFde7T1m+ceEXXg58Aa4ReEdtxJV/T3rET4XHdnB47O2IINlI7Wf
	vCwdIQRpcAn/cTQIf4fKV+AB3ibZqPjf7FmuthMiDPHNHuiYdCN/IFRy3vOtcDzuoIJJsd1IjsT
	AwOfqA7r/GkMmMlb8X4IvGd72pHcNjwHDJ/VXwVog7+dxlXsLjSh7aSVp8g=
X-Received: by 2002:a05:6808:10d3:b0:573:d802:faf with SMTP id 5614622812f47-573d8021bb9mr5778528b6e.16.1794869964287;
        Mon, 16 Nov 2026 14:59:24 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:d::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70243e1bsm11192657b6e.7.2026.11.16.14.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:59:23 -0800 (PST)
Date: Mon, 16 Nov 2026 14:59:22 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH 2/3] mm/page_alloc: move the kswapd node skip check into
 a helper
Message-ID: <avuKTaBpfAmiR7Mu@devbig011.atn3.facebook.com>
Mail-Followup-To: Chris Down <chris@chrisdown.name>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
 <20261113235238.3595412-3-joshua.hahnjy@gmail.com>
 <avt2RrtFc-G04JiJ@chrisdown.name>
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
In-Reply-To: <avt2RrtFc-G04JiJ@chrisdown.name>

On Mon, Nov 16, 2026 at 01:31:50PM -0800, Chris Down wrote:
> Hi Joshua,
> 
> Joshua Hahn writes:
> >+	/* Lockless check, a stale result only affects zone selection */
> >+	if (waitqueue_active(&zone->zone_pgdat->kswapd_wait))
> >+		return false;
> 
> Not a big deal, but now that the test is the other way round, this reads
> backwards against "If kswapd is already active on a node" in the comment
> above the function, because waitqueue_active() being true here means
> kswapd is asleep on kswapd_wait. Maybe say something like that
> kswapd is asleep, so nothing is reclaiming this? It needn't hold the patch
> up though.

Hi Chris,

Yeah, I agree that it's pretty confusing. I need to correct a typo in
3/3 anyways, and I think it would be best to spin up a new version in
this branch management transition time (instead of asking for a fixlet),
so I'll go ahead and spin up a v3 that addresses this.

> I've tested that this works well, so either way please feel free to add:
> 
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Tested-by: Chris Down <chris@chrisdown.name>

Thanks a lot for yor time in reviewing and testing this series. It means
a lot to me! Have a great day Chris,
Joshua

> Thanks!
> 
> Chris
