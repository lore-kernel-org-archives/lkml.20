Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0628C4E324A;
	Thu, 17 Sep 2026 19:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789674287; cv=none; b=YtsAwgvN0USlmJzhx6GxC9dlApuSEUGGVuOZKlYcNnR98SEk0aVAJSCJQiN+NORdRIgX9yMUXUZ+pMCPR2B75gSrWESiqdKGMwXbF8luNMzEvAphyEyqj+3LTNTA+Y0ROUT0TvlIl9oaidpJ4pfo4q2fjthXvpu2UIEJFZKhOHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789674287; c=relaxed/simple;
	bh=W7p0FMBmB08LVAfB88b1d+TFEO3+HUCuzX8l2xfvM5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aprYBiSiyCuwrG8uYuRQGNoBGTdjJmpy19qCd0AuZeu0RSdgwGzR8R4+PUKgPCqSIxH6UTm1O+oG0LXQ7qbW/1fnrZyAzM234sG+xuueWHGFuxeojBN1thu2MOE7oC7y3/uvk2/TLgcj7xA2e6oSqnApPBUnPDzqrBWOLZ7ctWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqqcNAmN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqqcNAmN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8041F000FF;
	Thu, 17 Sep 2026 19:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789674285;
	bh=z07HpcYlhwHodL3ye2mQgooQL6Uz9WogsMUi++p1LaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LqqcNAmNWvu7NbTwoSvEh66Rea+4ZghlnyP0HFQoU0gzVEN2UZ6GV1IYz4jWhJv6c
	 XLvzky5mU1vPuAWcSWzmU57Bp/DNc9+OrYQaFu5i6EhYbSBSpsUxMRWu/zqD5FgK7Z
	 s6bzhKtIYm4ndidctAiZGS0MrXPG2wpuoJdFx7E0sRak6n9O1vhCFs3rTtBztF1bYI
	 KgaOTONmvV1NlbQQWa5sZSpEthvn3U5tP0YSJVBPMpUomsg/Ta45pVMI8iHmSLwFLj
	 h9lnGOjdoF9fx7cow20c8mBW0hnnl2T1BJnS7VoXUjs/+KbK0DH7663g0eu1PxIQ25
	 qVrxFmL13L97g==
Date: Thu, 17 Sep 2026 14:44:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: m-chawdhry@ti.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	Santosh Shilimkar <ssantosh@kernel.org>, mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, goledhruva@gmail.com,
	linux-kernel@vger.kernel.org, daniel.baluta@gmail.com,
	simona.toaca@nxp.com, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
	Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
Message-ID: <178967428309.3457234.10592434687912307277.robh@kernel.org>
References: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
 <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>


On Tue, 01 Sep 2026 05:08:13 +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments Keystone Device State Control binding from
> legacy text format to DT schema.
> 
> During the conversion, the following updates were made:
> - Add "simple-mfd" to compatibles matching existing dts usage.
> - Add required bus properties #address-cells, #size-cells, and ranges
>   which were missing in text binding.
> - Document child nodes gpio, interrupt-controller, and reset-controller.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../bindings/mfd/ti,keystone-devctrl.yaml          | 90 ++++++++++++++++++++++
>  .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
>  2 files changed, 90 insertions(+), 19 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

