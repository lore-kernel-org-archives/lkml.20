Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793228957;
	b=bm53y8QEPE6yORsSVdcNedk1i7w/XlOhd6y9PA+bUead86Fx8TbmQ7RSl69uSXBkwUK0
	 7QvXz8OiOpQnePyxzXh7VYb58HOcqHbNqs2d0x5vmYcTif0Vcmbmk6ToNyKTIoCrZ0Y9N
	 5COduXJjBv5odHDsmgEyZ/JWdnpMtmbe8EpAXXw9+y/LufX0alBvsHNzc0c0HujLyste/
	 9C6dPad752iFjRM2opITQ9Q0iHneb9+lu/fhwOXEmASHA83Hn84rIAf2/e/WMf5mwGJFj
	 cmETNFH9PrmhrOi9lzBr9gzVJXWAulu8DG8N++ZcsR4gl3DSpTWy0n8KTdLj4QOMRbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793228957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Q5xA2wRJBQ07Qo768sQziuchQxKB2Cjd+x4z5GHdG10=;
	b=pJQLDOhBX6pMJWm8T0F0OxugDGQEIz8OvnFbY5lHd56qn5K5Gk6eosYfGrw6IYV0+P0b
	 hwVlAep6ZjJkmvkrwdXJirubcwDB47U6gt+7qUGYT/0le39klcqzlK+Wf1JnAvQq80wXb
	 F55EIN1xqP7GXGogQHT+CY2PfKarHP8Jgv0zQd+2q649Cvi7wQk3orjMRfox1V1KxZUfn
	 dnLeXpBTE9YmgPU7l0i60EsS/oFrPPXwtKrNGpdg78TZ2EBkl8Rc9VWNqHxrrm/6VA7H7
	 qhrg4CaGz6QcrTypzX83VsR9KW7B5ghKNHUKjNNCuvDlc4kGwBDaTsFsvYjFbioQO5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LD13kIoF;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6313E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6313E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LD13kIoF
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1345608a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793228957; x=1793833757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q5xA2wRJBQ07Qo768sQziuchQxKB2Cjd+x4z5GHdG10=;
        b=LD13kIoF39wTxqw9o3IXuiCEF3PlE80ON1nRPtW981M0eQIQFG7esf/HPU0iVX9Bcl
         sfUAYs7fiMaAg2JtLNApz33JHHP+72/FcckuQobdxG60ySGLr+8q/wfUaM25AcV0VApQ
         QszL7Lhg5JUn6mrCU1nvRJ1kqQpb6rVbMDSjpIo7nFQ/MN27abrFiQ5HTW6RkWUNAve6
         MDaEvFgv2Eki0M/G7Al3k13DPPm+ArFUNczeX+KKl8m+i35Iukf2orv4xMQt6sn/QShU
         eOqXh9YcndUD4/vMIUHCoHBfCdyInOCrPBID84xAj3nSBIGUJpE9eKdVWjcP0zU/hkDX
         P33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793228957; x=1793833757;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5xA2wRJBQ07Qo768sQziuchQxKB2Cjd+x4z5GHdG10=;
        b=QDMvMHUN82CLCsgOyBdHooMX7On/ku7SiL+45sAkJsLsycX2+oveQYoMljPcVPMTWq
         Ks1qJxngc5PtpLzwUm+jieZa2yjdxlMJ6JBKn7CxPG1LXFIw4eXAns7F56Tpc2HnNGnX
         U8ZPYa/YhrI5UCoWL5Vde0hDXSsXoSBBiAOzl1BBaO/b2stQNs92hZ3oMtyKtBrOMN18
         VnxmVRMc1ZfW+3hS5tpKG+CoACp+6wAjnCLnO5SHYo8hw6PcpshcJ+CNtiHJu8J5gxK+
         xWGS3op6Fxjc9Lw1czIWs3XdUevoug4VB7iVOaJsg7Jhi+HHe73EHM/+HfVstfDAYovS
         i5qA==
X-Forwarded-Encrypted: i=1; AKwUvBzQfCh2oYViNYqadojzy2lgY5mdTDnB+BiAGWMbeH7BsyAuIn35I67qMEmy2joNpmlt4vhlIByqbUY4H1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtAoN7YurLUKqN3VZTlt7ZMTVAgCp8KD1xUb4TZ6LV4zFY+1ZY
	1aWRX/SA4TSvXrEEE46eDMsRAhY3tE47WKiAfRXULsJQs5l1t3wa+rOKMdFDBOnr7Q==
X-Gm-Gg: AYBFou3fS6fkwgbgsFuIBWjo2EoFpA8gA+qPfnyNxjvJc2oovpQf2p4QMGQQXQogRqR
	FV3XYAsW7infaikFTK5x88sJJS/EyYiukh8Jm4BAgoguTy59zzMHv+/ywxnzMF0+oEidOQF8Ika
	E+HdRlmmKPUWASntpzL97cu03ZGezDPh/sgLZqlx8NMeVCX2QFfCJToX/vuBVEMKFIkHeXFNl+k
	P6bf7zvQr7rEwNVb1TBPSpjUc1gpWc9YBGhoxdwEaglWsKuiaprCD30ncKhExteRPU0qtiTNM3E
	lZlDzMftu99qGij7dBfQjSl6gh4NXVEwmxh0V5g6Kflq1EaPN6Hm09YSLC8OBeCySvJJoA7sAJ6
	3Y3gTtuzw72e9YYuBRjf/WP5bW9dmIagCVIlQ+FrLeLWVMX6HtrMHioqUet7kbzukqK2sf8SLnG
	KRFoKGxrwzoQRWDHFkjQcqhP1ybUACkkRDrl5wXpn0QGWd8sK5omUgA+My7rFWZiDngh/FHWHk4
	kQ29DuVlodKhk7+L711WOuvzea7R9NLgsFGMdTgLXihZMr4tQBpi5Ex2uVinATApxtMMQmso7kS
	ssYu2PXqGt46N0w/e1G3WEry+awjlQDQ8eNp87osleh9i8wvMwTjOCGnCwS4kEbtGA==
X-Received: by 2002:a17:90a:ec8e:b0:3ac:8897:7b92 with SMTP id 98e67ed59e1d1-3ae58319f5amr2770048a91.57.1793228956133;
        Wed, 28 Oct 2026 16:09:16 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm1327770a91.11.2026.10.28.16.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:09:13 -0700 (PDT)
Date: Wed, 28 Oct 2026 23:09:09 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 07/10] mm/shmem_luo: Retrieve tmpfs files onto a tmpfs
 mount chosen by userspace
Message-ID: <auKAlcPN0Lt6Y3Wm@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-8-dmatlack@google.com>
 <179322496574.1894369.544573858973645958.b4-review@b4>
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
In-Reply-To: <179322496574.1894369.544573858973645958.b4-review@b4>

On 2026-10-28 06:02 PM, Pasha Tatashin wrote:

> > +/*
> > + * Whether @inode is on the internal shmem mount, which is used by
> > + * shmem_file_setup() and thus by memfd_create().
> > + */
> > +bool shmem_inode_on_internal_mount(const struct inode *inode)
> > +{
> > +	return inode->i_sb == shm_mnt->mnt_sb;
> > +}
> 
> Please fix the warning reported by kernel test robot.

Will do.

The prototype for shmem_inode_on_internal_mount() is in mm/internal.h,
which mm/shmem.c only includes if CONFIG_SHMEM=y, but the robot was
building without CONFIG_SHMEM. I've moved the definition of this
function into CONFIG_SHMEM in v3 to fix this.

> Looking at this together with Pratyush's mapping-freeze series ([PATCH
> 0/3] mm: allow freezing mappings), I think we should extend the mapping
> freeze lifecycle from preserve() -> retrieve() to preserve() ->
> finish().
>
> When retrieve() returns an fd, its mapping should still come out frozen
> and only become fully user-owned/mutable once a successful session
> finish() happens. That keeps the index -> folio mapping invariant across
> the entire live update until every fd in the session (e.g. vmfd,
> iommufd, vfiofd that depend on the memfd) has been retrieved, passed
> can_finish(), and been finalized together in finish().
>
> (Doesn't have to block this series, we can do it on top or as part of
> Pratyush's AS_FROZEN series.), but I think we must fix it either here or
> there.)

Ok that sounds reasonable. Should we do that as part of Pratyush's
series then?

Pratyuh's series replaces shmem_freeze() with mapping_set_frozen(), so
retrieve() would freeze the new file and finish() would unfreeze it.
That should work the same for memfds and tmpfs files..

BTW, this tmpfs series does a lot of renames and code motion so it
conflicts with Pratyush's series. How should we order these?
