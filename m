Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793232285;
	b=zexETwPuTVSmX19MvvUTewHjJj0sOLD4hyPsJyiJs5YkLLPnZ1/UvxJg3+wyPCwueN+j
	 gz2jBcpxUxeuaUcuumGfqxtrTOLBKixlp9JAnIoPXpXcm7DXnsRE7Q/TW3YfhfxQ87spM
	 EbSEiPkyXC8FJjqoGVils3vRrsyUg8CZxZsahd59UEK9Aah0Qly7hystp/BGyOTQr+K1J
	 Wct7fJvqTKZLFE+M+8aUvENrTkP9Dd6N7GWSKlYPeR615P0gbbg9E/nuIvGjsM+3+dI17
	 LqQxQEPJuOITV0zgbHmH+zFS69qdS3RFUNbeJkbre5VqMmy+sIpDiMPkmx91BMd1HYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=q/xBVtBLk16U8qItuEo0/3JxmIlfapOJCXoA5AObKSA=;
	b=Gu7e4TG3JkYNur1TX02Qi2iDsWj/S5R5fO40y+HP5qIsdTiT3U5uyVNTKuoUI6TRoR76
	 QClgtMj/rK5GblaXanohNko8rYyVzMpLvHwuSc45bK/vBBJyTQiPwNQucF5yLTkvzMoA+
	 2t34l4AB9RJqMdhkGJjO1jpkDVCWgL6ZmE3inIeamudNRTP+xuPQiuWHUge87UGyH1EzM
	 LxOjGdQqWEzNa9n5beUei1LIu2Nb7nQ5xsH8c91ySneqNuIrEv7dHL9EHvLdRxC9rNV+f
	 Y9X9ntpGFZCNSa7BWRHfz+kVGs/7DOxWvFE+Wip1svCQCxvDy5cHf4z4TNMQ3Y6242g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BDLaQPpE;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96552606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96552606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BDLaQPpE
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cb6dc850c7so525713137.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793232283; x=1793837083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q/xBVtBLk16U8qItuEo0/3JxmIlfapOJCXoA5AObKSA=;
        b=BDLaQPpEQkC/NOGErHzNgMqNEFgiZW+qixJDZ5RtDffvwjsqxm93mYTldZW4Txe7YC
         KOlzFcRPqQr1N7PzdaxoW1U9MQgJBHjgARqwrgxXEZIU7JNfwIwgLxfO92G6pOC4G4rk
         4OSF6jFiqrA40z8orm3/UNdvF1RJjCFi7ClJV0vWr8MykRtBgdBxnizZAivW6aZRN3kx
         l5uvOty6CRBiTWGUrkgmOuKvd2MUI35gla4/qmesv+YfLyi3mwck9NijjEVz8zhSCgxi
         pcgFazOCNQkh0LbGTfZyXdh3RejNnsqgBCJkWvDATwo+Kuk2B2721o1lMZ/ETjyXrhG9
         LPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793232283; x=1793837083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/xBVtBLk16U8qItuEo0/3JxmIlfapOJCXoA5AObKSA=;
        b=Cl95OMmckF6JZ3hLp/yMv0K70K6tGaXtYpGGLycbMT5v4YSexyhq5x+6InnMmqWGaV
         SpoOyBJLZ13DIbVzOtELcHRo4MvlPD7mopWDpD9urYfXr++DK8gQYPu/WrhOIK3B8z7X
         m0Nzii0oi8tOxyG6d8Uup2+akN2kT3o4bBJ+mSyKKuG/pBHkwuTExiYErKK6HeWrIK1x
         gGfHhxB/4xkc9ivgTy9DZIVdhbaVWHzPJmdA/6GBxVq72ggi00FKSzPbWKITXnSKXIRM
         0bYjOYAxXbVKR+UMSCNxEAN6fQu6NCbgqQUTXLkyXFZM/vbKWNAeyStcvOHvmoKgLjk8
         kiqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4JFoACRPeyPwGTMnWGpvSzqdin31ZjamZncIF2nYwHK2YWo67eqAODif/f+lK438+2/wbUwyJwY+Cxus=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB1wZ9YkyJI66zglyO4HLhZPgqgQDBztyxydiRnh0y7b1xoEYo
	KyeaH/CNqDIDhuuWZ3ZqtoNXclleOQrvm+cC2N3rJcLKBY1KLYcPb6M4BE9KcPIJjOc=
X-Gm-Gg: AYBFou1CbVnCBD6f2PPT7d8T/Dups0AiAvRaaZCdkauuNUNVrSKNB9NWarBAaQXRqy+
	mtOvQTCehrWJuLWy7jWAGBcdtIBUpdMqy0WzeWgUkNjdzyCldpLJL8QZpAP+fQdZ9lHIlfGoPaU
	PI7SYkBRPOLsBv5SgUid8Q6IIDdAYuR4/Fe9XutRUyyk9pHX1Zc5qtHmyk64EDO6ZTYAZ4p63lw
	jP/jtWpUS1klrEGGQe0RwvOWw4Lc1DyQANb+rmXgawxU0q/m+W/6JppwBf461QU805TJrhkCnkF
	uZbCd4NNUTOCHjMXDsMqfb4NVUTcckEt47Sa9Rum8DSnpK3Zc+ti6MqkM9GcpYnBvVmtUFmABTJ
	mkifFyn2A/U814qwOE5eTZk0ZN4pgL5jdhZTzAsXGTrBe1uTZEhjSBDrYLqr6zshTfsCDdn7259
	UtelTPzCZ0gNd5V/8z+OI/BCKEmq+GEFOFLavUEY3O3qO7V4/oXIOb8IGgR0UFt21kLaLUAXdBg
	NXDiL0yt6dWDdFfIJSUFY0YhNoXsSqLhFBtU9SeMwM7Kp8BAJCwT+xF+5O5uUcRvJLYRMxUdAIc
	Y0Nryr+1Ck4P1ZbJ0xj6rZjqqNrnQSBqiJ3qX0NoHRKOPstrgH4fbXSqZgcxiUH4vdUZNkCez4o
	RYN9bdn2xOfEQWS+COcmRxYCDpYVy0o+e
X-Received: by 2002:a05:6102:3e92:b0:7b5:1ca4:9df1 with SMTP id ada2fe7eead31-7d03a29c54fmr1908368137.5.1793232283543;
        Wed, 28 Oct 2026 17:04:43 -0700 (PDT)
Received: from google.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99125931983sm7622737241.2.2026.10.28.17.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:04:43 -0700 (PDT)
Date: Wed, 28 Oct 2026 20:04:42 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 07/10] mm/shmem_luo: Retrieve tmpfs files onto a tmpfs
 mount chosen by userspace
Message-ID: <auKND0n3LyivCrir@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-8-dmatlack@google.com>
 <179322496574.1894369.544573858973645958.b4-review@b4>
 <auKAlcPN0Lt6Y3Wm@google.com>
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
In-Reply-To: <auKAlcPN0Lt6Y3Wm@google.com>

On 10-28 23:09, David Matlack wrote:
> On 2026-10-28 06:02 PM, Pasha Tatashin wrote:
> 
> > > +/*
> > > + * Whether @inode is on the internal shmem mount, which is used by
> > > + * shmem_file_setup() and thus by memfd_create().
> > > + */
> > > +bool shmem_inode_on_internal_mount(const struct inode *inode)
> > > +{
> > > +	return inode->i_sb == shm_mnt->mnt_sb;
> > > +}
> > 
> > Please fix the warning reported by kernel test robot.
> 
> Will do.
> 
> The prototype for shmem_inode_on_internal_mount() is in mm/internal.h,
> which mm/shmem.c only includes if CONFIG_SHMEM=y, but the robot was
> building without CONFIG_SHMEM. I've moved the definition of this
> function into CONFIG_SHMEM in v3 to fix this.
> 
> > Looking at this together with Pratyush's mapping-freeze series ([PATCH
> > 0/3] mm: allow freezing mappings), I think we should extend the mapping
> > freeze lifecycle from preserve() -> retrieve() to preserve() ->
> > finish().
> >
> > When retrieve() returns an fd, its mapping should still come out frozen
> > and only become fully user-owned/mutable once a successful session
> > finish() happens. That keeps the index -> folio mapping invariant across
> > the entire live update until every fd in the session (e.g. vmfd,
> > iommufd, vfiofd that depend on the memfd) has been retrieved, passed
> > can_finish(), and been finalized together in finish().
> >
> > (Doesn't have to block this series, we can do it on top or as part of
> > Pratyush's AS_FROZEN series.), but I think we must fix it either here or
> > there.)
> 
> Ok that sounds reasonable. Should we do that as part of Pratyush's
> series then?
> 
> Pratyuh's series replaces shmem_freeze() with mapping_set_frozen(), so
> retrieve() would freeze the new file and finish() would unfreeze it.
> That should work the same for memfds and tmpfs files..
> 
> BTW, this tmpfs series does a lot of renames and code motion so it
> conflicts with Pratyush's series. How should we order these?

Initially, I thought Pratyush's patch series would land after yours. 
However, since he plans to separate the LU changes from the rest, I 
expect both series to land in this cycle. The order does not matter; 
whoever lands in liveupdate/next first, the other will need to resolve 
the merge conflicts.

-- 
Pasha
