Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03E93C873B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788019799; cv=none; b=RyL868rDtHgPtGc1ZMJ9FjBkBViv6RmwElrQ8rURLeFn/3JMQWw1xR9+aKv5YP7X3kgsiRpBQdY+QnAIlPec3XRj6MaDaI7N7JwGU2Z2bnrMrrdCuDlGFBc3+W3uzAv7lfyy/jpDGDfxM0c6tGqIfjKLMvnUvjh12OiQCKg7n9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788019799; c=relaxed/simple;
	bh=iUjVyOe/jREG2GHYVoZLwE8SqUmLFyehS+XSyQKX4wE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fZ204WcJZg0Kgu75DKWNHTVNcS7YIpVaI9Zabgce+ZX1mD8/eIAw3P38n20PkrIMuCmdSrePXHpl4Ryja5i5xSMbM9+8Nxhaa6A265iaIGYZljDVLhtHA7EDYhh6pB2cELQFGScvXPzq68O65aw1KFGOma8Ubux1Ar49mdEnPs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=cCuEdNbs; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=OATNHY6g; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="cCuEdNbs";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="OATNHY6g"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TEfKP1743167
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=+l4c
	yquDZdPm1CRZEtsdD5WsyEM3FltNV4XbzdH7Ws0=; b=cCuEdNbsSPHxSxNaszD9
	0bwjJ0fU1sRllrQXjJOZdhZoZuCbl2ZmpowDV89UeZunY+TwnqRjnLn4NFaN70NU
	OErugq2WxJ4DlIbBPh74RuNVt4NM0z0vg3cnRGmNrf8ncWLeqVQ7Ml9Pik6Oxa18
	g7fSr/qowFZk+Lnu07M+U4Kk63HJOGB9JgLXGcJJuM4CVBnQGlPY/r01B8brU4Kk
	qq2uZzIUQeRvzdpkwQNw8o/0WhG7p3O7KCTXZXiOoFAYIlLqufkLL1CId2ZlUzzC
	oo838p6yO7ct4Q7epkB49MukSs3qsnS1jUQRtp6M8eJjpI7XVqiCjcRI3iSRPr9P
	dw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gbufx22n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:09:55 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so52930491cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788019794; x=1788624594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+l4cyquDZdPm1CRZEtsdD5WsyEM3FltNV4XbzdH7Ws0=;
        b=OATNHY6gju6XS13YHaLfIpPzox7LI4OxkOTeGrpk7RMixuYEaebAJ8vBrNXqYs6+um
         LnGgJURx6SJkuFgmnY+cJMq3Zyy2ba3GfWHXxJNr3S7LVvVMDgcngS3wRhnL4qeMDZ0R
         qghPJwfX2Wix3m7dYa0JlG7L+Rh5RtL/w3rrGjWlsq5rofYpSXGut8GVXiXhGZpjAtfy
         tek4U6rLImbIUuDM9uYAoXf4J7zeiAjLlj9+y1Vw0hu6LGxox8n/rfVEL4GfxT6sny4h
         tvxb7DSgJsLeFcRqYgcN3SS/uxBIgCGTgiTvY69QuHADD+015Zo7keM6WXkhtsVX2iIV
         SNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788019794; x=1788624594;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+l4cyquDZdPm1CRZEtsdD5WsyEM3FltNV4XbzdH7Ws0=;
        b=AoGrNzpcxgyaqhXzI27JLtNn0bbLZNdzcHztOOoPxk8SIAE9H3Xf6Bsm5PiqQn95TJ
         r6fkz8Gw1XRUN+ACCPVuo6CZgOmtacUVpUW2Qxv9Zvdxv4FkrJG4LFcnbRBJATnReDAZ
         LoPkLBrGDbYtZQRrOx3ucXRXeoZ8HMp/PND3KdF8/xtd7UFLNH8L6rOjVBwhZngHiCfK
         D8TdnWZBXGFonKmWgb6efqVAbHsMm50I9QvHI3xwz060tvl3sdrpI0MFBxLj8noIhj49
         d239KVnchEB3qexhAgFOzXGwvZdrDDrctDvciv34o7b5Wu7D2rnzsdroCvhOcdFyppCR
         Ib3g==
X-Forwarded-Encrypted: i=1; AHgh+Rqpj3qdU5XYxoHsk4N+3SeM/9IJq6jhu4hMF9gClwoXoL+zSxUxqAefTQht4qgcPJ25MI29o3R+T9V1cmE=@vger.kernel.org
X-Gm-Message-State: AFuF++mhppLumfJ16xDt4Mg8NHzgLAB/s9pxhM3ZjW3HojDFI0YnS7SW
	Y4BpJ8YXExrIVAl18edAEzuFwmt2Ru563qaYQ3yAn5KXA/1P5eOoyTp++l8avIanFBbxsiu0xc7
	T2/im2m3rnRTPbtOJPp7nZnhbB6OqDu1zoOkRYj/fL0zwj6hjjUUpw9aa0dnv6A==
X-Gm-Gg: AR+sD10oLcTmgWzYfnLAIiVRtpAoM09Tlr2W+D74V0sG8Y3EYbw9xy0ORy83n1hbkV3
	9VUcjFBGJN6016Xx9qVufLn80/7INHz8IwJhuvCA60LoetgcqBsDxWOsikaC+AlTQrpCsSRMMph
	0cnvf8PVsJT+B3EehEq18GrHo9SqK1q25k2zwjIOD/QyFhozOCSP+h+ZU9kfnimpw/QZZepEFHg
	pW8k3B/FQo+oMURMmvYS3Bq5N8igjHAGwofdCKWcEZ1VmILWE3qu4BjskXbW6X43HBS3stMIG0O
	+FX0UtXnz5PeLnvn/rktlltrF4y5IXemS7iN3pW+lZgfEmendSI3pjSi3ufnDnIfpC3Zs/jzlT/
	cJ79+JbjKGlzq+wtqitH97PSwpJE9XGsDDuPdHbUvHc4y+Tc=
X-Received: by 2002:ac8:7dcf:0:b0:52f:f5f4:e9b6 with SMTP id d75a77b69052e-52ff5f4ea4amr82043441cf.20.1788019794348;
        Sat, 29 Aug 2026 09:09:54 -0700 (PDT)
X-Received: by 2002:ac8:7dcf:0:b0:52f:f5f4:e9b6 with SMTP id d75a77b69052e-52ff5f4ea4amr82042871cf.20.1788019793958;
        Sat, 29 Aug 2026 09:09:53 -0700 (PDT)
Received: from [192.168.0.175] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm117685355e9.1.2026.08.29.09.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 09:09:53 -0700 (PDT)
Message-ID: <37fc5d8d-f226-4885-967c-3e873aaa662b@columbia.edu>
Date: Sat, 29 Aug 2026 19:09:51 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: filemap: retain mapped dropbehind folios
From: Tal Zussman <tz2294@columbia.edu>
To: Wenjie Qi <qwjhust@gmail.com>
Cc: willy@infradead.org, jack@suse.cz, akpm@linux-foundation.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, baohua@kernel.org, axboe@kernel.dk,
        trond.myklebust@hammerspace.com, qiwenjie@xiaomi.com
References: <20260820142956.1414337-1-qiwenjie@xiaomi.com>
 <3fa43eaca792bc0bbde4b82a6c1fcdd3f528b398.1787999152.git.qiwenjie@xiaomi.com>
 <178801880005.667254.16521776519325089161.b4-review@b4>
Content-Language: en-US
In-Reply-To: <178801880005.667254.16521776519325089161.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDEzOSBTYWx0ZWRfX6fUQPOMf4QU6
 BGpbreaoMXMX5eL/MF/Pqp+Hgy2n7NJW070uhQISIbF5w8mfMrUFFjbWWeu8BHGE3v92juBOL8K
 2ihn8NehmRmaeUUBxYM+AadAGMty4UJDvVtGQhJir3ykNeSYomp/
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDEzOSBTYWx0ZWRfX2ZGtFvgGcndn
 +RgCOYcxM+JghVHR9Y2lU54M0DST6ShC/ErmPxLI27S4hEotkULvoVY8jFAZPtNsId6rIqQE78G
 OftJ3LsF3dYPyg7dMqxa0ZCYIFZteKXk47CCeLghL6xRpmQoaPfbVWwqsv60aoB7TKt3wXh3g6E
 76d4jUWnwIIhDf80vD/za3QrLFBVpvqfSmW472VS/FkCAx4PxOjnfJWRc6d61uKcDQrrHHjGe0A
 PpVt7PICqKj25lhYROG1l6i6F9pnSeS/Y+yTUgt1SgoDOdqQmnPw7pkhLWEPtSs81eLAseEr2as
 w1plgDBJ+T+SMjyfIrzce3DT5iK46mWVlaLByIF+SwZGCjl4psgAKhhQbcz2iyTRZAAzak214DM
 mjrnjjNr/Cyfy2VrGwPJq16w6fD7W/PYe7z0tph1YR9CL8zhLhnRzHFElF0hi+x3llHUYmYVLkV
 QYzhKzhq07x/l1ywgbQ==
X-Proofpoint-ORIG-GUID: xcTa4c0zhvNgKra7kiWxMgIegfiHW_DS
X-Authority-Analysis: v=2.4 cv=BoitB4X5 c=1 sm=1 tr=0 ts=6a930453 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=pGLkceISAAAA:8 a=IeNN-m2dAAAA:8 a=B8_SjZw1YBUlbbQ4_qUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xcTa4c0zhvNgKra7kiWxMgIegfiHW_DS
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=10 lowpriorityscore=10 priorityscore=1501
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290139

On 8/29/26 6:53 PM, Tal Zussman wrote:
> On Sat, 29 Aug 2026 20:30:47 +0800, Wenjie Qi <qwjhust@gmail.com> wrote:
>> Fault-around can map ready dropbehind folios without going through the
>> normal page-cache lookup that clears dropbehind. A mapping represents a
>> competing cached user, so retain the folio instead of forcibly unmapping it
>> when writeback completes.
>>
>> Unmapped dropbehind folios continue through the existing invalidation path.
>>
>> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> 
> Overall looks good to me. It may be nice to add a sentence about the
> safety aspect of this in the commit message. Maybe something like:
> 
>   folio_unmap_invalidate() may sleep if the folio is mapped, so this
>   also ensures that folio_end_dropbehind() is safe to call from
>   non-preemptible task context.
> 
> Reviewed-by: Tal Zussman <tz2294@columbia.edu>
> 

And maybe:

Fixes: fb7d3bc41493 ("mm/filemap: drop streaming/uncached pages when writeback completes")
