Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9807020D4FC;
	Wed,  7 Oct 2026 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405139; cv=none; b=uJMRnrJPSqTRSSFLLETVrfuyUIS6oEBDpr2ARilwJzDNOlyySgaJJvy5N1jh63rEMz23GrSTvQrCy3/irTUH4gvR5BC4ExWe+SjNDz5JuIDimiQbak4BjQKkHyNqIqFbq6Ch0YWD+ibW+L1PNleIqTQb/Mq9tvmeNlnH+WNBRPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405139; c=relaxed/simple;
	bh=wYnZNF7HpQql6W9cKu0C3hSW7fhGRS4I+KL0/DhDHZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTS0i11KhY3yg65CXvZlrUb5JrmIBDMJEuEufFvXiHH28dmkMpaihHupXV+oEw9ECUSeFkLtwVzTDQNb2MoX541UKLs7l8GwLzkcAJkK7mZo2mjZ3U/e4x4vophkOBoZ5/Cn3+fmizIdPBgYMBSux+0TvFIvd7EGAVHTMlf4CXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKNO7A2M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKNO7A2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DF41F000FF;
	Wed,  7 Oct 2026 20:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405138;
	bh=33a7FuM1XA/yleJJfc/HZhNZxuDla2AYpsl5P+iHXX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JKNO7A2MR765pe+grZ2PwDrYvBxrTJNTe5/eXVMrPtt9NBTr1PswA3JFdtZsj2D9+
	 AcrQ0Mo4Rb+lTAyg5vIZWYa1j0spxHRdQn2DWKOWiBbduBrWCc5nEOOX7JIPB65oRZ
	 DzZXq4MJT6nce19y0xnahJMvuXmqxgMCK6rxTH1Uds53hwHTC3Qr4LrBXNDCc/qjM+
	 KBz1q03dLWGKSC2c1y+YiQ5vZWLCob48IFz+61808vcMjA5QcdZp1AmqaYqHHDBsWm
	 QLRhGcOsB9iSoH8TxRkod83e4Q0g8ZSnSqGyaykAlICm4MNk3UoKoRm03AR/C5Q22N
	 dnbolY3aXt9Tw==
Date: Wed, 7 Oct 2026 15:32:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@suse.de>,
	Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stefan Schaeckeler <sschaeck@cisco.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-edac@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 9/9] MAINTAINERS: Step down as Aspeed AST2500 EDAC
 driver maintainer
Message-ID: <179140513668.197997.15808651432801165459.robh@kernel.org>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
 <20261007-edac-v5-9-5c31fc5df4cf@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-edac-v5-9-5c31fc5df4cf@aspeedtech.com>


On Wed, 07 Oct 2026 14:13:26 +0800, Ryan Chen wrote:
> From: Stefan M Schaeckeler <sschaeck@cisco.com>
> 
> I am stepping down as a maintainer for drivers/edac/aspeed_edac.c and
> Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
> 
> Move my entry from the MAINTAINERS file to CREDITS to reflect my past
> contributions.
> 
> [ ryan: keep the EDAC-AST2500 entry and list myself as its reviewer
>   rather than removing it, and take over the binding's maintainers
>   field ]
> 
> Signed-off-by: Stefan M Schaeckeler <sschaeck@cisco.com>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Link: https://lore.kernel.org/r/20260920225846.4039017-1-sschaeck@cisco.com
> 
> ---
> Changes in v5:
> - Also hand over the maintainers field inside the binding, which
>   get_maintainer.pl reads directly for .yaml files.
> 
> Changes in v4:
> - Merge Stefan's step-down patch into this one, keeping the MAINTAINERS
>   entry alive with a reviewer instead of removing it.
> 
> Changes in v3:
> - New patch.
> ---
>  CREDITS                                                           | 8 ++++++++
>  .../devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml       | 2 +-
>  MAINTAINERS                                                       | 2 +-
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

