Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275757;
	b=E7gCbZcVgqPH/3/x8rfXnUJEFtTDxHHR27yJ4DpAZcKdc6WF1vMUbFN1Hw0WMPFDjBoS
	 vWBLwXcIhpR+IOYeC/q98OV5Fzgra16/4Ab0xIn6Up0EYmYW4jElfwD9OIec3Wgvq6plg
	 bqHetFuGRTYzkpMu6kmTh432lpSQptEr8dGsNokTaSiYcIBFLMfRM2VSB1y1HveMfdfK7
	 BLvG6DUX8jIrd70TKGja/7vCeAjSVIOxqJR6OEjsTqs3WGn8dLXOfLeLk9Bv+qYN0M9sE
	 1lQ98aedrgM449Byz075PgkjzBHz1wkHMXcT44mwjyl3YRrGdz7y6MJpt3n/8khOfbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275757;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=V0cF+hL3s3Nznw0EXwoT1iWnOP26Hs1pcC3+uYuF8Eo=;
	b=Tz8j2RdC0NLt+jnDDT6SFsJBCiNNth2maTA3YgzRmDUVawPr85t953LyZ3SwXv01Io8C
	 7EqDOlpZ7NIl2oc8Tsx2fFwQoFeEE92UItqtcM2WTC6MFcTmVoM8LcFvl97R+d/Rq/USU
	 XK/K73pbfC9PQ9+9kS3DSQ7bGKjk9EpUYZ1zc4NSbOriiaKWb6DLEh43amX96K4Vv44om
	 T9suFOntnFx7D73bF2dvXBLJ5btJgGfbmK6v3MQrf4WN5V4HYRuKBweyw5xqhtACDBpoO
	 xFFO84i7Pz6Gm+3ZfPa4g4RNnZWsATSGq45OBEC6EHsVssa5YrrbbZwvZPyPnVlu8tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hLCYwnta;
	arc=none smtp.remote-ip=95.215.58.50
Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C71606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C71606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hLCYwnta
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VLvCTcg6TZhdcREqx1XyK6ag0Xvx6fqdb0jTAv5YmhU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794275754; v=1; x=1794880554;
 b=hLCYwntaq2IvC7I54IraG2FpiZf61/SNXXW5ZnZAF9DH5d+3np8Us92hPXx0vWhStYoJOPsB
 VtU1YOHNhRmKcfPO1V5yJR/nCO2lT3qQ2Vf5Bgpbhrzdt/PijFh+agbgKNT+MScadOZclAZCzht
 X017NuaJaD+iMOoWjYlE36uc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2f1bd38a9b4ac25b;
	Tue, 10 Nov 2026 01:55:53 +0000
X-Mizu-Trace-ID: 2f1bd38a9b4ac25b
X-Migadu-Flow: FLOW_OUT
Message-ID: <c537a1ed-7cd4-4466-813e-ff066d792c8b@linux.dev>
Date: Tue, 10 Nov 2026 09:55:44 +0800
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
 Barry Song <baohua@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Lance Yang <lance.yang@linux.dev>, Ridong Chen <ridong.chen@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
 <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
From: Qi Zheng <qi.zheng@linux.dev>
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
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Qi Zheng <qi.zheng@linux.dev>

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 222b7fc2c3aa..e7ac319a570c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17635,10 +17635,10 @@ K:	(?i:vmemmap)
>   
>   MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
>   M:	Andrew Morton <akpm@linux-foundation.org>
> -R:	Kairui Song <kasong@tencent.com>
> +M:	Kairui Song <kasong@tencent.com>
> +R:	Barry Song <baohua@kernel.org>
>   R:	Qi Zheng <qi.zheng@linux.dev>
>   R:	Shakeel Butt <shakeel.butt@linux.dev>
> -R:	Barry Song <baohua@kernel.org>
>   R:	Axel Rasmussen <axelrasmussen@google.com>
>   R:	Yuanchu Xie <yuanchu@google.com>
>   R:	Wei Xu <weixugc@google.com>
> 

