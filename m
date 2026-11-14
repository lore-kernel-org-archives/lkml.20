Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794623720;
	b=qR2LWHGbhKX5PipOt0C8wozBXxzmTasaVUz+mRcHvv8qkWoKNa5wJ+vd2qGy51ysQgcj
	 AQg46SVrvnwxnMEb9tpygugkq7QT8Rvo4Qg+d2zPLgno0HX4JQVRbpUTHFA4SvSYmL7AL
	 PWwZl+TnuLNUKRTto9nXKOl+m8hf1KhXDFiA4vF8EwQDPqNozKYxep0+6pcjfffRCibPu
	 rbVvnqJUvPX9GoJO2VONI4U3T3G6l53Rj4L7zeZQjo6RzF4zRkxVGVKY96gQM3advXR3/
	 jeqjtBEHE7ZXWa9/RcKH7wsp0fW1rYNllxGcpGSZuq3kHQe9hIs6aHlwYiyJa85T8QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794623720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BrzkgDtWmdDQLLKKJvsVZHgpBzkxi812kF2+E/CI8dg=;
	b=UNT5yctAhc915BOccFrEjUXw3FvB1hfN+KkIHGQyjozc/tfWs7AV6d/2uJN2KsJnpEtv
	 4QulUlH6XIVva31kJj0+3zPYadRoNaNCKHoDKqE3GcfUkcIRm8cVvpmEMlAjMvjDzW6Dz
	 tYBDtfNXwXvNPkfJMeuVhOHO27AfIdYkkOIPnHsgNJYb9K9UUYuq9VFEVjsFKRl9MPBKR
	 qhUWJx9JnDpfx3IICr+8wRtzpKkdh60EPMjpiZwwhCbDHW6hSwTNiAt/bjp9AK9orjS0R
	 SPTEzr01PUq8eRA2OXtdrb1eunI6B8yPveAQd7MDjsrp13SGyaAWHMzSblcEU8E+A3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mZnatXzY;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76393606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76393606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mZnatXzY
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37986eb6fa2so807054eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794623718; x=1795228518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BrzkgDtWmdDQLLKKJvsVZHgpBzkxi812kF2+E/CI8dg=;
        b=mZnatXzYfihV+K0Xz6NKaEt/cKyKNB6tE0Mh+p4gUiVknyXCfxiaJm5+YxmIotuTtL
         jq0wW79xISRNi9F8rNtwaoq3Wl+ShSd0UA+S0XtqfJChyIgsEJiQrcsQ+dXJV1yJW0zn
         JC183XDBUJy//PIMZ1Zq4wHQ+iTCZl30Vw4tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794623718; x=1795228518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrzkgDtWmdDQLLKKJvsVZHgpBzkxi812kF2+E/CI8dg=;
        b=CORXWFFyFu+WsA3XhDmdIA2B23Md4e2x1udgOMudnB6dN9brZvW010nBUua0toU19Q
         K3rSh0gYjbjEmbM0DpEJKJU/wwhsxpiGFZoM06WXWjEPch+kFhqsSlxKWo39v18n8BOe
         KZ7fYuGWadiak0MrUxLFXVW9NfjdnD2ESu21s9PqDGtgm0NCGwEEr5wVa1UtNc06dywH
         B4+8sIPSvK6CssTuWnTYj2ka9NGs/d1kZG6V+DWlAmbXHnfAHYPEUmj4UWDTGsq4sVZj
         DYwtacZvwLJYxLOj/n0RS+m2PtXdFmcj3kq517tDQUxW64P0vKgq/gaXMrONJ3iZlRhV
         t4wA==
X-Forwarded-Encrypted: i=1; AL+hErGCZzqIhU6lo7/Hjer9zeQlkP3N9fI9JugWqzEU9Sa1hBTjwJsWYqxnXggnOHPrfVDDM5UG97/Zilugoww=@vger.kernel.org
X-Gm-Message-State: APuU4Z92vAectq9ny0KusLP5DV6iqcZxHkTcrEzBbRt6e+YxPOtVFnXR
	wMBuINDBg1wnf65V0rFugXj0Kaz5l1mXzglKpjlvBRlm32KmO0y6Ysircpa657IMVw==
X-Gm-Gg: AYBFou07kpJY8iQWTCivO0+cmizr92SvKrqzbMpqzGzPrQWVOegzYf1Ro1BzTHaq6CU
	OkTAxFxCCo18khPW6TnL/3GefYpYUzFvyFlypFUpjes76E5IuPbdl8cwhxEhRXPYxuoPOs+DhQz
	pENUGCrdIlgkrt+5HMcjBWcPwswtA3PPpmlB0j/GdQbJ1K1xTbumbCMeDbDAcYdWFQZ1NMGNnva
	g2kMr+wXPH/GTmj3CThtyxL1XUpcSjI+ZBfkJ+5Yz8llPe3aWLW5aor1A530PHoVjo5YyXX1OQP
	TLZr4QkPfN9cynfsoIxP/eDKETPblBBCMw0qZ/MG5azwuoUHGSGJLokmkhIoWQJKc/BTPaW2/oR
	3U8KAhk3JEusMvq9uBM8cgh2csJ6lybrN8IhplUJnXzOTfkf49gVkg4jdbYQwcpV7ymziZLssF5
	hMcDiL82t0MErEtrT1f9TcIFcXy94tDt3B0jqo5a3KCMlQk+qrzFbn8rp0/+DvlKGlTYxaDu30F
	8Bw4lj9MMADuL8ymAwey3AZu0kSmJpJRNkZ9l2+pcco5dP4/631f2YKKp+4Dupvq+8f9YwbvYP3
	E0H5O71MMs5tJmXIswrdK+YkfYhjPOk0byL1lPw98c5kMEGsfMiiAAQfrRKbq/ll1MlHPQ==
X-Received: by 2002:a05:7301:9e4c:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-37965da96cdmr3175541eec.9.1794623718394;
        Fri, 13 Nov 2026 18:35:18 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:d97f:ef68:a8e1:6af5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm11080880eec.12.2026.11.13.18.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:35:17 -0800 (PST)
Date: Sat, 14 Nov 2026 11:35:11 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Helen Koike <helen.fornazier@gmail.com>, Vignesh Raman <vignesh.raman@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Nhat Pham <nphamcs@gmail.com>
Subject: Re: [PATCH v3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
Message-ID: <avfImwT4gmBYdNv3@google.com>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
 <avZyo_hCRonuhXW6@google.com>
 <179457128804.2142163.14813125534208665209.b4-reply@b4>
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
In-Reply-To: <179457128804.2142163.14813125534208665209.b4-reply@b4>

On (26/11/13 20:01), Xueyuan Chen wrote:
[..]
> On 2026-11-13 11:19 +0900, Sergey Senozhatsky wrote:
> > On (26/11/11 20:41), Xueyuan Chen wrote:
> > [..]
> > > diff --git a/Documentation/mm/zsmalloc.rst b/Documentation/mm/zsmalloc.rst
> > > index d2bbecd78e14..4c0786378dc3 100644
> > > --- a/Documentation/mm/zsmalloc.rst
> > > +++ b/Documentation/mm/zsmalloc.rst
> > > @@ -33,8 +33,8 @@ proper handle-based APIs.
> > >  stat
> > >  ====
> > >  
> > > -With CONFIG_ZSMALLOC_STAT, we could see zsmalloc internal information via
> > > -``/sys/kernel/debug/zsmalloc/<user name>``. Here is a sample of stat output::
> > > +With CONFIG_DEBUG_FS, we could see zsmalloc internal information via
> > > +``/sys/kernel/debug/zsmalloc/<pool-name>``. Here is a sample of stat output::
> > 
> > While we are at it,
> > We use zramX throughout Documentation/admin-guide/blockdev/zram.rst
> > and in some other files as well.  So let's just replace user/pool name
> > with
> > 
> > 	/sys/kernel/debug/zsmalloc/zramX/classes
> Zswap has its own zsmalloc pool too. How about this?
> 
> 	/sys/kernel/debug/zsmalloc/{zramX,zswapX}/classes

Ahh... zswap.  Good point.  OK, feel free to keep it as is or
to use zramX/zswapX.   Up to you.
