Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5596B3AAF49
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788468443; cv=none; b=n7XReJ3XuXoDMlI9738OeUCPO0ZgJX7/RJNbt0c1aqgZ21o+DOwsWPwVnGOqaAkKucfITUgW5BEZKRIUrUat9q8KdGMTqeIaRCfjZUwYdB+mHYcOYLl5Qq6+uXZZnJycuQFhrGVot/T6QOO/LtXjHVJrGxVQO68hPK/i51/qiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788468443; c=relaxed/simple;
	bh=LceZKNgQSZ5YYXde50P2jXWHNZCz9osuz63auvAVP/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHNYfWNwbW5PLKz0D9+anAj23xxhGiN1h1b53r6qeV6G+5EYtwspdJ/r3jpr5sZGB/oCeCQn8hqAHjcCQlVhpItSkY8UyeJg5o1rsVXrLPtDJqtJbXqu7BBNk6Ud7unDyu2meq6AEQVk4pIyeKtVrkNoGnN2hh8poqHVsp91NAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDJ7Q8Rs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDJ7Q8Rs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FFC1F00A3E;
	Thu,  3 Sep 2026 20:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788468438;
	bh=DdIokEjR3Hep86CMJFAfHVJnSB6eCK9wOnMgg3FzaAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XDJ7Q8RslubZrqmsTngCVxVXwsvE3+cN+KH6XxeWw/4/sPTROE8nMw3Gqm7J3Y3wh
	 C4Dm8BJhUEySA6Cc/1eLuwTimcDXnCxv9jocQpCyIp6iZrnbjSGIms/bSDFtOgFPJH
	 DQ/xTbK2Vfyh/kn2dO72I18ITYqvZiQ2AZ9gxwommPWSdU/91lhXYilwJhuiRVfLpT
	 iSUYmtM6qpz3ufW7d8Zs53keaoV7UYjJX1KdUoUZ3c+TvmY2ByfJSjU4ISF+26H6iz
	 Ec42jGto/v7Xx4rROjIoq5MWrUyLn2dlpQ1zeGfyLGRiMIvmLAHo3SZKWz7CpL7RBt
	 o0I3GW9E+b61w==
Date: Thu, 3 Sep 2026 14:47:16 -0600
From: Keith Busch <kbusch@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH v3] nvme-tcp.h: drop kernel-doc comments, fix a few
 descriptions
Message-ID: <apnc1ElrDkaTHwdY@kbusch-mbp>
References: <20260831060501.3482765-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831060501.3482765-1-rdunlap@infradead.org>

On Sun, Aug 30, 2026 at 11:05:01PM -0700, Randy Dunlap wrote:
> Expand @fei into @feil and @feih because the field was split due to it
> not being 32-bit aligned.
> 
> Struct member @hdr was described twice in struct nvme_tcp_rsp_pdu, so
> drop one of them.
> 
> These structs are defined in a spec outside of the kernel, so kernel-doc
> comments for them aren't needed here as well.
> 
> This avoids kernel-doc warnings:
> 
> Warning: include/linux/nvme-tcp.h:95 struct member 'rsvd2' not described in 'nvme_tcp_icreq_pdu'
> Warning: include/linux/nvme-tcp.h:113 struct member 'rsvd' not described in 'nvme_tcp_icresp_pdu'
> Warning: include/linux/nvme-tcp.h:128 struct member 'feil' not described in 'nvme_tcp_term_pdu'
> Warning: include/linux/nvme-tcp.h:128 struct member 'feiu' not described in 'nvme_tcp_term_pdu'
> Warning: include/linux/nvme-tcp.h:128 struct member 'rsvd' not described in 'nvme_tcp_term_pdu'
> Warning: include/linux/nvme-tcp.h:169 struct member 'rsvd' not described in 'nvme_tcp_r2t_pdu'
> Warning: include/linux/nvme-tcp.h:187 struct member 'rsvd' not described in 'nvme_tcp_data_pdu'

Thanks, applied to nvme-7.3.
