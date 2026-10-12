Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C1448B83
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793581; cv=none; b=N4Jwmazbcbw+9uRfc3YYcmnNaqR2GFPB4/NGp29iejcvKJ90IN6Vts3eDTt8EZspe4FbTmiVIx7Lf4DgBv72qI9C04VcgcaUDIWLn8zMN4yyv4lK2YGViiY4mgIxemDj8THq1+diBgtubTCCCD+ygqELEuZVKfyAsYubHHcWSus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793581; c=relaxed/simple;
	bh=sod8bcVpApZFdoPpUXaoSDVLZjCA2ciGXP/NBwyFfzE=;
	h=From:Date:Message-Id:To:Cc:References:In-Reply-To:Subject:
	 Mime-Version:Content-Type; b=pXlH0l7JqFJaYLaLBD1LzAMJ5UbbgJNkjroBxQx6AJVhXNje0qYjjIWOw/iWN1sXsC+Rd92h1vMSKhKtPMwpm6k279ahcdyuizV8cGCqCbJ+rzkiiMgLVMq7wG3kSpdm5IogTKeHJDT0hLgpU2Rk5ToJF6FFJNmYSZ1o0Q9Okd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=nSIxejU/; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="nSIxejU/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791793572; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=SrJpgfxbdeXh3TTm50g8YTcfXTJnnoIJl6cuC+fESWI=;
 b=nSIxejU/8lCQ6n6C2Ck1pBtZ45B4Bb8H0ncRvFTnsVIbota/017Km4VyDituJ75u0wRq1c
 PaEHlb2rofoZsai1loHuSeKSDv2jxkj/4yMPTfWisbEqcvOsoo51Fr1+UJxP7l9CAf4lDs
 FazzegGxj5U31LL2Eo2Mi6Fw3UqTij0Iz65NEX0NuojM2ezUV5M45jPjJV42JFgA6OiNC6
 XjBO45tFa5XWhplpj8jm0viL9XgyXBWOa4eZARjJFDjWTo8nN60GqTq3sDXXWzSoUNnmj3
 eFCqP+07Wugbj5Acgmuf9bU4Yks27OJwTJNIyuW+OTr6mOaryc+JHdLo66T2cw==
From: "Xiang Liu" <liuxiang.277@bytedance.com>
Date: Mon, 12 Oct 2026 16:25:45 +0800
Message-Id: <20261012082545.2926113-1-liuxiang.277@bytedance.com>
Content-Transfer-Encoding: 7bit
To: <baohua@kernel.org>
Cc: <akpm@linux-foundation.org>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>, <kasong@tencent.com>, 
	<mhocko@kernel.org>, <hannes@cmpxchg.org>, <zhangbo56@xiaomi.com>, 
	"Xiang Liu" <liuxiang.277@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Original-From: Xiang Liu <liuxiang.277@bytedance.com>
X-Lms-Return-Path: <lba+26acc99a2+53dcae+vger.kernel.org+liuxiang.277@bytedance.com>
References: <20261010141057.599595-1-liuxiang.277@bytedance.com> <CAGsJ_4xxawPzb7MpmdNm9u-fgge3w49n-Cu026BpKYAUZZf=pA@mail.gmail.com>
In-Reply-To: <CAGsJ_4xxawPzb7MpmdNm9u-fgge3w49n-Cu026BpKYAUZZf=pA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache in MGLRU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Hi Barry,

Thanks for reviewing.

> I'm not a fan of this fix, as setting
> scan_swappiness = MIN_SWAPPINESS will force a cold/hot
> inversion for anonymous folios.

The patch description outlines the tradeoff:

> The tradeoff is synchronous aging. With four anon generations and two
> file generations, advancing max_seq can require moving the oldest anon
> folios to the next generation. This patch accepts that cost to avoid
> low-yield anonymous scanning. It keeps the original swappiness in
> try_to_inc_max_seq(), avoiding additional use of the inc_min_seq()
> single-type shortcut that advances min_seq without processing the
> oldest folios and can cause cold/hot inversions.

To evaluate this tradeoff, we varied the oldest anon population and
compared synchronous aging with baseline evict_folios() time under
GFP_NOIO with very little swapcache. In the cases reported in the patch,
aging was substantially cheaper than low-yield anon eviction, and
allocation and reclaim times decreased. This motivated retaining the
synchronous cost while avoiding additional use of the existing
cold/hot-inversion shortcut.

The diff uses scan_swappiness to decide whether aging is needed, and
passes the original swappiness to try_to_inc_max_seq():

    if (should_run_aging(lruvec, max_seq, sc, scan_swappiness)) {
        if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
            need_rotate = true;
        should_age = true;
    }

inc_min_seq() receives the original swappiness through inc_max_seq().
With a nonzero original value, the anon shortcut is bypassed. When anon
has four generations, its oldest folios are processed before max_seq
advances, retaining the synchronous cost described above.

Am I missing another path where this change would trigger the shortcut?

Best regards,
Xiang
