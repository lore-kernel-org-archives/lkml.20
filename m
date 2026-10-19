Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF0848F828
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406445; cv=none; b=fjf0qJmuScBUqlYvHuaKH5BmRACr2WEccpFDtS1gzZRXvkGAk/iAxK62hdTwxAMZsHEP7DVHwhRuvjxz2YrHbb2hZ8yATSR4iOJ8u/9fHUnUdYwZTVHViLyy1TN+yHc5dCV22HVzFhTirlFedX9Cw1DBgFuM/+b4oDOv7W3tCe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406445; c=relaxed/simple;
	bh=q6N5Aio8FeUee+E5prkHvtU2XRa+2nEtmXw5f1D/Naw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2uoLU4ovjFdX/QQvejHqn6mlhFKtI8NoHTkidZnGFlUAZ+1L8hmTMR3NS5M7Mf7pzuwhNY4XHE7rXVfLI+YESJroxmiFEu6qOmCMsgradOJq/Y52GybJ6xzCXRvrU2QTKV4ZAuACOToZvDh4IZL1cBWg11YfcRSfcQDAjD4avM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QcW07TuK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QcW07TuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792406442;
	bh=q6N5Aio8FeUee+E5prkHvtU2XRa+2nEtmXw5f1D/Naw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QcW07TuK1MwNhKhje1WJ+t3EqobvIzT4fFt8pAfQq1Ry+KN3bfWOxfxsjs65IfEmk
	 ZrxC/F2ps+CsAzZctOfBCOPkmyBxqWcSkrmwQu0toqCT66A2BbUUpIQ1XipUslbcIp
	 PxJVqnf72ATj0HUPRKkVC2ePYl5bufxR2sN6NZoRqtICeDZY651Yo6IvSasYq/e5M7
	 ANGyJfDkRiGMApo9VfGg6OOyNfojbu06tMsB0q6B1cUJlWN8Ub2NKabuXPgRv2c3ga
	 AYq8+JewqBnT9JkTAWaI0wvzZGwDqAf36KNNE0hgpthO/SN0uSfXGpsGx+X4zgYdWH
	 JIXlJmD21RpoQ==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DF6C17E0908;
	Mon, 19 Oct 2026 12:40:42 +0200 (CEST)
Message-ID: <1c2c222f-53fa-496c-a8ba-9717beb6dcf3@collabora.com>
Date: Mon, 19 Oct 2026 13:40:41 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/rockchip: dw_hdmi_qp: Advertise BT.709 and
 BT.2020 colorimetries
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018123037.19560-1-jan.claussen10@web.de>
 <20261018123037.19560-7-jan.claussen10@web.de>
 <039f91a1-7944-4092-9f9c-29b60e8fb17a@rock-chips.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <039f91a1-7944-4092-9f9c-29b60e8fb17a@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/19/26 6:19 AM, Chaoyi Chen wrote:
> Hi Jan,
> 
> On 10/18/2026 8:30 PM, Jan Claußen wrote:
>> Expose BT.2020 RGB and YCC colorimetry so userspace can enable HDR
>> output. Also explicitly expose BT.709 YCC as it is listed in the
>> Rockchip RK3588 TRM V1.0-Part2 20220309 data sheet.
>>
>> Tested on a Radxa Rock 5B (RK3588) with an LG OLED55B87LC in KDE
>> Plasma 6.7.5: enabling HDR switches the colorspace to BT.2020, and
>> disabling it restores the default.
>>
>> Signed-off-by: Jan Claußen <jan.claussen10@web.de>
>> ---
>>
>> Not sure if BT.709 needs to be explicitly exposed here, but it is mentioned in the data sheet.
>> Might be covered by DRM_MODE_COLORIMETRY_DEFAULT though.
> 
> Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> Hi Cristian, may be you would be interested in this series?

Hi Chaoyi, I already planned to check this out soon. Please note there's a newer
revision of the series, so I think it's best to move further discussions there.

Regards,
Cristian
