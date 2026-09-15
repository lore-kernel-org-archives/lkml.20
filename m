Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313043F0B6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499627; cv=none; b=bmDI/JS4w08qRWZLUcaqbypTmaZumIB3eB7rxIHIafiEiOkuF6onAEbR9I/RyG/RB+BkLn8kJ7oZmMiQ20CwD3ovSI8CkWIyXLsYgZhyLBlR4lqWB8wCL/276dwWkk3uZ8vjRIeAPNSGAejVEMNzlUjaQT58djugwekKM9WbCiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499627; c=relaxed/simple;
	bh=bVH/Pm3Y30vv9kXZAQkkj2+9swYHtA6PO8REvN6/FZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImBDorTQ2nyZhRZ0mqTPmLZ7WFskvhLOHxNOLgTqSYWyNerNgbX7k9SzRdJLcRuMuBYWwkBl4Rw1q7RswTXbZd+o2dSGV4CXy2125CLOuHXx0KnVBkV1fSQuA50yDevIviTrZevDYfNdh+0uj1DFvakNv8RyClF59HoOAGKYF/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExeGMHDr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExeGMHDr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413E11F000FF;
	Tue, 15 Sep 2026 19:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789499625;
	bh=bYQEVYfX+WA08lNWpJpBmztpHDIbM99DdEJzT65B0Jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ExeGMHDrG7oJjLtFRdlLralz1AUlpkk8DQAtf6h9JbHgqyJ2exiiADP/O1EnbPPsg
	 fPG5ZJF6MKxdGenDoerjIvre3NO23YnGcpMDxgCC/BwxG6BTmniHvQWP3+LXCqYIIB
	 MVEZmzxojP3iFDBCTebU5uJF/E76UJ544Fk++oBsuuXPWaaY4qXv66P6IcEhTI6Isb
	 h4Y7LXC61AObtm71urTFCiFM69E2yy6dzmSSNlR1Qi0pWmy8gYZfIdIqpq8HjCyZ4l
	 0uc0PRe1/8FBHh/b6OIH1JMP9BunsUbrrtWAionJzZF5Q5zdRKf7P8y2iVoZ6tFKJr
	 iA9WgvA65Vh9A==
Date: Tue, 15 Sep 2026 13:13:42 -0600
From: Keith Busch <kbusch@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
Cc: hare@suse.de, hch@lst.de, axboe@kernel.dk, sagi@grimberg.me,
	kch@nvidia.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/1] nvme-auth: constant-time DH-HMAC-CHAP response
 comparison
Message-ID: <aqmY5qqjghx4DFNM@kbusch-mbp>
References: <cover.nvme-auth-memneq.1781751816.git.liuxixin@kylinos.cn>
 <0001.nvme-auth-memneq.1781751816.git.liuxixin@kylinos.cn>
 <20260702141317.GA23046@lst.de>
 <df336dde-f70b-4ddf-b77d-b9b910d2c10e@suse.de>
 <reply-nvme-auth-memneq-ping.20260915.liuxixin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <reply-nvme-auth-memneq-ping.20260915.liuxixin@kylinos.cn>

On Tue, Sep 15, 2026 at 11:30:00AM +0800, Xixin Liu wrote:
> Hi Keith,
> 
> Gentle ping: this v1 still has Reviewed-by from Christoph and Hannes, please apply when you have a chance.

Sorry, looks like I didn't send out the "applied" message to this patch.
This was applied a while ago for 7.2:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=3a6d89836ab09d53f4c32c57588689a378ce4363
