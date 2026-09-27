Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607B535F5E3
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790482159; cv=none; b=qkG+i0CtbAeUO7X0EW5k/KW4gMDrBZqJnJn1mTpARhXMhAn/jx7kKc2OQxkiEgidSfUs8Ry5TY5CJKrSWWcotO6sI4uowkZWW9msDVKjOY1ND49sEy7Rj1r8RtpLaO6dikBpwW4mr4Bg+ixmSbhqUfFtAadb7u/CH3lQPtulLUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790482159; c=relaxed/simple;
	bh=2LjSmy5wQ+RbKF7JAhK6ovvEPU2UEhSF5hUQSR7JJEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ef6nimiocZnw0ngnOv7G1ya+Kb08G0HqeyurSpuieGLiotEkqIJJ72CDRpfudJ/bgG4e8e6o7n0Jytp2giu+pk9Htt4TB7/5BcB8hCiV8KaZlEnC8QXrrDdl5GEcYfK5TRJ491iYWhZrALN/KDGMU2XzwhUXpWW8mKLaaEWV1Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebIb+H6+; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebIb+H6+"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2df8de41d6eso12591515ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790482158; x=1791086958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LjSmy5wQ+RbKF7JAhK6ovvEPU2UEhSF5hUQSR7JJEs=;
        b=ebIb+H6+S8sPXmzVvL5KtIZlewsyrZN9vsywfEhowV20ddZY0hj0JFtcknAYSaZtON
         8eyUuqOb71gy/LPnTlJGdm64Rk1mnJboVuFYq29PV3yNRaCLFow2gkEvBjo7o4jMyV53
         1qZmUJVHwRjdoQGpbkZgJM6FIK4uRkjKzvwOhgEcNc0MlPCK/HHZ1lWDfQ5oqQYFfzEZ
         rSKAE9Q0oe/gu2EismcxOyoRIpS6ublIZPRg9SXrdBcGk3CARTIZukCtMzSJDu1dT/ta
         Vyw0n0q+h1tRZbYFEpKyyMJ2P/QOMEW2a23LY6guyrPxVRw4kmmA0b/ur0xddxiTNMPn
         2Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790482158; x=1791086958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LjSmy5wQ+RbKF7JAhK6ovvEPU2UEhSF5hUQSR7JJEs=;
        b=MLNtZu4QM3xyCS7CLFi1FK/Y93Ta5QcPUAMntJHu4On/xOtlxa1vIhiIFqUBjUsrEM
         8k+/6zqPHbfl2sca5kI8R3zz9j1VAiv+BMnvujEoSYYRikysV8mRyDRuW07hS00xNR8F
         KVMhrOgoVyPAHR7WdzKLpaX4bHIWoP+/kGepB0MeT/k8P+WGvhamlv1xWBO08xiUD9fY
         Nyti6rR+Y0NvVY9fEnXMHdX3I68hfGcBiU4akQua0q7cksr6ApC/sgVFApindnS+D1kD
         M4sXRzuqpe6g2vnvDLG4+eX+EI3OQZR9qjAP0jCImFweAuJA5TZ1cYp6c5nOO1dzfIVj
         FnFw==
X-Forwarded-Encrypted: i=1; AKwUvBwl2AC8mUCbOMLzAo0z87VyWCHl71ciERC0ep3rwGSy/CfPNcfA832ZG9sXy+DCEcaGyDoz9QSCqiG8h+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6c8M09bfnvNy5QdhNA/moteaqQMSJ9/AAohn6EkQq3klH9yIZ
	2M0P/jWxF5uFfIsN2Hx1wblv3JPqi1jhT+VIMfSP4cD0PxqWzAHUxLEt
X-Gm-Gg: AYBFou3Ao8lDkfrtXaBCYA14N/Ms+ysgRmYSYuk1+gkD423/At1r6M9JfuYq1JkeQ5W
	FepgjiltrJg1pR2gwsgOCzOwQGSEwkq8nj6lRDS99qViiBatvbGbsmjU+pbi9M3iMpZEdEKTZgQ
	HBehfQ+ZggUtBBh5MerW+cQnlObTkRLfU1kfsZypMzRFcQjkwUJoUP19ANBiroGM8CDWslJJ2ZK
	iLgaRhvJGc0GHABXT3fWvZ7x5fAYu6csTFf9TbqeTvNPsAH3gvBYWU/36TpLLusw8tpIuwd9TwZ
	AqBMCyrE6IMl9FpocfZzOoFAEdPhkbR2FQEYFdCB0n+th7xhS5cQCTz05+KzDMtlHHPD9edoHz7
	VDeBPPZwrLCl0zzz+Nj9NPaFexn3GZZMGAzNEFXmqO/SNQ+wyoUhFdJhh/aprDKehlXmyvbbnMs
	QwSLQbXNKpGBPki82M3U3D2Smblp4V2flk9WyYervOk3YiCiU9UwI3AXjp4LwsXmaYwulrGucKc
	uGZXVVMpYS4Hjk7
X-Received: by 2002:a17:90b:5107:b0:3a0:d823:c750 with SMTP id 98e67ed59e1d1-3a0d823cb37mr3049456a91.49.1790482157721;
        Sat, 26 Sep 2026 21:09:17 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:3a0c:2ea9:4ab7:bd1b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09766210bsm18717708a91.8.2026.09.26.21.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 21:09:17 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Hillf Danton <hdanton@sina.com>
Cc: David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	syzbot+1b129b44597a126d2d79@syzkaller.appspotmail.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev
Subject: Re: [PATCH] drm/virtio: share one vbuf cache across all devices
Date: Sun, 27 Sep 2026 11:09:11 +0700
Message-ID: <20260927040911.15181-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927000323.299-1-hdanton@sina.com>
References: <20260927000323.299-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 27 Sep 2026, Hillf Danton wrote:
> What is unclear -- why is kmalloc failing to work in 2026?

kmalloc isn't failing. The failure is in kmem_cache_create(): the driver
creates a dedicated cache with a fixed global name for each device, so a
second probe while the first drm_device is still alive (release is
deferred by an open /dev/fbN) trips the duplicate-name check.

Your question made me look at whether the dedicated cache is needed at all.
A vbuf is sizeof(struct virtio_gpu_vbuffer) + 96 + 24 = 216 bytes, which
lands in kmalloc-256 anyway, so the cache buys nothing over kzalloc()/kfree().
Dropping it also removes the lifetime problem entirely and needs no
module-level state.

I'll send a v2 that switches the kmem_cache_zalloc() calls and
kmem_cache_free() to kzalloc()/kfree() and deletes the cache setup and
teardown.

Thanks,
Nguyen Ngoc Thang
