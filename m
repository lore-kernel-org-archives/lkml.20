Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347767;
	b=gLxnu0Yr5jd0OnBSMOilPolQDMymv/FC6EsAwjIIMwdj/rPw10afSlpkIGi5VKxKAfXo
	 8LDMiJI4MbNzqR3g4U+4lydwN72ErPwO6rZ2OH7BZciJDZKB1etFalWCmfZeFF3Vc/fuJ
	 psSzeSptHn08/1mB4nxgzCMU9loKIMkTyiBVlQmLcOMJa4+NQcgBe2axF37poLw7fMDt7
	 9sIKwVYSWpFzeC96ZhJWx96iF5HqvgHu0eUz43AKfmRWxb6YZKgmRph5YNGy3h55C5Q1P
	 6E2OGszmmOmugzB0q/FJGhb+2oHKQj2UvUd8SH8c/0SaPbqJLYBWBpUNjx/MC7Y1t/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=27advilcz2wP6UN5M54Q2ZsQBSdNoHnIxCKVWfLF+lY=;
	b=hR9xuOvHm18q4uMGj1JXkLhIlcT5DePtnhIV3IZyqYj1PFfUgUO5EYJaRXLB2JxNJ+Wd
	 8leq21pes8dxFrhLwcMWgez/8V/387RkZd+7G7TlvrKowKDS/f8SKPZMICSChC8EPtz2p
	 ipHbk3Ot4F3vVtTBo50FGU/AspsshWnpEJaKOvOXLM/3IGJIfY8JeqouwNs1lC7ngXKOh
	 54OCFDb20ufetwqDvqw6eWs/FPcox5Pz0pDhOjtXRBkVPydmhyMSBXP0twT4Q7ZwweT5Y
	 W9NSeCRCU0hPXnmfGn2wQGsgBPWni+fpFWxYWUbIRykBhNqrAfEw547RhjpS0IjDD2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ScGfBWdz;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E5060A3812
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1E5060A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ScGfBWdz
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso16127775e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347765; x=1794952565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27advilcz2wP6UN5M54Q2ZsQBSdNoHnIxCKVWfLF+lY=;
        b=ScGfBWdzik4szXie/VCmd8A40UJAuOEaH5sQ2qBEwDOhKcFV9auLP5OuISf1VY2fXN
         Cn/0fxi5pPDkZL+7+iPgl/OQAKWzlajmlSvSRLAqDDPzqXds933DX9ZkUHsuqmXizUyY
         cbCVG6Mpbkz5PjHFMdGOOJO7ZamHwwfq0EZ2GrlvI/hyq0qy6ef4cL6UFPoOz7BEBBVv
         x6ZU7Ej90v7Ya3PwwvXb7nevs3BevJGszA9/j2ysmZELQnOHJ7Fr8f/PsEgdebl+LoFg
         pmrN8DChJGbkDr60f20J/1uu5FfXoKd4WWz/DCalfHiMXtRj61Jf2vig+PxjUtoOa9Jk
         F1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347765; x=1794952565;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27advilcz2wP6UN5M54Q2ZsQBSdNoHnIxCKVWfLF+lY=;
        b=xXsBQej8WcQKqL/so8XB2wCy7SnfoIEgA16NmaFWBivMNyKzDt6aOmjoQtnjdYaR05
         ELUR6LvhFYf4Be6XZ2j5rhPvSc2h/IVDd7IqrViPXGBu6UhiAvP3+3k5Oyehz1tOGFLs
         RyVsmVzn1o1bIc7ui+IY/VjFbvtQHnx0ZSlOsubO+5n6+bFoo3rQ4X0uO6tE5nZ8ks0a
         tpVGoqA14QJJi6jrQaFonJytyhN4dZ0AgVSdfYHaLeZ6eKj3ezJ7MlyyK+Bf2GsnPpMN
         u8+qF60yenQ0Gdkn0K169ZaoqquJE7dnNWv+tmmhIb4caKCPuGfQOMqG6PZv0gBEYhL2
         ihsQ==
X-Forwarded-Encrypted: i=1; AL+hErFDwUwkakGNIS9wyozng5HkyzP9wWbLkney70RK3hfJC8neFzY2AX7TJOVdoSccNF70R7z5Z7riE4cxCp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uDNFln6wPSCtCPQ+qvihmslUabzlnjV+mA+e0SMqkNxh/u8JJ
	WS0wcBRSbRmrnFAWA00yR7U7JkGocCa7D5gJ2qzTECqml53zHbfN+aR6kKmF5PE5B/g=
X-Gm-Gg: AYBFou2h9KqS9Rd9YYIKe3GfHoSRh0SRYGODY8lv+d6JIMBFN1UgMapgPtZFx3QxpiU
	Ef6G0mO9L3KuZgw2OOqcl9+fB4X7XmFCv3XCxivn6T8/6CgZirktL+I5QkZ0aLna6c1PXjSbtXR
	3fY6D3UQBqZeDvC/D6hMuGuVUGkmHqEnIrQHtv/jnUGQ24F715C2wl2pu6fMZvoCKZNRwVohzOB
	XvEspIkix/DnzvQ6+Z3ddUDwCdT2e7Z17yHv5wDRENUKH0CAJtpC0BF5pI2/ZtbiVhz1bfrm2hv
	SG6aV+W0Pc1pkLh5wX0WZhPtpvIv61MTllcuNcemo5Tay7GgasHM4DJOThQwO154KgPdP03vJjd
	rXUw7q9dPVlQidRlIr3D82My0+UjewLe/fz/4wpToIk5M7M8nJvEz/dzsZAHympUTa3+ysXbpM3
	YHR+RIT20H6rJfGfIjcKk39hyOAMG+UwG51zUD5pLCKQ+aQSYcRCcSUmWoFHzyr8Mq/B5vxlRTL
	bBfpbLnlL3iaj+s5B0u6evkAiyigs/9W188ER+I2LabdO8eoytwGPbm5PD+9VF22SxwBTj5N8AZ
	e1x2EtP72U/sa7HfQrDxufiOK17YCbERykI=
X-Received: by 2002:a05:600c:3554:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4ba0936c8admr6184475e9.5.1794347765628;
        Tue, 10 Nov 2026 13:56:05 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba0204e22csm84491605e9.12.2026.11.10.13.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:05 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Qunqin Zhao <zhaoqunqin@loongson.cn>,
	linux-crypto@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 07/20] mfd: loongson-se: Drop unused assignment of acpi_device_id driver data
Date: Tue, 10 Nov 2026 22:54:32 +0100
Message-ID:  <98b0f85e2b1c5330958be64c2bca859cb0e16628.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=919; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WctLszqVF045tp6nwF22xHoE9K0taY4KKqQ1CbqyIGQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KqD2/HtYab3u2BGN1KZ9z27I7+Z4HOPLlbB ODCx1BiL/eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSqgAKCRCPgPtYfRL+ TiY1CACST/5p5AX3YvgpdzTMs32H9OuTz+rye6bieanuEfNXqUb1EI11zexHwkp+qT8zOamGcvM UDrCpZmkkj9EodEchekm3zO5dkHT1gMDhyrcvERhGxUYi0FqNpFA1rXdxmFMemjJBeUhyeNm8IT bkMepOvkdEf2vGnBUXUtwDEDIUGR+f1G1yjugjUJ49rE+J+7bYx2JBHqoUrpfgkf5i3QYO1UxEQ JfKv8wUEmKRXHDt7f58nUBylOhN5iaKnqqQOh9NUOSM8cdDtyPEkd8IxXfTWADHNgRd62Sxg56j EC0zVyRXbt8dARWu/o7h0USm2c2tpI6gd2TT2aGuFdbmgAVm
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly set the .driver_data member of struct
acpi_device_id to zero without relying on that value. Drop this unused
assignment.

This patch doesn't modify the compiled array, only its representation in
source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/loongson-se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
index 3902ba377d69..4c668e2d2241 100644
--- a/drivers/mfd/loongson-se.c
+++ b/drivers/mfd/loongson-se.c
@@ -233,7 +233,7 @@ static int loongson_se_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id loongson_se_acpi_match[] = {
-	{ "LOON0011", 0 },
+	{ "LOON0011" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson_se_acpi_match);
-- 
2.56.0.rc1

