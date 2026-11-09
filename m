Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240128;
	b=LylFl5tYkf6cGRvM9Gh+KEBDASo7QnfP/5jMRX9OfJuXY6hJnPMpZI7J9V4qmVrBVWOv
	 4m+6mUMaWdDisRPGmD+SY8pii9asZBjprIemHT2knSRHRFZcjSL7And4fGH5qC3omRm0X
	 9HzL/jZqELXGmaJU/3FKzoQCH33DEDcZBC8QhmBllz10qnKZfoEKAu+ie5aAqvqwvd6hj
	 JvDK5H/Oo299RBC+8B9GfYvEtuWnapnpSSdwlH1EEgBVZE8Pg9Ov2mAdaW6KgYS4EjfeF
	 tV180g4RyyyZUwyX/4UMZqn/NzGUscg3LfNAAAWA0BY7lPDAomKMPuh/U+GD6L2gPUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MUbKECMWpbH5Hktz2WSMdey09BNdQaJCNvxGCw4T8OU=;
	b=3/a23RjcfEq55fqaYA10rzgHR1Blskt1orP6q/4PijlUbo86Lbe4w1HuY53ov9wYEoud
	 GaubjDJHQ48CLNbODqU8z0j1fiwifYXAcClTSXtVF7VfcwX0kfvno67j1vA0pSDu6hqfm
	 EWH8Lj40bRFhESMIlYkImekiVqJo+08Zz+PkMtvqT/fEYHHiDZa4FyCF0g0f6bnUtvUaJ
	 3kAPRfSxWa1roogn4i9GPq9SL5jGf3mfZDQSXjXeMt9X8he3vtVUsUISwrH+OD0RWd1Mo
	 bF0hslziYMVJ10oIVfMxBnWXCe5AHMxHVZBNTWwf/l9mw1u/RYKXa9OZ01jgfz42iIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HeBZAWdf;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1522860A2611
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1522860A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HeBZAWdf
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4550d8ab15so152264766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794240125; x=1794844925; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUbKECMWpbH5Hktz2WSMdey09BNdQaJCNvxGCw4T8OU=;
        b=HeBZAWdffYjyW0dOUsMLYWwubHYgKf8GfrY3MfC1gOa4T3P8tHYK9A3g3Jpc948Nj1
         +B77QXxX8Ck+WepuB/rDeX0Y2qMR8SiI2n7oF1QC6M41u3cvG9Hc8Dk1FglxJMQTdnGf
         xFT8AYaFP9mEKsjnTzmzreDrcJWX2qgDsVEXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240125; x=1794844925;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MUbKECMWpbH5Hktz2WSMdey09BNdQaJCNvxGCw4T8OU=;
        b=KDgk2I4lCT/l5rszPDqP8WzkeXcnIvCgmUG0AEv2+7usVjc7UycBx37z9OFdTtQs29
         aTiO1G6JCMEjPJXVyD4xeXmBdw2yxDd1KIVGt3D0VfRFl7L+XlFbpFzW6K+AxJ7uKw2C
         PIClDOESr8wQZu7B6RvMow9HktAMoVNnbZin5eUd8vuYSREc8/BeYnKIKxxGZMTzL8Wu
         p91mc4c/pfHj2DZMqln/tNO/zk04kbhl0AvGSQfhorBP2XeQ6ugkS4DckIF/58+qHJ3I
         /Qk+3Tbt/fMEBfzG5i4kCpIrKo+oMm90xAfBLSisa7F7uAOyB+aMsMXj+1sNrB+ZnvAH
         J2KA==
X-Forwarded-Encrypted: i=1; AL+hErEsnypwAJV9wQ2z9HB2kUEIp9qh5cw8IUuVZuDf1OqIY3/n3N/EALpxK0VGe8LU3F13MSlm/jaXo1N7Lak=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QwCX2RNfFnJZ1m8vs0vkZWtOBJ4EqsjiF6FQJwBKcYfIlW9Jt
	3nRDqrn5DLcoGj7G3Zn2SSmOmkIkLwAcs2argqHhgallRFD7jdcHpyR0sb+dxVKktnH7dc3kD7o
	mAm0AlME=
X-Gm-Gg: AYBFou0gMCY4FZ1RECXuypqpXjSNnj6Lggyu3heRkI7kzT6lwl1+SAfAv0qDBaIWDKp
	GqlPeP0XJECHIhJM5sL9GtD9+OMoAgcjzK3ghJ6jIok0ch250QkFOSceHukSRcP7G6QdSwdajwr
	Si9EBHnc+uOe7hIcSb5liqsQAKAcHH5BHLa4KWHenhZk0t4hr0xpGzkfRThSZW+g/fd8mNo1p6J
	N8tzFwFk+z6HpTr3rLKK6sOrFIBtHZGIk7VCIboxoVJdbncr8tk5AfVDh8pK43WyjDYvl533t/0
	5wyr4oDvm8EV3fpWx7AnNU5wNZi49sqne9kABam8mQ1dgT7vqbFjH0UgqDXd1WSKUHHKlsfFD3R
	NnMvt4asoyMZxrr0f5Qd6xlEJMPID+cRziGjRYuG2Mq4gWm3U0XKLDZdTqqYXQw2Z2WT7h5qur3
	I+h6hwVpwT2Yy7T46wBuSf+567vXvUYEDP+U5FUVvw70EiX2vISaakkZku3B76hjG8IvDUd2m6w
	2Muu/Yc5A8Q+X1vb+2y86zYnAM92r+CC6KOrnn7/+zdwwgDrBmxyS1F3STDJtiVjisOGUSZrpso
	OuoP77PSJvmEQQbEh8sd47PTwc7ZRiyKhiWwEQW1+jFKdgqPlDC88FcRejcMQhEDZn/uF/qqqZu
	7bw==
X-Received: by 2002:a17:907:ea89:b0:c3f:7270:10ab with SMTP id a640c23a62f3a-c4d6d491847mr325987766b.14.1794240125399;
        Mon, 09 Nov 2026 08:02:05 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9a3822sm195574866b.80.2026.11.09.08.02.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:02:04 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4550d8ab15so152259566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:02:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG+xp4Rrt9MGpJuKesdnjLNo60wDHAc7LUbU4c3dwljPClcwbk9JQ6Tw3ZzoUF+/0OvJ8xroC4TwuPSkKU=@vger.kernel.org
X-Received: by 2002:a17:907:7f93:b0:c4d:18e2:e66c with SMTP id
 a640c23a62f3a-c4d6d4d1cf2mr342046766b.18.1794239795407; Mon, 09 Nov 2026
 07:56:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104130118.2507513-1-kas@kernel.org> <20261104130118.2507513-2-kas@kernel.org>
 <ecad7b3c-7244-425a-9413-04d49f221057@kernel.org> <au2lsbDkyWt-To0C@thinkstation>
 <aa2a1e32-9b1d-4545-b2e0-03d213593023@kernel.org>
In-Reply-To: <aa2a1e32-9b1d-4545-b2e0-03d213593023@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 07:56:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=whnH5qLJH3Wd3bOxv--Ei6674Jo4iifGD_MqzyJg2Jm4g@mail.gmail.com>
X-Gm-Features: AclHuK_KlZ4s0u4OfgGD3UZtJodv62VcuanWvSl4PYVPZCnpCpWEdwdwFyjepNA
Message-ID: <CAHk-=whnH5qLJH3Wd3bOxv--Ei6674Jo4iifGD_MqzyJg2Jm4g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/18] mm: free PG_rcu_free folios only after an
 RCU grace period
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, Hugh Dickins <hughd@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Harry Yoo <harry@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 06:43, David Hildenbrand (Arm) <david@kernel.org> wrote:
>
> Can we just rework that code first to have some clear folio freeing path, IOW
> doing this in a folio-specific helper?

I think you're making things worse rather than better.

The whole point was to hook into *one* place: the page freeing.

Trying to make it specific to one special freeing path only makes it
fragile and less obvious, and results in anybody who then uses some
other freeing model to miss the RCU thing.

It also means that suddenly nobody else can use the RCU path for their own uses.

Look at all the kmalloc RCU freeing: it's used all over the place. RCU
has basically taken over the kernel. Every single performance-critical
lock-free area of the kernel wants RCU freeing.

I think trying to corral it into some special case is the last thing
we want to do. It only makes things less potentially useful and more
fragile.

                  Linus
