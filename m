Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387000;
	b=m9/a8cJpPqulABIS1SREQEG4wBhrh21OyqHzBg57CqVikFpC9VO+KAQtyKTt+Uz5TTiA
	 eOvRTIVMNnrMAs524eGVLuH80N2ASSqfbnH52AY8V9hkWZ5IbcejWmW2Fd94xQdAemx/Q
	 //4Ao3CxNmR8pZ7zrKD+VYOvEgFUWjDHfgJUhpMdu68T4gPLt3tUBUYjZNHoMvw8CERHs
	 WDLu6OK1cfPngYAwMMhRCDCEnRiOIVpraeBNzUZNpFiPRVI2cwAFrOhmpdUvcIzHLpni2
	 ogj43Om91Dom/nc9bDqsbVk8pRjaVuoP0bdr2cimhXojDARB9apawxp4TZks8whOdLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=XGjaUCUyroQZIq89TXjBp9/oGz8PABPtNLqz5N0kwPI=;
	b=FaQEpxkvW9Bi2J385GQ2rqaAhILUsqFlERqR6pe4N7XA6TURie4msLZ2ArK2fD6thnSc
	 4grrOC1EEXg8akPzhoZ2dPdz0WbwKVs1F8Yx6RWSPF9Phr004UAiFHULrzme2ZQxCLMFx
	 g/8iUBZS1TQlv2517tjkV9SiBdXVgW+7O2pPEyXGBVZ+S8iDtysLcEipjDnVv+NYoyfRA
	 +UG6G04p7/a/1CrXWKrkotUvrmMStWxz6tsdo+AjOEB0vEQV0YSKXg3lxnXSxR1JbEI2h
	 m1DHKtyZe2UmNOc2ithvolAc2gKYwCRmy+2V8V1NfrY0Z6Kg0jlnm0nwAIQu/yUI2QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T+GeGJCn;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB14606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB14606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T+GeGJCn
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49318428d98so1559619f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794386997; x=1794991797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGjaUCUyroQZIq89TXjBp9/oGz8PABPtNLqz5N0kwPI=;
        b=T+GeGJCnkHHd144RgQovglJ65P2evPrwxx7apIYrveX7C2aZZQPeAyocuGO2Xfn3Ob
         VHZueIKp470eodmgDFuhCSv3PMzUUi7fz1TYd6wAsZi1ZTF0TZuvXtyv3u94um7hh987
         NyE0rYM4egs+uET1Gqak5Mg0Qk4Qs6g2ZE+kEB+hAxHOFKYQprbCjGxR0XT9SpIi2UpR
         XVRnMNTpQoFSBptSWWzmwpxBGC1hGS8M5w9egXYzcmo+oN71vc5dlR99h5WSOjodW4OE
         d3JTlVk91Z0viPvV7c8oj3cjbsFgthHUxjZxFopeAV/nwJE8JAF45YLQ10SmXBdyrxiY
         K4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386997; x=1794991797;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XGjaUCUyroQZIq89TXjBp9/oGz8PABPtNLqz5N0kwPI=;
        b=aCUUQpLjLMbs77ZsfpNHAY4Ml710unsKd+5Pkf1h/+3vIv2P6aG7DGLZVp7it2skzo
         brEZXzXbtF4h2LheVGJ9d2O46kpiy919qym73oIVBogzheEYV2na3iVkyruxA+vdPLdv
         4zdltRt7DEN+XXxwjIPW4fk+Um/PFW6Qz2UK5+Z4c6joMEZbjgJ/O7h8WpiOf8mCit0d
         LwDKe2h4J1LF5UH/sAvsXW8bujOCGAqQh1Uw842w+0QWo7egT3+lY4j93lOtvSg7/Ed+
         Q5HhrrYFYs3H5nmPpCl9Vlh72r9JwcqjfFwskPZs9pdsuQCWqI7pE/rxQ4peFaeCS0Gp
         p3xA==
X-Forwarded-Encrypted: i=1; AL+hErEosEOr8uN7AhsAsnA4Yl/g8nBkjluzkAcBPsg9m3qZFXk2trKqeM1AlSZUaEzD7Fz5/xB+w/aeFN4rYZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iL3RHAh+aAm7sQDW4kOon+JG3Cc7A9+aSGbQRVxD6V7PCNm7V
	OsVvdOu+HapBwMMkoAUWHDKfhZRnR/5CLHJ04BYITO0AMlVJ742hRREzQ7wUaK4ze9Q=
X-Gm-Gg: AYBFou05FrKp4vHCAZLF3+dKLHM+xhdc4HJWXbM43CSxBuO5g4+GgZ4ErIeo+L+QcMu
	ySPLYS0Q0MfwLDzNSQAS4vgrcd/HRUiOJ6eYMPYjZ1BDTs3TiNzGfqIQrAKLJWCTr2d3jcnuI08
	ISNNIkxBbp2Tt1JBSGf7hZle6oiEfoV7DbW4zIV3w15h+4X8Law4fqXo7ERp9c+zkt3GHuAGGBK
	E3z7u05CSo+acOy2BmRS1pA5JmeOfBO0ufxSYp1EqZvpA5OJhEi7Ec7fa9xIkrksijJYFGnLH2w
	3cYOzkGfA+sqOLTn20AMX+pAEyyZC2xXnpaq7vvXJh5177rPhaK6FGUxOkgEU+79eKumRr635ib
	jV0+FDw4uTZv+6jExhPZbbBx+e9LYlNl+Fcc49eVFjNSf7n8q/LiBJaI4mXsHV1ozp0fYpLy5nK
	UWS0gzj7FHd1L7Tf6Sa1GX9zQXORFtRDmQRZ+iELyOGmA3ejgLYUOy7SomekcH0sHPsSD4c4lw4
	hAjUAFXuOOeRR6b67yNaeUj+fIWg5djIkK82R7xaO/Ih2Q3V0QPG1vTTwNXa4FJzvas1yJeM4SN
	mcG+txIcUNzA71NQDERp5FF5JweuCRjOJZWho0eohX6mj6oWNo1yMcXXshNi8XkAwWT5ZgC3a3c
	RAEdISOVdaJGuvA==
X-Received: by 2002:a05:600c:83cf:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4ba0935d26emr28180515e9.5.1794386997367;
        Wed, 11 Nov 2026 00:49:57 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fba476sm148718735e9.2.2026.11.11.00.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:49:56 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm: Use named initializers for arrays of i2c_device_data
Date: Wed, 11 Nov 2026 09:49:43 +0100
Message-ID: <cover.1794386771.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=793; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4OKhZI7WlJ4g3SpBA2Ic0Zi5wRtesQaQ5X9mG3JF1mo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9CwqsDjTjvevC4e6nqty+iMT5kBDx/7rhbFyw dX0vM5YifiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavQsKgAKCRCPgPtYfRL+ TndLB/9XYRxFcRT5EeOK0C8h0ylgXzyp4HwyoRcTzvGkjbbhSRaKbbjv3XKo5beiM9yhF5iYMPY v61j3vOV/ikOH+pqF9jZpbWuZL+cavvkeZkT/1wRXkr10Dp64jBs8fp91loD3e4KaKWAm+a0DgX LXV5eq4mLtURTcM/4oteHsE//tDQi0O6a/r87LJO+S+6fzesH4CWf+JuHkkAUQ5r3MY8HK6wZau BULo2/W2NXGVKnYTopIWeNIeCItEMQYA6waNFgzuFq0a+m5UObpapu9aJI6MZmFtgk9utk0tA6G 1Osj6Y3KIfM8Q3k3WyPw3eoWLLYg/h5lLuKogol8RjstG9vq
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

v2 is available at
https://lore.kernel.org/cover.1784545092.git.u.kleine-koenig@baylibre.com.
The first patch of the v2 series was applied, so this is a resend of the
two remaining patches with the collected tags added and (trivially)
rebased to v7.4-rc1.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  drm/sitronix/st7571-i2c: Drop unused assignment of i2c_device_id
    driver data
  drm/nouveau: Use named initializers for i2c_device_id arrays

 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c | 2 +-
 drivers/gpu/drm/sitronix/st7571-i2c.c             | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.rc1

