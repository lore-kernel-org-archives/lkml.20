Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464313;
	b=Pjev74asjhBCKJmmtLwX/VLG9G5Cwb43bpm+mARNDCxqeBFcbJD5JeKNXqxkOTCrlMFN
	 TWrwF3GpUDO8fwnEUs2llTZO4liQNuFFGJpyybp1ce2twsbRLKijwNFAfesolofUKHoAI
	 lOQQfI+BqOJrULcUFSg6a5d2GxwjoNEgvDt+VKTvp+EZQXY65YLThwo3xWle53Zq4nqWT
	 AIqRvXRw8PVlFPb4ah98YTws+TmxUbNsnkgdlW2NVa38qKbNrfTc3XDcft4l6ly3MTBRP
	 tY7v689wXLuGcLDsxuudLIPYHr9A1wPqdUa7z2zS/bCofnKNtmdhegBL0ezRrWRNyxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=frWgCQavZg1gYLROomjbuAoHzdPP/chBAMQ9opw+pCg=;
	b=aX7zkPwtv35IWjqd7F4Dn1c+bOB0bdmXFdu27nbIr9AFRdx2qRqGWQhzyKWaoHhcXEwB
	 BqTHTSrROevK0xpJ5HHq3+5E/7UOPCVTt4qzLkSXKePr0AHJyEbij6ppQNrXsiU+0mdcD
	 yACmBHd7/8fAigCk2XfyBo0VbpjU3H0fmk2zC9CgvGEmzfDOuGVcSblTmaZIe4IBQKQSo
	 mgkTNNZ6rJnMle+TdHMHbD9gFIiBQvE3bxwpn9KY26syIuNX7L00POvXOmAtM3mgwcxyw
	 8NO6jhgMUoJdwNE5g0KU2xhhJQXQduYJr6VVmk1oCQgMuxA/Z0TQSp+bgXepCNrNy2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="K/P7WmvB";
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A3C606A88F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A3C606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=K/P7WmvB
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53664b4860bso38038561cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794464312; x=1795069112; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=frWgCQavZg1gYLROomjbuAoHzdPP/chBAMQ9opw+pCg=;
        b=K/P7WmvBzDpFPzF3ks16QQzTMZL71KJsbfLPopX22hyDger41aYYwDnbTpNK2EQwQ6
         rC5kdQ1e2SL8W7ma9V1tLEutfJrhuy0TParbDSr2CtLGRXLxOI92v7L1XWsuoIBaA38W
         D4s5fIFl3CCbAhcMh2M0Q/NvQyirGP65XwRTNY/AgQLgiOE8OGrqKICVU2RYof0+/IPg
         C+b60A4sdPmMCRNhFupPR6Tb+Uq363N18K21c/a38KE3phYFQBoUGwGtzjeNwyj4DeZF
         Xt3e3dk/t25qymfyrav4e3SLWvjNs8qcy2XfzUilfl1pJOpAoeLD7ngh7tZDz+05ElNw
         Fdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464312; x=1795069112;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frWgCQavZg1gYLROomjbuAoHzdPP/chBAMQ9opw+pCg=;
        b=UBYQWO99U4RtkhTJ9mQeNUtFdIjSWJ1Fh+iwyVzLdCrn0KZWmhBP7c5H84czHCchSk
         6Dwv80we+6792fuGb5VeCfxSMl4e7efMNrkTgRhaNgx+sb7SKw5k8LZjGVpBjhiaJioM
         1dyMmIs7cVLfoEs/d944PKNSbdOcpcLcCq90OXappR6ikGIwYXtW9viuGgwaUwuBqvbe
         OPWNkegpEIJ3qEXVPCXYlQunH8OA9z6R4WSWv3PNaMbWs8reKmmqoLjdhA4EzcSqcn+G
         3eWwD3ESc/we7VQ4ANmbOQhwHHxFyuwAEtp7b70gDy2lOrWWJCtaZ+6GFto/lbzBNULl
         dskQ==
X-Forwarded-Encrypted: i=1; AL+hErHuHcHZi0q7f5W2PL+OXFEmCELua6dE7v6Tyj+j6kvJRzpmOx1iyong04xJ8sPdEZTYp3/fi14+K1kiwwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OO7xC8I/9PZA2jlGHyUm6upUM043AkBZzJM1rfwTwXn0d+6hY
	xoWIVFAAhX4u16sRckBQKeVuIt/ORDS6hmRx1caVfZqqoLdODUaaLrYDfxwDH+mnYgE=
X-Gm-Gg: AYBFou2W9DU+aONX/04qw5YI342STcdWAo3gpG/1ZDJ2dBv3MTPKUUeMyewNDSoGudR
	u8TseDTajk4Mh6UBs2/M+8to0xDyB/SJ5NSEizZMyw6jn52tT3BXblS1WgJ+fKYaPFmg+xgONF0
	kPdbGviPgMYTpA2gii9vew+ZXeERzMODwivi1pZ/v20L64Hce0UFNC/F289pTRbJnjodRRKx/k4
	s2LMF1HrPBztGuHcdTUOx9ACLn2VjpcnQO/EVsiCuBmEuvJ+xEgrU/jTbe8jBxreQupGZzISs4c
	xc2qTyfPPNaHBN6xWxO94+qcvliWrL3Dd72kbsx53H7RrrAz9yUmgPVjty2pPerx5c6FyQxubYK
	0aOaShL1NaoItWl3Er/n4fhC++Kkky+ZCDsEyKZb9WSAjPl6cZp8IuuhEYWSrh4Ic3N7sWVCQ7y
	VyX2q77jzq7lXE9MYQbpDw3jPZDp1g/c+RfGVLgGzTISEHf0n6z8T/FB/tx3NXReLF2oOTBBnUX
	q0+1+GqrLe+/Z4KNt482eA9ZH+RijGwmVJ3lHnSCFDdyZm4pyLVDigrSoW4V/lV5nC6KomWu64r
	NrjVyIMcwsnYC84lsUubLzKiXQizG4s9GjVQ9X8ftl1BgCMnD1ttCEY3mr3MgyD4dUndErpajB+
	44yI3K0U=
X-Received: by 2002:a05:622a:1b10:b0:545:bab0:e666 with SMTP id d75a77b69052e-556c196316bmr78478321cf.70.1794464312165;
        Wed, 11 Nov 2026 22:18:32 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f0177ce21sm42181036d6.6.2026.11.11.22.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:18:31 -0800 (PST)
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
Subject: Re: [PATCH v2] mm/page_alloc: only skip kswapd nodes below their
 kswapd watermark
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Gregory Price <gourry@gourry.net>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
In-Reply-To: <20261110224432.2347606-1-joshua.hahnjy@gmail.com>
References: <20261110224432.2347606-1-joshua.hahnjy@gmail.com>
Date: Thu, 12 Nov 2026 01:18:30 -0500
Message-Id: <179446431092.482102.12227242887844422381.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-10 14:44 -0800, Joshua Hahn wrote:
> Commit 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to
> NUMA restrictions") makes get_page_from_freelist() skip any node with an
> active kswapd on the first pass through the zonelist, so unrestricted
> allocations don't immediately consume the memory kswapd is freeing.
> 
> But kswapd is also woken for high-order requests. With THP defrag set to
> defer, each THP fault that fails on a fragmented node wakes kswapd at
> PMD order. kswapd reclaims a batch, wakes kcompactd, and sleeps until
> the next failed fault, so it stays awake much of the time even on a node
> with plenty of free order-0 memory. This means those order-0 allocations
> get directed elsewhere.
> 
> This was observed on some Meta production workloads running on 2-NUMA
> systems, where processes with a preference for node0 allocations
> continuously allocated order-0 pages on node1, despite node0 having
> hundreds of GB of free memory.
> 
> Only skip a zone with an active kswapd if it is also below kswapd's
> target watermark.
>

I feel this commit message could have been simplified further.
Brevity is the soul of wit.

  patch (details) skips any node with kswapd running - assuming that
  this means memory is low, but kswapd is woken for other reasons (e.g.
  order-N allocation failures).

  This results in fallback allocations under X conditions, which leads
  to xyz performance isues.

  Only skip nodes with kswap running if the node is under the relevant
  low-memory watermark.

  (test details)


Otherwise this looks good to me.  Looking forward to the watermark
cleanup afterwards - i agree the change here is a bit ugly, but
probably preferable for the backport.

Acked-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

