Received: from mail-oi2-f23.google.com (mail-oi2-f23.google.com [74.125.231.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBFC3C1D4D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790031835; cv=none; b=oNWpt8OMB7VZJnlpCqcMgs77mAWUE4SAG4o4t8vM+iTeHw7pCoTNcojlz6KHE3xebOlkV/vLaToOZU0d0b6tN/DXIVYft+PL3RhruQRTDTiyKRx5E4XY04Jd8pO4u/TlQRATspfJFw9nyG3JAovFqQKzzPMrZTWXuPNSjvfUR0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790031835; c=relaxed/simple;
	bh=kh9puILIR9r20G3kwpzzv7NaVqtxLvbguKQW3SwMZ5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6WxNehbb38alkDevRn44acni7igpCXgq0E6+ttfpD7evAsmxVZS2Sgbv/bRie4IdfX6wvoBU0DHxHk1ayck7LYa3FGSmMVomUzC1RSPI8qUAUTqCtVDUtI2y0EVWedpB3E/WY6rKHSFeIJr/tBD0y0KE60wCuNB1MyPwaIDYjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJtiu6gf; arc=none smtp.client-ip=74.125.231.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJtiu6gf"
Received: by mail-oi2-f23.google.com with SMTP id 46e09a7af769-7f4f0d37dccso1939319a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790031833; x=1790636633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OdbPBPyzaOM2wXlSY62pNAL0ZMKs+usFBD9FO5JbEdo=;
        b=RJtiu6gf6NVWi16q+NFEmBHvIqrrqdw3bUrNst3yKEkzLY9nwfl3bJhtXM0mELCNkf
         RCdbB4qA3RIBfyTipAR50KyF9Bjm2eDI16LGJVZ4mgd2hvKxiV1mSRFCTSQjBwbH4QO3
         XT9Ax1UgRmZQpPeaCgltVBurOsXB5XhRy+ZtXsnSBAJcmv9PhC2WUblhPnZRthDQiH3e
         xESxURzq1Zw7hdsSI+aaxIn2P7oUBm9sqcF6nNRLMDNErYnYpuYXFvjgyi9yDdaKDQnN
         Y+lNKe7d0LBJq0f5yE6dlrQz+H8qs7InnnDgFCKNWNePWtNIpOymedxoGiTD4n7ifo61
         WcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790031833; x=1790636633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OdbPBPyzaOM2wXlSY62pNAL0ZMKs+usFBD9FO5JbEdo=;
        b=qHkgJvcx+7J4Rt+9b4FchdqwD04Pln9zstEreoiHrff/bl24NHVL6DFXfu6BPzjqx6
         GML1K1YuvmWP+vPKc0W2W8EpcTIKNKcvO4Ni8z4fOK87ZhAT2B1kq1EcenI51+/u5PIp
         N+NUrduFoAYQdZXCoL1LdGHqjmyoMDzN3F5IaGHEdKHH75nKNogxl5OhCCmivsXx2NbR
         NEVkci4XrtnrF+6k7XBNPe+aQNM3kqo8gxWC4O9zg+E83WsZ/DwXReg7EUVyzV+9z0HT
         p5wiW8SnUJlVWVw8uhHA+n97db53v/z5raY13yublYZfna2ZOYlprE2wTJ7239PJK7KR
         77EA==
X-Forwarded-Encrypted: i=1; AKwUvBx9zCqcrwbq8WwOZoHXd+RndR/OVl5Ei0T9WAuZQJKgoyQuWTVE3/UiwphnC0hrevDwzHqnX55FFw4dXgQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nV+b/DxR4hHkS7Bgv6cBY8hjpTJtZNL/DKP6F6k2l2vFCeempT
	NjiPBUBhISaUVNQbCSLWiOOrqYu29i2XJZJXp9/mznNdiUHU2lsvb6rE
X-Gm-Gg: AYBFou1Yq2CSGTIWfnqcY2U+WD6oCsb3oHbYKWILuHy5MZ0oAm/s9G8j3xWiQP3Zz7C
	NaGf4TFJxAcygaVlOcqo5O5qgqR9AGArqdoIBDmfYWpNlue29N05rYYXYEqwS+fUhswoO55jGiU
	sbSY23ZVP4SgmjzjnKaeLnM2BsArSlga1FE2InDHQ4oaJvc+MrE7NFs18yV+FEptfcg6ouFfz/d
	vWN0XdBOGHFqYD0oAfCwgvA8gb6U1WoNmNgdxBGcVqOBMHbkvXw03hRq/I+dN5wkTV1bKCAYb/D
	57Z03LvdF6z0YOgH/+nJ9ri2fEAgR01FrxpRTGhj4erQCQEbZCvb4+Hbth2hq6hL+Fi5+H+SLRv
	fP5XU+hz8ekEOrLJK8z7fG1AQrqX1PPcCwBxqvieWMTXERK2WHuY3N1OAego6UCeg1xXlF+2/0d
	tvF3LpeMJ2/AvduURGR91HcjBibMrR7v9Teb3h5gOSbQq29TBoy70XttHpv1bePq5HB5+v7vks8
	eKRq0JYczGfyLbGKdZXj/wMTYHW
X-Received: by 2002:a05:6830:610f:b0:806:e047:cd7d with SMTP id 46e09a7af769-80de045b1d3mr12860708a34.7.1790031833370;
        Mon, 21 Sep 2026 16:03:53 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:f::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-814e648bd3asm184805a34.17.2026.09.21.16.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:03:52 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Michal Hocko <mhocko@suse.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Chris Down <chris@chrisdown.name>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Hongfu Li <lihongfu@kylinos.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/memcg: migrate per-node hugetlb lruvec stat together with hugetlb folio
Date: Mon, 21 Sep 2026 16:03:49 -0700
Message-ID: <20260921230350.3649114-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921-for-hugetlb_state-v1-2-8a6eec92661f@kylinos.cn>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 21 Sep 2026 17:12:35 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:

> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> memory.numa_stat exposes per-node hugetlb counters from per-node lruvec
> stats. These stats are accounted against folio_nid(): incremented on
> the folio's node when handed to a user, decremented when the folio is
> returned to the pool.
> 
> During hugetlb folio migration, mem_cgroup_migrate() moves the charge
> to the new folio and drops the memcg data of the old one, so the free
> of the old folio right after the migration skips the memcg per-node
> lruvec decrement. The hugetlb count stays attributed to the old node
> for the rest of the life of the charge, while the target folio gets no
> increment on the new node; its later free decrements a counter that
> was never incremented.
> 
> Migrate the per-node lruvec accounting alongside migration. Global
> memcg totals remain balanced because they track resource consumption,
> not node placement.

Hi Hongfu,

This is another great catch, thank you for working on the fix!
I was able to confirm that the issue exists and was fixed by this patch.

Tested-by: Joshua Hahn <joshua.hahnjy@gmail.com>
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> Fixes: 05d4532b60e3 ("memcg/hugetlb: add hugeTLB counters to memcg")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
