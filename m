Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600867;
	b=CD3sTGZkKOx4GfMjwbOIE8Xf10v3ZoYIfwLETxzPZmxstZfRafldJgcUfuB09ZpqjlYm
	 n1ENv7s+X06QrtsqBQVpwxHre6PjscY7/R5hmI9+7JXkKMhmX9NwBrRr4mjFGR28Q5hF6
	 Q3xuWePd3SRRpuHEER+LALNNn33a+mdAkKT0tpGDaf4u4w8qg7oI+S1tfjUHWLWnF+xST
	 +oqwxKdEY1AYHHC3UKXNrCVC5pv1h373pexDKI9IFq1CU7qR0h8yG7Lmq+iX2fQXy3Yag
	 Qg+XCpnLYWKn1hpfXFIQwTw0wpBCJbwpnxQ44oRzkKbHVF4RrgfAqJN4KmJVOtWuSjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=IREpwUTT7bykH5+IUb0NspcAIFcgrOxudi44OIMVnbQ=;
	b=yD7YG394JmNfPq6qe5/9ThfvauDhyEDNYe+ZPUXqXLRJwc1tAE97HVJKtMonFox04tic
	 OGobYRUgr9AFPe7TKGE2aUD7YUEfF73PxccYRoIoTBI82F2BAAZ9171Ta1WcujYXAc0uM
	 CZvxlt5ZeCwkbp1ZlAcQmfI+ntp2eHwfYFH00i9QviMIQM363l3kASQSAxZVgLEiZbhpN
	 z29MsvdRjS2tETiT46KSQ9mXS3a/hzUgU6vHQp4TxWsGOuVMNggjhMZbg2LJZHg5ZZvnf
	 hCGTEGPFy37/SNix3Rjmo0WZXu7tMu6heKz7+tuWNPyaQlJ1af1WkDTr5UspcCmEk3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=avQtpBAZ;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DEC606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DEC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=avQtpBAZ
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55c5b6584ceso432391cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794600865; x=1795205665; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IREpwUTT7bykH5+IUb0NspcAIFcgrOxudi44OIMVnbQ=;
        b=avQtpBAZPfEDqkIVPJOxO/FX6YrVkSyt1wasGP5+pHZd1sbxP6p4/fowNtLi+Ds02r
         FcWScsbzFzhdkGVBM2PcMgcW6GYLBbqaSfwb4ZTzYiyRRnMtfhiUDdsXvhe8vTf94Kz2
         y3JZwId+WmppCuW3UXtYZw2tq0XRT7Ys2J7cc+TMK4LI2kmhTg7nH7t9Wu3+R/vXb8qu
         nAsd5Wn5b6IQBiyXBsNvdjL6/dED/4npskrtsmbqtRlCChJ/6qwe8NxSoGYxxcY+X61g
         vgmYAgRJi9KH3o0bBX/f0KMYlOVmXfH1fVLOHIDAaTGntHtEpKFYn/uZTQV2dkiijfQw
         3YGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600865; x=1795205665;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IREpwUTT7bykH5+IUb0NspcAIFcgrOxudi44OIMVnbQ=;
        b=Wm7yrbVhnfHWxdG/BYiQyjbmaExXSZIk6vq8gGVcY0ZDBwD69uSVnsll2ivYcy1k3K
         MUt9M9VNXMCw1S7Ns7KZWpRwnDhOIvvPcm7vXHlUpRf4ZeI+GEGOIwrSKE9ZTP6DZvTt
         uJetMfwjviMGxkxPSe7HDxV6tpmtjp5AESJsAMKphKWVJev5uPnr8f75FnJBlBeWTgJV
         pczHbWP/u5YDjXstr5F9icbcIcXSNaP95gZSEF+FwBAiU4yiUOty1FnGQ68n8cGvtLuS
         3RiPx96R05Iy37a38YNwyYZLqG+FvQwIRS6pgTNGbgjr4ctrq95AzNpnM8apkzi7LZ/X
         T45g==
X-Forwarded-Encrypted: i=1; AL+hErEGUGYKP3UNJrw9X2hMcFyKM2yWe5EssyVWFihLNLNTtrXLOuIn/lKo+LEA5JSkro0IEnWt8/k0JXGL6k4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0aKJa/QBc65IC3q9+D3zDv34FXc7V6PpD+qwAeUSJJ6GUEhGD
	DYEBDPTO56axVPUeRXOZ+YIFykMtY94StfCqIhoq7qDPen/l9Ufnm5cwu7ZFuovd9VGiyxfSUSf
	iTdKy
X-Gm-Gg: AYBFou1AQhwiCRSnTmrK5X4OjBgWcUqNrqVThQ1UWESnrflYNN5+0AJ+UBrWCnfj52A
	/qlqauhWuNcIdgFNqyQv+gYZ3DZtFiEUfKqySSKe2KMrqXv6K0B2BNNJq/SRXP8pvcuk5QGWBd0
	w9rG80Wfv+DcTddjEw3+bp0K/8ink9qPYLqHaCPxviBkdxpV+rXJ2vPJlVts6HWJ2VyFZpudp7U
	0QEntNdnP31Ic7JsK8MWKCm0Gc/JELycs3JvJkXf8nemrzhvbMjGhv6G+J/8mOxKbGzWcsdZb/E
	Bv1DeuB3FmCKvTqlQDpgrfqDLKM5bv8ggVGQrEyxP1JFpo+nNgRCE9Svu/XAgOR0yeHf4efkJjW
	N29AWX0grArhDKQIg4u6wY8tBD3UlOWRVvXkTyfnufq6TCT+czIXQwuFu6kGpUyMRhpN+Dx/CPg
	M4ceBsXXdZoI+HMG1fhl15oRe47Q84y1hQaLyvZZiWkEGaDxB6gkyIrUsP1mlNZca4vc8OmkdFn
	nCTPU++CmrqZSq9n3KDuUtGrT88os7GVTvnZ1TLKLgrvgzz+GZj14jAqb9BkK12RoJDctTcL/wP
	mCe+Q2fv46UyKJYwxmIxr/jfACdaHFIpHc4VatR7MNrStIbaZVWRHI5dY4mZwr0gA1hxeczBxQB
	qhf8Lha54RVqSsbYOycuoCs2km1nvRQ==
X-Received: by 2002:a05:622a:4cc6:b0:535:a5fa:ee02 with SMTP id d75a77b69052e-55ac9e5bae5mr51686311cf.66.1794600865181;
        Fri, 13 Nov 2026 12:14:25 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0a231d1sm25865101cf.15.2026.11.13.12.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:14:24 -0800 (PST)
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
Subject: Re: [PATCH] mm/mempolicy: ignore a bind policy whose nodes have no
 memory
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Zi Yan <ziy@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 akpm@linux-foundation.org, david@kernel.org, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com
In-Reply-To: <D1684A69-FC68-45E4-8349-9D5E5A327053@nvidia.com>
References: <20261113192642.2618878-1-gourry@gourry.net>
 <D1684A69-FC68-45E4-8349-9D5E5A327053@nvidia.com>
Date: Fri, 13 Nov 2026 15:14:23 -0500
Message-Id: <179460086396.482102.9206100238305098014.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-13 14:47 -0500, Zi Yan wrote:
> On 13 Nov 2026, at 14:26, Gregory Price (Meta) wrote:
> 
> > apply_policy_zone() assumes that policy->nodes intersects N_MEMORY, so
> > it reads a bind policy with no N_HIGH_MEMORY node as movable-only.
> >
> > On systems with CONFIG_CPUSETS=n, nothing rebinds policies when memory
> > is removed, so offlining all memory on the nodes a bind policy names
> > leaves it with none. The policy is then treated as movable-only, and
> > movable allocations are restricted to nodes without memory.
> >
> > This results in allocations failures, a VM_FAULT_OOM leak, and then
> > an infinitely retrying fault that hangs the process.
> >
> >   page allocation failure: order:0, mode:0x140dca ... nodemask=2
> >   Huh VM_FAULT_OOM leaked out to the #PF handler. Retrying PF
> >
> > Ignore a bind policy whose nodes have no memory. policy_nodemask()
> > already ignores a bind policy that does not intersect the cpuset.
> > This covers hugetlb's policy_mbind_nodemask() as well.
> >
> > If the nodes regain memory, the policy applies again.
> >
> > CPUSETS=n with HOTREMOVE=y is unlikely a common configuration, so this
> > isn't marked for stable.
> 
> Also no Fixes?
>

It wasn't quite obvious what to tag exactly.  Since I don't think it's
worth backporting, wasn't sure I should bother spending time on the
Fixes tag.

-- 
~Gregory

