Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449124;
	b=sx4rzEsxbnmX9yrp9b5PNNT2oi6qu7Rsu/w/MKnjSkVGtpZpWHJfcXJeI836x0BsxuA7
	 kbZ51KDU9o3AO+YfA2+cud2ph8Rg2Df+u1qtG7s1S++w8CoPcnmuc6fL5ksPm5C55ExCl
	 VAzBs8iQF5KaqWfsXEHyOrWvq1dHU/Iam2TyRYWqMu1zKWw0xu0eqCS/RTU496mciKCXJ
	 /l/O9nnYGm8Z1A7voQ6oZPNigKFoXElF3Vye/37scfS1EZ5GeVIn7sNWEwTUhYtR7+XO0
	 JhtLjDD9SBsra9iZt2xy5FpSMh5eGJ9QAtz6k/9jHRLzjpkkxKxmCDZJuLylzjOVJ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qKzq1YaHaTK/cMOsuVlloBBGSRBcO+4dM5JD9G9qTYM=;
	b=t1c9EvYB20+glIAs5A+c48CYbpLY1fjZLv8HuFxbzeSVdtTja4EzbBHYalyGf/9otEgt
	 5FzrFQZ/9AXQ1P9xC8GX3AmGz0Tk5o0U5y3IgLsHRx/DQv140Tvs1Nv8wihP1CHvp2fCR
	 wO5l/h2aJK33MYzx3hRGDwWxiNnBY+l4b8oLjqNvZRXg44EUsYLNsi3dz9iCEkP40Whpl
	 HJi41TCV0oqzEqwdMY40Lt76z2lSZjXTDFZ1ZQZ6OLXIaJU1DQlF+w3OrGx9A6pxPT8dd
	 Z9K4PAOXtS9zGUzVmQziT0XPYcp9UXG3y7J5XcKZgycPItY/myFq9vyzS06mZilg6Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M8LMUd9p;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAF7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BAF7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M8LMUd9p
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so2943478a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794449122; x=1795053922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKzq1YaHaTK/cMOsuVlloBBGSRBcO+4dM5JD9G9qTYM=;
        b=M8LMUd9pSI4E189tEYTQVVCeqMNbmM8OBOGdL5r1WCP+ApYPIFhMe0GulCPpc/maC6
         v9xWV2K8DWgADKMPZxbEZBtBgtXib/TA5zvfMr1oREvVJC04J0SflCaRXieUd+SQZqHV
         AecGMblpWBVJMHQl+geL5R3Hc+6KlnC6RG6f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794449122; x=1795053922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKzq1YaHaTK/cMOsuVlloBBGSRBcO+4dM5JD9G9qTYM=;
        b=OtGq90MX88Ma0zKmEcyd9GYe0LXgbsXW+STN4fbM+ulkyKV96hXh8lLO++KGLUy4Pr
         cA5r9V2CshYDo5jVLl5JVcoLB9NM9ersPtI0cMFZGYt5Gg9kbEfBu0OlLli/UR/peVMe
         B0+NsAmwZjemYOWaEsGSGaaVN22sA7e3Kvna/82grV/SBM8frZP/FFnUwFO4PSWaIMEb
         vHI1ZEIJFIgh2XZK5fFmVa+ywCaObGyow5tirW8HRRzKQmXu7JlIhMHUOL+VvpN1eVI9
         8lvvDVkHF61xeU4o3m61COPYStHMk9FnXo5YGR7+Z4j6BdlYwSSC0xNbJsLl2Rs5I7Yn
         dlDQ==
X-Forwarded-Encrypted: i=1; AL+hErEEt3ebuOZK3y4RI2H3Nol4cbC8pgYY73xjHIWofbt97Z7Y3tO80AVbkjuXsCtDfeNBosTsHPAVEHV1YO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PBnd6lI2dFrU1INoxDkUmQ2xRYH1loTE8RzA6Xli0IL4T0RLc
	j7brudA8HEqx6WGG1BBLiCreQluemaMcxkc/Ym7w1H0KIf5HBOH8E9jyyIq7OWUocg==
X-Gm-Gg: AYBFou0Emf8u6Fap+27gIT7rFaCJaiPNi3XQ3G8R7/dt7TJCl9lDAXDrhZtqaLahYq4
	eWoADTwrmwqbT4gue6j70mnlHtO1bVQDYSCjC+ZGgxm/iI3b43lzj2CsefKmHgL8zEODz3rZqXg
	IE188efyych3bNjsTJTUW/WImxPMWlF9fX6ZUkmqHxo58Crb3xWvOR2E+tP9WGyUamfN4VYGl1R
	DE7gx1WLHfhPtWWMIyZSwySYGGtgAyj5YluQAL21K+7Q9ByDdhA0bBgm39hZvjgXFOr1PiZMUfA
	UFLUQ22HYsPpWFDIKMn9HKsVW5ifKCvczmw2WqVobsMu0nJBZwyvxFVQ2sKlAslHGKBj+BrI7YW
	UQk/9nZPEEXJ045Rdg2ggfVB1N9WNfEKdXX70SiPbnmG9vfxmrzhqqJ6CzBF+n5bdXKwEEpQOS+
	Tj4I6dRRScLB1/W9jMz2YYWrGeB7iODDfOHT8GcNfrVy3aFJTmCpW26vJtnZ19a9pJiti4jqUdC
	6ArmlrBw1BOe0FMnPvTDWtvXEqrG8zQ7gUqevWNvrlrG6HycEXHlor/Rz6eir+vfMuN7aBOi6Im
	2tEohBb6xardbXkMInCJUyW1PtPjohVkjf5afC1dyKftOmaum+0G9N1PexWEwNBuJ/6MzQ==
X-Received: by 2002:a17:90b:4ad0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b182f1adcdmr4140105a91.60.1794449122530;
        Wed, 11 Nov 2026 18:05:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ace7:ac44:3dca:1bb4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm1832060a91.1.2026.11.11.18.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:05:21 -0800 (PST)
Date: Thu, 12 Nov 2026 11:05:13 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
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
Message-ID: <avUet_6jVqlWSP00@google.com>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
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
In-Reply-To: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>

On (26/11/11 20:41), Xueyuan Chen wrote:
> CONFIG_ZSMALLOC_STAT only controls the debugfs interface. The class
> counters are updated regardless of this option.
> 
> Remove the CONFIG_ZSMALLOC_STAT guards and rely on the debugfs API
> stubs when CONFIG_DEBUG_FS=n. Skip statistics setup silently when
> debugfs is unavailable.
> 
> Remove the Kconfig entry and replace the existing CONFIG_ZSMALLOC_STAT
> settings with CONFIG_DEBUG_FS=y. Update the English and Chinese
> documentation to match, and clarify the pool name in the debugfs path.
> 
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
