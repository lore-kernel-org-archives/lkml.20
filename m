Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC094908BD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154487; cv=pass; b=aIJsMEUYPUNgPwkGy8sqw0yIT6TTuVL6uvKCZZnKY1v03N3bTTX1aMi6uM4pq+wXWRJqei2HX0kXOETJ31NrqcToI7p/tMbAh0Hvw1AJxAq/SRvvsUh9oJ3tbK5BAVZJiWnyx3trcT+EuCx3eOXtOmw0eflREiACe5oUKyc29pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154487; c=relaxed/simple;
	bh=BOV4Fh+PDB2Z2rZvij7HgrPGo1mR/1Km77YpcS54GKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUg5u5WgruVoz/GVZLQQqw94Dtrc8bwgqgycVkIAyKfv3d84F6I0sAH9zKyFdhQchVIg1WL+tjnuLgVoL0N04CVHw+0YWN9YU2kJX5gfABLtuQRFzsgVHpmmVGo6alRQqmE6nI6uauZE6njMXKkBtZ0AETQaI9cWo09enbpYgwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2VodzLj; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2VodzLj"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so2305401a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789154473; cv=none;
        d=google.com; s=arc-20260327;
        b=L1gd406JCTzAY67rywd0z05PwL1cg9FBKqHVYANlGC2CwEkrQgrkJoe8oKjrcfZJ66
         Me0//J/5e1A1Y6XqG+1/SwrNrdeCzJ5lL1w3PxS3A8uHFhIP0ZN10xuPmSRBj9zMqk2W
         C/PDLn1Jc1tI9OR74yeucinAOFeRm5g1JF/SXV5Lq/oXDb5kEDsp6Gu/2Kal6dYjiBbc
         WITQYTFhRGfU9Mx8XItGL1GnYeYpjOTrtjIVxZaGlP+kyVDdFTiLHyxtRR1L6VF0vU7w
         NdKpb8McSh6Muco5Jue4UXHyKW2q9L5TxRvSldCYQJao4odS7UQpjJGFtBj9BMIX5bFB
         kEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E5tfA38f+j0POlE4iIpcFWR5pq2Vcd0sRoqvAs5ymGk=;
        fh=h2qY8Ns7BZXRtWF1tYOs3es2wZUob3MTuziQbDNxLCQ=;
        b=sk/i6K1XDp4FoDy8wF8jOEnd9M8DLMZ3oSykKVJ2CuJgO/a509FC4JkXGEMxd3Z2jK
         hDyjsCRXh15LduSpYNSXM/9MgreId0PHxDA+W1Hcou0V8TVesFxN+NubECsU4Ww1mmGU
         JHOnSpMJ1qWQGlaiWkffs8M7mvfL5HoVxw4PhX45hI1+FVsKBycPDP3oZKR3BgZP+WK8
         Of0kodDWHbsFj7VHo+DfNc1Cjd7MosxoD8HGMHVyyoi5tJbakMKBG8AihZY4CuTCdRnx
         jsNt+1hJGsrcK/TV1fxdKVOcRTskmc3ofJ8RIhdaVUKl4rSlnkRcXvNOrR1AfugAlGzI
         ARJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154473; x=1789759273; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5tfA38f+j0POlE4iIpcFWR5pq2Vcd0sRoqvAs5ymGk=;
        b=a2VodzLj0VSGhy37l/MCa2PDOpvj8Z5reK9F3DBK1huyjinmoAaFaretVXf0eMelZR
         MYmOWhSjCQvzdJ6O299o/dAyMAfhtwNveAL7gq86DTc2b5OmyvoWe6w8taazSCi1Gn/p
         vbCJz+6hNzHBh3yHZnab95oj2C67fzW6WosC7+wbfVsd3TrlgzOuVnuX5Sjidy6rcmVK
         K2zDqF5VSSwRd5KmG+yFn9sGkH68eXZHC8+3wAMIDw/XblmYC3pAw5jb7+nkNvLwSGfw
         wrf1JjVvF+DHmDd2mFbcuyj/cwJBMlhUjuoMdVXjfs9pmOHt+wCJNhK0PXzJeoYqUzuK
         a9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154473; x=1789759273;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E5tfA38f+j0POlE4iIpcFWR5pq2Vcd0sRoqvAs5ymGk=;
        b=FoVxmL1OJjWZ7INFKDVNWL31r3G05FfoCPWEfKfiOZBuiwWENQaciGcMISD5oui/JB
         bri9NGLYMuk3du8VXEKHKvgjd82eGoY9LDJmApB2MSjks4uQdl0LBLOdzWj9tR8hByUv
         un0HCspaYJFdj1NlFQ1VvKTJgRMu6YoPV1K3yVFyliWq2gFkSr2mNt8sDE2ElFp9sd1K
         sHWFRWw9AXi9D686j15Fg1s5KCF6G4KZYOTqQeVmBn6/qIK0xOHR8KsVZS28svb9ERQd
         e8KHr/vPQROxFrvTrsetEd7kEozto4rNDDyBpMeP/BjBCl9aQTQqc7MjqSMyDelw1tQq
         VbEw==
X-Forwarded-Encrypted: i=1; AKwUvByjsiInU+CSGmpEp1wfp1Uw+Bp9zYZOb0ZQ4lVhioRdelRNp81CSlflvXJOiRVIEILS/8PVIScqmVIzga0=@vger.kernel.org
X-Gm-Message-State: AFuF++kaxjOznDO1+YK98/J/v8TwnooHX6fbzzjEXpibLVXMWRG2q6yI
	niRf4PHAsCh0sxjFGYTE0p3YRhfeymHAMdHYmRfaTpkOIZBcU9oX9dl6inV8XqIqLRqsfAcRXfC
	FbMz5wj4Q/ri48FYkSy2/0l0GqZct378=
X-Gm-Gg: AYBFou0ClIIb2p6lIXqzDKbQ+phYEBo6ZUVGhXl5sgeTuHuGYAtexTXqCJ5tRZ8T9rR
	AjqojHwwLRcdsuFqX6MKlXTRLwve7ltdxN7CjDhECTaJ9J/wXD5u4CGdbZHjUYXGmBWGCuCVAIK
	jLoSpyDptrN0LkntuMgz0/ob+spwhc6c5bkYnfcfA7eXomGlDkD97QFLN/BaQmvoA4m+Ssbh7LZ
	W+LlVauiRuFGpQgDRhk5O3nkDATiqBnJXfBGKICqrgqGYMWeHmEd+ZZSUG3jg8Myatvj5sF31SS
	QhEMRKaKcoj6pLMq4JrTxlAmfEWXi1qPPwU20V6aq4tS+MqQd8vKIdXt2GJhHGPRwcI7W1mYnUj
	VWB2FSCybjBLV
X-Received: by 2002:a17:90b:514b:b0:39b:ac66:bbc with SMTP id
 98e67ed59e1d1-39d9bd5e466mr10210009a91.7.1789154473041; Fri, 11 Sep 2026
 12:21:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910124403.95741-1-7israr.work@gmail.com> <aqKzBTM-CdBqQzXi@stanley.mountain>
In-Reply-To: <aqKzBTM-CdBqQzXi@stanley.mountain>
From: Muhammad Israr <7israr.work@gmail.com>
Date: Sat, 12 Sep 2026 00:21:01 +0500
X-Gm-Features: AcwNN1WeLF1JmgXP8K5-fB6_KWQp7HGW3iQihCXg4WYNpI5_-GaC74CZsxkWRZ4
Message-ID: <CAGKr8w2e4YGF41X5mv5Mf2FDvoezpzeKmFMKaHKf43eypCKdFg@mail.gmail.com>
Subject: Re: [PATCH] staging: most: video: add comments to mutex and spinlock definitions
To: Dan Carpenter <error27@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 12, 2026 at 12:19:00AM +0000, Dan Carpenter wrote:
> It's supposed to but it is buggy...  What prevents multiple
> threads from reading comp_vdev_read() at the same time?
> I prefer to keep the warning around until someone fixes the
> code.

Thanks for pointing this out!
I traced through comp_vdev_read(): list_lock (the spinlock --
the mutex field in this struct is unrelated, it's only vdev->lock
used for V4L2 ioctl serialization) is only actually held around
the final list_del() in the read loop. data_ready() and
get_top_mbo(), both called earlier in the same function, read
pending_mbos with no lock held at all. comp_rx_data() (the
rx_completion producer) does take list_lock correctly around its
list_add_tail(), but that only protects against whatever happens
to be holding list_lock at that instant  which today is just
the list_del() call. So nothing stops two threads from both being
inside comp_vdev_read() concurrently and reading/deciding on the
same list state unprotected, which is what you were asking about.

The change I am proposing is to add a dedicated mutex to struct
most_video_dev, held across the whole read() call, so only one
thread is ever inside comp_vdev_read() at a time. list_lock still
wraps the actual list touches (checking for an empty list and
picking the head entry, and the existing list_del()), matching
what comp_rx_data() already does; copy_to_user() stays outside
any lock since it can fault. The mutex handles thread-vs-thread
serialization, list_lock keeps handling reader-vs-rx_completion
synchronization.

Does that match what you had in mind, or would you take a
different approach?

I will send the race fix on its own, and once the locking is
accurate I will send the follow-up comment patch.

regards,
Muhammad Israr
