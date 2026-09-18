Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818513A875B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741473; cv=none; b=gDrPyZffsFfdzXts8fN+c8ZwdeqDdkW4LeX9yf7mFdYsfdInM9SlHJoJHS++Pd27avhMpcuPMuVv6fRWWnPPoC5n9PXO7nwL6EtfVDuu1/W7r+Taw1as6CCTszUQ1kh22w60tgSv4oLxn3pKaaN7QH6AvJYElh/+sTvm8mjcmNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741473; c=relaxed/simple;
	bh=mDKzVuD/AFCHDc6/NGK6wlwTQpT9iY+5H6Ywtdg4ctM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/Jnc15ZoQ4Pbrj2wBid8EXxdBWzysUTsAyT087JriPIed73kzi/YXvRP+u7oxhovwPtCEb9fGriPD2ONOUZJN3aYlrFouJ9E4l6rbfPBUUc+9M513gXN4l/SCdEBOESgFHUSHv1KTWTB9aa14sBxzWE9dczxy3nXL082OXxdYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id CA1F568BEB; Fri, 18 Sep 2026 16:24:27 +0200 (CEST)
Date: Fri, 18 Sep 2026 16:24:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: yupeng <yupeng0921@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] nvmet: add cgroup_path to charge namespace I/O to a
 cgroup
Message-ID: <20260918142427.GA19316@lst.de>
References: <20260908011214.11344-1-yupeng0921@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908011214.11344-1-yupeng0921@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

cgroup charing does seem useful.  But please do a human pass on the
code and especially the commit log and text in documentation, this
Claude slop is unreadable, and I also really want to you to be able
to explain the details of the new code.  Please also Cc the cgroup
mailing list for the next version, as they are much better than us
nvme maintainers to judge if you're using the cgroup APIs correctly.

