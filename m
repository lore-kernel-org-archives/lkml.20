Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDAB3D76
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393939; cv=none; b=TI8mbm1ERrdNg8I6T/wvIIukRAQugYfGwp1pvoSMmp/Yx8hN92Sv4LFpx096/tdL6LMymNkTedOBxj5RvlqiF30W36/Ztgpo/brTaAtKCrFJfmNCAZN/KbuIq9veHb6aUflNbpIvo4ig5DkE4WIELl6Xiii4d0yeyFRrQWUCjLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393939; c=relaxed/simple;
	bh=QZRmCbXjxabh7Pmf0TZVuA87pVMd+AdA1qxg5h+Mhu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFIaRI6LgVtczyrw32jPHIIs/7JeRHMYvXrZZopeNtDxByxOMTFtPY0poe5MtWD/zJZ86WLPuf4ILE4VoHdfzXH7eNkKc+fkO9wmTmRkdnyhiou7OreI9Xmjf+i4YuePzcA6y9aeK5s3S9B6Rq7MU6d+GtX2p37gzlrOjdaOY/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WL1NKLY/; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="WL1NKLY/"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90cc64570deso6149746d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 17:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788393937; x=1788998737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oj1j9DR7tvSUa6TkT43vyXg4EoLBwftWK8uVdHa6AYU=;
        b=WL1NKLY/58AGULenm1IqQGnKsIsrvjHI0Xp0xZW6h4usl0mG8tIRde6RQEarJEXqWK
         fstYp4H/mEduEQbqVYVXpWLrB/K2VSYZG9UXjkkPBOz7Exp/2ZsYF127eB7ittthUVt+
         h/8fBqzJDWk95iOcCrNw7HA8iBeHvOb/ztgWMHrjBj7+/+NNLfazGYihkdLbKH0y00lQ
         v6AumouFDmhS95iQoCTUJXq7LNYv/ZKjGju29ZIpckNzORUWLflNn7eVrYaWG5IL1CFy
         ygWroeKVSQ6slxXbXbWYHfQMmcCE8PPvtV+AH7hIK/sH37MZFhMYmIEe5vAvL7U0KRaz
         xiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788393937; x=1788998737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oj1j9DR7tvSUa6TkT43vyXg4EoLBwftWK8uVdHa6AYU=;
        b=MtTyNJP6VoAuj1LZcOv8oDlxXWOlK27+bkASvpNN8TV+kbi6RjxBcPHu+RvFNq/DJp
         jmPbXWDd1HH6AlwFe98Ai8YGJAPrE2ngtSvdygpIP98Bl5Ce/ZTc9rzgguP7IPJYF2Px
         icDRB4IIBdL4v3g73XGdQyisZ/qllp5fNMpCZG0sdtP5nwtUW6soFAeuJoORk2rfoCDU
         cXFshQ9EjQKNQbCGUN69wRkjM4w5AxHBIJLcFNVgtaeOYyc42oHNFed8uNXTePvt/lDD
         14yKLM8Z/8slqKNRkuDRV9VLrOZkeCnVCWvkKIYZssKSmx6sx1uob1fn/kyH5FB+IHR/
         ktJA==
X-Forwarded-Encrypted: i=1; AKwUvBwT3QRKEif8QGztiDtc17241HPpq4K90olqunsSrCs0Sz08zYtVRA+2b+tJHi9aGJABC7haSGi6levn0xg=@vger.kernel.org
X-Gm-Message-State: AFuF++kUy5QKpmSiJO3sXbDNjml0aVnsq3WycNQDZIz4H/u+yEDISDK9
	3IlsKG9mRRhyk4+ewbK8JUanTGcMJzPRQrPrsdlnjFeGEa5bNYHB/FUpjN5SC10mZTo=
X-Gm-Gg: AYBFou316H/glZuWLjSFMwZWNYLaq529ld4lqvzBzSv0aFlwflQ+8JJywpIXDO4A8jQ
	OCBTCgIKERcAKS1XfcMEUgbu0BNMGB+OECXi9k7Ozmjcd7KrYakkdRhY25d70XzMkNy3ZcCTm7Y
	AnrBGwmDz60iQcfO3MZ80MFYY7mpybKHqncQeTINOJ8pITNlbVfiAmuu83YFIuJQZG/Wy4b0EiB
	RMZ4ncFrCv4DtEChJ3zG89SzXEwWXASBFHM2XF2H5RidGRLvt72Y7in1W8VB5QYhYjhYB4zQGU+
	NlL8FXUU1RoVPAm7K6ZgQhM9K4/q+ZOYyg129C1aRWDBhYRWecZnI0df0K/cBhGEc0bjfVj09SD
	el0buTlMh53zeqdTV2nNzWGdaExzQfqaKn6zkY0UFn1eGUmXMRCwavalg5xirui5/LLUjKNTd0F
	XDkyqSP6j1jkVyx4/UYIMRAITiHeCuOILeXmD7mAk8m6gA3BTkXLo+CLVnpBtT6MpHLk/MoUlBa
	/sKDPlPmmdGs3tbIr9gujyImSUW+mf50yPJdgUVv0GELtT/LN1zk8aHcw==
X-Received: by 2002:a05:6214:3188:b0:910:2f75:2daa with SMTP id 6a1803df08f44-910346ee143mr40566336d6.9.1788393932126;
        Wed, 02 Sep 2026 17:05:32 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eef37a6sm30220746d6.35.2026.09.02.17.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 17:05:31 -0700 (PDT)
Date: Wed, 2 Sep 2026 20:05:29 -0400
From: Gregory Price <gourry@gourry.net>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kairui Song <kasong@tencent.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 05/14] mm/hugetlb: use direct assignment instead of
 folio_change_private()
Message-ID: <api5pece7I6eqdti@gourry-fedora-PF4VCD3F>
References: <20260831-remove-pg_private-v2-0-3668159cd9e8@nvidia.com>
 <20260831-remove-pg_private-v2-5-3668159cd9e8@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-remove-pg_private-v2-5-3668159cd9e8@nvidia.com>

On Mon, Aug 31, 2026 at 03:25:28PM -0400, Zi Yan wrote:
> folio_change_private() should be used along with folio_attach_private() and
> folio_detach_private(), where adding and remove ->private content requires
> folio refcount change. add_hugetlb_folio() simply sets folio->private to
> NULL without refcount manipulation. Change it to direct assignment to avoid
> semantic confusion.
> 
> It prepares for a future commit that remove PG_private.
> 
> No functional change intended.
> 
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Codex:gpt-5
> To: Muchun Song <muchun.song@linux.dev>
> To: Oscar Salvador <osalvador@suse.de>
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

