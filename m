Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277991;
	b=sjSIq983JSxtLnl/qv+ZghXCXw3HIZWG6Qoaq/2P6ybhL+j1HHlL5bFpXfhw8Ba2nwTY
	 nns2zkd9TAbthizbokIto5V7QvmsYQcDAqBuHEhcG2bDGiZNB2QxIkKaF/8p47e2Gg5of
	 XfN0d4DJD626IYqH6q+XCbYMc6WdTB0qmLM1njvtW4W/sHWPGaRGTiKZzvqVOQ2/gNGLE
	 1ya3USsWpvfwsHXMcL3GfGIdjiHo75xRu0NwYdp2fHdqocy+OHZshlhr08hiJsxxrctoU
	 Jt/z4tQBVzhidhz9vkgNNZbZQRd0b8oR0NLR9bkAzRx676Z9xhF2tddO/iX4BJhzi4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277991;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=GXTpqnKMRF2UhXCAIWMIqEeS5u8oD4PTX7PXriEks2c=;
	b=pkZkVxacB8oqnLayDIW5WOwMAzcmEH3IYL5XdYL+fA1fBRNgMk2Hk+5pJ8ucOsbawPes
	 YGYWzdMfxovH50ZJJISHnVv/zDtI5lIISxmwRukHby+h/8a3KHWKBAivgzy4PoP9NING7
	 jr9r+WDf0ohI8WNvU1pkzPNeh5hYziVL6/g5wxLecPQAJ7DF5x8fvIzzI/te7uDDzuvNZ
	 F3ki44Mdt1vz/FdK4otF9MVvBquPH6UDveMP6x/T7VohDxW4sVFblMCzqEsTe87NlbM+F
	 SA4sziCAqaLFOzm1EVpODtYrPHPAH9Cjf6cnvtc48q6SqM/BwqUqD/lBT61qT7LuFaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bCC6XhI+;
	arc=none smtp.remote-ip=91.218.175.251
Received: from mta0.migadu.com (out-251.mta0.migadu.com [91.218.175.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C191606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C191606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bCC6XhI+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GXTpqnKMRF2UhXCAIWMIqEeS5u8oD4PTX7PXriEks2c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794277988; v=1; x=1794882788;
 b=bCC6XhI+ltgfCDsf/yk7F4CyGxAl/gCpe87iypya3QEAuULhSPaST+YpcdHmlKmUk0i/ULYe
 mGg/+3kuRKtpsDDiX5OsEJwj+AjIKaxzynS4Sdz5oLLaQIn74HmTmlsfqzaEA/70RGPZNbGQaES
 UgrteXZg6P2tnQHPlEsQt17Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 9b9f986477d9f7b2;
	Tue, 10 Nov 2026 02:33:07 +0000
X-Mizu-Trace-ID: 9b9f986477d9f7b2
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 2/2] MAINTAINERS: remove myself from MEMORY MANAGEMENT -
 RECLAIM
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261109-maintainers_mglru-v1-2-c25e6de60bcc@kernel.org>
Date: Tue, 10 Nov 2026 10:32:47 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Lance Yang <lance.yang@linux.dev>,
 Ridong Chen <ridong.chen@linux.dev>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <105EC3D5-3A72-4617-A6AA-9E37EDD836DC@linux.dev>
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
 <20261109-maintainers_mglru-v1-2-c25e6de60bcc@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 10, 2026, at 02:31, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> I don't really get to look at most reclaim related stuff. For things
> that are actually relevant for me, I'm sure people will CC me.
>=20
> So remove myself from the MEMORY MANAGEMENT - RECLAIM section for now
> to have a bit less noise in my inbox.
>=20
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

