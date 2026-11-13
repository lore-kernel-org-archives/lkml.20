Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536376;
	b=pcPtGN56p1AgHMbd2p6sj0VRvldsjCK0KnNtPyN6VY8PmYumkFX90GpT8SHrWjrPuyj4
	 aR2j1cFjs8be2g1oEOEnAs1uxMtM6pfi5t+jyxJ0QBf5yCyn7HDCOK5S0KlhpOSR0zG5X
	 7cgZlW76liL9vxRvRPxD8R7pZ6zrB16yIfg261L8deCEIHoezZ1FEjBDSezsyp9Zx3ZxZ
	 6GnaJqrueQ87aEXGKNH6pbC3ZLpvh0xRs/skkeXWzU7jz1vWvI+03Ji/YihhHKEIkSqC1
	 kd6TuYwYi9NTQxFa14UKPBA2cygls5ZKEa/8lUeQcXGbwtUNismPygSeUzTrxsGS9QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ebdv6ZUT/HH0C8QcvPGAmiBNBGZr0ii2abVsK2I4hFY=;
	b=DYaufRro1y9G1/q6GApZP9OwSoRlu1IBIThQKlTGbie2cNKjQ3Y1v0ZSpmqK8zbtBxlB
	 iUUMM0R02rmkloBzxAatIC+5ewhULD9Ji0zrUkg9nEePB2eAfAAbcHAMe/GH3p2PdnMsd
	 f0+n/lZsL6p+T5ZaLPnLjH4mWSdfoYX9dMmsvTuZivn7XsmRaYZSX3gIeknmzNjbRJb6X
	 MBg/0Q+zI+nre7MPcd6DCukXY54jwI8Vn0QuSysIW4R8ageOnDrJ8uTMQaEEbrqjxqmrk
	 0+Ej4iTa8WTy6stCOHb7eM0hC2b5WksdcY1rwdB+bRxedfcqn9PGJFQJXx3rIltfVjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SgnUgJjv;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206A1606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 206A1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SgnUgJjv
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3720addb068so739626eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794536375; x=1795141175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ebdv6ZUT/HH0C8QcvPGAmiBNBGZr0ii2abVsK2I4hFY=;
        b=SgnUgJjvj3E/rYqpDsR5uHPvfoQtiJeGLe/Y0bcRfg1YSm2buL5B+cGqTAldTFoH55
         Wu7FA/dZ2BRZX+8op8v5YsnEiEdM287W1mpZwduE4hrQZBfAArR06Zrc88ay+k98IjU+
         piekQuO2cQ4uLY58UvrawIEaCvIUEDVaA8v6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536375; x=1795141175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebdv6ZUT/HH0C8QcvPGAmiBNBGZr0ii2abVsK2I4hFY=;
        b=M2dTbmIH8633cMnSNSxhyy2R5AUuNpI/U6YUvDGMtCda70Xy7/HJJwNndbA8yRWOd3
         qohipSZhoKyZPl6F41WyeTGSXjTM2Bv2IGZ/+wq+Sp4cXQ7MO0BNj3hmvNRsiosvA04d
         rgXbqDO0xTjU3IZGZsj2SJoBFxhJU++K/dp9Ra7BZJIiOoIxyKApbVi3QZJhiePGHkDs
         6xkpk0qxKzV6DTaIDOZOoHG9QQjc6uJuXFklO5TRsnpfjyuw2RfO3AUhiYFaAXDkm/KJ
         EHM2zRWUYU9Zt/bCfa+6QWt+RjT8eILE8gILmEIFQaomwaox6yRIHo44dRGdJkR7dZYM
         2X4g==
X-Forwarded-Encrypted: i=1; AL+hErEQi5m/qASncCeB/8PlvFI5XP96THGS9o3DqXIbkR7fuGuyw7kMBaxpd32v5D3l4bSXt5n8MYNIlAXDyjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bkPQh2G20UtbiH09Wxz9Z0wVrTabZpSomvdGspn2FhJ3XkNie
	k64hK8Jldu5158xSzRfBIH7MYlZop5O3nqcYz+zWt/W1vbHP83IWVFdyOaJkHSUKLQ==
X-Gm-Gg: AYBFou1fLAAhV4v0pwC00k5hLopvxE9MJlJifwuLPUns4Q8i7lhgAOxl/EnrntCqqBd
	eqtAqtE/tuMgxtxM3xihn3EPAjbhNfG/PZT0tFEb4gUFmxiAWllDU/3LpbxpTw8/1Xxp8S0f8g+
	hVlBt0v+cQ7CQI8ynwe8hFhEQ8LQzYbLbzmUlxvWd3IIb5ZmQa7yngWbwzeZIXfYnx38ytfRfMz
	ep8FQxuZVbFCh9fabWbNr1kJbwEg2PyR3T3VZFLlaonJDin4iFueIYYejAmwh4ZFDvDneU4p7tO
	YweyU/BZZHaJD8mUp6oZ9qU6U9gC9gG2W1OJmtahJZvtAVsbH6dUOpsZXKyJM4Juc3mo6uifVHz
	KHuOoYve15YiMpEWyWuOXXljbI7tT/sTJ0z61VVHIvUYT98JcomUuFCCFy1g+RP6jNgCuISs7JQ
	Qku3aa1pJTOuVRsSSgmPaYraIgQ9ARA1v7v+e0Nz+EugBN23mUaGSDQV6clXxpgOH5eYfdW4Agw
	LK7EUT4AcnMD0TaQLGrXecZ2PgBqbJO8a7atjzniay5Lu1ly4rop2EHbTOU0gHaz4tgoLZ1Xj4v
	QxiqxZ0VOFuccLq3cM3oOawJDZzRcugf87zS5c6vVRS+rom0/RuhAz5RW0bYBECaIxGROA==
X-Received: by 2002:a05:7022:3a03:b0:1a4:9eaa:d01d with SMTP id a92af1059eb24-1b50315d8e2mr1234175c88.45.1794536375046;
        Thu, 12 Nov 2026 18:19:35 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:3f2c:d0f6:e2f1:e609])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm2477887eec.23.2026.11.12.18.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:19:31 -0800 (PST)
Date: Fri, 13 Nov 2026 11:19:23 +0900
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
Message-ID: <avZyo_hCRonuhXW6@google.com>
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
[..]
> diff --git a/Documentation/mm/zsmalloc.rst b/Documentation/mm/zsmalloc.rst
> index d2bbecd78e14..4c0786378dc3 100644
> --- a/Documentation/mm/zsmalloc.rst
> +++ b/Documentation/mm/zsmalloc.rst
> @@ -33,8 +33,8 @@ proper handle-based APIs.
>  stat
>  ====
>  
> -With CONFIG_ZSMALLOC_STAT, we could see zsmalloc internal information via
> -``/sys/kernel/debug/zsmalloc/<user name>``. Here is a sample of stat output::
> +With CONFIG_DEBUG_FS, we could see zsmalloc internal information via
> +``/sys/kernel/debug/zsmalloc/<pool-name>``. Here is a sample of stat output::

While we are at it,
We use zramX throughout Documentation/admin-guide/blockdev/zram.rst
and in some other files as well.  So let's just replace user/pool name
with

	/sys/kernel/debug/zsmalloc/zramX/classes

Here and in the Chinese translation.
