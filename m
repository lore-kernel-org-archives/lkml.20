Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952000;
	b=Cn+SOrqD6qXF23tL322w5je0KnRzpUmmiUS3N8L9NXO0KRmwy6kg8i7Pua1FA/j/2lhC
	 Mnu5/vadGc/Ap1v73+UChMYT+H/rda0QdNI3yzLQ9kBS6gc3BQATaQMfXUO80ioQiKMUS
	 UhT3MrE02HkyYiihAiiIahF0Ks9TR9jANKPiFWgL2y3Wysv9kQQYmn6FsTEL1kTV1jpoJ
	 A3JXnEaHcvi3ma6teIfJ6Iq0zc04HUB9/K1HYi5YlRUXqrKXaMkAWKIcN8RpCApFfg1Wg
	 aEHnLdm/1dU7i7kB9dbR/A2s8A8aQW/MRYoQXc/XAPsqPbQqNlfsgQIkMqEjZT5ZEcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952000;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qdnMAlZZHT0XekQPrSCiPCqqcTykoSAZA6qRfBxzlM4=;
	b=5HLzXI8aquzX0QyyzFk2A5K3MDfetzXDSLiazf+p3+Q/BVGYh5h4+K0m/UOXyrBlCCEo
	 D6GIEpWepWQS9GWCkhe/zzcyyVvaQFffpTN7GkJ+NCybk7hNGnzMhXs9ZL9q1D9il1tR3
	 mE0Ke9Vs8EyLeSMiplios72+WeuIvyiIFmVoE243+W6sr8tLKpHHIfjC95tGhM1tvCKc1
	 HFWP6T+g4jJkPOyZHQxZ1mNmr9RWFv7+kR1MrgJJ7w+GNJwj3ISJ1RN0ZS282L7Js3zzI
	 EOLAHkk/XJ2XcAr287Hwf63qYDLqPteYlfO9xkR5qvx5KJ9ho6bmkWJ+nyyIso4T9Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AAfP9Y7e;
	arc=none smtp.remote-ip=95.215.58.27
Received: from mta1.migadu.com (out-27.mta1.migadu.com [95.215.58.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912C1606EEB2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 912C1606EEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AAfP9Y7e
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kjWEZaRnpbQPyxgJ4wJyDqlnc6ape3Q8i+3y7DTnhuw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793951997; v=1; x=1794556797;
 b=AAfP9Y7ezAT+sAnUC32UUWcy5UZR/XKOXWl8ExQBF25yRlP0fkljM3aoDoehs461HTMf36Wn
 bIVUEki97elFAjMFyOFqQKdIzB58V36IgSuzy243HkUt9mAqr3hGiV3LUyFyi0jfxSokBPbhQUV
 MuveaTZ+xfdAkasVW7xqg1wg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8a365bbfc61020ef;
	Fri, 06 Nov 2026 07:59:56 +0000
X-Mizu-Trace-ID: 8a365bbfc61020ef
X-Migadu-Flow: FLOW_OUT
Date: Fri, 6 Nov 2026 15:59:45 +0800
From: Hao Li <hao.li@linux.dev>
To: Harry Yoo <harry@kernel.org>
Cc: Zhan Xusheng <zhanxusheng1024@gmail.com>, vbabka@kernel.org, 
	urezki@gmail.com, paulmck@kernel.org, qiang.zhang@linux.dev, 
	akpm@linux-foundation.org, cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, rcu@vger.kernel.org, linux-kernel@vger.kernel.org, 
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH 1/2] mm/slab: restore the rcutree. prefix of the
 kvfree_rcu parameters
Message-ID: <au2IvrBEimc68XVl@fedora>
References: <20261028134647.3176080-1-zhanxusheng1024@gmail.com>
 <auIRU802S4Z4yAmo@thinkstation>
 <auiedkWD41Ok95TT@thinkstation>
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
In-Reply-To: <auiedkWD41Ok95TT@thinkstation>

On Mon, Nov 02, 2026 at 02:33:43PM +0000, Harry Yoo wrote:
> I adjusted my feedback. End result:
> 
> mm/slab: restore the rcutree. prefix of the kvfree_rcu parameters
> 
> The move of kvfree_rcu() to mm/slab_common.c dropped the "rcutree."
> MODULE_PARAM_PREFIX, so rcu_min_cached_objs and
> rcu_delay_page_cache_fill_msec became slab_common.* and the documented
> rcutree.* names are silently ignored.  Restore the prefix; the
> slab_common.* names, never documented, stop working.
> 
> Fixes: bbe658d65802 ("mm/slab: Move kvfree_rcu() into SLAB")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
> Link: https://patch.msgid.link/20261028134647.3176080-1-zhanxusheng1024@gmail.com
> Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>

Reviewed-by: Hao Li <hao.li@linux.dev>

-- 
Thanks,
Hao
