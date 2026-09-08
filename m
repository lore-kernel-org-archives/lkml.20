Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21A03438BB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891647; cv=none; b=mdJKIykbMhrawNdBXdbLcDfo00ymVKBBrXsDgusiAqipwQl7prnITeZfFsxxPYiqMZePVCxLDIuymBiFAfs5gHlO4ozevaUeodYNtUeEfrBOTBZ7Yku4ktxP4e0lcSnDJ/i57AuLE+MvCWCLtDynBNkEN3/ZBXwNCQ5d7+Gt2k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891647; c=relaxed/simple;
	bh=9To4jbmxVaHU3YyuLHtldfm/+1dYUB3KmBeKEkAyIg0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=FJPCZWL67fxUnOTpt8xz1cYz6HSUKtZBGExCs8JBE65ztN3HH1Axo5cmWv8sUipGRVrq99IApKuMbDGIJDBrZ1QpssEZNDStO72MNo8HnxrINe25v1YJ3ISe6UWHBUzICDbj3b5mPY1hiXHouTcbO78vnZ9tz6922ME+0TCpZWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Ez23U2/Y; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Qja41vRs; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Ez23U2/Y";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Qja41vRs"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688HvN9j2283935
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 14:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=FiZb
	ubyoP3HtKI9tuT86fH46V4++xl/Hu2bmom4u9Fc=; b=Ez23U2/Y92kvNjZkkMvv
	Z0de8+cWkmWr0Ru6KQ/R90lpdG3zB1/Vq9ydz5ed/hXdK8TuO/qX0RQWhwriO2ts
	kEFE5uhYhgu4dP5YvFYgK0ce5Fqn3STMa9VW4tkrxu92pr1xNMFBItCleGsIg76E
	MKbqMEc3YS1aqsvMjqDPTe/KY4geTohctvlhV9EalJgYohlfrhhdaqf3+P+3aP9d
	AijG4i6Om5AgOaJeGclSB5CIUSSh8y4dXeZxCgMjW+UvVnOGVifTEEfdAaJhBK6D
	M0UEkg+eM4j6yIZX4LOVV+oRkz47aTFSYh9IcMLv/cMC1qVitVAfxsJPrBsqdlI4
	5w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gjjjduuep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:20:42 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91055aae7f4so41349856d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788891641; x=1789496441; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FiZbubyoP3HtKI9tuT86fH46V4++xl/Hu2bmom4u9Fc=;
        b=Qja41vRsLEmQxmpo31Q1uUF0Ts33uJdvifcn3A5xo85tW6i8/jjKJpWNSrICWKPcxi
         BTDJHKLpz7ukqQc4T4ZspoYxmWqthnyaNpCmSUBppPpcF7QBl6nZIsgF2m0vaa/syx72
         PaJcxbdKG7psE35qMvRk4L0NRyAL9P8pvN3NOILDC25i/El4lqzupgngGbFBcvL1duOd
         INpoYX00MBmTon/KWAXjPnrWvpl9SgA+x9GRVLeQTbfBcVWKd/TFXlbjjP4UJXvDtvUe
         usG7OTGEfTzc9WTulUrcopMbEq31IIDCwNLNx8tmDYOHLnVVWYxt76tE1XtJJN/Zt6D1
         OvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788891641; x=1789496441;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiZbubyoP3HtKI9tuT86fH46V4++xl/Hu2bmom4u9Fc=;
        b=q/MNk9fRo8mOB8d7D2QynxJtoE00h7PQbYm0dm+D6IvRw1M0PmPoQDgz557Ya7roag
         ImEZLQu3cKARTTfCrm67AATw8tLLM0pnmdB8vThVEc6IXopcqL9llTLLQsaPFM4VXmRy
         FWQx6CIGe5Q/K5MwWR5csOOlela+ZMZ38YmPEOvH8gnHAvqYVtdkSjKwkZhLGPN2sEcn
         T6dULsxPqSw0OFKr26hn2LawKMRfNo4OpMQpSKG8iln1K8IcKKWkFXsAeNYVOwp94XVO
         DbfhaRKK+AxlC54ddQLo/TFC/DMjppha5jt4SRrYW4YOtjFw/rXnfypt5RlLb48Mv3Kr
         DIZw==
X-Forwarded-Encrypted: i=1; AKwUvBwquYWpXIQjFT0zzOhZLHurD0YnNgnr9HDHOqC5bor9iDGDqovERE5rSmqUi0q6kK7cSLbNG34bXacKXo0=@vger.kernel.org
X-Gm-Message-State: AFuF++lwfsg6x0WoDJStTQR2Etq0GQiE4ug24vAWp+KNCs6xSg736yfU
	HX1MIloeSWeYupS/vAKTrOjfPVGMkPQ30m8a317yJCTipMUO0bJWyZmXyjERwnI8TbPJ/O1tT4m
	ystfedg6c1NVxlVimcrq/Jqx1ctxQWhVZfF8h7Fy6K70T1Eqr8kALL8U8y11hUQ==
X-Gm-Gg: AYBFou2Nf6Xj8Ul81vtyl9oViz6WvADv5kvSEgDJw8gbyej0wd4wx9fXNi1BEwmP5Hj
	sF/VbdsjBp5N1+Sb99PuxTabBjAgh9n+eadMUhgrg91fl6f9PaImZ2WIf9Tsvje0dgOjoWzuT7O
	hrQUC+nOG7Ubn2gsigKkC1u5HARC50JEfIDho3srNeXWvDnJZByij9jWQ2uRgaA45QyuFDSQqna
	vLaFo/JRs+eNOk7aFFv+xXR8xhB/iCdgkj4wt6SStjRUd9uSmX72KY+vSZD+/35U4cVCHk33xre
	Tme+QoEeBDtYC4OT8JblSXmc/jF4HLya7MF0MbqD2F0G30RHFyR1Y+o47VJDjcaXBAeeHW+RZ16
	Wdz610qUUB6KZNIP4CGu0rPv//7NVM2dfpY6+65mxqlQsaRMz
X-Received: by 2002:a05:6214:130f:b0:8ef:74ad:e62b with SMTP id 6a1803df08f44-91061f8ef49mr103025666d6.7.1788891641416;
        Tue, 08 Sep 2026 11:20:41 -0700 (PDT)
X-Received: by 2002:a05:6214:130f:b0:8ef:74ad:e62b with SMTP id 6a1803df08f44-91061f8ef49mr103024766d6.7.1788891640717;
        Tue, 08 Sep 2026 11:20:40 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104059559dsm123354136d6.1.2026.09.08.11.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:20:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 06/14] f2fs: stop using PG_private
From: Tal Zussman <tz2294@columbia.edu>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Kairui Song <kasong@tencent.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
        Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
In-Reply-To: <e5792e81-e8a5-42e1-aafe-58dc603f4968@kernel.org>
References: <20260907-remove-pg_private-v3-0-6ae22f9d9272@nvidia.com>
 <20260907-remove-pg_private-v3-6-6ae22f9d9272@nvidia.com>
 <e5792e81-e8a5-42e1-aafe-58dc603f4968@kernel.org>
Date: Tue, 08 Sep 2026 14:20:38 -0400
Message-Id: <178889163877.1334491.3646957026033534678.b4-reply@b4>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788891638; l=7108;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=9To4jbmxVaHU3YyuLHtldfm/+1dYUB3KmBeKEkAyIg0=;
 b=dhSBI6ucL59FpBAGiQbj7EbpiPEM0NTxKglQM2e+fxAAMJcz6JHiE6WPjaSAL4vYEtNdtKSfh
 Xc+ZbX2afaGBA+BJy+LCqsbdKeZjC+2iag0hd78rs0jseRBBFMBDBNT
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: sK5IFNizCHQ1VNSLEjG1wmCjRJuzVfGK
X-Authority-Analysis: v=2.4 cv=eszvCIpX c=1 sm=1 tr=0 ts=6aa051fa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=VwQbUJbxAAAA:8 a=FP58Ms26AAAA:8 a=Ikd4Dj_1AAAA:8 a=tbrFcHqVj0uyXfjc5ToA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: sK5IFNizCHQ1VNSLEjG1wmCjRJuzVfGK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE5OSBTYWx0ZWRfX61QgEgohqhnb
 VcnxNU/yPcYTlRbOmDiuKQXlJPQQNqhz4hrz1w+fEG5JB+j7MQJLRSAbNZkIMyfKjWUjd6nJHLh
 1Xxi43SBsOMxmclIq2K1Ev2NL+4vRIvf3Xd4FohT0NXjx6R2BGo4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE5OSBTYWx0ZWRfX5Umk+ZZigJQR
 4Drftda203IKwf60Ycc7gLxCNYBrflorVnK+9nkZZDNVQO8/4VYLMZz4NDFSxHhbMlDzRE1Pwid
 j3Lnaf+2m/aj2/nQUTXTaZegxUw9AUjTfpXcdqOoR2uwpwzfsfhmqoP52M9vz5RArL+8UTrarPK
 N9nMz63zj25yzaVkW6jojmnG5cw09oEdvY+/3wxg41HVijctQjCkljUHhFIOhTwcpa2KQqWeLTI
 MRRlNuVv3SXnzt/ezusM7hzMIOrjyIY4D1e4bHQrDd2W0pyMiRPIHBxF0nN99dTpF86LCjx6n99
 O9zXiQMgWnB6JceV/jQokKGafoKQsaQrO3ikgEO4zcOWjl31uFpx/DfoIy1v6EKBT3zEhV91vr5
 v9F+K34jz6VUVNbcAic3zmczHytE6h2lEnuA1oXeOaO0wIAsYtdJMw2sDu/5Z66j0NTu0qOVjAF
 LZv9Ddo1l46pLoX9ZRw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=10 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080199

On 2026-09-08 17:47 +0200, David Hildenbrand (Arm) wrote:
> On 9/8/26 04:56, Zi Yan wrote:
> > f2fs sets its PAGE_PRIVATE_* flags in page->private and checking
> > page->private != NULL is equivalent to checking PG_private. Change
> > PagePrivate() to page_private(). Meanwhile, in set_page_private_##name(),
> > page->private is first set to 0/NULL before an PAGE_PRIVATE_* flag is set,
> > but it can cause confusion when PG_private is removed and
> > page->private != NULL is used instead. Change it to initialize
> > page->private to PAGE_PRIVATE_NOT_POINTER instead and retain the original
> > semantics.
> > 
> > It prepares for a future commit that removes PG_private.
> > 
> > No functional change intended.
> > 
> > Assisted-by: Claude:claude-opus-4-8
> > Assisted-by: Codex:gpt-5
> > To: Jaegeuk Kim <jaegeuk@kernel.org>
> > To: Chao Yu <chao@kernel.org>
> > Cc: linux-f2fs-devel@lists.sourceforge.net
> > Cc: linux-kernel@vger.kernel.org
> > Acked-by: Usama Arif <usama.arif@linux.dev>
> > Acked-by: Chao Yu <chao@kernel.org>
> > Signed-off-by: Zi Yan <ziy@nvidia.com>
> > ---
> >  fs/f2fs/f2fs.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 9940a6cecf1a2..2f7ab5888b078 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -2691,7 +2691,7 @@ static inline bool folio_test_f2fs_##name(const struct folio *folio)	\
> >  }									\
> >  static inline bool page_private_##name(struct page *page) \
> >  { \
> > -	return PagePrivate(page) && \
> > +	return page_private(page) && \
> >  		test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
> >  		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
> >  }
> > @@ -2710,9 +2710,9 @@ static inline void folio_set_f2fs_##name(struct folio *folio)		\
> >  }									\
> >  static inline void set_page_private_##name(struct page *page) \
> >  { \
> > -	if (!PagePrivate(page)) \
> > -		attach_page_private(page, (void *)0); \
> > -	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
> > +	if (!page_private(page)) \
> > +		attach_page_private(page, \
> > +				(void *)BIT(PAGE_PRIVATE_NOT_POINTER)); \
> >  	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
> >  }
> 
> Very weird interface. Why do we even need the page-based interface still?
> 
> $ git grep -E "(set|clear)_page_private"
> compress.c:             clear_page_private_gcing(cc->rpages[i]);
> compress.c:                     set_page_private_gcing(cc->rpages[i]);
> compress.c:             clear_page_private_gcing(cic->rpages[i]);
> f2fs.h:static inline void set_page_private_##name(struct page *page) \
> f2fs.h:static inline void clear_page_private_##name(struct page *page) \
> 
> Seeing code like:
> 
> clear_page_private_gcing(cc->rpages[i]);
> if (folio_test_writeback(page_folio(cc->rpages[i])))
> 	end_page_writeback(cc->rpages[i]);
> 
> Makes me wonder whether we can just use the folio helper instead?
> 
> In f2fs_iget(), we enable large folios only when !f2fs_compressed_file(inode).
> 
> So naive me would assume that we can just get rid of the
> set_page_private_/clear_page_private_ stuff entirely.
>

I have a WIP series of ~30 patches converting much of the remaining page
users in f2fs (including the below) to folios. Still have to do some
testing and clean it up, but hoping to send it out in the next couple of
weeks (in the hopes of eliminating some more folio_compat.c functions by
next cycle...)

> IOW something like:
> 
> 
> From efcde918178604de11d16c6dc5485542ab4dcdaf Mon Sep 17 00:00:00 2001
> From: "David Hildenbrand (Arm)" <david@kernel.org>
> Date: Tue, 8 Sep 2026 17:46:06 +0200
> Subject: [PATCH] tmp
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  fs/f2fs/compress.c | 29 ++++++++++++++++++-----------
>  fs/f2fs/f2fs.h     | 13 -------------
>  2 files changed, 18 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index ce88092d9ce26..0e9cc0fa297a4 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1064,13 +1064,15 @@ static void cancel_cluster_writeback(struct compress_ctx *cc,
>  
>  	/* Cancel writeback and stay locked. */
>  	for (i = 0; i < cc->cluster_size; i++) {
> +		struct folio *folio = page_folio(cc->rpages[i]);
> +
>  		if (i < submitted) {
>  			inode_inc_dirty_pages(cc->inode);
> -			lock_page(cc->rpages[i]);
> +			folio_lock(folio);
>  		}
> -		clear_page_private_gcing(cc->rpages[i]);
> -		if (folio_test_writeback(page_folio(cc->rpages[i])))
> -			end_page_writeback(cc->rpages[i]);
> +		folio_clear_f2fs_gcing(folio);
> +		if (folio_test_writeback(folio))
> +			folio_end_writeback(folio);
>  	}
>  }
>  
> @@ -1078,11 +1080,15 @@ static void set_cluster_dirty(struct compress_ctx *cc)
>  {
>  	int i;
>  
> -	for (i = 0; i < cc->cluster_size; i++)
> -		if (cc->rpages[i]) {
> -			set_page_dirty(cc->rpages[i]);
> -			set_page_private_gcing(cc->rpages[i]);
> -		}
> +	for (i = 0; i < cc->cluster_size; i++) {
> +		struct folio *folio;
> +
> +		if (!cc->rpages[i])
> +			continue;
> +		folio = page_folio(cc->rpages[i]);
> +		folio_mark_dirty(folio);
> +		folio_set_f2fs_gcing(folio);
> +	}
>  }
>  
>  static int prepare_compress_overwrite(struct compress_ctx *cc,
> @@ -1477,8 +1483,9 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
>  
>  	for (i = 0; i < cic->nr_rpages; i++) {
>  		WARN_ON(!cic->rpages[i]);
> -		clear_page_private_gcing(cic->rpages[i]);
> -		end_page_writeback(cic->rpages[i]);
> +		folio = page_folio(cic->rpages[i]);
> +		folio_clear_f2fs_gcing(folio);
> +		folio_end_writeback(folio);
>  	}
>  
>  	page_array_free(sbi, cic->rpages, cic->nr_rpages);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9940a6cecf1a2..0cfba8742d4b4 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2707,13 +2707,6 @@ static inline void folio_set_f2fs_##name(struct folio *folio)		\
>  		v |= (unsigned long)folio->private;			\
>  		folio->private = (void *)v;				\
>  	}								\
> -}									\
> -static inline void set_page_private_##name(struct page *page) \
> -{ \
> -	if (!PagePrivate(page)) \
> -		attach_page_private(page, (void *)0); \
> -	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
> -	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>  }
>  
>  #define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
> @@ -2726,12 +2719,6 @@ static inline void folio_clear_f2fs_##name(struct folio *folio)		\
>  		folio_detach_private(folio);				\
>  	else								\
>  		folio->private = (void *)v;				\
> -}									\
> -static inline void clear_page_private_##name(struct page *page) \
> -{ \
> -	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
> -	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) \
> -		detach_page_private(page); \
>  }
>  
>  PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
> -- 
> 2.43.0
> 
> 
> -- 
> Cheers,
> 
> David
> 


