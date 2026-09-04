Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D353BBFD6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788558152; cv=none; b=INYaq7YNxpbcgHtts2aTyz1NLDAXprfEF5AuqvZ4gje/LITa8UR7QnzDLr//WHKWl+pyfZOrmk4Nt9185sgJypfWbVQjc8sfDRuPo0Oc230y48ogf7jbdY2IADRx/I92c0A3CTTL2nPzSZjaORsHzNjP3Uo1A5saMdIhGrwgj48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788558152; c=relaxed/simple;
	bh=IfTURNHlwjtaRepVD5dByQ+90DxxWiZBB2cnPzFTSSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ge3Wd7AQd32SGSZMCsU9w9tlVT09ahW+HBPxg8yEOMpZDbt0PhQxAwsCFTGUTZQrzmY6t+8+lTjUaNeKhl2nn5TrnGFBNOXx476NXze5IAOUH5DC0dNvwlt2SYHFFYVCC54G34v+z1PSNwz6b8JrI7AQ28tMynnAINnD9baQvEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=nvpYHaWp; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Gw54KY/A; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="nvpYHaWp";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Gw54KY/A"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684KZ0XR2829072
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 17:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=9sBs
	rXDWsA6mIM6eTb+x+9JskBQgNRQ7PhCpi14v3SQ=; b=nvpYHaWpJagUrv72UkPu
	pSyLtzsV1MZZi57QENoYRlenxKN2V2EsKHyhZ9o5kJZaa2q3s3LGsw6nDLsiobU5
	wEQFRPDAoD0D541yZ8U1Y+BjiW9KFG6uT79JPlnRHXhEi5zNEzNRiMP+EuEnqdfs
	OrHHhY/585JZoZ7zWL8I6RT5o1wOEPg5htyWEDiU4Qd9pEcl0Zp2xARNJ8J5/9WM
	w7S9cP3TRSGxIJSjWIwNi7TV88gioy34fkCUxBgxdbyML0goMreNY2ygjzWl83AT
	iXDilJMAvs8KbeChfGBTJaCPT1NK6iCXdUUkQ4xSk8w0kW6pSQl/iCr7gZDkNlkF
	GA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gfyvkudnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:42:29 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90c8da50f4fso20154326d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788558149; x=1789162949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sBsrXDWsA6mIM6eTb+x+9JskBQgNRQ7PhCpi14v3SQ=;
        b=Gw54KY/AnV2r4llM9V3R3TJU+jE9sXxmxJqiJsavw2NTUXzZNFXod2oQH+ZJhFNIA+
         SxRgdg0XV2/uLn7pPfF7JcOQhAzMm0ettazA9oPH60uabhpYhg6hhQOCpFDVL2mobI/U
         MwVe21M/X3WHcGlAxoGQlDX0X+I6GTyCl/3XtfrDxglnNI2LzG/2nB4A+Vd3vaG715R1
         uVAvoCKGEUTP8DdqEgymKAUHdARAHJmwIeWLZpTRQfwqVPc9pTPS1m2iQFCsR7ddZzzr
         JXWZ9vjYmmGkIgcx90Y7eZQKqnknk/D/lnDMIOoZ2Ey+3gh9dN4RepujLQCQNLz2cwV2
         x4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788558149; x=1789162949;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sBsrXDWsA6mIM6eTb+x+9JskBQgNRQ7PhCpi14v3SQ=;
        b=TqYdv3DRDGB2HoZlY7IXsOQSJp4IgtO68o4UPfw4FQ+t+7KWSp7vH5F9U7TMb70rkI
         mfj3l2AOW890y6AQiHf9nWUJoed7XqScRH6dFkU+uAsh3KBX+DCWlS5pTsyC05GMq4W6
         rB7BKWcz4ZOcBGcWTi5p7e5LOikVJtpuC3YwDNuMzeN5KsYc0HWgErycYlnUaHUXCfra
         IcThe6QMz8hB0hyL7rP/BziwdXkICtgjQsL7OaHN4ezGom+gFsKjLUWjYRL4iky93LF6
         4h2I80pDJkrFwEoJ7L1Pin8axr57vQ442PBOJXSx/XfpjQoKlVGHcami8rSxa8ksuelM
         jN7A==
X-Forwarded-Encrypted: i=1; AKwUvBxOd46Z49U2V+mAORmaOhed1Ulca/HK36HzoapOJOTfx5oleonZzPbqTi6UVni4WDKzkFWKsjAaDNgFIko=@vger.kernel.org
X-Gm-Message-State: AFuF++kISQ88JFb4Bdlqy4Af2hUua+7wSMtV/2DVpA2aM9T6v7ny/LAa
	0jYCa7pVREEEaMMkEZHQ+BGCPVAy/nsCnjZ0sRX3O14cc62yfcBzuaaGjn2YVP9hY2aMFWju1Kl
	nhF7uKoCAkRFDgHjCJcLJHltm7AcAU0s2xSa0oWomTr4J/y3IHUlWi7bG8Ts/Tg==
X-Gm-Gg: AYBFou1d2IFXPuYAPmE+5759U12Zs1KM+yZAfJtTrO2u4NknTV/SH0bjuwey85uaY0m
	iDxZoQjra7860jwIp7yCE5x3lpqQb3NmteMg3dh6F5H7st6O9ncZyoL1DLsBdEtPZnIbX44sWDF
	Bxq+9hxXyRWRzHlSTiroV91b9iwCsJkHqXxlY2SV6ToosGNT3iQl7Mv3U1p1mpQtVdbihrDk4QJ
	6c/OhfkViICH3iWVN9E8oIZQ065g2YXKenNUc0imTNU08f/J97JGcJmHz63voHuQks7fhapGUIH
	sjvBIYmVQoSTFj+VS30ajxsrYghIu5dsIG+OgRWNqFbmaLUpw48x7d08BRv6WQWITFECjI8tb+7
	P5grfohOXUa2FV6YxPy/t3g+/fiipJc+a2sFOMnQ1XZFVSZKbZAXy
X-Received: by 2002:a05:6214:f25:b0:910:44f2:5ce3 with SMTP id 6a1803df08f44-91044f25d21mr48209856d6.8.1788558147676;
        Fri, 04 Sep 2026 14:42:27 -0700 (PDT)
X-Received: by 2002:a05:6214:f25:b0:910:44f2:5ce3 with SMTP id 6a1803df08f44-91044f25d21mr48209456d6.8.1788558147144;
        Fri, 04 Sep 2026 14:42:27 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-177-158.net.columbia.edu. [128.59.177.158])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91043b54cd6sm18880636d6.34.2026.09.04.14.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 14:42:26 -0700 (PDT)
Message-ID: <7f70b59e-b1b5-452a-8a2b-d51392737a53@columbia.edu>
Date: Fri, 4 Sep 2026 17:42:25 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] mm: memcontrol: constify the memcg and lruvec stat
 readers
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260902-folio_memcg-const-v1-0-e2c1da22246d@columbia.edu>
 <20260902-folio_memcg-const-v1-8-e2c1da22246d@columbia.edu>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260902-folio_memcg-const-v1-8-e2c1da22246d@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDIwMSBTYWx0ZWRfX8pkkpQDnzhHb
 jFz/CLTy3oAbhLzovpjsVZbCyjocFAznAjBfzC02vSHEycCaw4/kSLQYsRZmMN7OvGp3oalorTv
 aTSzBxAaFkyM/XdG0Bq3DdCTHWkEGcX3BWGox8F+d6oBwWwysaDbB9ZnEdhDs2BgcBkvUsu1K4T
 uu/07vWzMoZY5X5Czsg4IAkpeLj4iPvhoH59vOlvi3u83uTVJaf9qs9pLyhz5rGxP4KhGKJ5nE9
 JxHPnhM/bXkDpJokzmccUz16vcsfL/S3mZ9kdG2rrAOS8iMoJyKYQ6LSb+x0uwVaqIRsQmpj3St
 Ej5QYkMAh1DKIw9uHvrKDATEgN0eMgqjwT4JzANg+0IwIUFviByu3kyhJDSD/xmLzds612/5Nha
 /b+AcczbMiwieHv7RorQYCahZ7IBivy7ETrUeI7vJdvAkLNXfmFue9cu0Q3NSbAFBmv10gfTNGz
 Q4Ut2ALHX0JPTQmH0MA==
X-Proofpoint-GUID: 40eCgbECb3N_imnajeDI2NoBIMTxQee9
X-Authority-Analysis: v=2.4 cv=T868ifKQ c=1 sm=1 tr=0 ts=6a9b3b46 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=tLges04aSNaZGVAfhBIy2A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=H57HtBtNAyM616LuGCcA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDIwMSBTYWx0ZWRfX6sGFv6jvloGN
 mJJgVcF/Pr2q2HvaDTIyADkp9bEKIQMq1qtOMcR6Y02ieyRP5YishN+tvsEeSB90at4/QVwiRY6
 koV+l9kI44P4CSBuXGr1YMyb0L4nBp4p5E5CWQChpHcbnJfHZ/FH
X-Proofpoint-ORIG-GUID: 40eCgbECb3N_imnajeDI2NoBIMTxQee9
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11896
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 adultscore=0 lowpriorityscore=10 suspectscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=10 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040201

Responses to Sashiko below.

On 9/2/26 10:27 PM, Tal Zussman wrote:
> memcg_page_state(), memcg_events(), and the lruvec_page_state() family
> only read counters. Constify them.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  include/linux/memcontrol.h | 23 ++++++++++++-----------
>  mm/memcontrol.c            | 12 ++++++------
>  2 files changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index bd82628d0d72e..10a197886f316 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
[ ... ]
> @@ -1392,19 +1393,19 @@ static inline bool memcg_vm_event_item_valid(enum vm_event_item idx)
>  	return false;
>  }
>  
> -static inline unsigned long lruvec_page_state(struct lruvec *lruvec,
> +static inline unsigned long lruvec_page_state(const struct lruvec *lruvec,
>  					      enum node_stat_item idx)
>  {
>  	return node_page_state(lruvec_pgdat(lruvec), idx);
>  }

[Severity: Low]
Does passing the newly constified lruvec pointer to lruvec_pgdat() discard
the const qualifier?

Looking at lruvec_pgdat() in include/linux/mmzone.h, it does this:

	return container_of(lruvec, struct pglist_data, __lruvec);

This returns a mutable container from a const pointer, circumventing the
internal const-correctness the patch intends to provide. Should
container_of_const() be used here instead?

Answer:

lruvec_pgdat() purposefully returns a non-const pgdat, as some callers
still need one at the moment (node_page_state()).

> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 35f924c9f2a31..3d3eadddc1307 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -489,7 +489,7 @@ struct lruvec_stats {
>  	long state_pending[NR_MEMCG_NODE_STAT_ITEMS];
>  };
>  
> -unsigned long lruvec_page_state(struct lruvec *lruvec, enum node_stat_item idx)
> +unsigned long lruvec_page_state(const struct lruvec *lruvec, enum node_stat_item idx)
>  {
>  	struct mem_cgroup_per_node *pn;
>  	long x;

[Severity: Low]
Does the use of container_of() later in this function silently cast away the
const qualifier added to the lruvec parameter?

In lruvec_page_state():

	pn = container_of(lruvec, struct mem_cgroup_per_node, lruvec);

This macro expansion discards the const qualifier, undermining the compiler's
ability to enforce const-correctness. Could container_of_const() be used here
instead, with pn declared as a const struct mem_cgroup_per_node *?

Answer:

Yes, this can use container_of_const(). Will change.

[ ... ]
> @@ -530,7 +530,7 @@ unsigned long lruvec_page_state(struct lruvec *lruvec, enum node_stat_item idx)
>   * monotonically-incremented event counters are stored in
>   * enum node_stat_item.
>   */
> -unsigned long lruvec_page_state_monotonic(struct lruvec *lruvec,
> +unsigned long lruvec_page_state_monotonic(const struct lruvec *lruvec,
>  					  enum node_stat_item idx)
>  {
>  	struct mem_cgroup_per_node *pn;

[Severity: Low]
Does this function also silently lose the const qualifier through
container_of(), similar to lruvec_page_state()?

In lruvec_page_state_monotonic():

	pn = container_of(lruvec, struct mem_cgroup_per_node, lruvec);

Would it be better to use container_of_const() and a const pointer for pn
to preserve the safety guarantees of this patch?

Answer:

Yes, this can use container_of_const(). Will change.

> @@ -547,7 +547,7 @@ unsigned long lruvec_page_state_monotonic(struct lruvec *lruvec,
>  	return (unsigned long)READ_ONCE(pn->lruvec_stats->state[i]);
>  }
>  
> -unsigned long lruvec_page_state_local(struct lruvec *lruvec,
> +unsigned long lruvec_page_state_local(const struct lruvec *lruvec,
>  				      enum node_stat_item idx)
>  {
>  	struct mem_cgroup_per_node *pn;

[Severity: Low]
Like the other functions above, does container_of() discard the const
qualifier here?

In lruvec_page_state_local():

	pn = container_of(lruvec, struct mem_cgroup_per_node, lruvec);

Could this be updated to use container_of_const() as well to maintain strict
const-correctness?

Answer:

Yes, this can use container_of_const(). Will change.
