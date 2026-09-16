Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861CD5013A1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566369; cv=none; b=C4NJm5G4OCgmvR/NQeXzqyNqRBgBvGwU+DQ6bsNpo5aAIITXhM13dE+kXuf5UwQRO87Cick3BAhf6IPG/Mni1yAMizDuUQl8WVGZWw2N8B6IbMPRt5dbOpbEZDI6QBsqCVAPMyLCbJWsx/dLY2Q3SeY8fu0SDB3UiRo4hSv1Uxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566369; c=relaxed/simple;
	bh=JALK3ZEku02fNrcK0g+Xt9SkUYhgHph+GtKulp/52dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjyTfZvLQkYJmhpjot+M8Imoloh7WuR0e9jyhPb5ZYyEfvbVWeXhklso0kOJzYUSESk6ekaODWU8ijU2mncnI8TGHO8nmIh6m6h4M78PMNqNfh5agMcWA5HybHjHAMvHdHTkxggCpRaMUz1Cl2mM92Rbka4lMdUAkieuh17suL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YsOFx69y; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YsOFx69y"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d2so795539a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789566360; x=1790171160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gS5Urd2oK4cUSLkPyZ8kKu9K7ELV+4PGRJOBXjNcmpA=;
        b=YsOFx69y7zAipESFJmWnXl5Qsecs6gbqqymCvBwbAffX1r7WUk2XoG9UV5OeGcdJS7
         oY8dT33LmXSRivEuiPuE90x3qkMTNT4snxg99+QY2kNliPjLeTcRfFRc5i1+KOfc7hJC
         YNNy0D2jFfy4FXWdrULVxRAUrK9Flp3IIJ1CvktvnThhUnYJatNrT4Mao+QLLPEudlyg
         TKmhGPdWEuZ8+1Z4fMxr0ETGrjov+JlRONzb3FHkJY22vE8yGjVXGXT3Qyz1htKCNhBx
         Vzsn8yYSbucMSkgOihttNqkVtVt1nitbTDQ55RLrbAGE6YTed9QnK4/KmnTY/xrTTikC
         mZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789566360; x=1790171160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gS5Urd2oK4cUSLkPyZ8kKu9K7ELV+4PGRJOBXjNcmpA=;
        b=rUNXCGw2P+sHJEf6R1lOWGK3Y6Ly0aiPpyL2ne8m8JHo/CAfKjW0MGFxqTLwlzNRUs
         0ORhsINxK3sPusEdlCtQIQFlwttfKuE2sCom6Z5yT2iUJ0fDW9hWUoKh5hxUPz8kXWbv
         KMidjHi797vBq59vSfoFdCG2db419zgk98EPt/NB9fDC3DOY33RgOwv2O/YOOPQpnPgF
         tvYsV7ZnzIWxTCVJTitintlHYu9/6stZiT/WqOpP6BVvcYv37tyJRMeCaMROc0w5LduX
         z4rBr2J+Vdy4YCINv24xCmwaKsBD6FTrcVt5DIZhabXw47FKZ7woSV8fGkL47bfiDxNU
         OLxQ==
X-Forwarded-Encrypted: i=1; AKwUvByvsbb7iW//DO4pm5puwKIsUfTedykagrsaQsln1aNygGSJEVI4su6/cSMxB+C76eoVrdwiYtKDy7NrQvE=@vger.kernel.org
X-Gm-Message-State: AFuF++k+zibrTFmnDagNmRwiFFzDpQkRLBCXpl20bUWAH4atZNXCG3V5
	FY+8rZkIpC1R1q8XvdCSegFVfnnJBXp8T05EKw/oTyfvG/tCSzHANqi5laQUjmR+CCU=
X-Gm-Gg: AYBFou15DuSXP+RFaYa6U/lpPc2803s2wVNjsgOEtm85il2O/a01yYa/FmuEDbVsXul
	8TXi60/5eVeChoUJxDpq/YkXdTUvmfNlzSkvbtyJzYYtXgkO85YmxWU9ZNrORgMkDkcuKZ/dc/o
	W/N9uSlesYrPBH3zbBx6QazZMCchOiB/7f8JXSuio8ICJ95cCeEq7dg2sP8VwG/oYSShT+cQV6l
	22pp2VkrcWzRSOT+FnTRHOwymlWzLMLj5s6ue7M91USJgDATGOBrgj6hYdW25vTQzWdf/SZpChc
	FpfrrAMvhJRVSPHyBduXAcuB1yNMAU7Ry08jM+2FVZiLeTXgdFiLP/gSiQZ37qlvFg0cV7QXYHC
	EAi1E/K0H93271Ue+jhpyJH/29SvY5KUCOTSDl+KTCX6DLSN8UxPy14AqWTEXA3jWfD6upy3jh/
	O8JdIQ5KMAHpfDBrN+K3I18baQ04dlhDacwTbzQcaUQ3EMbljqjP5Ui/ujELqU
X-Received: by 2002:a05:6402:52d9:b0:6a9:9840:f3d with SMTP id 4fb4d7f45d1cf-6aa2288f30amr2016738a12.4.1789566359636;
        Wed, 16 Sep 2026 06:45:59 -0700 (PDT)
Received: from localhost ([2a02:aa7:4656:2314:c23c:9eda:81d:3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1cfe07e4sm1792644a12.2.2026.09.16.06.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:45:59 -0700 (PDT)
Date: Wed, 16 Sep 2026 15:45:58 +0200
From: Michal Hocko <mhocko@suse.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kyle Meyer <kyle.meyer@hpe.com>, akpm@linux-foundation.org,
	corbet@lwn.net, linmiaohe@huawei.com, shuah@kernel.org,
	tony.luck@intel.com, jane.chu@oracle.com, jiaqiyan@google.com,
	Liam.Howlett@oracle.com, bp@alien8.de, hannes@cmpxchg.org,
	jack@suse.cz, joel.granados@kernel.org, laoar.shao@gmail.com,
	lorenzo.stoakes@oracle.com, mclapinski@google.com,
	nao.horiguchi@gmail.com, osalvador@suse.de,
	rafael.j.wysocki@intel.com, rppt@kernel.org, russ.anderson@hpe.com,
	shawn.fan@intel.com, surenb@google.com, vbabka@suse.cz,
	linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memory-failure: Support disabling soft offline for
 HugeTLB pages
Message-ID: <aqqdlndHq9vHeX8s@tiehlicka>
References: <aqiIEkrc6aDBOqRg@hpe.com>
 <aqkCbgHmMGxI_GLG@tiehlicka>
 <aqmGd0GGUCkbZpkZ@hpe.com>
 <aqpYxAktjexhaMGc@tiehlicka>
 <ad36cd54-7319-4bb4-bf8f-9fcc7b009158@kernel.org>
 <aqqXbwglwYTyTuUG@tiehlicka>
 <36480c86-fc59-4387-91a4-cad839f502f2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36480c86-fc59-4387-91a4-cad839f502f2@kernel.org>

On Wed 16-09-26 15:28:01, David Hildenbrand wrote:
> On 9/16/26 15:19, Michal Hocko wrote:
> > On Wed 16-09-26 15:08:45, David Hildenbrand wrote:
> >>
> >>>
> >>> OK, so apparently there are some BIOSes which abuse this feature to
> >>> mimic a real HW poisoning. This doesn't change the overall picture
> >>> though
> >>
> >> Is this really abusing? We know that a page is shaky and will likely go bad in
> >> the future, For now it is still accessible. Trying to migrate off that page stop
> >> using it right away sounds pretty logical to me.
> > 
> > Yes, no dispute on that. But we have HW poisoning for exactly that
> > purpose, no?
> 
> Well, that tells you that the page content is effectively gone and should be
> tried to be recovered / migrated away. Unless I am messing up terminology here.

Maybe it is me messing up the terminology...
But I guess we have established that whether soft offlining is being
abused or not, excluding hugetlb through a configuration is just a wrong
thing to do.
-- 
Michal Hocko
SUSE Labs
