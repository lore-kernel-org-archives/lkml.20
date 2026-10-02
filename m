Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A842EF653
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790984056; cv=none; b=irkFdRJxBJ/BwuaQZTA1YMQqtLQQpA/yqFhThHPU/k4tWyqUS5ereOoz5ahW3F5JnmPiVf0Y222s+XWOj1TXKUEYEQiTZyxNpsZyKapAG8/7XZBeBhukC4W501cwfxzxmlIfzAK+Acym2zj6nW3/E4Acp5z+79cC82u26R037zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790984056; c=relaxed/simple;
	bh=7o+LINvsw3cnNrmXC8bVHg1wXTiNuRL/IULLu9HlX1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYYpM3m0/UdYLeeUjHvXclZ8/NqXfDIHPLiTlwMvIRHc98W+CFQvbbRv4uWJQ9TUbJYHyXrcdsLpJQowscgm719IKS1kqPEQcyr//S3dyxpo0MIQOnr3b/cjQkKE/f46gplIbtsddMs1fQsZpf7GYhpzxA1LxWVW1EVg6Z6mLvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRv1U166; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRv1U166"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1626d6a6cso1378935e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790984053; x=1791588853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlE5oOpiLimhwWokygiFZQE0uDbuSR0YvHVgZE09XfY=;
        b=GRv1U166uCpClbXKbxaX99NNz/TxuU4qK6d/2rOU0Z4iLBbydPJnEiC3cqgTIt3a6K
         4vSUMO9jLW8dPXEPP+aKAweUd2aQHf95Pd2ZWKMuYQTLsJcs9unNVC1E0UwOzG05HW8p
         xjsrxotSu4WGREbsW2z8fKM6RhTyH0V0+zjWJLyIGJNXTcrXOAriYz+h++qHDGMELkws
         WfRfNVl5D2/DJu6wPZ8Xbbt1BFLEHRl5qoaXR0rO70SpmTNeIO4/P/H1mq8GPDRWVaLt
         gEEfiZ488kvZSdt82dpdh05URcYx3v7uyVWO0QSzimkErW+te8rbYcaKfqtAyKUbB7UY
         fjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790984053; x=1791588853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlE5oOpiLimhwWokygiFZQE0uDbuSR0YvHVgZE09XfY=;
        b=eALmrKd9B7DyzwfpyRibr5RzImAfhnVJyP7MWD5YA1G67YzMQHv3+Z58KtftqmKvgr
         ly3WMrS0lRfGACgr3024JaRgCikf73P6U/EIhQeEivQojfQywAX33CfzTpqlR478iUvr
         XpG4EmmKgZEt3Psz+vb6XoErTqmHcX5rOxmIysVBCi3/yJG6m3y6GWuaSsmsVhHg4zui
         QhS9rwBZSCpICdU8ZbhpbVpJ0U4E0fEvD405RgBbb1hSzcYApDLyvnKCmfGZsSEDBk9m
         lLzltMdzfVYik+4sv3nwOCIyQNXP0aUPEiTHhsOOP7bI+6PO8jN0UzG8twt1jsnDd05b
         s2DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzW3tvOsdfGF2CD0NYd6FYYZLc77+FcLsjBL/60OGRnjokJrzUhkMQItp5ii543KIYwvdaFAYtUOdMuKTw=@vger.kernel.org
X-Gm-Message-State: AFuF++n1XHnW7ZXwWVJot1WmMahPNLwoo6wKl/RFQsiBGEnwrzNayCMt
	ubuP6J98Rz64wtCiDzs1yXaxEZOD7uwMgBmM7sdD/xCxkhidnEclzp2l
X-Gm-Gg: AYBFou2cdtFMe2XUZBKfsyPZoD0qNwWoUdy3ZnngThWapnHvKWI86u8VExWEUe0gQOJ
	FeEmM+vaDOirkTAM5CsIEl8exQlRARhvb+WwJBRVG4LzBzglTF5J8KnqKhPuezV3eC+LadYdEs7
	/Obd3Zm9ojVxBr9nXbX8eJYYF6hA8jE8zjbdNxMHdP3q4LNdMUgVRWV3OekGFak7OHmYPYHPVEi
	+MeZF/OVwaOqG9x5QEb4bJdFFA2xfstGJ2u7exmX36H7ngiEVFrDHYRZ41VwlqrrAvgHcb3aM8w
	ZkUMKQwdY4SfTJbouE+0M9Lxyv/ANHQQzJQH2J6nqWVzvkqelaHIat9VjO9x+B3Id+0Sz/WaDUE
	Ikv2pfq6xDuecdNdGO69J8qrQgWL1Z/qCTjqdxUNW5hAsbacoWHp3YJ5xhcQftJl65KL7HzY9DF
	oPPcElZzeG6W8LImWrflhshl2K3mYEStgS0hc9fZhW+gwPw5/W/l2BsI+Bns4=
X-Received: by 2002:a05:600c:6287:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-4a1680f5050mr9710285e9.18.1790984052936;
        Fri, 02 Oct 2026 16:34:12 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fad53sm9737285f8f.19.2026.10.02.16.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 16:34:11 -0700 (PDT)
Date: Sat, 3 Oct 2026 01:34:09 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	"Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 2/3] mm/memory: remove the mkwrite argument from
 __vm_insert_mixed()
Message-ID: <asA_Lis9dHNp1xv-@gmail.com>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
 <20261002160535.661399-3-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002160535.661399-3-ekffu200098@gmail.com>

On Sat, Oct 03, 2026 at 01:05:33AM +0900, Sang-Heon Jeon wrote:
> __vm_insert_mixed() is only called from vmf_insert_mixed() with
> mkwrite == false, so mkwrite is also always false in vm_mixed_ok()
> and insert_pfn().
> 
> So remove the argument and the unreachable code in insert_pfn().
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
