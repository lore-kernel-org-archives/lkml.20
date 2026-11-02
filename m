Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793588308;
	b=EY86czzrnAfWDrLXQbNZ27v4wXmQ8RJrsBcwLdidHLtzTHc6HEM2zg2UjoozrLY3QBdM
	 iY7L/hLpYhEBgKyKNFfxAMivB871gNA4M7VoW1YB8FDrPK60+KOOKh3XClMe9zf2Rr2v9
	 40iHyWW/99SdcWe06Py89LhYv6kMJug7cR7V7Pm35+MsSD2jjX38adqyjBxagSTzUmO2O
	 56hfw9IhNrZWn0wfKiYw5wTda4OksNyn1xVcxAI65x1dAEYcEEcO+wEeLtzIz8rqkry4/
	 4MJhKMhk67RzN9njRHVwQFjtGvB5wIELQSXHqz0Xy9L5s/jdID6/W3XZPB9S0oX+Neg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=vbhM51MkwqyzYIK/l0MrHOeAdqnx2rbbHcfO8pxxmSY=;
	b=SFgkxxsWlnMt++bL7GotITNtdq/uxvPdKA1YUDpqQ021tQ/LZkqEO9c0B/FTTVNCY9eH
	 7pCXwKQuiCeQLErsQ4pqHXagInM2tr20Mu7iO1CEjQ/L5uwmWp/ymF41MmuY0MdGQ8Wcc
	 Bgavt0+0HgQBGO5iIb0o/QhA+HyPkwPWn0TDUkt+fTW2nHYqFzZPvRWHp9CIwtPMDMlxC
	 smMwOQxtZKnLWMn2kJ1GouiNiYCCVUJMMGMp2Nw5fxemjptAKi31lnSl0XwNDfG2G75O3
	 Oc42V/O07pA9SA18ho4pOG+ZsBaAskFT9C2CCDeQxHHqA6d+jO+aChq6Tpl1MnLxl9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJxda32a;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544D5606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 544D5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJxda32a
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a1865cfdcso248537eec.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793588307; x=1794193107; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vbhM51MkwqyzYIK/l0MrHOeAdqnx2rbbHcfO8pxxmSY=;
        b=JJxda32av2GyQVDm0JDdP2T7TyIrT3HMVMeksaeiZ1TImqrJNbznsMjVuL3R7xtYmL
         Mi5TMrQ2q335MnDAQy2TF4QMhiwFHynJURyOMCqPVG2fvijuUvFX5YmJrk8tThQFDuwU
         8ihplGHkWbWwIIM4i0oyvpy17Ok6mMLTjNTaTkbkrbAaW4FUfNEb9JgelOGgXrN20YQc
         fI1YtWlwbfSljL9dx44H/gv+3hwLrYlt+GSDJoyDHDkc2/IJvoPqcTK2UZeelkwU22Aa
         f3MQl91GW3iAYP9Od7NzmH5+wc7mHWY68lYQjt++XZ7KHNezt6CUYXqKtnQxa7qo8bf3
         NOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793588307; x=1794193107;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbhM51MkwqyzYIK/l0MrHOeAdqnx2rbbHcfO8pxxmSY=;
        b=LI3wHQRLLo795c2dQZSINj+HZFrKeGzasmEcirDDwlee7/bEzWxTE4s90I7v1i/aTT
         hdu+E9L/pfaLCrKRRrYI3tOcJq6tdbxSc09bruTy4H5TPWE1xrI8g2vGDlygNRuZQSs1
         1/vBNHKiYmLZK6llNivcqLP5sXLtvQILiN+vL6WT0a7Vw4tz0ByB/QZ16CRHrpHQcCJH
         0VTn8DUEMLgHEwIBWRxWx/05dBvLdcL1LUOGuqxQ8eWoSN6mGRNPPrgc8HZyrKEt1j88
         YrRWercKCPsTQIqrJCND2s5UfIDfDlaZrkjOQt+4hDQB+oq73d4cNDmxdI9MvY8/AHk+
         F9UA==
X-Forwarded-Encrypted: i=1; AKwUvBzE0XL9vFUW+OlZSJ2ojHfOKTIuiESQXbp4CMhNi4dHpFIyWnVFnfXzUx5jvh+UgN5NF7/7rn1tjsiAiME=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqYW0BkSN82pnXRzcGVxluEjMQ2b8qi0waTJ/yAHSRFEmikLF2
	AVWzXFzUvN/6RGuU9ohXmfnHZyORPN0PaXH8v+X+7xgYdKjSutp6Yihp
X-Gm-Gg: AYBFou13RrK5+ROB9mlQyTei1LtHwXyNNqbpQiK3uw8Qa3HrkOYOAeAd3QUDway+1zC
	sfvZxvqcYSLaPYT3Z5HRhopThoWi+/YsZXEpq5Z+ZQEx0I22DyYO0hirn3AtxCcP9AHkKfeoS0x
	EEYwEtV68nsy84I646m97BaYlcnIf0a1dWJcS+7uCCScCKuPNN4Nezlf1bIVQS66pbIruH0jqUG
	OzHpGXEABR/BAvhUyFJKXd15cKEG3Ug7PinDfRjjk2oPDbJWvFAUoqGW5dWB6TR239R/rmIlmzO
	03aHs5dURNmNu0GGrec/4HRKubbNlHMCTT8ooQ2P659uv52IqA84BZXVmOrZ3i+yPYXu6lx+ZsB
	K/5rU2RMpEL4dM9Spd8+/iOT27Sk4TiJRcDO0OsYUBCMCI5RvYFX5yfTygndLMBNc7EWB3LsEWm
	Up1ld6VbKK9y3pvLL6dcEMYJvihG0UHHA47uIVtRlCFk2qVGHPf3aAEG5+/cIAEUOGuCV9IA8ZK
	OmjdbvEJQexXMnXFHxlVbAuLKFSxPD8OpGLLwob5f8Qjpx54OCnBHB2pGmV2hyUYNpfbOIMYYlu
	X2z24QrYeChOE7GSq58pQ5YohtO5D+VP5jUNgMBwBFyx1XIml8mh8uF/FodlA5UwH1VZ
X-Received: by 2002:a05:701b:2302:b0:183:d275:cf76 with SMTP id a92af1059eb24-1ac59dd0e2emr19891581c88.2.1793588307274;
        Sun, 01 Nov 2026 18:58:27 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcf67csm29779410c88.21.2026.11.01.18.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:58:26 -0800 (PST)
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
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
 Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
 Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, xueyuan.chen21@gmail.com
In-Reply-To: <auKlTdFbOZmAuheo@google.com>
References: <cover.1786003779.git.xueyuan.chen@vivo.com>
 <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKjuiRxQwtsZF_0@google.com> <auKlTdFbOZmAuheo@google.com>
Date: Mon, 02 Nov 2026 10:58:21 +0800
Message-Id: <179358830137.300028.11084163850071476613.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-10-29 10:48 +0900, Sergey Senozhatsky wrote:
> On (26/10/29 10:43), Sergey Senozhatsky wrote:
> [..]
> > > Hmm we'd need to collect more data in our workloads to determine, but
> > > if we can compute compactable ratio (freeable_pages / total_pages) on
> > > a per size class basis, can we just skip the size class whose ratio is
> > > too bad? Would that at least cut down on the vast majority of
> > > fruitless memcpys and lock acquisitions etc?
> > > 
> > > I'm always a bit hesitant to over-rely on userspace, especially when
> > > kernel has information to do something smart about it. It might not
> > > react in time, and many proactive reclaiming schemes back off under
> > > heavy memory pressure.
> > 
> > Apologies for the delay.
> > 
> > The thing about shrinker compaction is that it's sort of on the
> > wrong end.  It doesn't trigger compaction when memory is plentiful,
> > no matter the internal fragmentation rate, and start firing compaction
> > scans when memory pressure hits.  The problem with this is that, now
> > compaction moves objects (if can compact zspages) and releases empty
> > zspages, in parallel with potentially heavy swapping out activities,
> > which can simply allocate those released pages back.  Which seems like
> > a useless exercise and needless memcpy-s.  So I was thinking about
> > either putting it under config or just removing it (this might be a
> > harder decision).
> 
> In embedded (android/bookOS/etc.) there is a daemon, that triggers
> various zram activities.  We can wire in pool-compaction (once under
> memory pressure), which is a zram sysfs device attribute, instead
> of pondering zsmalloc with scan callbacks.
> 

What triggering policy do you have in mind for the daemon?

If compaction is still triggered when the system is under memory
pressure, wouldn't it still overlap with heavy swap-out? The shrinker
can already run from kswapd, so moving it to a daemon alone would not
necessarily change that timing.


