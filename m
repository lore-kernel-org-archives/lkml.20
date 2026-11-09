Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227973;
	b=vEEJWqaH6kp9qUUGctvnxkQzr9lI/ZArirM9ska0Vc9Ain1Qmnt+z8noZjbKkwW6kdAK
	 ActliHdCKwWpaHhTTNbcoTHSrcn/54fpP7r+BtpLKS3AlFaXkjIWUiI9kGU60IicSlvYc
	 VkodgcULkjre9K5OeXsFsLMWXo412URHswslEXnrYgM6ghImQcl5eqgps+95RUHry2u4G
	 mDREIis4rY1a6S9OZTI4n9wTIDT0cLeIQWdm3MUUw/jHVfV1bMxRD2Q0x9RmgxTZ3WECI
	 bFLRXtPZq2B8XYOTcZgtYgR2vDbD5GcXJpeA39DOSFTHDwHYUqUOW59aAGUcso1klkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227973;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7NsW7rrxSQb5R7oB9xUAueMweQagV7BfWEKuD5Xv8Mg=;
	b=Ec7l4gQoWml/ifpjNY/ANrsA0RVe+LYh/P7PAlPhIzEg8V4qVbBe7TW+jLRvaFQAGmdF
	 4J0PcLM+DFyNeThd1CkcLU8WQcAa53qJVolQduGDR6EMhCeAllzwfYbmlvpNcqKmQyPJT
	 5ZxMwiJlRCGzanwPK7rd2bs2xLMzIdUauPGs29JOfehQhOb9CXmnjwkj2ns74wFhauCzR
	 GlIk5AwepHOiaKm6gKOxQ5rkdk8YdhsosNFvRI+kmNyvIIIcL1X+HwdAXTXkCh/hL2Sm4
	 ooQ9DIgcVSYI0Wr8MaTXRxXDtaHs4X6zlenFpRSJhLxPdp68+ik1g5tUhHP3Qfnf5jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fxI4Jpsd;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3636E606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3636E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fxI4Jpsd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794227970;
	bh=SYFx4542py389igztUanI5VcIPWwi6M9GrC/elcvR9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fxI4Jpsd3g7vTSj46IWhYwEDBmQbgb3PPI7s5SdPEz7twavuZGjBiKftphJJ7Eflf
	 QNLg4yjUSTbRb1OWW9Y+oQkSrmfeeTp7c1qL4FbxVZl070dUt8dVOP/QXwVVCZ1cpR
	 X3+IRgjH/7k07xdd8KUs249PG9BR2FhljH/B6WreOZKKwqi7ZgDqihPYC+z5cySMiY
	 wty0hXwM6K8yzXa/l4P5d+ho2ltdBC9G8C9iq8Fu+HgKhWWK3feToXZgW9SpK1PXW4
	 /2Ibxqi0slNit3as5Z2XkEkwqTAsqNlpKN7weyibzZlrK7MLa2O0ujKIO5IkubszGd
	 YbtGQv0U6c6IQ==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8D59617E07E5;
	Mon, 09 Nov 2026 13:39:30 +0100 (CET)
Message-ID: <e9a58f67-d6ff-44a4-ab32-31e44e6f7f0f@collabora.com>
Date: Mon, 9 Nov 2026 14:39:30 +0200
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
Subject: Re: [PATCH 1/3] drm/display: hdmi: Prevent NULL pointer dereference
 in sync_scdc()
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
References: <20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com>
 <20261104-hdmi-scdc-scramb-fixes-v1-1-16a9bb3d64a6@collabora.com>
 <712f4d29-f69c-4130-9cc6-3efccacba3aa@igalia.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <712f4d29-f69c-4130-9cc6-3efccacba3aa@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maíra,

On 11/9/26 2:00 PM, Maíra Canal wrote:
> Hi Cristian,
> 
> On 04/11/26 10:26, Cristian Ciocaltea wrote:
>> The connector pointer is used to initialize the local variables hdmi and
>> dev before the NULL check takes place, leading to the following Smatch
>> complaint:
>>
>>    drivers/gpu/drm/display/drm_hdmi_helper.c:663 drm_connector_hdmi_sync_scdc()
>>    warn: variable dereferenced before check 'connector' (see line 657)
>>
>> Move those initializations after the sanity check to avoid a potential
>> NULL pointer dereference.
>>
>> Fixes: d653818324ed ("drm/display: hdmi: Add HDMI 2.0 scrambling management helpers")
>> Reported-by: Dan Carpenter <error27@gmail.com>
>> Closes: https://lore.kernel.org/all/arJo7A7L5hud3tyc@stanley.mountain/
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>   drivers/gpu/drm/display/drm_hdmi_helper.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
>> index f85cce3d6254..872f7e32e8d2 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
>> @@ -653,9 +653,9 @@ EXPORT_SYMBOL(drm_connector_hdmi_disable_scrambling);
>>   int drm_connector_hdmi_sync_scdc(struct drm_connector *connector, bool plugged,
>>                    struct drm_modeset_acquire_ctx *ctx)
>>   {
>> -    struct drm_connector_hdmi *hdmi = &connector->hdmi;
>> -    struct drm_device *dev = connector->dev;
>> +    struct drm_connector_hdmi *hdmi;
>>       struct drm_connector_state *conn_state;
>> +    struct drm_device *dev;
>>       struct drm_crtc *crtc;
>>       u8 config;
>>       int ret;
>> @@ -663,6 +663,9 @@ int drm_connector_hdmi_sync_scdc(struct drm_connector *connector, bool plugged,
>>       if (!connector || !plugged || !ctx)
>>           return 0;
>>   +    hdmi = &connector->hdmi;
> 
> hdmi is only used once (and you are going to delete it in the next
> commit), so personally, I would prefer to delete this variable in this
> commit and use connector->hdmi directly when needed.

Ack.

> 
>> +    dev = connector->dev;
>> +
>>       /*
>>        * This is normally part of .detect_ctx() call path, which already holds
>>        * connection_mutex through @ctx.  However, re-acquiring it with the
>>
> 
> drm_modeset_lock() here could use the variable dev instead of
> &connector->dev.

Well spotted, I missed it.

> 
> Anyway, these are just a few nits.
> 
> Reviewed-by: Maíra Canal <mcanal@igalia.com>

Thank you for reviewing the series.  Please let me know if you'd still like me to
send a v2 to address your findings in this patch.

Kind regards,
Cristian
