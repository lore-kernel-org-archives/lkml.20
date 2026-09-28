Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613472DF137;
	Mon, 28 Sep 2026 21:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630450; cv=none; b=XkVBohsOzeFfgI7dRfyrFNz80MNJWoFD5JQKMK+XH7pjv7YXEvVnt3UigBGt4SvX673t4gs6kfjsMGLVsyb+ZKsNK1lNspn985BfbWoeoNW+H60YQgZw3fpQBnEhNdGn/H+g6yrOkdbXQCNnUjyBfK5ofSdeN9+h1mTH+R6zydY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630450; c=relaxed/simple;
	bh=veWhafbKoPSWrVkGlp0BYlM5f32uFIODe7KaHQktFKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KaA9jDtJN5N0g6ZxWovs+Jm9slQ5FWTl5UkNcJpANWqUb8ED2FGe6ESZw8qVx2Wavb2kf633mMustojiiXb32CwIt1mLoPnclKbXO0uSZp6KeX5LJfJXK8KH671xlJ0BGx1c8AYbBsjcBc02NFQaLYY8vtAdLIllux0iGm/2VOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvQKz6+I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvQKz6+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD361F000FF;
	Mon, 28 Sep 2026 21:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790630448;
	bh=eYxD/haNIzLuR083lmQnWX3jttkXDH68DSQA7yCkl6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EvQKz6+IYGoqYv2yvmSxjPvf+Yop3XZLXxS2RFSHDUpE+ya8k4qlSNAkfsRP+C7zo
	 IGEFkBOqGXkhB48Ikg2ufieYzVAPmmP85u4cZxn/6d+mI8mD+H8/e5uYMUYEvUMyM5
	 qKY+hyWTjgYlciNPqSZeROLkHS8R/V94Ndo8pnGkaGsElJFqadXzbf1eE8t3V898BV
	 jqzKZaaeBKaHHB1r32os6mij6bV+DhsuQWFnorBFHX5N/BIzb4XlvHlZXsOQORy2UG
	 jfnL16dpkL+f3HSNI1woa1AWiy+tN9EpXXShKusmXtUIYxBup73TmIIkCuSmhtMnQ0
	 4Z+oWPIC1z1GA==
Date: Mon, 28 Sep 2026 16:20:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: mtd: convert IBM NDFC binding to YAML
Message-ID: <179063044641.731990.2506893904840369119.robh@kernel.org>
References: <20260926014802.87255-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926014802.87255-1-rosenp@gmail.com>


On Fri, 25 Sep 2026 18:48:02 -0700, Rosen Penev wrote:
> The NDFC NAND flash controller was only described in a legacy text file,
> so dtbs_check reported "failed to match any schema with compatible:
> ['ibm,ndfc']" for the ndfc nodes of the bluestone, canyonlands, eiger,
> glacier, sequoia and warp device trees.
> 
> Convert the binding to the YAML format so those nodes match the generic
> nand-controller-legacy schema.  Describe the node's reg, ccr and
> bank-settings properties, along with its "nand" chip node which carries
> the legacy partition layout.
> 
> The "nand" chip node carries no unit address, so the "nand@[a-f0-9]"
> pattern of nand-controller-legacy.yaml never matches it and
> raw-nand-chip.yaml is never applied.  Describe it with mtd.yaml,
> nand-property.yaml and raw-nand-property.yaml instead, the way the
> controller level does, so that both the deprecated partition@ nodes and
> a modern "partitions" subnode are accepted.  The node name does not
> matter, the driver picks the first child of the controller node.
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v4: allow modern partitions
>  v3: fix wrong regex
>  v2: fix reg value
>  .../devicetree/bindings/mtd/ibm,ndfc.txt      |  39 ------
>  .../devicetree/bindings/mtd/ibm,ndfc.yaml     | 128 ++++++++++++++++++
>  2 files changed, 128 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

