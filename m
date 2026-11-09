Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222010;
	b=MihS1VBbgwymvos/0Rd6BFda4suRxtBp6U470ePOMMmfV/UV1tOX/N396Mqde5HSre2p
	 t9jnNHb57N87H/Xpg44hy/uwak8jBcSNMupczvAM7esvP6AcTMKRSEZDlm8nITcsqmR74
	 JNgOo7cg4Nru75RRPBxF+d/P8TkgN34YHw/8JP8sYr2oEOhNRfv+iNSZl95O3Ln20Indt
	 jwceEw1RpnOkbAhaCilRYxnfZBmJiiSkGs9BGGHfBn6+/GIX+Q9daYSQiGwZTCSWzdgP3
	 JUnl7xkwv75VLeTsEPGpOwyOT+KK/5AjUr/lfsD5R34bRGXHttxR96cPvJnsK5k1m9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ElXE6Czu3kJtnBp4J8hepfVFWJpvs2+YyAeDoXoHd4Q=;
	b=AL7e0kHJcrpTzKjmcMMzq/ik1rmWCPqSCalXo09CCcpbRFX6349v45Q0ExXpcFlLG6Rl
	 1shAFkRi7CCeMWER+G6poDRfGk8pyXzrLthO/NgMkW34CP/Ru+MrK3rtWGA0DOAbfAklW
	 squLAYYFgj+kDbFUMhzNR0GCpTamJ0II3mtzZMNafhIvuYo23P6CRn7Z3JItxDN0BC0Hg
	 WVxpGyMyalSb0orTTX1oyVCEmOKEoy1vQy8P+t2sykMdJQ+nqK+1FNCL4ABWGOh5wkdfx
	 fYnY2K3EBZOthiZmEwneeeBztXDH4jRUgF+Od3koWNc5r2uRu1z5hlBnOUgufjnpadA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oG7oDRzE;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E88F606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E88F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oG7oDRzE
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f6295304dso831637eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794222009; x=1794826809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ElXE6Czu3kJtnBp4J8hepfVFWJpvs2+YyAeDoXoHd4Q=;
        b=oG7oDRzEqlj9IqURnOyQtZsM7QJeODStDhyG2uQVdblnfvxu6nLFjyje5IHZeANfIj
         YrT33mX+0voC65lpjBYHCDwumyWa8uM6W588NL+gKtUSMwWeL+a9FIx/vrsqBWgSLsK3
         5G/GjFFcA/nGTrRe0AOqmca8DVVsNeVEcXaDex5wOXVtZvvlNWNZDh/BLUPoN0AaZqoF
         lcDbjw6JfpOu2zjphkQgzlWFa21BDidBGCD7Y48JwojeRIMrJzKBbQmVnobdBfHIdqjc
         lj/1pdkqVCUZ1jqZTMq0qCB99y/QytEKr7KSfEF4UKWTQVR0j65UnUE2ULpbcJOR+rtY
         /OiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222010; x=1794826810;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElXE6Czu3kJtnBp4J8hepfVFWJpvs2+YyAeDoXoHd4Q=;
        b=VKlQsIbQPE//v8o+cQKwy021H0SLYWt21d2B21ZujbHzseQSfapZQOw6Uavx7iTE5B
         eSwKnJLE8kwOjURo+aCuDsCFZ2HpZ0zJiuAwKFS52OPgVa5e79TO0Ug9E7YzzF0jgFM4
         hBa2Aizz5dXT7o6H0iNejSmJZH+jGLydxohzCXEgAHV4h5MW+P4AG+n5/zyEwN4biGgr
         sMq2QodkC/DLV6MpqysLzMQbJSvVaR3sW/LNDnQFgQiPEuYFqUccLSoZgPb+hRaRZEa6
         GQGEL9cZD6LXRa6MC6qPoSbqmzZyWrTG5sqFR1EpTVAKZ33WbIU4RIG69aiiCzIO6tAO
         pQjg==
X-Forwarded-Encrypted: i=1; AL+hErEpLiHFp7Qk/q0iSBnsz7MbGhZ/rRm5gc91Ls66yHwTkRGN0AlVLlfErTHowU/6uiZr6BVrNmt9QYbzFBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z91C6Pp3lieCRbjjbRH7Ninca6bdfEnmiHtt/3TCZClLw80xq1A
	FnyPrDaTH2O6QvZFtd+9zfeOHq8IjkG5Wir0P8KWClWMViUDc6hOOFpP
X-Gm-Gg: AYBFou0mp6r05atNGX5vy9YpjDKCcSEbJ+PUD5Bdvi++PjJMRG/VRvZZrO7X07PcWLq
	OGSCI0LV4wncinyLz6SjNSprqEPvtCEFOXahfmwiyK9HuB6vFIt6axgsLkQ1faV2bQSrXevxrJj
	s+zZvlP2Lkj/g7P63glu/WDTFTn+GBbg7EBsB2cpPy8Olgs/Yo76n0/unQx2DDM2LJ6zeR6SVpY
	k3RyWbHC60VroxnT59U6SS0NKkTyawAVghSfatWUnmKmUlT62rVtveJzh1KnlEJPt/AZwGgX5rs
	vyOnqEyYk9kVMjep4sDMoMjHGFi4tK/dQrRcZBv+tyILUVnhR4+ZN1qtVBcXsfJIu6IlGUtaRa8
	d4W53DaIOMrWzPljeV9hnE4N3WpJw5SphyVG3vlZDYxnupD4vAAMwQiPFMWJcxj/82eK5BWVZ3V
	5tcIRAuDB/adZRNyg9DfQnEYgors2M9A5n9ah1NoCm/BdMD88rW6DyxyZs/uEKqs9YkqbPQSqjN
	oYG3FgxMR80phA0nIQiKOfDVv6IWriXQaxlBX/P2JyifaUuVHuyXsNXhipyq3f2WeXJHN3/T7N9
	CJAdcKjU41oU8j+Wu0SWqtcojc2gWzNUIXCxjNS5lETVrja9wA==
X-Received: by 2002:a05:693c:8808:20b0:36c:9e26:88b6 with SMTP id 5a478bee46e88-37256613f82mr6129121eec.9.1794222009245;
        Mon, 09 Nov 2026 03:00:09 -0800 (PST)
Received: from hongfeng.mioffice.cn ([43.224.245.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265c06c61sm11832518eec.14.2026.11.09.03.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:00:08 -0800 (PST)
From: Hongfeng Chen <chenhongfeng0212@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Hongfeng Chen <chenhongfeng0212@163.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Barry Song <baohua@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	Wenchao Hao <haowenchao@xiaomi.com>,
	Wenchao Hao <haowenchao22@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	Hongfeng Chen <hongfengchen@xiaomi.com>,
	Hongfeng Chen <chenhongfeng0212@gmail.com>
Subject: Re: [RFC PATCH v4 0/2] mm/zsmalloc: defer object free to per-cpu batches
Date: Mon,  9 Nov 2026 18:59:55 +0800
Message-ID: <20261109105957.2577351-1-chenhongfeng0212@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAKEwX=M4jTnxmq6cj115Gw4u5jdY7Ex65jPtVTEopW70jGzfuQ@mail.gmail.com>
References: <20261016120927.3191690-1-hongfengchen@xiaomi.com> <20261023123736.1542117-1-chenhongfeng0212@163.com> <CAKEwX=M4jTnxmq6cj115Gw4u5jdY7Ex65jPtVTEopW70jGzfuQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Hongfeng Chen <chenhongfeng0212@163.com>

On Fri, Oct 23, 2026 at 11:19 AM Nhat Pham <nphamcs@gmail.com> wrote:
> Is there any more juice we can squeeze from zsmalloc in that case?
>
> It would be nice if you can perf zsmalloc freeing. And yeah, maybe we
> can't optimize any further, but let's eliminate that first before we
> rely on offloading.

Here is the perf breakdown of the free path:

zram:

  __swap_cluster_free_entries        90.28%
    zram_slot_free_notify            86.01%
      slot_free                      74.15%
        zs_free                      56.01%
          __free_frozen_pages        19.85%
          kmem_cache_free            10.15%
          _raw_spin_lock              5.53%
          fix_fullness_group          3.31%
          dec_zone_page_state         2.43%
          obj_free                    2.17%
          trylock_zspage              2.12%

zswap:

  __swap_cluster_free_entries        94.30%
    zswap_invalidate                 93.49%
      zswap_entry_free               73.76%
        zs_free                      34.03%
          __free_frozen_pages        11.13%
          kmem_cache_free             5.57%
          fix_fullness_group          2.66%
          _raw_spin_lock              2.45%
          trylock_zspage              1.75%
          dec_zone_page_state         1.67%
          obj_free                    0.96%
        obj_cgroup_uncharge_zswap    13.90%
        list_lru_del                 11.73%
        kmem_cache_free               4.62%
      xa_erase                       19.27%

Most of zs_free() is returning memory: empty zspages, handles and
zspage slab objects. So returning memory cannot be avoided, it can
only be batched or deferred.

In zram, zs_free() is 56% of the time, so deferring only zs_free()
can speed up munmap() by at most about 2.3x. In zswap, zs_free() is
34% of the time, so the speed up limit is about 1.5x.

That leaves two places to go further.

1. Async freeing at or above __swap_cluster_free_entries()

Deferring at or above __swap_cluster_free_entries() covers zram and
zswap with one mechanism.

2. Optimizing zram alone

For zram I would rather go back to v1 [1], which defers in zram. v1
also uses a single gc_work per device to offer a best-effort service,
which greatly reduces the impact of the unbound worker on other
tenants.


[1] https://lore.kernel.org/linux-mm/20260412060450.15813-1-baohua@kernel.org/

Thanks,
Hongfeng
