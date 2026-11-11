Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421038;
	b=LS0+hp1Q3ZP8hwbFYABa5WVGjePRkf75mKbhpLkd2SniSd4bVPQ8p4OhwqtCV3bX7cdm
	 2bMtR4el9dZlVeVsWMl6t8RTqkLG3/8IpGe/4l9v9v8j6jZOnzYz1+rOvIbBAnAGqGY2S
	 NKTYNvS+erWe2t+cBTq7+DKl02FcAQbQyEkxkyCrAQs04DhlgnPXMBz7WGbKfxSCLj4Qq
	 9bISWBhllerdW5wyB+sDFiXMe0k6lHNGaEjoy2T5FuA3cD8nV6o6Mywlnt4hWvTGV2GsT
	 Y1Povs6M6A7iIB/TpWoQQ5f862qRku2mG/BF4oeCuKorQeyuzdUron+OR+6jVJhZ1Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JAFBic9FeqiTcoA9Sc56oOZoN08uUZIC/3Jq0YqoHLY=;
	b=pdaxXy5Hsc8/1Z5f//KMNGpPc3u83V7xSxIIs2lw9z1uTEZlwQ+fo86gxWreD6qpz/qU
	 tj5wJ+3BRJ+6dh9m2BaweK4DK9puP3gJWrUmgPr+dRb7U1+wSL3gAlPQ0Worc2lnDZZxE
	 tGAEBsqvE5X2KpmBnUtyuE90V2BY1sWWsGgdTz7vJ2LMOEv+1QxjWJOfddMrlWVkbakg0
	 43VJ0x36IXLoVjz9VGrWYn+Ok5TngHTTwxJ2LZb/nbZYjmvCE5CJesexCgLfp1cvXr7TP
	 QUNAl1Qc08jZJHyoI8KvwsvgMZJLBPY9wV2PfvK+RerSJR2bozGDg/JY/7dh9wqh6+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhRh2+QK;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66803606C176
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66803606C176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhRh2+QK
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso48321477b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421036; x=1795025836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAFBic9FeqiTcoA9Sc56oOZoN08uUZIC/3Jq0YqoHLY=;
        b=UhRh2+QKrJuMUqoVkAZwLp8mjesVP5rOdbeqxz4Qd7xPhFQ7cqnpBQcOCKce2Dv+Ys
         JDUyUFr3MiMLq6MxAJzkSqEfhTzdl76LeLgd+pOsMx2+XeQYBoYuKI7QkF1fp8IymDmk
         KJX1eeF9+XTsdNrPc8KEwUSLMb7634nwNpC+cTuxn0Z2TIOeFQMk9n/Y0ie3/+B/3X05
         7xZwGQl7MS/HdOcR4MHHCdM5R+x16qvI2Pj+MyhpUkNOORYFs5pTh9M9jPGXP7mIW18c
         9Sfu3b+GWiqTy1rQATsAE0TIfLiAlTwki7umXwi8lBrYXDH2KUD6EEKFHHhrwwKziBC0
         RgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421036; x=1795025836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JAFBic9FeqiTcoA9Sc56oOZoN08uUZIC/3Jq0YqoHLY=;
        b=ZaRFcoKYoIERR3kFpODMlJ2mjYd/FFGMpDSla1rxsSDOmOY6/8CSjZoImVUSTbvMJG
         o5oxpUmabjvnuZPW+2ocWl43a9rV/HYZGH1G53V5pTUI009D+z1ryGL/j3OCODa49I2X
         jwOLxjAQRqoyZ9RROfViyT3o4cAGic4z17JfARKSlp2FzyOkkK8hFRGeGwMWAeASwqrF
         sr+jkaMpZu6y/Ho8/j4Dxo8WaTnxKJhLggSSJe//7yKiMsgZfuGdwl0THj9nXuJwBPBx
         IQ+1OXzBOUcpFycAEzSJDfpwMVnT7LcosgXmNhl7NNI/hzFXKIYztj8CW6l0VIM3lW/Q
         NfEA==
X-Forwarded-Encrypted: i=1; AL+hErFW9rANQHKscfJaXHT+tHvgv/qDY2A0KONsYceBTMmszH1AyJE37+L8gWXuGYGCub4GD15dx/TFk7EG27g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mSuynEhrOjH4cV2fZv0OQ0Pn/6JAXAy3vz0Rl5JXYQOGysjEa
	TGNdtvy8aqlNhFwCm+NQEXn/5bL+cNthnLXQDdVjSk9m2meTfkMvEaFa
X-Gm-Gg: AYBFou3roZiqXOY5lFiBe41W5S+UQrMgHnHb9oSBJaBDzLD/oWJaZPJLPOZKrtCYTlW
	xXaAOKewt5e25fG5WEBsV6nSkcL8mv7H+5edpz9mbY9Euac7uZbmZ1otEFdRtTaZXON8I6SMC+F
	vfX5PcigYYZYnWl6JG1iBlfaxr9piPftdQO0+JikD6PZ3XZBKizP6ZDsLaU2fGIKaxStV64Wq0K
	GZJu5whFs7hn0uYzUs/Id/7ba0VdjN7owZk8Ky4r1plctq71MBLDIoUIOJ1VVc5hVd3oCQx9YmW
	XdmLd1JRO6o6146m92dzNvpGunXRtva2VdJTWgX+JBg17uFXP0uZjFn5aByiO7XQ/Ez6R2NfFFT
	MfOckqjr/OvxMgWvJ8donH+s+5dym+vOvBu3po+w0bMiYCZRX63R+uEy9zDBz2SIDJWT6cqKgx8
	ohLJIi/WxMbkosvKLfBA0On/qMEnxvb3OFJCe9cZogufFJSUFf8W+1wxjYn3A5fmpso2Q3LsfK9
	IYbDIwzyt0ekOIhJz6voMGBNfZMo2JJGk1eW+RrsS6spuO7PgIA9iWzHLo6LN6x2/HTJpRokNib
	TF8qFrxZ9LGOx5HgqKkCaT9eUZwAsTwXWc8oFFOT9HIhXhGEXrn+Xh0HhYoX2cXKZiVpwc8H31l
	jEzS0dw==
X-Received: by 2002:a05:690c:4f07:b0:8b0:d837:364b with SMTP id 00721157ae682-8b3a7e3b702mr19660887b3.7.1794421036454;
        Wed, 11 Nov 2026 10:17:16 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5b::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39324c124sm49936597b3.6.2026.11.11.10.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:17:15 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Li Zhe" <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	ljs@kernel.org,
	mhocko@suse.com,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [RFC 0/2] mm: add source selectors to memory.reclaim
Date: Wed, 11 Nov 2026 10:17:13 -0800
Message-ID: <20261111181714.1463827-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019141401.11927-1-lizhe.67@bytedance.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 19 Oct 2026 22:13:59 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrote:

> memory.reclaim is a useful proactive reclaim interface for memcgs, but
> tiered memory makes "reclaim N bytes from this memcg" underspecified for
> userspace controllers that manage memory placement across tiers. The
> kernel's reclaim policy is aging-based, and on tiered systems aging may
> demote folios before they are eventually evicted. Without a way to
> declare where reclaim pressure should start, userspace can only reclaim
> from the memcg as a whole and observe one aggregate progress value.

Hi Zhe,

I hope you have been doing well. I'm circling back to this discussion
to see if there have been any updates since we last spoke about this.

I'm wondering how feasible it would be to enforce some kind of placement
decision from userspace with this new tool. That is, I think I would be
interested to see if this solution was enough to grant fair placement
of memroy across tiers within a memcg.

Were you able to run tests to demonstrate how effective this was at
managing placement decisions for memory?

Of course, I think we should answer the ABI questions below. Maybe some
of the memcg folks could chime in a bit about what kinds of interfaces
they would like to see.

To start, I'll reiterate what I've said in the previous response, I
think we should keep this a node extension until we can demonstrate a
scenario where there needs to be tier-awareness (to be honest, I don't
think there is one).

Cc-ing Johannes who is a memcg maintainer but was not CCed in the
original series:
Cc: Johannes Weiner <hannes@cmpxchg.org>

Thanks, have a great day!
Joshua

> There is prior history here [1]. The old nodes= proposal tried to let
> memory.reclaim scan selected NUMA nodes, but the discussion left several
> ABI questions unresolved:
> 
> - nodes= did not clearly say whether the mask was a source selector, a
>   reclaim domain, or a demotion-target constraint.
> - The implementation did not apply the mask to the whole reclaim path,
>   so demotion could allocate outside the mask. If userspace interpreted
>   the mask as a domain or target constraint, the ABI did not provide
>   that.
> - Selecting top-tier nodes could become an implicit way to request
>   demotion without uncharge. That would make userspace depend on a
>   particular reclaim policy and could make future policy changes hard.
> - The separate completion-accounting question remained: demotion can
>   count as reclaim progress even though memory.current is not reduced.
> 
> This series takes a narrower approach. It adds a typed source= key which
> declares only the source on which the existing memory.reclaim aging
> pipeline should be applied. It is not a demotion target selector, not a
> demotion-only goal, not an eviction-only goal, and not a change to the
> existing completion accounting. Leaving source unspecified preserves the
> existing memory.reclaim behavior.
> 
> In that sense, this series extends node-scoped reclaim pressure to the
> memcg memory.reclaim interface. The existing node memory_reclaim
> interface can apply pressure to a node, but it is not scoped to a
> particular memcg. This series lets userspace apply the same kind of
> source-scoped pressure to a cgroup's resident memory on selected nodes
> or tiers, while still using the normal memcg reclaim path.
> 
> The main benefit of this series is to give userspace a steering knob
> for per-node and per-tier memory placement control. A tiering controller
> can observe the resident memory distribution across nodes or memory
> tiers, and then apply reclaim pressure to the source that should be
> relieved. For example, it can apply pressure to top-tier nodes so that,
> under the existing tiering policy, cold folios can be aged and usually
> demoted to lower tiers, or reclaim from a terminal tier when it needs
> actual charge reduction.
> 
> The existing memory.reclaim interface cannot express this. It applies
> pressure to the memcg as a whole, so on a multi-tier system the kernel
> may make progress in a tier different from the one userspace is trying
> to control. That makes feedback control of tier ratios ineffective: the
> controller can observe that a specific tier is over its desired resident
> footprint, but it cannot direct the next reclaim request to that tier.
> 
> Patch 1 adds source=nodes:<nodelist>, which is the basic source
> selector. Patch 2 adds source=tier:<N>, where N is the memory_tierN id
> exposed by /sys/devices/virtual/memory_tiering/. The tier selector is
> only a convenience layer over the same source semantics: it resolves the
> current tier nodelist at write time and then uses the same source-scoped
> reclaim path as source=nodes:<nodelist>.
> 
> The remaining issues from the old discussion are intentionally left out
> of this series. If userspace needs to control demotion targets, that
> should be a separate target/demotion-policy ABI rather than folded into
> source=. If userspace needs a strict "bytes actually uncharged"
> completion mode, that should be discussed as a separate accounting or
> goal extension because it would change the observable meaning of
> memory.reclaim progress. This series only adds source selection for the
> existing reclaim policy.
> 
> References:
> [1] https://lore.kernel.org/all/Y5bsmpCyeryu3Zz1@dhcp22.suse.cz/
> 
> Li Zhe (2):
>   mm: add source selector to memory.reclaim
>   mm: add tier source selector to memory.reclaim
> 
>  Documentation/admin-guide/cgroup-v2.rst | 29 +++++++++++
>  include/linux/memory-tiers.h            |  6 +++
>  mm/internal.h                           |  3 +-
>  mm/memcontrol-v1.c                      |  6 ++-
>  mm/memcontrol.c                         | 11 +++--
>  mm/memory-tiers.c                       | 24 ++++++++++
>  mm/vmscan.c                             | 64 +++++++++++++++++++++++--
>  7 files changed, 133 insertions(+), 10 deletions(-)
> 
> -- 
> 2.20.1
