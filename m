Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409625;
	b=Mn9BLGMwO6usZe/Lpza5nW23FMnJXv3R35LdicrUHI77FTOH5mtWRzwp+09SiS0OPWht
	 BtzoTVVFptN3ypIPT9GIii+uyD+8jdgUwssBaLh7nFxT8tdAXJ2jMZUG92RK82HPpG/1P
	 cP7fUmQg/Xn0x/eg7mGRTJYQDSRWIHshldcggsRCcIrlC9dbVigK3jqEoLF3a6zfeP2j+
	 oIEdDoEOb0IA9S0T1GGWq4eO5O0j+3XtJdddxAKec5UM56r+sSUOzR7sIXGEA37qyO2wY
	 dSuh1snRt20U2c+9KXS0kIInmH61ekI1GGVPX3/POmb2rDQabe71J5aPxgdRNq2Mevg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409625;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=B4vmEo6JeWk7kI+Rbno6KTwqomkHC0TPZQ7Gp154qJo=;
	b=CFocNxgxQAZpxWJVvOeuU1tzE89Dzzc8RJ+mcC4KZRJG2z6qDEEtYr2Pti0M8SDvN2D2
	 H31XHfbxT5HOtP/JuDHWHqjaCkEUaQzZceWq8fQHFwFRvBuWKmi8ccTq5bfQFcK9lOuin
	 i4Gf59ds/vmc3/k66F2CazTEHjZjCJKytMBpJ+JZVq7U+bMmu+nA9Q0kWdfS3bWG+JCFz
	 mQ12N/wf8A1A/UfKIAU9CYX7FQa8xt0wW6aUiXCOkrLyoiZnUeg8jlFDTku6ZgEfDGm99
	 4nrpGF24DfSrmBkpffRnYnTx4CoCyMYeJIZEJWzZ/bZs/tgTbl5gRlPrV76ALQBnDAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RwZ9HSrB;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BEF606A895
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8BEF606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RwZ9HSrB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794409623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B4vmEo6JeWk7kI+Rbno6KTwqomkHC0TPZQ7Gp154qJo=;
	b=RwZ9HSrB15r6jDZWvdFaN+nxzFVEhnHeBrQ2O/Zeuh3RTualGtoA6Scz2s2eWrUyq5XFAg
	/oQmVm54qnkDth+WvZuICfKydZQ6iz6Lsbmr4feBC0ayfrUs8PXVwJC5B78JV4zDshKXq+
	xtLJZp7qvESkSDPTj4dXMvnCqPh9gKM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-370-AisQuOWnM4mok3IeGCsEUQ-1; Wed,
 11 Nov 2026 10:06:58 -0500
X-MC-Unique: AisQuOWnM4mok3IeGCsEUQ-1
X-Mimecast-MFC-AGG-ID: AisQuOWnM4mok3IeGCsEUQ_1794409616
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E603319540F2;
	Wed, 11 Nov 2026 15:06:55 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id CED3330000E8;
	Wed, 11 Nov 2026 15:06:51 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Wed, 11 Nov 2026 16:06:55 +0100 (CET)
Date: Wed, 11 Nov 2026 16:06:50 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2] uprobes: Use flexible array for xol_area bitmap
Message-ID: <avSEikCPEn_Q3KpI@redhat.com>
References: <20261111022605.66010-1-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111022605.66010-1-rosenp@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 11/10, Rosen Penev wrote:
>
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -108,7 +108,6 @@ static LIST_HEAD(delayed_uprobe_list);
>   */
>  struct xol_area {
>  	wait_queue_head_t		wq;		/* if all slots are busy */
> -	unsigned long			*bitmap;	/* 0 = free slot */
>  
>  	struct page			*page;
>  	/*
> @@ -117,6 +116,7 @@ struct xol_area {
>  	 * the vma go away, and we must handle that reasonably gracefully.
>  	 */
>  	unsigned long			vaddr;		/* Page(s) of instruction slots */
> +	unsigned long			bitmap[];	/* 0 = free slot */

I agree with Peter, you can just use
	
	unsigned long			bitmap[BITS_TO_LONGS(UINSNS_PER_PAGE)];

Oleg.

