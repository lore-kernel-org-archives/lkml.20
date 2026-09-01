Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FA53644DB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273927; cv=none; b=NgilI2TW8pSLWxBUCFI1iJ3x9sPIp4ntv4wc2PdflbWhktqDI9pfMC82Yk5mIDZtxwCvD0T06wWr7qZnPMc/yAc196MaE+WoVw6D1jCEa+g+OOH41ZDdqsSep8Pfm/7UZ6g3yCrc6VAW8QPZhXnyKFzz731A2n1ZRxIx20ZiNOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273927; c=relaxed/simple;
	bh=Z5kCnWVQxChPWY9ig8PsVdrVWPerRP0KAqzKlz+ARu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncw+aBHkoxcuQHUmSB2A2DavbHORyr2TtH6zaRStTCe8So0S/uizvAjslwt0wTH0TEd5dlI5+yg1PHLCSwWNHUJ9kbyesnfpwlNxwcMLi/sG0Jy9Jj65Ztbcf2IpTi/1in+NxnoAheYnGVTIgUaBuhVlzDcp3U7Vko77bJQQVi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JwJXK0dz; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JwJXK0dz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zi1O63veibWmbpQLKyNgIo0W3ylRtY8+gyDmMJt2ycI=; b=JwJXK0dzcOpJ1IqGXLqFdbDbzU
	FRVvk7bxSI7Ah2AIvWIVHI0FQeDIxyvhBFuif1zx+VQHuFp16/DlXHo2RHfVYN/M33r1OaY28HQYH
	YEmCVsImkX6RXOkITQl8fKcn0KVKj2NbXGRVlElbHUk6yVzylPBm9E4ZnivF2JtkpQj+J452Cv+jj
	6TNPEDVjlRWVQp6qSifGX/eET4yxUOcrR2+LAnCpNUK9aqU+8CN7EmIK4ycWr0EgYRADIT2gT/y0n
	OUA/iRTiOTpYAV3M60vrTx48lxLP/Ewaqud6W0SZSM8J+MvPd0XpYr+s0Mu6bCY4WCOtXed0sCYQr
	ALxy9PNw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PjG-00000005Gto-2EOO;
	Tue, 01 Sep 2026 14:44:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 728C430031E; Tue, 01 Sep 2026 16:44:49 +0200 (CEST)
Date: Tue, 1 Sep 2026 16:44:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jianyong Wu <wujianyong@hygon.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, jianyong.wu@outlook.com, zhongyuan@hygon.cn,
	huangsj@hygon.cn, wangfengyu@hygon.cn, yingzhiwei@hygon.cn,
	justin.he@arm.com
Subject: Re: [RFC PATCH v2 20/23] sched/cache: Estimate utilization of the
 whole thread group
Message-ID: <20260901144449.GJ776954@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260828021156.785662-1-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828021156.785662-1-wujianyong@hygon.cn>

On Fri, Aug 28, 2026 at 10:11:56AM +0800, Jianyong Wu wrote:

> +					mm_util = mul_u64_u32_div(cpu_util,
> +							min_t(unsigned long, occ, NICE_0_LOAD),
> +							NICE_0_LOAD);

mul_u64_u32_shr(..., NICE_0_LOAD_SHIFT);

will probably generate better code -- I *think* the mul_u64_u32_div()
ends up being inline asm and as such cannot optimize the divide
properly.
