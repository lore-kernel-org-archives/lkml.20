Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778778;
	b=K2PbBWPqUq7P4mET3U5fiqzENKkw4M3TignrMJfrKnnGq9XS2UeflvtSyGSUCx2/ZmDJ
	 BDdQm3HQ1GjvZAvL5FerwLQvNZZT+XdqCfwTAv40IfQ2jEWO86K13z/QeCqz4snBJxvZl
	 ms9dgXsapuSee+8x7GpUp+1QgK0mtVgO8JToFrebcevt67v2J5zPVlvensl+0kiElSZ8W
	 F5hEkwguRR/Q0lCLd2sHWK6vtArbTRPnfcR10GQ7GKNf3o3ctxlOwQFGanGPDRJfdlqgd
	 /4fH4S5yh9vm9mgPBQ0aKRe2NBgC/eoia99NWNHwyhgFzlo6qgK7TeBc5Ei9hFKMX1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OWS8erEqBwwq3aHveLY854LGBihUxBRE7Vkb4G0BYjg=;
	b=2wf9vJivVr9eEH69XZ/L7EJsgaug5847UhD5+5HKyIfKxIenyy+SYM5z6VI1LgB6csov
	 R129N+bQzntJnoslBmzupSVtnIglM2YMZJ5I65uQkflax8xSZ/470vItlvafwubDq/+nO
	 o3E3Usyid7M2RV2HKWsb2Q+Q/DhV/Yb52aKNw2XjEwZKqrgO2vjTz1n/vy/VNiRT/a2fG
	 KePE6Yesm7O0MaFQXYJwI9b31nSbcamgs0wEPlTdaZeqRQgdYtUIGXVEkgorMXlXG68RE
	 gwcbPtv2MdX5WERvuS7CBipjdIlqVwSm96RqUpbu2/YjugMywjtJP6e67jrlO41WLrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gJwhB/0Z";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDC6606D813
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDC6606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gJwhB/0Z
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so151777f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778775; x=1794383575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWS8erEqBwwq3aHveLY854LGBihUxBRE7Vkb4G0BYjg=;
        b=gJwhB/0Z6u82SlVgm0Zx0c3oPa7TJuOLdPLclgrK56kXj+0K8e3XvtwasrWQKrgrZq
         pXbr1M8xdBXisb7EBrIraL3PiuLztnPDYR9PPLtJ+zuhIMs+tDKHOrvWig3hPA8uX7tx
         tXovKyNnXVHZbmnr/tvQ9Jy4TMOcWYyjI6BrHpOo+DESyEQY940T+J2oeFaR8XoZo8TQ
         8TIy68Aj9JrPJVbbpcEYG1zQiPh8s0CVcY2DGVZ9IZ1+NGZ8SSVS5Lw4i2XDvYZlIad6
         S1kj9kuPDZt9HeQCVq2wONCalxMdmbLIQjLGzB7kxuT0wMAkdpSbQXbAX1gP3VVM+J0Q
         kwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778775; x=1794383575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWS8erEqBwwq3aHveLY854LGBihUxBRE7Vkb4G0BYjg=;
        b=zSf7nVLS6so4ub8igdduNtPi5Ypb48K8UUdwxhR9ILuPvytx5jahbKiHWLXs+88qQy
         kR437nxGK+5KRJm0iGLbNyCFn86217BmuEKC6t12LLZgD4tQpRu9O6G2IUZWrtb2NkOC
         7jssbBzwby42y0/baHBi9MRVQHTwr2ZDj7h8Z7n30ol/yFp9AYzaAurHVqzCKQ89VeZ+
         evT+ugpQJQm+AsA29V45yQ8zin1AaJQt02LeES1Z3+5Pf6DumuFM80ruOrvCAk97Dvz8
         m5+CEeFZ2WduY+fn50EVkDmQjRg1kOKcN1Vj3iRRQoGsZl9Kxb/x5+TQlHCjeDLoYznU
         wAVg==
X-Forwarded-Encrypted: i=1; AKwUvBxlspQYgviekW/y5JLLJc9gXg5KtCVwxn9+U4SybL/682E+yHLbmE2iFVD4gc6qkOB0zdnlWidwPB00iDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jvm+RvtwRV9qdEmJjVzldceCZuJHqlIQegrnZ3tkvnHPdVymw
	BMddkQgbbN7+Rj9LuOixWEHOnrn9HwSFqPnUmmCwiM+OEbUD+SFoVYen
X-Gm-Gg: AYBFou1qk8VrDpNW2g64LlhWNkyMuAZg0wDEGyk3RjSnOJvHlwYRtstkMNIVnOwXUVJ
	QUX4nxpNPUmvak+0T015TcOoODIc5IQfLFsw+BGmzFouODUMfbA5RnR879CP7sTKmRYDLQBwHYZ
	RN2tVG3Ae72P33TsBZ7Lpo0tMuumlKNDxjs51ZR0w2A61NvlLDFrJev7GPDms1zKpQNhRAMPy/f
	ZTEHvrA5Q5k6xT7k6h9cHJsMug7y7zUNoVeyBs6zYktT2ZN6H908cXc3PWSJoTrssCUhf+YTIBA
	PfLwPW26dH9j9D4XMz9zfq8mAHaPGLYic07w3APvjUSD53V+zlp/tWxrxSn159XXHuqrkFizxUn
	URAzmSok4DNdmfuvoJDQ5HQC4uc9oAahHZ2XS5kcLvJbQensjav0L/6qWevRRboGKyhkNAKDslK
	OV/VH24LwlIOTJMSiHLt4IejdVy5GNfbipBhYTi/MkiTEeMFl01MPMpvgD5MBd3VidcJlpX8WkW
	P/gNA7Z8a1mFo9xPwt7Rt4wq3PT6jwKcSsCkLSP9++ZWzvB1j0Y9aTqkbnvuIXde8p4IPyfQ33k
	ElB6XNCCKJhUh7zmnluUIcCrWToNokAFhHNO/M0Q4IcMYffLH2aVjcrUU/5rzOuqUocoPkpHJiZ
	gIVa4/4psT0btjl6oSfzV79YX2dMUC/CkCuLD+8ItjBrbp6iJ2euM
X-Received: by 2002:a5d:538d:0:b0:487:197a:5c1f with SMTP id ffacd0b85a97d-48e6e4f8ebcmr26263132f8f.49.1793778775414;
        Tue, 03 Nov 2026 23:52:55 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm2200785f8f.52.2026.11.03.23.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:52:53 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 04 Nov 2026 08:52:41 +0100
Subject: [PATCH v2 3/3] drm/panthor: Bump the driver version to 1.10
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-panthor-fault-info-v2-v2-3-673b31f3840c@igalia.com>
References: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>
In-Reply-To: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>
Cc: Lukas Zapolskas <lukas.zapolskas@arm.com>, 
 Paul Toadere <paul.toadere@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

VM_GET_STATE now reports the last VM fault and GROUP_GET_STATE reports
the fatal error of each queue. Bump the driver version so userspace
can detect this.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index fb5fdf848dec..139654628ec4 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1803,6 +1803,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.8 - extends DEV_QUERY_TIMESTAMP_INFO with flags
  * - 1.9 - adds DRM_PANTHOR_DEV_QUERY_MMU_INFO query
  *       - adds DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE flag
+ * - 1.10 - extends VM_GET_STATE with the last unhandled VM fault
+ *        - extends GROUP_GET_STATE with the fatal error of each queue
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1816,7 +1818,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 9,
+	.minor = 10,
 
 	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
 	.gem_prime_import = panthor_gem_prime_import,

-- 
2.56.0

