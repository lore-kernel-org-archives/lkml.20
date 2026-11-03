Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735951;
	b=qcI1/TmDOayUVjomGVwo1rDadczqTAFkBmuP4w48m2N52GqYdc60dKbBQdkerYS6QPJ/
	 TPDqng6muF1AcBq5gCf//tT3rtT5KdEAq26ehYG54Dgbd4GBlu0A0Lst9EsdMAZbgNR9R
	 s0eaqFU6/Knd9uSl/A/ZjV8DPYdlHcwQSKnmZoqi9YDzT9dcN6ZQiwlflqElLo7SLihKR
	 Hv6CO+vjnQF8HiQKGKzhXEifcAQQfW9xyprJ7/SFImGnn4800yAHsTq57aAoKjjQ8DQGt
	 09gJXSyxkXaj6Fg8jwI+OgZXG1GKkCc/1tZdCdsG5KDgwzuaSh2/EfwBqkjwsBaOsEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xpOJgsJz0sB9K9v/xEpka5H4yAVwg4X0Reyl3yXA6Do=;
	b=xco8frW9zWEe5jwc62zHL76MMuwDrREeIpzakj+UEh3fzFOtFftBkPBEg+s0TrJYpk9d
	 qe0Gkz/nt5DjLgM+ThOUlmxEjgAoGtbQKFbKTbImcisas4HyFR6gHrdOXUH0iVtuwbXrw
	 TTuyHArQc05V3gIZcdzKHGcrK+YYRCB6Ig11yQNbg0BTiCA5vjsLRK58Ub1vFSYN6L0N7
	 3qCItIewX3aHb8tzOvNrlHv9iRo5i7jjFE/PYBATVcPBcXO551+2j3bWMtWsnCThU6yt7
	 f0S7bo1NluGpxas2uwgds4QrTCDU1h3cKXio6GUu3X3sMaUNsSpOJjl80Fnq2i5ozeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=FXwGhxDE;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=GaQODNnC;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B7606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 911B7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=FXwGhxDE;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=GaQODNnC
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HZ0IG1665729
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 14:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=xpOJ
	gsJz0sB9K9v/xEpka5H4yAVwg4X0Reyl3yXA6Do=; b=FXwGhxDEyiYhfsw+MEKc
	iO0eBRAzcshzu7iioSTg0l4c/nSPG+/zQx8xhKoqHzoxaS/xYHaWqQyNCBePASkp
	cJlVaVT7G9ZeiWlELtAN6O245MoqLDujnT4Jcz8wscpAP9RqI783TDLEhRf4Jyj4
	gbOQPQmMARPk7y6ytdo9OoIhnD0kTrjSAYs/uio5hAxfXmehy/LbjJFA1teyeQSw
	88mjVAEfgt/vw905KGKiSzeLnQYg3s0X9LpfJiYDGaSBtqzY/iHCcFMePyi3VEmk
	azNZEYGsHqT8NXwYiuZEHSrMwnTAczP3IO5Z9MY5nqKvsVVUBYfMfDhurMMbpK2B
	gA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hqbjwch4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:59:04 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so824485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793735944; x=1794340744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpOJgsJz0sB9K9v/xEpka5H4yAVwg4X0Reyl3yXA6Do=;
        b=GaQODNnCTY0xX476g3KSgDPSnWSn6yB06/CS7MdbnsVgaGgZ3uGMseiDqwU4nIWj+P
         LWEOGKTO6VVhHqmKRCtpf0EHh8DU0hqtxFC+ZOApIsAzwkSE3jkfllsPOL6BZ1sKfGRh
         x9vIYvM2MD/oS8Tc5IwdsGHExElcWBCPqeojOtrIBkk3YrPj6dH0wmbi1tsygjeI8Zep
         L3ooHLjUgTbzq7l7ALg7V/lv2LRbqRaUSUhM0v3zCQXCN0VYcuG3F6S5+WOQBqt0qe11
         NGtBkaFUmaZuwHjdV+uP849NMhabki+EzDsGoMJTqWyI1CHmcHcR+bHCcPcLEyKiMWfe
         ZJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735944; x=1794340744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpOJgsJz0sB9K9v/xEpka5H4yAVwg4X0Reyl3yXA6Do=;
        b=TBhbpp1UCzFGVNkQ9nBTDLSBakxEAXQJRB8pio4vKZcecNVa57CQVLVSwrPbS8tas/
         uBs+G9cZT7TzZQ7W7PAfK4hXAzuIHmtk5YUbc4xeV9MzJDGcSEtNSaLuDEimQCS8FhAW
         YtZzmvq61B/HKemqQDrJhHeM545TnPqv5icd8WcV6aMi+VGr2RqxllgRs61TKwHOlU6c
         +Ya7ODpte3I1as1TowyBE8vVYvkuHFmY04hDkh7N1j208qMtPMlTGFMQennLYN5z47N9
         AdegihoMU2sdj4fFevjV8bJIFkTi4LQVNzFOOG8zDzqWRPndBrsjp6EAc5T68FXvDZwS
         SnFg==
X-Forwarded-Encrypted: i=1; AKwUvByLCBBbDMuretsh7B/tMnkA9cbTbmt0PPCjYCcIEx1l0wMzKcqRX+Y0M2GS+UKmxD7pA2ljLpd/jV2KMrg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FMG0vQMfszVqoz7VfYTDDUt9yHZyrTsfomL2rY1cAG+PWIqnv
	5xLlhVLvLLFpC9VKKt4xORKfUbG99cf9gdIHxDjuiGctLHdbp7gjkS/WOIqiY6PvIRxcLPQ3LxM
	6dhz/duaUumTiiaRoWRHP2OePjdQwrjtvd+7KJBv02RMdjnob+QLAaPbUjdpTsQ==
X-Gm-Gg: AYBFou118jLjegIVFHmkm8jlkLRfNEK9OxqOl8k1NorXz55hgswGrfTdyrPvv55Oupy
	iMc/GPPU0mhJvspKgQutPgkDFxwxFMYYOHumaWbYyxtb3mbv3zqW/MTQtzEAhrEN05VRIDL7yHA
	GZy0+Gu/iCZG3e+cyWXvg6AqlBvUhEw4a0K5i2VT4SDzTAt8kjzb+BOJdW1r+aIw7VB1jFoajVV
	+66ndfoOWoAYxfM0c3NUjF607n3hP2NXVaVANIfUByjgf1EQi2u7eZGpNDSGWhKjOtvN1N9Jqd1
	ZAhka+23OQbgjVvL3QfTGGAzSLqatbTkoHtSDbjSSauuSaMuyMcWC0+SxrM3tIeWa3IK0GZKC2e
	MVRjMyAS67eJIDXQPbdrYtaG0IuxjvyWF4EopmfOPLUm71okk5L9tfxGDcIHQrhEzuu3h4IfWeo
	ZWo7Gj/e1HGdf0iznpkrEQNs6PDNCfB4jN+EY9tqCNcpAhZDwoppMqbrIeUW4jjXG26GFSKYH4t
	62LBZz/YQKEE64A+93VZplQzt0aOZU4buz0aFV+pF4jbZ4Ybo95+ihWutxx5qbI
X-Received: by 2002:a05:620a:2909:b0:93f:61a6:b89 with SMTP id af79cd13be357-94421588cd4mr2307140985a.7.1793735943857;
        Tue, 03 Nov 2026 11:59:03 -0800 (PST)
X-Received: by 2002:a05:620a:2909:b0:93f:61a6:b89 with SMTP id af79cd13be357-94421588cd4mr2307138385a.7.1793735943552;
        Tue, 03 Nov 2026 11:59:03 -0800 (PST)
Received: from [10.206.225.113] ([129.236.228.41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4799adcsm15298185a.13.2026.11.03.11.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 11:59:03 -0800 (PST)
Message-ID: <a002901b-715a-4adc-bdcb-7a6fcda67711@columbia.edu>
Date: Tue, 3 Nov 2026 14:59:02 -0500
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
Subject: Re: [PATCH] mm/memory_hotplug: don't offline a hwpoisoned page still
 in the page cache
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Oscar Salvador <osalvador@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>,
        Naoya Horiguchi <nao.horiguchi@gmail.com>,
        Vlastimil Babka <vbabka@kernel.org>, Gregory Price <gourry@gourry.net>,
        linux-mm@kvack.org, linux-cxl@vger.kernel.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu,
        stable@vger.kernel.org
References: <20261101-memhp-hwpoison-pagecache-v1-1-ed8785ca44eb@columbia.edu>
 <1b6a6d13-8a01-414b-9bbe-cd194af1f539@kernel.org>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <1b6a6d13-8a01-414b-9bbe-cd194af1f539@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3OSBTYWx0ZWRfXzB8jOW5S5AIc
 M4/N/P568sxrIvnLgo3aKJzMy3UxYN5auWrQDdPMTT035ue0oHIKx27Cvb2HhZGqvpFQFhoeL/+
 HvPJI4iDl6VgTgeGvGi4zq6HwbPVec4jM4PxDZMjIHh343lSHWw6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3OSBTYWx0ZWRfX98NEBn7u3bse
 /1Hul5bPdG8LMhwLrQAioeJnPZAETwy8HxxfqaMw4gljRyQLfJplS26mf5n17vYr7DaNuHPYkEV
 1i3a8NUEKh8xR5kGJtJrJt4qJr9xe4ZZmTHSmcJStJU4vZGY8NNOzlYtaJpRzFL9NnDUfXqpPrp
 PtTox7CeMaYs/v1EiIGQzGYB9Yy3ASc3ZCajUPrOLABujiXaF2PQ9stE1HvV9Arw2ugKgosD8b9
 xpR832C976L0ar5xkNfMdkmHJMKApZg6lcSb/oF2N0nKXSXRzs3IYfaVIkyOeNxRzQizp8S0Dmr
 WraNbAqjIHaxhiDa3FwUqjQlMiAt8PegVjGmDSIH5CMa1x1xMgzO+V1BynhJFPIoGnV/Thg+Ne9
 st9XhCLLBzvEVzG7+akSLgcUX283zeaTUCUH0qXmlp6T0Zd5NNvE68LgMNbfJJI2Aek8epcpe+H
 2rdWXDnu9WYW3rUElNQ==
X-Proofpoint-ORIG-GUID: hB4iHXz8UEKKr_iNftkNulxfLEvPmhjD
X-Proofpoint-GUID: hB4iHXz8UEKKr_iNftkNulxfLEvPmhjD
X-Authority-Analysis: v=2.4 cv=Y5ttIReN c=1 sm=1 tr=0 ts=6aea3d08 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=hEunIlkDQR9riCPXO4CBGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=qOjK20r3ws_Z4Kvo5k4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11955
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=10 suspectscore=0 lowpriorityscore=10 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030079

On 11/2/26 1:56 AM, David Hildenbrand (Arm) wrote:
> 
> What if we still have the page pinned somehow? (vmscplice etc).
> 
> Wouldn't it be better to make sure that poisoning code holds exactly one
> reference (whoever set hwpoison) and check here that the refcount is 1 ?
> 
> Pagecache references would turn it > 1.


Yes right, a pin isn't covered (neither before nor with this patch).

I don't think refcount == 1 can replace the mapping check though. In the
race from the changelog memory_failure() has set PG_hwpoison but is 
still waiting in get_hwpoison_page(), so it doesn't hold its reference 
yet, and a clean page-cache folio then has just the one reference from 
the page cache. memory_failure() also doesn't take a reference on the 
kernel pages it ignores, and a poisoned page that gets freed later sits 
at 0.

So I'd keep the mapping check and add "refcount <= 1" on top as a
follow-up, since that also needs do_migrate_range() to drop the 
reference it takes when it takes a poisoned folio off the LRU. Does that 
sound good?

I'll send a v2 soon with a small do_migrate_range() change from the 
bot's review.

Mani
