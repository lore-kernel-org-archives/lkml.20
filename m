Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821950;
	b=uU5fNf3KPXGBfqhYiux0jlCDgyUDrdavr/JojQDBOQNBIoa4Ct8V201szRVXmTkkSp9G
	 ElKNhX/b5hmd6NopKWo7bCBOeuXyqConrZBBBMey91OVZ5AY9KXm98fOcWvzS7adbj/ou
	 s9mOjIj5F9kibW3x8zvBKqkca3tqvuhsont9zPs0tHlG7nz+VjHqp6dLU8kMQ4np+z1dA
	 OsFUOG5OConliBiBJYsfYBNX5eZKQ7OFt+A69abIFg9cjKiKULUitXmu1c8aerknL20qp
	 3zZkib81N60uTah3u1J8bDJ9YzboN+lFydpBq/N6pLDefmkZMAPxdIzjoiQvNJq/E4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821950;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=vfDtkcqPvV+2k9dyjsvEmJCR0/Gq1KXbglEhzSUqmq4=;
	b=vKNa5Vb4yJHPyw6sbTxDm1ctk15WmJHflrbsYyANx8d6cKaCuEH9PoRpXiU+IajqORTS
	 Py+/kmJ8shUoEkrxT04DKN9Sfoy96sgZv22tqfdtDcuXAp1piMQVYKRAmCUeDre9y3YZ/
	 OEZ02IYZzZN5qNe1GJViFf8zgCVPAbDwR7qD+qbaO/f6Q++EMECm2GPr8J3P2YyFqWfHm
	 W73wjg8BxwkpPYQp3tZBYfn36trQKwUcncwKkjvO67f6J7ziWrQ8Df+kPpkJqwqf+RnlC
	 v89QQmkuZzedwYBEqbo6HH07Ptv128j5MoM157VSXvjwI8DHoKQWdDyPeURiKsBGdIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TSgJLCeF;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NGBP2dL8;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7F606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80E7F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TSgJLCeF;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NGBP2dL8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794821948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vfDtkcqPvV+2k9dyjsvEmJCR0/Gq1KXbglEhzSUqmq4=;
	b=TSgJLCeFDC+7XOHzSGCuBkK1Tffv4W6F0ZOw1rXgig+s3ADuWPrHqktz/3DfCJIliwG9uw
	JBw/I/KcpFSC6vSjyE2PGbH6TlwOR1fj8BVSNwiUTnhHZH5vyDCcqzY1clhfR+qbeMQWfW
	ruIGC/X78G0LIVGL+GgO6wPBFykJ+P8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-5sr2yFHqMdSmJcoFY_zXQA-1; Mon, 16 Nov 2026 04:39:07 -0500
X-MC-Unique: 5sr2yFHqMdSmJcoFY_zXQA-1
X-Mimecast-MFC-AGG-ID: 5sr2yFHqMdSmJcoFY_zXQA_1794821946
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so3085387f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794821946; x=1795426746; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfDtkcqPvV+2k9dyjsvEmJCR0/Gq1KXbglEhzSUqmq4=;
        b=NGBP2dL8rnTrHw860Ol5mlk5OT24/Cq47JfL6FT/yA0/1ZFGG7DO9LNKSMjdrsThGQ
         +v+2mTE8MM3vo18RYgCBOFvXJFF6xi0uu+kofs27pZkmQISpu0BuxugYu3XBgyg++Anm
         XRXccu5PJAfIznibKkLoynYvNSGKUI88xWwnJ+3gMgrNvniwldDHW4ka1LDS06qWRC34
         t0HZJvGxxJtxTAIh0jk37+Y3vn3qedSB8+knRCXDsLHM3UpB6ay91qbfrr536rSxAvnR
         +Gh98VEhLkjWY+Yeb/Y3TruuEBStXtIPgORftxxWizHC6ZMQdjjQe/XvfLzIiljT/9R6
         JP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821946; x=1795426746;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vfDtkcqPvV+2k9dyjsvEmJCR0/Gq1KXbglEhzSUqmq4=;
        b=SJxFHMRQaexO7QnQdwUklq9xmm3K9XY/bj6cQYLFTC2xYgctXoLsp+BipWXlPsiFPv
         ofQ27ndF6OGGGSwKfZf6iUXbM8z7U9jLJcDEHvIypcE9wi+dBTNTUJ8RwW1fbE8V7IUZ
         0+4kKe0CxUE5mOSbZBNuWo35RufU+IK9kMhZxOatGbodeQpquRqup8QDRBTWPEJq6/aB
         J2GknCeKDDUXIL+S30gafm+1u3lz+5TX7NwihZStJ+W5pO9iZO2d8/8auKiK3e2MzB3t
         5bgtx4vjIawUCAKBC/0r+2aWGVy2enz1zMzGy/4kuwcCzbSvNkGO1Xar77YggWlCpnVf
         2HKg==
X-Forwarded-Encrypted: i=1; AL+hErElrCixcLcw0/o2Q9YEbjW0t2+oat1I+fpyCbPYZ6nuWZ2ohMxTD7wg3w/j74noNFryWlFPuRzUFFrVc4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mqxBk+lXPI4crDaYovQ8k7w0ZEqTCCI3X4sJE+6jLtmuYzM1t
	dOQUOGlJAQr9cLTwxKSm2JwfmPzA7aZoLbpFOVLTR1n8x2BAs8UpneIEP54VYrRzokhOn2xZJBA
	AfBGwx/IH3uCECYnIm5rbAWByTA6u5Vd7ieeYYi5xNhuyt93uZwzDL0ee8e1y3EbxAA==
X-Gm-Gg: AZFdTZeQIda9kTpPkxv+BXKcJW0O7tidvyl9Q6y8b6BLH73PV7AlC54txny3ZzlWaKY
	ITKdnmbHL6iTN77mkLR9FqypwEv7aEkU5ggT39ysAfnEHsf0Mpxr6+NqWNeqn487+vi8Vm2Jqvp
	p4xRXhnlpjH/3UKtjhqW52iacM7dvS/+w2iMXztEi021cBsBZLHiul9mgQG6BVqk9b31ChAY8VM
	q1XvAnb3gAzEDTjcrVGzo4JyO5rDlwZBfFmSyzWTyer98Do9b+oMpDFH1Ts4CMCriwbqA+a6sk6
	gp9yC9/RnasvA8hLr9ZhY+ic8kBfDVBn9xY4cR4HSyoT8kpgXHPwlUNMp+vC9uvBWDM4mTpmN88
	nCqtdk0+J4rFmmFc1v5VJ43eNQWfrtcqSUR7k+pwLmUPFWKbHqOxxqHzzOINyavBf9Dfn40NJV0
	+tIMpzKrYWyK9Dtvo4hXo3ikyVj8KWXvfapuq4vQE=
X-Received: by 2002:a05:6000:25c1:b0:4a1:486b:4eb9 with SMTP id ffacd0b85a97d-4a1486b53eemr6359107f8f.40.1794821945596;
        Mon, 16 Nov 2026 01:39:05 -0800 (PST)
X-Received: by 2002:a05:6000:25c1:b0:4a1:486b:4eb9 with SMTP id ffacd0b85a97d-4a1486b53eemr6359053f8f.40.1794821945065;
        Mon, 16 Nov 2026 01:39:05 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm21564920f8f.5.2026.11.16.01.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:39:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Cc: Mario Limonciello <superm1@kernel.org>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v11 12/12] drm/solomon: add SSD130x connector luminance
 support
In-Reply-To: <20261103-superm1-backlight-property-v11-12-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-12-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:39:03 +0100
Message-ID: <xlv1ik1xru88.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Mario Limonciello (AMD)" <superm1@kernel.org> writes:

Hello Mario,

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Expose SSD130x contrast through the connector LUMINANCE property when
> DRM_LUMINANCE is enabled. Program contrast directly and register the
> backlight class device only when DRM_LUMINANCE is disabled, so contrast
> has a single owner.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v11:
>  * Keep selecting BACKLIGHT_CLASS_DEVICE and drop the guards (Sashiko)
>  * Register the backlight device only without DRM_LUMINANCE (Sashiko)
>  * Initialise the controller with the committed luminance and don't
>    clobber the saved contrast on disable (Sashiko)
>  * Skip contrast writes while the controller is powered down (Sashiko)
>  * Unify contrast dispatch and backlight ops (Sashiko)
>  * Drop Reviewed-by due to the rework
> v10:
>  * Guard the backlight operations and registration with
>    BACKLIGHT_CLASS_DEVICE
>  * Fix Kconfig recursive issue
>  * Add the Reviewed-by tag
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 149 ++++++++++++++++++++++++--------------
>  drivers/gpu/drm/solomon/ssd130x.h |   2 +
>  2 files changed, 98 insertions(+), 53 deletions(-)

[...]

> +static void ssd130x_connector_set_luminance(const struct drm_connector_state *conn_state)
> +{
> +	struct ssd130x_device *ssd130x = drm_to_ssd130x(conn_state->connector->dev);
> +
> +	/*
> +	 * The encoder enable already initialized the controller with the
> +	 * committed luminance. Skip if it failed to power up the controller.
> +	 */
> +	if (!ssd130x->enabled || ssd130x->contrast == conn_state->luminance)
> +		return;
> +

Is not clear to me why you need this enabled field? I would prefer to not
keep that state if possible.

The changes look good to me though:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

