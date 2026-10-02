Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FCC36F8E1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790984137; cv=none; b=pIzVDKQR4bG1ILerh0H3ZydbqqmjXi9zMg8w3tWIjDVRduAnL1PRvUKwLsETBn2C7/9cOn904ptoWVEw21id4OpM3JG8WQ5lIQHFk7WrKPdjACUgKYmfmgJM7CQ0l2RYHjOsAkB2wz+xA/el1jC94CtkA+/POWnnkNdL42jTwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790984137; c=relaxed/simple;
	bh=GACqV+M76Xn2K5NhU/bA7epRCVhGxn/7QlVPpgPFAAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UA4SnMFev+7cmHQdvvOaSVxrhWGipMYgz2QF4AmphlO1b7iZikcnFmr2YYLhr5LNgMa0PFf3bqg5JIOs5BE+CPMANQTTeRbjLJhAlnthmF1+BWah2EQ+n0MUCz6QoABEA4Xeiu+KUYKQUDUyTxdoj4zOrEp0M9CKIvPKkvUljjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3SSvXLY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3SSvXLY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so2668425e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790984135; x=1791588935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cKOGocBTPT6zEDfsTu3TByHMk46p15imK8zAdyqUzUs=;
        b=m3SSvXLYOsn3T0RKtsEw4Jwm1aH6BGzWMcVLj3Z2L2WUgN8nCEE21UeadCqeByFa6T
         eaV2kZF5oAykz4JOYltxGw3jDo39IlUD4Hin0Z4GxaZKoR8yo+w6R+nVNDxEPtDHVZEQ
         LQYgLARXBLL7v5wgbHShV2vtHvYVu5LxJJRAb/Z/KXuLXLoFLswPa9P3q+JNhsm0uQ/S
         UN6cqNxPAJoeTj5pEkemJOWcjGomdX2rt2Gc1+BZ5qSNhr78bOb3pluGQrNJO6kOjceq
         /fjXVrALhbdP5WeOJVBAmPJLcUZto20DqWNLXTiFu0ZEM9dW7qz062AjJnR9GA2aF8Ek
         Hq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790984135; x=1791588935;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKOGocBTPT6zEDfsTu3TByHMk46p15imK8zAdyqUzUs=;
        b=ysU1EG6Dbwu++QvO5DryzqYUh6GY8vJZLJD8RZ0JiECAFiGl/xT0SaNJ5DPpMci+7x
         vaPp9uwn/I37JYALPI3b8Gtvth1SbL75fTMmzmGyU6Xu6DVnLNNA66xx9dFZ0e1A5euV
         J81yjijGtK9B+p+ECrwpZF28vBI+xrRsWfCNbuXOxrMNfGtw6XOaLeMt6ASuGMo/5GS7
         70SEfH1iGPeGDCoiuAcUrlZ1w1l7StE7bqfuTsaG/czqB1so21DFZTegYPK5p+8yMrhw
         foCeeEf2qwXMmZ6cGCqOQCZfN+sAfzV+/WFeMz2GdYUFRMFceCIDHX8kE5NX2mUfQyhY
         UGVg==
X-Forwarded-Encrypted: i=1; AKwUvByDmVU/+APXcl4Rm2GTfGiu4ekWn2Q15VAWzefCW8fkpVUidScCu/WNQ4XjP//fuO26dSFftrbMGRF1tjA=@vger.kernel.org
X-Gm-Message-State: AFuF++kzt8CTknDyG+lxXR9KQ16SV0BbP5gO2Nb/49zmjxufGTdYb/po
	u/EG2Io3Y3OEZnY9OrpP0oc7WKMSM04M+eW+n6vT5npKgNdSwZaGc3mf
X-Gm-Gg: AYBFou2lMIAdpcHuZS2BctFVmxqjxOW16hWeeVPoAGvSmOTEWPRxRDxLTo3JhM/fl1w
	y+p89NqE3nbSCwaOkidrJk5DS4TT12Pvfv/h/owtWR2Bo3QS8by346Wa/znXlubX+ei/Vb/Hgvw
	tji02jWOAadzkcUki0oK3NUwEeRcwEqWM/GaIUjPPH9qhl2Not10Lyb5zljNkMdFLijoDm/hkDK
	pzFMKhdR6vXPpyL8gx62cLAaaUpcTp6cGCKCqTXSbje8RbLBIO7fBGK0CohTQ4LpdGr5BUFJRqi
	i61kDXy7dzMW0U56xFvW4oTvvAhq/dMNDFJ3icsL2FTe8SQhwbG7KbdAvbUxJalIgYn2auHAxjD
	AF4OPQgqeMyanWp0qY4MVQwIlTwlzy/BFa1MrDwKVG1ZAGIqBWq+5rpLM5l6f5k4gEatYdJyYhh
	uHqc7iAgk5fzZtPua0hisM35QuBlERGgTvYNw9PPbsYXxgeSVjRDj8jfWeaGZnsemKV9mnkQ==
X-Received: by 2002:a05:600c:8b2f:b0:4a0:f0a:976a with SMTP id 5b1f17b1804b1-4a027579f41mr70898005e9.13.1790984134620;
        Fri, 02 Oct 2026 16:35:34 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm130059635e9.7.2026.10.02.16.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 16:35:34 -0700 (PDT)
Date: Sat, 3 Oct 2026 01:35:31 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	"Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 3/3] mm/memory: merge __vm_insert_mixed() into
 vmf_insert_mixed()
Message-ID: <asA_sDgh676AzQkS@gmail.com>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
 <20261002160535.661399-4-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002160535.661399-4-ekffu200098@gmail.com>

On Sat, Oct 03, 2026 at 01:05:34AM +0900, Sang-Heon Jeon wrote:
> vmf_insert_mixed() just calls __vm_insert_mixed() with the same
> arguments.
> 
> So merge __vm_insert_mixed() into vmf_insert_mixed().
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
