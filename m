Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764814A33FA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213937; cv=none; b=HO1NaS2Rmh62r5kT9arZtYJmNoFoCl4MSMWDlz0bcO0da8o45A8R+BUADek5qTx7GlclG4xd4wDLzsTqAk5UWuGMSrRjaXBbAlaVZfBb+FGutbrgXucyU2M7S+sB8YEofs2CWhTqXdRlBIJuwslTO+An30NAW4gbjoqeaTs7Lu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213937; c=relaxed/simple;
	bh=jb06jLMadqh7AUFx9iOEA3MIe96UKTLV3v9LffWZnlM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTUO4x1+fxDGmoZ4rqDm4Nb8EvtV3ap7GoGBZCoKKBhqLkgzj5X6qvFIqXrB72YTLYthJr3CaSJWDGN5KeF5qQNhh8MWjkTl57Ed4UXys+hXL8GpNMIuDud604ije3thZXQ33dm8HAqBY6VYZGaVQc1OYtAlLVbqYvsZhzF+WPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ID6twCZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ID6twCZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47881F000FF;
	Mon,  5 Oct 2026 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791213936;
	bh=Baen8PQryX8eDiBxdXY1HWpb+ZNaxbRwgEV7WU05tqU=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=ID6twCZ23CBIvdE9pAjZ6ib+JeVI5jvnlRg29iEXhzywXTUzKtDVFgBUtQL+uMMMd
	 zwDMldBFSZTvuvlhXH/4KdBf7ivwpSbS7U/d//6j9OWsYDgmmXxOdTjXpFUwI9HcM+
	 hcgyYhMOkhbZ++sRytWl1FVOBw7DFC/Bbb3isWxfwipLerjc0r7sktNWPTo5hll9jv
	 UVa89486q7L19xV13hG6d6zl/Y+Jd7pql1kbE5YlfTzUMnSarUZ2ednQa5ecv5kiEf
	 0HCupdVY0K6o+p42VLDuHiSgvWNlDKMFc+oL1qiKaFQAX2xnxBgr4CXxcugGNBZ1la
	 J2Qku6R5Mv19Q==
Date: Mon, 5 Oct 2026 17:25:31 +0200
From: Eric Biggers <ebiggers@kernel.org>
To: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>, jaegeuk@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v1] f2fs: convert pagecache_read() to use folios
Message-ID: <20261005152531.GD3436@quark>
References: <20261002114338.12073-1-nsvatoslav515@gmail.com>
 <20261002232934.GB15366@quark>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002232934.GB15366@quark>

On Fri, Oct 02, 2026 at 04:29:34PM -0700, Eric Biggers via Linux-f2fs-devel wrote:
> On Fri, Oct 02, 2026 at 02:43:37PM +0300, Svyatoslav Nikolenko wrote:
> > Replace page-based APIs with folio equivalents in pagecache_read()
> > to migrate fs/f2fs/verity.c away from struct page.
> > 
> > Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
> 
> This will conflict with
> https://lore.kernel.org/fsverity/20261002223705.2175542-5-aalbersh@kernel.org
> 
> I'm checking if that one will go into 7.4.  If so, this one won't be
> needed.

I applied
https://lore.kernel.org/fsverity/20261002223705.2175542-5-aalbersh@kernel.org
for 7.4, so there's no need for this one.

- Eric
