Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253E6525A6A;
	Tue, 13 Oct 2026 15:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906171; cv=none; b=prK/oYWRLmk6JiVvf0L8sSUJ4BrY2C6TE8S2OKaY2WD+xRKA4X2IH7aJs3aoN0kob/8CP+CWIvxyOuPJpAHS3md26lHd0CdWxxc8k110O1+V6TwUNkS+qTfvydNFSS8gAd57WXjujGzFJxKBHeGlxN5TwlAHKlbDX1VFzPNQ1hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906171; c=relaxed/simple;
	bh=U9f4LYlkODXJIk3T03bPPWNvyqcVMUTvrRhFTv9Qt4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/BbNdIhUdO/rg7O57D5Cqm1oC+BtwfOW7gWSAxl+0kxnnJAi5O8Mf4uI6d8TcNZC9OvUUteJUldSlH0t0gPO2LKfa3d2ceGaZPKZipNGpIKbfptwqQIHXMGylyEF33IFTWmBnodbFP+A7q/ZcUl4AcbzRkH4Fs171aTs9olJtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPTg0/SK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPTg0/SK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318D91F000FF;
	Tue, 13 Oct 2026 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906169;
	bh=GV3/2pwMIoMbwD/i8kgVO4kcDg6oal1jEHBE+1WtdcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VPTg0/SKFoCLSUtdRlvaXBWnQYZlMPKvxmObOtG3V36ZTxgCZpIlJGNJGQn4DwUrM
	 KHSShqwOp9l61ErqpuUZkg693PJmCyIBoJRLqfHMk8js4FNqM2+F+eMj2PsWPUY9O7
	 jzNiDuL7WWm7O08luPowsqt87qWgv6yAJVF0ztOKAFZp7gzjoCRp5Ce+xSKAh3Mpcx
	 8TB7c4NQbAf4jXwQ98sFF+Ifui0cE+lUxEdnEF6INixtHwNeLr5tJY+OtqgR7DY74l
	 /MA2SvwxdChwUauZWv3BhMFd48STi8d5KPYiz+QiGhCLYNj7WfZf6Rn7FqcyUZdRdf
	 1eZ+dw+452WeA==
Date: Tue, 13 Oct 2026 09:42:47 -0600
From: Keith Busch <kbusch@kernel.org>
To: Palla Raghunath <raghunathpalla.0209@gmail.com>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Daniel Wagner <dwagner@suse.de>, Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+da94a51633758d13bd63@syzkaller.appspotmail.com
Subject: Re: [PATCH] nvmet-fc: don't drop the last assoc reference in
 nvmet_fc_delete_ctrl()
Message-ID: <as5Rd6jGQNtJpW0C@kbusch-mbp>
References: <20261008191848.47066-1-raghunathpalla.0209@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008191848.47066-1-raghunathpalla.0209@gmail.com>

On Thu, Oct 08, 2026 at 08:18:48PM +0100, Palla Raghunath wrote:
> syzbot hit a recursive locking report on subsys->lock when a subsystem
> is unlinked from an FC port.
> 
> nvmet_port_del_ctrls() holds subsys->lock while it calls ->delete_ctrl()
> for each controller. nvmet_fc_delete_ctrl() grabs a reference on the
> association, queues del_work and then drops the reference. If del_work
> gets to run to completion before that put, ours is the last reference.
> Freeing the assoc tears down the queues, the last nvmet_cq_put() drops
> the last ctrl reference, and nvmet_ctrl_free() goes for subsys->lock
> again:

Thanks, applied to nvme-7.4.
