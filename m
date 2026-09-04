Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AAB472536
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541131; cv=none; b=De7NbCRw10Uuz+SUYCtOSPcYle2NBAFBowdiQLGHLA270bU6ocfnPZqaMNW3wYms+cWEXudXvaOnhGDRryzXLnjs+FxYzG+9hPyNeUOd/cHj4eyxEsTMm8OQapN+6jeObUjVJDXXHgIO360LyTUCZrlAEoS6BLqmNBW/scioe/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541131; c=relaxed/simple;
	bh=eWMaL7Tuvl7rd6SXCG2VN1/H42Si5EJID1Yi7EtsgNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fn0KdUT3Ne9YNk2s1hUjeAmzVkFrhoQ8xDzEfV1jxKfei/i8ssMarF61Y2sTr9Gmt3jjmkCM1g8+iUxXKTQAnLgNJKBOwo4nCuvTa4/rj9vLC+MAyiDHp5i4z+wjKLQhFglUrXBZWP+kkYeQNYvPlN4IXZoRAZla99KizBgZnJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8EicANy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8EicANy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2721F00A3D;
	Fri,  4 Sep 2026 16:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788541129;
	bh=MRbSPkEQK0Ub6d1aWvrOQpyCJLijQI4WfXdTv81rUTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I8EicANysIZ6XquAsV3qJFYV78fja4ojsaGvJLvFTZf41yyvkHUDx2MiVJ2gujSGj
	 BRJ/gOZraKZ0HswtwxqzR3ZRV5F16cxEyop+aZxuFuV3KNY5KPdbBrarAH9Naz6wCD
	 sYqYOQJIFCEUklvLN5uKBeytV8KQQSnHwCqpAwj0VSqF259KhnRbSlXcbus/MnEOdR
	 pAA6okiSdNrKD/Rok3wPY6k4JQ/laVWxFptr5vJLrl3A3zekbuP6UL5TGvDmYmyzAz
	 4MMh/L8rs4wslqlkMSlZJL8J4gZGLg7nW1e48kK13Zw75qTAqVYwWlDS34Df+LglIi
	 7iF9g3fI+xGtg==
Date: Fri, 4 Sep 2026 10:58:47 -0600
From: Keith Busch <kbusch@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH] nvme: fix typo "occuring" in comment
Message-ID: <apr4x1OUVv0dQ1KJ@kbusch-mbp>
References: <20260904112722.5618-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904112722.5618-1-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 04:57:21PM +0530, Hemanth Selam wrote:
> Correct "occuring" to "occurring", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.

Generally, but not always, we don't take pure comment typo fixes because
it creates a conflict point for potentially stable fixes in the
surrounding code.
