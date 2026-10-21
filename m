Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562887;
	b=3TpX22paCRT4bfJLsxIUX+M0RDZ8eicKRjEwvCVcji0IB0feuvnOb5+2yDT3u1O5nPQd
	 x2A9w4wqBUiQOAhDPRZOda4IPY55xpylWcysdcf936m9izXjXqggIPRHw8Ko93UtRLPb9
	 zpA871edpiQzJNNpr/plPbfnOZ6cD+3w0Z/WLlWIAJAmNELTJnXr3eRfVG6SYUDWaZmvi
	 FL3JuX8Yz0zL8U/IYaqZxU3aLw4euzz0zMYV1VDEIB0m+SEOiI2ScTitBcKUQx+QNA0ZI
	 TAAGMPuawz2rjmC+SySZ2FIJ8OgA1ZzQXZEB8Ig8m3KDipg4BCAv8of8rs+1INnphog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562887;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZYe3wOkYMWAT9nEkJmHND9GUlXX8tkyrEnTbfn+hGAE=;
	b=3TuHLAjAkIauVMbH9k6Pi5tH0EOK310K+cyE4bidkwT1AUgrcW2iZu07oVW7S8fJ1D41
	 RKkhDZ590V6gzeAvcVsmPmXY6r0N6s+Sog3dpT0wXaKOtxNNfejTV1SiCXTmHlx0Z/Sqx
	 lHmw4OgrlK+Df/BJ3Dab69klvnoLrAenl2mI83hZQY1ATO5PT9KgN/y2rNQH0iYKj1uPS
	 1rloqtuaUbTKAwDGrljW5ifMADNSeQ/KxF9zeHVJU99hSieBHZpsU46kdusL7R8YGa5QC
	 /IznnEBNIUUVSpYVDpFy6ts26mqz/FPJpdzkLyHPJWpo/iVyE+ZQyUeCbnt/QCMP1uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p02NDSmT;
	arc=none smtp.remote-ip=91.218.175.168
Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BC560A262D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BC560A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p02NDSmT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4KIURn7WEb1ayotO22ZrkJ9wcqdsX7N260OoXXlEYTw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792562884; v=1; x=1793167684;
 b=p02NDSmTaSCB8KSHun2b3TBjbf1NxzTB/b6rDos/XyDiLhiG+2lxVTaZ4aTR24rWJ9/gY/mw
 cOxsxKQ8l4CCJ668HxHAkwzAjhfXpzA02MknKMDcP6EqNdBo6cYSi0IeK3sur8sTHobIbATp94K
 8nj/4oIDDrwoxMYcccNwBXQE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id da1eddc643cb8bda;
	Wed, 21 Oct 2026 06:08:03 +0000
X-Mizu-Trace-ID: da1eddc643cb8bda
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	osalvador@suse.de,
	maddy@linux.ibm.com,
	corbet@lwn.net,
	muchun.song@linux.dev,
	lance.yang@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	qi.zheng@linux.dev,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] mm/hugetlb_vmemmap: remove vmemmap_wrprotect_hvo()
Date: Wed, 21 Oct 2026 14:07:56 +0800
Message-ID: <20261021060756.4599-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261019090830.1917657-4-songmuchun@bytedance.com>
References: <20261019090830.1917657-4-songmuchun@bytedance.com>
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


On Mon, Oct 19, 2026 at 05:08:29PM +0800, Muchun Song wrote:
>Shared vmemmap tail pages are now mapped read-only during initial
>population, so already optimized HugeTLB bootmem folios no longer need a
>separate write-protection pass.
>
>Remove vmemmap_wrprotect_hvo() and skip these folios during boot-time
>optimization.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Yep, already read-only, so there's no need to write-protect them again.

LGTM, so 

Reviewed-by: Lance Yang <lance.yang@linux.dev>
