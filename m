Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420794;
	b=IBYHPCG9ozh+fOnDx1FxDcw7T7dwnNqGeWfu3zqC8CA0GjALucpO51eZtAHqTFbTNHAP
	 AqEJLzZqd6WSPc2E5wFIaYr/No4Vx9clJZWbdxFiLWjoqZzDR6pnjwjZiISawmBlaj69t
	 jyhdw1c2GIV5iVt2xa7mMlGlBY2sK38Wz+mZhTopV2rkoz7Lm+UJNUFL8z8O1+cLcavH8
	 o1rlDGwIuHvLVfjY524lh541fUEtT1C3iotbEJdweKwm1lz5Ozkl5FRLRFkFE1WSWyt1I
	 VRvGQ0Q7Tvx6wQtO80YrJWsMDwDNVGlXD15U/bM96W5e6IKj42eXxNC5FKEGXLR5Ysw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420794;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=4rHAAvYSlBWkR1aF9Xd3HF5s4Ut8KHf5ROnk4jdL0S8=;
	b=iIEmBbxmnQ/eW0m9xp3g04OiZ0HQS1ant+Tn7/vjvGMgxMrDzoGX9mwG2AQQW0Z1RTmN
	 3ngnvemOW1QTne5sSogUm/2JCZC7C14pM3Qz8QnSzmX0+gwwF4Sg1qHrAglhebKeWYbj7
	 BRaT1hF6Iiaafm8q8VB/MmMZB0O4YNIQRPv1wxXHCRS3W8y+FuPBQJt5TsKt21A9/AWOi
	 Fjufe3/NBaXMkYRwp/DAn2Kn95ys5GwZ8jlvk9OAqa/48+CZWR7RWF49+M2fC1j91BIGK
	 nTh8Vv+mChhjRO0lEIJ8PJpibAdIQNqaIkse+f3lYW0ngn7Jw4Tz60Kp05JjQkpUH9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DkaOjBc8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE892606A886
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DkaOjBc8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53B11F00A06;
	Wed, 11 Nov 2026 18:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794420793;
	bh=4rHAAvYSlBWkR1aF9Xd3HF5s4Ut8KHf5ROnk4jdL0S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DkaOjBc83AOtUS+wAQ6snaEfwanqbU1gepO5aM6iLzhkqsVB7Up1ZIv3/gR5l0QL2
	 gQ90bzwQWRBynbl7QWenQRyqsNLMdXDooroznbXKy2akXcw8E89fZS9Lp5oxJPN425
	 QUHrfwjfizov4gJfRlB0LeJy1LVLD51GYcs+NeQgPzOMIXnmFNRGVCeNk8PB4nnv8O
	 c0dUDI4Qsf+z02O1hrnPstpHBTYPHSugCZ1568pj94wO/xcPg4hTcvjveEJSk/Zxdc
	 7v8fhw68uQ/VOx31YVUXzRrOBBQgTE4p2/dIp/8Sso0tv/9s+AlD3XOqEJVzJ/P+S5
	 iw6z1m+NMYmUA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id AAAA8198003A;
	Wed, 11 Nov 2026 13:13:07 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 11 Nov 2026 13:13:10 -0500
X-ME-Sender: <xms:M7D0aokjtv4APqRmcYie62JzPiHLtEOtm7zjCt6RVbOeBlOBYinmDA>
    <xme:M7D0ahgaU4V-d_R-cvnEtFCgzklInukxYuDMUatU-VSHb47sI58VH1N8MYo3KM85v
    YD4ZzjU0-6SzNNX82Nl9jYZHfD4g_U3hFmDSmLUlEtsE_MYU28G0ro9nA>
X-ME-Received: <xmr:M7D0al_tVEt-W9TwyHs3QkdFTITAd3qhP-RX48JLhmTQwRw394xO3_dmHwo>
X-ME-Proxy-Cause: dmFkZTGu7m8AL92X1wQsLwgYQLNYwRQeDr8zbde6dcnyv9dQrptwrEaFdgJfap2gDLWQsC
    0XZ095QhiRtyLW5/WT6hfJwc6+DQeAmSOP/cTI/D2WryiH78HbM9g123dyydih3hJxAIRG
    RwH5MCZDYobP/A7+o2KGkIde3fTRNL4aSWPUbBUFoIdYAapIFC4Yt2ExoZuYN+m53x6Tq9
    uacbpfpSCufs21hCT932qk6292iuJB41xISPNttnTOxYUt7fjaQ7OLUqSMKdMva7YDCGu+
    gwoHdMzDF9dqKX3GeM5dNZv3S1w075h9XiuqHUYp27qeO1o6hDTY/DH6sQCbmoZxcDu1RR
    GIMGP5/HijBGpMjt9RAnKT6j8dYErUBEtp7l6VgyLkcdTdEBGkpzlXkWbXoVrDUuEZZOL6
    +0Z6j3sTsasFKS+DoU7bahfe65Wjdor/71iq/TWUCenLvLLp5efTMOID43qscNIzEMcuBu
    7Xp2p0JVuPNCOLFBojazAwCviEKa219u2XiY4d2dWE4IsWCpq2ELmetxOJns3tpl37QnzP
    8Kyn2hUGeBEcv/LE3R6KLd8WRk5VT4xnShKMtJWzrZ3TdybvL4EHlrbDyy4wAGxj1p/w3a
    /onSIrV1y5SqulzROe27U1o41Dtafoq9fMmw01UuYLDGFLFVNYazZh71RhDQ
X-ME-Proxy: <xmx:M7D0asqJAabJBIXZsOZcbNn929PtJ817T3L3wDUCcwJ7kPmNSq8Y8Q>
    <xmx:M7D0arN7c59Zo4PAqOeNK_FWQKsAMGPySUeM-qhDvSwH85d_bl3bpQ>
    <xmx:M7D0aoQhTIX5FQn6VuRXedznWLprJORHnRNw96l5AVDjDLN0WC7lsw>
    <xmx:M7D0ao86CqKxTjuLbDUVYRZEfHfezxhjEn-mHALWSiwlkaT4Xa-f1g>
    <xmx:M7D0asp--KUB1u2KpRPr6K1n4MdkFbWmEOkK6lhM8hynnZORtjf_1pBJ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Nov 2026 13:13:06 -0500 (EST)
Date: Wed, 11 Nov 2026 18:13:05 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Pedro Falcato <pfalcato@suse.de>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Hugh Dickins <hughd@google.com>, Chris Mason <mason@kernel.org>, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 2/2] mm/memory: refuse to map page cache folios that
 are not uptodate
Message-ID: <avSv89I3zeLC-gQB@thinkstation>
References: <20261109120403.82361-1-kas@kernel.org>
 <20261109120403.82361-3-kas@kernel.org>
 <7698b32c-eb47-46d9-8ebb-337aa575d062@kernel.org>
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
In-Reply-To: <7698b32c-eb47-46d9-8ebb-337aa575d062@kernel.org>

On Wed, Nov 11, 2026 at 09:05:54AM +0100, David Hildenbrand (Arm) wrote:
> On 11/9/26 13:04, Kiryl Shutsemau (Meta) wrote:
> > A page cache folio that is not uptodate holds data that was never read
> > in or cleared. shmem fallocate(2), for one, adds such folios and clears
> > them only on first use. Mapping one hands userspace whatever the memory
> > held before.
> > 
> > Each path that maps page cache checks for this itself: fault-around in
> > next_uptodate_folio(), a fault in filemap_fault() or shmem_get_folio().
> > Nothing in the mapping code does, so a caller that misses the check
> > leaks stale memory silently. MADV_COLLAPSE did exactly that with
> > fallocated shmem THPs until recently.
> > 
> > Warn and refuse the mapping in __do_fault() and do_set_pmd().
> > 
> > __do_fault() checks the folio ->fault() returned while it is still
> > locked. do_shared_fault() unlocks it for ->page_mkwrite(), and a
> > writeback error can clear PG_uptodate after that; that case retries the
> > fault instead. For CoW, __do_fault() sees the page cache folio that
> > do_cow_fault() copies from. do_set_pmd() covers MADV_COLLAPSE, which
> > maps without a fault.
> > 
> > The fault gets SIGBUS, as for a folio that fails to read in.
> > MADV_COLLAPSE fails and leaves the range to be faulted in.
> > 
> > Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > ---
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> How do we proceed with patch #1 (on which this patch relies on :) )?

I will move the helper from 1/2 here and send v3 as a single patch.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
