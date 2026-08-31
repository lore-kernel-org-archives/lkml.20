Received: from one.firstfloor.org (one.firstfloor.org [65.21.254.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE257371CF4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.254.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204935; cv=none; b=n9phet7op0jRU9Epp+ERy7TRxEf5Bt6ZkdMAkuFL8HdrPPW13gCDmZgalQCr9Jujt04qmY+S08swRI+HOXUPNkBNlky2FDkUe3GEyPwutoKSuB3rfxmvEzcjVKDPlj8vwZ8JicOK4tNHMkr9gtWHmSKNT4d8fTVLDOs/XPfZnUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204935; c=relaxed/simple;
	bh=fbQ+sLzbl7DOq8wHn4LVm6GA/66iK3V+I3RoWGMTJKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/KKs3Awl4Z4ASkVe27euhZoc93jK2gOYcLjRlYAGrinDvbJOBtZXizArHuaDH5yIwsas46NvIZWuDoYbL9g9vWXs3Y5r7MJ3KBw2hD0xm/Z6G/olJYa3sFH1l/Owzt3g/PsLmmyKUla1h+OYUGON+nexNISaVgoCSdG8uBbej0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firstfloor.org; spf=pass smtp.mailfrom=firstfloor.org; dkim=pass (1024-bit key) header.d=firstfloor.org header.i=@firstfloor.org header.b=jo8BJEkH; arc=none smtp.client-ip=65.21.254.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firstfloor.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firstfloor.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=firstfloor.org header.i=@firstfloor.org header.b="jo8BJEkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firstfloor.org;
	s=mail; t=1788204930;
	bh=fbQ+sLzbl7DOq8wHn4LVm6GA/66iK3V+I3RoWGMTJKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jo8BJEkHk2QBSsdYWRtzHYxDzsa0g3BvuCQEno7mmDGYUAYafq+jyRTHUH4lbMqCM
	 fUgt1vNegJDVYvZDqlFKFjSDaDUth4RG2AnGvxbtjIUntewpFrY1pbgvt4ljEtz/aZ
	 c7mF038QLb4q4+l2sXXxrPgAdPNMHGioVMA558us=
Received: by one.firstfloor.org (Postfix, from userid 503)
	id 623725F579; Mon, 31 Aug 2026 21:35:30 +0200 (CEST)
Date: Mon, 31 Aug 2026 12:35:30 -0700
From: Andi Kleen <andi@firstfloor.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andi Kleen <ak@kernel.org>, akpm@linux-foundation.org,
	liam@infradead.org, ljs@kernel.org, jannh@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RCU safety for vma maple tree walks
Message-ID: <apXXgimKxgJl57qo@firstfloor.org>
References: <20260831143511.1133029-1-ak@kernel.org>
 <apWUsc-a6k1YkuMv@pedro-suse>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apWUsc-a6k1YkuMv@pedro-suse>

> But none of this code uses RCU? I'm confused. 

There are two classes of callers: ones that change the maple tree while
walking and those that don't. The ones that change it use 
kfree_rcu (if that's what you meant with "use RCU") because they can free
nodes.

The patch changes both classes, but strictly only the ones actually
changing need the change. For the others the existing locking is
indeed sufficient.


> The maple tree state should not
> be keeping bad state. That is a bug.

It's more the iterators caching bad nodes, not the maple tree itself.

> 
> All of these functions take the mmap write lock. That should exclude
> against other concurrent changes. Using RCU here makes no logical sense.

There's no concurrent changes, it's all local splits.

> 
> Does the kernel say anything interesting when CONFIG_DEBUG_VM_MAPLE_TREE=y?

Was indeed missing. I'll try that.

-Andi

