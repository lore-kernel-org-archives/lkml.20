Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903813;
	b=wPIVfe50Exnpp4YBFuNX15abMBfiax6HKIEuR6EU99FI/9Z4bwnbRWy0XazVlaEBmj93
	 nbRAgoNYSTxir9CIM6UpGlzsGz4BwZvAYPwwDb/807c2Xs+PJfvWgovoy5iPASP24KGOK
	 v0KYxsfvESdnATHC0LDN3uTDbzZc1XzrWLOdN0Z0ABATnhfYUj8cfGAvOjq0MxUwAyi1D
	 yOMXhFJfJpub34Otiy7wFe5cwa8w8c696YtweXN9cuIGrciqx66oYQ9mvtWrL9mz9k4lr
	 OYbS2giTWIwuOyOMoEbicSRKxP2TBrNkK+aUpFTqos/Cm2VE2b29c0b7G77WGimqXGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eURpXedoFOfRQ/r9QZEtib/RzaUOHxCVKJ6f94qIWpI=;
	b=ZHRCwA4lR8ThSuttbWSV06pvo6A+7DFbNhO3VBfEEayLC6gExKWM1slBhINf6LmSmM/c
	 r+z1FEQpTLRKPZbDYOBQ2I+B82uvDEfK3ssLyFeLKAJOhzKAqCalcjcPJvwXV5GQdfYIX
	 MkqwSH3E/GNedwRzg7wby99xxXyMQJUMo9xl5KXTcG4aWUsGV+XNi1VhwJbwTPOGAnCQP
	 Ruq2O3dVJUF/VxasrPEgWb2sBEorSsNd3u1xgQZ5GEomX9dj2HFuQSxdAbeXLtV/9LhpZ
	 /ehN/xwuB6xKyvb0bzTZWvC7QtWJo630vWofsM5xe1AfiO1T31ZSFVI8z7AQxu2s50g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bd+h6zFw;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD53606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD53606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bd+h6zFw
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so14272535e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793903812; x=1794508612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eURpXedoFOfRQ/r9QZEtib/RzaUOHxCVKJ6f94qIWpI=;
        b=Bd+h6zFw1UenVZu+0VkgRapkfeUkW6q4wu9tEFV7P5saU9iKhZsiba4vqI6ZSe0HRL
         SmFVNYj/s6OnAk+wsEgK7b8aQfJbyG0UOt7jfMbzV/e4cUX7tPKBdjykZi6a6EQRso1v
         y2zF33oeuehZtCRlBKSh0J/s3M88Ih6e8w5VRTlDGa0lT2fLrVCTW9h8XVsc41056xPU
         XTvvGNLVBIXW0ydkN7GXvahkhW5/dBhjD0oQPFUdMd3FwxhyGkDELurxGQIzCxpw98YG
         sr5Wk5c2mw2hKlXAq1MhJoHRyxEY8Q2LCDXKf8dsmqi8YeQ1qeZHL7cJCYHIwGwQLIJA
         v2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793903812; x=1794508612;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eURpXedoFOfRQ/r9QZEtib/RzaUOHxCVKJ6f94qIWpI=;
        b=uGr142x6wNxNeSaMCT0xrdfoiv99TMaBGSHnwxRMLM1Q4xvv0B2Sb0xF5WcOvQg3rL
         QiWMiG4guDn4RXsiAAVd9/taC77Rj73unWsC9A/cna0bFf7I7Wf1yCIDhHewQqD/mhFW
         rx3ccvuWGWx45t+IzNgqB86j2Ki+5R7rL30j4cDuRAIu5VuqiNKoB1YYa513LAXELt22
         4kszilInhcL6arVgwBDGVHzy8rq5NJyeWMtocynQE71WOQGPUChHw5wYmX+Lr8Xgr35R
         KBkM3IkLWrakqiwuxnNvJkLjrDtPbQaqaoMU8mzXjFAwqbqK/C4Jad9kSB2jQv+uQb7p
         ABqw==
X-Forwarded-Encrypted: i=1; AKwUvBxCKGrVHUjiIWy2lBLNUVKs2mFdbf+8gxLqVNKQsN9BAGnbQC96g/AbzS/RhyxjcrZS2fdFTCQNGEUigHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z85DVv92MttmMPteyq97z51eFFfMaUeKRtTGZJNbhR5xxrHNEuD
	T1JHujqfPc7Om11QDWWZQWhPZ4I9gy98Rday7O6l/WX1v7rM73Q6lJ13c0MSFbZy
X-Gm-Gg: AYBFou1sMDsiUSHn9HxjvWRVldYzHpkTZxRJ4wTMTJuM8tRD75Pc9dk8GrQ1NaWENvE
	a1G92auuq+rZr7m4927gzmfXvI1mooRGoH3gvsWLXvNHBCejRjBpHnmauUDadp+2B7YHJtlbI92
	lFm1N5LKryCdxOyLx7A6W0CVBW3t79uBIVtShruPcs5AV9JHfOUzLpcFYdW5cBWnkbNR2EXStep
	l8MXuyhLgM0W6HG/HQGSUOcF/VY8GjgAciMTmA6R4ShP4wiP7/PFT8axJCZWH8IDwUUNOYZZ2Bd
	LdOwHm5GDzY/bZJ+xIcAesOPPnRegHvv5bZK6IbDKd5yklv/DJFp4fIZ5E1VCkyNwxa1U8bBuyz
	bePJrpZhporQtf42SspalCQyMbPglRAGg9Se9EF9K8CVWZ3vyuUCRwGLbN66V43PhwwA6g6AJ5C
	9sEuNeZSc3T2x61RmOa6P3OsKVf5mt0C5oQNtBFxJWUBkz4c17U2QcAcDeJPr7gv7JavApUvJes
	fEUQXx2sqs/GfPcAAPlNT7fxprpdUkZiuJNWJvdQDOzAuGhhI2UMB/0jJ3E7rua5LEDPsl/gH8b
	zfgh0idkSAgKjOQkec53B03IWLh5Zu0skQ==
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr435027495e9.31.1793903811876;
        Thu, 05 Nov 2026 10:36:51 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e59d3sm89170995e9.10.2026.11.05.10.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:36:51 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/vkms: Add drm_dev_enter/exit guards for hot-removable paths
Date: Thu,  5 Nov 2026 18:36:44 +0000
Message-ID: <20261105183644.188127-1-oaroraetimis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031225901.3200167-1-sebastian.wick@redhat.com>
References: <20261031225901.3200167-1-sebastian.wick@redhat.com>
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

Whoops, May I ask about one path.

> 2. Conversely, if struct drm_device is still kept alive by an open
> /dev/dri/card<N> fd when crc/data is closed after drm_dev_unplug() sets
> dev->unplugged = true, drm_dev_enter(crtc->dev, &idx) in
> vkms_set_crc_source(crtc, NULL) will return false and exit early with
> -ENODEV. Doesn't that skip vkms_set_composer(out, false), leaving
> out->composer_enabled set to true and leaking the vblank reference from
> drm_crtc_vblank_put(&out->crtc)?

I followed it and think it really holds. And this issue was introduced by this patch.

drivers/gpu/drm/vkms/vkms_composer.c:vkms_set_crc_source() {
	if (!drm_dev_enter(crtc->dev, &idx))
		return -ENODEV;

	ret = vkms_crc_parse_source(src_name, &enabled);

	vkms_set_composer(out, enabled);
}

I understand the guard is meant to reject new operations after unplug. However, since closing the CRC file is a cleanup path, skipping vkms_set_composer(out, false) seems like it would leak the vblank reference.

Thank you,
Oarora Etimis
