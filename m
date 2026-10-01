Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B273F51AECC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865535; cv=none; b=sSubENvJ3/bUHJcx0l497UTOruxc5GsVgupex8UYdhA0VOLejk37REmdPKHamayTz3cVDtdQlZmw3KqhaEf9L3xFUFKRocXEct0nUFazjK6mIl0IEjvGtFkeCYUvYtkD7AzmeD6uhp7A3p2kQPdnDYDoCrFkqv2m9hI4dErMbfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865535; c=relaxed/simple;
	bh=TP4jI+wG6PBqBKAosooF+4rrhoc5hNQtPHbUvJ/nxic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DUgSMGuhyJEA4H0wlvaJj7FUFsGegN4OwGvMscpZJTGpmRD9erbCGjuL2mgf1Np44eowTDAc5d3hsF96F4YNIOWt/hsNvUcTzG+k4wsJeR8Gq547COaFS+dbpZ3TuyUzktcb/jEay9VXUmTwmL5W+s22GXA35CefSwbcfEDqv8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J5TPUfqt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VjIBUJ8J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J5TPUfqt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VjIBUJ8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790865529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i4xhRQFt/bWT6UALcOITRzeSEDfb1ACELZHI8/ear74=;
	b=J5TPUfqtrtqpeS8SlQLjzv3vhrZQdFt09DaMBP94eK/YbQB2f0TRRn7Uw/OTIzX1pxI5r3
	ZLumVB0WwfmL9B+zV394FspL1wqlVAwXGDUJ75ujzTrNlSTUh3cY+APEITL89jeovZUJKY
	piixZs0h17ThkR5Mm/lqlJhsvUjvd6k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-QLKPUSaIPke0x1C-9yyfrg-1; Thu, 01 Oct 2026 10:38:47 -0400
X-MC-Unique: QLKPUSaIPke0x1C-9yyfrg-1
X-Mimecast-MFC-AGG-ID: QLKPUSaIPke0x1C-9yyfrg_1790865526
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49ff43a1ecbso39122075e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790865526; x=1791470326; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4xhRQFt/bWT6UALcOITRzeSEDfb1ACELZHI8/ear74=;
        b=VjIBUJ8J2/ysa0wVuaeMXcYQmXgkrijhtQC3hjYnFW1AYHsbqDtu8gxrYLSne0ydJU
         3kcFo83XDha4TQkYIeEXOo34MyYzWLRwJfo4qnXzvM4SxfNpqFhbw0LlaC6LcRpzeG+Z
         Pkv57cIxRfZmCpIyzCUZ3K7a0wzR++nDoxrTkTUJVrh300B+haIS+CYT1l1+r4e67raV
         kXTNy9otKtGR6tmARhV/kCv/JZecFrx1gW6QJtQFf9tjY01GGL7iIQEqInYI5u+DKatA
         Fik4lDASNG8V/0R7pdFL/mQzYIJ+GJZ0638PHcIectETw18Q4KS6UtJgwXCaDNKwgj1Q
         bheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865526; x=1791470326;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i4xhRQFt/bWT6UALcOITRzeSEDfb1ACELZHI8/ear74=;
        b=fWh4gPi3xBOpmDIQQJr5S7pLtAURRG1Tu+Kku3CdXUluUUIIWiwOmnN4uDtpuPX5su
         pfWDtEYYg2yMBkXVElOofMZ0nhoyf/vXDM01NY0FbNLIFFq9lSGhz1ZQjgPcihcY5WEz
         dYmfUbQQDkg6hSqgqy5sKbpXCqDy02ZsvH1ZX1fxsvvoZSapFRHNgAmH/ydQKyr2Q1xQ
         Ur6GBWvHs6S8rCPXRMbiRSiYWdIdwIvTHzVut2L03PpyBhX2XQNbYSoITlRHYNlThQnu
         iWQqRb17Hwgq/8xXaRBZ/mFaUjO7LXW3JYvY3IVytjMEkWaUhWRIVFy/LxFT1phBJyaS
         wqsA==
X-Forwarded-Encrypted: i=1; AKwUvBx7iZwha/VqSTjT+GDvpCxJypA5BjRZBoMDDxa6SmAStLf0HMVBmBTD+k5u9O+JIGqxvARiylee6fs16aQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nDVzM2Hnt8qElnDiK+DGKimEgV/+Bu517pXhWO9yOIH5G8RjUo
	jpzTpuYs4NsoNE1mD47Omq0qdXuUptw/2lElBSmvq8/bACRZq6fHeNbb57/lwAtdgRNZYq9jMAt
	gIeCKycr0Khfk0lf58uwv/iwHYcvBldfoz3eEdWezISyaE3XzY8E2paOgKowZ9nOf9g==
X-Gm-Gg: AYBFou0VndpN5lns8qbCVApKABa/9+IWfmT59yXTwiFlX2X+hVp1Bf89bt9Rf90wct7
	RYDGaHg9PropbD1gDSpxqgFpYrk4RgPV0uGOoEsecj6KWyqlgRl2NQtlYN/zfmAEBOzg5aZW24O
	nmhkaTO2xtB63zXQ9nINpunXZRSEJ8FST+XSOBhLnH4LSfJDYaw3Z/gew0fqupA9pUnSfC3B2yu
	Fw4ZcbAesa7vSY/b5eDIT21taDelANMOlLhlyT+HwxKFN1PWfVMy1ndNfS64dBAO5xAIf31v8n0
	pIvfXOI32Ba9Em8ZSwPj3h4p54se91Kuq9D3ueBibW6Ymy61gLCWyjc3gbQxck+DWULY+nusc8M
	kWZLf0nGMbg6kVV+bZCu9dxqIrCKdgjoDDBaW8r8jHYI8fhsEYL8mmxCwDrWuwB6pRA==
X-Received: by 2002:a05:600c:1f86:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a01b135eccmr80506855e9.35.1790865526375;
        Thu, 01 Oct 2026 07:38:46 -0700 (PDT)
X-Received: by 2002:a05:600c:1f86:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a01b135eccmr80506425e9.35.1790865525833;
        Thu, 01 Oct 2026 07:38:45 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a023ebe694sm51117505e9.10.2026.10.01.07.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:38:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, longli@microsoft.com,
 ssengar@linux.microsoft.com, andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/kms-helper: Remove struct
 drm_simple_display_pipe and helpers
In-Reply-To: <20261001133736.802604-3-tzimmermann@suse.de>
References: <20261001133736.802604-1-tzimmermann@suse.de>
 <20261001133736.802604-3-tzimmermann@suse.de>
Date: Thu, 01 Oct 2026 16:38:44 +0200
Message-ID: <xlv1mrsxfpu3.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> There are no drivers using struct drm_simple_display_pipe. Remove
> the data type and all related helpers.
>
> The idea behind struct drm_simple_display_pipe was to provide an
> easier way for writing DRM drivers besides regular atomic helpers.
> It turned out to be more complicated. With all drivers being updated
> to use atomic helpers, it's time to remove simple-pipe. Also clean
> up the related TODO items.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

