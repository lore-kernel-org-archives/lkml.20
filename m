Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906811;
	b=DTDGsuBRuBHPzLYxxoyfIUYUu0Hddi1zKSBPjDfqaLj9QEWY3f10UtXSmPIZzoKkfJlD
	 mP1PmKjXeXUpVAb/G3g5rycIpHTqiVpkQtYWLS8N2Ltio3JA5ML5lIaagobvT4HJcQ+dP
	 S8ODUZXqcoLzOxfNq27pVUKZEoyV2rImPdAFKPxqCPkyRnS30/he2hMdWBCAHpMn4cmX0
	 Eer3gcsirXtVcrDlbGUzfaANjPzr9aX4oNWIclrIyQ/gPH9eXzvuVEIW1rUhmoL8QqRuO
	 Fs9xb/CfopLf3muuAGi3uiR/nlaG6fQkPdU3xcVZwMnDxYIbubforHKKoQTxd2ndCAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906811;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=3vCu5O5rBFup8zOyNToLTiowXoRh2airbpyexQsIArg=;
	b=hsC/gfb+191yQGj3XE58+2eEzC9/w9xsXUZ464uwiRLw02lsXc6jURt9XVq3MqXfFkcF
	 gbNktvJPIV90yEllH5Kuvp/15K3nTGbTpWVII2jZ2ILmP5jTEa8+dYEnHZC7sawutprq1
	 ZCsD+q92ZHiBMBtRuqmdTVkwYGASHjYk8KdI3z0Ux4dPUYvQoymsQhWrK/ZbBT1utZSWb
	 tMpbGMLxNkQ57GKHLz5EH815kPAG1BbOiTon822oyZi0dG2r+FiKXuEL5mneDp1Ljh1/a
	 cR/pN3PUR0AYMbD2p9JzmqQFzUclMrWGf8KS4fPbnDdFyAjFDLggqiuyyyWqwksrvpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hEfU5TKE;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=L+udr0k0;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C1A606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08C1A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hEfU5TKE;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=L+udr0k0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794906809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3vCu5O5rBFup8zOyNToLTiowXoRh2airbpyexQsIArg=;
	b=hEfU5TKEvfmr3dpcoxmvXHWggQkFD9TgA9PhdMgxaoeJDF1sQ/v4f/o5q6bog5VUXIUpFX
	QsPtp9ML4oRtr5uIb0pIYzwbynErJKElcHR5HoHNOFx6Xp2XsaYSOWUUTN+HiHa27DMOI+
	+EA+jkeDL+nFCS51fcGg62pDqiFboZ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-hXWaIup_OAayWAQM5Jut8w-1; Tue, 17 Nov 2026 04:13:27 -0500
X-MC-Unique: hXWaIup_OAayWAQM5Jut8w-1
X-Mimecast-MFC-AGG-ID: hXWaIup_OAayWAQM5Jut8w_1794906807
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so32698255e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794906806; x=1795511606; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vCu5O5rBFup8zOyNToLTiowXoRh2airbpyexQsIArg=;
        b=L+udr0k0kSLJ8mDwpITDxNXd67ULIGFBUntr/VNCUJ/wVPn9F5Q5sCXrrhL/VgPHlP
         FMH3ZyX2ldWXnqdirhsS2WbsiR2064sqcu8HiYRo5mBoQYM9IJubvbIeN5Lb4+bTFE2Q
         Yw2Sf4ReHhp/sqlnFKCKiT2hkxEJ280Hzt+FafCbUcQuwGelznpRYbMVL0xkHXbr03Np
         dpxmSPX/063lcpkV470MCEyv49qbLoupkeYDZSnzYPvjtzzCDxdjvdnHFYMHky8TfxY/
         ef2jCcMgfPKKbp7hw2lpcTUGs52fXFzlVjBR7SSyLy++VEAE9jYZPZhJ0PYYn1RH0zPw
         IiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906806; x=1795511606;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3vCu5O5rBFup8zOyNToLTiowXoRh2airbpyexQsIArg=;
        b=dW8sObQrIrBYAO4DlaRQp0aBuffgPScDO/5J0mM0qaDCmuHlGArihgISyrMK62KysB
         TNRk1Rq4qre/hG/rA1JdH+gTAMovuKKlKIv7J1Nd7z51Eakct+tkrVFCXHgKpHomd0gc
         IqRLmiimq2yD/jY6rBKsff/SG1eYOaBidGAa/IzAxao7m4xWskdP1QEbuxGHBUmFHnNY
         XGwNOEJ2jgOwybJ5qpBat3NPVWHyZzIRlXNJFlqnqC4psjZyFtosSTFUD+Oye5Y3bIkI
         CvAzXPwzZ99kUJlpiS1cTP+wa5JePrsl5oULzvV8XqTtXTTklds6GJrUQH7Pizdrgk9z
         y2iw==
X-Forwarded-Encrypted: i=1; AL+hErEgdnDtsyikiisOoNDOjO4etAPGG9VzQwoYkYiZYbJekgZF6/E+9D8IoIerb0Jemiv8SZaE9ETBPC4n4y8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CjGSNRBNyU5tnbhJo3WZsx1PQ5NXYlrGI1x0kdTvs0LOUBqeH
	eZ459cYa2xm8007AJ22rLVN47/flgt7Wx14/honlZXItqoCMdkKr25IiU7Yl2Ids4+T5uyy6xki
	2NtRITyifoy5PH+JDwkJcjlNfhR198/BRxhUmLE0OF5B3+wJ20vhSqEdFZd43RCvW4g==
X-Gm-Gg: AYBFou2814gIqTidnp1f9sWA1TsmBLiK347zGEOv/OHSGhf7YR7jn40yLE4FSzIK8hZ
	MdE26wVjZyBZm7HdmMzowzdEtU+B6mdoScxNCYarzAm8n5uYpQYPnfUJbJg7OIVzBJwA/MOHO23
	14mLQKuLpdYqT+0ET532b7U/sEpe0ph5hQtxzrQ4CQBdHqxde3Z6kVt318DxXwVmHYLvuapP4h3
	kacyM27WlxQZ21KFGprJlGem//Yd3S8d/ejNP03bhKhkDzcGbvg2jAH4mS2NBPTSMn1ZLlaZHOJ
	oItY2+grilRv/P4JApriRLhWY2X5NyOdohQhAUxnIyW7XB9qIJ/OxXW47plJHL9mWVR4Ew31Nu2
	Zl38H4xSABW0c9CcBq0moak2VwYDJCdtYlCMaa4qrawiJVvi+wrHz0zVz4XcurbPP3NRPu0AG7F
	lZ4JMlQdRsbnk59yDbY4OF99a1i+6A0xL6MWhHjUg=
X-Received: by 2002:a05:600c:46d1:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb76d62556mr75648835e9.0.1794906806311;
        Tue, 17 Nov 2026 01:13:26 -0800 (PST)
X-Received: by 2002:a05:600c:46d1:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb76d62556mr75648285e9.0.1794906805843;
        Tue, 17 Nov 2026 01:13:25 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm16989955e9.15.2026.11.17.01.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:13:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] firmware: sysfb: Remove CONFIG_SYSFB_SIMPLEFB
In-Reply-To: <20261117084514.367399-1-tzimmermann@suse.de>
References: <20261117084514.367399-1-tzimmermann@suse.de>
Date: Tue, 17 Nov 2026 10:13:24 +0100
Message-ID: <xlv17bibstvv.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Enabling SYSFB_SIMPLEFB creates a system-framebuffer device on top of
> a firmware-provided UEFI or VESA framebuffer. It is inflexible and lacks
> support for various features, such as EDID and color LUTs. Therefore
> commit cc79eaf8ee25 ("firmware: sysfb: Mark CONFIG_SYSFB_SIMPLEFB as
> deprecated") marked CONFIG_SYSFB_SIMPLEFB as deprecated.
>
> Remove CONFIG_SYSFB_SIMPLEFB and the related code. Remaining users are
> advised to upgrade to efi-framebuffer and vesa-framebuffer with efidrm
> and vesadrm on top. Also remove the outdated comment from sysfb.c.
>
> Note that this change does not affect DeviceTree simple-framebuffer.
> The kernel still parses them and creates a simple-framebuffer device
> for each.
>
> The MIPS architecture code creates a simple-framebuffer device for the
> display output on the Nintendo N64. Removing CONFIG_SYSFB_SIMPLEFB does
> not affect this code either.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

