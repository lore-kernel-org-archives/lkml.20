Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226709;
	b=2JUFb8xNET8SgaXtMOzbiyaw14fahOPiyEYTOcknqaVOpIj27mTgQyRc+lfZGLivVyNv
	 /2bjbU8a5qlNL7RpJqi7OUhNLRkm6JJx5iT+S5e0uIBYSyDnVciYiyxPig/zhdN3ik17V
	 3ngYVfweOuJ8zBlMnMfr/0xGjl4/ErZYxOGVg0Dpm5PfMyAYu0DtcKDC71wKlS46HrVPd
	 aBr1i3+s5MwiOlFw+7/MO1vdjid3DRAE4MmIgTPaCygqgT6Zh6f9jkWuU3TyThNzRCn0P
	 NBsoKT6QDY63TTo8MQwaoZhWuCGN69luXp2KZMCVNDadKbuK+aMM7TNHwKqBkoBq/lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226709;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=YkOkSbGUSIfuMJtzJo2IhRv4GYV0LpiKAv0cetuHcf0=;
	b=Lqub55nAKBc3orYRz+g1Wp+eGTQQd++5VhQkF150XXDkL2m8BJk+x6fLa3WPMDn5aaqt
	 p2mWFnTpO4PqrLsq8kPkDAZOgq1ZCCVmxqClDCdIsLjZWrwuAylqbmjjSYcRwS8lcmKhz
	 1iF+OgYRo1sBpYvzoZPrXEUVgiE1H1Bo/rxW4AtqQjM15KcG8MpHQCZ3xdXKmVgC6EW7D
	 f303C5oJQIUsCXBX6l3QyhrqTUzh5TmCbY38bzgbc2Bt2DQATd4Arj5y4GD3w9meXzRhf
	 9Ie+m2o30j6BbrjC8WmNmNzewJu1wLKE6MszFkac2DdNVL95qWK+3ZJaK2w3D9edFuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WxKrjVq5;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4632E606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4632E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WxKrjVq5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794226701;
	bh=A9c8wLk68pTshZQz/4EWbcWbZwqzl037mBD3rbXZZpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WxKrjVq5KYnun6DyV+jsyo2vBe/kngIrZyr83nVUeDPwVNYAu2E6PKVi+jkytPvNM
	 aOqzGmw85JvBGfoZWUXn7RNH17+L/9vRNaMXtBA7gw+HCXUkQOsFbqr1NeqttdpuDY
	 sBB3DuMCFrA6yUm5OJ2IPqIyzukeiEQOYkWC6I9OlpbbNeOZhZbkDJLiczKlnA95kN
	 FDxmzaKW2SQ1c/n/r6FUF5iF0A8yhJzc1HBzlH2nMhIYZLR9839XAZzWekEouwX+bU
	 7ymL3dfbVhRCYESLkyg5q7xlF4b1ygCTg/FmvWtiU3+UeyMPS1rDg23AgPeWEy2MTw
	 FMnySmbmQIf6A==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9214217E0564;
	Mon, 09 Nov 2026 13:18:20 +0100 (CET)
Message-ID: <280e4024-f1b1-47d0-980c-4d6f067e33d4@collabora.com>
Date: Mon, 9 Nov 2026 14:18:19 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] drm/vc4: hdmi: Convert to common HDMI 2.0
 scrambling infrastructure
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261014-vc4-common-scramb-v3-0-c68d58d959a2@collabora.com>
 <20261014-vc4-common-scramb-v3-6-c68d58d959a2@collabora.com>
 <45ea1610-360f-4f6b-9ea6-30b28fbe8514@igalia.com>
 <8b1b7d8d-9656-4b3b-9f83-1526c8110ab7@collabora.com>
 <b60a42bb-b48b-434a-a306-3ac9189027a5@collabora.com>
 <e532cc6a-21d0-4021-9854-08963331223e@igalia.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <e532cc6a-21d0-4021-9854-08963331223e@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maíra,

On 11/9/26 1:53 PM, Maíra Canal wrote:
> Hi Cristian,
> 
> On 04/11/26 17:08, Cristian Ciocaltea wrote:
>> On 10/28/26 11:44 PM, Cristian Ciocaltea wrote:
>>> Hi Maíra,
>>>
>>> On 10/27/26 3:35 PM, Maíra Canal wrote:
>>>> Hi Cristian,
>>>>
>>>> On 13/10/26 22:03, Cristian Ciocaltea wrote:
>>>>> Replace driver local scrambling logic with the newly introduced common
>>>>> HDMI 2.0 scrambling support:
>>>>>
>>>>> - Advertise source-side scrambling capability by setting supported HDMI
>>>>>     version based on the variant's max_pixel_clock.
>>>>>
>>>>> - Provide minimal .scrambler_{enable,disable} connector callbacks that
>>>>>     only toggle the VC5 HDMI_SCRAMBLER_CTL register, while delegating
>>>>>     sink-side SCDC programming and periodic status monitoring to
>>>>>     drm_connector_hdmi_{enable,disable}_scrambling().
>>>>>
>>>>> - Drop vc4_hdmi_reset_link() and vc4_hdmi_handle_hotplug(), switching
>>>>>     the .detect_ctx() path to drm_atomic_helper_connector_hdmi_hotplug()
>>>>>     which internally calls drm_connector_hdmi_sync_scdc() to trigger a
>>>>>     CRTC reset on reconnection.
>>>>>
>>>>> - Drop the local scrambling_work delayed workqueue and scdc_enabled
>>>>>     flag, now tracked by the common drm_connector_hdmi layer, as well as
>>>>>     the now unused output_{bpc,color_format} driver data members.
>>
>> [...]
>>
>>> I'm going to test both fixes and send them out as a separate series, so we're
>>> not blocking on it.
>>
>> I submitted the fixes earlier today:
>>
>> https://lore.kernel.org/all/20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com/
>>
>> I'm waiting for Lucas' scrambling patches to land in drm-misc-next so that I can
>> rebase this series and send v4.
>>
> 
> I believe Lucas' patches landed today in drm-misc-next.

Indeed, they weren't there when I checked earlier today, so thanks for the quick
notice.  I'll prepare the next revision.

Kind regards,
Cristian
