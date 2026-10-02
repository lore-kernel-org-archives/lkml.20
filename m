Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37A82EF653
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790983978; cv=none; b=t5Wm4jEgQhQGUpD3S5zgKO8lbwUWSWlf+UO0zyeMCsj/Dbx41wRIBkMWUqpsWA0+rWZUid9S6lY0PXvOsK2oK/W8X3+tMdoSku6ZFjyW3XXyb/sWopk9sX7u/awVutPdKvgdLJA98tMFNrnlMucFuVVR4KRzwGgYhJWCqgnz0Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790983978; c=relaxed/simple;
	bh=H9YxF4bHdjHuY8IFlEF0b3E4QyahxogRlg+gxIp+dFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ndla/CerHZ0FVDZKOBcDWxfsyEXUp+9VM44OSGN8+yhw//TCXLYd2Ys0GFI9iIEvnOLoOdqFlrfWA0LYSbwPr2DnnEvPcg4XiFJNCcOp277UoohhXe0T5AJ2yhPmaeRxIq3MZSLcEVrEQJ7uoyfZuEgtqYiTNzyZ74ATQReVG9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFvbFvxs; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFvbFvxs"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so191370f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790983975; x=1791588775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=owttwFOVeJn79HsAeFoCLAuekwXL2g7sO+gGyikXGBA=;
        b=PFvbFvxslebD8D3/v0ymBSdtZT7gTaMu3UEL9FbveirmL1gvokoFTvAHORdJwPNPwV
         XU67ZNk+v0+OXiyoESxtifLigWNoXNnXlgky1U8zoFTsHZf3Ivv9Qq8dkSe8t8A/KhRr
         QJsLGTFtDBdzZc6Az9QLy4QzNti4MpjMtecWm5Bl8ahsGQ/OF5f1O5ELxiWAcnRf2a84
         zblp6sL5D1ad4lubmRvmd94+I1oWRp34H8PaT/P9+oaU5gPXPafChQ9zHaCUTvndt/Js
         PvQZuUOWWdPVdGrxJlEgzzUqivRUgYsiIskB36y09MEiqd5BZTVgYnYn9f5EclZsWint
         OBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790983975; x=1791588775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owttwFOVeJn79HsAeFoCLAuekwXL2g7sO+gGyikXGBA=;
        b=rp1aWu0B96LzaZGnF1TJvvl564HQseG7wS5KkyAOmbK9wcFAxKauYc15e5HmHOu3P0
         f0a8M2i/d8OelK8QKZCJrcQlaFKnsNh41EheuPi0b/w+R3GlLiHzpjER+wQjmaxBgEFz
         MtDXGYh6+uiftLAOB04fviIy1r+3UU+nn/Oad/fbD86RBm3UKlRM21atI43LJI7JUQmi
         635KUk5nWZRUeZZ8Vk0ksedhMbe/ulgkDCceSghOmjljiaCpntfzUQO7GWXibK280S0i
         oYzPSe+fY6g75a/XCoiLliTkVCAPPekH9GWFbv1bV7UFjznAJYyHdh1a+NoNDyU682uO
         IRKA==
X-Forwarded-Encrypted: i=1; AKwUvBzLzcJMQ6aqMsqCpDwb7key0jGFE2s83YAc6dTqNeQFb3Xr+oPX/RAoxit1SywbR9YJDDDk+Tjd04cdj8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nfBy6xX1f8EHV2AER6nEuiuWJfKUoRvjglFIQfUEVGIv6yk6L1
	vHniQf54qBFLawL2gXahuNr1hm01z7As8U8OFz5YBdK0gJm0oh0cbQtQ
X-Gm-Gg: AYBFou1rQEu7lRluzxinAzBnb1AqQqIH82hv2PgPtjHVNC6jUzCefs1yRyyZkzpoExa
	ohO+EMmpouAbRzdbCAgwqkrlb5ps+uX74eYpaht/6ZZs8yZ+MYpZh0vYjqereppR0MzMOPDd0he
	bUYEOKRKKqtB1AH0Y0j3un+kkK1X1VL0KTTPi+0t1GnAcTJhK2aVvVZwpsdckO6PLusgJbPwbz2
	e7Z4GDi2kjRUGnBXIiL78VWVTFDhfysvp7rScjulTFeUajEc4Th66OfTDuwN8h3hEH+1THYbGjU
	2NCVJmejufV29/iOnA96r0uUi0JcOYuZ1Lk1i1JnMie8tuQgamZb2J4TCHiAUOzqQW3rxjah1f/
	tU6RTVFNtY+M7lvpqJfdeAOJ/Hwc6AbF1Or0MPnciSk+tWo0cxKAUj47g6Yg6M7UEQLpGGzIphx
	9FxosKTjSxyz5Q1yyalCW/s3oaFzW5GFe09OzqoFaBFJZ/vPvB5spH0/pggHQ=
X-Received: by 2002:a05:600c:6217:b0:4a0:1aa0:7cfa with SMTP id 5b1f17b1804b1-4a027583efbmr65242195e9.12.1790983974947;
        Fri, 02 Oct 2026 16:32:54 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm92300685e9.2.2026.10.02.16.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 16:32:54 -0700 (PDT)
Date: Sat, 3 Oct 2026 01:32:51 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	"Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 1/3] mm/memory: remove unused
 vmf_insert_mixed_mkwrite()
Message-ID: <asA-ys-Pv7vTUKXU@gmail.com>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
 <20261002160535.661399-2-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002160535.661399-2-ekffu200098@gmail.com>

On Sat, Oct 03, 2026 at 01:05:32AM +0900, Sang-Heon Jeon wrote:
> Since commit 38607c62b34b ("fs/dax: properly refcount fs dax pages"),
> vmf_insert_mixed_mkwrite() has no callers.
> 
> So remove the function and its declaration.
> 
> The comment above the function describes the -EBUSY handling in
> __vm_insert_mixed(). Move it above that check.
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

all three LGMT so I'll RB them :)

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
