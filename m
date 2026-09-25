Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CE93B7769
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355462; cv=none; b=IpvTR82oQMYKRJiGF86d+kbXm6pef5lvnb/v6Q2Hnf0YNY7CQsGsoH43Q8PWqS5hxgKQN+BI10QUx+jGFEWelx27rK1e1v8FSJGVv5YAzk9LMfHhrVuOeE5mZqDfIXUCYqsiKDtkpD7w6YAqTs9GEauLAKntyR7T1xppIJR/u1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355462; c=relaxed/simple;
	bh=wKiEAtSxfqLqTn4v47xq9A+3BpdkJv42ne5zWwg3FS4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXAcWK4UB4QhhG51yTRdKLZK7xUyG+GJaUew9gaYkYWtTLkoPqH3sE+wCacXddOclpDiX5exyUMbTRB9UepoKI50VawRSD+/JInB5ZO0jRH0wcZsdnKlR1p2DICQ2Q44wMiHpnbEnUE0ft1kTZ4ZXcnYzkRj5vlB6yVBH1ZthMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Jw2Sl8fV; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Jw2Sl8fV"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-914274b9bfaso832346d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790355450; x=1790960250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bjrkiL4iEq9ZNMKHNSHheXCqmdqWwp0fVo1stfpkbA=;
        b=Jw2Sl8fVtNahxbmS5pEsg42w7kYS6uU6BTEYy3XNiUu8aaua+ig2r8wRGzadH5K7HO
         nn6EPmkXY/RZJGCUATzSNx+OOt7wSYCyfBISSVaHbgQoC3Vey8wca9k2KELDmnKXFgBK
         lkYhMftGZuDpespGI43fgxyKoKljWf3x5smOaX/NW2nJd2HCXqypTdQshjtttxhPsTUb
         OCj2jxBmWm6yFzXF8aV246OWGd3v5nHcF+487/JdtEWBTJUH+jqPvNsmJD0e3/n/+Muq
         VPwDLFnSDuobHjUn6VYnTCOL+LUV+m03/gVibkJATzTNykKwzCuUGgtAKSZkbhv6ukrI
         FfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355450; x=1790960250;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bjrkiL4iEq9ZNMKHNSHheXCqmdqWwp0fVo1stfpkbA=;
        b=eFzbhfzf13t+FXNlusgT1tu03yJbpy1RU/fGGuNXvETFW4ueFMkil/fxpTVYK/SwQF
         nB5QEmjobE1Lq9EHOXuwES2K3XM37/qFjhEIZwLLAHHpkn+1K8FR1anbpR3Y33Xdr6ig
         80wWFXtCLCCfYF8WyJdECklgzxdq/SHH0OQ1CFujSH8cUCq7nSf4hjcdOvMGfTyRxFrn
         RXe3cH4KF0Md8e1EHVG70zeGVgKlM2e6E/2+YT9BW+Cw4N3/LgYk0o+k5QhaynETXhUS
         Ev0KwHdYicfhNENUPZ5tE43P+GgPYa4S4G5+0yqkcoxGbZvL7SOkPiKCx2iZ2p56OWUy
         7J6A==
X-Forwarded-Encrypted: i=1; AKwUvBwfh4jMN9Vf+ZUkczmiSXfISb/QzQ5PN5JO3KlqWn5Sb7zUtbEaFtt+1LSw6GDydi8nlLCGAFEnfNyolPk=@vger.kernel.org
X-Gm-Message-State: AFuF++koua4vJ3QCtuCUdGRb3n2nOryZ4CGkL1yRNYZPOAWOwjyrCoNa
	JgPwYtt3ddHdjpyL/IyDGJf8NoNrBlWDKOPTuNNGfcLbWqJvUKzYpcJMz/IE6ghb6YA=
X-Gm-Gg: AYBFou08My4I592M+8G7dvCcIVdD6eJb/1wKlg70qXWO741NzoXV38tkiBiMCsR5Xpr
	gFf+Dn1tV6+giXjipypAZgD10TX0QXzJpFG4UQJu8xNen5XHUF+wNRFoBfyyj6ZQvKTqcCa0E7j
	TMyNyNw3swAn37KtzETrJqhTLaxZ4ToY/pKQ0D7PxkJ7G/thrqnVx3JDiwCSVSzeI2NFJguo+us
	zbDwOYvUqpl61nYkSlHdmjx5ZQcY4IeYYoHjDWXALzOD/QAj2UjKtKlRx6/wRjKfMvr2620W2wj
	AYOax1/htN6znRlkIrXMoFKxq0TXetGHJZa2Fym6x2SHifh69KRYeL9nTzY47gheAHsxU7BJT7z
	/4jO95R+cf21a01oEOPo/rQNwOgVWnq1ImRtEmKXcq1ZCAjYobUj+LYR10EOIsrfTeHBvxoHFFv
	XvCBcapggJwpxJ+M7QHgk/tpnTq7HTLMxKfrRLhEkGej9dMOD9iS6ZKeoJ4DwudkGe6yy9NsXiw
	WPubxyQxxE6Aav1STGSfOqtXHc65q9ZzE5jsSZqKYDWxQnOm8u0ZA1fYXKG5/SO5Q==
X-Received: by 2002:a05:6214:1c8f:b0:912:517b:7be0 with SMTP id 6a1803df08f44-9142f9ba67emr60909446d6.43.1790355444970;
        Fri, 25 Sep 2026 09:57:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9143a7f3062sm11614896d6.8.2026.09.25.09.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:57:24 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:57:22 -0400
From: Gregory Price <gourry@gourry.net>
To: SJ Park <sj@kernel.org>, Bharata B Rao <bharata@amd.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, jic23@kernel.org, dave.hansen@intel.com, 
	mgorman@techsingularity.net, mingo@redhat.com, peterz@infradead.org, raghavendra.kt@amd.com, 
	riel@surriel.com, rientjes@google.com, weixugc@google.com, willy@infradead.org, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com, nifan.cxl@gmail.com, xuezhengchu@huawei.com, 
	yiannis@zptcorp.com, akpm@linux-foundation.org, david@kernel.org, byungchul@sk.com, 
	kinseyho@google.com, joshua.hahnjy@gmail.com, yuanchu@google.com, balbirs@nvidia.com, 
	alok.rathore@samsung.com, shivankg@amd.com, donettom@linux.ibm.com
Subject: Re: [PATCH v8 0/8] mm: Hot page tracking and promotion infrastructure
Message-ID: <aranZV13vzTHR8cL@gourry-fedora-PF4VCD3F>
References: <20260925021226.52kpnmvfylw73dz4@offworld>
 <20260925095039.48831-1-sj@kernel.org>
 <20260925163051.vuh5y33xemwqgohc@offworld>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925163051.vuh5y33xemwqgohc@offworld>

On Fri, Sep 25, 2026 at 09:30:51AM -0700, Davidlohr Bueso wrote:
> >    +/**
> >    + * damos_add_folios - Add a list of folios as highest priority target for given
> >    + *                    damos.
> >    + * @scheme:    DAMOS scheme for the specific access-aware operation.
> >    + * @folios:    List of folios to apply the access-aware operation.
> >    + *
> >    + * If a kernel component finds folios that eligible for a specific memory
> >    + * management operation (e.g., CXL-promotion or demotion), execution of the
> >    + * operation can be requested to be done by DAMOS using this function.  The
> >    + * execution of the operation will be asynchronously done by DAMOS worker
> >    + * thread.  DAMOS features for resource control (DAMOS quotas) will also be
> >    + * applied.
> >    + */
> >    +void damos_add_folios(struct damos *scheme, struct list_head *folios)
> 
> Considering chmu alone would not justify a generic mm interface, I am more and more
> inclined to go with the chmu <-> DAMON option (I recall your presentation) + do
> NUMAB async (1 and 2) and that would solve most problems in a practical manner.
> 

The major pushback on NUMAB async has been that there is no good way to
charge this work to the cgroup.  

Shakeel recently posted something that might help:
https://lore.kernel.org/linux-mm/20260924184714.912181-1-shakeel.butt@linux.dev/#t

But the approach does not generalize for everyone (see Tejun's response,
net rx).  May be worth a look for folks.

~Gregory
