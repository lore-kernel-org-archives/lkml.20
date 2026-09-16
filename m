Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8C54756BB;
	Wed, 16 Sep 2026 08:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547997; cv=none; b=n/a5PZJiHIoFIJEbl10XNQPIs7YXOQfYfWVqCg3seZUttGWprVLXSNi8OrBHzAIk30j6IxfDAP5+eHjRXxNN0uacCci1fX/1mNNp1c7C1T/nyL61pwtHRVLtJpWD1ljmd0/RcgDxFWLoEgQ4v9BHeAz4KrI9a2SqRzhFwwx+EiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547997; c=relaxed/simple;
	bh=3d9vEQL5U/EjEkZjWdk5RLUywk+8L9OUQkNwHgb9I9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0IOujYYGf4BA6dWAuUSSBbBsipqEmTXvHHAYO2VQ7/A30ngHEVXZJo4lxer6hKEdZOzwdQSMewJ25X/5E7GPHvvaPme2Fltux8ZEEGU+ejIJQ2iduNJc0NogmSrNRxHFbHYxF9880OWEPj4FIJELLKe3AIDKi0aWimzeoGJsEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdrcA41Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdrcA41Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8D51F00898;
	Wed, 16 Sep 2026 08:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789547995;
	bh=HsXMM28LKRD2B9m0WnoroXOQzAFeaF5T1p/+DaZIXWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kdrcA41ZU9sS7uGGKY7YQcoMW2JCZ/yshFi3n0b7HX8hX2MDfyd2HV3NH3MHkBg8s
	 /RnvdDYZAuKhCMrdigmsQ9xpQzNn6WQi5FH7eZYldcradr3S+KTgNq9SBvgpro9kwM
	 UxrShG8pJnNUwr/uXQXNXscZR5zaeqoDhOsI1Q5vOyNvL48qrJglOfGFmVPV/f4N/l
	 MNX/wrSiAsT1TB7uZKWraGXBZDZZvcaH45HEUOlQDBgTl9tuCYvQNkC8Vasj3BkILC
	 NkL5BoPfWqyvdxV+YaRSfZwTn6wZW0ynlmmERzbb/Ecet40g4ebdHLejGLm99cledN
	 WuK41m+AS9z4A==
Date: Wed, 16 Sep 2026 10:39:52 +0200
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
Message-ID: <20260916-careful-imaginary-otter-f8336b@quoll>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260915-nimble-wakeful-stingray-5beaed@quoll>
 <9c09c1f5-cffc-421a-96df-753b294d63cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9c09c1f5-cffc-421a-96df-753b294d63cd@oss.qualcomm.com>

On Tue, Sep 15, 2026 at 02:41:19PM +0100, Srinivas Kandagatla wrote:
> On 9/15/26 11:47 AM, Krzysztof Kozlowski wrote:
> > On Sun, Sep 13, 2026 at 09:18:32PM +0100, Srinivas Kandagatla wrote:
> >> Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
> >> The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
> >> cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
> >> what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
> >> processors).
> > 
> > There is variant with X2E and X2P processors, and on top of that touch
> > and non-touch display. The first will be differentiated by SoC
> > compatible but don't you need compatibles for the last part - display?
> 
> I only have the LCD variant in front of me
> We could follow the Gen 6 T14s pattern (which already has the LCD/OLED
> split upstream) and two variant SoCs for v2:
> how about something like this?
> 
>   - items:
>       - enum:
>           - lenovo,thinkpad-t14s-gen7-lcd
>           - lenovo,thinkpad-t14s-gen7-oled
>       - const: lenovo,thinkpad-t14s-gen7

Yes, assuming the hardware has actual relevant differences between LCD
and OLED.

Best regards,
Krzysztof

