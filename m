Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957197;
	b=GOZdltp6U6Bm0YQc7rp4thTu5KyVHeERASaBJ/biOCtsSGOw7kOg5MRgjtOtaIMUuOkm
	 ZjWaaSahTzR+DNsMig9mhqbhoq9561mZ/PuczmQL8LnBN7lU+wtTyplEFcS0R455FPOeS
	 BQiWcS2zHusPl2e8HMX5khaJxDvbRrGBakh/HJ0zyd30tKq/CqBC4RToN7XOYHteuT7Ow
	 OAvP81lJRn12QR3zXxDVQFKZ5rvVQ9oeCbRXOYCgdza5zQuek8qVu+TVUSvJ1ZQv8ocR8
	 k5wpuq8gTPnQ7gukNZyRxyFVfbRSUn/R34/nwRg44ASP5rG0i2sTJNeF5gDO+lA242w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957197;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2iWpqd+QS7T4MloSrivjtj4sFwlrSEPUjkTDrb1eK64=;
	b=l4xuq4HQGdUBvTDqkAhrKK+TnaVxDBu5qWyS2/H0TTiWkEekP98wCxWd5KeAg2XHe5mN
	 fpFKIWnZAHm6+zyVHweoZNzlM0RyurnHhTNmjBK/QvjCi0FNlGHXcyL2XSiLuRMSsaara
	 6yLtGNe+EjBWmWtkKvd093zW3Zuv2u2MeuUQxb9aSpLImXc33QyTkHXIKAb1HUD75N7Cx
	 mmANM0GssM7clZtqYlYj1CLzK6teRYzhxN/ZFViKsbpV0t1cnSdtnxKFS2YRC4/JlzIp3
	 wFrr6vnluRsAah2BiwlEBAAhkl7W6JK8ePcypb/WTqn6VODEmZNS89DFud2VSTFtyfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Sx5qLwyY;
	arc=none smtp.remote-ip=91.218.175.22
Received: from mta0.migadu.com (out-22.mta0.migadu.com [91.218.175.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFA606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1EFA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Sx5qLwyY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NCQXkL7nkRFAaY5Ahowq8NQ+CbyBoVtiWI3JXXlAYIs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793957194; v=1; x=1794561994;
 b=Sx5qLwyYP8NxWYgQK9zl3XPuEr9fkQQ+oQmdO3hCYj41+mNzsJDRY5Kr+BcRhGCUP6zsMIHx
 FYiNduvWtdKnXg8kJqTTZbKqaL1IE/z8p4rimb/rapt7s9d78rhbYoeqXS7RSK0y3OurTd4MJ0i
 nVGkT3vXrhkqgYUSq4/CDQ/o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id efb7fa6828913f60;
	Fri, 06 Nov 2026 09:26:34 +0000
X-Mizu-Trace-ID: efb7fa6828913f60
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
Date: Fri,  6 Nov 2026 09:26:23 +0000
Message-ID: <20261106092625.3977163-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106092625.3977163-1-fuad.tabba@linux.dev>
References: <20261106092625.3977163-1-fuad.tabba@linux.dev>
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

Commit e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
dropped the ALIGN() of the ITT address in MAPD, on the premise that the
ITT pool returns 256-byte aligned blocks. However, the pool's minimum
allocation order is get_order(ITS_ITT_ALIGN), which is 0, so its
granule is a single byte. An ITT whose size is not a multiple of 256
leaves the next one misaligned, MAPD drops the low bits of its address,
and that device's ITEs land on the previous device's ITT. QEMU's
emulated ITS has 12-byte ITEs, so two devices with 32 vectors each are
enough to hit it.

Create the pool with a granule of ITS_ITT_ALIGN.

Fixes: e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 282e4bafb084f..5613c52adf88e 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5849,7 +5849,7 @@ int __init its_init(struct fwnode_handle *handle, struct rdists *rdists,
 	bool has_v4_1 = false;
 	int err;
 
-	itt_pool = gen_pool_create(get_order(ITS_ITT_ALIGN), -1);
+	itt_pool = gen_pool_create(ilog2(ITS_ITT_ALIGN), -1);
 	if (!itt_pool)
 		return -ENOMEM;
 
-- 
2.47.3

