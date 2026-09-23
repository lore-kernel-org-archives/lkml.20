Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F803E3C5A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195986; cv=none; b=BWTItWBnXZ0dD9ug3GkKj81WOZcTO1DiGdUXPQX38SABoYVQrgQqQrwgyerY+44vwwwfUe5vePHbI3NiJih0/YV1BxL5miMyB5axPEYD04eDRNsPyslFmkOaU5kv2O0+QfJRYpWGKOaL1lba76d+moQSDN//jsAiUXQA8ge7Wps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195986; c=relaxed/simple;
	bh=1dMUbIU4cz45syeZkbkaeNUDKtCsVRA/3oQeD1OjuFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rajic8eDoG1R6cpEtj0kVoqUKU2SY4IgflmyKgM/W5LTN05SNCWEIFAc0rLHnNEjFQM29SXKPm0Yr7CL8d4nJuURU5CV91krES+WbF1pqBBbRLL0mYl7+H0SbElVJqelCRt9giTHveIwzyyBNkDlT+fkuewcqDCdMT7/4TK/7+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VG16vlj7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VG16vlj7"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8facae850so23785ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790195982; x=1790800782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=86r11YMoYMBhThYHSHnVz/U3j9Hq+7QI3nxXrPLwCTM=;
        b=VG16vlj7IrYEzcLM46y4uvkg3Qzu5JvnfuYWXUT1tvBdptc/Ms5p78H5RmJpTZwShc
         2d5g7AosDY420bvL3ap6MWAlH/XfJpgUGIBDF4oqiJcFYxS2BfmUqEwnMkjo7VttUqYq
         i30NLz8/SfWzSNuhjfzzwOaKZmU6D+srYHnJz/te0eLkoRme0jDYltND7etSDt3yICge
         8xeUb6jOaNshC9TibxTK05a18mGjAS21iztL+3Sfmeet5U6gaIr+i28Axc3V2oNednBr
         qE5Zx2efu6zBKrPCcx3FmqCZ+GEJQkzjPOLIbVP/fUg6aMxFQOQGSCb6lC27EXQ9Y02Y
         k03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790195982; x=1790800782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86r11YMoYMBhThYHSHnVz/U3j9Hq+7QI3nxXrPLwCTM=;
        b=vee+MVSsXmdeURvPZra0xIVIhJ0mvLsOtE9EXtv5TZz2me8udnP2CxcsphLtMG4HHg
         3GzMKY778ze9Pnc1kaCXvX/0KABlsmaN6z4+Dp6e0xohI8wb4ZcFsZIYc38+DffeZUBm
         j15OZ2w55jtJQuMdiMupV7sZ6QExVriH+NO2IRQ2Mya1F5eBTIVoUmb2fFOoCwYbVzjx
         ky56B/ytUz0QbTk6kbh34SmA6rNMgbFp4jLmufXUqEXujtRy/+hH8BJgj/X0zPtsi313
         u2zzhU9iC6PDuiI58uv92Qpysi7IvvJJwQG8gI4hIQ0gJ90kNoUoWYntppkZBIlgEgaN
         UWBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhr9ycaxgEmALlftPnkM3dcuPqxV2dPE6Jmvzzfqo6lWuvAIJ1h0b5SPto6oPaw8dwUQZtwui/iZYjLnI=@vger.kernel.org
X-Gm-Message-State: AFuF++kzKOi9rxxQ74YjTbooA7hsScJzeMNmvh8LpVNivwxV8cac2ug0
	ptM/qtqaGhS00lNpHBLFYsgXzfuIPzz4JwqP4rLz4mFce+iJoOIHXJmuxIwsvGXkxw==
X-Gm-Gg: AYBFou1IN+3YAVE0y55KWmG4n9CWGLzsu/HVjqbIVxRwmx+uSQXPmhm18drCUTK9wgF
	OyUx4OqvFqUNwC6fsxbRNPKVXoO8Kj7/J18EWZi9cAiMTa/KpCeN/hmClhIsopuAZvP+qyqppXH
	zGe4Rh9eMgM+3N3IGUv/hDjBKL5Xo7YPG97K+3ytgAZdTr8smreXQWYoKrugdus/+gPaIh2XaWC
	zgDt+bSTDoZzR0YauhdhlPoQ+9IfR3enbemScDSE/AbXGxcmBJBfLvGZR3twmK73xFtbOufS+6z
	3M7MFtDAhAHEaEjvjkQWxoTf7zm2Dq0Dp/yssYJQ5GZMwxUnWKDPXoqRnwDI+5RO0apcs3PpnXn
	qpmc8os/+AlFXyB2SFfI/cMmTptrWm6JMMY/F76mddnAAsQYXyVUWkbH0qUZjgnodpDBK8djxjS
	liM6BLYjm4Kt0RNIqhH7w8JXEpCqDqQMVkI+OKfbxDXyz0RA+2qe7vu8CxU/ODcXCPzdQvKOCMC
	SO3VUYK5X/g2SbJfiSE70vSVvxbh4QBPj0LTZHJBf6judzqVQ+SImcKWPcLdJeT+w686WcPUk6G
	nyyYMKUQSV1pj5hGqY/9O53tF0LEmhTTSmfFXAwd07ZpcV4=
X-Received: by 2002:a17:902:d4c7:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2df7afec6fcmr1972195ad.2.1790195981221;
        Wed, 23 Sep 2026 13:39:41 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09773e7c3sm689822a91.17.2026.09.23.13.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:39:39 -0700 (PDT)
Date: Wed, 23 Sep 2026 20:39:35 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Hui Peng <benquike@gmail.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	brauner@kernel.org, aliceryhl@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: forbid VMA splitting and mremap on binder mmap
Message-ID: <arQ5B4Yvp1tUOK99@google.com>
References: <20260919213653.3317260-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919213653.3317260-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 09:36:53PM +0000, Hui Peng wrote:
> `binder_vm_ops` does not implement `.may_split` or `.mremap`, and
> `binder_vma_close()` unconditionally calls
> `binder_alloc_vma_close(&proc->alloc)` (which sets `alloc->vma = NULL`).
> 
> If userspace calls `munmap()` on a sub-range of the binder mapping (or
> `mremap()` to move/split a sub-range), the VMA is split into two VMAs
> sharing the same `binder_proc`, and `binder_vma_close()` runs on the
> unmapped half and clears `alloc->vma = NULL` while the remaining VMA
> stays mapped in the process's address space, desynchronizing
> `alloc->vma` from the remaining VMA.
> 
> Implement `.may_split` and `.mremap` returning `-EINVAL` in
> `binder_vm_ops` and check `vma->vm_start == proc->alloc.vm_start` in
> `binder_vma_close()`.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

This is not correct.

Also, this exact fix has been previously sent here:
https://lore.kernel.org/all/20260901205250.1638304-1-cmllamas@google.com/

--
Carlos Llamas
