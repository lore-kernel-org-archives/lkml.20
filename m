Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D813AEF51;
	Sat, 12 Sep 2026 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789214720; cv=none; b=nkCHNvTY4sLu14vfeY06Z4k3ir0g46KHBqUiuMH06/y8/3E/GlR2T28i8flDOTItI/SHIgLeO75BtDjswXt1kzdELrN51L381Y6Y0luUk/v2GMTPoB+K80S/5peiP/kMbOkO6WI4ka9YHMjsv6ei3DNINOKlJj8U4jvpXu6SRl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789214720; c=relaxed/simple;
	bh=GSqIFDfqDHUzvEFDDSz/346ZUmRNMp/AsdyBf2HLU/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WecOXuAQF0LSCW/S8Nuc0XEiA0ompOdHSQZDkbVW/dfpgRpn0tufyfjueW9GldNZGMlvTbP24LAqWDHllztX/RKpl9u05wEQGhmZcuUXRR7DTwhbEvSCgj46ThJxkyY9d3qlJ6ZA7OZurLr5qUKsGxw1+1QYULid7Iim/V6YMuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CDPcNiOK; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=9Bh6pzve; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CDPcNiOK";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="9Bh6pzve"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1789214702; bh=u8myC1jiNWPSND6jaTeBmI/
	7+nYxV64Z9V+k1jO42CA=; b=CDPcNiOKxzam1w59NACzqglFRzHlZJHJpGtTUPCe6UEqyJdC8k
	RyNWSFZjyTl0mJl8gpuHiYQuNNiqElfdekfhPu69bYCa7vFz7H3dlIVUk4WgAh3S91TANUgZAYo
	rtm79YKx4fH0MM2CRe2ZNnE9gvOtmyxxO/7OwN1EEjU48mnSZgCaQrD5IKiOgkxV/Kfu9EMV+wS
	EqhuChLx8CYqUtxyPSzubOZd577Ey/3znCztPl8mVm56d2PpH/jCovZS+7nLRIyCNxmSFYFgfir
	aUulVXltXJsJQIItBHdTdqgBopTBysZ/7zVjpT9ftpXz5nwBAmv2yCeo63flo/kOfXg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1789214702; bh=u8myC1jiNWPSND6jaTeBmI/
	7+nYxV64Z9V+k1jO42CA=; b=9Bh6pzveTujNlEp2+e6BsPCiNakHL77NBoD0zaKhBnPvNg9KQt
	CRubo/CUdZE57jEO8ZaOyh8okG5VT/BeffDg==;
Message-ID: <6fc67e27-a36c-4974-96e4-1f68b85b3114@mainlining.org>
Date: Sat, 12 Sep 2026 15:05:01 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Novatek NT51021 DSI panel IC driver
To: Ryan Brue <ryanbrue.dev@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>
References: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
 <56dcdf77-2a82-4efc-888b-736f512e63f5@gmail.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <56dcdf77-2a82-4efc-888b-736f512e63f5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


12.09.2026 05:58, Ryan Brue пишет:
>
> On 9/11/26 10:37 AM, Nickolay Goppen wrote:
>> This series adds support for Novatek NT51021-based panels
>> for upcoming xiaomi-clover submission
>>
>> Although according to datasheet, the IС has three power rails
>> in the use case of xiaomi-clover, all of them are wired to one
>> fixed regulator
>>
>> Maybe I should create a dt option for enabling CABC for panel
>>
>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>> ---
>> Changes in v2:
>> - Use devm_functions and renamed structs and functions (Neil)
>> - Added delay before deasserting reset for stable initialization 
>> (Sashiko and Ryan)
>> - Fixed dt-bindings (Sashiko and Neil)
>> - Added a comment about set_display_on command
>> - Link to v1: 
>> https://patch.msgid.link/20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org
>>
>> To: Nickolay Goppen <setotau@mainlining.org>
>> To: Neil Armstrong <neil.armstrong@linaro.org>
>> To: Jessica Zhang <jesszhan0024@gmail.com>
>> To: David Airlie <airlied@gmail.com>
>> To: Simona Vetter <simona@ffwll.ch>
>> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> To: Maxime Ripard <mripard@kernel.org>
>> To: Thomas Zimmermann <tzimmermann@suse.de>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: ryanbrue.dev@gmail.com
>>
>> ---
>> Nickolay Goppen (3):
>>        dt-bindings: display: panel: Add bindings for Novatek NT51021
>>        drivers: gpu: drm: panel: Add BOE NT51021 driver
>>        MAINTAINERS: Add myself as a maintainer of NT51021 panel driver
>>
>>   .../bindings/display/panel/novatek,nt51021.yaml    |  89 +++
>>   MAINTAINERS                                        |   6 +
>>   drivers/gpu/drm/panel/Kconfig                      |   9 +
>>   drivers/gpu/drm/panel/Makefile                     |   1 +
>>   drivers/gpu/drm/panel/panel-novatek-nt51021.c      | 791 
>> +++++++++++++++++++++
>>   5 files changed, 896 insertions(+)
>> ---
>> base-commit: 99cc957e3ef3cccd72d2119c8eacbab39af0d1d6
>> change-id: 20260829-qcom-novatek-nt51021-panels-e2f9db85a967
>>
>> Best regards,
>> -- 
>> Nickolay Goppen <setotau@mainlining.org>
> Hi Nickolay,
> I have patches ready on top of your v2 series for the Amazon Fire HD 
> 10 (2017)'s panel; however, given that Sashiko has found an issue with 
> this series, would it be best for me to wait for a v3, or would you 
> like my patches now to incorporate into your next series?
>
Maybe I can incorporate your panel to my driver.
> Thank you,
> Ryan

-- 
Best regards,
Nickolay

