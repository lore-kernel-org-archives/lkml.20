Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93309466AE7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835641; cv=none; b=dTVDmHZRGKfSYbIqWCE9Va8XuBOb2KIHNOZEEJlLJd1W3zskuThkV5II0Nmk+d++8L+ib4FO2v5SF1xks2jlTESMcfGertGIT4cwvxLfwlTgSuDV4B6LH/XFD0oR7Fka2UM4rCxZ8ZL00KVTXd80F7jS8FgaCdYNukWDYp7YTT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835641; c=relaxed/simple;
	bh=JpxE64pCg/b6rQY2y/7+EWlonBQjtPfHvkUtfZRNnco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mpl4Qg8nLHrDR6GHU4VCQ7iPOnA60wYWTv5R7qn/WkgmPvd8vNwSjF23KltRN8WxuODz3yxZiweNMlSHzqwnALHqY6tG75lDmx0T4ST9AfLaGVFyVHppknp9NJw6K96JitXWbJfeJmqkO4NdlIlyG6IUlOm1QMqUCh8gJeq6J1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iV3Y2Zg9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iV3Y2Zg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9289B1F000E9;
	Thu, 27 Aug 2026 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835628;
	bh=JpxE64pCg/b6rQY2y/7+EWlonBQjtPfHvkUtfZRNnco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iV3Y2Zg9DowDcuXBVS9IXr61ZZtETF747M8Iqyi7kLjfsMvd0YY496Hqa+DSEXpEM
	 1j6Ccq0rLIi/GhogrtbzZYAtlqxuMfB/DYNimp2XpgChMj7UG9maDAQw1Uyvcn5zrp
	 Ie3H0qyA9HYnGBtomZfi4d0mVnsUhJNQNrRtgq25Gdm+N5IPlG3ESnTCqE/WtEaDjG
	 wWBnQbFbO6EP/Lbs/LbrUE4BsIf/DtJB0zXR2QYckh8vIRE7ze/MiPA5PWrQmks3bl
	 LhRdO5ry2lDRrik7rRGLXnO+xIACalVsqdRkw/Jm38zLrUGMZoIKXwSfksum+yUFWf
	 Czy+NLkj4j4SQ==
Date: Thu, 27 Aug 2026 14:00:23 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Message-ID: <apA0xfguYLQhv7R3@gremlin>
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
 <6293dc55-e69f-498c-8290-b85202db605e@kernel.org>
 <ao69UWWf0awFqIXD@gremlin>
 <DKYY5T6DL56L.312FCMNEL50R5@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKYY5T6DL56L.312FCMNEL50R5@nvidia.com>

On Wed, Aug 26, 2026 at 10:32:10AM -0400, Zi Yan wrote:
> Thank you for the kind words. I really enjoy working with you. Since you
> are still around, I am sure we will keep working together. :)

You're welcome, and absolutely :) and always feel free to ping if you want my
input of course!

--
Cheers, Lorenzo
