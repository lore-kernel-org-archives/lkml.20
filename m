Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64FF3A382F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345770; cv=none; b=iNstC8tXjdyU6yIn9JNXRJwIzwB0/3szqCT1Cf2l03NsLjk7i3P29wVO5Am7/w3LW+DuoC+HSeNiPY5djs9CxDhAtFyacq2EZNud0zAa7jEIZ8rm86IZoQ/ZxpYMTcLUQy0azCJ1TmlcYEuo99g0fxg3/kdPtbAy1YAfXpFl3Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345770; c=relaxed/simple;
	bh=bBo4MHfhpaFSwTWsHP4/OwEdkTPUOdUAp1AePyrH4B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQnrQOsHzcSeSuWDZPXQ99Ucr3i4fVNARejYkUi94cNysalXzrU4Sw6GVjrfdW8hpAR781/I8gOWjg9ESU5+mgB7WM0VdUDeOk0KGUedN56jJzxB/GQ/9s7fYzb2wnq1MxY6Xk3fiC8Qh/3S+8WSoAhuEQXFqPrra3o0OOXmt1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7C2326732A; Wed,  2 Sep 2026 12:42:41 +0200 (CEST)
Date: Wed, 2 Sep 2026 12:42:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: raoxu <raoxu@uniontech.com>, axboe@kernel.dk, hch@lst.de,
	kbusch@kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH nvme-7.3 3/4] nvme-fabrics: add helpers for subsystem
 and host identity options
Message-ID: <20260902104241.GC8206@lst.de>
References: <29BB44C32FF06823+20260821062142.1932160-1-raoxu@uniontech.com> <450E21059686C852+20260821062529.1936914-1-raoxu@uniontech.com> <e948f5e5-3e96-4467-a4dd-67316871cc7a@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e948f5e5-3e96-4467-a4dd-67316871cc7a@grimberg.me>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, Aug 23, 2026 at 01:11:56AM +0300, Sagi Grimberg wrote:
>
>
> On 21/08/2026 9:25, raoxu wrote:
>> From: Xu Rao <raoxu@uniontech.com>
>>
>> The nqn, hostnqn and hostid options also start with match_strdup(), but
>> unlike the direct string replacements handled by nvmf_parse_string_option()
>> they perform option-specific validation or conversion before parsing is
>> complete.
>
> Does this warrant that they get a special handler? I am not sure I see how 
> this helps.

That doesn't.  But the fact that nvmf_parse_options is more than 400
lines in the current upstream tree is.  For non-trivial parsers
using switch statements, the code flow tends to be a lot nice when
every case is split out into a helper and not in the containing function.

