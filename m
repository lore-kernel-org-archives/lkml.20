Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281878;
	b=A7AviAh6DoOheyqAFB2cgRzaLf/dafMYcgdDttTFZ7a3ttTCSx1w/9XYIIRLaB4F+r93
	 /xd8gESIuwk4QozwVhWKXD22EBF5cvkt9SavGW423ia3cw9jGa4O2V6eiRp+x4Axs1gTI
	 BqoixOsGE5BhyyUNgXc5jELhmBbt7jWZqBDI3XMrvYLbuoMiH3djKIeUi5R93B7y565H0
	 TQSLyy6D4YcKIg8HleifNM1+TF9S6fkQbRVWqcC6gJLMd2sHqzwnkU6MWNtt3PzDDsv5e
	 VV8xCZdcSo4d+uNftb27V86tgIIecmWrE/+TJ70XuIWSOSePzI/UAnl0xgbNXTI3OVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281878;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xR8GHVAswiwBZf376osv+2IMiUWvGBbfvXTQYVFuwY0=;
	b=xuRtVYFvAQkm2QBRyd0FDik7X8jiHx520uaXQtn6QxSEtIPvXXLQe41/hCpz1L0EIIdk
	 6FfRBle5ITAdx8d0JzHZyD+bG+PK3T/ooghSR5Ge52nkmqjsAVkZSevbFsZmbZIGJc0tT
	 aeugepy3eb96baXP539PfiLNoJWPWHoaJWB13XKIPFDJ+EsaDlWPWgccAopthP8nggUqm
	 i9AcQQaBRydnPHo+mto/3GU6erSphDfe74jobfpf6MJr5AXRLZepdOhOHR29/9UPaIBQc
	 ABlANgH6A/u0xc5ATsbxMfyWXpMZdJXmGUGdnUFhB3yFaCm0Ep3E2MsAvW4x1zU4o1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=O2OimBiv;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B8C606B63B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60B8C606B63B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=O2OimBiv
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794281875; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=xR8GHVAswiwBZf376osv+2IMiUWvGBbfvXTQYVFuwY0=;
	b=O2OimBiv7wuCx1ZF9FK7O9vmTNQhLD4tFL6VSiNan6m7UWr6JzOqJrz0oCWWTdB73lNQEbzd07e5UrtVW1ghjKNJuaDZEsaDlX2Tj2fP8gw/P61YdLnCvF18WMChikbfZnfzTiDvFQ5ix31VwU0nOan5sdxZWKWTj2ltMpM3LUo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R431e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XETsyWO_1794281873;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XETsyWO_1794281873 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Nov 2026 11:37:54 +0800
Message-ID: <56b4150f-9e77-49cc-aed3-365670d401c1@linux.alibaba.com>
Date: Tue, 10 Nov 2026 11:37:52 +0800
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
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN
 LRU) update
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
 <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/26 2:31 AM, David Hildenbrand (Arm) wrote:
> MGLRU is currently the only MM component without a dedicated component
> maintainer. Fortunately, Kairui and Barry have been actively
> contributing to MGLRU and have volunteered to take on more responsibility
> by officially taking care of it.
> 
> Given that Kairui is already an established MM component maintainer in
> a related MM component (SWAP), add him as an MGLRU maintainer right away.
> 
> For Barry, the idea is to transition him towards a component maintainer
> role over the coming months, starting by moving him to the top of the
> reviewer list.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Thanks for your great work, Kairui and Barry.
Acked-by: Baolin Wang <baolin.wang@linux.alibaba.com>
