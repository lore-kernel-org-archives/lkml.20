Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002731;
	b=SwvRiFCtq23Adit0ql2/eMBCqVP4rKmYPHsJbwdtNh9GQe4tlCtjz1fgzXTYgjW+MLo7
	 dWltow5yPUgdbfzQCNtblYeTBbNqTa8TkOTaOBlgesZVjOhAxlXQE1cAasSGdWYu3MdVs
	 TzMmKnGFP2qIrmWdvhaPxAVgjbEJgcGYH6Hy8up7nxF/jRposcdHR0ipNWZaIk+K+sqER
	 GOzUm4ifUeCARvIVKz+edn/Jkba0rbRuZTm3wKd3DMsGMtgOTQuYroyvZ93jIviVNy37U
	 H3+fZqfP2HD1uqZrNSA2Qy6dJYqukziBYUSVdl3ahnZi45UwxBztI67R+BF6/CwfWCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E6zA7UN4800aROAky49ikegUFLsqpLG7wSuvYuvN3r8=;
	b=p/c+X9GlEh4f6FkLfasV2Cr5yhGjr+9xJbtuRTCXKS4J0xKtHBidnH26Wox1VamBZAil
	 jGe20L4MJu1MBzShsdIy8m6D7tKjEsngD8g/BnfrcLehLr5BQeD4HAnDttPkZEj29HueC
	 hPqi9YeF16IZrsuJCxHvIoXz/O8VcmmERoeca/F0Jb+owxI2jKmTOFuKvJkDtQIMwUlXa
	 4/StG+G6SyMDbMJ9C+eyPgigoYGLvK8qAThAF0E766VV/wQrYycLxZ86TaUKmOaGXjq6C
	 2qAorK97R2bkHHEptwzDf0SRUVVlYOUGh1FzNqHaS+2Ozg5XJiE9z+FJABxvcSMVgCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jmUx5Z36;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B772E606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B772E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jmUx5Z36
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so4661114c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793002730; x=1793607530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E6zA7UN4800aROAky49ikegUFLsqpLG7wSuvYuvN3r8=;
        b=jmUx5Z36CjBsOtktD8QEtKJbCNVk0kURGGGr2ey4/b5gt/gYuSenOFTb4OXuIYjw0N
         skQIa+dn08YlsBymAFXtgjH6Ro9DK8y2nuqyah6auruVw8asJzPheR/bRog7JgOioPzA
         SsJtU2T+e0L3KWMLVh9YqPlhBonbXOPsPwOJFdy4OxJ8tqj2pdJYJxuoaiW2attsatGU
         nwpQ45Z4PEiPCNJJ00jikpYFb7uuWF35HV29wrfZaFkPdsyBNXrSmfb8L5MYTU73f8LY
         6udnIbn5p42+IWm8t+kNrPQxqaKnTjTmEulUaywm8ypq3ymZBYEN29HOeYEHjYVpIr3Z
         VCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793002730; x=1793607530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6zA7UN4800aROAky49ikegUFLsqpLG7wSuvYuvN3r8=;
        b=sSf9Lat9Tagj68ZDXtiXh5LB4b09lL+jQ1m5Zsp2xwaAsh+5GNe2Toq9ZlofV4vmTt
         FL6HQGvfrf+YOW32R8F48bXSJExlXVis5FNWQezzusyaRrKTVyZukB0EjOeCKtxAWSAx
         Olf0OiG2Ni7kSp4ga4ftiB7FzG0Db0+SBm+zcuLgkuMeA87OXQ8QiKpK3tQaYPCxhkgK
         la85JxHF5I4Ey0dWeFKu24/+EhioZI0XoM6466sU7t0BGSfQsFiA1xfN50edtx6m7DAw
         uYcC1PeWA6xyWXvYn6resmzvCqbgp/JmFZLxQGa65R80S3MLTMvltMWHAZ6Xv8uJLfCp
         jVCg==
X-Forwarded-Encrypted: i=1; AKwUvBz09ZgSbBgFak51zeE/ij3kqFeFKV2v3nG81SMrwTja7LLzFA7446rJjmhfJsvu0/C1lD2sS0kfgtJoJgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJWqgMYzZPgX+hdF94evBsHY4bDWfuaOXEmEBpKPg90KCk7FOd
	+TtWb150H9RxbBJu/PHUJWS4W3sv9BoFPRqH8UqZ3QIxc32C0c3JDehqN/y7ZfdC
X-Gm-Gg: AYBFou23beyU9egBor3QJ1VebSHeT7mVRBVITLP4k+SFM25ErWg7Bp1jrRfPQ6Q6jfB
	oZVInc3Ex59KctDsLH9DpDVrj1lXxJG73FJX7oqh7fe7B+t3xTnXvQH2/VH3/cAwpmSfRv6Z5AH
	Fc51svbnZvuLCtfLdbWIvvGxROFmiSJxL8PUe3LQhKcr9pD+kLuA/5NJunRXoAEPivjDVQzkzLS
	Ud0UwEHszcNnT9DiYfo7OWqz3jRCIEvNxYKJmz/gIe+yOP6Veo+TclnqXtt6y8RC8Jj/9jDJ2Sb
	QrGZ99ppPdi+epqMxr6/qUdB4kF/cN0aFiY62xumV78jkOFm945d1SnWVOIK9nN/u1y2QIa7f6L
	c7C98USTPkHFRSwRxkcBgFVBiUc/7Y9MdteF5/z3WN3Gv5wjT/daI/kA7YGIOvcY7cWHT6+xxq0
	AejyR+hw8baqwBuTRWtXH67Jfscnw92joB+I6Tl0cYyjSK6Lu3kkgIGaPbAxobE6eV2TlDWVmIS
	r2wfu58NY+qXjL3ds1E/Siq0ZJ8fzGxnZtcoYYQ6z8AFzym8o4Rfg5lMGtb5Vws8JLDscoxiSI=
X-Received: by 2002:a05:7022:7e0a:b0:195:9228:50a0 with SMTP id a92af1059eb24-1993686f4a1mr10019388c88.42.1793002729532;
        Mon, 26 Oct 2026 01:18:49 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec865esm21698270eec.26.2026.10.26.01.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:18:48 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH] staging: fbtft: Remove unused macro
Date: Mon, 26 Oct 2026 13:48:32 +0530
Message-ID: <20261026081832.60570-1-himanshu.bakshi478@gmail.com>
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

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

fbtft_init_dbg is not used in drivers/staging/fbtft directory and
since dev_dbg messages are good enough, fbtft_init_dbg should be
removed. After compiling the driver, there are no undefined macro
issues.

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df1eb..16459e4e0ba0 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -420,13 +420,6 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
 #define DEBUG_VERIFY_GPIOS          BIT(31)
 
-#define fbtft_init_dbg(dev, format, arg...)                  \
-do {                                                         \
-	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
-		dev_info(dev, format, ##arg);                \
-} while (0)
-
 #define fbtft_par_dbg(level, par, format, arg...)            \
 do {                                                         \
 	if (unlikely((par)->debug & (level)))                    \
-- 
2.56.0

