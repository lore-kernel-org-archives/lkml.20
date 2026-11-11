Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404768;
	b=znqNanC+whVIuZLcWYr4SMRmr4uwK/1Vtw/AGQGDrbAshCY6X+aofImpVYsrapgkiIYx
	 rs70PDmk/E9Q1LWAG0dWl2qWNxLXZGaBVVag054vYHkywSV0O88Cx5NFhUTKgUPfuQhty
	 cfbRe/9h/F+RYOSVtwjvd9RiG6C0RejG37Ea1KzQ5cHj+46sM49GJvpuQSDZpZczfc34w
	 +71X3z8x6Y3xjuuCEkMBkksAou47la3lC9FCzp8zNlbMUPmyrfnv6zweDA07UIYsF6rEA
	 Msfd9dkjwpDGVOhWLGPEfFgwFqk/PzJlYrnXKDmcCQj9QXc5aZBTNDFouH5yB8NB62Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404768;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gU5SfropLbeuhhZVQHKyKXg+TDGqXO/o10GMjJa5hHQ=;
	b=3qH3DeiCZjLjdpbD/gDazWGDdlZNFqneuVKOYLmlM/awmjUC6KV2rfVXbO7S/VDHyHF5
	 q99Vb7IVOyVruthTiKXfHjNxRuxCSLMaJXFuOHZYV7MhiZds9kph81BzZ93OLLmmB1OkV
	 hgVzoTJLQ18DpbcH3JFrb8+PIxECOnP/44c/0Kf1JoKzkTOsL++li/wBN2eumOWzwIaNV
	 4H7HVStMWMy3aVUKGI6kQOgzqbSMjrBI7pkYzCX0UAmBkHd0f1aIGczMx4sxvlb8lvPRp
	 rtJRlOTZzlVfXSZ8m1x8cwJpKnGIXcRl6Ta+tJ28Y1hYwHGwVZVvgvyY7Fcr0bqeN/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CBF606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5CBF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so2409875f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404766; x=1795009566;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gU5SfropLbeuhhZVQHKyKXg+TDGqXO/o10GMjJa5hHQ=;
        b=ei/pXM8sFbeJVaMaDQVSgCI9jjVpq/H6A71z0u2oNietVVQGwiJrrtPhkfnEg/nXHC
         bc1RmPdj67aqim+JvDRbcYGWoMmipWfm2hvcfd896d5u8IRf4ER2py6q2fxyOP/Sk3zh
         fcpcfqjl4fpnM6jI/WmR3ejmtCjtMhf2564nHnoAfdhnHBlYAEXtJOkVejRrrzWU6CUM
         eG/ExK6PbuaOOb59GSm8gXsPIVOWTRGpK1F3hqmctwi8TdH9ewl6r2trYhp3S4wMyIoT
         REuYV678RMz1uLvVxdWqwmaptULglLVzAhjsbksNktcirriRhav/18U1mKxYuTLapevX
         p/iA==
X-Forwarded-Encrypted: i=1; AL+hErEvj4Yx+FrKEp/JAALUB06sGkEv9F4ymSJb0HceM5mLuOAzKZnqC7U3+HTgaXXqtEm+jRyI5gpMlt0URiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DhqzzR5RJ7FFSu65BDgPOjatf4V9WzbzudhOM2iXENHfaVxzf
	zXCtyKGyp9lQPTRhfD5DGNi6pP6VpgYXC+sPJuf5AaKvrnPb904SRfBk
X-Gm-Gg: AYBFou08ZaF7bhSYhsfybiaAXnzZYWnipY5JiYPhGeV47YWCOC9uPhfaSjv8bCYinE3
	2Zi9ZrzK/tB+MpGwa0z1N5QUHacAP1nITHfq0NGdgR8qu6MFwVXX6gSDvLpIT5sgzhm5vVHeARo
	Zl5Skc+1Br6x6LUtCVpqp6aqYPI/Ct02HFAEZJ7g3N3o5aJgLDzGSpQeZHgqBUqb/TJL3Pa5hKw
	qCQADhdYp7zXpCeHm7Cg8LS12/LWgFgprGei65fk8IgXmIwZc52S3paQLyI5dfROCm8ChdB6BJS
	aqNoDn1F+VMNbnOP5S6qist1c55V7FjWKyM6MZAkIzQoCqQkK/3D/v4CdyKx+h8llwNBoeiTom5
	iFtn5LNBPuJYF5UaKFcM2dWl1NYNqCD+CJmXj7mVMkb8af/hz3F93Q1r1r5pGcOY9zjUrCP731P
	JgmdGbN0+V0Yytg+CSaSsB1edqzkWFlAR+oN0ymRFKqzPlMW4ZHKKWdTm7q7ACcj8ax58bwgJm8
	5Wcf1BJMkUO/Wp85cWb9SJTuk5NySdSfEHZ5FHjUG+ExiU8upUBeXKRlJdUYgvK/SzVvsoNcfmi
	1t/rdz0F8BSIztC8jvwsWJZuRzmnh+exRK/SgIamnEIvnXxI+UHlFgvyJ+rKNBP9dh/ow1QCWss
	o+BkYk8gP/DZbH4mye33WYLrsVLRhZNX9TLVhhYwFTyeRhLGvCxQhUyuMstE/
X-Received: by 2002:a05:6000:3107:b0:48d:f3f8:f910 with SMTP id ffacd0b85a97d-499c96002fcmr5471214f8f.34.1794404765741;
        Wed, 11 Nov 2026 05:46:05 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c30b1sm11189059f8f.46.2026.11.11.05.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:46:05 -0800 (PST)
Date: Wed, 11 Nov 2026 16:45:57 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] drm/vc4: release firmware on error paths in
 vc4_hvs_bind()
Message-ID: <avRxlbgy9mtT1rR6@stanley.mountain>
References: <ee4989e2-f55e-4d09-8a0d-306b78b9c9d0@stanley.mountain>
 <20261111131528.316472-1-tomasz.unger@yahoo.pl>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111131528.316472-1-tomasz.unger@yahoo.pl>

On Wed, Nov 11, 2026 at 02:15:28PM +0100, Tomasz Unger wrote:
> So without the patch every failed bind leaks one reference, and with the
> patch the reference is dropped.
> 
> Tested-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> 
> One note about the Fixes tag: 2fa4ef5fb943 only moved this code around.
> As far as I can tell, the rpi_firmware_get() before devm_clk_get()
> without a put on the error path was introduced by commit 2a001ca00ad5
> ("drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code"), which went
> into v6.2.

Huh.  Wow.  Thanks.  I'll resend the patch with the correct Fixes tag.

regards,
dan carpenter

