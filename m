Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821294;
	b=nBfQvQFw7yfL6JdloXROjO/cpQOOsoOtzj8U0zJVgLEf/9SpDqybmA1f4WYkQQhgez7C
	 iMlaac7YZ6oNiFpldlI2MvEcv9qeAE4E+DOCj/qBt0njm70xQHrP58GdPzItmRy8gqrI5
	 O0ceqKnoKv5ZZOAHSY1iwYC+47shQ6R4e2kugRMO3WIfSuT55iGI8+pHPdpZy5U2/3GT4
	 dUF1XFlFvPiI9f/sbIEffCZOYf8zyNQa+EXytAXhqT3YnXHczjUTwEbotgCCaLO7DFAsU
	 ennu10F6+iBfm+8VdqFCuDxM3S3g/ViojCmKRYQJ7XTvlquJkpOZjKQhCFUWf76XKJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821294;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=6O5L7vNOw9tqxoH8eLe9M+49Omq2w8inLzq+ECt/NxU=;
	b=YJ8egVv7LU0Ct/MpybG676+PJJD/afCq3anuvA2n4t/iosa8xmPhX6hIi0tLF8XPoUyg
	 uim6+aZhMMCC6i0t7rAc4+bR4FZzhWJrx34pHnM/6vCvw+AIG4/jDBBB+4SVhtis+/lMi
	 Et3Am9ZXMcHlyYnm6DlwLVWHkBdkGrUB5OyDGDo2UyQJBKXnnc5K56KJxhL5EXCAGTuGa
	 ba93LgTFXWP+KhlCC48bQwbZQEvEvextZQqZoCsgB6ECILRo3SuJcVpXP1Z8dafhrvpIu
	 ZELxwth3rj/y3S1kHPFV4yNaHm7MEp4a4lsjuqcY2vP8iQyRWrzFcO5BWBXgi1ls8YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PfpTD6Bn;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k4Gpogb+;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906FD606A882
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906FD606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PfpTD6Bn;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k4Gpogb+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794821292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6O5L7vNOw9tqxoH8eLe9M+49Omq2w8inLzq+ECt/NxU=;
	b=PfpTD6BnovXWJC7H167tZUfe4rtxqRsflFZKnxpBZxRU4isOxQUZhHLVmU7lLzt18WVjZ8
	u7f9UmO9MwMLljmcRhVjtcQ2Tp3JHpYI+x3CI+2DG0hRv43qxau9DW2JDUzJnpYWqBcz2f
	2ReD4B1TLiszBAoFw8YBejdIAeZYc5M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-0-Z7DPrsPA6Tmyi8TUJXkw-1; Mon, 16 Nov 2026 04:28:11 -0500
X-MC-Unique: 0-Z7DPrsPA6Tmyi8TUJXkw-1
X-Mimecast-MFC-AGG-ID: 0-Z7DPrsPA6Tmyi8TUJXkw_1794821290
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb680f0ac4so8287495e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794821290; x=1795426090; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6O5L7vNOw9tqxoH8eLe9M+49Omq2w8inLzq+ECt/NxU=;
        b=k4Gpogb+NxvtkgKoFmrGfazY17Rgeqt1JJiP7+5HqjU7dZuqo5obuGm1MerrXAyEhU
         AgUplWVXHwsqM+lV1AzraDc3E4Irm7gZn9Ob4nMsbyg1mvnlPH3MBQxd8MW+sQiXdKzk
         FmTI3pF4XVvWX4+FeaZ2qcLUv3fq3qdimlbmhwk+6bmAxvoNu7NlExk8muh2TfEbn3To
         imEvuvimqKEBy7uqtRcnXQe5zuf2W4Oz8LwegtufN92Wl5R+M7C45uLEviVgzk1z1rrc
         v+pIbE0Jj3/zBf7Lcg2I2BRXnlO199jL3rm7NrPLWZ6FPmRW5CJJ0AK7OqfAEvPB0Mai
         /meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821290; x=1795426090;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6O5L7vNOw9tqxoH8eLe9M+49Omq2w8inLzq+ECt/NxU=;
        b=eAYaBppOxhGP4GXQVuABGRPtXNqQzsTthn3BWRMgKmcp7X6DMO+hXjjAi3j7jgeueT
         h0gg4CbYnvlf2JgToUZslmV3Ym5O2Ak4pXwBZSK1UtOMzqr7hXiXRe2X2lAXFZOULwy4
         Xsg+SvWKXS/CUzzxbwvioFTbP+2VsnGT6BRWEqZwpTYPO4MUkAjJsGbAWer5RPF0mskV
         CN+/RU3mk/HmQr8Xk+OO+X9/BzySi5pefZ0kfFE/Cy1+rLDYZmriBArfNTRPijFpeYkp
         9MMp7erHAB/07evOjESBd7u3rE7CpWAI6QoyMFHd/37bvm/Vp1PgEj3CE6Yx+M7cad0T
         5pSQ==
X-Forwarded-Encrypted: i=1; AL+hErHhkvXpypql6OvsglC+4mOew+D+MAQM7zKi+cT85tDiYix8kDjv2OWD0pJOxEnMwx6lsP+iI/5iVWrSnC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lyDl/V9VzjCvX67Wjc+LxhDDmjHRK4TcDvmRUXqvTeZmP60vu
	lsruhdX4FvnLTCDxLtor9mQ0HyQmACCHxWP+N3jEbjt6vRYhZEAhzta16JJwzjslxQAjjEojYii
	o2GNC/T94PCB/cGZhR8lKLnrw6vVoHMVMqQ8cPEUEroi7QmbK/w2RBaKffVgp3iILDQ==
X-Gm-Gg: AYBFou0YkQQpXF6u7vi5qdEzFgwhzDnS0kSHKi5oIxYJcNqA8KKTvUjEyyM21thnrZM
	pdG/+CC7xh1tIxCfx3tV+Qr7ibcBQzSx9n1u3mDaI65dWaWVxjiOmu6VAyMP+cFK1hsOAMSmYF4
	Jd2gWvRXMDrHoZIdyLAgj5uf23bxAFXt7SQfYt0rq6lRTVvVofXppWXOzTFIRM5Ayndba6SfT5S
	rLQdGbQWu2O1fsAdhVt89h53HNeusn/Io/lDElK8xeuOuMIAjQA6a/k9cTeMFSsqLY7RKxIkl4R
	CjH/0HbEeSUrrhF/jBOFAjf/taYFpQGnyKkcvDdR5eKrllSwfZKzznVRCw5QTRqIasPSJFf2Rio
	vLAcQuucMUHMkJy+P0wQmPulZrBLfQEGo7Xaj3h4A9j1/xzi9hxfONP4J+frmmayMFoqdp/O0XU
	ZJDgpu+lNcknWkPLEKJYngS8AnCXC7MRSkPgDZrHc=
X-Received: by 2002:a05:600c:1993:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb659cb9e8mr125481885e9.12.1794821289810;
        Mon, 16 Nov 2026 01:28:09 -0800 (PST)
X-Received: by 2002:a05:600c:1993:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb659cb9e8mr125481505e9.12.1794821289312;
        Mon, 16 Nov 2026 01:28:09 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm139362015e9.4.2026.11.16.01.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:28:08 -0800 (PST)
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
Subject: Re: [PATCH v11 08/12] drm/bridge_connector: add luminance support
In-Reply-To: <20261103-superm1-backlight-property-v11-8-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-8-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:28:07 +0100
Message-ID: <xlv1o6bpruqg.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
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
> Discover the last bridge in a chain that owns brightness control, attach
> its relative luminance range to the connector, and forward atomic
> luminance updates to it.
>
> Do not infer panel luminance support from a terminal panel bridge. Panels
> still have direct consumers, so their connector integration must remain
> explicit.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

