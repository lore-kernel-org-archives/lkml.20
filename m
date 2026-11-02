Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649263;
	b=JdzmjwnpLj94tgO3lcCG872+C//5AKfa4nutqc5LDtkVEYQhTymbFKfuF5UrF8yvFznF
	 1lITu0bGN2e6YlHlo1Qfn1RVk70kCmbRCAnzJgXbACwbJ/CShc/GKDGwfBrEtNyhs1S8F
	 oiDxRUNMHw8lg/cVu0MBizYwXMWvhWPRJRC+xoXCd1I890bWqiRXKhTVBmc9mohPyJVgU
	 aC/hK+LQStb78tk+j9Z5Xkh3YjXVgjkvNBcEMLLPmMH4Y1bWo+xBixzpIi0ZToSJ4D54V
	 K4Gf1O8jN8UCEwPcgEXWEOT71X2j8xJPc0a09RbefrpHEZ/UrZpgzNa7Elm1k2FdYEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PXm/uwD24jlxN0Wbjq3NylUh7A4E/RjzDePOTrROpJo=;
	b=rlCQdllxiIZIzBGpxG4YaSQ96o81o25SsDJPO6U/9YZNXqE0bLwIekqUzFxa+I6jtU1c
	 gJpvPlFhhmPIlfdx4FzsN/RbDv40jo87l24kTlTjn9vh72Sztrhj7GDY8pYrihrYSrmkp
	 1C7RbPi4HmJFYH/JeT0pdvR5P99GnguaZCCYEyyGHyyJMD18CFP0fuRzH+Rs0X6YBfwpM
	 vjQhIbcu6Sk6QOCUwpIGmx3ebA2VA6EENJVI+hBmIlmYonNLQKwyR31N5TbBJOuVW8PMU
	 JHvBuOS0oB9SmDTBZ37U642UvR2UA/CTNG1mPe1hY4K1b9U8TyHsbMS8ZsTmTTODLCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=HxMoerxs;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD34606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DD34606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=HxMoerxs
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0f59a5fdeso28036427b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793649261; x=1794254061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PXm/uwD24jlxN0Wbjq3NylUh7A4E/RjzDePOTrROpJo=;
        b=HxMoerxs9ftVA4frKuy98OSQ1rbANNYtqCuy6NAd6YMcBMI+HRmaU9GrksVobzn5MC
         IuphsQQC89Rk96z0yUPY+xpQ6lsFl3iTsK3QgesKAw1/72nH9hOJaBhzE0JyD8IKXUj/
         fEVAHsGI/Lxp3SjMbftTpWbsErjcQz2RWWWhfw6ejtzTJClr7FINCpLvPLNOf/L7unr3
         mdj26xq5UHsX2N+v3KJtmnxuRX9g9Pjdle/r2/NEVttUYNDLj2vbm+VLczltKwwGckBD
         a85EXBSTiIz2jyf1hHJY74c9NV0+z1DVCzcJWBZG2FtloTfNAN8Wos34izd5FHE8mriT
         oYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649261; x=1794254061;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXm/uwD24jlxN0Wbjq3NylUh7A4E/RjzDePOTrROpJo=;
        b=JRkGMpJd7xXmC/S3LKxyUD3FqYAsKcULOcG4kQNMx/zaOFxHCIzfZMaO2BTeRZhy/j
         fUGxuFyPv/rQ5TUBSl7tZV4UrkefaShqfkwFm2u03Qa9WgA9enBmKqwkkIXC6ng3kz1M
         1y9yhdDVJyqDfPCQhzq8agmriSr7pRaTXSOR0O2MkHSluLBEYyoNTEt8hHwMImMgaxsl
         v96d6u6KTDd876g5+Erl9fRwQ0yU8NEefWN0FHMpESgQFU/IdbQeiTDfgCDLMglu4uA9
         kFLDbXEBCKDHqSzpcd7FSTAqk26phKh6L3KE4mohXOPCEoDJ/dmxWKxG/OeH0hm9XUot
         oazA==
X-Forwarded-Encrypted: i=1; AKwUvBznUH68owX8lphRsFzWsXYNIXeklmUbWf+qZ5FMbXL7DbSi+7dEVBysN/BquCAuAy3WuscyWA5fQ/R/9dg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eztvcQ8Th4WRcZJSm/Mnjhpkd9cn7bsnBIesmnpOoontVvXRm
	lHvJjFHL5zT756pj9mTDxGtzPHOBZQbGKw8ytt2yIgE4o4WipgA0D9Xd1OTwrnXNcLI=
X-Gm-Gg: AYBFou0MgecWwin51zI15+QVzcw65uLJa61ikgJLVM6rxhTzmtq6dfb6P68NqwELn6X
	oBy+uDv3x0qXqRTIJkkewvZZ96zkKQ2XPayn42K3m4rur7In34MmsXQqqNGirt+5Ldd+EQhudPb
	04SGhaZQyRqPv0eXvs2qCqvDDogJFL2f0sOpkPa2yaba+ftUuNuc4XYIoNp348Xdz1HUhyFSOCR
	cjO9v/+IszUW+BKifuemQ7vJa0HtQGbMv/vQzUdRNqQfZ9lUrwxH91Bb32mX8q9c7OSITtF3o8G
	OMCwBXuJSelVHrSmAC8sU+H3vE7Lmj7Y+VWWFEkIYwNYKbzoTPvVhkdJOtNcyYwiM/B8NVoUmK0
	cILVgjHmnCekC3bPli37pg8poVmqVSRpjZJgIS27bIpEHT/jzCQ2ge4s2DlTMlK2yVxnzR1wAHe
	WZEEZfnrr8xf3G87VMQPQBUuHcWHdBCoD0uZ+MQa0q9PbsYvaA01JCMe+yDTQSeI258+cfyCW+r
	5p4xZ2M4fr+0QYx0LmIvTPvAEiu5SaSHB5M+BpS4nh4aBfZ09+l0nzMPoWbINlFNo1bSCPV5uUu
	BaKwHirRcD6cBDzhjT2DbuBZPtY=
X-Received: by 2002:a05:690c:348a:b0:88f:df4:1c8e with SMTP id 00721157ae682-8b2b66c5d61mr71635247b3.22.1793649260825;
        Mon, 02 Nov 2026 11:54:20 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7125371sm58207037b3.11.2026.11.02.11.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:54:20 -0800 (PST)
Date: Mon, 2 Nov 2026 14:54:19 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Harry Yoo <harry@kernel.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Gregory Price <gourry@gourry.net>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: add Johannes as the page allocator
 co-maintainer
Message-ID: <aujqa-dA7Xa5SsIa@cmpxchg.org>
References: <20261101-maint-page_alloc-update-v1-0-27e8c246b13d@kernel.org>
 <20261101-maint-page_alloc-update-v1-1-27e8c246b13d@kernel.org>
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
In-Reply-To: <20261101-maint-page_alloc-update-v1-1-27e8c246b13d@kernel.org>

On Sun, Nov 01, 2026 at 05:34:48PM +0100, Vlastimil Babka (SUSE) wrote:
> Johannes is a long-time expert and reviewer for the page allocator and
> has agreed to step up to a co-maintainer role, so do that. Thanks!
> 
> Additionally, page allocator is joining the MM transition, following the
> MM core updates from David [1].
> 
> Patches will be collected in the mm/page_alloc git tree and integrated
> via the mm/linux integration tree. To signify the change from Andrew's
> mm tree, remove Andrew as M: - get_maintainers will continue CCing him
> on most patches via the catch-all MM entry. David prefers not being
> added for mail volume reasons.
> 
> [1] https://lore.kernel.org/all/20261030-maintainers-v1-7-97278f8a5f54@kernel.org/
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Thanks for your trust :)

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
