Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D6C456DED
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044903; cv=none; b=e6jy/71uk8EyQ/ErJ2GMb6qfmDCUjtiHTKH7LFw+v07fB+eU7+zEMbRtoOBmmfCraTE0oBgfBlFTofZVBuNDg9K3JXxkj5rkXy9xujGxLlL+g2qNPjATbTrljL14U20wX597lXR1TbkPMG9WC46OzaZ2pBhGZsj5mKBbHmGeu4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044903; c=relaxed/simple;
	bh=1wYpYu/neOHpSxPcKIemZLJ2cs2qCAD8wvolQO03BuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBPXD6rhAUWeO97uAixaX9nCw8YdimRYoWmPDYWuqGuntFHwMBR8kxyoDgAT33/evL6tuSMqxYSH47B9m2vcLmXJOiv+F0PRFx1CHWr/icbgy+npD5hgwKQdfigLcmNZK2p6XQg1KKSrppZqd0e2SkwHLJuvaQASysyK6LELeD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 74E9068B05; Thu, 15 Oct 2026 08:14:49 +0200 (CEST)
Date: Thu, 15 Oct 2026 08:14:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: kensanya@163.com
Cc: justin.tee@broadcom.com, nareshgottumukkala83@gmail.com,
	paul.ely@broadcom.com, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	TanZheng <tanzheng@kylinos.cn>
Subject: Re: [PATCH] nvmet-fc: skip hostport ops when the LLDD has no host
 handle
Message-ID: <20261015061449.GA14497@lst.de>
References: <20261014075303.277735-1-kensanya@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014075303.277735-1-kensanya@163.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Oct 14, 2026 at 03:53:03PM +0800, kensanya@163.com wrote:
> From: TanZheng <tanzheng@kylinos.cn>
> 
> nvmet_fc_alloc_hostport() returns NULL when the LLDD passes a NULL
> hosthandle. That is not an ERR_PTR, so nvmet_fc_alloc_target_assoc()
> keeps the association and leaves assoc->hostport NULL.

A NULL hosthandle doesn't make much sense, so why do you want to handle
that?

