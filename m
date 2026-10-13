Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B071131A55B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791850914; cv=none; b=CXXTW1kjSTrBUb9MIpUp3ubnNtP61/90zzSrM6VqVPb4JSN6LI1UB1laddrI/QNBf+8TQuKBZZVbw07DV66ME9U/cOkyYVOvOC/DzhNG5lTcXVByYfSsOF+Csz60+UIO6ZiMV0PynysLrYJehsRE9WCMl+DHTdh5XnoZxE6bI10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791850914; c=relaxed/simple;
	bh=26R6QjZja8iwEgaIS7NPevZdCEiibaTu0MopPJ7UPos=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yr3qKS49e4bqwzjHk8RK91fI3yJlXqA+kBPtj4BwPoAKvpQdFIZwbCS0/aiVTc0TzUsXEerW8cYRwb7EDAwSjlkka4jzIMsLlWYWPn1coXI9ONFQVKLf6UTCFAcFBLTdVibRI9tRcj5ug3h7OJ8C5AHzJe087c5Iu29furjyS4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSjR3MZY; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSjR3MZY"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1145738eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791850913; x=1792455713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26R6QjZja8iwEgaIS7NPevZdCEiibaTu0MopPJ7UPos=;
        b=RSjR3MZY/vVTaZx1qZ0noJdcqE8d5NiFifbzdj/ueXIM3MEEWsjFSY4rb0pNPjOmjq
         sxE2pEUTqY0JsY6iHdrCmh4Ve+r4exBhaQnbEIS+Yoqy3JJBnrFKCVOckufg5SSm7yJf
         OQg6lGX5jKk7W2ON34kaVl63gqm7zdfyF1xgW/nwMvGrWMmpsT2AZXGfwggKhXSXBljP
         6AKrJzXKV+j0Na+EFCMz+A0i96VVUnO2+R5JzZxZACs5/fkYBNoX8/fjc278yfehCEni
         j+NTnA9YlFua2kZk+guYLK8GCOqAjwe28lWlHuJlZGk1c5o+vK+foimcATKiP2im4eQd
         BIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791850913; x=1792455713;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26R6QjZja8iwEgaIS7NPevZdCEiibaTu0MopPJ7UPos=;
        b=WfIv+DAID19I8jN+uWcyASF+U5bltYJEYQP9/p+X+lMTj+rUa8plTbIt9QuYzs7rNT
         yzdpFhFdpWrDPgXzZ1huMnxm7kXinEoxr1IL4pYmANLCBcwYF6ixwV/ZkwC7aten6hTc
         GHHZLIXRFR0wBICE1LSrIN48s5vNQoLvrLMeYk6je86evZQmsxbJ6dkYaRo68N62jImN
         0kCiVqV2D3Dy0NGQw/Xur2w/ONlBhArTtqyCHeh9LNmXJBqMBIjGvzrdwccQ6AqQ6ZiC
         QxQHm01tOPr7vsmmP0mH4pmjTFvHZkYq67pKOTJMCdMGxV9TPoCqqrCkfm/QfBJO+DdG
         ClpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuzyKDImrssaCeIT0aGIPoz6h5kMG2RQbTbQYDxLIHXqzXHdTp/e23t8EGeuNAJbV78UcwlhueYO2JB9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ9mTV/y0BSFM+pKfxiC24F7Fb4eA9OJUmLwzG9tQiGGNeYJhU
	CQ+l36HnRKZahBR/HOfo/9SRolwBaIcbltOIOUfNnSt/FW76bCE5FE5D
X-Gm-Gg: AYBFou2Wb2xV4tyVTD4U6NrfDfaaQpwhFsl0JnyWI4WsCHGxS6UgDT+vy2CN3pTvt3u
	urmMpdcJJkdjms/6ohUWk+uPe7l11AQF64DF9abNMSltdCyvgjk16fTzTG/cPQfd5m6HkRhVveb
	GnYEYtcNl67pbAYzx6Huq12vGV0EZiOpyiw8DBNMZnM+8dRfyHXkqSsg7OBv/IhHNtw3iM/2yUN
	BKIjyPxannub6uJCcc6DARzuWFtih/FnDiKGoKGKpLq+NAQon+2IDlF6f/e8lejx7kP2D5jMXzQ
	U9kXhxziw08EM+Fg++Zcc+89IlD/yletbBbuLzwzMmIm12WnapSiMLWDEvaal+cYbORcvEe7uyB
	I/1bB+iNP2mKZPge1JlLriV6V6Dm7a3tqWnl6CCfptFsJ7woKNLHhE7j35y6Qt4Zm4RCC/w63op
	5rGuwLmjN1T8M47oBYEV4+XmYPW9xQcRUV8O6O3pSdv019xbZvdZUlkWulU+Y7snsRnf+Bn0JLQ
	bY7VuzmBStEuN6UFwmQWg==
X-Received: by 2002:a05:7301:7d16:b0:350:2a5c:56c with SMTP id 5a478bee46e88-3537e08eee0mr15924457eec.20.1791850912519;
        Mon, 12 Oct 2026 17:21:52 -0700 (PDT)
Received: from penguin.lxd ([12.187.136.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3595e0858c6sm23646723eec.22.2026.10.12.17.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 17:21:51 -0700 (PDT)
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
To: usama.arif@linux.dev,
	akpm@linux-foundation.org,
	chengming.zhou@linux.dev,
	dsterba@suse.com,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nphamcs@gmail.com,
	terrelln@fb.com,
	yosry@kernel.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	senozhatsky@chromium.org,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	kanchanapsridhar2026@gmail.com,
	linux-crypto@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2 1/2] mm: zswap: use separate compression and decompression requests
Date: Mon, 12 Oct 2026 17:21:40 -0700
Message-Id: <20261013002140.28880-1-kanchanapsridhar2026@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261009163146.83112-2-usama.arif@linux.dev>
References: <20261009163146.83112-2-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Oct 9, 2026 at 6:31 PM Usama Arif <usama.arif@linux.dev> wrote:
>
> Stores and loads serialize on the same per-CPU acomp request and mutex.
> A low-priority store can be preempted as soon as the compressor drops
> its stream lock, while it still holds the mutex. A higher-priority load
> on that CPU then waits until the store runs again, which can take a
> long time when other tasks are runnable.
>
> Give compression and decompression their own request, completion wait
> and mutex. Since commit e2c3b6b21c77f ("mm: zswap: use SG list
> decompression APIs from zsmalloc"), the per-CPU buffer is only used for
> compression, so group it with the compression request. Independent
> requests can share the per-CPU transform; the codecs and drivers
> synchronize their shared state internally. Loads can still wait for
> each other on the decompression mutex, and stores still serialize on
> the compression mutex.
>
> acomp_request_free() ignores NULL requests, so drop the check in
> acomp_ctx_free().
>
> This follows the proposal from Sergey Senozhatsky for the same split
> for zram [1].
>
> [1] https://lore.kernel.org/all/20261005122036.718976-10-senozhatsky@chromium.org/
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

I have a question with regards to this patch. Is the intent to allow a
decompress thread to run concurrently with a store thread for a given process?
If so, I wonder if incurring context switch/PTE/TLB shootdowns performance
penalty is worth it?

With the proposed change, will zswap_store() continue to run on the "old" CPU
(i.e. the one to which the process got migrated), or is it a requirement that
the "old" process is in sleep state? If so, should we codify/document this
requirement?

On the new CPU, is the same process "runnable", and if so, how do we ensure that
the "higher priority" decompress is handled while the zswap_store() prior to
preemption is still not done?

Thanks,
Kanchana
