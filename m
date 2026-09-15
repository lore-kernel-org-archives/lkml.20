Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756EF414418;
	Tue, 15 Sep 2026 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469235; cv=none; b=pOuc/0CN0tGD3lQhkkjVEUIUGWyD0MyXYoisqPkn5m63mirDDVpFYjnwf1IuXu72NWdd/TL+UgHeIm3tnAkiH0fqaU2J6E1CjlufOEgrLxixtjc3PMHzaRt+52Cj6eIXCSG5TGX6oyGf4svO/ESSQDwYF6meCcKtd6VLZ5cqA8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469235; c=relaxed/simple;
	bh=ArJJJQdEiE9wAQnGMhG/mLwOiAoTr/tiy7VEkXV6kRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Op2/ulGRgm+1o8XOzp1iwic78g5Sw2SLCpagdxsX8WE+5MgiyQko8KxEW4/x9edremSLIqoYyYo1VVwuhPFuFmiCUMhBjqs5V8bQEJtL6XSEGItT2wNIwtUVOwXTbwS6Vov/+aCBFzTT7bCMEICpVn5QaEoI+G+TIPBJHY7xG3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ub6+Hfz1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ub6+Hfz1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F491F000FF;
	Tue, 15 Sep 2026 10:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789469232;
	bh=ArJJJQdEiE9wAQnGMhG/mLwOiAoTr/tiy7VEkXV6kRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ub6+Hfz1zCYkwdkA2Ww8nYSer2sJI+FnTty9FRt888udiLMIS6acC4PQLx+RSfALm
	 PcPVBMgnZuy1ybc2A3rKHoS14fx1lS33Jj5FEr55JuUqadNYd/hMVJSP5BXl5Ft+83
	 VFBkhjrM3NB3O0uuGw3MD2R1QlGz1/IgePjX0opMPrpjCMZxfLn7OHKeZg3MOgsa0v
	 KmtoMppw582eZLGMT8jSK46B//6yzHtTBgvHNXUto7x7YVN2DeFV3VzuJOvBVutDrV
	 uiFZ/dDfCH5d1phGmmt6aIB/H577Rlpv4Ok5pIPmz/aEkyZEKrLUVGYm8nRvBH1FYB
	 z7A1nR5yPzOjg==
Date: Tue, 15 Sep 2026 12:47:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen
 7 (Mahua)
Message-ID: <20260915-nimble-wakeful-stingray-5beaed@quoll>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913201835.250085-2-srinivas.kandagatla@oss.qualcomm.com>

On Sun, Sep 13, 2026 at 09:18:32PM +0100, Srinivas Kandagatla wrote:
> Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
> The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
> cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
> what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
> processors).

There is variant with X2E and X2P processors, and on top of that touch
and non-touch display. The first will be differentiated by SoC
compatible but don't you need compatibles for the last part - display?

Best regards,
Krzysztof

