Received: from caracal.birch.relay.mailchannels.net (caracal.birch.relay.mailchannels.net [23.83.209.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B803C378A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.209.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790551569; cv=none; b=fwiG1RtMIlIY+A5dMDDDfmiH6gcOVedJ1xD9/Dwa/xhYdlW80gtrLgiXpdEpKB2L+XStQmvaWr5ZqwqMma+Q4sHIGwvEHdYmiwsSnvHGgj8TVE0HPeQtK72EPxGw2Ugsp2Hc7ls5J73brqijE1KcEotXfRw8QfprmjM9FfHkLNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790551569; c=relaxed/simple;
	bh=2aSMKRCkja4n/VQgEqybQKvbi5xmjbGNpO1qSHqKYOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZVYbmWSMUy0VMJFVJVb/a91vL352iupbgAY1IVHEF7TrPO9V1IjZQjjSzvANMtpB9OVh82+VYu2iJd9zdQQA812Gk2eD6ohYTIwJVfE0pPFPsEV0Wr2wESCjex1A3N20rYVfik1OdXYQ2mB2gXVUG8ujPdGvEpQedWOBk18kXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=E+D62Z35; arc=none smtp.client-ip=23.83.209.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="E+D62Z35"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id BAD564E1538;
	Sun, 27 Sep 2026 23:26:01 +0000 (UTC)
Received: from pdx1-sub0-mail-a257.dreamhost.com (trex-green-8.trex.outbound.svc.cluster.local [100.96.22.229])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 70CF34E1345;
	Sun, 27 Sep 2026 23:25:59 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Bottle-Dime: 1c4e2ddf2127d7f1_1790551561597_4283029918
X-MC-Loop-Signature: 1790551561597:956768281
X-MC-Ingress-Time: 1790551561597
Received: from pdx1-sub0-mail-a257.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.22.229 (trex/8.0.2);
	Sun, 27 Sep 2026 23:26:01 +0000
Received: from offworld (unknown [172.58.116.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a257.dreamhost.com (Postfix) with ESMTPSA id 4htLCm1y6Zz103W;
	Sun, 27 Sep 2026 16:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1790551559;
	bh=2aSMKRCkja4n/VQgEqybQKvbi5xmjbGNpO1qSHqKYOE=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=E+D62Z35SRdU9cbMZcyXmBaunm2mvKP6J/oet/VsA6QZtvpQwYiEdMZMRoUyLl9Pz
	 uGITOgk2tDjNSsp9tdRkBGg4y2L7K+YFz1cXx3R0R9pMihP53UfFaKg3JZ9g/WjnXY
	 bcTgNtyFfYThp8vCi3wl7ZJVW/h4izJx6J0VkjOEFQz7dopOc4zhI+v6skKcKCaXDS
	 RyKMidAKbn/kGxoRSsNIEfysltrVy52mlJg/87pJOEKLXJbqVrGOiBRj0uIyPfsowV
	 MjgaZdMkHoRckeINWirahjclE9pC4kxzb+4eiVSZc0QEEgVNK4fFw9risHFiKtRpR7
	 77xkxd7s/yiyw==
Date: Sun, 27 Sep 2026 16:25:52 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Bharata B Rao <bharata@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
	gourry@gourry.net, mgorman@techsingularity.net, mingo@redhat.com,
	peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
	rientjes@google.com, sj@kernel.org, weixugc@google.com,
	willy@infradead.org, ying.huang@linux.alibaba.com, ziy@nvidia.com,
	nifan.cxl@gmail.com, xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org, david@kernel.org, byungchul@sk.com,
	kinseyho@google.com, joshua.hahnjy@gmail.com, yuanchu@google.com,
	balbirs@nvidia.com, alok.rathore@samsung.com, shivankg@amd.com,
	donettom@linux.ibm.com
Subject: Re: [PATCH v8 3/8] mm: Hot page tracking and promotion - pghot
Message-ID: <20260927232552.u6iypdeadjf4nyla@offworld>
References: <20260728054356.291998-1-bharata@amd.com>
 <20260728054356.291998-4-bharata@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260728054356.291998-4-bharata@amd.com>
User-Agent: NeoMutt/20220429

On Tue, 28 Jul 2026, Bharata B Rao wrote:

>+/**
>+ * pghot_record_access() - Record page accesses from lower tier memory
>+ * for the purpose of tracking page hotness and subsequent promotion.
>+ *
>+ * @pfn: PFN of the page
>+ * @nid: Unused
>+ * @src: The identifier of the sub-system that reports the access
>+ * @now: Access time in jiffies
>+ *
>+ * Updates the frequency and time of access and marks the page as
>+ * ready for migration if the frequency crosses a threshold. The pages
>+ * marked for migration are migrated by kmigrated kernel thread.
>+ *
>+ * Return: 0 on success and -EINVAL on failure to record the access.
>+ */
>+int pghot_record_access(unsigned long pfn, int nid, int src, unsigned long now)
>+{
[...]
>+}

This needs a EXPORT_SYMBOL_GPL(pghot_record_access) for any module based
sources.

Thanks,
Davidlohr
