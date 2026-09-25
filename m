Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1CD4825C1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339435; cv=none; b=fIKGlIItwMf7nr4DH6iJcrnQOnjIdu0yHIr0KDPb7JbOdjClrRznQa0y00eKtti9hS+Kd3DUBwwblsOB5QC8LaT2QA4/Gle2UFnIgL2S5cTlvRDhEH9y/3vnOArT2bIBAMtym+S0ydbhoNwbIC0PEi5tLgn6zwMExdSBoD56GyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339435; c=relaxed/simple;
	bh=LUoDULbeAmVFn8GVNo7EZKcLNyZ0ZR0Y9ydjWuh5Sm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSaFqLTFCnHdwM+PRfsabre4czENFKt8ctiLxHWLCCqLjclnr+u0ixUj/VAwptVZabCAhSnOlycjDCPImNZbnmvOIjqxbGsD30iS9iWlScq3nzUpN0vFXdejXGHoTZkDPFPePvAfqPU9SKKqKmHGIIUn5gQvoovY2kXGBsfOWK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jvD9WR10; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jvD9WR10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4rHU
	MvsohuKMD7j/vbMX/ACnA/Knzn/24tCErnfx2D8=; b=jvD9WR10Do6hn8YQrGRl
	UZ8GiWJvMx7vkNRIG5vilrAcKBpNK91TSOZw8d2oJ2wLr6EVuzokavDCakQLU1EX
	XvtkdyjHe4exDdTfnaLsv6xIVZa7/eae6x70LaIk6V+vcJpdICNVIBke+FKVgqwI
	UTSf40XWi2vcOtlsApPEMJWn4gVTNAQ4ZZQdA2WFVci3dn6U3YEIzz7eYjAnXlxY
	CVOIIAe2pHwWdkxVweiaZ53/1RzEFRHizQCfEc0jwMu9GbWYgzx7OiovcAbAMoZ5
	ADIy4NgJ825M6otG/D63jnaOsdijg6k0XAbQGK70VisFOf/XXHFTQSUr3ZjGYnWQ
	lw==
Received: (qmail 1557948 invoked from network); 25 Sep 2026 14:30:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2026 14:30:31 +0200
X-UD-Smtp-Session: l3s3148p1@41/N4U1cPs8ujnvn
Date: Fri, 25 Sep 2026 14:30:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC binding
Message-ID: <arZpZolRwdU8zh6O@shikoro>
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v3-1-bd8054a5b180@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v3-1-bd8054a5b180@bootlin.com>

On Thu, Sep 24, 2026 at 04:12:47PM +0200, Paul Louvel wrote:
> Add the Cadence EDAC DT binding.
> 
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

So, my DT check runs have passed.

But one thing came to my attention just now which needs fixing:

> +    items:
> +      - const: renesas,r9a06g032-ddr-edac # RZ/N1D
> +      - const: renesas,rzn1-ddr-edac      # RZ/N1

We don't need a family compatible. Only N1D has a DDR controller.

This needs also updates in the example below and in patch 3. With this
fixed:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

