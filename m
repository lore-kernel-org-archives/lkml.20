Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793750890;
	b=GgKanC3pvTcgjzWAlKU9qi3LjIBWPNrbWyd0kCdMtQEZL8ne+0/XZ/3N1XTP//MdSToM
	 L7qhkTr4yCpUU7JWfq9MF+wit6sZ+fFv32UiXEwx/fF7owvcPHzNMkACMOb+boJFoHN2U
	 oaVnlrEpQy6oTQBO8twmzWhHAfSuVNv3tA9EvUoE6vFitbidBwmzOuea56ZKArNMPlwGe
	 iqQQSKxI7iBrs4q/lvxf5iRM8KfxzWevrIl/qR2AFRJHGKlKgPwFE3XQZsrYn0Mna3bXW
	 C0Vsw/ngpDR2/cKvjhspOFfXU0o/GGDRICF4kchoEsnNmOTtziqFUndm6Lg0tYN36Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793750890;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VQlFV3h8W4hzcc3wXLAhqdkni6VgrshaevEowsNExCQ=;
	b=Z6R9qHJKSZq1WkdDJSffN9ljpdcMr1HJOlsNXjugQCJp5JARFf7mS3/f9YFiOLLLjAfP
	 DPNFpdPjFA4bCJIb99l8QLf+XGac64E7tKpGVe6pG9RUYPcyWSJm+eGCMgDWLCq1FsJB8
	 GB4b7ex44zqOQU2C0gPYdQw9fEPmcVnSX/Dx+J5a0H60TNDM1DJLiWvB3hxEGN8JmBJHG
	 HMS+KHmr/s+i6hqbiuIpmqctxSU4nxht0KKQOpMYKm9b/vcEPsWzciCVzDdVN9mqfttZq
	 KX5vqO+FRJxQ3j8haUz/4QbNLd+BGvA/qpqhjijTCdoXmBBaItMTydQKt3M04cxtt1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AzTo5fQd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E61606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AzTo5fQd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D1A1F000C1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793750889;
	bh=VQlFV3h8W4hzcc3wXLAhqdkni6VgrshaevEowsNExCQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AzTo5fQdsewTd2AiUmb/7d+25HXOqu8+DC38kun+rc0Fg/iiBZ9h8xwozHZ8oKKaQ
	 qCFO9A+a2dnhDrJDhwj4tCympaqPPsDbenICxQM0LbGl5O/8hrtlmsd5SmL7qHwCR9
	 gtbbJDnLhTjqVsCezKv2lDGDGSrNBCOCNliAzvPoiWaAi20PP15ODXcGIjwpX9BsEa
	 Mg9KuyIW3TdfTFaC+HWa1W1xSbP0797qhv210gNNB5xSv+qWYsUscu+jD/DCG2IZSr
	 lUOC+mZXwm+gGIpMqA0m8ogc8D+mfNYQURO9EQt4zExSSCK0Zhd3fkVVToMR4kQBbN
	 VlyS91ZVM7HAA==
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f269e335eso19118685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:08:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzuWbG3o31ag9mXYO+E9xkko7JU0C+k6rL3YIWIt062jjV+6jnOikcDHiTo6t3LSR7e9muJheCe6IlHIqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/daspIcY2Ljo2vZJyE+eH/RKNEfOuZk1rMbnH3W4jNY0sGmOny
	uaLE+tRX7WV9DssulGlSvc6ghPg84YZa7jJmp9nhvPVs1YCHD+m4erjaW11DLIrQZQn3fOOm/Sl
	HslZ9vu+e/pSXzEJCTvnk2HvFEx/jOyA=
X-Received: by 2002:a05:620a:444c:b0:93e:4d60:d389 with SMTP id
 af79cd13be357-9442163032amr2590329285a.25.1793750889004; Tue, 03 Nov 2026
 16:08:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <SJ1PR11MB6105E073723CFEEE8C8EDBF48C832@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <cover.1791577417.git.ehab.ababneh@intel.com> <CAGsJ_4wmSL7i4EPLWLKhDD6J=1TywBi5EYYDxp=SvOuXdmLGjg@mail.gmail.com>
 <SJ1PR11MB6105E839E55E9B0BDE183E9D8C9D2@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <SJ1PR11MB6105A05870574FF39B449CE28C692@SJ1PR11MB6105.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6105A05870574FF39B449CE28C692@SJ1PR11MB6105.namprd11.prod.outlook.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 4 Nov 2026 08:07:56 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zwNo3pqXkE_XrcU8ar7mF1O+q+FOxZc-AZeO6go9PxNA@mail.gmail.com>
X-Gm-Features: AclHuK__-B4xhragLAoUY61P7F488BPbmVRI2qru0syH4YCL5Ok566Gx0Ciw0z8
Message-ID: <CAGsJ_4zwNo3pqXkE_XrcU8ar7mF1O+q+FOxZc-AZeO6go9PxNA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] mm/vmscan: adaptive multi-threaded kswapd for
 NUMA-aware reclaim
To: "Ababneh, Ehab" <ehab.ababneh@intel.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	"Hansen, Dave" <dave.hansen@intel.com>, "ziy@nvidia.com" <ziy@nvidia.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"buddy.lumpkin@oracle.com" <buddy.lumpkin@oracle.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kasong@tencent.com" <kasong@tencent.com>, 
	"qi.zheng@linux.dev" <qi.zheng@linux.dev>, "axelrasmussen@google.com" <axelrasmussen@google.com>, 
	"yuanchu@google.com" <yuanchu@google.com>, "weixugc@google.com" <weixugc@google.com>, 
	"david@kernel.org" <david@kernel.org>, "ljs@kernel.org" <ljs@kernel.org>, 
	"liam@infradead.org" <liam@infradead.org>, "vbabka@kernel.org" <vbabka@kernel.org>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"jackmanb@google.com" <jackmanb@google.com>, "baoquan.he@linux.dev" <baoquan.he@linux.dev>, 
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 7:42=E2=80=AFAM Ababneh, Ehab <ehab.ababneh@intel.co=
m> wrote:
>
> Hi all,
>
> I would appreciate your thoughts on how we might achieve a similar
> performance improvement without increasing the number of kswapd
> threads.
>
> In the previous patchset, using four kswapd threads reduced Cassandra
> p99 latency from 6.5 ms to 3.35 ms (about 48%) and improved throughput
> by 10.3%. I believe this is a substantial result and worth pursuing
> further.

Hi Ehab,

I assume the performance improvement mainly comes from
reducing direct reclaim by using four async threads to
reclaim memory. Is that correct?

>
> To explore alternatives, I tried increasing the reclaim target for
> kswapd passes (testing multipliers from 2 to 100), shortening kswapd's
> sleep intervals, and making it more patient before declaring a node
> hopeless. So far, none of these approaches has produced a comparable
> improvement.

So basically, one thread isn't sufficient to reclaim memory
in time, causing your workloads to fall into direct reclaim
frequently?

>
> I would be grateful for suggestions on other approaches worth
> investigating.

We have various types of proactive reclaim that can run
asynchronously in parallel:

1. Memcg proactive memory reclaim
2. Node proactive reclaim
3. recently, Hui Zhu even provides a bpf-based reclamation:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D48ea1ba704aa3a9

We have these approaches that allow userspace to
flexibly ramp up reclaim before we have to fall back to
direct reclaim.

Also, if you're using zswap or zram, compression itself
could be the bottleneck.
There was a proposal for kcompressd to handle compression
asynchronously, which has been on hold for a while:

https://lore.kernel.org/linux-mm/20250430082651.3152444-1-qun-wei.lin@media=
tek.com/

Or, if aging is your bottleneck, perhaps something like
async aging could help?

I'm still not sure where the performance improvement
comes from. Is it mainly due to reduced direct reclaim?

Best,
Barry
