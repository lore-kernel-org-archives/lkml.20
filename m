Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504860;
	b=P9sxsqfDyBzQBe0GQJRV1cFP74YQD9ptXjtzEJthl75KQhMI+9rAF0/x0St/DkQg5mYr
	 cg88cV7HzpQMNVDxLZHrbZ5mu+C5uu8kIoKF1lM1wsfJA71KtgAeq+gY0/z7XRn1q0mdV
	 rVShaw8MkHYtfPdS2sewGhSHdryCHHCwmZJjuYgvJDBWPVaT7wIu3yxRLm4iPtk64ryyn
	 6OWtWjA1mT9NwG6xTB3AOWl46NmQWA6stY8SZTRsUsUZYhDiF183JCl2d0aezjqWoFb9t
	 X6vFdISHATXosd0r/r56eWMtrkRkBczFpgTDjr9TaD4rQUpa9DQzvH1I1u75Yx8jU8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AVq19U8dsLUULl5Arm+uFElP0L4F8s4K16OEcmVJkjM=;
	b=jh7+1IE4zuEa38luZCO1XzZfD7PEuYKg6Zz34LGn8BS8j0mX/KKq5CZGGZuIb1pLIYqD
	 hQgvLumrGzxSh3l+Bf1KF/8/cGzZ8mJ/nhWHrRIrpW/GTBwFPOKGNtdYupQlegPggCeBl
	 T7sJWYzaxg8NCnr/ZMD/Kpz/p3YJzTYy6qizrj1uZjORm4kKN4QhvlVLeQnVH8CDyyzu9
	 V6x2CVbbFKrjXLD3levDl9NdCyJSuw0LpHl73JYYNp5MXhFmEw5Z98aVhHhe8n8n+sGPr
	 td3quLSloTS3meQocIngMZdhE9wvI8E4CNPhJ7hPb5cJao/WJRXJVVkWNG0MbhRGlGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="CjXU/7M5";
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AF1606A211
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53AF1606A211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=CjXU/7M5
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so33256861fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794504857; x=1795109657; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVq19U8dsLUULl5Arm+uFElP0L4F8s4K16OEcmVJkjM=;
        b=CjXU/7M5Wwz0dAV4CyiaYC3BIFt1JKQbYMVsTZwpTRcEhSNpRi68X74Yxx31jQhyiE
         /BM+LqSOZGzjysU5i0H49oZp2Uhp84bCLp58jhIwNWB4C1SaPg6QwPdhpbt/2DdhSqmu
         o2wB3EA3pbL9TxQQ0MI8t3XXhkVxguyE7igbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504857; x=1795109657;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AVq19U8dsLUULl5Arm+uFElP0L4F8s4K16OEcmVJkjM=;
        b=BfJyE8ywKoO5SYpdBusfuH2NdFnRyJJJO1J2/E36jOya04wy24uG6t6TcwNRDxhvwq
         5+8Ac0ottZOAmpTerRz7cN/V8g3+R4CG+M4zx+pfUNIcfMv6VVzF2B7i6V3nxFB72YEP
         DHhJzEXdN638PFjFG03QGfod20NCb6Sz4EAXY3Hu2h206SoS0laEsfPiHJdsGUiw2Gl1
         35klO5KlruuEku9Wchti4fswiSLXvbYFylRT/uZaBqY9JCuALh5aoLVdLgUiExEwfPOT
         YclZNAnQoeZ/KztAis+M4l31/13UbrBaAGGwHde1bqz7ccC79hjrBKnQMUFgDkvRX1cP
         RcUA==
X-Forwarded-Encrypted: i=1; AL+hErG4R2tgw8tpMrz9RlmjYyFITqNXdiwYjaQFwp5HHxOkX5PPIDfcLebxzt48XM0fMA3kTorF0njVGLg8yQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UvIX6B+brcB3i3impuOM6RiT1HV6wz+heC1FQAcG3XhIPYQme
	AeieHpJ2EedUdyKVoL56gxrijTbnUIMJ22HF/3ia5zdVewzNt/2bYQlj38vUMe4hMv8Mmngw2h1
	iuuV0vvw2fw==
X-Gm-Gg: AYBFou2MJ4+fzhQSAlyZ0sjQ7A4y8GfKN2v86XBqRvanSqTtwIBVtbXA2tRazY67/No
	WyWS54ofgPBLDQUEmTIkYwP1KzW1y7OAGnxpkYcoP1QAse/dSRzjYkeCF8nOa7siI2iZoXpypjZ
	bg9JwaVVb7UKG/ztz/ACF6UGg5uwMh03Ln7+N2wZViYHiwh5K2YKbTfrE864e6PD/kN3XzLY0/6
	P1xxdfduJ4YvFdCGx4KB+3BNj/6sfyyfHdCkdady1ftICxI7FhKLcqhdt6EJ5cFOpid7d5dfMGj
	SgWWAABMNR6yPb4FYWA2AB0j0rFs5qpUr54wJKE1OF8YtxrjlJFCDpf82DYMvfx525ESHpPQcFk
	9P9jeFHw753+FqTv8UDYEiNBlvxPSOnoKWdP6DrBW6+ZP2NV9p4TjtERkfD1IYxhu8DxoXbdLNn
	S68NTiBHe5ZzbZpmWNy+V7o8cIvuFdj3ieCrhiQrzSj8vcqD/8HhFawYR0g5Ff5leju3F6h2lOt
	hL918NBOmdn2Qi51gAc8tnpHeUaxDOr6hME9i7RIMYeaHeQ6Et10P0nfD4zLN2kh21Lqc52E6wb
	qrfyxG2PzsnCOA7ruoI7yH/RnH/4XIjb96bOuWq+aJWxmjg1H765bzBvJDhOtbLiVLaZ8XWo52a
	dVpj7qj7RttboAybaj8vfNpjUtA==
X-Received: by 2002:a05:651c:a1af:b0:3ae:25fb:b2a1 with SMTP id 38308e7fff4ca-3ae2b4cdc19mr1051761fa.21.1794504857449;
        Thu, 12 Nov 2026 09:34:17 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b76a91fsm539411fa.8.2026.11.12.09.34.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:34:17 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso78535e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:34:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEDiF28hyja7mF0JvwyzC/K5G+OfKyFQCx6pXKoGDqEB10O8lPFK/ePaPLn8Cp83N8CxtYGkxXCitEz85U=@vger.kernel.org
X-Received: by 2002:a17:907:3ea7:b0:c4c:e344:ece7 with SMTP id
 a640c23a62f3a-c5066afe5dbmr615605366b.10.1794504534261; Thu, 12 Nov 2026
 09:28:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-refcount_overflow_stable-v3-0-318625d63a98@kernel.org>
 <20261110-refcount_overflow_stable-v3-2-318625d63a98@kernel.org>
 <avW3v-oLxcHXXNQD@pedro-suse.tail5790ac.ts.net> <4ae22b7a-c160-4003-a029-8a20381d196f@kernel.org>
 <avXFlI_5fhUvFyct@pedro-suse.tail5790ac.ts.net> <42373222-8e37-4658-bebd-dd27230a1dfa@kernel.org>
In-Reply-To: <42373222-8e37-4658-bebd-dd27230a1dfa@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Nov 2026 09:28:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh995y1B461rPAcgLagg26vsyXPoe=7JKgHowB+uHJJXA@mail.gmail.com>
X-Gm-Features: AclHuK90rViBZMbITCUjh4KTAKhE7_4EYJcdTbdgYzXWPc1JsLWFSAsYMdn-r7I
Message-ID: <CAHk-=wh995y1B461rPAcgLagg26vsyXPoe=7JKgHowB+uHJJXA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] mm: limit pagecache folio refcount when splicing
 into pipes
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Song Liu <songliubraving@fb.com>, 
	Rik van Riel <riel@surriel.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Steve Sistare <steven.sistare@oracle.com>, 
	John Hubbard <jhubbard@nvidia.com>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	linux-arch@vger.kernel.org, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 06:31, David Hildenbrand (Arm) <david@kernel.org> wrote:
>
> On 11/12/26 15:00, Pedro Falcato wrote:
> >
> > ETOOMANYREFS I think is good, also EBUSY, EMLINK (though this would be weird)
> > or even a generic -EIO.
>
> So I used EFAULT because that's also what we currently return when
> generic_pipe_buf_get() fails through pipe_buf_get() in splice_pipe_to_pipe() and
> link_pipe().

Yes. It's not a very intuitive error code, I admit, but:

 (a) it *is* the error code we already use

 (b) it is a fairly unique error code that isn't normal (ie EINVAL etc
that can happen for multiple reasons)

 (c) this is  something that nobody should EVER EVER test for anyway

IOW, the actual error code doesn't matter. Nobody sane will ever care.
Some of them may be entirely unreachable due to resource allocation
issues. And we already use EFAULT for random historical reasons.

                Linus
