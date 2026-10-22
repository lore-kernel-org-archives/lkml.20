Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641384;
	b=n5+feLjuLRHXlCCgvdBHre7mS6hOnLqYeYeJgYX8tWoMxPN+t95lrK6RBeN9zSXnb2Nw
	 QJBCgLZZep1tvDzmaT4v7dpJjdN/NsoobknKD4uz1jcikijY0My+lHL0babosTaAaHzRx
	 XOncbOGA4MIR5GUPgUHBF0+9xwxHZ6TubtTRmKeqKPkK3LgAgrK1nv+AvhRnhUEoIfl+h
	 W2Y+ABY5DE4FgdMI6pOp+YI0EnoSxx/7JAtH0hzb4lfeC57Kt0IBe68g2cXUi7GneDeSD
	 G4XYRkJIDeR7E8B4OCeZkPyyF26HV7d7c6Dr42IaZ5iGqPnw2sIWt/dSYcMJieW72GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=nBJVMizSkP5mIMubRGP9eWHn8SLS+RX8waQiqIH32K4=;
	b=Dzt6qhb8b7jkqxRVx7NrUCy8U27Z4lYcltncVENxwprFrPaLHANN2kbxKqXBPHzW/KaL
	 1x6RDgEotJWyKmLS7EVO2+64PiEwEIADNDaGcCgkny88naJswZ9oKIbtYMRiatJICGOGP
	 QkkvwfiMnqM4SREAc3QVdP7zfJyX8/SPmgNpxdQ3B5YPaEaM7J5/i68/JSxKQTeXiW3lS
	 OYOiKLGraMqwW9gOmhkBHsZsLfPFhKD2ANoAzpNWpklPQdgKvQhkJw0jJ6Olta7mud8rZ
	 3mbWag9l0+cVGrXzF+ynZlnlKTZ1w0eERggbLvt1AjU+pdL5LToYw/sD71vH4sPWpSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=onuWEefU;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD493606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD493606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=onuWEefU
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f20b304c0so164922285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792641383; x=1793246183; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nBJVMizSkP5mIMubRGP9eWHn8SLS+RX8waQiqIH32K4=;
        b=onuWEefU2jjcs+hCjUkLSfdNl69v6fK0TFmwOd7kcR12a6A+gkQYVGBnE9SCneJp34
         OD+o0tgqfx5K/2B1MsiIpnBswsXjL4yIHRvlekKvfiFnHRLApQH4xtEDYw8LDmJNew2T
         MftfIYBedbPSORbGkJ/2pJPSY8a3Af/n0E1eGUYdHjRdxQmVGOdVm0vrum0O64RQoLoD
         6BlwrjGgv2AcZSJTbuS5sjccrjvqZKoxiiL+GlPoe8HGjldsmgPnfYfZTjU3s7zYycXG
         bXsyPwQlkIvXfryr1Qr2xs28H2bZf1hRDGT0Py1cdiMvHU7Q7MrZpNA2eRb5bPFibZE2
         05wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641383; x=1793246183;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBJVMizSkP5mIMubRGP9eWHn8SLS+RX8waQiqIH32K4=;
        b=jqUXNsuZqVCH1yleBUgmTEbT1oEc3ktOnRtqua5DqUvRLmJE6srL1Vh8meq9uB6NHm
         kVDO+iT/+WMFCLd9qbTjFZxYisYlnGd+kVaxrNnjVKXdJe1rFK9oTFq/WLBgD68dKpbK
         Sd/CyyMcIDDOMyGz0O351PGvZBBumJOjmaoDQPZH4VbqMmG8BdeochgX346mYqRNTrLR
         KO4q5T959ter6H7gD2AYBUASDa1chPLjlEOxJ9pK0s9Z/7OPMITdVHb9EmAzeaXB7HZj
         DE+qpnVbh/0O9B0l68xu36MZKh55TKJGJtgCwYn63wfhwqjjBRhaOr10T2+D5naqDp5F
         56dg==
X-Forwarded-Encrypted: i=1; AKwUvBzy5sbvrDcETDzy9rj4srz5vWT7yBNuI3cUrgS3qZa64P5lbkGRdDtUdumuD8CDmYsUsr2oVM72c1mbeF0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwiQfW0xlw6mvHEV0+QFbFB/g7Gv5H0HVajELzCCfUlgq+/qe5
	GWn4ENYjxhjRczbZUScLxptZ6x/VP5J6RqVohEP+FlsoGcqMHJv/OrsAGWmNcStTaHU=
X-Gm-Gg: AYBFou1AinMgdImD7jq9IEnOvuHG16Lj1Ng/+1jKdO/4YrQkzwJsWVi9t/mzGlsBuJs
	CkziqroQPINohGa8lBMyad5L7PQsluV3tDIj4H1LYviEXfz0UbjX21wYCSGH5VqQrMntiaHXZCI
	yzgfenuGZeI30peKC7hGzUSzrRbg6Etg0zsmDsKUfLgbFiyltM/zjErAJx6Nawg5ySTT5hSvidq
	dvfvvqy3kP9dFHfc7guR/nrRrEwNMunlPnwoxGeTIB0SJ1erc5rxp8Bhml0PcAtIaLIbMnst6OI
	W/3SMpYPwSpi3HbwbFkmcW9RMuJjo/UvbBURo4BY9V1jhpIs9/Gen8rtXXZ2xPus951FbJtnR12
	i0C6Rga10UIq1TvY3xdW/VARMBIF613/S60IdXIsGh7qiElTQ2DkaHcA2+YHMZlCltAVIXsdZyp
	v83c92L0HCD9hVHBiIOTVbeaCZo6n6EfXNTRb7wpJYcKt3KILE+M7NioII9kYEbFy53477OXPhD
	X8r/twk0D9Br7hTCxkZGv8Wxo8FvVuQI9lG2VJv7EuyI+wD4DsIsOxfQEVg3j9GOZ2yydXtDhOs
	rH9qOw3tG/NdYUDlTH/LthDHt3s=
X-Received: by 2002:a05:620a:6f9a:20b0:93f:6182:53d with SMTP id af79cd13be357-93f618206b2mr208635085a.3.1792641382767;
        Wed, 21 Oct 2026 20:56:22 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d9a495sm423380985a.13.2026.10.21.20.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:56:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC 0/2] mm: add source selectors to memory.reclaim
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: Gregory Price <gourry@gourry.net>, akpm@linux-foundation.org, 
 david@kernel.org, ziy@nvidia.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
 ying.huang@linux.alibaba.com, ljs@kernel.org, mhocko@suse.com, 
 muchun.song@linux.dev, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
 weixugc@google.com, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
In-Reply-To: <30457046-a662-4ff7-a6a8-100398d7a806@bytedance.com>
References: <20261019141401.11927-1-lizhe.67@bytedance.com>
 <atY-LD2AzCYATRii@gourry-fedora-PF4VCD3F>
 <30457046-a662-4ff7-a6a8-100398d7a806@bytedance.com>
Date: Wed, 21 Oct 2026 23:56:20 -0400
Message-Id: <179264138036.2549665.17429111144570830454.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-20 21:01 +0800, Li Zhe wrote:
> On 10/20/26 12:10 AM, Gregory Price wrote:
> 
> I agree that the kernel reclaim and demotion behavior still has room for
> improvement, and the watermark changes and the bottom-up proactive/async
> reclaim idea you mentioned may be useful to explore for some tiering
> scenarios. But I think there is also an unavoidable userspace policy
> component here. The kernel can improve whole-cgroup reclaim, but it
> cannot know every controller's placement goal.
> 
> For example, one controller may want to keep a specific per-tier
> resident ratio for a cgroup. Another use case, as Joshua pointed out in
> another reply, is reclaiming from a lower tier first so that later
> top-tier reclaim has room for demotion. A single default memory.reclaim
> algorithm cannot express these per-cgroup policy choices.
> 

The latter of these should probably be some level of the system default,
that's why I brought it up as well.  (proactive reclaim should prefer to
make progress from the coldest tier first, then work its way up).

I'm not convinced a reclaim interface is the right way to affect a
per-tier resident ratio policy.  That feels like a hack to get around
solving the harder problem of something like tiered memcg counters
(which would otherwise drive reclaim to work exactly the way you
describe for resident ratios).

> I am not sure whether changing the default whole-cgroup reclaim behavior
> in this direction could affect existing userspace dependencies. In the
> old nodes= discussion, Mina mentioned that Meta's reclaim stack relied on
> memory.reclaim triggering demotion [1].
>

Yes and on its surface this is something I could see Meta using, however
I question whether we're simply trying to find a convenient way around
fixing reclaim to do the right thing (not invert the LRU, apply per-tier
memcg limits, etc).

> I also do not intend source= to lock in current reclaim implementation
> details. It should stay consistent with the current design: source= only
> selects the resident source to which reclaim pressure is applied, while
> the kernel remains free to change the reclaim policy.
>

Well, sort of, you get exposed to the implementation details by having
to negotiate what is considered progress under different scenarios.

Lets take one example - what should happen when:
 - 2 node system, node0=DRAM, node1=CXL
 - zswap is configured
 - echo 1G source=nodelist:1 > memory.reclaim
 - node 1 is pressured, zsmalloc falls back to node0 to allocate

Should that be considered progress? We reclaimed from node1, but
increased pressure on node0 - which might have kicked kswapd or memcg
accounting to demote memory from node0 to node1.

Should zswap also take that nodelist as a constraint?

At the very least i think you need to add details in your cover that
demonstrates the process of doing something like per-node resident
ratios, and show that it works as you intend.

-- 
~Gregory

