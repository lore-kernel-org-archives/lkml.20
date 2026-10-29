Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238536;
	b=hqGV5MwjbAh5QH+6rxyxKBWSQGCHGS9P2gzA8X0KtvrodbZAUs9f+bkz1ll0AhsasXpt
	 NqoZd3iLYOkz0gMWNkaZU04VN6bh2k7w3khw8Z6UALX+fTl2g3iW3NxIa0jOwgcWpJZ5H
	 6BMCOKRbA6cIPoriJXL8MLmMnMmab4r46Qgm6MlqU0y4jmCXsxYoiAqRpQ9ucodoIh0B/
	 GoOLLsECDIL0vZRMdAeFfDkXNf0PB858zsdKm9Wm16YpcfDg6rxdKiYHw7FNU1fRBHzIy
	 SFownFkpUsrJsgxl0ks+Mzne2Bg2bHlYengirJTzgqOsk5gX9PCuGQq9irAAMUVl8xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oXOkghG3Xos0XUP5GgF89q+M7BUlh3Lrnn+tFu6rFN4=;
	b=YdaeGnYjBH57Hay7DBiXlb9uju+Uzgiv5EXoE3m/fuJUwiNvbuvweuqD17MYo/V7DCMP
	 aC/V39eyGKe5bGpfV7yPU2GjNtEmtpxbSPm/ioJ8c/mggJYWJDPSpgHUypvlJOg34f8Xt
	 HGjaF9sGYmAeX5s9oCMCjCTEaunbPR11FNFmNIiBqxWQYg0fLSiQoV+ltNJmEIRuPOvp2
	 BWQn2BP2+aAXx+8vAI/wHhzvF/mamGyQnfUNhKYx+3jdzHZfzvp4koy9p8VLEenWK4+2R
	 1t2DHu+T5XrBOylf3GOdwQPIL2yTDVUb62IJj0EgDc40V5PA1BbPPhxcYlaEhnwYRNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="A43rD4/C";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE08606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EE08606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=A43rD4/C
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2af4c8d00so123303c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793238535; x=1793843335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oXOkghG3Xos0XUP5GgF89q+M7BUlh3Lrnn+tFu6rFN4=;
        b=A43rD4/CFNYoCCpf5Z0cuoTAu7zC32EwM6k1Hx9Of8WbwYq2Mbw9YZF+vXe1QESjC4
         4Y7kCL75UJaAb3h41np5V5YzTmMkeeBZ7YDfkkE+TRE0bS4pqYNRO3ZUkmfWc3ErwotW
         hbx6vWek9FnieufsNpWziLbEjs009dWBmmTu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238535; x=1793843335;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXOkghG3Xos0XUP5GgF89q+M7BUlh3Lrnn+tFu6rFN4=;
        b=oRp2pecYUvkG2OXazznwnBhsUhy/Li8FtKDFFYjzrlkPND3ccVzKi17L77j8uWaTvZ
         0qfki6TNabsEqs6Cl7w1Q+euN08HHiLMeFO6CgAP8tGs7doDBHS97yajiuQJ2StV5jz/
         Hsp2EZ8dl2meK+eRoNsb1j6qisedDgfAoE0bKuU8iGZrTr8kA/OffRxfYlEqt1VoObJH
         9bIvCl5zAckkFsG+a9nnDZ0NAFANKwARdLOoIIDazRBoHmyjCm7/TUn3Sw8ws/XU/Z3U
         PwXJ0mSECR4cTzVu6QVembEdmJS5imIJ9im/K/Yba3Zxbnh3LdkIWRDSBaU0c1cuw5M+
         t3pQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjBZZU9VnbuZilLDCEozlJtoMB89EEDx/PuybuBBZC1o1RU8qKpXBOEngq9QsFzol7eR/vIayOMhS7q/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrZTOM2kODPMYQMkIPaygIY3icGP30Wxq5Eh9qYUnmuUOVV1zZ
	YZuE4CGUQJigZta8sJf7CqFbVPjt55rZpvWr4Gkoqku6SgOnX+WK8tXLgh3/inz2Hw==
X-Gm-Gg: AYBFou1i6ooVoqNo0z8VVW0879HvrnAywIdvvk4CqhU3WC1q3VHELAID2RE8u4CqxBn
	rRSQQHu5Wmv8le/Srs6llWq0aytENACnfdaxn5jejRd8RhvoZA/Hk4z1G6OdRO63EcFaawBdlXO
	T7IXYkQAqntprLjF9xmD4OW8A3/4bG2X2gLSE0jSDrnDIXtcdLk0tTF3ZXOw/EDjqHaGx8DY/4Z
	Ci+m2ruBBxWZ8ZUumP7a9iIjReDMLSX7Aza+Fyggu5aCEfgXGsP5fbv35mYW2LCU+3IB6DdAwpO
	a3UpbXPzr8wcEeplwnLKV65yuvdbNWp/V+fevHTa9lrPsG4k5hYMS7hk2198x1XhtYokGYQXBex
	XKi5yVP38zAoEO9AcymgVaMW1Zx/at/HQu7C5PXY3I00YOcTQiJBmVujpOtFCUYknXwbMLfINRb
	k6HjPTo+eU8b3DU3JZfxoVx2vytF/gS1Te7peHKVMs842oG7/o33/RVOPd6DvCqXeRZb3/wOCX+
	+258u/lAMlVOHdxec79ylqKbSWVS/8b6bQObUHgUMQfceKe67adQH7Tb+qSez/+85nQFP2VLPy0
	nQof2Si8otRPlIzRNoadCMxpG855uBwB31TUH7+ww1pg9jXJpdDPSCmi7ZE65DscxJSest9sQPy
	Kkf8h96YvZpB+aBE=
X-Received: by 2002:a05:7022:eb53:20b0:187:eb7f:bb4 with SMTP id a92af1059eb24-1a6ced8f913mr6113117c88.46.1793238535216;
        Wed, 28 Oct 2026 18:48:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:f72e:e03e:c64e:b5b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d85f23dsm8564749c88.11.2026.10.28.18.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:48:54 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:48:50 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	xueyuan.chen21@gmail.com, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
Message-ID: <auKlTdFbOZmAuheo@google.com>
References: <cover.1786003779.git.xueyuan.chen@vivo.com>
 <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKjuiRxQwtsZF_0@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auKjuiRxQwtsZF_0@google.com>

On (26/10/29 10:43), Sergey Senozhatsky wrote:
[..]
> > Hmm we'd need to collect more data in our workloads to determine, but
> > if we can compute compactable ratio (freeable_pages / total_pages) on
> > a per size class basis, can we just skip the size class whose ratio is
> > too bad? Would that at least cut down on the vast majority of
> > fruitless memcpys and lock acquisitions etc?
> > 
> > I'm always a bit hesitant to over-rely on userspace, especially when
> > kernel has information to do something smart about it. It might not
> > react in time, and many proactive reclaiming schemes back off under
> > heavy memory pressure.
> 
> Apologies for the delay.
> 
> The thing about shrinker compaction is that it's sort of on the
> wrong end.  It doesn't trigger compaction when memory is plentiful,
> no matter the internal fragmentation rate, and start firing compaction
> scans when memory pressure hits.  The problem with this is that, now
> compaction moves objects (if can compact zspages) and releases empty
> zspages, in parallel with potentially heavy swapping out activities,
> which can simply allocate those released pages back.  Which seems like
> a useless exercise and needless memcpy-s.  So I was thinking about
> either putting it under config or just removing it (this might be a
> harder decision).

In embedded (android/bookOS/etc.) there is a daemon, that triggers
various zram activities.  We can wire in pool-compaction (once under
memory pressure), which is a zram sysfs device attribute, instead
of pondering zsmalloc with scan callbacks.
