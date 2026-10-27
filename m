Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078119;
	b=EM5scgof7+0hr09fmyBROtXXWa1W78h4qIJkST0JwY09PERqFvpf0AXHfh4I2n1vdyRF
	 QZd1vwzItNq2xt8Q+ExBQ8/8lqEdHX+VJQdqIEStM7voj2nA0+TpY54lb85jRsKHdyPFm
	 1mLoNZB45t4ayoJEVuSAdI2zZu5yK0dxjetLDT3BdV151MxmX6+lDl3KOkcvso2Y/Fn6+
	 p9CMmM6jVS3fLHpg5DGTGsgCVvuz7xom5fsRaztxU/4jvWS360k3DjQMKM63/3ahhpXAa
	 sdS1+HbcQOY5frH30kj82RTu6820k1xZ0uHbaj/wh+HrEZA2hvWxEdX1ucMSw3T15GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078119;
	h=DMARC-Filter:DKIM-Signature:To:Cc:Message-Id:Subject:X-Original-From:
	 X-Lms-Return-Path:References:Mime-Version:Content-Transfer-Encoding:
	 In-Reply-To:From:Date:X-Mailer:Content-Type;
	bh=lmwmgtsLJLmyIO6l45opT4PyLPoNsYcCr/gU7hyAYOc=;
	b=cvtxV3uUpOaJJHNcmdzj67ERCIRDRuZWkryg0GgnqGnhqpOcrA40SqfjPpMZk0ScRSAG
	 dZOUkbpciJfBwXymRiM+c54J6e2Ozy3byALVGfVI9l3gigkBniIq9GgTvZAR+PLr9m7hL
	 zhYZaqvE7oxXMOaog8Jx9betwYnqpf+c4mFzxBjA5lV7DetTgfhuRQ3BsQPdfmGIzmZ+l
	 LsJXPeRw1SL6wDTsryqAhOgHDIihbUdbk5bBs5KdAO7JjrVkz9P+UCYKQbqa8Nr2Rq4Di
	 hed09byyZbv744JqeSIxf9ISs6yeoc+70ot3SInoXETLXtyhhZ0zoqQs/rZxWqmGcLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=kNmMr3X8;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8328606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8328606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=kNmMr3X8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793078108; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=lmwmgtsLJLmyIO6l45opT4PyLPoNsYcCr/gU7hyAYOc=;
 b=kNmMr3X87SqE7/qiysWxUXdpWFmnQuVFIugyX90l7z1Iolh1lolPYOQPa7ItNDpwwgMsV6
 3LNGHjpiKVRZfWAbdnr+9NpDIInEwYwqla0mdzq8zfxZGyqiJaP2JuxLHKmSS7gvHKaP+Q
 1ZvvWK+JJgu/oqibqkunCXhqlk6g4jADO/Y+CarHEUd2svmfm8fEvHwY4dKXCQqom/b/fc
 rrxcaqs1Il6NPVljYgPA2pS24vsEogUyxZw2sFbFlM+lnvezvrG4fJqFwdzrIWwavnCPwj
 gsfD1SYKmy5vbzdJjForx4KqBgt5wMeXuQObqzRTPkmtzZgZhL/wCTDut3BFIw==
To: "Barry Song" <baohua@kernel.org>, 
	"Baolin Wang" <baolin.wang@linux.alibaba.com>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, 
	"Johannes Weiner" <hannes@cmpxchg.org>, 
	"David Hildenbrand" <david@kernel.org>, 
	"Michal Hocko" <mhocko@kernel.org>, "Qi Zheng" <qi.zheng@linux.dev>, 
	"Shakeel Butt" <shakeel.butt@linux.dev>, 
	"Lorenzo Stoakes" <ljs@kernel.org>, "Kairui Song" <kasong@tencent.com>, 
	"Axel Rasmussen" <axelrasmussen@google.com>, 
	"Yuanchu Xie" <yuanchu@google.com>, "Wei Xu" <weixugc@google.com>, 
	"Baoquan He" <baoquan.he@linux.dev>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>, "Bo Zhang" <zhangbo56@xiaomi.com>
Message-Id: <179307231985.76444.4463824301717648100.noio-rfc-v2-coordination@bytedance.com>
Subject: Re: [RFC PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache in MGLRU
X-Original-From: Xiang Liu <liuxiang.277@bytedance.com>
X-Lms-Return-Path: <lba+26ae0335a+cfd08e+vger.kernel.org+liuxiang.277@bytedance.com>
References: <179248830836.1744016.8424217811286616919.noio-mglru-rfc-v2@bytedance.com> <0cbd219d-f69d-4f72-aec5-43e1f2d978de@linux.alibaba.com> <20261022102726.56682-1-baohua@kernel.org> <fc302ca3-6bf6-4bde-b3e8-8d2e93a4e4ac@linux.alibaba.com> <CAGsJ_4z9GZkpV+mpoGogma4oSX4cHy+2UDzyUQSjjOLOfekEPg@mail.gmail.com> <4e647816-0b8b-4a75-8777-8580a574d752@linux.alibaba.com> <CAGsJ_4xVR53NcKuN3bA6v+O=37PeQ2Vnj-8WHo6ScYH96N4seA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <CAGsJ_4xVR53NcKuN3bA6v+O=37PeQ2Vnj-8WHo6ScYH96N4seA@mail.gmail.com>
From: "Xiang Liu" <liuxiang.277@bytedance.com>
Date: Tue, 27 Oct 2026 13:14:50 +0800
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8

Hi Barry, Baolin,

Thanks for the review and discussion.

I've seen the RFC v5 "mm: mglru: fix swappiness behavior" series, where
Bo's patch 14/14 addresses the same GFP_NOIO issue on top of the new
scan-budget model.

Baolin wrote on Oct 21:
> IMO, 'swappiness' and 'scan_swappiness' are really confusing.

For a standalone v3, I plan to rename scan_swappiness to
evict_swappiness to make its role clearer, keeping the rest of the v2
implementation unchanged. The split in v2 preserves the original policy
for anon aging, including the page-table walk.

Barry wrote on Oct 22:
> IMHO, this is confusing but this is a possible way to fix it before we
> land something [...]

Before preparing a v3, would a standalone fix against the current MGLRU
code still be useful as an interim fix before the scan-budget series
lands?

Or would you prefer to handle this issue through the new series? In that
case, I can use my GFP_NOIO workload to help test Bo's patch 14/14.

Thanks,
Xiang
