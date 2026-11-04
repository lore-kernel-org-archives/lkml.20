Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819711;
	b=BZzA+l1QdT6fA8BrYXbAVHzRfNqsfiplZLt0UN96HreArNqc1lbk8Cdta1YMMcg4jH4c
	 OhLtFeBR2IotbDbH+jEUGXrvwHDDlibwMjviZkokEh5cRF6pxT7R9+yintPuw1V7ysmBO
	 FD/Z+mf9Avj5ATTYUbYn+3SLu1AMKZW5rQ+RV8L2kRcEafW5y2qzxULZkJFHOOqX0tBbV
	 ASj2/80Lbq36lhC4RuKu3L8+6rG5NM3oVheiHqDC0LDNyupIHKfhPHYcUpRf0WpbkJak8
	 Ko1umrYKa9HIhSz913Pp1qvNFE2B9T6GBCiwdkiQhVumeNq3k1m/Bs2DAHCOQi1vNWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XzHnKQ1ardUs+9dftxxB/DnpUdQxoDWmHTP8fmVOjhs=;
	b=uB6wUGarsLRQT3J2HrGEiEEGsXMKIelBo8mphRzoYeAdhdCjyo4It37J4SKree/B+XR2
	 tIEeSdKLsR0pRGSKUqC4+jNvLAGT98vgRky0cuCbJ1AZEbRaCw8zAJpfrylRzS3h9wpd1
	 v75ciu3xWsmj/aWsJp0n8AGyvlrrTwVNBw4DzwYyrR7l9RDQmu2WZOyp4W4i46fYlzThc
	 Bm/jPx5SzFulKrg6dwYhy933At5nVmnpbxDts3jyWREHNftp9oNQs6nmJ98jzQvfDEDP7
	 45emAg7vKSZDmoEanXKWO0JW35/k3zxyVBoQ2b7CXoP9ovgibSOOa8QvTqtmfgp9Nig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XUG2JM2u;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A1B606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A1B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XUG2JM2u
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so7877195e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793819709; x=1794424509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XzHnKQ1ardUs+9dftxxB/DnpUdQxoDWmHTP8fmVOjhs=;
        b=XUG2JM2u+nZvhieEN/CtQxC+YK8f1dlpuK5q8KFNh33SHbdH7YjA4I3OlRDV3sjU31
         rCT3fwtjVC25ck+94NWEXKbMlF6L34XfNpnoYarZaCcAT3x6x8ppWWoysuyJadc91PaV
         rZtuapzO36dVc1O8aNbwh+Z1VQCxwMwtWIyQgKKJ8zxyV38ZTye+onyESvAC5xhg/Os4
         vvXe7jPsMGKEi+fbQMNXc4gZDcy00N4YWX+DyrlJqxpNY5vHdXgU/HQ525+9mgnJTedk
         ruA9spNK+ETHjM/+Fy21ViK+Wzf+myThBbq/54HZ5FNLgD6vL5qXwR+v8/XDy8timqaz
         Z4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819709; x=1794424509;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzHnKQ1ardUs+9dftxxB/DnpUdQxoDWmHTP8fmVOjhs=;
        b=0mqJiqp0vmNFeAiXoDoe3XfHnee24VfKMotrFhKgQuH24LWRXGT85oMcsHnLAiGMij
         x379GavWqKEm4LG2XHZOkcbxcSZqOpzbhltYY88hl/ZehdusPF7wWbMVqK/gZtV2GW7T
         ScaN/12+cLLhwtCW/lehATaql4y+LjVAQMAHI0T3wMVORn8a7XcnRUcdhzf9GsBh/EVo
         e2XoeF5SxHk6DrCpzJm7yPrKpphZnDHGefRWNmADUMCt6JXrh1SavHyLubc2MZfoi4Zm
         mrZsYf5Sw/hAF1jc8xlbfWG0hyBcx+m+2d2/mRh8iDipOWGOmjUUmqKRkH35bZlFJ7jo
         in0g==
X-Forwarded-Encrypted: i=1; AKwUvBxD7UUAi5SUKBNTK4C+hH3SD3fRlAuaTkCwGfJ928uvLmuiL4Y7o1SvhiWPhhOGnmFttGisBY43eWq6mac=@vger.kernel.org
X-Gm-Message-State: APuU4Z847Z7GYl7hztbPhYBpz9VAG02LD0fAqHAuEpLFrCKBSzwE/t4i
	PZngvXiq2sNJLZL/yWevUgfO+u16ntGhPHhnGGC1P2DcJW1znhL294kGGAskNAI+
X-Gm-Gg: AYBFou3OerOiAgnyCg3wbkUyn5VGAra9LtXf0x+o31UKI/uxT9mefvbYVLdFSDoJR+g
	4I6i25WpEgTb20RE8+QbljGPigD1NWQ9osMfp205cbFZuX1zjlXuwzwTHKSALUBWS3OIwL6VXbH
	w0dYTx0hsNMlU7SjQiKhayTlD8N7S2nX9r3MyyNHNCtWfuocLKVQMi9DHy2E8fZZnfd0wzZubOm
	1IT9jP91C3ay+lJXfzeknicEt/OWgHDxRF+gcRGgNCPSKB3zee/rjdaOj4TK8jvIheW8bLmIL8s
	8g7ZUeg67pjMsLERdYpf6Wa2d7cTw3JmK1VPwGIhHfE25/1++ui7xV6oiSDgOmIlBQJUmpTYdXO
	4PbR6UaDyfjOvvUMQUkkb21tHWkQ87ul/hBU3e2zuF3fQ5ZWVk+y9Ruf2p12lk58m8ztui1UE4O
	Y9OnLMx7DqZAtKVIt1z4GfSOhFjGtIeesx8loa5VIGT6A3q9xpafm3/Ezfe7kSycSFBYGjW1SAD
	we1j4gUssN2Ef23K2clw9gjVkF65qHQ2PqdcIghQzhT+Pl5rY9aTc3D8H85BP5KXJumlVp0TSgF
	fTMp3aLwd9mMgpQOyXVEs7q/1L4IlxxG9g==
X-Received: by 2002:a05:600c:198e:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4ac1932a23fmr389597675e9.32.1793819709210;
        Wed, 04 Nov 2026 11:15:09 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b452cd020csm74643035e9.4.2026.11.04.11.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:15:07 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vkms: clear config->dev when vkms_create() fails
Date: Thu,  5 Nov 2026 03:15:00 +0800
Message-ID: <20261104191500.210592-1-oaroraetimis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101032728.11422-1-yuz08559@gmail.com>
References: <20261101032728.11422-1-yuz08559@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Resending, as my mail client wrapped my previous reply in an extra
level of quoting. The content is unchanged.

On Sun, Nov 01, 2026 at 01:27:28PM +1000, Yu Zhang wrote:
> The configfs "enabled" store returns the error without marking the
> device as enabled, so the next "enabled" write runs
> vkms_config_is_valid() again, which uses config->dev to print its
> diagnostics and dereferences the freed drm_device.

I traced and tested this issue path on drm-misc-next; the dangling pointer is real
and the one-line fix is correct.

I'd suggest rewording the commit message in two places:

 "dereferences the freed drm_device" is only true for one of the two
   retry cases.

   a) the retry happens with a config that no longer validates: a
      validity check takes its failure branch, calls drm_info(), and the
      freed memory is read.

   b) the retry happens with a still-valid config: vkms_config_is_valid()
      returns true at its first check, drm_info() is never called, and
      vkms_create() just stores a new pointer.

   Only a) triggers. The reason: the stale pointer is dereferenced only by
   drm_info() -- __drm_to_dev() loads drm->dev (drm_print.h:608) and
   dev_printk() then walks the freed struct device -- and every drm_info()
   in vkms_config.c sits in a failure branch of a validity check. The
   ternary itself reads nothing: struct drm_device is the first member of
   struct vkms_device (vkms_drv.h:252), so
   config->dev ? &config->dev->drm : NULL is address arithmetic.

> device_enabled_store(), drivers/gpu/drm/vkms/vkms_configfs.c
>> 	scoped_guard(mutex, &dev->lock) {
>> 		if (!dev->enabled && enabled) {
>> 			if (!vkms_config_is_valid(dev->config))
>> 				return -EINVAL;
>>
>> 			ret = vkms_create(dev->config);
>> 			if (ret)
>> 				return ret;
>> 		} else if (dev->enabled && !enabled) {
>> 			vkms_destroy(dev->config);
>> 		}
>>
>> 		dev->enabled = enabled;
>> 	}

   config->dev was introduced by 2df7af93fdad ("drm/vkms: Add vkms_config
   type"); at that point nothing read the pointer after a failed create.
   The problem was introduced by 13fc9b9745cc, which changed the lifetime:
   configfs keeps the config alive across a failed enable, so the pointer
   stored in vkms_create() outlives the device and is read again by the
   next write. So Fixes: 13fc9b9745cc is the right tag even though the
   pointer is older; please keep it, and say so in the message so that it
   does not read like a mis-attribution.

   Background:

   config->dev is the only backpointer from the configfs side to the
   drm_device. It is used by the validity diagnostics, by vkms_destroy()
   and by the connector hotplug path (vkms_configfs.c:555).

   The configfs/drm_device lifetime separation was spelled out when this
   design was agreed on:

>>> the issue is that configfs and drm_device have independent lifetimes,
>>> and we cannot have links between the two. The configfs structures might
>>> have shorter lifetime thatn the vkms_device (and there's no refcounting
>>> on configfs afaict), which means we cannot have a backpointer from
>>> vkms_device to configfs.

>>> The vkms_device->configfs backpointer needs to go, it's fundamentally
>>> busted.

   https://lore.kernel.org/all/ZjCh9DGnh2JQ3vtk@phenom.ffwll.local/

   Note that dev->enabled in struct vkms_configfs_device and
   config->dev != NULL encode the same state, which is why they can
   diverge here in the first place. Dropping the field and passing the
   drm_device explicitly to vkms_config_is_valid() is the real fix, but
   it changes the signature and the hotplug path, so it belongs with the
   vkms_config lifetime rework rather than here. Clearing the pointer on
   the error path is the right minimal stopgap.

Thanks,
Oarora Etimis
