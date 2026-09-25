Received: from cornsilk.maple.relay.mailchannels.net (cornsilk.maple.relay.mailchannels.net [23.83.214.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9124A1E03
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.214.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353865; cv=none; b=h8nUGTdYa7fcAMIIomWgMPvWOB8ZUcwk+sc9kH4PtrMB+t/qgurVx1zPvLS5Ti0eYG0s3yvlicy/HbJM7WZtRpIympRUwlNmOBNsk4AYZB0GJxcIp4xsJA9wTzuoUkFIHDVcmMZOTpWYGuYTA1bXt3pSy6ckhPE8865hCFCblt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353865; c=relaxed/simple;
	bh=UiaWcxFWfp8AUhtjj2p8ov/Ci4x9w9RL92Dv3beUrso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BessHYw/GTFcgDInL863/ggnhmlLXM6+ZLgouw49wbHC6z4GlvRKfLBNU4vuiPRb6GbzE27MfQ99hggHNJBIareobgBTN/qcSd7AUQJxf1Z+L9cKgxQMAXLjmwF5VlAh0pivP4kFYmtHKQVYEMU9FFZMyE9igkXtXK2AfCz5F7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=N8pcz9sB; arc=none smtp.client-ip=23.83.214.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="N8pcz9sB"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7FF474614AE;
	Fri, 25 Sep 2026 16:30:56 +0000 (UTC)
Received: from pdx1-sub0-mail-a203.dreamhost.com (trex-green-2.trex.outbound.svc.cluster.local [100.96.17.233])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 14F84463C29;
	Fri, 25 Sep 2026 16:30:56 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Bored-Vacuous: 259512dc6e1f7a89_1790353856352_2394590540
X-MC-Loop-Signature: 1790353856351:934502152
X-MC-Ingress-Time: 1790353856351
Received: from pdx1-sub0-mail-a203.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.17.233 (trex/8.0.2);
	Fri, 25 Sep 2026 16:30:56 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a203.dreamhost.com (Postfix) with ESMTPSA id 4hrx5p3ynfzRx;
	Fri, 25 Sep 2026 09:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1790353855;
	bh=yKeAs2zV3r/lq+fhQtjl3K+UFdMpT18rtwW4BFj6Syc=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=N8pcz9sBaMDUFey2o3wPXCO2GNjaxU1g4fV1LDSYsVlYlejOhTE7y2S5X1K/x2Jk3
	 QLsCKYgf3V9QMwe/ghjlrbAGGlXexwJd4/ADgRFCoWklxv+KWIYmPaTkQBFZVPvf+t
	 tpU4E4FaaKmlbkuXvJF/qaQW2bxlqOnINXTrRu9Nm/eOnVRrbKrG54bYTONrUEKgTA
	 YKgDYrQPYnWPRdcNsxg2iKQA+1D/Hem818eHc0NLCpTKrh44Vf9buGE1oA5vpodQ8o
	 ajcQVZNbRk5dGt7U6SwR/an/s+fbeN3egGdjv1znTuzCjxWV44vYE/gAJv3Xxwk+72
	 6ZRpmMJcZYtNw==
Date: Fri, 25 Sep 2026 09:30:51 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: SJ Park <sj@kernel.org>
Cc: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, jic23@kernel.org, dave.hansen@intel.com,
	gourry@gourry.net, mgorman@techsingularity.net, mingo@redhat.com,
	peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
	rientjes@google.com, weixugc@google.com, willy@infradead.org,
	ying.huang@linux.alibaba.com, ziy@nvidia.com, nifan.cxl@gmail.com,
	xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org, david@kernel.org, byungchul@sk.com,
	kinseyho@google.com, joshua.hahnjy@gmail.com, yuanchu@google.com,
	balbirs@nvidia.com, alok.rathore@samsung.com, shivankg@amd.com,
	donettom@linux.ibm.com
Subject: Re: [PATCH v8 0/8] mm: Hot page tracking and promotion infrastructure
Message-ID: <20260925163051.vuh5y33xemwqgohc@offworld>
Mail-Followup-To: SJ Park <sj@kernel.org>, Bharata B Rao <bharata@amd.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, jic23@kernel.org,
	dave.hansen@intel.com, gourry@gourry.net,
	mgorman@techsingularity.net, mingo@redhat.com, peterz@infradead.org,
	raghavendra.kt@amd.com, riel@surriel.com, rientjes@google.com,
	weixugc@google.com, willy@infradead.org,
	ying.huang@linux.alibaba.com, ziy@nvidia.com, nifan.cxl@gmail.com,
	xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org, david@kernel.org, byungchul@sk.com,
	kinseyho@google.com, joshua.hahnjy@gmail.com, yuanchu@google.com,
	balbirs@nvidia.com, alok.rathore@samsung.com, shivankg@amd.com,
	donettom@linux.ibm.com
References: <20260925021226.52kpnmvfylw73dz4@offworld>
 <20260925095039.48831-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260925095039.48831-1-sj@kernel.org>
User-Agent: NeoMutt/20220429

On Fri, 25 Sep 2026, SJ Park wrote:

>Hello Davidlohr,
>
>On Thu, 24 Sep 2026 19:12:26 -0700 Davidlohr Bueso <dave@stgolabs.net> wrote:
>[...]
>> So perhaps any mm interface for this stuff should just not be designed
>> around sampling, and instead proper hardware sources?
>
>Makes sense to me.  I proposed [1] damos_add_folios() in LSFMMBPF'25 for a
>reason that is similar to your points in my humble view.  To quote from the
>slide [2],
>
>    +/**
>    + * damos_add_folios - Add a list of folios as highest priority target for given
>    + *                    damos.
>    + * @scheme:    DAMOS scheme for the specific access-aware operation.
>    + * @folios:    List of folios to apply the access-aware operation.
>    + *
>    + * If a kernel component finds folios that eligible for a specific memory
>    + * management operation (e.g., CXL-promotion or demotion), execution of the
>    + * operation can be requested to be done by DAMOS using this function.  The
>    + * execution of the operation will be asynchronously done by DAMOS worker
>    + * thread.  DAMOS features for resource control (DAMOS quotas) will also be
>    + * applied.
>    + */
>    +void damos_add_folios(struct damos *scheme, struct list_head *folios)

Considering chmu alone would not justify a generic mm interface, I am more and more
inclined to go with the chmu <-> DAMON option (I recall your presentation) + do
NUMAB async (1 and 2) and that would solve most problems in a practical manner.

Thanks,
Davidlohr
