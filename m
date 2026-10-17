Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E814374E60;
	Sat, 17 Oct 2026 17:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257922; cv=none; b=DDKjTD+WXckIZf6ep5FgHZ9WUmG3Ua0pXiPYnUpPS9iBmNQuawPDb/2zgV0baJs5xvoo4M8DHsKoUQgV8B1Yln/HxQ6eiDFK3XEQ4FhsM3bM7WkuQhAn0cUlc9WlgXhEswzdn/RWD1GALee5PkSbXpM05Y1x7hd1T6plzf+SHNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257922; c=relaxed/simple;
	bh=bJJ3z4/pjAaEpe27vR8GsaDAdYx2zotHXmor2sXxykk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eff5u9IYHCJjefjR8wVQNCUdkpN5OZqzlTaLrUXSX621WTlINwDICu/fw9/aCf1tN5SpY8UeO6ckCh6AgArh04EIBjzpXWGzfKk3uixkLEkUvRxHTYhgJ6pmn1nM5oJelmA0btaEtRLuajo1cmpMHAi0RglTl5+I28/5K7zhcZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SARNoqwM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SARNoqwM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5883B1F000C5;
	Sat, 17 Oct 2026 17:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792257921;
	bh=5f/gI5h5KZDV5ahz+DubqH0u+kHWiemTT4qZvIm49L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SARNoqwM/PD9jQbMUNy5lcK4uolgw8lUHNblRsu+HBf6HTfwBR/cC3XAJFOmBXEBX
	 hsQLt3ym8bAsb+K1gkxCXQcc7VUaz2DkxstNa7s+ugTzGGHjiOpv3LckO3UhdDuZQl
	 xWRAB0A8OurEVBGn5/1J7C5vAZ2vvFCMFdFAA3tWOOCS3AGbeFMS44CtuN+UWZCVdV
	 44P07DRJ4JbQZ2M64aizX/OlcH0D2KBrjKf1OmSSHhsiwQ3y2vEcfcQvdrL6hMrlI5
	 7pFvMNGYW7nMmGHCZ/FdC4a2RlGEkiuJZgi3MaGkTdMMB2IgqvSI300JB9Las0lf2U
	 YJTaR/jPJ0LTg==
Date: Sat, 17 Oct 2026 19:25:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Asif Ikbal <asif.ikbal@amd.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, thierry.reding@gmail.com, sam@ravnborg.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com, michal.simek@amd.com, 
	naveen.gaddipati@amd.com
Subject: Re: [PATCH 1/2] dt-bindings: panel-simple-dsi: Add AUO B101UAN01
Message-ID: <20261017-delightful-gleaming-bumblebee-af40f8@quoll>
References: <20261016094638.2958431-1-asif.ikbal@amd.com>
 <20261016094638.2958431-2-asif.ikbal@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016094638.2958431-2-asif.ikbal@amd.com>

On Fri, Oct 16, 2026 at 03:16:37PM +0530, Asif Ikbal wrote:
> Add the bindings for the AU Optronics B101UAN01 1920x1200 10.1" WUXGA
> MIPI-DSI TFT LCD panel to panel-simple-dsi.
> 
> Signed-off-by: Asif Ikbal <asif.ikbal@amd.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

