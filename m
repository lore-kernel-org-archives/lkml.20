Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356780;
	b=OHVItBcFvVM0vBUF7bVN48ExpLwCgaTrly8bz6yLgbNqUfrZgB4wuTgbfsYyAnHHmNDv
	 9dMT93KTQ5uTYNtRFG7awjgkMC9qmuqbnkNH1SlXe3uNbZYFy2eBDYOe2QOu6VlEyutSE
	 1ndBew9dGvH6QrmeR6TP0XUFMx5GA1JS+OSZ23tDxR8vYvlvyqJjBADmQlOe0vTEbVGA+
	 UK48oilIWmm0HgaNvuFCSGcpxtn6+maGXr4kztk0W0xxqvriJa6JMMSrBLYGegB1GcWZg
	 AMPi/yWzXUCWfSRPNAotNaV34eKE1Gg+KyWN2qR7cuw9mitep6m+gVdt/QkbSVkOyPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356780;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=qu13WNcpY/vZ07q359lLwvt6yOBB5yClJfHy+LokQkQ=;
	b=vgPUmcyFSHG4Om4HF3zKyeVxTvVxhACrNe/IiO/Dzu7v03LSeL2vnW7/hQlOMhBR2+op
	 84Kd+HQ6WW5suW5jJAu6A/HVh+Oh+errTFmCGfA/eHoB8CzhZU89f+iWaUBMoS2rXaKrV
	 Lkadak/lM1RfXJwsKW+++HZqMjx41ebTkVcYTCy4nPw0lsaH+YJ3WsPIKis/s4KUxFIaH
	 3pCMj8U4isoSqUpykjVFfeUxUWEB8T/BEN8coq27kOyBZrkx26RcE1jY/z6DqCfMGnV7S
	 IkjdMhVeHrmzff7ihtCJ8hKmYDx0jT24NYTbai1v2BN2K2Qml6Y+6ZFYu8vI86bWCHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="T9wJ/Bu+";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bkdsJJGj;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF770606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF770606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T9wJ/Bu+;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bkdsJJGj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793356778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qu13WNcpY/vZ07q359lLwvt6yOBB5yClJfHy+LokQkQ=;
	b=T9wJ/Bu+VxFUEHSomBfRfz4mFMcI7LpRfTEv70oiwM830N8f+K1MMFQerZWWsvS0+JFRWl
	YzxtDROMqIpb7zMF6Eh34jkxQWoyJ55ik94UnjgGCkuYHmX7P3N3vwUEdEom0s/vRXhArY
	ng17Ar/GhrSB2QbuvytBjaP0ulWftR0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-j-8JhO5FMtSOZpU1ftwvBw-1; Fri, 30 Oct 2026 06:39:34 -0400
X-MC-Unique: j-8JhO5FMtSOZpU1ftwvBw-1
X-Mimecast-MFC-AGG-ID: j-8JhO5FMtSOZpU1ftwvBw_1793356773
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1fa972b4fso2730265e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793356773; x=1793961573; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qu13WNcpY/vZ07q359lLwvt6yOBB5yClJfHy+LokQkQ=;
        b=bkdsJJGjXEnMoLpuuPfK1OtizYJYrkCB06cabGM3GbMJaq6NjqwP+BAk9hmfdE10tC
         F2sf09wLXdh2AoeePqB0qjiSwb2f4Ooka677KqzJkx+40T/86hnYDs/K8gmmG/iNJgXU
         yJDLfGLqR1mw8WOZKtI6JpoGbggfvd+u2ZUiaUJqW83fHusa3Om2+28ljw3mjc+qkdaO
         STOn3TFKEBe1qn8WU3yXHPUlo47bKY/ihENgkHuh39A/oCeRypG09u5rlm1lg/jYUpdz
         sAkoITtJ9FOnsL616JkXiYsytwTOSn4yyra7NEWXMdKoDSM/p/ws7eYHxyxXdo4A4Ebo
         mcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356773; x=1793961573;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qu13WNcpY/vZ07q359lLwvt6yOBB5yClJfHy+LokQkQ=;
        b=SZHGggp6oAipxcGVqNeYyDmzBMvHFnhn58TM2CauLp3B8mkXve2MHj+eYUCtIe6T4L
         cfKvY1KULZbHlw0pMX8am2ldoxJUL8750ywTxtDK+hYYHcJc8wZ6Re1121r5hDLnZPda
         fJ4iw5AcN4hjARGLpqqa1lRj8ThcGsVrWF+wIyvZrBM6dXqNHhf2STW6bh2oIScUcqdM
         1zwuBvu0LyVB2WVpNEEHXehgyy6l54iqMI5xkxhukbs1WfxjzS5KPAfXOfcimrmeHfo1
         Bw42oZsymHbODMG9SY/s4gHmVDywvb6Cw6PTvyOhFCd1pfRMXlICfet22kNhD9C90oaH
         dv7A==
X-Forwarded-Encrypted: i=1; AKwUvByEh7EvqyRkW3keOZF1ySUI4vvbzwEaWOXc5U+HALYAFs7eO5jMgrIO9gEG0/ue3BqSWrL6V0V3EKjum00=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT+rILhJF7bihiw6VbgscRv8l2GTMo+1YnCxlhKMt58nMVopXH
	ZKO4qBI1RMgb2oBYakMxNXpDr/ghXypRyldRMI2CGXxX5KH129fI3/Ec5zDCq4Bl5coF3nBcuN1
	AeKcqAETstQ0cNkMnpy2UKFMIDMPPhOVwNCA/T4dATGLzwtwcNmMk5eFQ0n/z+nwFyA==
X-Gm-Gg: AYBFou1dOZ6+eNB/W4FJUyt4jBCj9FFYHTO3iX0U/Z6sDcAGZimcTCV7a8ZVt/tB9dr
	F6+Wjh69E3wEXUBWYtcpdI37rHbZyprO8SONnnwT+kUsQny6WHML8L8vD8GBsSWQ/cpReUjEMFh
	dccy3sxM4r9F6NbnhMt3ylgMx8jtzhehVmgz8keWrOw0Yb4HFdW4tW6d2P+ro07BR/sgNIcxXRO
	DU1RDmB5YEKhWnpRORWK//Rmq9q+vduy/mbyyinRigK6iDRRUe/yS8u7ON5NhdoQ4PFMhyZUH1T
	q1FOfqfZ83dsYzxUvMSq7/5EH7s2KSv/XndAT4WW2C1gJfEjRGoBgodNPc7TA02cMs4tRQtxj61
	C5gU713hWaD8T+k8Fx7XaP3ijdc5Wjy1CwcQaWPREI6Nxi2aJxaaeXFr1RSEJcZgajMsvicrG++
	5+fHm0QpGL/SWuIMilqawqwqbHEcF6Iub1eTbfDMs=
X-Received: by 2002:a05:600c:8b63:b0:4a2:40:7f35 with SMTP id 5b1f17b1804b1-4ac18993232mr37255465e9.31.1793356773054;
        Fri, 30 Oct 2026 03:39:33 -0700 (PDT)
X-Received: by 2002:a05:600c:8b63:b0:4a2:40:7f35 with SMTP id 5b1f17b1804b1-4ac18993232mr37255005e9.31.1793356772563;
        Fri, 30 Oct 2026 03:39:32 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2640sm126040245e9.6.2026.10.30.03.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:39:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Louis Chauvet <louis.chauvet@bootlin.com>, Haneen
 Mohammed <hamohammed.sa@gmail.com>, Melissa Wen <melissa.srw@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>, Harry Wentland
 <harry.wentland@amd.com>, Jocelyn Falempe <jfalempe@redhat.com>, Jonas
 =?utf-8?Q?=C3=85dahl?= <jadahl@redhat.com>, Michel =?utf-8?Q?D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Pekka
 Paalanen <pekka.paalanen@collabora.com>, Sebastian Wick
 <sebastian.wick@redhat.com>, Simon Ser <contact@emersion.fr>, Victoria
 Brekenfeld <victoria@system76.com>, Xaver Hugl <xaver.hugl@kde.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH v7 02/16] drm/solomon: ssd130x: Drop the init-only
 assumption in ssd130x_crtc_create_state()
In-Reply-To: <20261030-drm-reset-state-flag-v7-2-4e55eaeae683@kernel.org>
References: <20261030-drm-reset-state-flag-v7-0-4e55eaeae683@kernel.org>
 <20261030-drm-reset-state-flag-v7-2-4e55eaeae683@kernel.org>
Date: Fri, 30 Oct 2026 11:39:30 +0100
Message-ID: <xlv1ik2jfp5p.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
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

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> The ssd130x_crtc_create_state() implementation warns when the CRTC
> already has a state, assuming that atomic_create_state would only ever
> be called at initialization time to allocate the initial state.
>
> However, atomic_create_state is documented to have no side effect and
> can be called at runtime, so that assumption doesn't hold and the WARN
> is a side effect in itself.
>
> Let's drop the WARN, along with the comment documenting that
> assumption.
>
> Fixes: 1345de7fe9114 ("drm/solomon: ssd130x: Convert to atomic_create_state")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> ---
>
> To: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 3 ---
>  1 file changed, 3 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

