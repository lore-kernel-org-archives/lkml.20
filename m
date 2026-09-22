Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547938F951
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089488; cv=none; b=SIznr2TAbk/sVwIateGgLOJRkUzFWwNyRDMD4gkpm3+FKbQpHwf5dn3hsAnKCGakstfdZ/SM0tVHh7QI3pxnMwoWZs5shnxz+WfPZA7s2pRF8ThFH4YRBngfAvrwnPKYRJbe9NA0icKcxy7drJ8uQNi4EkaH6/8sE3EDieQWQA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089488; c=relaxed/simple;
	bh=kKWPGMsMKj0GVrpPMSrMp1tLyzvLfx5MyUbcQt0JUKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpWM3rjMRH5C/Uk53AAv+eXI69p48mMyzLptD4acKgf3QpB7f7dY6UMiWnqPiUB1kOcmM0ZuJ4Z4HgWcg5TvwMCfyWRwI3hP9t4bi1zqg3a3lOMtOBkf/NONRX//5Lb8GWFRUtL9HYe0gGnuM3pIJwKBZvfpWWN0KSAjXPAfcu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSnIAh1X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSnIAh1X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5F61F00893;
	Tue, 22 Sep 2026 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089485;
	bh=kKWPGMsMKj0GVrpPMSrMp1tLyzvLfx5MyUbcQt0JUKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KSnIAh1Xb4nrdYcdXu4DSdelq3J6n3K5U23TDvHJnn2eySdltOx2/xcUzLVGW6XJ8
	 wZ3hnZvyCviTherXI+Yfw4jEaIWwfhRKwZs0dqwz62E9gUakvbysL0jWUrhpHP6ClY
	 u9vMiyfedBzNBZkCvNF0kPhGHI/OyVI4EJ31bErnTUWo96S87CJM15zWLfRDiyGuFq
	 qaBMCn47BpMFKnlEIJ5QCcuaanLIEGPpRZMIzR9zTqyu2nB13xLdN+eJTv1tm2Ky3H
	 CX2g7oTIeAjwGAPFwL/pkuvVt6SRiYhwob1WhH9rzYCRhzHy6ZnWmh1uXl85x9vG5Z
	 1QkMJHkuytSDg==
Date: Tue, 22 Sep 2026 09:04:43 -0600
From: Keith Busch <kbusch@kernel.org>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	gjoyce@linux.ibm.com
Subject: Re: [PATCH v2 0/2] nvmet: fix subtle race in I/O processing and ns
 configuration
Message-ID: <arKZC8bhV7TwaDCc@kbusch-mbp>
References: <20260918162736.802665-1-nilay@linux.ibm.com>
 <arKX6rZq_CLz05X5@kbusch-mbp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKX6rZq_CLz05X5@kbusch-mbp>

On Tue, Sep 22, 2026 at 08:59:54AM -0600, Keith Busch wrote:
> Thanks, series applied to nvme-7.4.

Err, I mean 7.3 for this one since these are fixes.
