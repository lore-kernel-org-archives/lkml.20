Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821526;
	b=oTzUl3CCW/ikng6De2pmzNKM1/ts/jTK2FEu+8euMRGotIkPrS987lHX+7XDtLWSKv7n
	 U0OLH4ieCFWSuzPhhHsjfo+XkkCYxisBo8hh3F9hOUqFzy/Dmezr6y95Hw8/SB9TkQ48U
	 TlT+k819R/rVrCq4P8djF88zDjnVBD05tfx6cgWQ6PKmLMArDwu7O6vI1tMYbbhqy9zrs
	 jct91dioZ4lSXwylALVAlaAfe9I1AhUYWT2IRCZ2MuE98uvECTmYrZfed2uNDf+XGfZtC
	 EAvnpV1fFT7JkTLwW+hY42zeKZyHWdVmAWKxQPHdVppI1hPYU+J4GEDISY16gzzu8nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AhauLcYrkNfZ4d386lPMrnU0qCgiFUOVmgX6lCm/lmo=;
	b=Sh5xAuVPmDaPLHg8VfSU3vUtaK9UYtpkaaDz0ukIvACzs8KOCyKm9wJpXpCZiEUG6b1d
	 WQl5T8wy2W076aii0XenZjpfjOqNrX2W8ytV4d2CgBTBKggUSlSJwjOuAvnVFwiLKjbg3
	 fv69WgKLMroemz84bqDpBaEvv0zrXOCcAAGYbNsWuON8LLNWRKOAwEfCVPByQjh05oWNT
	 7QKyuDak8s6mi+aDNBo3dc4RNO1JA3FR08oJpKmSrK58G5ADvK/VD6UuGyIHj7yxriF+x
	 bVdDgohOfH/fa8lxhoEWSTIEcXMH4HRyALGmUJkdgH3kP+434kY9w81Mb+yX3+Qnhjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lG0uqyiu;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A869608B6D3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A869608B6D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lG0uqyiu
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eac01ff101so439860e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793821525; x=1794426325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AhauLcYrkNfZ4d386lPMrnU0qCgiFUOVmgX6lCm/lmo=;
        b=lG0uqyiuuUAqo7RKk2241aZiwkERDdTq9CFMtWJKxOGgQLpx8gBjH7VMCsDO+uZ/Vx
         a9uC6sbmuT2GLG/EeDN+fd7YzlNsMtzdIXq7rX4mvgjg4bBIo3LfUDpNLp1kWwadQqI7
         cCiXv0nhxOm8cQRelxiQtn4CDdbD4rqbNshRbQgIq1WuZYDhTI2fUE+yrQBP9MxheXPD
         G1jXZ2NuC8NTT1RByKKaGOUcUOugyFJi3O+6eqHELPA/Ujrl1MNdx947B554kp3gXa4q
         6zqoyq4/smnAWstXgXLUAvfQca08r7OtfcqbZvQtbrqJ0+KBfc1BGzExUYBOpgGd5FJQ
         ew3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821525; x=1794426325;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhauLcYrkNfZ4d386lPMrnU0qCgiFUOVmgX6lCm/lmo=;
        b=U/lP/genyvGXYfJy+0jx8XU33UbHCxzH8Ob4Y3fw8KjilxQb+O8eCDl85yOt00qZ8a
         +NYLw0QRi8jwfPIP3aM3nisJuY1Dw0QE7AN/WUsylbNn0gTc2hjfTHQ9mglH5boSDq0p
         C4zVORT+ubCBGrDg9/Y1Tt/H+G9lSEyevQangrMAAx3NAM73owQ4y5D7PyRruT3+oR6D
         OG+A5SXRM8qlm4k0nGOmrxzwu6TxTVhI31fhPTLmsZ309gJsqbHNXsOwmQ5C2d7/xh+D
         r7Dm12ygbwvGXNofJhv5fCOqc1Yf6lCmnpSbfk0d9G1lm69STd6/QVAcERQdnYjAlQrr
         5QSg==
X-Forwarded-Encrypted: i=1; AKwUvByQL+4kDByXhsPLt3sU/nG1dSIt6FUJvIJt4sUXz3DzizBQu/T48+fgZ3kEv8T43Ff8HecTQZB3lHHbwow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DOGyPuQtlELa0jMq+0WJfgZPPubh+EKOVF8uVQFM93qlYxwTC
	3tM8eO/DhIIoPZ6wsBV+GyVun3SqXodhHfRRgb3sgoDicQfIBgCnSserfzDgO+8YJzg=
X-Gm-Gg: AYBFou1Tgwc1WP23ohgwJ/qPyzIpw4w6E0KxKpI8Sz0l9B1pqVFdj3P36sD1fBz/rmf
	RhjITH7sY+VJdfQjl6yUHxEnMFYamkEK3g0atRVASTTNvWuyfS4sVvHTP4jKO4bP1NIYGGvKL4h
	PCTd4bAEeHthHcjz95gVuZxTo/gD1Ymsrxt5LwHgpFoDtcfquiblPzqbL3LOaZmMJU2Gr+QwVrW
	e+0b9niek20nUS3D/plD7nqUdFBtm28OiC+q9PHyLm5NDxAk/a6h5J3g0PuWQO9XBYScNyPI248
	AoFf8K5r+U5p8n+j8BfsW10VFg9fj0N3ETc3zU9ukkD2DuFJMZMUYEcC3L8UCyY4VKF/Yc0rWBB
	M1Yv6mSflI/94VLcpo3yDiNFUGn/iY1YnFeXS+IKGLI0sct6uWYyygWeielXo9vKUh7KylaP4zx
	mBccJbyIo5sBxtk5o71evXsVEk3mg20ZhfuHQmjoJW05lQqug7omeD2WwOi2sN6ywOYxO7AEBgD
	Nb8dERS07zDlXreUviZBq4wCikKghCyiPQCi8VXP23MnjS7MKgroC8yHAJfzWB9owDbe+dk5tXk
	/fe1kMqpiY90Anlus8Uyio3E5IARBKe6ZV3pWqUBJtrSFtSQziNPQ3Gc2qqawJEhRFTtinNNqQX
	heXmt7JSGiv2UBeNeqD1bjTxdjRnC
X-Received: by 2002:a05:6122:54e:b0:5e5:29f7:489 with SMTP id 71dfb90a1353d-5ec6899f507mr7074700e0c.22.1793821524335;
        Wed, 04 Nov 2026 11:45:24 -0800 (PST)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca889381asm2496927e0c.0.2026.11.04.11.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:45:23 -0800 (PST)
Date: Wed, 4 Nov 2026 14:45:23 -0500
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 09/10] mm/shmem_luo: Allow retrieving tmpfs files with
 O_RDONLY
Message-ID: <auuJ4msatqzoOrjN@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-10-dmatlack@google.com>
 <2vxz5wyck08d.fsf@kernel.org>
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
In-Reply-To: <2vxz5wyck08d.fsf@kernel.org>

On 11-04 17:52, Pratyush Yadav wrote:
> On Tue, Nov 03 2026, David Matlack wrote:
> 
> > Allow userspace to pass O_RDONLY in struct liveupdate_shmem_retrieve_arg
> > to retrieve a tmpfs file read-only.
> >
> > open() requires write access for O_TMPFILE, so create the file writable
> > like before, then reopen it read-only with dentry_open() using the flags
> > of the writable file, which file_open_root() normalized, and drop the
> > writable file. Like open(), which grants the requested access to a new
> > file regardless of its mode, don't check permission for the read-only
> > open.
> >
> > Retrieving a file read-only allows a restored binary to be executed
> > before the session is finished. LUO keeps the retrieved file open until
> > then, and executing a binary that is open for writing fails with
> > -ETXTBSY. Being able to execute restored binaries right away matters
> > when they are needed to finish restoring the system, e.g. to bring up
> > the services that retrieve and finish the remaining sessions.
> 
> Can't you put all your binaries in a separate session, retrieve it as
> the very first thing, and then finish the session? Then you can execute
> those and retrieve all the other sessions.

This is a good workaround. I am not opposed to this patch for 
completeness of functionality, but if we decide to keep it, perhaps it 
should simply be squashed into an earlier patch. The current diffstat
looks bad, as it mostly deletes code that was introduced earlier in this 
series.

In any case, given Pratyush's suggestion, we could also drop it.

> 
> Why do we need to support this in the kernel?
> 
> Also, please put the motivation as on the top-ish of the commit message,
> and the mechanics later. For example, your second paragraph should
> likely come below this one.
> 
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav

-- 
Pasha
