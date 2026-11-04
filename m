Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831727;
	b=VNFOlcmzWWyWhG9bY0f02WuFNIpWUiE2jBEWhA/cXC1LpNWZ5/VbkCtd6uBCTxjU8a6D
	 R7p2p9QT1aBZ+nVD4993W9NKTV9/fJXgUmi/0OGgBinIcos/X+GLnBd6elkkeD2F9cT4i
	 CWzjHDDV7KvrPnMbm5/uKC0Nz7W7NLYkfAPAfSNCJm0Y1PNXhD6koTd7CDXabskCcGthS
	 G6DA6E45g8CNmt3Ydu+J6O9o8aUHemxpLDj3OJ9Fl1Bs5YpmToF76TpSCFHlBrnzmcQjK
	 R1arSFBjH3yBioPnsKEh+V4HUSJ/aEuLPy9kdkgSD+GPhqrERvFIPAlp10vRyq9j8TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Osoc1/zc3WCPxn/uivsVACevUkiPfuARX2+mZ1FpT3s=;
	b=YXLdS3WRZg140K05mn8A4QhDPrYGqwrj4FJOiKvOsQNUoLnEfQxGnlSI+B69RnURfVc0
	 LUX4a+Eg0yNqlUsOuQhdIA5UD6sqIdPjQmmX08ce0H9BLAcHXAO4GJemiK5P8bqAe/dDb
	 j9VR2FA+arfXok5vc3hFUoX7RReXM+M4TZU4JB924Bl0zCEH8A+IueAtDvbKANR/NCWeu
	 30FmfooxzNa33BwU0F/j5hXghzH9MDkbguTBy56KUznWGduq3yCU9YNbk6UXdxyoy1s/H
	 2AijONQSn1nRF21Rt3R0guLHRVAMUWq5SWHu8FXBUDMaLj5zQyymdRWCib7eAqFGXjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bkv6DNeA;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D98606AB12
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D98606AB12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bkv6DNeA
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso967777b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793831726; x=1794436526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Osoc1/zc3WCPxn/uivsVACevUkiPfuARX2+mZ1FpT3s=;
        b=bkv6DNeAcOgKuFWjKi3KzwgdFOsKa9d64GSG02M3Ag6tvdIenCkXOWzxg6ofMEnede
         Z38zuEIQfaSRP+2xT1ils/BDnvMCsitxF6Rz48MQFC45RrOzSTGu5gvsA+MDhfwzvPKT
         ql3vClM4ioWl/gjSOhpRa1Vmx1b56MjuY9qCfUzAsX2dCyIDrTrxD55ZHgF55xwkM3sO
         WSRxUy7osOc5G6Pwmyu+dnP1ZkRJZ7gZ+Slgfa/1UGi2rwkEfmpq3d2jAGTu+xIJnc8u
         OvndJzC51+kpYGsRgwWM+ujTTaNtsa0FYpRVfqHHzeXB27xAFq5FMJxoXz7EOOCNhn93
         PEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831726; x=1794436526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Osoc1/zc3WCPxn/uivsVACevUkiPfuARX2+mZ1FpT3s=;
        b=xgnXqGTxwTjB0VuHmHMGV8rG2k4/iaj/9JUfZa5kdEz57/ljE3W5FWLaxJKOuoBYBG
         mad21ejb+LOuV44Gjz+4q14ltwYAN2i5KisUXBGyndrDZGwwKzgpy3FsPMvMFm1eaOkm
         324TibMgBFvKCMoS7+bMWSeWKvuMu2wdkFUo/6chAn/34H6HUBFOcH8h/8KIQczmiLED
         aYatWYq4ADcqEr1vMa18taILltl171qqLXBFY93rqElHsgREYAoaiGW7AhgPThNV1i1K
         LHHKD+xc/+XJTxlD71J/ZjpZw/34ch10AeYEOxPHQGAyx3odH65k92SHCtAZ49Xz4Fdx
         5OtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOamisStR00yUl+qJbRTHQNq87c3UAQeNiGUWdx4wLP4rtOuVAIaKKGAucXY3GT2ISi0tZHqd6hnvpq5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m6+jwbCFd7L8Csg5+Aof8DQMnSHXqxxv37Qsedon58GeUjGao
	wm1dhSQqzggH8jYjS5eVaG1Bhja+Eii8qusEZTZ8HPEeOAnqKgkmRulR9aYcZq/3KQ==
X-Gm-Gg: AYBFou3Na6a5lumEp/fTu95beYZ2rWzbLRT0GDfCcYcAR0QVoDk5DPQ7YNwADGn007r
	XXquHsjiYyvdIseVgdmMngmu0loENSgL8ioRqQ46UuZ6VOJCsqsVkR7tt68bEVd/6mSdlOgox1K
	RiHqNwB55YeOViR1vlm7r8hNg3Pwh1hCSiilAleQvGboQhMfFrnLAFUxBjyzxfafgVYDPwvlT6m
	38wC1gE62x4+0G+y68w5efF9UUDVApcfa6WmmQhRLObLXcoDO2DtCw8pske6j1oJrr69aswvpD1
	TUi9xdMDJzcOXmsJxsDMd2QtqpQGrkdrS+Szi9nJ8WopppHtcFB6ONAaQQ0AuCZffNs+6ERP1Oo
	l2/jLBpRcMCFo313BTcOlqbu7WyJ4zelZp3YQDzRyqSGB0zDu8PKUjunatoTNNOkqoNHq3pjQzw
	IKOxlmzdsxAhZR79orzX5T1f6YODHkvL7pS4IOTRr5mvBRmiZmENGSgR04fVDvBeVAyOpWxNNBl
	kOEUZNBSxVGEbJ0CLdGm5mpcfn/3+ldZAsk0L5JaXD05IPsHa7COAmDMF9xvwj4/OroMO/70ktp
	Z/6aN4rooHxGI7a0vVNEq8Dx7vtUvEP1m4CSRDV786w95luw+STxGuZJQRJEKwNGh65AZ/5ZDjp
	8NNfRwzOYFQ==
X-Received: by 2002:a05:6a00:1f0b:b0:899:67fe:3c52 with SMTP id d2e1a72fcca58-8a9be1a4461mr15308534b3a.15.1793831725909;
        Wed, 04 Nov 2026 14:35:25 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b569495sm1376244b3a.37.2026.11.04.14.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:35:25 -0800 (PST)
Date: Wed, 4 Nov 2026 22:35:20 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 09/10] mm/shmem_luo: Allow retrieving tmpfs files with
 O_RDONLY
Message-ID: <auuzKNZsPD10XM4q@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-10-dmatlack@google.com>
 <2vxz5wyck08d.fsf@kernel.org>
 <auuJ4msatqzoOrjN@google.com>
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
In-Reply-To: <auuJ4msatqzoOrjN@google.com>

On 2026-11-04 02:45 PM, Pasha Tatashin wrote:
> On 11-04 17:52, Pratyush Yadav wrote:
> > On Tue, Nov 03 2026, David Matlack wrote:
> > [...]
> > 
> > Can't you put all your binaries in a separate session, retrieve it as
> > the very first thing, and then finish the session? Then you can execute
> > those and retrieve all the other sessions.
> 
> This is a good workaround. I am not opposed to this patch for 
> completeness of functionality, but if we decide to keep it, perhaps it 
> should simply be squashed into an earlier patch. The current diffstat
> looks bad, as it mostly deletes code that was introduced earlier in this 
> series.
> 
> In any case, given Pratyush's suggestion, we could also drop it.
> 
> > 
> > Why do we need to support this in the kernel?

That would work for binaries, and I agree that use case alone doesn't
justify this. But I see O_RDONLY as part of the retrieve interface, not
a feature for one use case. The retrieve argument is modeled on
openat(), and openat() lets you open an existing file read-only.

open(O_TMPFILE) only requires write access because it creates an empty
file, and an empty read-only file is useless. A retrieved file isn't
empty, it has the preserved contents, so O_RDONLY makes as much sense as
it does for any other existing file. Without it, every retrieved file is
writable, even when userspace only needs to read it.

Preserve already works the same way: a file can be preserved through a
read-only fd, as long as the caller has permission to write to it.

If we keep it, I'll squash it into patch 7 in v4, so retrieve supports
O_RDONLY from the start. The commit message will lead with the openat()
reasoning and keep binaries as just an example.
