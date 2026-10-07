Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7968F4BA1D1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388842; cv=none; b=Qe87UjqBPUBZ26YjVv7z9XoV1SfxXXtyrn/0ulRlQY9J+UwUkYP32hyF3bcsXNSMCjHDUJgI9RC2Hd7pvG52zxBrJZDRkUsx4/NvY2UYmBWAGEVW4dE7/nxnt/WvZ8JNzAxeHQQ5gDiM3meClszKW5UaXHs8wtNxftiI7pocju8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388842; c=relaxed/simple;
	bh=kg+pnRmeiGGzw/dKPP+8Z+G6AGdoKb32TBWWrn6/+Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wr4z/9mdPlpc1xYIq9C5jTOqov1lOJ+YwFXr7d/m5Se1E63JeT4jW3Nahe6JIkdmkiYJEvsCOztf5ZYKsFfgWLt+VWxX/vb6pBB01nNQcZdNsMFNoPo8njasij1nC9wxVA6hjefqlm5YY+NaMMJdg67v0P+XmIhSAwBNQAGkKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjm4rbZG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjm4rbZG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3433C1F000FF;
	Wed,  7 Oct 2026 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791388841;
	bh=1hzE8l42kMvGHsHdjjuvG2qK0OUn3rwYSCbR/mFVgz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mjm4rbZGk1SVskA+7I7PsZIc9994CSwUwxg/LbqbkbB2H7LKXMxjloV4ca/LxIdgp
	 K+CldSMzv6CKGAq/HRYX4NqhepKZPTCzBswGZMAmFusWc2TwUJbKKltZVEYpJA20pl
	 7OH1/CldDS5YtX5H8yx1Z/MX2N4qmX60Yn+8QalZm9KGtcyxvK+CGd0Y9yoyXDFMix
	 fR8G7Y9eTc2ksFuo5jtbzRh3BTDYkBgfsXIeV3r0a/K8B4OIWpHCV/ei63JLXNWuax
	 9/Qrb/EkqLYUSYYE91R7egH5g8eZxopfhJkrdlCIRFD1GWN9TavDKo/aE/mEfr+FQm
	 UJx5S5TQohPWg==
Date: Wed, 7 Oct 2026 18:00:34 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
Subject: Re: [PATCH RESEND] phy: broadcom: ns2-usbdrd: cancel delayed work
Message-ID: <z44qoeq4c57cc4sxjxkceeomc6gcoytgvaskmnxgefh4qy6eha@txcphnrhcmx3>
References: <20260728133418.103-1-getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728133418.103-1-getshell@seu.edu.cn>

On Tue, Jul 28, 2026 at 09:34:18PM +0800, Hongyan Xu wrote:
> ns2_drd_phy_probe() initializes wq_extcon. Both GPIO IRQs and the probe
> tail can queue it. There is no remove hook, so the delayed work can run
> after driver-managed resources are being released.
> 
> Add a managed cleanup action before requesting IRQs. Devres releases the
> IRQs first, then cancels the delayed work while extcon, GPIO and MMIO
> state is still valid.
> 
> This issue was found by a static analysis tool.
> 
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
