Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277829;
	b=VA2N7XokBA9gfzYtCoq0HEvq36jWyTYnuqKVDp+jiOdMH3GR8N7/7b8YdMKeC8DCNb6A
	 aXJgwxlUl691Q/hiDirLoA93bgt0APEftO7u2cPrZ5LbaLhGx1cNJXv7MrSRbDu5qe1uQ
	 TSNN2tR2Ysk0LPKvgL/+XdeAk7isZIMNIvkNaDNuUNjULnx2NPX3VL9lkdM6BQXF5dHQF
	 C8H51A6X7MqhCbIsHtYIBUnSz/noP2VSaKN6rnbjkR7SC2znY52IAqMfOtZxzKE0ndqS6
	 CmuRMwsq5pV9VxHjmHhD1Aa1PTnUNxEHtRNo1S7bavvfh9IUeDrVGVduH9Kr9l9pDoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277829;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=V/gmZjOtCuDSQAnk9X0MMdk2XbOQ83sIc3JPpm8qHkQ=;
	b=LsN3DJcHyVjFXk3HHqg2CAwzhohD65CQugL8yA546t1GjTtzspecomIuwcFWMpV5cR7s
	 H885Sqw8T+vSe76fgvU1em3sKvycu44RgsZvMH2Ra8ESr255wkKJ8TZ/+XqBF0FrxFCe5
	 oH0ZvZXPOYpEPHFPjbtVe2f1bqKHUJWgz9D5orS2mAAo9LkBhMTw7onVmfdZZhvk918NP
	 sAKnVLTfeI+B6AWnXzNibcJD1diEBQmBLwmdEs69M5lCEQOW+y8/GYEiCdhk090QwswhL
	 Xj6q9Kw8M/raieD0eyNZXCG65UKPPzbW12a6o2XLatfK+Z6+K8qpylKhVdS3Pr2fUYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="quX/UTp4";
	arc=none smtp.remote-ip=91.218.175.220
Received: from mta0.migadu.com (out-220.mta0.migadu.com [91.218.175.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6771606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6771606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=quX/UTp4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V/gmZjOtCuDSQAnk9X0MMdk2XbOQ83sIc3JPpm8qHkQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794277827; v=1; x=1794882627;
 b=quX/UTp4k3eA4RJJpIGCwA0ODRV0Ssa3tV+TXKVITdFXQZopbC+9oDbccFd0W6iZb7xdNBPD
 GU8MqiMlx2UHmN92Z6z2x4oOAWfwUyaEvbCluYvN8pkyitai1YoSXR8ohOStv0/Fq60x/bF/ufz
 NcORZgAEd/2H0kun/pxw57YQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id fb7a0a4d731dd829;
	Tue, 10 Nov 2026 02:30:24 +0000
X-Mizu-Trace-ID: fb7a0a4d731dd829
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
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN
 LRU) update
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
Date: Tue, 10 Nov 2026 10:30:08 +0800
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
Message-Id: <592C1134-FBA5-41B4-AB79-D6BF5B4883D8@linux.dev>
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
 <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 10, 2026, at 02:31, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> MGLRU is currently the only MM component without a dedicated component
> maintainer. Fortunately, Kairui and Barry have been actively
> contributing to MGLRU and have volunteered to take on more =
responsibility
> by officially taking care of it.
>=20
> Given that Kairui is already an established MM component maintainer in
> a related MM component (SWAP), add him as an MGLRU maintainer right =
away.
>=20
> For Barry, the idea is to transition him towards a component =
maintainer
> role over the coming months, starting by moving him to the top of the
> reviewer list.
>=20
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

