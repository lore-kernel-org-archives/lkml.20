Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653204AF9DB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388318; cv=none; b=BFJGQM0Q9cuF2PAcnue7Ejavoyx7Sq9y3doU0lWAkJlyrlJn9oBSXqaAhwgUlmXa7GpZ2BYTXECXV/RHJ0hd1X130iZ1GeF6Exfh9Y2uGPJF4eCORULDjkOyLVtnyavlkdTHQDjKREtY/Ax8wdkTgYnvm/YCTMswm3RBayJSzSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388318; c=relaxed/simple;
	bh=2iKYP1CPCo3RHqcftQDaGB8eTh7Cc6W/ys1kL2M90O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMOTlvnar2jYDx63LLvBr2YMl5bKhU/ZIR16qJa8jBDT5kIC55P4b23WT1p7ruVExhSCIdnE+5ufUDU2+ti1lrm9tcZutM1uUgl+ZhHLRRsto2eq9MXoSpl/dUFzuIZ2zbLbmH1I9yWWQAgf2m2WI5F8R1Y4XNj6Vwu2nt+VQdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIVArlsZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIVArlsZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64431F000E9;
	Wed,  2 Sep 2026 22:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788388309;
	bh=sL1z3cpxV0fED0g7sNCVHBMWzAM6oSO31BW4c89DvCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CIVArlsZlF0R90V4RjeKtgNgRubxWT/sIqGW0qSSWDmQ+nTBXaGkx3WsSqJB5jnSM
	 0HAoivk65EtRM/fm5a0L2h7HQuluhmj5IxJ4gn4fbm+vH13kAIMZkQNtk9YflCiTjg
	 Hy6pk8pa6P4nVfGWo6SklnN1ZJ355U9qPDiumFVvskuhysKtAKpn9krgLN6anle8RW
	 EKfAvoKZQlY1sGL07q0v16rsc6IjAi7WsTsdIwSaMJgfy7sBZIml37XrS5647dlBxE
	 Wa1d8uDFiIW05G6F7rx0uOYFp1EDnIrS5QrsgM/03Tgab3A2LtHZ0Ihhy+66vd3jRk
	 3Vymz1DAFhFNA==
Date: Wed, 2 Sep 2026 16:31:47 -0600
From: Keith Busch <kbusch@kernel.org>
To: Seokgyu Choi <tjrrb0313@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+f613f9f010ec98eb9d86@syzkaller.appspotmail.com
Subject: Re: [PATCH] nvmet: reject namespace enable without device path
Message-ID: <apij0z23z93gb3jX@kbusch-mbp>
References: <20260827075221.312935-1-tjrrb0313@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827075221.312935-1-tjrrb0313@gmail.com>

On Thu, Aug 27, 2026 at 07:52:21AM +0000, Seokgyu Choi wrote:
> A newly allocated namespace has a NULL device_path until userspace
> configures the device_path attribute.
> 
> If buffered_io is enabled before device_path is configured,
> nvmet_bdev_ns_enable() returns -ENOTBLK and nvmet_ns_enable() falls
> back to nvmet_file_ns_enable(). The latter passes the NULL
> device_path to filp_open(), causing a NULL pointer dereference in
> getname_kernel().
> 
> Reject namespace enable when device_path has not been configured.

Thanks, applied to nvme-7.3.
