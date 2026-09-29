Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0A64EC66A;
	Tue, 29 Sep 2026 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675505; cv=none; b=ooIP6ZIxKNlP9YuzJw/7dydbBOBrMn6UGrkRw3blVUCZyy02OT85OMs8BB9jc2mq4H+8RNRJGYc2Mlvd5bMIluVJ4xZ+cpeACNtDVQYQMUU7HTHVfoLLdIgMDp8UqabZXqP8vWighV4ce1AsX8S0H9XXNHjTvoBZCDVP2ZGbUSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675505; c=relaxed/simple;
	bh=chsMDfWcCsf41LNrw8SxtL+jtZqNyI9Kl1R4xrsiCi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gOmYn3GUyPuaoAfFn43qor7pBW0HRcgaT2RkGOINJ+chSm/kXJliRvREdVMdBfi0ZkDYZUoLxSbeA/anCXt1Y2uNwzalm2A7dL1u2/Nj5dlKjAecjJZ9Lo44TG1BU4eRl0S+B3T1zmOj8Q9lWG+/RUM5D8ZjdSqTYwl7WtTP4QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgMPglGg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgMPglGg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2031F000FF;
	Tue, 29 Sep 2026 09:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790675502;
	bh=rjxi7vnicO9Bn6FaQImO+PHPnJ9/p8cEP6/V6gAY1qM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UgMPglGghdbup+cDyxbdbC+c/5zlJ7gUUKrC/CL2ux1p+ZSlTvBMb3mfeVNTSxJ4A
	 ltE6GIfwe4Q1AJqmbxRnxG8Y8byNiQfcrO88rruj8gJCdiicAwQeA36Ws7CYflH+UY
	 XtNXeEKFFCgKP+IxXckxpHZgZXBvKTeGrR81zlf0ZapbQbbfkA23yYWOHmTDQbqXly
	 c4X698xvpvwu38JzGCTqHusJeiQ1ijevmDRt0hggZnmHLHD0QMpIjmf+RMkI6Oa1DI
	 wjwr2GLkvCp0WXaHfQaCpPkgXG0cZ1Yd/P3ilUwPqyAVBjnxzA6c3cGUpiKI/O7wEl
	 mozwuRzLb0tnQ==
Message-ID: <b7d5d018-116f-46dd-b037-4d46c25a8435@kernel.org>
Date: Tue, 29 Sep 2026 11:51:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] drm/panel: s6e3ha8: Correct the polarity logic
 within
To: David Heidelberg <david@ixit.cz>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
 <20260924-crosshatch-panel-v2-6-08d5c7bf72fc@ixit.cz>
 <20260929-dramatic-ocelot-of-support-2aa377@quoll>
 <d1183441-ee4e-4700-90d9-996769eaaa11@ixit.cz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <d1183441-ee4e-4700-90d9-996769eaaa11@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/09/2026 11:41, David Heidelberg wrote:
> On 29/09/2026 09:45, Krzysztof Kozlowski wrote:
>> On Thu, Sep 24, 2026 at 04:01:34PM +0200, David Heidelberg wrote:
>>> The reset was introduced with wrong polarity. Correct for the future
>>> compatibles and keep current with reverted logic.
>>>
>>> Old DTs keep GPIO_ACTIVE_HIGH and are fixed up via
>>> gpiod_toggle_active_low() on the deprecated compatible.
>>>
>>> Assisted-by: LLM
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 23 +++++++++++++++++++----
>>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
>>> index 5e1e997b83b36..99290913de69a 100644
>>> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
>>> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
>>> @@ -20,16 +20,17 @@
>>>   #include "panel-samsung-dsi.h"
>>>   
>>>   struct s6e3ha8_desc {
>>>   	const struct drm_panel_funcs *funcs;
>>>   	const struct drm_display_mode *mode;
>>>   	unsigned long mode_flags;
>>>   	const struct regulator_bulk_data *supplies;
>>>   	unsigned int num_supplies;
>>> +	bool broken_reset_polarity;
>>>   };
>>>   
>>>   struct s6e3ha8 {
>>>   	struct drm_panel panel;
>>>   	struct mipi_dsi_device *dsi;
>>>   	const struct s6e3ha8_desc *desc;
>>>   	struct drm_dsc_config dsc;
>>>   	struct gpio_desc *reset_gpio;
>>> @@ -62,22 +63,22 @@ static int s6e3ha8_unprepare(struct drm_panel *panel)
>>>   {
>>>   	struct s6e3ha8 *priv = to_s6e3ha8(panel);
>>>   
>>>   	return regulator_bulk_disable(priv->desc->num_supplies, priv->supplies);
>>>   }
>>>   
>>>   static void s6e3ha8_amb577px01_wqhd_reset(struct s6e3ha8 *priv)
>>>   {
>>> -	gpiod_set_value_cansleep(priv->reset_gpio, 1);
>>> -	usleep_range(5000, 6000);
>>>   	gpiod_set_value_cansleep(priv->reset_gpio, 0);
>>>   	usleep_range(5000, 6000);
>>>   	gpiod_set_value_cansleep(priv->reset_gpio, 1);
>>>   	usleep_range(5000, 6000);
>>> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);
>>
>> This breaks all users and this usage of ABI was already released.
> 
> See the gpiod_toggle_active_low() usage later in the patch which keep the logic 
> for the original compatible as intended.
> 

OK, I went way too fast, that's correct part. But splitting fix is still
just confusing. Backporting to stable is a different thing than fixing
issues.

Best regards,
Krzysztof
