Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B388041E6C0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578408; cv=none; b=etTozlyRqw4soiL8Jw2YhQa7Y39wUGWoD5LsQvjnazZveXrmYuT64tG99p9KPrClQ4D9BVtl63SipmNBXCTGDP0YhkV2UZudhoVWeaMiWpQlcSbBYYUhy1BoXGweD6kaw2mgZMRw1RHbfKBCmHv4rxJzhkudmeQ2ToybpPdLmDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578408; c=relaxed/simple;
	bh=/wtgYPMXZXp6zUY4OHNPQsnexKANsg38h6IetxV4HVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6j23wzHMerwOG53wDcuVbauglljMBRWB0BS314utRxzgUBRQwlzYgf/gt1U5udIUBgs05PCrHJKZWQSfvcKCPd68DD5qLYzyC4h24BdFucrY2tPNt+Gdgf6rzadzfPzvKNvwZWRy0RX9CsSMz8vlKFnxND2ytdoWBA9hc9UugY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgcmS4l/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgcmS4l/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453CC1F000FF;
	Fri,  9 Oct 2026 20:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791578407;
	bh=/wtgYPMXZXp6zUY4OHNPQsnexKANsg38h6IetxV4HVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dgcmS4l/QB2CnJfDYDb17vKsMvHwe53V+g4Ny5HGZLcV5gOUveA1mlME5m2xvJll0
	 qlUS4Ga5e759qUed1A4v2aR0S040B5PrEEqq3TelDuazgMw35RQPpICF+RqgZRjh2Z
	 ln7mczbcOy+zB98SiBFCN1gRr7qUvvBpH6YAz+xVXjNMUdXRX0HsAuzn2l9+wnAiMA
	 /DpP3vUwTSBelISkmNevY4ChfGIF1LmPKX+R7lMKcfwXQkh1fvGMISs17uVB8y9dz/
	 NTPjG32jgpViqdMZ+BFrxJKXy+inzS9lARKZ/Q+FEbeNymNsYXSG9DAQNLYkt5vu3e
	 25Tn0gCA06Xsw==
Date: Fri, 9 Oct 2026 21:40:00 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Ehab Ababneh <ehab.ababneh@intel.com>
Cc: ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	buddy.lumpkin@oracle.com, akpm@linux-foundation.org, kasong@tencent.com, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, baoquan.he@linux.dev, 
	baolin.wang@linux.alibaba.com
Subject: Re: [RFC PATCH v2 0/5] mm/vmscan: adaptive multi-threaded kswapd for
 NUMA-aware reclaim
Message-ID: <aslREDvk7gsfkHDl@gremlin>
References: <SJ1PR11MB6105E073723CFEEE8C8EDBF48C832@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <cover.1791577417.git.ehab.ababneh@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1791577417.git.ehab.ababneh@intel.com>

Hi,

Please always send new revisions of series individually, not in-reply-to
any other email.

The easiest way of accomplishing this is to use b4 [0] (the recommended
way of sending patches to mm), otherwise format patches like this:

For a patch series, e.g. at v2:

$ git format-patch -v2 --cover-letter --thread ...

For an individual patch, e.g. at v2:

$ git format-patch -v2 HEAD~1

[0]: https://b4.docs.kernel.org/en/latest/contributor/send.html

--
Cheers, Lorenzo
