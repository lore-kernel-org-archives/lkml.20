Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7037F377A88
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857253; cv=none; b=Z4YTJp/+PbfooltDNZYz5dRl/8WUO5D6xfFqD/bDfMsMvBX8O30+AZuAY2KBCj4zBoMl5yEJOszalwLnibxR443kq7oA/Wgnpu/IUyXvg30ZM1BBLStYDxWffxvyIOzKsJlkA9H7GSIu1RBvKdVU1TUrNmcA9qRTwt3NDmCWRqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857253; c=relaxed/simple;
	bh=i7d1g0fooan2ALGBYXYyYRodQcbzGDJ+/lFykyk33ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lYNHLP2ZX4YwWQUMAREpVxvc0tine12EMhdkxjguHbfH9n04Qwob1EO1tWKfEJL6sQsyjhJqje+/cdcX/4Z9GdUhNrjwumD1ZrCt7ahbx3dP7ZR1P4SOqNqwqVTK2kS/jm+L7U7FV678KioRhosE3rV/4XUu27xxYd6FnJVLK/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 85360fd8bd9211f19a56ed5b684f684d-20261001
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:bbac7fc5-068d-4550-894b-1c878b594ed5,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:bbac7fc5-068d-4550-894b-1c878b594ed5,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:f27e4a515890d4b7e19c31e706f1203d,BulkI
	D:26100120020027Q1EGWV,BulkQuantity:1,SF:17|19|38|64|66|78|80|81|82|83|102
	|127|136|841|865|898,TC:nil,Content:0|15|50|99,EDM:-3|-100,IP:-2,URL:0,Fil
	e:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DK
	R:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 85360fd8bd9211f19a56ed5b684f684d-20261001
X-User: lienze@kylinos.cn
Received: from [192.168.3.72] [(175.169.70.242)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1988652897; Thu, 01 Oct 2026 20:20:42 +0800
Message-ID: <3b2b1d87-bc96-4292-9514-bb263b6496b7@kylinos.cn>
Date: Thu, 1 Oct 2026 20:20:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb_cgroup: add trailing #endif comment for
 include guard
To: "David Hildenbrand (Arm)" <david@kernel.org>, ljs@kernel.org,
 akpm@linux-foundation.org, enelsonmoore@gmail.com,
 linux-kernel@vger.kernel.org, enze.li@gmx.com
References: <20261001113957.561304-1-lienze@kylinos.cn>
 <487f9b69-b314-4133-94f8-733321424e9a@kernel.org>
Content-Language: en-US
From: Enze Li <lienze@kylinos.cn>
In-Reply-To: <487f9b69-b314-4133-94f8-733321424e9a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 20:01, David Hildenbrand (Arm) wrote:
> On 10/1/26 13:39, Enze Li wrote:
>> The final #endif that closes the _LINUX_HUGETLB_CGROUP_H include guard
>> is left without a comment.  Add the macro name to the comment for
>> consistency and easier navigation.
>>
>> Signed-off-by: Enze Li <lienze@kylinos.cn>
>> ---
>>   include/linux/hugetlb_cgroup.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/hugetlb_cgroup.h b/include/linux/hugetlb_cgroup.h
>> index 16d72c8c71f6..b4e0958eabf3 100644
>> --- a/include/linux/hugetlb_cgroup.h
>> +++ b/include/linux/hugetlb_cgroup.h
>> @@ -268,4 +268,4 @@ static inline void hugetlb_cgroup_migrate(struct folio *old_folio,
>>   }
>>   
>>   #endif  /* CONFIG_CGROUP_HUGETLB */
>> -#endif
>> +#endif /* _LINUX_HUGETLB_CGROUP_H */
>>
>> base-commit: 21c3620df8ad362e9f2069ac35577c2a2f782f33
> 
> Note that this was not sent to the MM mailing list and/or hugetlb maintainers.
> 
> Likely scripts/get_maintainers.pl will help you figure out whom to CC exactly.
> 

Thank you, David :)  I'll resend this patch to the correct mailing list.

Thanks,
Enze
