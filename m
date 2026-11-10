Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315099;
	b=r5ss4CeAqNxVh3cdMCqJWbPnO4YL/Ao8P5bsfRw1wfOCj6ZeD1vDYBErCUli1sRcLmga
	 XEE0kpdXkX7pPCKWA6qf+K8k/uTuIYwaWn2GyGXgBwC0W1a6+HeiDX/NvR1OR6y8No5+h
	 NqvJW8reE4ozCEBiVJYlgc2ty/2gTDlnTauOxgXaUV6GypwOBW2ywzei8QLJRng600DoM
	 YbkCd4VN5e5ZQqy4yBp4jhuLfE3VqBn/CmUSswoHQWG8wooyrwi+ha9p0vVpjsxVJTAIs
	 znqqPLvqrkDcwt9lVDKIUpipzJyH8nKZDX4PiTpcl7Ppo/LC80sICwRlxRL0ay0ky1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315099;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aBuWKyi8wpUUUsRvXcbjJTpGAQmPtNPZJw1MUOr676c=;
	b=TtV9lQD9oiWdTCktRq/lAZYEfG6iwDvB2Ouu88BRNS0BoGc5BQIIEocp2gO0MK77OzL/
	 VS2MEm/p7I33YqwPlre42siMoAGdz7RRQ23ZXWyZifjfAo99fMtfUAGCp4xD2DuIxcYM3
	 t5SuuLo6FbS5ZqpcRIVZUirnQkxpchwlzBpqoBLyb/taQfad7CFxgkPnOaAume5ZYWwvv
	 dWSQFtPDgP0aUbUXxLEZEzaWtnxOiMncpDCbAxH7FfuD0sZaJtP29i4GF8ofxT5HsfByq
	 YNPWdFEYsXHAli0m7GlXbwc4amMLzBQ+SxbZw2PM9y6xUUEjLVxJPGyYX/ck7uRHSww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=UQifjXE1;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FC860A3812
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FC860A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=UQifjXE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794315096;
	bh=LpW8bnbyKPQsIeY/hUiu+2QS/IzXdlLbZKVOxKpxbxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UQifjXE1W2CoFx4GOn0ZY0QxRtwASNxchq9xILPVC9o8Tp+d2HErKE+aJhh/ZT9+N
	 /BWYTr/kGhlkEux5VcKX4dJtj2Rg7DCJlu7BTyIQBdQ/RR+rcSEq0s45UmJHbIrYBI
	 UuhHeiTwR800RTHvZLpbl5XX6H78Y+dD0rX44+YUh5Vn5W7NTQ6KlV9kK5zEW0RGO/
	 NUBQLTBLxOgTuo77l6gLPKtqKp5fJZaUYLNiYDIBmgdwhprlY9vgGz2H+7NhCud4HL
	 KhKZ/b5Yk2lh0mmvj9vJafpR31Q239MP1/yfkcjF77FY7JW0tLzgNnQElCnFjYozvt
	 zTlqf61Wmqvug==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BAA417E0634;
	Tue, 10 Nov 2026 13:51:36 +0100 (CET)
Message-ID: <c4ebe7c4-84c3-4c43-a149-cb04b18dc42c@collabora.com>
Date: Tue, 10 Nov 2026 14:51:36 +0200
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
Subject: Re: [PATCH v4 6/9] drm/vc4: hdmi: Convert to common HDMI 2.0
 scrambling infrastructure
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <lucas.tanure@neat.no>
References: <20261110-vc4-common-scramb-v4-0-eaa141a0da0f@collabora.com>
 <20261110-vc4-common-scramb-v4-6-eaa141a0da0f@collabora.com>
 <6044130c-8753-4928-990f-04f0ad43d9f1@igalia.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <6044130c-8753-4928-990f-04f0ad43d9f1@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maíra,

On 11/10/26 2:11 PM, Maíra Canal wrote:
> 
> 
> On 09/11/26 21:13, Cristian Ciocaltea wrote:
>> Replace driver local scrambling logic with the newly introduced common
>> HDMI 2.0 scrambling support:
>>
>> - Advertise source-side scrambling capability by setting supported HDMI
>>    version based on the variant's max_pixel_clock.
>>
>> - Provide minimal .scrambler_{enable,disable} connector callbacks that
>>    only toggle the VC5 HDMI_SCRAMBLER_CTL register, while delegating
>>    sink-side SCDC programming and periodic status monitoring to
>>    drm_connector_hdmi_{enable,disable}_scrambling().
>>
>> - Drop vc4_hdmi_reset_link() and vc4_hdmi_handle_hotplug(), switching
>>    the .detect_ctx() path to drm_atomic_helper_connector_hdmi_hotplug()
>>    which internally calls drm_connector_hdmi_sync_scdc() to trigger a
>>    CRTC reset on reconnection.
>>
>> - Drop the local scrambling_work delayed workqueue and scdc_enabled
>>    flag, now tracked by the common drm_connector_hdmi layer, as well as
>>    the now unused output_{bpc,color_format} driver data members.
>>
>> No functional change intended.
>>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> Reviewed-by: Maíra Canal <mcanal@igalia.com>

Thank you for your quick review!

> Feel free to push the series to drm-misc-next. Thank you!

Done.

Kind regards,
Cristian
