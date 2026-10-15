Received: from mx01.bremer-it.com (mx01.bremer-it.com [85.215.132.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD1D3B19B3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.215.132.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089571; cv=none; b=OklHbKvNhS/Gd+u0PNj7uJFS9O0rrRlcPYJxSPm82o67qaT+RvfGxHFflm82F7mi+uV4oa71rgp//zt1A1trS2BseCrrqQe3hrJ6BKBfV+1lxil6yrs3I7aTuv8X3qErZCKOb+Gu2J5wqX7VGCLRxU1TV6mvM+57vyFdiHZh7Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089571; c=relaxed/simple;
	bh=JrtTjYuJ3hlXK8SMbGWhhTK94LuA8YiTGJEpuyViOxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GS2Xe/3o6jf/bcE3FhuLCQ3yi8P1l+hJ7z12zlvi1sRXqmODgICYWF62rLfVvgLF/A31S4BoR2kZZHUoZXWyHNszbnChOngAhz9a+Z4r+kB8O1eJBQBFULu7T/XgniFPsjVkIGMPg4jS6/2UIx84DAFlcNayjrb6n9wbOlwRkdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=barelysecure.org; spf=pass smtp.mailfrom=barelysecure.org; dkim=pass (2048-bit key) header.d=barelysecure.org header.i=@barelysecure.org header.b=XMCYAa9C; arc=none smtp.client-ip=85.215.132.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=barelysecure.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barelysecure.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=barelysecure.org header.i=@barelysecure.org header.b="XMCYAa9C"
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id CB961200FB;
	Thu, 15 Oct 2026 20:39:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1792089563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMh6llIyZaU6gvbFXWPakzH4w8foKwyN30kmvQqNpoE=;
	b=XMCYAa9CjIlcTczVfRSEK5t4dEdUGefNq783V0QWKU+s0cFZD3yKMo9ci+8safo0f6XcOG
	vBeX5bsLyOS71SXaWquLI/GeaKYsbwAKZPCJA4XKFJESuSOtrGGnujySzlZX4FxKX1yrhJ
	hpwpGnDcIp27WmNaQGue8xtn1UolJjv4eBGBimwAcdRYhbnkz4Fyi+OvDZPc+f0T+BhTab
	Rb/zgcXVxNPnG6DCm1YIIKtezEN42jYA8Gu5P956M6n+Uz80/wjRwsYWzvnuAhiz9hA7oa
	1ZjQBbycLOsc+gEtHTl+/IbY9C0T0mW6m254+CZyLo6qmUvu7S04cAeJ/9uD5Q==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Thu, 15 Oct 2026 11:39:18 -0700
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@barelysecure.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mtd: block2mtd: convert to folios
Message-ID: <atEd1rbZ_TCXpqXd@cashel.logfs.org>
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.10 / 14.00];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[10.10%];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:7922, ipnet:98.32.0.0/11, country:US];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[barelysecure.org:from_mime,barelysecure.org:from_smtp];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[barelysecure.org:s=dkim68];
	LOCAL_OUTBOUND(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: CB961200FB

On Wed, Oct 14, 2026 at 11:34:53PM -0400, Tal Zussman wrote:
> 
> The numbers below are from mtd_speedtest, in MiB/s, by folio size,
> except the last row, which is from the MEMERASE ioctl:
> 
> +------------------------------+-------+--------+---------+---------+
> | Test                         | Folio |   Base | Patched |  Change |
> +------------------------------+-------+--------+---------+---------+
> | Eraseblock read (128 KiB)    |   4K  |  12545 |   12863 |   +2.5% |
> |                              |  16K  |  12998 |   17229 |  +32.6% |
> |                              |  64K  |  13009 |   19135 |  +47.1% |
> +------------------------------+-------+--------+---------+---------+

Thank you!  Code size goes down, code seems subjectively easier to read
and performance goes up.  Good stuff!

The one pet complaint I have is that benchmarks should measure badness,
not goodness.  Humans tend to prioritize the big numbers.  If you
measure the bad thing (time in this case), they focus on the worst areas
where most time is spent.  If you measure the good thing, they tend to
improve things that are already too good to worry about even further.

Maybe you are immune to such psychological effects, but I am not and
measuring time instead of throughput makes a difference to my mind.

Jörn

--
The cheapest, fastest and most reliable components of a computer
system are those that aren't there.
-- Gordon Bell, DEC labratories
