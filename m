Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922629;
	b=JgVECBmyq9ps6POvPKNu2vzWalI6YQXZOQh5PwtxXe7baUgqcaR5H3TpwWHBE8rYYCrq
	 l7vB5pbHztJzE4y52zH5LdyJISFIc3aZse5THtogDaCBLH2NunX0VNIFviwm+8m/QwcdT
	 pC5j4xR3T+Ev0EbmNpNfo7wVqniYuIdP/uTvrRbO053WPvdNSKvtRLSH/Oh1oH1Q5r1HN
	 294PAcDRntgnseyMs9fM3mAHq9PEZX7FZnzs4XGAUBncol+GElWQUOzOFLtlyFBB04Z2J
	 2uUD6K5RTovAsvLAEYtCEBYblroFcE9rT5OT/YOLxO1W6ChLw/iLJ7ZLabbo3j6IEHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922629;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=Ve5M4ksClWU3GARUesdbnE3PEcR+DvGa1Lrs6QUEMsg=;
	b=Yn1GImFuDg5WI/K3eZg+3j3WiEcLDCFjLQY+bgeEuTU8rvk5d+SGPAII75Ejtt0dumdq
	 SwqFhjVnOVkOc44B7KBv+rd3+iaDBx05Nr585dBDLHM9pOlVKEQm8XqiB60pEUKY/VH5r
	 GW/vEZHV0sjKzCgHxzR//6uYnapOIYXJDGYAtilDX90NyZ9CfLAzIms1VPvmkjSZ2REc5
	 68d9y+8yRfbolrjqJsVbI7+tgheZwUJGE0rP8C6o/21xdrkPYRz4lKjZBvlNb+Psip6J/
	 WmDb7iVcLzPR5OGFX61rcEtVeTYsXV1RpSXRvMteNVwDX8UTiwWR0Zh+apAUejzmxHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0DFU1hhi;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA36606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA36606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0DFU1hhi
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 32856C79A97;
	Tue, 17 Nov 2026 13:37:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5EA65FC81;
	Tue, 17 Nov 2026 13:37:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B2CE11BC0039;
	Tue, 17 Nov 2026 14:37:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ve5M4ksClWU3GARUesdbnE3PEcR+DvGa1Lrs6QUEMsg=;
	b=0DFU1hhiXtsJvot91h2UPxiZDkJzFV8N6DHLzT1NYp4PnIq6XUFen7UR6N5fltOvX7YGM+
	3bwgfGHk3Rhfm7tIU3cS1qrE+WJZrYQtkMJ877peJXAujEj8sk1pWWtYapB+OjsAxgFuaB
	bKbpMqEl+aIUYsPNQKiK+dHdTEUyD6R6mIHwyJeV5cszbjwmGraLqPBH4GuCi+xZqXVkc2
	0D1DDGQjToXtrdiV1lKjumHu2ZbHOX8i6DCPt3ICmOCSiu9XlafJ/iXRzWjhhAWwPe26ME
	ozz5uD5Y5UuFJB7XdWrYyC2R0BQvdGuMPjShT3I2V+cprKP+R7YjEdWFsMUBSQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joern Engel <joern@lazybastard.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tal Zussman <tz2294@columbia.edu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
References: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
Subject: Re: [PATCH v2 0/4] mtd: block2mtd: convert to folios
Message-Id: <179492262030.2237190.3278481994830648119.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:00 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 16 Oct 2026 15:11:06 -0400, Tal Zussman wrote:
> block2mtd still goes through the page wrappers around the folio page
> cache API, each of which hides a compound_head() call. Convert the read,
> write and erase paths to use folios directly. This removes a
> compound_head() call per page in the read path and four per page in the
> write and erase paths, and leaves the driver with no struct page usage.
> 
> The first patch fixes a pre-existing race in the write and erase paths,
> which could modify a page that invalidate_bdev() had already dropped
> from the page cache.
> 
> [...]

Applied to mtd/next, thanks!

[1/4] mtd: block2mtd: retry if the page was dropped from the page cache
      commit: 49fb19b1578425c1fa35f305f5adb4f8a5d35063
[2/4] mtd: block2mtd: convert block2mtd_read() to folios
      commit: ab602490225503d68d5d251e5cfcc74673ea382e
[3/4] mtd: block2mtd: convert _block2mtd_write() to folios
      commit: 6ab57a6b78dfcbff8cb5f481d0a8a04785f57326
[4/4] mtd: block2mtd: convert _block2mtd_erase() to folios
      commit: 784ec89f3b6a28f78e66602f9d08d4ba7dd574f9

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

