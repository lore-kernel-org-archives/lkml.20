Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677312;
	b=tbi7IycHjGWwOSPV8nnpluYn6hyKF3pC/S5359PZVOa69nSIlNcp+lNN3ociUIewm+OK
	 iCNMnemGiPuU0+RCGzU+dn8rPGIlS8r1g5H8yI4be1JJFcxz9EI7bQ+SVW4krTSYTYAhp
	 nAhk7j03TjZvXvaiYRFUG/WpS9/Jt6IlO38zmCVN5S1PVZIcFYMhl1OnxUNsHmmcU86tt
	 fL728E5gzsIVY1b1y0CGDAQMkpbhusdbE79+z/Tft+ixAKiEOiarbUcWCbaPrnCebJF/U
	 8HxrAedOoN9iGlBJGfhdpUN2Uzo3NsIVEanyQnxI5EuYxnSYri6Tqz4mfujJhFP+aFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677312;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LoNJWcYKe2EdW+Tn88m1TkIGzLa8lfMQNPaKC7oyglo=;
	b=h54aSzr6M2Yb3BdA2+fzEButu4e6moX4QwTSYuQDqgwmSFL8D5f/Fxr0+kSjy7NLQyQe
	 mmj2m/O/NfbEE/Bfpbrx4FA/gkW4M9+WKxM1rJe6vuht1i3kiW9Lp4JUUEfyHT+8mdwLB
	 DnVJFmJHgsoR8sUBPCeU2YmogZBvxLWr9iS4vAmVXYgNOfp7Vow/OC4pQhZ8WjnypXcpl
	 6Tvlq+DwoKkzIPu7Nxs6lmCKSh79yb3gi36lA14FlVRYe6tpJg5gXYzRhO4JZRdA0POs5
	 rjeAfNMeVSTzhpbzKam7yJ2+5oVLE6cSPqjsYG/ymb6uN5fKaRd0ffbVGula6MoMPdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AtGBu3xD;
	arc=none smtp.remote-ip=95.215.58.53
Received: from mta1.migadu.com (out-53.mta1.migadu.com [95.215.58.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BCE606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BCE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AtGBu3xD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R+oE4roM4QVYigPw8/tQ8lEohznLJkC3Wn+fBwSMYi4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792677309; v=1; x=1793282109;
 b=AtGBu3xDL7qBtlgkbQ+hNV6+lK0Z+8VfpDaoL62LGuik7kDK15QvNQcOouyxJC229ynBjbmj
 9xrSa5kQ9Yrbe663NxeSCVDClYFyL7RQ+x9LBSf4Zl3ACk/EKuiOsuHtEl9BhUBW6wY69IoPnfT
 0fNTi3QHe8aYDIpj03NsZzXQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 96abd4a0ca655602;
	Thu, 22 Oct 2026 13:55:05 +0000
X-Mizu-Trace-ID: 96abd4a0ca655602
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: osalvador@suse.de,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	lance.yang@linux.dev,
	jthoughton@google.com,
	david@kernel.org,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/12] mm: hugetlb_vmemmap: generalize vmemmap page allocation
Date: Thu, 22 Oct 2026 21:54:55 +0800
Message-ID: <20261022135455.90168-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115824.823278-3-songmuchun@bytedance.com>
References: <20261020115824.823278-3-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Oct 20, 2026 at 07:58:16PM +0800, Muchun Song wrote:
>Vmemmap page allocation is currently tied to restoring a virtual range
>and assumes an empty destination list.  These constraints prevent it from
>being reused when pages are requested independently of a vmemmap range or
>appended to an existing list.

Yeah, the local list makes sense to me :)

>Generalize the allocator and give it an all-or-nothing list contract so
>the restore and optimization paths can share the same allocation policy.
>This also allows HVO head-page allocation to fail gracefully under memory
>pressure without triggering the OOM killer.

And __GFP_RETRY_MAYFAIL for the head page seems reasonable too. Just skip
the optimization if we can't allocate it.

>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
