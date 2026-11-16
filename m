Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821346;
	b=rshK/1YI3ZsUJ0wcm6Vs2r5Se8PHtsiZ5jQqINv1hf51IC6mZAAyYR2mHpiGrE+eceVz
	 Z9NN7MKiMWqFFnZF1Z7h/qi2jnk/fEcfCs/yP/koEYVjj+B0QENPAGO1qpiTaDchN5rp7
	 JiM73OWLU430aqoDmydIITxwwxC4LOeDCH/0tNeV4lA5bLm2HL2ANPdN6EDd6hubwkQNJ
	 klty/6fczwrOUBRsPVDj4a+X1yHymy3ho4oDM/Xx01CGaPQpokY+AssLU2IMYE8oRmxGz
	 i2Ju6dV8gSzAsW7QLhr7KW/uOW0x4iTx71kUAy1C56Le/gyWiWk6DcZeSW0ZZpMvz5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821346;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=wFbznQG0d5IonVOFhnusqlVdFzPG48oiZmmSS9tPXTU=;
	b=HvSIsYztDjcoI+zhw8KqYRFM0pr51AFjHRHeauDhWE2HgQ1PXOqnQxnXocAYn84QraeJ
	 dWc37BrWeCpLDQict/VMLyTuiI3cZhMhkLsdK9XRS9FYkrnlAbPn9X0Mi76CV0Or2nPgL
	 p5N8rcx+tghVQ9KCTenwJJ/dmI3P0c6GGBew3BHUHNlBjyo0ViaTvPTUapJ0EDyhIbxZP
	 66cUsjDAtgBOUYAZP7p2IydodjrvXTyO3CQ49Frk3RYGtko/WnGaicTRy7lle4Lfb3G27
	 10qQZR3tdyh2C5eh39bPg3GRfWtatdAECMhwkf2FkS3lS5isTlQ+neqxjC4NbCJISig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EreqnY2u;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SmpRSg4y;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EEA606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EEA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EreqnY2u;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SmpRSg4y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794821344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wFbznQG0d5IonVOFhnusqlVdFzPG48oiZmmSS9tPXTU=;
	b=EreqnY2uGsPcGB08CysgsQlx2r4/WZU1DJtu10NyBFowSXSRQwTr+DDZ5u4hEu8Vvrf2VL
	T2HA1h/5StAh4rLX6cK0x6E/6USu1TwtXzonLSXLJ+6m+hDOcsVfH/CQWfq8AAP6EgT9B/
	0TGalq8gj1Y5x0gaJwlsRwjRFpJ6+bg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-f6OuzFRiPh6BwBAcj-tDxg-1; Mon, 16 Nov 2026 04:29:03 -0500
X-MC-Unique: f6OuzFRiPh6BwBAcj-tDxg-1
X-Mimecast-MFC-AGG-ID: f6OuzFRiPh6BwBAcj-tDxg_1794821342
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso26106355e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794821342; x=1795426142; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wFbznQG0d5IonVOFhnusqlVdFzPG48oiZmmSS9tPXTU=;
        b=SmpRSg4yENpYHnMKpffV95a1xBkCqrZaT52tC+T6Mf2JuwI4uROHRrIfijyBEhRUyT
         JHBsZ7mgW+i2bvWjdEvymj+I6j4PfSOLuVUnIqARk7vxU1jm29b2QAC4V4/0BMm4Fn5u
         5h75mbwqmMSPyo2741ZtCqxxXu48O0xuPMp1ZKKSocs3HfwIewNuRevssuJID+qG72BG
         /Xbvw1esA+7jXyrmLvbKW6DcMcykKc280OcQcYCL88jnjqhCaqCMnrhoxHN7Hut6Ku4g
         0eX9zFfqwv19uKzi5yigZlA2GQeX7KlppRVgCpcWh6/eGn77h6mhkb2pESmWwL1FP1Dz
         99Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821342; x=1795426142;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wFbznQG0d5IonVOFhnusqlVdFzPG48oiZmmSS9tPXTU=;
        b=vKQJsaMNxomN+u4qR7+L2pU43meSIgXaYeVA/IQxv6HRS5qndU4Pu+8EatGFq6ZGZq
         kzoVXgA5lD7tZcW0lkN9UIXwCsrEyKmFkMZEM4sI9p2w8Z7yRqGwQeG2F+4SpoobGbqz
         pidlEtV4KsBUlfxKwlZwMwWaNERg/1h5anCDqGUEt5dKwWiYTR50+gI36aybeKuKYtgt
         zrT1bkPIv+mImRBu0M5llEH6jzaghWqKALpdhGfjiBCvm5xua4Fk2Uvf7aaPVE8+y17t
         mbIPcQ74pejHkoXYpR0Hlx8d1iDRlSdgJBeesS04PHr2kTcyHTTulhQ9h3kvAXWZkjt2
         khlw==
X-Forwarded-Encrypted: i=1; AL+hErFhkC+ao8EbcK31W/8+g5YLKSmrjfw3+kSuWBM+sb9QSuGpwSYNwbwZQSTzO5hfgET/mAgbZI24VcMcyDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KHsCm7bvFy7B2vy5dpymOXm0ZRkdD5O64X+4Cj3NCxxtFUETq
	OwVWSF3HCcHNJfzqHflY+VRwjyaLWZ9Y8IJzjb71mqUikq1tlxoCXZo/7qRWhWEo/hdMtxqrd0T
	XPj+L6q9PoKd9MVWaaVFqs8nKD9pzSpM8xOKyXV9vKrO0zLHB5v9s/vxF3kXYvmxQnw==
X-Gm-Gg: AYBFou1sVwSUBzP+6h3Zeh3TBywX4xQZK1uXyNkgRGDu+9OehXdwKOm6PSYFOEzkBPd
	5vbc7zoA1evVs+Qz9aKT0zgik5J/cj6Yr4Fcm2OyzEwuah/eg1W8leGxnPOlFxLaVmr/T79Ys8E
	mtmC4+3EBuOZ5af8GzkD2sBMtkk7Pi1wHLJHIjInvU6wxCthUKrsvRcDgEzKpCEoUHWbd3hUz+t
	2iMEbJSrCqAlTLusDk7ycvauBxAB2nGyM17qutvNTpSBV52hETbLyTLdSaY+sRjNL0ye0HfvEEU
	+YPcORtIE93X1ozK/lHftIdA6zfsJqrLlxfsT8uoLJUrspylJupBQgI8cgN4xFmaeBQqQMLIZ+q
	A15LP+k5lF/t+UrTfIitzX1dLLOdhGedFcqi72ldZGjXuSMgO2iuyBr1tS+eAm3gYc0MV3W3Iep
	sruYplm0cikTfhshitZTWmbYGe2+x/V/LrkANpyZY=
X-Received: by 2002:a05:600d:41c9:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb60bd5507mr133776755e9.10.1794821341896;
        Mon, 16 Nov 2026 01:29:01 -0800 (PST)
X-Received: by 2002:a05:600d:41c9:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb60bd5507mr133775995e9.10.1794821341249;
        Mon, 16 Nov 2026 01:29:01 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb675200e4sm115370395e9.0.2026.11.16.01.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:29:00 -0800 (PST)
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
Subject: Re: [PATCH v11 11/12] drm/bridge: add PS8622 connector luminance
 support
In-Reply-To: <20261103-superm1-backlight-property-v11-11-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-11-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:28:59 +0100
Message-ID: <xlv1ld6trup0.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
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

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Expose PS8622 brightness through bridge luminance operations when
> DRM_LUMINANCE is enabled. Keep registering the backlight class device
> otherwise.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

