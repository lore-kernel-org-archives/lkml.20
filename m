Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CF8377ED9;
	Wed, 26 Aug 2026 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755747; cv=none; b=t5ZzPYP16IWzy/cQiMmxxuM6RiLbOcrYFY/pC8G5iAy9pyv1RDmmezo3Vv9ZBK/kEtYf5htx4hOCO0LUCodcX8+FKKMfefiOEBN1jmnFrJVPNtFGXM1YYwIYvqIXjC05Qvu9z+zuIwnTrGdOF5koH1Ey/FBLYR8KQG8zcpt6I1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755747; c=relaxed/simple;
	bh=pq1uyl1v+k4qE6uBBYUWdHz18VQRCk1WOUyHFXUlBjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaJXzRedDC8FYyvDnBe+tNczhOaHwih2lWOmLs/49q20MJEZ71nZl49kamQukvwiPDCHETwu2eIxw2qxBjqpLVvDJnYvDLlhjetWBzW5S+o0L0B8xUhXkuJyl5oKtGiCOJ4O378BcZjZRlhUkK85dFnLb9Exb0zPirYpyCrjXxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbKo0FtO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbKo0FtO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C1C1F00A3A;
	Wed, 26 Aug 2026 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787755746;
	bh=gx+m2uC3EeSfGyZmweriuIShOVJ4wyd2IcbeT4yeSG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FbKo0FtOUar6RqZYPv4kqPXOjD7d1CH/zhuQOo075JXSKaXzGc6BKfkrSi+g47bgg
	 xYvL0AEkeSXso0mkcOTd97eqX67/x1fsqp3m0xhhiidwxGYJ2GCnuY13cIRqBmnXRP
	 uzGdwEFIqkK6ic6a5Bs1vMs3hHZrra+c6YDE/srF9WZf2ZpeUPClyZfe1oz+aOslka
	 iwJPtAW9m4zXEgyuxpQ3lYbJ3AlArlD76+a1vQOGV/KANepi2Ry14QC/9MzP91S1UT
	 wLgWn9Fdya0bfZYM+SKefTs2gd0OMJkUw/ES0JlzxHtDG2PTZECcMFE6w7u7KYFACD
	 IfNz5uiveCwjg==
Date: Wed, 26 Aug 2026 09:49:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of/irq: Fix device node refcount leak in
 of_irq_get_affinity()
Message-ID: <178775574382.1671000.5038505419473588527.robh@kernel.org>
References: <20260826112234.1033974-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826112234.1033974-1-fuad.tabba@linux.dev>


On Wed, 26 Aug 2026 12:22:34 +0100, Fuad Tabba wrote:
> of_irq_parse_one() raises the refcount of the interrupt controller node
> on success, and of_irq_get_affinity() returns without putting it, so
> every call past the parse leaks one reference. It is reached from
> platform_get_irq_affinity(), used by arm_pmu, arm_spe_pmu and
> coresight-trbe.
> 
> Put it once irq_populate_fwspec_info() has run: no in-tree
> ->get_fwspec_info() returns a mask that lives in the node.
> 
> Fixes: 5404f5c06dd4 ("of/irq: Add interrupt affinity reporting interface")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  drivers/of/irq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Applied, thanks!

