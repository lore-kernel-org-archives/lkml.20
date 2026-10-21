Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590144;
	b=uL6i3ToA81e8oK2hTEAtgPT9BJTIQKYrEd22HPsibINrXHX3eAl3d7mQQvk6UY2reNRI
	 4lnFdwKcGYT2K9vF6HF0JT6NLdkKOQC6H3y527x/06mdV9DPa7oI8+7SKk2KOKjXx6ZpL
	 wYj9HkXGLBpP/sEZCLPzcZ3+hfjzaJ4d8QKC331rb108OtbI/Y+kH65OIe7CK7aI3pAJ/
	 UyqqrCtR1CMtRjC8n50MXFaXBZmytp5ODWQg/dZipvbnD5XewkADPKtbWSvyXGN4cCPC7
	 jxstXd01wnjmhKvxYlWIYqjZyrqXRE0Hkvbk6USekwxLLqme5SCMThfagQ3uHUhMQQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Bibqzip471YCJrx0iwEaAHwRkbbTyOfLVqUM8nPUu1Y=;
	b=SJML0yxT+MLzAT7fXgzjnHg/EWHeV2dBfdAzCfQEGMUB8UBB1VizUOdnCyHA0uP2iJUf
	 6qeucOnzDBUM/nlP/ZLrweIBgseUMNjsY5ddWuo1ir+kKyQlnxTdQXP5Ge0FFKmi4t0jY
	 6qJNzGX5MXDhTcLraOFpu2IvHuaHWdhBj1i+lhEInY+rqv25hrVVessYMiRfTLMMEC2TJ
	 j/FfojWe2xu7VAe8rvuQIVJHq5PA6H5+jbHPzB0K3Nwwovb0EJVT1bb+z0S+L72omrI7h
	 jLnmJdwmiawRC3wUl5SdcNg/n6PuDQYFQx38P9DHFYoytrkHeQzwkb9k1xZqobgHt2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="pVRsPr/S";
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF103606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF103606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=pVRsPr/S
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f3c89594cso54957885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792590143; x=1793194943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bibqzip471YCJrx0iwEaAHwRkbbTyOfLVqUM8nPUu1Y=;
        b=pVRsPr/SNXWMmrBQxtPCmJxpck4LeHByjYHSq4uHVvUdCe88al1vC/o8KhlNEoffjM
         nGFr7IVVatcuMQBcHw7B9gV7PyzmT/wGJ1WplkWIT0N3rNRvn88qKaV0ixufB3nOXnUo
         jZb1monFelSeWTxVK4n7Z8Cv4FQEw6V0ssk2AYkk+5eecOPL0/AOLrIsQ4U1lEeIgnw+
         6icZPn+UZKSj9GcYUXWalUQEm6GDK5XuvFPpNbDIK2DKQQy93lBMS5R8oHlW+P4Grafc
         uo6+gZbZI0WB/Uptifu0W5OXkx4qIlpHVuBe6adRciqelRoNliwLMMhA4/79F404xsZd
         n9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590143; x=1793194943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bibqzip471YCJrx0iwEaAHwRkbbTyOfLVqUM8nPUu1Y=;
        b=fCbzTKQWBy3yEeixIfN2puy5p7t+aGtPuIt4cSBnWFLi1+i8j51eAeuWN+SkehJixh
         Fyzv8uuHi6rJJzJ4y1kybQc6XIqQvngZwUWlLoyk1bP0oRPPMzr5w6pW9K33j8ahnvMH
         0sDXlE8kcoj+oktau48Qfdfx2swSlROLkm9lrgQvBmFIv+jSfAZ67AZ6VffAl+IClOkv
         7rAAGDtDgvIgX0c47Hk4FDpEnbphKCK7bNLqrw7dASqL+gZCM4bBEh8lNQi+UUHbM9+P
         Kf0xyZSsWsnwKhFNXxcU7cBmboKAymp0b8NJRX/6ohBW2TP2yvXDsgf+80yvAuaSNkZd
         lf9g==
X-Forwarded-Encrypted: i=1; AKwUvBwJU9PueIoKlxUaRaqhF3cXBIdivaO3uq0N6CgL5KuF1n+xellVSYDmy4ebRkauCRWrWyiwqYCAyimzPYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgdx82cbUewfIjgSlJiHQ7QSy1cKPQxmBKDEaPOgpfWvs6vfMW
	OQy8pVoKGli7hWjHUe08kLmo/lpON2TCGtBRAGx+tJ9I7iAVphXJKCrDPYMLuCpK0nw=
X-Gm-Gg: AYBFou1DEY580StAWN0+sdU81UaBIcvb9B/Ey8d7Mx74NPrcmGUprLv+V3blHJlaGKd
	MFIVcVNmwWDsOIuNi4YvZns25ixeOX1L+1AQkX+7dSfRi/W0XJ+Q9Bzy13/eG07SZvkqyjQJ1hP
	sTnf+xpADXgxInuy03+LrBJ+6ZkyADJ4n9KwEZEl2YGBNeqNsIxzL9PvsC6DKuY0ZRpz/EZQ/2m
	Vx37CzAKKnwWxIldkUpJsb40IuBfS0f7zFDEYtGmlLfh3LZSGkOMUK0QPl66QzNot70NHp9RJ8Q
	56mIbt526263GOBd2sv2P5NVm9rz5hbEdK2shT10llJRyF4+QN9eJqxYxoCxen8k03uhAnwpIbg
	rTrmvrCQJQh4Jx1DrQmvHHjmxVeo/lhdZoXJ98Z2VQLzFg2fs8UJjYPRIQeDBZ/OLYBkeDvfh0C
	wkouf2qqoI19RH2AdK+nops/Gzzcn88oNmWbcF9DlT2PHPiMnqjqgc4QCqpf9nmg0zxbPVfikuj
	LvJ+GHpG08Z9dSXD/+D5ZuSsVgk97NsnngdPE2p229N4RqY+e1zanBQ3rbH39wTVP6eQcY4CvpE
	ZCn1wbL6yOlCwAJevZSBDDkvx+IsJ/sR5gsp
X-Received: by 2002:a05:620a:2556:b0:93f:258e:502d with SMTP id af79cd13be357-93f57f5eeaemr425264585a.63.1792590142562;
        Wed, 21 Oct 2026 06:42:22 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c6ef4dsm261445385a.3.2026.10.21.06.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:42:22 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:42:20 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, hannes@cmpxchg.org, 
	david@kernel.org, mhocko@kernel.org, dave@stgolabs.net, roman.gushchin@linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: reclaim every zone in per-node proactive
 reclaim
Message-ID: <atjA_SOLnihm1TmT@gourry-fedora-PF4VCD3F>
References: <20261019185002.3428594-1-gourry@gourry.net>
 <atiwhEIudhnK0pmQ@gremlin>
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
In-Reply-To: <atiwhEIudhnK0pmQ@gremlin>

On Wed, Oct 21, 2026 at 01:31:32PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Oct 19, 2026 at 02:50:02PM -0400, Gregory Price (Meta) wrote:
> > user_proactive_reclaim() limits per-node reclaim to
> > gfp_zone(GFP_KERNEL), which is ZONE_NORMAL. Proactive reclaim serves no
> > allocation, but that limit makes shrink_node() skip every ZONE_MOVABLE
> > folio, so writing to /sys/devices/system/node/nodeN/reclaim never
> > reclaims a node's movable memory. A movable-only node, such as dax/kmem
> > or hotplugged memory onlined movable, reclaims nothing and fails with
> > -EAGAIN.
> >
> > To reproduce, fill a movable-only node with clean page cache and write
> > 200M to its nodeN/reclaim: the write fails with -EAGAIN and the page
> > cache stays. The same write to a ZONE_NORMAL node frees 200MB.
> >
> > Scan every zone, as memory.reclaim does.
> >
> > Fixes: b980077899ea4 ("mm: introduce per-node proactive reclaim interface")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> 
> Seems sensible to me, and since it's become the review of the ages (TM) let's
> try and get some kind of tag record here :P
> 
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>

1 line change
20 acks

This is the way.

~Gregory
