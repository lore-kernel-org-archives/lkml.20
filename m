Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9784A5EB9;
	Wed,  2 Sep 2026 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365151; cv=none; b=T5mbHDL9fwV+ZOGPNPstDiN+ihdQyIRfxsy9ybPinVzR9hZW8thXT4Rit9ovg1eorWzQS6P2gzRrvrmP60vpT3qIICMTeHWDlLYx7TnPiWArc28NE6OaKSbynOMSJNfwSeIzvprKe4WxtB23PUDb+gB+ju3m0Qg+dBXWiXqoVTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365151; c=relaxed/simple;
	bh=N2jiLEUsU9bW+7RDlZiQ8Gp5KKCNI22HvfJGUX2zlvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7NryvJ+msQ2PbNjqNm3v3o+f+Wq5A24pJM/EsYK7jXjgwlm+IqT6KHhVZ7+qjW2PPVI44+bnkVzIcrNGwtBDuGFfPpeXndaGkI2ilmjabCI1MDmPGxwNvAJrs1RFChDZsM24ze2t4MjfHI9Ms0221Q2DxQ8HOg2W2BlHv9uWEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+hs68wr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+hs68wr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFE21F000E9;
	Wed,  2 Sep 2026 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788365149;
	bh=EsBCpby5cP3EVqfoQ56dPnInTrDq6I0O0hcKYWuHpGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g+hs68wr5C4K+6FIbXUKb/DVN58+U9LvqjVXSKkMnaS4AcsNrP8b4k3AeADGMwEaw
	 GGWHDSX5AkmZsTXZdi5MH/V9cRHfw/iZ4g+prW5EoLyqCg1mlPgN7jeYCfXcngCQX+
	 iSWYuJd51Tagb+GofcYMUChNHXjsL0EYWMdvIMyAofdIA1OT+rdLXBFKnuChmKChHs
	 dkQiKp/cNmy6NA/rYNmhJyCPVWBRSt0IBCg7ikPxoUG+yDGNvPhqUhMGifHnkzqpIS
	 hAC9UFHeXqEQWwHhHqxnfLI8GQNGZ+R0rLKJPGDlgpHv17kYFyw1T6o+sRuC7+acXJ
	 FUCwZe9adIljA==
Date: Wed, 2 Sep 2026 18:05:32 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: actions: owl-s500: Replace spaces
 indentation with tabs
Message-ID: <7jjnsbrwjqmkgo3rl6urmjeohakl2e6uy7ugdpju5auc4kdczv@c2bvxkxo2jf5>
References: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>

On Sat, Aug 29, 2026 at 09:41:41PM +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Please take it through ARM SoC tree.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
