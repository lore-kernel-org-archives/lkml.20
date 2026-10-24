Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848651;
	b=iyLNhTU/VqUkXpekeK3ARE8KgFVDTJH1qaQric21Dk3eywCCGPvYIQI6AhgPrOANOH1I
	 dM4hyw/iPmB5XxPfQuWGwaVjr3RE6XuCs5UcGym7sCqKXYDSgIh3aXAZdBvCw7sG3Kfxk
	 xD7UvLJfXA3+lHvc4OjMYZHiZqyKrsn9BMRT4Bb1L0BXGyE4vzzN+Wddx4YP/BmhtDCkF
	 TMqrEvYK02msn60HEQU8zBkuBT2ovCJyKQySFyo2qp92c4vchB/qd2dnm0W+i6u62zjzI
	 dJZVKeRL1lOumC3oJRhOjD8s9B96UguNNlk8Obn0oQRTZHEiOADv9vyECIm+rqXPbeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4DbzmzBdqMsmHhWCEehq33/otLa9/Nzdgb28dQA0Wv4=;
	b=A7l2yd9/IoOYZXVUFWjxpChyH9KHpRqlyX1aPW6xMqVzQzJ/q/fkK/R0ltPQ+Aa6pqtK
	 DLUPu2zpVB8SHLHnC4tlvKhMJW8VNHvXGtf+w32HdaKLdw6Ym4RCkT4GPRNH3RtlW3J7I
	 nZ1LF15F6fAkkFV1VvTr+KepAsjLy1NjvHohCW80oDDwohV+93FEb6Op/AjqbXS16UNNH
	 OFPuJ4PRkAL8iBdYqm4Jb3YtimxQbUiHjAVj5z00FOUlGkKyIVKwWYG1va5eK3goS4ewl
	 kgIP42WPZOicrtKjknwHU8uvvh8ZFRJ9oal4U9J09AQ/AvX3a6htPf11GLG6siolXQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fKCW3TaU;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17412606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17412606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fKCW3TaU
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso5408eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848650; x=1793453450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DbzmzBdqMsmHhWCEehq33/otLa9/Nzdgb28dQA0Wv4=;
        b=fKCW3TaUkLtvJNnt7o3RLXMA1pInnCCBv6ficgwjY+pANp4QZ7vEmbo0Zrhjj9PJL0
         IAXD9rJYAyVr8+DmgFPvjpzPDtNRh7RDtGkA5Gj1WxQeqopavUcLV3VhXTxDzJHpFNB8
         M6s1kC5YCwT8UlN4NCUzalOYbPbfJKSc+sdjcpIWb9CenisaYAYgQ4/IpYhFvU+WFvYZ
         af9Bq3tBxXpzLLmVIE1sWMTh9hduqDgm9fAQSK/bBvNoGaP4Ms94PI17QSJl4HQUtLr0
         AhshiD8gbaheK7kxXtnnTmaZS8r2lEvvSXqnnhP1L9hxXdnY2k+cjqHyQVNIHlnpY95X
         pwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848650; x=1793453450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DbzmzBdqMsmHhWCEehq33/otLa9/Nzdgb28dQA0Wv4=;
        b=Q01JDJ9YWB61G0JqxpobQygzZqFrt5Cor3iDeTxsibyaWIMxLcZBH/XntjIvbuqPbQ
         EfbHnUTnaO/TgqMlZaoK4ULTVToZ4JvHH8kgcwhyZH2f6YUSDmnXNW9SxQtskwk+AiGs
         TSttpR5cg2aqGB4iz+QBPH0FsGYWGVpDgn6PoxXi/klJst58aCZNRC9B/A77LiFtQPD2
         bkyt2BO0VOLiyh0Qoppt1OvOTZ4gCbpmjNDLAzR1gjFqp+6tQaSzsrd2oH002rog0JGJ
         wCci9d3crVj+tRvg3RXZVH14gnVe2uPveRaFfIgK1XCz5nO9rGVlF9TktY/v70IQ7en+
         qA6g==
X-Forwarded-Encrypted: i=1; AKwUvBzcUxb2iEJRgyc+mb1B/40eZ9c96mkPwai/IwjFpgTDJWgrEoT4WowQec/8HoJS63b9VLGfTlAnFUROLBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN5esT2Tqjj7z4Dtw9RZ76DEurAwmKaaTOFb03XNl9DJaEXLp4
	bPFIsqZ1XBG2c+k/XQO2tNOD1M8JXqt8f44yU0Omul0NFQbeaUzxEJVY
X-Gm-Gg: AYBFou2gDJ3LHRhCSitsixnZdYhDjpEQKGp1rbn/iMbbzmdoR8StFOnmg7aLYVi2Njh
	nKOI182rC/+hm5mu2/ZmHBRsf/KQ/tYeeP1vmsdVQkWcbcFCBp/LLSL1CKOLBJkDZW8NnZM05I2
	guMlRby9VJFCS5uiD+UKRoDI/TzONnvqebfLR4cDE6ywYBNFokbs9SDKFlA/dW9qjSZtZOFu61i
	psdqW7eYJP9vgG4z4RfifF9gP5+yZpA7V9ni34qS/BIX3/a2yOH+5gZg0ulBBMursovZffjhH6p
	oEhk4dadPnPsDggxzGeTDsRAzigzYG1Lct2AWOmF8ACh++l7KdG5ZlxQkBqVbvkhDK+A9AXq2ga
	QX5b6aI7OvEzuzmEoZyrCdV1d/kF6b+2Dbv5A9LUlvlUZPBHGZfLJQrx0gwY7tjgnyjMEY6GjtI
	aFzyP8w5bA9R1/4LtvbKzxaPiEfAslB3zHxE3MaAuCH3pnM+LTplk7hBixg6h03VvpyBDi1Pveb
	uRpVu6OCyarMOIHb7mBdIs/5eIaggUxj74y7FtC7SkJ3JBXoC523a0=
X-Received: by 2002:a05:7300:1c1e:b0:360:1637:404 with SMTP id 5a478bee46e88-369e8660d3cmr3083001eec.33.1792848649998;
        Sat, 24 Oct 2026 06:30:49 -0700 (PDT)
Received: from myarch ([49.36.79.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15908129eec.23.2026.10.24.06.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:30:47 -0700 (PDT)
From: Aditya Nagar <dev.adityanagar@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Nagar <dev.adityanagar@gmail.com>
Subject: [PATCH] staging: sm750fb: constify the pointer array g_fbmode
Date: Sat, 24 Oct 2026 19:00:37 +0530
Message-ID: <20261024133037.160112-1-dev.adityanagar@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Make g_fbmode a const array of const pointers since the pointers
are never reassigned after initialization.

This fixes the following checkpatch warning:
  static const char * array should probably be static const char * const

Signed-off-by: Aditya Nagar <dev.adityanagar@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb2..c3f391cdd 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.56.0

