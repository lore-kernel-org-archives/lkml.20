Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281900;
	b=dtXTqVMsmVn64nC62HaTp9jy61RbGmgtFmYt6uH7/WtN9Dd4sBJ2TvdIM2Ay+XNoxzIi
	 SXMuFho7ixIPwpwhPK9bBNfxdISWTgsStO3ga0IpXUG+RoizfzRqKW0PCBhbqv8ip5N4J
	 6LCPl0zYk/X1d25jSaE/O2L9mv5wyveJxw6SjTVJfmn9KemJnCJlMUGEcXM723ue12PcT
	 Bp4OXzORWg6dBtseKUHK2z9EljTnYUn/ilVcLdHJD0Ed4036v4B2vK4lCQsgIpKeLbeeS
	 XmXvsWNHaUsR8oufrYS9tkf1kgBrJc75qco59AROJvtTikmoIvHvatjHje45df+ScCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281900;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tzDE/u8COOmDW8zDGo5m9Cv7FQzO3s8Vy+gEWM/IoTI=;
	b=OrsJOXOV7oMFHOClyhL+hk0B6ADbVXoELPhrXaXZwDyFDlzVX0UDsap+HOHoBvS/qeo4
	 ulQNtLictH3pjJC5otx/WptTG9jxUm1Qs/5skXgcy+4Iyl28zbCfNPVRkANHlEyutP/u0
	 cLkwr5TptIwfUDtXY8MerVP7ELBYhFoCPzuM91EcJjQKfE4SLPNogXxFeR3lqKqt4GhWY
	 JSj+keLXTCbF3AMhTl0lweD7TUnuvQOv2u0PCTCKeJ/m4JlMiH8j1Gy8Mf1hkv4/bEW/E
	 nJ4xhjHEsDfZkQLQTpy8VmYX8OQgl01Oo8V5rmhUtQfwe6FQUoY7xWpZ28+zTlvBUfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HiknGeRA;
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6736606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6736606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HiknGeRA
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794281896; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=tzDE/u8COOmDW8zDGo5m9Cv7FQzO3s8Vy+gEWM/IoTI=;
	b=HiknGeRApoEcTfo3ms3vUkn3OfylzvVAq6y7R3l42/Vx87jxnWnTQe095Fm2zmTLanMg4+SmQWDNtvFIvdAz8Ff02I5Yx8CSjqQpm0pywRqyuAASg7MeNVqjZOn2Ahso0Iqk2Zjq9jB1u9UDU6ks1iJ+Ix5Qi+EVs7XYqf94GNU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R591e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XETnmwY_1794281895;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XETnmwY_1794281895 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Nov 2026 11:38:15 +0800
Message-ID: <ed1fa872-6da4-4262-81ee-b2d411b36c0a@linux.alibaba.com>
Date: Tue, 10 Nov 2026 11:38:14 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MAINTAINERS: remove myself from MEMORY MANAGEMENT -
 RECLAIM
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Lance Yang <lance.yang@linux.dev>, Ridong Chen <ridong.chen@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
 <20261109-maintainers_mglru-v1-2-c25e6de60bcc@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261109-maintainers_mglru-v1-2-c25e6de60bcc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/26 2:31 AM, David Hildenbrand (Arm) wrote:
> I don't really get to look at most reclaim related stuff. For things
> that are actually relevant for me, I'm sure people will CC me.
> 
> So remove myself from the MEMORY MANAGEMENT - RECLAIM section for now
> to have a bit less noise in my inbox.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Acked-by: Baolin Wang <baolin.wang@linux.alibaba.com>
