Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9221F4FC337
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739689; cv=none; b=RQNcl4jpDYpwMlVKHp/1W7hmIM6mSRiYMhjPK6Yjj2Y7tHyw5fzLjuTfCYaRLr37Pm793Xwdvn3E5nGEPcN8zCZrFs2xGblmmRlnpfcYlarqXYl0lDIlRDGqci3/pV1YQdFCVeHu95jLQ0vJcTelKbwoPG6ViZnH60pzi6R+ODE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739689; c=relaxed/simple;
	bh=HBA4UGDBkv/vn1j9Qy2I4DNOs12GdkwlUY7HLsx5OjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzQAaONBIF7j9W3rv+DP4WcNjWzTjjLbitutD2FKX0cuP2Oh45Nc0EU2eo8mF4wmQBRben+KxcnQ9O/1NTxKdqERFZWWUCf/i5LxxYMh/KdC5Ebq4SMrrBse7ZmrxIAHoKaYZRAkgENlDjGFgFzDPzEIybslzn/n9R5OT6I07Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=b1hWbXqF; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="b1hWbXqF"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939656ff6d9so84356885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789739680; x=1790344480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JQrKgT91q1ivpfGUE5/zHrleZU+aU6ToiCAfQUtBMlw=;
        b=b1hWbXqFKhJCjVHlbXMLM+dvb0Zi1mGM2j3wYECD/ezK1ONNPo+wUzI9Z9Br4KearP
         ZlIonRo58CwfNBjl0XEmFd2K0926ZqQLsfDUaFSaWEqt3m15HKM7d6rxxfjxzbCnOAmV
         pDhfRgiTPa29pkaDkZN8kR3I6xdReqVGUaNNOCZwZPuK5oclmR0RDmGNZCa64QQW32Oy
         cWUrIkHi1EQ2J1OSNqSmhfUDmKdAqXC1VV+XqHg0lj9FF7bS0vW8k83OX/vEoYtf7yQo
         kccfXWvx4uqtt47JYpwVYk8FZDIW7NEYdvHAhwL8Q5TNKM9qJMjtpvwVoBCd4lFUMV1Y
         PFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739680; x=1790344480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQrKgT91q1ivpfGUE5/zHrleZU+aU6ToiCAfQUtBMlw=;
        b=1wVo+/StDsyW05HLuduIZ33NuR2uEmjpzXms6Pj2YKDt+E+e59T9kJXehY7ttX6gm8
         ZvWevhmglGLadKFWuNQXtbVKS+sAXzYLdYUjt1qJv4z4B7GeH8ERw/BYbXqQJ2WKoWWu
         OAY8ZhpcltUGeeTQ6wvQ8Gm5XlgfuZc5rc/pVNtoiR3T7Iw9k93YuhHNPt6E8J5XBkYK
         4tNJ2ocI57Y7I70uhGl+/+FycQ0fWBedHxqoLfUgMHAE/Us6FkIQv4trQwgZBnjebFGZ
         Bzmb6atw2gfVaAA9dcd+L0bJlBSuExSby0VD54IatMkxsWjB9RzaHfY25lXjWjxsZHm3
         S/6Q==
X-Forwarded-Encrypted: i=1; AKwUvBytEIbYAo6hUFSdLmnk4TtaU6Rpkpj/tpOBDrvlz8MIiploCFfT9Fg5wISLQ5qwe/M28OObNGizsgO1eOM=@vger.kernel.org
X-Gm-Message-State: AFuF++ljLeDHwIzndllPr5z8KvQGlWD3jCPsOpakMdWjaoNiH842AfTQ
	o+qJw6cEV4cGGkM/Ib29DFLQkYakhWKeWLjhPB+W/h89EqHPvufHCKVh3DJKKoj9WWo=
X-Gm-Gg: AYBFou2tsiEuOhe1GhRGa1FJ043rPj1N2ym+hsByIclm/rf5luB2WRkrP0O8nXfffEV
	09tQoR6X8NdfsdRctWRN4jKCBzbBR5Fi1INl022v2/t96k/mRxc3qTOTqAf6XeYxjcE6jVkB6Sv
	2TYKBaeLDqd1Hp8LPGnvH89TO4LZWqFjdx7cYDtFNB7Sk5yOMbNtv4VLf84BwDFW30WurvfmlWK
	KcaAwKYj6havT/zs17VlsjWG79EpOKZ0jcWKfxxtHGWAekd8rBhu4vR7hzkGBJfWteDxRbQxCYn
	9Ikdb+gYcSlS4OegLllqGrCDVJtDoZUF/iC7OePDj49X24k3qWc5tyYCT9A1/cceY7gegkg7oB6
	2nYA5+wS8q4IxKYoK7trvKIaSp9zfrD6DXHMt4LxYLC1Dk6OUhU2Dmq34A0DjunE+wR9ldd3wJW
	wdz+9Mhbp46wBOFX4k17LQ4gPPgjYRl7UV1zGYtUSow0Mzcf8OcrCrZjeqmQGwlE0FkUUSepYuA
	Hc1QCF+XRCG3cdY5WNjdk8DJ+zR8a+WvKVxfnY00TyFi76daclFhkY=
X-Received: by 2002:a05:620a:2806:b0:93b:d79f:d949 with SMTP id af79cd13be357-93bdca2c16bmr338384985a.62.1789739679965;
        Fri, 18 Sep 2026 06:54:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0ea6560sm145221785a.24.2026.09.18.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:54:39 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:54:37 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, 
	osalvador@suse.de, hannes@cmpxchg.org, raghavendra.kt@amd.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] mm: allow shared folios to be promoted to a fast
 tier
Message-ID: <aq1A90ltg9Qn6pWZ@gourry-fedora-PF4VCD3F>
References: <20260911001826.2109390-1-gourry@gourry.net>
 <20260911001826.2109390-3-gourry@gourry.net>
 <41b46756-ed02-439c-ab72-e32a84fc7f17@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41b46756-ed02-439c-ab72-e32a84fc7f17@kernel.org>

On Fri, Sep 18, 2026 at 02:53:40PM +0200, David Hildenbrand (Arm) wrote:
> On 9/11/26 02:18, Gregory Price wrote:
> > From: "Gregory Price (Meta)" <gourry@gourry.net>
> > 
> > NUMA balancing rejects shared copy-on-write folios and executable
> > file folios mapped by multiple processes to avoid placement bouncing.
> > These checks also block promotion from slow memory.
> 
> Right. How to we know the direction of promotion vs. demotion, though?
>

numa balancing never demotes.  It either:

1) moves between sockets (nodes w/ N_CPU) (NORMAL)
 or
2) moves from !top_tier to top_tier (TIERING)

Demotion is only enacted in reclaim / vmscan, and has no coupling with
numa balancing.

> > +	if (vma_is_cow_mapping(vma) && folio_maybe_mapped_shared(folio) &&
> > +	    !folio_use_access_time(folio))
> 
> 
> While I understand a "!node_is_toptier(node)" to say "this is a slow tier", I am
> clueless about the folio_use_access_time() check.
> 
> Confusing.
> 

agree, and agree with Zi's request to rename.  I can add that to the end
of the series as well if you like (avoid backport headaches).

~Gregory
