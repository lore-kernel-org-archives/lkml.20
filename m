Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651090;
	b=Y53FY7wEILr4usoOc4i7sQZYvzHqC+Qi0qMAx1q/ylEnk6ZXJKDDqTFjAIZUMQcudkiJ
	 xnAXp7/tN4eQ117hBSenr+c6+iGlDCIaeB3ueVMQnhPtjif+XjFL9GZaM3nTrmC9kXRRo
	 aj4aeAqAA2SQ9K2pz57nOSppcTFIxetSWtoVjlnIAxTcaNXMivc7dgCI6SbU10siHQcNP
	 qbiuGOng1AB70ARAH6QVHSZ88MsYWtF3/OmRQc/TTXtQUSf1kvD6yID7WGhRLKci6EtST
	 JZ6zZTc7A8dpUIBQoQEuJoT9DXNlGLolde1lTt797Ci4IAff+SyMM4PBNuOozWtQDUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=x1SeODRoO7yM05Fi9Ezs7mCvp430XVHwDnUStx58P80=;
	b=rs8tt/A74OSMVyCVIAM6138Y3QuSqus+va9rWRYAzLl8zSwr5XEwUJ61GIPfY3AYG9W0
	 ybd7G3wwbXqvUV7BHRxbK3LImgmPFNatHR4GaVbTxRjjeIZt7BpawmCIbkOOuwQ1TP57K
	 byBmYYQuCDPa0TCouGO5gjOxMHm7V7o1T/JIasOCzNW4RYwDh2955Aejtowp/9afnSxsL
	 CzJTO46Wi2r7NW1MtuM5xC4ddiGtS1I5RxoiJUqZEp2BfrGWMnq+m1rMfJgWfBQRw1lfG
	 arGvDv4pcOTAr/N0lAws+fHBB25xNLmkkzJfh8jvWxPofsyNqpAnO5h9hmZBucYHsrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F0uZ05Wx;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2A4606D833
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE2A4606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F0uZ05Wx
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a223755e4so13944468eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793651089; x=1794255889; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1SeODRoO7yM05Fi9Ezs7mCvp430XVHwDnUStx58P80=;
        b=F0uZ05WxbNRt1DzwE59fw+ax7TYLDieFfF1FkdMXFyYDraddrbzwcmjYvwjgLIMx4w
         AQ/KLzDLt+VH1cw9ANAJ9Lew040odm0ODMHeJQz0pr3t+CRcfnOIzGrWN4TYE/5Pjsjb
         U3NWJh1NRUIJxniD2pEO2F8s7j7fRs4SefZW2TFaQFISoq+fmFDN09cMyax27vPiGKJ8
         RoD5cCT1k9DgiaQQ9uwWJRS2EljbQQGSi+/DeIhrIumjMrBO00Rfyfd/EzevGNi/L4TZ
         eJFDXhRSIZS/NiwUeYO1q8c4xBfY3XfNP6NuSUo1zrwTKt6uDkhu61SRqaTJqSQa2k0m
         z+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651089; x=1794255889;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1SeODRoO7yM05Fi9Ezs7mCvp430XVHwDnUStx58P80=;
        b=MObv3T0/Meoh25W4P9xamSAk5T/K5AtTVM+oRQFbNvx0g8R40SpN4iHE/QYAK1qqfw
         3bdvKbhaw1DNzmAPFi4a3sJSNYUszapIlWkO/GDRsD3/FGQRepUFEyvSNhfpHoo9uMPZ
         f7KnfphXWWUKLTYexKOKQGNWvGhrdpcV5hji0e/Q1OYrZyC/iyTmEaTNC/dt3Ho3Vc2B
         6Jx7dOSFyQq7izynVjA3SV/diANt4TsidWDLNZOkp4sTc+rtytB4479IkBv9DWfputRn
         gOd0IpfBv62Ocm05Jd0zNJd11cSMrKqsGPm0BSSMMJHjvPn/Ioms382Ur7hoaIUZZt9H
         K7Ew==
X-Forwarded-Encrypted: i=1; AKwUvBzQsv+o8to0w/Xh9Yz1oSyUOJ2j+a34XVgZGqPmkDwipSZ7zKa+oKTfmJU4sp20OSE4hVr/NdQi8LRHpeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BpwSrN5MqI9YV37SVTV++lhbQz+fOTs48+MioYFXgnBD1dPLT
	+JCT6WLCro7e9nd6h4rOicdn/yIc5RozQi9W8A9k4FHPWXzGAIfH5w7cj87qOmHvVMs86vMIpS2
	EsW7Y/Cm3QUz7e4D4D1tKmTJy3fsG+A==
X-Received: from dycui21.prod.google.com ([2002:a05:693c:6015:b0:358:2c8e:30e3])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:895a:20b0:366:c497:610c with SMTP id 5a478bee46e88-36a423fd087mr17250916eec.33.1793651088420;
 Mon, 02 Nov 2026 12:24:48 -0800 (PST)
Date: Mon, 02 Nov 2026 20:24:47 GMT
In-Reply-To: <aufPMirl4cD7tz0X@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1786003779.git.xueyuan.chen@vivo.com> <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com> <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
Message-ID: <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
From: Chris Wiseman <chriswiseman@google.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
	Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, xueyuan.chen21@gmail.com, 
	Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On (26/11/02 08:47), Sergey Senozhatsky wrote:
> Adding Chris for visibility

Thanks for looping me in, Sergey.

I tested your CONFIG_ZSMALLOC_SHRINKER=n patch in ARM64 QEMU (7.3.0+, 16
boots per arm) by fragmenting zram0, triggering a manual compaction pass
at pressure onset via /sys/block/zram0/compact, driving ~240 MB of
swap-outs under memory pressure, and running a post-swap manual
compaction pass.

Your theory holds up: with the shrinker enabled, the kernel compacted
2,218 pages (~9 MB) in the middle of the swap-out, only for incoming
swap-outs to immediately reuse those pages.  With
CONFIG_ZSMALLOC_SHRINKER=n, mid-swap compaction dropped to 0 and zram
pool memory was identical both during the swap-out (120.9 MB vs
121.0 MB) and after manual compaction (110.9 MB vs 111.2 MB).

I also tested adding the unlocked zs_can_compact() pre-check in
__zs_compact() on top of CONFIG_ZSMALLOC_SHRINKER=n, which cuts each
userspace /sys/block/zram0/compact scan from 97 us to 27 us:

                                  Shrinker ON   Shrinker OFF   Shrinker OFF + pre-check
  -------------------------------------------------------------------------------------
  Pages compacted mid-swap              2,218              0                          0
  zram mem_used_total (mid-swap)     121.0 MB       120.9 MB                   121.1 MB
  zram mem_used_total (post-compact) 111.2 MB       110.9 MB                   111.1 MB
  /sys/block/zram0/compact scan time    96 us          97 us                      27 us

Representative /sys/block/zram0/mm_stat snapshots:

BASE (CONFIG_ZSMALLOC_SHRINKER=y)
  pre_onset:         184553472  58747279   82350080  0   82374656  0      0   0   0
  onset_compact:     184553472  58747279   60456960  0   82374656  0   5345   0   0
  after_swap_out:    334196736 107289761  120946688  0  120946688  0   7570  29  29
  post_compact:      334749696 107472834  110907392  0  120946688  0  10016  29  29

PATCHED (CONFIG_ZSMALLOC_SHRINKER=n)
  pre_onset:         184553472  58747279   82350080  0   82374656  0      0   0   0
  onset_compact:     184553472  58747279   60456960  0   82374656  0   5345   0   0
  after_swap_out:    334372864 107347183  120922112  0  120922112  0   5345  29  29
  post_compact:      334995456 107550158  111009792  0  120922112  0   7767  29  29
