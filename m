Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463577;
	b=aC/gLftbhvc9sDg8h7r6OQk2L7SzT4ymVazWv6U/fQm5ynotvijQMjfzmOj8mMNIJYIY
	 GjP+Ck88vk22qn8iqG2uK6zN3FmnHeYdvAGa/DvlZmAafsKf9C8IuavZWF2d+Er6bgmcF
	 gJWccOSySk1aPdHQrTWiqOseBJVbgJBHJkxEdlB0W3uObch+N6ZFxOcK9+g8YgtEv+VSb
	 dfidc2JqN/3s65OmJRlMIJ377mvEXeZRX6CDgTjFsJlMoPCNRWqLSijyZkHHZwl2N0GiE
	 5vdVwxjv2Es0AGmX/oiEYtMSKG8h0aIgk2x8QkLgjkLDTd0Rsjiwb5nhEHOT86hSqGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463577;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=+UeasOj6C0QSBv81NOjtXL/pSwcDJf+q6grtY75QD48=;
	b=b1NRTJhsgPbF1+nvvNNdPO589dnr+oOpY286eUKSbghLGUuiKXEfxcqSTQaJfm81k24y
	 xNorpIzDaX8uKYKnHEDm+gQDQi2mtjq0xiuBp0vSKUV+KRAj7b27miPC4Ph/WSuZb130o
	 6Sj0OZ4pV3s8QHUQYbGwRb8g3LJcwZwBscX/cAf2PS2JyQREm148NK3vxQ2iGJmWAPVnJ
	 Xf3WhnrsRcWIldFnd6VyTeypePBMjlsmyT9ybEDqh8SL9JnGsAdZ1YxRYMqIZTrnS64T7
	 IpHj5vnDOHUyndu9pgKAiqGGJJoA8+GjPzSxtNKffc/KGimSlzHpi2OKL3cQU3D/ToA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jgBMRNhe;
	arc=none smtp.remote-ip=95.215.58.144
Received: from mta1.migadu.com (out-144.mta1.migadu.com [95.215.58.144])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A28F606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A28F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jgBMRNhe
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+UeasOj6C0QSBv81NOjtXL/pSwcDJf+q6grtY75QD48=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792463574; v=1; x=1793068374;
 b=jgBMRNheZKBI5mN5E7/ygI01+OFOk9dLk3mfNcNlhr/2K5tksjaBe9b9XywguOAT6nYV4j4e
 Hcs16QQgHVkYMkPGmmhMJ65IXPtKIiA4Cw20stlqJD9ct3HzAYPYQXW+d1SCWPWkTUwBpi/9RhL
 C4av6/ba0qR4JfXR/j1x/jrw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8af93f4628e3430e;
	Tue, 20 Oct 2026 02:32:54 +0000
X-Mizu-Trace-ID: 8af93f4628e3430e
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v3] mm/shrinker: allocate shrinker_info_unit from a
 dedicated kmem_cache
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261019-vstor-144715-shrinker_info_unit-kmem_cache-v3-1-0fb061e09bf4@virtuozzo.com>
Date: Tue, 20 Oct 2026 10:32:34 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Dave Chinner <david@fromorbit.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <285B262E-95AF-4BBD-923C-922DDDF0E70C@linux.dev>
References: <20261019-vstor-144715-shrinker_info_unit-kmem_cache-v3-1-0fb061e09bf4@virtuozzo.com>
To: Konstantin Khorenko <khorenko@virtuozzo.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 20, 2026, at 00:11, Konstantin Khorenko =
<khorenko@virtuozzo.com> wrote:
>=20
> shrinker_info_unit holds BITS_PER_LONG atomic_long_t of deferred work
> plus a one-word bitmap, 520 bytes on 64-bit. kzalloc_node() takes it
> from kmalloc-1k, so almost half of every unit is padding.
>=20
> Allocate the units from a cache of their own, sized to the unit. The
> cache is not cache-line aligned: the counters of a unit already share
> cache lines between shrinkers, and aligning the unit would only keep
> neighbouring units off each other's boundary line, at the cost of part
> of the saving.
>=20
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Assisted-by: LLM
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

