Received: from mail-108-mta245.mxroute.com (mail-108-mta245.mxroute.com [136.175.108.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9F23546F2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538124; cv=none; b=QSo1Gka4qI4Ddtfmb5uQLGoI+DZ3AAwAshsYH6WFbiZlgzcnAwJW6hLf0J06em3xKjuCaOrh8NRRDXQ1DJjhfclP6nrZZHLgzCpujM7WCL0LRfAwqlhv5Sjz3LsTs7Yeqls0AoTpGi7u3utIIESJZteZcTbw2O0ezmcjzvj6hDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538124; c=relaxed/simple;
	bh=P5UlGdrAwY9YuOCfx6ku8W2zSM50a/kY1oksk1kuQ9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AryvANqvlf7lVlpTGxu6lwXkNfe5rFv0LlVO2Ds9zSg+91Qio+zdJaFwUxYwhlmVQ4cjkmYkHDqv7CLldW6fdKXmG04NUX7nTZRr8+DtZl/R/O1WWxdDydmE89CRb7TjGJ6gxEXXbMBxTf6zaMjCLekSmDvmrZnD7C6PxpUeZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=PSVAf9Qw; arc=none smtp.client-ip=136.175.108.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="PSVAf9Qw"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta245.mxroute.com (ZoneMTA) with ESMTPSA id 1a11ff98d8700028b2.007
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 09 Oct 2026 09:23:30 +0000
X-Zone-Loop: 87e772de0cd6c09c354179ebc4b2f048221d38005715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lrct6l2zelWZPIk1Dq8p/8fOx4mnemJf0V7B4RjY2EY=; b=PSVAf9Qw3/ohfDyztSzwT8dob3
	Qeb9UAEyo/3nvhQtsS26J4el+BvXhBTAAcXVF2njhxS3HGtuGZ4Cux7r7+Xa0g9mAY4KFNXCcVwe2
	Qu/YAUQMkffsDmAeKHdTlFFmx85SxncKXgKOVoldV+L2FBjc79Qg6q1s0/wmrFOsgdDrvbDU2lCU1
	nEDLZ/Rx6AGEcsz7zQtnU1GgVSgn2LsDSyJVN0eW3+jSvDzK5a7nlj9ZkihLDzxwK1KwEfORffuuT
	wr+4OG11vglJ6wxwoZKKD8WLBY70K/OFgKwfmstcPfT2hbffi2wFC9657t7jgefWgazTaLRi1HzEV
	yCaK1H+g==;
Date: Fri, 9 Oct 2026 09:23:17 +0000
From: Richard Patel <ripatel@wii.dev>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <asiygFiibqjVL1AD@wii.dev>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
 <asJGxhij4OzWNYn9@wii.dev>
 <asN8pXcsRRRrwp58@opensource.cirrus.com>
 <asOiEwRp77ETKznr@opensource.cirrus.com>
 <asePYrXFHxHNssgK@opensource.cirrus.com>
 <asgjJLeH12OAlYai@wii.dev>
 <asit3WWNt0/iRnyc@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asit3WWNt0/iRnyc@opensource.cirrus.com>
X-Authenticated-Id: ripatel@wii.dev

On Fri, Oct 09, 2026 at 10:03:25AM +0100, Charles Keepax wrote:
> On Thu, Oct 08, 2026 at 11:11:32PM +0000, Richard Patel wrote:
> > On Thu, Oct 08, 2026 at 01:41:06PM +0100, Charles Keepax wrote:
> > > On Mon, Oct 05, 2026 at 02:11:47PM +0100, Charles Keepax wrote:
> > > > On Mon, Oct 05, 2026 at 11:32:05AM +0100, Charles Keepax wrote:
> > > > > On Sun, Oct 04, 2026 at 12:29:58PM +0000, Richard Patel wrote:
> > > > > > On Fri, Sep 25, 2026 at 04:42:16PM +0100, Charles Keepax wrote:
> > > Ok found some time to look at this properly I think this is all
> > > fine. sdw_intel_exit() first calls sdw_intel_cleanup() which will
> > > eventually call sdw_cdns_enable_interrupt(..., false), which
> > > should disable the SoundWire IRQs. Then sdw_intel_exit() frees
> > > the ctx, whilst at that point whilst the IRQ is still registered
> > > one should no longer be able to see soundwire IRQs, so you shouldn't
> > > get a dereferencing of ctx.
> >
> > On my Galaxy Book6, I was able to get a ctx UAF with your v2 patch set
> > by adding a sleep.
> Hmm... yeah, I guess the masking ensures a new IRQ can't come in
> but nothing ensures a currently running IRQ is synchronised in.
> Well assuming the masking does actually prevent an IRQ coming in.
> 
> That is a little awkward, normally freeing the IRQ would
> synchronise it but as the "IRQ" here is done as a pile of
> callbacks that doesn't happen. We could do a manual sync on the
> IRQ but that feels like a bit of a layering violation, since
> the actually IRQ is several layers away in another part of the
> code. We could add some flags/completions such that we can wait
> for the current IRQ to finish but feels a bit like adding code
> that shouldn't exist. I think the correct solution is probably
> to switch the handling over to the IRQ framework.
> 
> I am going to go for the theory this is not directly a problem
> with this series since the problem exists unchanged before and
> after the series. So lets not block this stuff on it, but I will

Yep, sounds good :-) Thanks again for the fixes. 

> try to find time to start porting more of the handling over to
> the IRQ framework, or happy to help review if you would rather
> take a run at it.

I was going to defer kfree(ctx) via RCU, what do you think?

Cheers,
-- Richard
