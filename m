Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563698;
	b=pYk3CrIxtFH8KrFQr+DE6+CSx9r9A+jEqsqN4hb4+a+XXIYeGjGe1RtCpUHnv4vrHD0L
	 T4MA8SCgsnUdc3W/NHCVJHSFoBTDpU5ZUR9vy/6/pL7Xi7sl8PTr7B/JiljcS5sD6vdGt
	 sRMGt6p8gJj/niRWA0SCUYWe4diVdb8OwuT/fH8nZ8S833WVivAPqOZrL1coVvSY7sx8K
	 H0hhSqjwlDX1zO5jXLMGHNpIcXt/YUThL18cXGm4hzl5SMZJPMwrWl3iTPkCdfUL1Jzrh
	 JOhnvP9WE0j6srZugh2NM1qm008jDy629ghpAxJg8XHUociBQNmrR8/sPcNjiU+F1lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563698;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:X-CID-META:
	 X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XflFerSSX8/DRZ0nDIfVWn5DuNcdHJxrlRvSa/LouyE=;
	b=4jTQRmjjd8e4cizUdQxd/HnYl+GlNFMjbBT11aXgdG0PbljvBAZPba7uSbxrCzw5OeKe
	 mn8rl0NPFRktNFrN9SZ6SiKRUxdKQrCBXw4kT4GeLEn7R4Hp2s45f6fJ+mPpd7NzIE0TS
	 yIX6VQio5UG5m8ZveO1bo5urYPabw4VeDM1FzmlTboiK1Hb39XuwIkYXLgboprksQiI6a
	 OWxkSQC2MR2aDr0yl0n64k0gF/DTygvfu7kaBW5nzFT5JXloYnUgaY6cLQmCnM6pJk+gT
	 gCqnO86FlKTMCC9boHPLafEipmTmHizSrQfPFc2JnKFFMa0R77K3qMyPsVHZIVRMgVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C5E606A887;
	Fri, 13 Nov 2026 09:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C5E606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3fbb9ca2df4811f19a56ed5b684f684d-20261113
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9c27602e-87ec-4c9c-98ce-81fa5be77e03,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:9c27602e-87ec-4c9c-98ce-81fa5be77e03,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:438bb5e73a121e35e5892c22171444ca,BulkI
	D:261113175444ZD0JE9K2,BulkQuantity:0,SF:17|19|38|64|66|78|80|81|82|83|102
	|127|136|153|841|865|898,TC:nil,Content:0|15|50|99|100|101|118,EDM:-3|-100
	,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3fbb9ca2df4811f19a56ed5b684f684d-20261113
X-User: lienze@kylinos.cn
Received: from [192.168.111.179] [(114.244.3.119)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 480940769; Fri, 13 Nov 2026 17:54:42 +0800
Message-ID: <db00f01d-c9c1-4207-ae7d-9dd77cf5afa7@kylinos.cn>
Date: Fri, 13 Nov 2026 17:54:37 +0800
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
Subject: Re: [PATCH 4/4] Docs/mm/damon/design: update for
 DAMON_FILTER_TYPE_ACTIVE
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, damon@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261113051711.89274-1-sj@kernel.org>
 <20261113051711.89274-5-sj@kernel.org>
Content-Language: en-US
From: Enze Li <lienze@kylinos.cn>
In-Reply-To: <20261113051711.89274-5-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi SJ,

On 11/13/26 1:17 PM, SJ Park wrote:
> Update DAMON design document for the newly added LRU-activeness DAMON
> filter type.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  Documentation/mm/damon/design.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
> index 8440c4954090e..b676be6971589 100644
> --- a/Documentation/mm/damon/design.rst
> +++ b/Documentation/mm/damon/design.rst
> @@ -302,6 +302,7 @@ filter types.  Currently below filter types are supported.
>  - ``pgidle_set``: Matches if the page for the memory is marked as access-idle.
>  - ``hugepage_size``: Matches if the page for the memory is a part of a hugepage
>    of a given size range.
> +- ``active``: Same to that for DAMOS filters.

This reads a bit awkward to me.  How about:

  "Same as that for DAMOS filters."

The ``anon`` and ``memcg`` entries above use the same wording, so
it would be nice to fix those at the same time.

WDYT?

Thanks,
Enze

>  
>  If such probes are registered, DAMON executes the probes for each region's
>  sampling memory when it does the access :ref:`sampling

