Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1140D3749FE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139846; cv=none; b=FvOpim8qqpJXvnkFisLj3K7VS8BmIBfR1NGUrSuo1U4+K0GUBntbE7gEN7i2xLxce5XaoEKlxYhyxSxQ6Y/ssQh9+PonkpeQJEINAQGUiQ2COGOvTYSGc4+Va5gQTjDzfQWnaRDM6RRPHFzBowL2483rsX5HIEy0E2IgJySgpuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139846; c=relaxed/simple;
	bh=2JzqsoiLxocAa5D2L3SPzdIZsS+OW1mUD+PJx4LQgiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wh3wL783fMX9aVxLx1fJe3IFnHkMx13ZzZvgoJvmsUCO5vthmFmW0wy/uqpYIokEN4BAr7jW0l0xWsoGonbGOOshOmK2WEaaNWlrpqaKeQPNcUE6pCQujPLFNYsVxUotGmRewj3+Ayj1LK9G6NAu3pF1xGkaTFjy0AmN+iiOpdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I6RtdCym; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I6RtdCym"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so1714764a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789139843; x=1789744643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2JzqsoiLxocAa5D2L3SPzdIZsS+OW1mUD+PJx4LQgiw=;
        b=I6RtdCymQit8YVXUfVke0ZwgoF+2b4Tc/vK0eZ2VUZDUJChIYtI6CnGF4+IqV5FMy3
         LOyeMJAaPO2kxMgLgb1ATDws207sX2VFKoAFTuMzLtypckeKCdP8poCGi+BBj04Lfq+D
         kG9uHWBdcrp47SkdypV1RxuPCBKHyoJhlalbk3yJG1h39CeiZQW7rqBlpHHhXbIcxNDJ
         1CDfNWCv8YLccrEGqj9XLOO7+0cvtgfU4Jl2JwaD/kkPq/DrsUYm+ycsaBjzpikCU2xH
         OaOTgz7S78hceZxdyxmBLUuED4unG6DduCxil069rY9oJ3424QX13qkDmAkBTb1egp9j
         UO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139843; x=1789744643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2JzqsoiLxocAa5D2L3SPzdIZsS+OW1mUD+PJx4LQgiw=;
        b=J+8hJov/8nViIs/hmsmLPWEMHCsTus5lqEbGa1ZT8qgXmL6pk81Dei+s3Ae52uEUWj
         0WoKsAFTfOMcOHCsFioqkv0lOiMcaZM8rqbav6BMfg0lm0KVPDNY9+zhjmExu9n304nJ
         4qMaH3m4cBlNdeq3FCWO1V/TzSYPCnDMh9ST4bjC5Z1jnx7UtEljRm9N7pZhx3NiBp+/
         JAc7zPpqcCUlpSNZql7tuuKvMPr+rA0DWqNUoP0bodT7qWETuwPV5TWOWMV1sJiTJjaY
         XSYbEErQWLogc8Y44ObSXvm14g3AgYu2vglGo3KoOvki6CmY9Ywvrzu4YaZ8bxw3ANmi
         rRbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxz4kAXtWm9tgbbf3sY0cGQXcjAwQbwn+rxaUpNKGhn5w4SkOm7CPSSFT2MFsGbzrpO2udmRKotddGJB+U=@vger.kernel.org
X-Gm-Message-State: AFuF++nrut3vAGUP3F4y7VF5ojnXt7Ait/sq/72bh3kIjXQx01KHGB2f
	G79cdBMBQmYtptE+ub+42cHozC9+wYLhkEwwlCFOrQr0VO+pW5HyLqvGy1ayxP2uU38=
X-Gm-Gg: AYBFou3IgBxB7uTK64G/pqFSUJQvEl9bcgd8GkQ5C0s+wKMez+VWih0rwzpyrvNMBdH
	X2HxuwJk2/ZKyZwo4gUT27ZzX0IQJ/yqzkJ49OA1uxZuhonpIE9jUc+RjUhN/ccA109XzhEeSBl
	xsidX/ttga8YNExdNNwVJE/bycRODmmPpg+6GFkNKa76T5VLlHD3nAcWfCOgQTna6NOBfoSXgnW
	UQvDDg59PDD1G1NEIZ9yqPwvoKGnt82ip4RYjU56uZv40Y49xR2hEc74eiKCwA3mjAChb/H0P/I
	qNHZKeOK69y7SkZ03Os/G5QGcMYAeTeoStaPD1l+/LPm0uqetcPp5mIq3oePbfxiEW+pmAEFiMN
	yidRiboTdK67CzGvXtymo/fnsqn6HdtYAXGqgXHlco7Y9cj+AJ7YeE+Uf1N6qGM4iomTfLcOlYU
	zlN/Jsblv6/Sr0jzJKdA0A0uGLkDcv/Ehacra8L3O7kS6sR17TQQb7TYJGm4WkRWGQGF6XIU6Ig
	A==
X-Received: by 2002:a17:906:6a03:b0:c29:45ce:85ad with SMTP id a640c23a62f3a-c29667f24c6mr225571866b.1.1789139843199;
        Fri, 11 Sep 2026 08:17:23 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966026e2esm93138666b.19.2026.09.11.08.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:17:22 -0700 (PDT)
Date: Fri, 11 Sep 2026 17:17:20 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: linuszeng@tencent.com
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
	Natalie Vock <nat@pixelcluster.dev>, Tejun Heo <tj@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Jingxiang Zeng <jingxiangzeng.cas@gmail.com>, Michal Hocko <mhocko@suse.com>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] mm: page_counter: move hierarchical protection
 out of struct page_counter
Message-ID: <aqQZus_Cc3mRiuXn@localhost.localdomain>
References: <20260909-descriptive-name-v2-0-d7dd7c099049@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ozrropszbqjorccy"
Content-Disposition: inline
In-Reply-To: <20260909-descriptive-name-v2-0-d7dd7c099049@tencent.com>


--ozrropszbqjorccy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 0/3] mm: page_counter: move hierarchical protection
 out of struct page_counter
MIME-Version: 1.0

Hi.

On Wed, Sep 09, 2026 at 05:44:18PM +0800, linuszeng via B4 Relay <devnull+linuszeng.tencent.com@kernel.org> wrote:
> No functional change is intended: protection semantics and the cgroup
> v1/v2 behaviour are preserved.

It is not clear from the description what is the intention then :-)

Do you have any measurements that the reduced cache footprint
changes performance for setups without protection?
And what is the positive impact on protected scenarios where the
counters are in (possibly) different cacheline and one indirection
further?

Thanks,
Michal

--ozrropszbqjorccy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaqQbfBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjHdwEA9eabDSoks6Xn+ni3bc0I
AP32Ul+BBWTmz5HMyoTjovoA/2JJSh5lKBEsuu0fwEMrZGzX9XiTI5mG6CHzszPG
ztkH
=VS/g
-----END PGP SIGNATURE-----

--ozrropszbqjorccy--
