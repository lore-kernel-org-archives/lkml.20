Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE6F18CC13;
	Sat,  3 Oct 2026 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017809; cv=none; b=u5FO4ihMeaSjxaO95VV1fJINcfxfiBLWtVDKrSXM9QGHyjYcSIDioXtoLkQZD0UStAOYg2SyInnlQdeJGqbT/ArxQvzNYZLBvrr8dttfabt3OkYkgKBG0RddDX71PqsTKV1f44e+ZD4mCrvM0dKmPWGOpy6yUORfugRs7XO2ZlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017809; c=relaxed/simple;
	bh=BuwOcYaPJunt7FTIGS4DIGLNaEQRhKkL2KvCM1bFYM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Syb3fU+tcUSSQlqTXQKGEhuWW9gokNXlz+VPgvnYfLzsfrOXOhyXouzsdQcsIYmnRs4q484pkxwrC+/8+6mtseXCxbTmM9sgIY7l3kUjHnwtvcneSFPQ7IHI8IV9ec6SA/d3lud6+nFAbguomGLIFHL/2fJELzd3TkDoEFvAlOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrPJpIoK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrPJpIoK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3373A1F0089B;
	Sat,  3 Oct 2026 08:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791017808;
	bh=nN3MZABTIIjxIMWdjQc1xGIL8klPhNn3S21ASF4my+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SrPJpIoK7LzXm/h+MaAdShNOXpWjvgbQYHYwfSPIq+j65GsuThrhsUH7K68Br42R9
	 gpdMOrrbOjXXdXbZLjacE4yvZg7wyQkweCTL1DZBSUB/pKv4MFQ4yPUJsIHOZuvqWs
	 nOt/F6C53S9/F2Tcn7xQk9axjy7fLCiuMugQUkA0rY5wZrR+1gn8/V/lJ6UfbahtbD
	 BUYWZBPeg/yvo+4/iLL2wOT5AL1fsLVfJBoDQLqX56BlEclXSJkbTZrZ38B8FtXkvD
	 eTDo23q0/7nu/yIhaHqmQLJRbmpg6md40fBoqXbUsh/RGjbv8zX6OzjKFuxQh+CB6u
	 U/ONEWlQWHgBw==
Date: Sat, 3 Oct 2026 09:56:42 +0100
From: Keith Busch <kbusch@kernel.org>
To: Palla Raghunath <raghunathpalla.0209@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Damien Le Moal <dlemoal@kernel.org>, Yao Sang <sangyao@kylinos.cn>,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	syzbot+b0910be96b7c31314822@syzkaller.appspotmail.com,
	syzbot+2e02ccadb3c5522a5c59@syzkaller.appspotmail.com,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH] nvme-multipath: revalidate head zones after unfreezing
 the head queue
Message-ID: <asDDSv8LFGefB8xw@kbusch-mbp>
References: <20260930062648.73871-1-raghunathpalla.0209@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930062648.73871-1-raghunathpalla.0209@gmail.com>

On Wed, Sep 30, 2026 at 07:26:47AM +0100, Palla Raghunath wrote:
> When a namespace on a multipath controller is updated,
> nvme_update_ns_info() freezes the head disk queue, commits the new
> limits, and then calls nvme_mpath_revalidate_zones() before it
> unfreezes the queue again.
> 
> That is the wrong way round for blk_revalidate_disk_zones(). It starts
> a limits update, which takes q->limits_lock, and it freezes the queue
> itself while updating the zone resources. The block layer takes
> limits_lock before freezing the queue, never the other way around, so
> calling it with the head queue already frozen reverses that order.

Thanks, applied to nvme-7.3.
