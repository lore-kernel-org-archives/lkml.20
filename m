Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794635302;
	b=el2e86OVSVffwVl7r7ypesxbJVHwiv+SsxNO2pe5bTiRVz5a64HX35YCaq3LanTY1dNI
	 PUGF9qX7zmXiXLe7sdAWCePzF3BEUUriipYLJgzQzF/xMTKHBARJddkDu+cg8iju6xoa+
	 Un17HliAncIYga1BE3BNWWkusH1GtmocynzQvzgG+edJ1k6Q1QsT2y8NE9G3gXiX50NKb
	 tGANOEmXydixv9AF29/j8y0Ji/zLFUAxQE843F+MJnDb6jvJhoL6mSjYJasMmb9KRtivH
	 ke1aJpyb2ewfj2nydTqO11SykScgXNsMjYYgSt/1nrfiEwFIw52yZUyGZXcgyOq+Usg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794635302;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:X-CID-META:
	 X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=g1JziK7ad7JakdJUGDOUwA3/eXHhGnc7ibWdPj1NA5o=;
	b=w0D3WVHySIkou5z/FU7CfCu/iidV18QNdx1PVlUqatIAJuVUYOjdkSM5yaA+lvaCQPWU
	 9qylTR5WdWHhkksUwZ5LEUb2tOrFBR1oRdQ3CxFxmFtLbJF6DtzUsS1a8FXg6PAXdedLT
	 i2y8zI5bdRViT90JRLQyFv4OPIOxyvvmFN4/rJZpMCZ2Zhq1b7vI8ZJUsE48jpx7y2Rzx
	 ZEhBCLqYigHLhdM8THILbaTZtiy/+GJ5rBFHLmFEUW4Pwir7/8DsCi5YT9Fn7GtcuQVRE
	 dxTKAg05eCPeeUXXxrIFGmR6hkdAHuBlLc+ZZFpdVgxnlin6Rms9ZCiQ8KCzi5QcwbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F9606A323;
	Sat, 14 Nov 2026 05:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B1F9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f8d7ab08dfee11f19a56ed5b684f684d-20261114
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:099a3f3b-6a9c-44de-9035-2448c1010fe7,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:099a3f3b-6a9c-44de-9035-2448c1010fe7,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:33db5c30de269d32af48f6cebb00f1d9,BulkI
	D:261113175444ZD0JE9K2,BulkQuantity:4,SF:17|19|64|66|78|80|81|82|83|102|12
	7|136|153|841|865|898,TC:nil,Content:0|15|50|99|100|101|118,EDM:-3|-100,IP
	:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f8d7ab08dfee11f19a56ed5b684f684d-20261114
X-User: lienze@kylinos.cn
Received: from [192.168.3.106] [(111.193.136.161)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 196277102; Sat, 14 Nov 2026 13:48:09 +0800
Message-ID: <223604f3-2938-49cf-b5a1-7403444e2f3e@kylinos.cn>
Date: Sat, 14 Nov 2026 13:48:06 +0800
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
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, damon@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261113144314.97829-1-sj@kernel.org>
Content-Language: en-US
From: Enze Li <lienze@kylinos.cn>
In-Reply-To: <20261113144314.97829-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/11/13 22:43, SJ Park wrote:
> On Fri, 13 Nov 2026 17:54:37 +0800 Enze Li <lienze@kylinos.cn> wrote:
> 
>> Hi SJ,
>>
>> On 11/13/26 1:17 PM, SJ Park wrote:
>>> Update DAMON design document for the newly added LRU-activeness DAMON
>>> filter type.
>>>
>>> Signed-off-by: SJ Park <sj@kernel.org>
>>> ---
>>>  Documentation/mm/damon/design.rst | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
>>> index 8440c4954090e..b676be6971589 100644
>>> --- a/Documentation/mm/damon/design.rst
>>> +++ b/Documentation/mm/damon/design.rst
>>> @@ -302,6 +302,7 @@ filter types.  Currently below filter types are supported.
>>>  - ``pgidle_set``: Matches if the page for the memory is marked as access-idle.
>>>  - ``hugepage_size``: Matches if the page for the memory is a part of a hugepage
>>>    of a given size range.
>>> +- ``active``: Same to that for DAMOS filters.
>>
>> This reads a bit awkward to me.  How about:
>>
>>   "Same as that for DAMOS filters."
>>
>> The ``anon`` and ``memcg`` entries above use the same wording, so
>> it would be nice to fix those at the same time.
>>
>> WDYT?
> 
> Makes sense to me, thank you for sharing the finding, Enze!  I also find more
> "same to" usages in the doc.  Would you like to send a patch for fixing those
> at once?

Sure, I'd be happy to.  I'll send a follow-up patch fixing all six
"same to" usages in design.rst, on top of mm-new.

Best regards,
Enze

<...>

