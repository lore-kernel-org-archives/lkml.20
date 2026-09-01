Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BAA46DFF8;
	Tue,  1 Sep 2026 08:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250975; cv=none; b=SclsQn0KQsJIsW2U0g3hQOHon6/TC0zM4pOsjQa2qDbbQvRsIs9AtwtN5R0wWwTyRJO/dM7AgF+bzXrTbrJeDn7x7o5ybfznkflAqZ5Ad9+8bv0sOxLAO27npfatYaXmeKgRrWwiowwu/fZGFO3F/L2T0UTXL1FU21fYR0o/zd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250975; c=relaxed/simple;
	bh=JCq3HZrSfyNSm8OB48BaK8xpHO5+8asWwrSUnVWqYN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5VG6f9g42u7McRyfEuWw/Lu/1YAZonv1GEMBypzQGfvDLnYVX4R6UpAURIlD88W26CvJmTjE8g/tfdHkGwUmwcMa8JeW8B0Ag+/CAdvH72SLtCCzSlZ7UYuB3SjZ4EnqTfFyDjguBxpRVBK9l7EIeBmv55+DWr9x9KfGFuWxeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rj/JzxM9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rj/JzxM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4A91F000E9;
	Tue,  1 Sep 2026 08:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250973;
	bh=q73ZyBig7ZTI2wJFnLaE16Zu6HRdWvbumojpjUQZPEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rj/JzxM9dbsZGuThV5mZTR3OELAINWrqtNZKU8rPExX3s4+RJCGsPqjWWpesM6WfD
	 vQkRmgUd2x0Ck+l/CF7VA0HyHu8EC6KpYaqJliNa6sMXhK4xPwE8ArPy7MFHGNPY1g
	 vab1Z5NzbroZgVerpMIK4q3PHjGR05JJESArykLAe/jKIGPRq5jqaP4gvYe/zTDEF/
	 mNJKBFmlj+uIFQtCFMUEIfJQsm52xQgr+CgCIQf+ILpZdySyAW/CKildDuUaqAw0yJ
	 JZIL3rY2GReaZ7ZnXAFhjTByolKIw3J3TtWm9S5eE5/SGpARLW29fSmJPgQrbFCFlx
	 qTLjC3qn6nWKQ==
Date: Tue, 1 Sep 2026 10:22:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev
Subject: Re: [PATCH 2/2] dt-check-style: Handle indented fragments in
 indent-consistent
Message-ID: <20260901-platinum-dalmatian-of-intensity-b18743@quoll>
References: <20260830-b4-dts-check-fix-v1-0-e7c1b2774730@kernel.org>
 <20260830-b4-dts-check-fix-v1-2-e7c1b2774730@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830-b4-dts-check-fix-v1-2-e7c1b2774730@kernel.org>

On Sun, Aug 30, 2026 at 08:24:55PM +0200, Sven Peter wrote:
> diff --git a/scripts/dtc/dt-style-selftest/expected/dts-fragment-indent.dtsi.txt b/scripts/dtc/dt-style-selftest/expected/dts-fragment-indent.dtsi.txt
> new file mode 100644
> index 000000000000..84ec8eb73468
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/expected/dts-fragment-indent.dtsi.txt
> @@ -0,0 +1,3 @@
> +# mode=strict
> +bad/dts-fragment-indent.dtsi:9: [indent-consistent] indent mismatch (expected depth 2 * '\t')
> +bad/dts-fragment-indent.dtsi:10: [indent-consistent] indent mismatch (expected depth 2 * '\t')
> diff --git a/scripts/dtc/dt-style-selftest/good/dts-fragment.dtsi b/scripts/dtc/dt-style-selftest/good/dts-fragment.dtsi
> new file mode 100644
> index 000000000000..58735112d3aa
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/good/dts-fragment.dtsi
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/* Include fragment indented for its inclusion context. */
> +
> +	bus@10000 {

So here is a good example... and this is code is wrong.

You CANNOT have MMIO node outside of MMIO bus or a new node outside of
root node indented with one tab.

Best regards,
Krzysztof

