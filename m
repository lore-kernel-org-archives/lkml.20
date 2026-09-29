Received: from bisque.elm.relay.mailchannels.net (bisque.elm.relay.mailchannels.net [23.83.212.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44394F30E5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.212.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790719597; cv=none; b=l8vAuPIY2TRHBI+mpF/G77c9hAYcfhjHn+Z7aAk/i5vtsV7SQP+XxjupQ8HQlgcUWx4R6jgfwIYQqj3/Uxqzn2KHz3II/dSIuX+02dgao2dXyPQ6pJPE3ZkQs83WTWHJAci/AgXrF8caqDkxy+g1JMslQ6k8P5KTgbAmfHzBCzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790719597; c=relaxed/simple;
	bh=rnXRN2btfBjXlj9+UP5d7AbbpYLkqFmJlBHFxGuZnF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLqoXksMXTW10AQAYfc4GmIkqgGq8eOr/WKEWeGMdPgVbLWbxPmazj082dBqEA7aM5+7VNh2P/QXmXDrROg0Jpeca3YuI8cGs9q/RrJ105dDDorUk3PM5J7JjUrE+GBr7WItnCL06VAXKGqz6x8MITo78/KEPiELrEUQun9g3hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=iw4O0UlV; arc=none smtp.client-ip=23.83.212.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="iw4O0UlV"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 35B04722F48;
	Tue, 29 Sep 2026 22:06:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a214.dreamhost.com (100-96-9-151.trex-nlb.outbound.svc.cluster.local [100.96.9.151])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6993C720333;
	Tue, 29 Sep 2026 22:06:24 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Tangy-Unite: 530991c145c229a7_1790719589024_875164832
X-MC-Loop-Signature: 1790719589024:2443551087
X-MC-Ingress-Time: 1790719589024
Received: from pdx1-sub0-mail-a214.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.9.151 (trex/8.0.2);
	Tue, 29 Sep 2026 22:06:29 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a214.dreamhost.com (Postfix) with ESMTPSA id 4hvXM24hD3z4D;
	Tue, 29 Sep 2026 15:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1790719584;
	bh=rnXRN2btfBjXlj9+UP5d7AbbpYLkqFmJlBHFxGuZnF4=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=iw4O0UlVuUCtg4I3HvnAX7SEl9beq1gzRb52FqW071b8inV64WZoIEJ19cd/REIb+
	 LK892wufLNL0knY0d1S+dBO+TNlEU2naQh7cfZpsuIuHaptH2/sn35Y3nvS7YkebE0
	 uF/0z0PfETllsjo7Y1GaiN42oNdDYM49+p5htjFxXyFhcHqgFQnyJ/SyFBGUEXQzyv
	 K0QbMPUlZn/EAK94NpBlitCNpXU9chOIR+XAjrYzkcrBKSy8+G4ZQtsVyGjjzh6yKl
	 RnXbvd7VHNOJvq+wiIBJ3QoSg3qs8twoJcA2PjJcgAlNRNwG6RQqvIIXAiYGZ3dDpG
	 DJpvI6Ac8OrEg==
Date: Tue, 29 Sep 2026 15:06:18 -0700
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
Subject: Re: [PATCH v8 1/8] mm: migrate: Allow misplaced migration without VMA
Message-ID: <20260929220618.6czpcioqwwg66m7c@offworld>
References: <20260728054356.291998-1-bharata@amd.com>
 <20260728054356.291998-2-bharata@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260728054356.291998-2-bharata@amd.com>
User-Agent: NeoMutt/20220429

On Tue, 28 Jul 2026, Bharata B Rao wrote:

>We want isolation of misplaced folios to work in contexts
>where VMA isn't available, typically when performing migrations
>from a kernel thread context. In order to prepare for that,
>allow migrate_misplaced_folio_prepare() to be called with
>a NULL VMA.
>
>When migrate_misplaced_folio_prepare() is called with non-NULL
>VMA, it will check if the folio is mapped shared and that requires
>holding PTL lock. This path isn't taken when the function is
>invoked with NULL VMA (migration outside of process context).
>Therefore, when VMA == NULL, migrate_misplaced_folio_prepare()
>does not require the caller to hold the PTL.
>
>Signed-off-by: Bharata B Rao <bharata@amd.com>

Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
