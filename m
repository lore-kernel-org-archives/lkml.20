Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819006;
	b=tY7UUkmnwYKPBVoQcc/PHpKxOPDTlGNMz4dBNDJLqFAfyAUu5UlYw5/2t+ABiTGxhz06
	 tz7mzoYNbHVyPTWPMEES3Wt24juo1bCDmARcoIAbLN8jaEeblQ4A6PCuZDwYmT2ffVcun
	 3AqViRf7U0wGSHpLPvUGelWjvJkdKmWdO4plHKwaFg/fOjDeGk+4lG8Aglksw1aCPRna+
	 /p7ma+janpfIZq08IZ9+LXTEAyYmHgaNLv64PfUKnS01mWprVMdUEa5uxQ4jj0SiD5f+Y
	 4fyYyHL+kJrUZi7ioHZ8uH/30xXFOyjomeYfOMy3Qp0Kq+h3QKgXyEAavsT7TvmtoHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=OLEYM5/Ge5Y+DVw/IRXDnmBgDl4ccX4rWqykyHVmYlQ=;
	b=bIQqwKFbk0r+3ig1URY7rHLhaUX+/KwPX/qWwyW7sYWbHW0POqYeWLt0Mqj6UMRkhr2H
	 +NPUc4Ud1e9zEthf4Pozn5xXTRSzYfoeF1Inj6mT4ZhTIixkFzGjlc2PjVYAZ9Qrccwnz
	 qCIDv0haivatI1D6rLmVeL335YoR0isH3RytDS8EydyG2e0zDgPyLeaf8+xZUyLXB4dBj
	 bjmvZfZuI79p5yPFFwLNSOaZJAkIXF38lMPOyiyR6A1j99/T25WV8iNGAifiAVnlB1kLG
	 c5orp2nxeMkutdIkjmCMFM+3Cee7SgWSoUrjeSc1JVWKwIcHnEGKET1JiX7LEpkYL+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmlFcXp7;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98926606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98926606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmlFcXp7
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so5887895e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793819004; x=1794423804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLEYM5/Ge5Y+DVw/IRXDnmBgDl4ccX4rWqykyHVmYlQ=;
        b=XmlFcXp7qE3I0DShuUCDVym5jeQktJM+Xrfy6YmxfY/LJ7aRh17iAAGrZt0GkpCCbE
         +uwQOHYFb+fvWSwI6riokqatiSUtSWgy4kBCxbX6LoQfM7w22DeWrgEMows4wtZGn7ZL
         ZDF8pDkM0nDY9M0XBYsicTbM4TI5XWVV3ucqRVyfxZ9RuocSQ+FbnXRVHhY+msL7qPPP
         Ov9qBen/a9rLavDlkVt/WXAAraZDgTZEpU+Hl7+qsG82y4IhnAQxolQCcrXI8bJ3jJeW
         XlQLW8ktoWtGh/4QAYPCbV0vqdR18oBtuS8i9s8ceEA79WpClFv3C0CaHvcx4yR28woE
         qKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819004; x=1794423804;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLEYM5/Ge5Y+DVw/IRXDnmBgDl4ccX4rWqykyHVmYlQ=;
        b=Se1TWXQeSVZWdkxA/qywy2XJnFZPoQXt7Av7jgBgdq7X9bVdCWnBIFhKsz82bRg89s
         tID1uyHyvxoXBPARUgpRz4SMjWE8ch/2yhiNuayCHxohmAh98uIvnMba7U2AY15ORmyT
         oEQMKfxoAqGIksXw5L1pBHMPULk0e8Ha0/Fluz9OJiz/ktLoG4sS+9jFGFIRPUOVT1Rr
         IKop6Sa4KACAE9USLDYevMG4mNNxcyhrRoDrvJvlUsFhJ91YUnfBLIJbZtA7H5ABc7Df
         ZrK//bhD86Vz2PARiZhl1nngCLmrNZw+fT4+gi8vg8a8TnFfl9+qfO3/reb/ROIWsxFj
         ysLw==
X-Forwarded-Encrypted: i=1; AKwUvBzLrHfnJ062Uvgu5Brfen9wtl4pOzAPMDzuu1wORBjFcvqUMOjur+lwVHUUNcNCtC0Hvk3ZE+QJG0/OQJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OghtUogrfvYGWCxIwdsb+M5QWdK7X3s13ZtfCNBw21h7ypXmV
	/+Mr9fH4RreFzayizZWiXajL0Fvy35MIGJn4DE1kvHdYDFmbhu7DGSjf
X-Gm-Gg: AYBFou2O54zPRh1d16YD9LeEA8sygykDkhMADMsEQc59grne+NUuhlat1MqyIFoGrCR
	t03lzOxWqRjjdxan5C5Krb+Zw9DRVLLMgraQlDWmOoc9RE7UzzFkUy/ZfBPyJVjTPxMvgupDcnQ
	IMkF58gkRRfLoVQN+wd3JfIoTCjer18TY31IICQLXR9EdLVFt2JIGYbF4smwqce+B2Di8VW2TbI
	Kl9Y5cOpidhG18YLMQbbuPk+QlOdm9uSwwefrxV8glNsc3AQLbp/MkvdFoMjakM2prRoy4+bI/F
	I5NuH4egpUDDnWZYji3MZ4Ua6+/RUHSgyLmz5ArRN69OTRsZdBsg/3zsymlV2oj/Wb0QnZCucpm
	al+gKthcM8wtRFmVlfuzEpbBsz4rVDYSr/e+2yNEa9RonYDtK3U/YFzEGjahk97aiWvEGd91QJo
	8/4zLQVlIlooKg5Xdks8T/dhUzkpztbpLS5nqgD8Qf/iIrJNjtURQYBiGIvTCttJScs4GCIwzwW
	BR7X7+AxC15II9BRF4oT0F6W4ViNg9E2P9B0aGOUQZ4GuXp6GtZQLnAbGB9mBXDwBn8tjiT1uuE
	9nXMO07X0UVzWtthMDeVD0rN6xmJQUZuUalt77MGzCYxq7sARjoF2+ymerDS6LdHSFxTAwEY84q
	j1S8=
X-Received: by 2002:a05:600c:4f0f:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4ac17b2cde9mr440533985e9.7.1793819003817;
        Wed, 04 Nov 2026 11:03:23 -0800 (PST)
Received: from ?IPV6:240e:47e:50a8:5f12:138d:ea9a:7198:b89e? ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b40ff10f88sm54699225e9.0.2026.11.04.11.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 11:03:23 -0800 (PST)
Message-ID: <51a04472-d421-42fa-8552-e94f4743e226@gmail.com>
Date: Thu, 5 Nov 2026 03:03:17 +0800
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
Subject: Re: [PATCH] drm/vkms: clear config->dev when vkms_create() fails
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261101032728.11422-1-yuz08559@gmail.com>
Content-Language: en-US
In-Reply-To: <20261101032728.11422-1-yuz08559@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/1/70 8:00 AM, Oarora Etimis wrote:
> On Sun, Nov 01, 2026 at 01:27:28PM +1000, Yu Zhang wrote:
>> The configfs "enabled" store returns the error without marking the
>> device as enabled, so the next "enabled" write runs
>> vkms_config_is_valid() again, which uses config->dev to print its
>> diagnostics and dereferences the freed drm_device.
> I traced and tested this issue path on drm-misc-next; the dangling pointer is real
> and the one-line fix is correct.
>
> I'd suggest rewording the commit message in two places:
>
>   "dereferences the freed drm_device" is only true for one of the two
>     retry cases.
>
>     a) the retry happens with a config that no longer validates: a
>        validity check takes its failure branch, calls drm_info(), and the
>        freed memory is read.
>
>     b) the retry happens with a still-valid config: vkms_config_is_valid()
>        returns true at its first check, drm_info() is never called, and
>        vkms_create() just stores a new pointer.
>
>     Only a) triggers. The reason: the stale pointer is dereferenced only by
>     drm_info() -- __drm_to_dev() loads drm->dev (drm_print.h:608) and
>     dev_printk() then walks the freed struct device -- and every drm_info()
>     in vkms_config.c sits in a failure branch of a validity check. The
>     ternary itself reads nothing: struct drm_device is the first member of
>     struct vkms_device (vkms_drv.h:252), so
>     config->dev ? &config->dev->drm : NULL is address arithmetic.
>
>> device_enabled_store(), drivers/gpu/drm/vkms/vkms_configfs.c
>>> 	scoped_guard(mutex, &dev->lock) {
>>> 		if (!dev->enabled && enabled) {
>>> 			if (!vkms_config_is_valid(dev->config))
>>> 				return -EINVAL;
>>>
>>> 			ret = vkms_create(dev->config);
>>> 			if (ret)
>>> 				return ret;
>>> 		} else if (dev->enabled && !enabled) {
>>> 			vkms_destroy(dev->config);
>>> 		}
>>>
>>> 		dev->enabled = enabled;
>>> 	}
>     config->dev was introduced by 2df7af93fdad ("drm/vkms: Add vkms_config
>     type"); at that point nothing read the pointer after a failed create.
>     The problem was introduced by 13fc9b9745cc, which changed the lifetime:
>     configfs keeps the config alive across a failed enable, so the pointer
>     stored in vkms_create() outlives the device and is read again by the
>     next write. So Fixes: 13fc9b9745cc is the right tag even though the
>     pointer is older; please keep it, and say so in the message so that it
>     does not read like a mis-attribution.
>
>     Background:
>
>     config->dev is the only backpointer from the configfs side to the
>     drm_device. It is used by the validity diagnostics, by vkms_destroy()
>     and by the connector hotplug path (vkms_configfs.c:555).
>
>     The configfs/drm_device lifetime separation was spelled out when this
>     design was agreed on:
>
>>>> the issue is that configfs and drm_device have independent lifetimes,
>>>> and we cannot have links between the two. The configfs structures might
>>>> have shorter lifetime thatn the vkms_device (and there's no refcounting
>>>> on configfs afaict), which means we cannot have a backpointer from
>>>> vkms_device to configfs.
>>>> The vkms_device->configfs backpointer needs to go, it's fundamentally
>>>> busted.
>     https://lore.kernel.org/all/ZjCh9DGnh2JQ3vtk@phenom.ffwll.local/
>
>     Note that dev->enabled in struct vkms_configfs_device and
>     config->dev != NULL encode the same state, which is why they can
>     diverge here in the first place. Dropping the field and passing the
>     drm_device explicitly to vkms_config_is_valid() is the real fix, but
>     it changes the signature and the hotplug path, so it belongs with the
>     vkms_config lifetime rework rather than here. Clearing the pointer on
>     the error path is the right minimal stopgap.
>
> Thanks,
> Oarora Etimis
