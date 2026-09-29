Received: from bumble.birch.relay.mailchannels.net (bumble.birch.relay.mailchannels.net [23.83.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B179135C6AF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.209.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790719699; cv=none; b=qWqIATe+jskqdYxiqJNYDSvN38DGsEc9KatUfszmMluvXJj8TMKvRvwVTDvZSdbs7aAs3OyJ2VOoFpQjDkeijFf8bqUX1ErK9kf6uKsxhS/uobUf62JMfr9n9t/DS0LtKJtQzmc68ZUbvGuzV7pSgbOUjxwGIdZGsa3R6bjnSms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790719699; c=relaxed/simple;
	bh=i/MjidhiyZvlwnI8HPoAfUzgBLm2B3srI3Zh+AVUip4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpmkxossjrDOmfFE6S/n0IeSccZ5bmfeINYsod2lSoCRzpR/PcAt0+YVNWDRdHPJPA/TYhhjw3nmjQegUycBLWftocVeR3HQZ7xrPBFYsgZFDdzcvEUdFWknSCY8QloUESKY1bBpxZnFZt+4GSFV98CgEsdIIpiOuaBpDQ/AIyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=HWOBl2RC; arc=none smtp.client-ip=23.83.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="HWOBl2RC"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 84D40801705;
	Tue, 29 Sep 2026 22:08:11 +0000 (UTC)
Received: from pdx1-sub0-mail-a214.dreamhost.com (trex-green-6.trex.outbound.svc.cluster.local [100.96.21.128])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 037848009DE;
	Tue, 29 Sep 2026 22:08:07 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Broad-Company: 37df9ba5613faa8a_1790719691378_1081366681
X-MC-Loop-Signature: 1790719691378:1820811857
X-MC-Ingress-Time: 1790719691378
Received: from pdx1-sub0-mail-a214.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.21.128 (trex/8.0.2);
	Tue, 29 Sep 2026 22:08:11 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a214.dreamhost.com (Postfix) with ESMTPSA id 4hvXP11m3gz4D;
	Tue, 29 Sep 2026 15:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1790719686;
	bh=i/MjidhiyZvlwnI8HPoAfUzgBLm2B3srI3Zh+AVUip4=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=HWOBl2RC1sncyg+qW4OI0NL5BUYwZNX3YyPzt86HpjNrbY3ab4XpchI2ADRBJK2he
	 3TC8Hqtei1jo31E3ZN3/gjb3OWLGb7tHSIBPvmVTjiqLZddMLPZlHuMxq8IVHzlREY
	 1vRrE5/YQUQlJq3ICRXCoCPBsj85VN/Q2neTO28aotqD7HS68jTarfdfIbxB0+Q3Se
	 +figL3yCghu0/dt++5c41MkAYj/ZCXquKMcUwhreo+Ll3Z1UWEXzR31bYRi77Ko6Js
	 KI5+Js380yfPKq8rQCbzLR+KoYoLLgwqrAOgvia94gfDbRS6PG9eHjPPLsh9phFHQ4
	 tH/BM38SZuGNw==
Date: Tue, 29 Sep 2026 15:08:00 -0700
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
Subject: Re: [PATCH v8 2/8] mm: migrate: Add promote_misplaced_memcg_folios()
Message-ID: <20260929220800.ekoqcpxkyfgbe3s4@offworld>
References: <20260728054356.291998-1-bharata@amd.com>
 <20260728054356.291998-3-bharata@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260728054356.291998-3-bharata@amd.com>
User-Agent: NeoMutt/20220429

On Tue, 28 Jul 2026, Bharata B Rao wrote:

>From: Gregory Price <gourry@gourry.net>
>
>Tiered memory systems often require migrating multiple folios at once.
>Currently, migrate_misplaced_folio() handles only one folio per call,
>which is inefficient for batch operations. This patch introduces
>promote_misplaced_memcg_folios(), a batch variant that leverages
>migrate_pages() internally for improved performance.
>
>The caller must isolate folios beforehand using
>migrate_misplaced_folio_prepare(). Additionally all the folios in the
>isolated list must belong to the same memcg. On return, the folio list
>will be empty regardless of success or failure.
>
>This function will be used by pghot kmigrated thread.
>
>Signed-off-by: Gregory Price <gourry@gourry.net>
>[Rewrote commit description, memcg awareness]
>Signed-off-by: Bharata B Rao <bharata@amd.com>

Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
