Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BBD44A403
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464844; cv=none; b=N3jMrH3edSmuaGJzLLgpuqM4t1wcQO4/DNlOUFzHmkrksnBB6SWQn3LD13980J6gOarrNg8xRGMVFgVnbOQ31sjJXcxZucYs5fZM3G4d7gpLRVayWg0UQOX3ZCChRnT5bF6c7LTpwqGnbRusp9Fwp+wOPhZckZp3v85FHcDv5iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464844; c=relaxed/simple;
	bh=OyzQ4UDKaiyMoT/NVzqvh75hv21N26cEww1Tjs+Q41M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvfJs/v69K30g6PhhrtWh4x+vQPNkxoFZQzyjUqLx8jTxCIUY1huq4u7r8aqA5yvKfMUYiABM6BZU5pjXlSp7/11IJrfevEJJ3gc47ZeQMb+Vq8qMTH1Vbx5BRmxML+yL0aVFy8vMAdlT4ev+7GtM9UJfYoLi1wZWdHhX7IWJDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KwuWXawi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="KwuWXawi"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1935244f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791464841; x=1792069641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7t6+pTQP1CQbEVM19QS/h21zu8MNABf/SgAoLNSosdM=;
        b=KwuWXawio7HYkh0owZWJE/gmRDJqegpvYiTo3uIgFd50s20QWZaiZE20LTt3gbn0hh
         Q681zeE0ck52Ex+G9uog/sx5MNUZU1xdC95+XttmEQMqMMSeG+5Rw5yF1tgyc2QxJU2I
         FnGVP/i97hsmQtS7YA4DH/uDLNuyIpEN/WBaSAFy0HzKpZImTHs7IkJiY6EAeESXzVIt
         vKJYU4t+u84YPKMygGxawREuZLUmnyl+WK7fTKc5D+G4VGPCJWM//5tsBvUJAReDAvND
         CAujULbFW1mK+kWM4W8emBVg85qUEUnknotmG5LLvbIG0kAIxjY9kUlyXRmk5v4a6Iwu
         0v4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791464841; x=1792069641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7t6+pTQP1CQbEVM19QS/h21zu8MNABf/SgAoLNSosdM=;
        b=MOOfibI9lpEKf3qS5wkLp18UWB75268EJ2+1tR+bxOqzK5+jcEQgkGhPMonzOmrD5X
         bmFbdkNacvf41yiHoUfnR987Gj6lTaOiVzmz5gsV7uKjBEODfxQe1wP4XcSywzOuPd/5
         So+2zkQk2ZGQosqYXDGtZXeu9jby7oJ2FoTNb82dNDU/D6Gz7AAExNh5lNoz6sGrvA30
         SIzjGyDnkKItXtU00QfdTmYFpzLNqzjnEjJe4my4dNBoPuZP+jvI4Fd4l6AWQbHjix8T
         y+4mCAA/cl9dIgMMTXcuCmoOx2cNfgaHRPLqdvpKDpteYkXZEOfJjkydniw3gdzamd25
         2UKw==
X-Forwarded-Encrypted: i=1; AKwUvByvsFENfY70wOh5pmHKmtt7HPlIBv52YlvTtk58gQz/uRGIepIAoze9Et3IPewvNGkwexKugQzagTnJ7AA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4/Gd+8i5SnkBbKHswoSexqxbWbB9oBP+tEwtUafWkdNrtp9v9
	3yopaGQxlAs089Sn3WYP/Pr/gWiLXO3r94z6eRlnXmJsqtIbFjp1VZmxBz9Idnyjucc=
X-Gm-Gg: AYBFou0L1QvSXaAA5ft4tvV9s3uCZ2ljzQkuj60GBFevazpbTV2Xty6WqDvvQWVusZd
	jeqoXqS9VNYKPVlE5pqLAfeMzY1DjseVfYa9vOJ/wHnGPNHg2Cw1zOloXyNZ9cGt33ZXj7aw1cm
	CI8tsZalxrGBnv4pHb0ooJnjajWkDvLm4uHFXeu6J+QsGP5vnNEqCv4MDGhCAnvyOHYpbMhICM/
	29rx37nsFfuYkqeJ1Pq0TeixXRzSvqavS5Y2tEkx4g5fX4ooBqlDrVQQHJKmJD2LtA0zd45JJEv
	U+O1x4jHegPt8pm47l7GOLESSA2mHS0mQF7ntwhtIEYSl8dgSiZKKgGkcb+IetXnFqEjl0/AJll
	zroThbk0PenSKxgrwQRXzZrDl9LbC8z1r8SMMg/5wf7tn2lJENN006yEBLSEiZ03mhKX/FcxRJF
	d9D1UuRO1dnJtNtpJ413GjzN0YNtSTpVfPMS5L3wbKvPCpXIsho09ajIFRYShpmgL3dVz8nlSd3
	rnHxItQpg==
X-Received: by 2002:a5d:64c8:0:b0:48c:43a3:6a74 with SMTP id ffacd0b85a97d-48c7277152bmr11130200f8f.12.1791464840586;
        Thu, 08 Oct 2026 06:07:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([185.194.184.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c724b660fsm10757165f8f.18.2026.10.08.06.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:07:20 -0700 (PDT)
Date: Thu, 8 Oct 2026 09:07:17 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ayush Ranjan <ayushr@modal.com>, Pedro Falcato <pfalcato@suse.de>, 
	Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] shmem: FALLOC_FL_PUNCH_HOLE vs fault-around race corrupts
 page cache / rss counters
Message-ID: <aseVAm3vczSTvBwN@gourry-fedora-PF4VCD3F>
References: <20260924061708.1645968-1-ayushr@modal.com>
 <arTdLsBENhrpOyk-@pedro-suse.tail5790ac.ts.net>
 <20260925053027.1998394-1-ayushr@modal.com>
 <20260925065013.3682431-1-ayushr@modal.com>
 <20261003033107.1488699-1-ayushr@modal.com>
 <20261004222831.bdd648a2b406f02747dd9e40@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004222831.bdd648a2b406f02747dd9e40@linux-foundation.org>

On Sun, Oct 04, 2026 at 10:28:31PM -0700, Andrew Morton wrote:
> fwiw I made gpt and gemini argue about this for a while and ended up
> with the below.
>

I thought this was resolved by Zi Yan's patches, but it seems they just
made it harder to hit.  This version looks better than what i'd
originally conjurred up, so if you end up taking it:

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

~Gregory
