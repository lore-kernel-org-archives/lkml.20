Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563117;
	b=sXsNLny6TPq4OLnp5KT+FSUS4GJjVr5czqSX5V4T7ZvXqwrcVofFQ4XneGIF2+lxxeYD
	 MDzj6shu5TmOt29tW/yCwSuwnlDilxo4v8F6cvctkhaZLyRx1pzKkhd7iGIoU3AJ0ngEE
	 lYVRlcSRY6liZ+GDg9wjy6rOg/gcGE036HmngQla7obELBhJmcuvt7X2bb8cKFHnZdaXZ
	 jQ8yGeEHjuQY3nUfPIS4bShpmZAuEtaZXZJKu3GcshhixJKSL6f0xl2eEFAZJbGr7eY0t
	 cbF1xEGM2M5gK4UicHR2yRhDhwXSjSsSfE6qAJOqNcX7VYLQR4i47gQpoIEoEiObiZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8hYidytS7YK6Ok3u3Q5rgMe4l1KnCmLsvRq9ljIhQUY=;
	b=ZT6e1h/Ybqf+dO/FmT33d39PkPoaEcwrkzQ3/zMb2S+jTD2Sh1nCxffSuheSktD3XEE4
	 zYqHHQUC8EKATAmeRy0uYWtxww/P+T/FNt22yZsO1t9ewGGBSfiJFS/n1aPUo9SqDDDn7
	 pZrucpWturlJhohclLvd5dZ+3LNuBXXz6oFyCoD345+/cMjcdZ1Gc6vPB05QUyOdcO3iO
	 /9+kOa8e7nSWgy8wDUaX8ChTvTleztDPUtn9lM5z5S0b62dzcHlUJjw+Xjm5jbDOVd3C2
	 QqB+uYKFlfnBBBlD5B/LdDS4CmM8N6TSjPDA0t/vOASNVEBcWvpiNR2mX9jqkZgPaLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pt0em463;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926C8606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 926C8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pt0em463
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b904d10882so276717b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563116; x=1795167916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hYidytS7YK6Ok3u3Q5rgMe4l1KnCmLsvRq9ljIhQUY=;
        b=Pt0em463qwrKXrtZBRFDug3OiYijWpqTA+79wV0SRY1mbwIxrW8hm55txhCe2aLH47
         8IFXNQsxnv7ICvFgRfyRj1l1PvyP2CGmdbywGu1R5D2jLs+vqQVKLfLm5VI/ml58fP9T
         EnUbtR21ANmoaFhJcsyxffP63Pxf2fVn1DfkRqhNjXFOonQNQ69Ygungza9rao0bQKk9
         hsqEBCKlpuw33lfoAzywAl8O/IZuwOmnMOgD+HfhyralsT3ajNATnnJsh38712KpEMr4
         flfDmJp+ZGTL+inLEqfHbwInYVtyGFmZmSHRnaSoSm924w/TToWza4mUjvNK2iKesMcM
         r5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563116; x=1795167916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hYidytS7YK6Ok3u3Q5rgMe4l1KnCmLsvRq9ljIhQUY=;
        b=bbUkAg9v3X2F2H6KmSpcc1j6zC/eLJD/6c7vOKaTJWm7Nc3qfp2l6AhiITv4l8gXFN
         27iO3x6EvbxjjrbPsBIZ50ReJxfVkaDlTqkrmp1gWvTYDsBVxBh5olfXhh3kgP+XWWcr
         cUafAgfxp3rSFjkfThGvOEjn6V+xoN28rRsj66ZwzYmGyWjwYEZZyTkNETvPl9TFsoeE
         OJ15IX2Sq324L5xOA5T/KXs/4NVvj4IfSxHr86t7XvhWUqO4xUudnenVEfcptzaYAMpG
         Gfs1X5tBBOA6M9dFD3lJNaHGqelqEuXjXtrnrr/Imxa/8zADeuMqAC5lqTWyUgWWy5C9
         eFIg==
X-Forwarded-Encrypted: i=1; AL+hErEVCDmJUqhilGSLuC2kG6FvhfwDd/oemR311k3JkeAD02hVKa3Bmhgab0/M2uiufSBWJ33/qA+oKECx5yU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XME0LyGWkD3IwURweAhYEi3xvGKy/yYG37aTrrfZbo1LIAAjN
	EgpLjnNWfnvNSTi83gJ2LmfQK3bnuU5sdF/3P5OJGQD0iYtstK9YVyUf
X-Gm-Gg: AYBFou0u/Ex0rzf9Z12JDN4+2oi9HowUbftTnhhUXYdIXFtfw68ETbwIYwyY9R8vft4
	SUO8MMKl9s53NZ0ae511Lzytp3lYOu2WfTJIj/K4JMrO+QmB6YqWgZQUqsIL7W2kF2ayCAqci7h
	VRtqrk8diJXzMXMv96LgpDyOkWZrwuHJqCsPt0NgV4TqEKTWH0uiiTUXnSgqN444ElvmJGqsJk3
	l3NVFCeV/oTGBkeEUpxRC9KqbtxI0t7nr/4xK1iE2l+T5kw9/KTEdT54dUOugP+dHqmL84Z1RCc
	M+0PvjNiXC1dl5OMcCyihlZtgqreKQO+ShklXkLjB6ksMkl+TTvUnZ1qy7Pxx5vNp0Mg2dy/fEA
	5Jzh2XzPTgKeb037m/+Z6uqf0trFOHceDLXBA7FIiegzORpaJ8/u8P2d1X4sdW2qyFOsJQH0K+f
	uOOcHFZfTobZHTRcZlAZJVnn6nTio3ATsVnHrJ8WfoU5EJUQdq/dPR6RUZRYoak0Cv11Ynhez6V
	pwEv9Rdy//zJ0lQGPyyCpgGH9nUmNUsmS4KTZNUjTEN+2NE/7NdioJxt7Bm6jcBiIVJiIpAv92/
	X2xIk5Prn1sBbTTqYe0MEO3/AWkv3DZReQBe40n2
X-Received: by 2002:a05:6a00:4b53:b0:89f:4cd9:241a with SMTP id d2e1a72fcca58-8beb724ceb4mr2078645b3a.41.1794563115702;
        Fri, 13 Nov 2026 01:45:15 -0800 (PST)
Received: from oslab.. ([101.6.42.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2d11ac8sm804533b3a.55.2026.11.13.01.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:45:15 -0800 (PST)
From: Tuo Li <islituo@gmail.com>
To: boris.brezillon@collabora.com,
	steven.price@arm.com,
	liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tuo Li <islituo@gmail.com>
Subject: [PATCH] drm/panthor: Fix NULL pointer dereference in sync signal cleanup
Date: Fri, 13 Nov 2026 17:44:56 +0800
Message-ID: <20261113094456.5000-1-islituo@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In panthor_submit_ctx_add_sync_signal(), drm_syncobj_find() may return
NULL. The function then jumps to err_free_sig_sync, where
panthor_sync_signal_free() unconditionally calls drm_syncobj_put() on
the NULL pointer, causing a NULL pointer dereference.

Check sig_sync->syncobj before calling drm_syncobj_put() to avoid the
NULL pointer dereference.

Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index dc8d0191aef4..8d73956530a8 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -364,7 +364,9 @@ panthor_sync_signal_free(struct panthor_sync_signal *sig_sync)
 	if (!sig_sync)
 		return;
 
-	drm_syncobj_put(sig_sync->syncobj);
+	if (sig_sync->syncobj)
+		drm_syncobj_put(sig_sync->syncobj);
+
 	dma_fence_chain_free(sig_sync->chain);
 	dma_fence_put(sig_sync->fence);
 	kfree(sig_sync);
-- 
2.43.0

