Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820609;
	b=gsjJvvsqOUB9qEplNjvQU6l9dF+I2OgyXDF3fwMBMqshYI/N8NAhfjvB8QhKKaGuarHC
	 +TgSIdsiJ/RxeVynEjrxkCDHopHrSRr52ZI9pG4Nq/HKGe9L1J1EckQtjCaHUdi0pzRWI
	 zjVOozYuWKeUQuAV3OkbO0QkRLBkdnR0IYo//3YiSSmAYPl1utVLvPQOno4fp1scl/CSM
	 toIJP284KDTC2L0Hm1TRLH+96vzmB1+R/H0WX8Wo/5SsVmFcgTFQ9+poUrQlFZQjpl1G9
	 WHV28SGMdXPM6HmTJVHV6IPIFULt8R2jgqecyQMFinS3k9e3che/ltjH5MC29k+8Org==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820609;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=oRP30ct8ql2mTXDmxPgRrEvZM+dzcMrlEdSg9+eoSP4=;
	b=w75KRow8zPCxbfGXXJYBrKc+n1AlyZLOj3AOIaSRcNXCFdlA23KMXmxfCPTFM1cmHgqP
	 bzDpM7fP7IG5WUlbjF5/o4wo9yVBQjrHg3CjiMgc3MfLC7ZIsIkLVdUbgFOb1C6dWZGo2
	 Xz0/PCEssUFH7Q0FnPSrlnTdGbRt3NS9EQYaliek/420hc8V1ltZgMG55mJZX3iOgWwkd
	 LCu7AaQX9XeH0O37EGzPXfEOjzuJg5F/EtQXnhKGLHsu02pz0qZPd13XeJ5badSZXWOlV
	 UWS6wCRKwFkWrA5l+IIbwKr+SZxMwC9HevhH1Gu0PIvzCMHqVb7qPrsKOaQcc7LcxjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EMITteBu;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GZtd7Rie;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1841A606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1841A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EMITteBu;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GZtd7Rie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794820607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oRP30ct8ql2mTXDmxPgRrEvZM+dzcMrlEdSg9+eoSP4=;
	b=EMITteBu+Zq8r2lIitF9xBTTKbkSgXU4IffsBkd4BZFKpcgITbCd7jZEUSnebvtB2Q1W6d
	PH35SJqECAscrYKbWMwb5wWggcBbMPV98Z82Erc6SmcAfUQrQ+UmiqSowFcYnMHNmbUBtL
	/2QOZwEK8sHfcBqS3vJlpjRRNyFyp5s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-VTmhhHQBPaSChTRh-l_owA-1; Mon, 16 Nov 2026 04:16:42 -0500
X-MC-Unique: VTmhhHQBPaSChTRh-l_owA-1
X-Mimecast-MFC-AGG-ID: VTmhhHQBPaSChTRh-l_owA_1794820601
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49090fde23aso2785016f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794820601; x=1795425401; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRP30ct8ql2mTXDmxPgRrEvZM+dzcMrlEdSg9+eoSP4=;
        b=GZtd7RierBMlLZ69Vt/7JLeZKOxK4twEu06OtN3b9TiCAC9PFKp0C0MWuuNodJcE1v
         uAHS8hEm7CqAw7dyHUo8XlpvXKwLy/inIJzI7endk4xa9UAMcaHfzwBypnuZsIBe4pCu
         DJycsltaUR3XcDkOvaZI8/ERVpkRWUsZR27OXkT/NCQPWP2E96A9d/QIBU7rjgKg/D5g
         wfxg1bo+oIA4IeAsDZZd9zahz6doVTHdh3uhUdsBPZo5EU516lvAwa8n4QjjaFdFlFR4
         egDta5m7u6XU7zTQhVE+bRHvZN3ycECW2zpWwz96u93K1Z8JIiBSPHIDEdW59BCpDsGU
         i+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820601; x=1795425401;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRP30ct8ql2mTXDmxPgRrEvZM+dzcMrlEdSg9+eoSP4=;
        b=MsYa1KPlltEiGZMc2uric1/uJgAw4xkJ4aHug8g7AuIUreKsxURdcmEZh9Y4baGzpm
         RKUnr7XdJhqGHUZAbGDiAtQgHJdm8bnBACVtgiCGHdRRI+OMwKFhiY9zQYqKwyiPjPJF
         hHJBJSPCh7jAlWsGWvybOx0Edktt8lvIR5humf5ezgcAmzn6yzkE/LMWGISxaQ2rhHEf
         ZsH0Ly02GudFALZD8/PVgXBX9UMhwAFd0IRM1/COymBvn8HDHg1TyAp2L9ujGQMBgHa/
         zn1Ehe5WJ1+nUIZcEuKpxfVs3VbMnmetHcjzPU3sS6gq/ZnYDnc2/53JYyKAtYlF8qJZ
         uEqQ==
X-Forwarded-Encrypted: i=1; AL+hErGx8Z/fuLcjxNCCH82L3ANFdBU78nwSy+I+LxXpbqzjlXCn45lz7kC0DRjxpj3rPP/vN8xbrFoOWy6O+Rk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l+jE8o/48WnhoEeGzrIhOMP3Klk5/+fST7Xe34nMnmVli6w7B
	0EwaQDtvTTQlTTpYJpIjbT28+cIaKF7Y/vjuXFr5BMI78usLuDJQgDQ7HEw65CQkbvIGC8a2Pue
	hGFv9osmVH4r2S91mYOTOYumSZ7j1gLQQD9fQH5aOjRAoPH/9gvvtSGY8wx25CKJ3Eg==
X-Gm-Gg: AZFdTZcihdbnnSWzskbvqJfDBSLxoSbtdvU//xPEBcbjE3HuKt9yYYCucvkYCAj8Jls
	Ei4HtRlBLhGIGD0iSQiTpZIrzRHgBCNf/KXcnmpYP9A8KB4mHvTQrB0iUDH7yoS/fteSL3ZlTMN
	Na+ZiorpUSr/AT/IUbNJwsCnWqaxfdTX0fJ1eUUB28eb5OHIUyxOxmTv/soMtzY10feyljX9KeD
	uQsbWek1p2MyM3iLT4NLt1Y86pd44OB34ojKApZRlLAj6ypXNzTRoLlOjz31hediOF20Wgfgudb
	sPh724IZshe2FtAHNJdFF50+2HKVB3ax7I31lOOJeKUkXaS4PKVOmLsRWCCuCTDRAMq4cA3JW6F
	s1HXo7VC4+kHsM347HV+wCCmh1+nf/WpOD0oMzu0GBgJrCYOWsNyqofWylOnfz7iKcyz+wbs65H
	b5c8AuoN3ETi3df6Cn9f7QP9TX1PjFcGUdVDZZNMg=
X-Received: by 2002:a05:6000:4907:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-49c6d453058mr20772411f8f.5.1794820600432;
        Mon, 16 Nov 2026 01:16:40 -0800 (PST)
X-Received: by 2002:a05:6000:4907:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-49c6d453058mr20772359f8f.5.1794820599837;
        Mon, 16 Nov 2026 01:16:39 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49dc430fa15sm14802191f8f.13.2026.11.16.01.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:16:39 -0800 (PST)
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
Subject: Re: [PATCH v11 06/12] drm/bridge: add connector luminance operations
In-Reply-To: <20261103-superm1-backlight-property-v11-6-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-6-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:16:38 +0100
Message-ID: <xlv1tslhrv9l.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
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
> Allow bridges that own brightness control to advertise a luminance
> operation and its supported relative range.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

I'm not a bridge expert but this make sense to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

