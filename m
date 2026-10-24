Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792820322;
	b=Cpb3fJoTWQ7xCjTho4d1XTOjoZLrT8/O2a5Qpa9nPIYzioMj8IuRHZGeTwQIlaKEchhi
	 Htt6EtSvC6zRpmimsqeUP4hz41jOOiZjGAheDNrcml3ekRebWvMvscGvFBJjcv/ZISkZJ
	 fXqkvevCxugR3PgxQze8PwnxXlngBE7wgSBgSYaKv1YhlOYSxOJ/H4pLLkqsumbQoz8Pe
	 v5dlcj3H4D6T5z0I5hKjeNxKebTpbjOgWESJT61hS1QPeh/+o3PPVMXljve2xoNm6Fx9u
	 S5nMXr8CPNd0eW4EHs2mf2h9QNIzFCPhO73eJY7JevOLLhXuu6tazyVAArP9NLrcj0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792820322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F5lL8gtrm76MfXFYgN7B3cAbNKJht4qocJjaadImFYQ=;
	b=z5K9F5X69xsYHhyg/Hpu1kArP++NP8xhmvVBt6VLuKN4s/IND22V6AXke+rcSFobJ0mt
	 lp7uFyxIXVxcQAR6iW1/OseNKMgh+NCzKf7suKd0HFd54ABH0x8WApyoBSbHDen5VZ4QX
	 wi2yQ5AE6x+CogHgaWT29Sl+atHVqYgwTZ8iY9ySYLP7Z4IAQLEQyzdVXhGr3HGzqcFUF
	 kop6zpIz6SQpEumd2nsXi7CBsl2wzwGKxOEhGc5/ZkOzctYmHB9To77JztfmZ+6FWHmys
	 YaeRqiB9T16Q0bO9awYoh7g49wcU40CxysW+7siJ2/2a5Znopye3ZJ4gqYd5N1rB+uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QooO+VF2;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A8C606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11A8C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QooO+VF2
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35c76e9614aso2321230eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792820321; x=1793425121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5lL8gtrm76MfXFYgN7B3cAbNKJht4qocJjaadImFYQ=;
        b=QooO+VF2mKZF1OdkNo7N0cpLh+Cz2z527OvmXAKSPZGKrcPko69C3+MMJNjuUFo0Om
         bG0nCQv56us67iLyKSt2imskcZDzdipoTn5hb8XfCXzqBEeuYYfVM4rKBwoXZIEjK9jU
         Gt288ZX0xBYlc2mgvH/HCh4mgW7xPJenkMYQl/xO6bWsRrdH5Thqm0veAOX3MYSgIW4E
         qz6ugdHSffiOW4N4pTuXuvbmC9fIN7/AGRduAn4r8SL0Y8Ldfw3Qixyw2749opq+L2JZ
         Dh4kplGGdt4iKRP9KDd+XpP5TudYRj+OsviNl2x9CbOCfD2q6X4/KtD1R/RSfGyS82f6
         ilHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792820321; x=1793425121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5lL8gtrm76MfXFYgN7B3cAbNKJht4qocJjaadImFYQ=;
        b=u2fS7zPLPEPK4sruXMWrqsw/57p9Lc7omSouxemvX919q4dY8PjlDlct5yOs/GnI2s
         1T/v77xTgXtaaBhi6n7o46IZdc01GMuDFXvrJ+dQHvVHhSwcfyOjY+yu5gh08AEkMvSK
         apvbjR/cm31arlMpCH7SmiMzBXO5NGk9hW2c7x2ezRxWqjOFQ+UsMBxHqY+LsvIWMvi1
         iQbYCgNcHfrhUs303Iet9qO5DA3gp4r0+M6or0E6X57AfFzzjWwhHPNzcuchZ/psiyoU
         WmY5wYBPoWbon2BvktEnFZ85GYUHGjzsQHUQ3WvX7toepyNoiWZ93F2th36YSpH+Vl4D
         dyCA==
X-Forwarded-Encrypted: i=1; AKwUvBzxjyzEkbFenEAsJAjXil3YGJDLx2Dd1kkn7hjnL3CUtU+zQj4W2ERy8cA8zSyRKqTZ4gm30f7xKhCe808=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzU7EYSSP/QzpqIbxpr2x386b4PbPbszipsOkfir2iy+BhDnqL
	47Ore/BCuss8WfGq+2lGhI9415rezW7TUMvBJERLYPErOzx/sqL7O8+G
X-Gm-Gg: AYBFou1QVjYfQt8x16m3Z7W//V3tFYFN3P6QvfLKu0b3TWNPlOa9o1wXqrCMSWeYgdI
	1dB1Ti/8idfCUxuFGhGU9FgOh0e60xHdW/PZI3HCg0+7N9HlS+SQ4wfDYiLnudqmKgex5iXYTP5
	t8T6EuZfLqfSoX/VsRI2IKRecAEkP6/IlnhzTqnWhJVgDoiYHr5MTs5DWE2yda7gccpVWbIwQ0/
	uJ/8z/EahLVrCMl3QGJhBtzhG4ib36YV4VCAQELjcYD05J3spkuyGqZryiTGywoscG2wOpBXozq
	cwmo1Y5dRnSua6hthWGPJHXfXbxLQWEbwM0+qav4K7Om1mbwg4Yy7pW9OKJxbnSsflHdUvXCwrQ
	5Z0DwWcUtkqvm0wNJWZmKHp8FuYYgit/hU5g0x7qGKBUL+zjRmIhWzE6yM+zFCz4jGUFKwvKSLs
	iCTJ0LaOfms3eUr+hz9kM+x3DGVUO6E21IQ2WAw7ohnm7D8tabUjzeAFVtDQB7IjcwRYjmqsOyi
	ItXuQY9aFy/ldl15XP7tjGz8ulwn5VTtkBKsjFvkR1SI5LVMvGDAMmZ8Y8D4PLgHgAuMjjAaHau
	pMdulTL1ecAlInU4jCmkan4z3i/IwVs2dCIsRN186EmiYliW3bXZeUSZkII2IG0ZLsdK0H060Jo
	Y1TTlYf4IA/5r158Bdhr1zARC2/Tw
X-Received: by 2002:a05:693c:8392:10b0:35f:ef9e:f846 with SMTP id 5a478bee46e88-369e8315eeemr2176820eec.3.1792820321076;
        Fri, 23 Oct 2026 22:38:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ecf087sm3813684eec.27.2026.10.23.22.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 22:38:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] wifi: ath11k: don't select ATH_COMMON
Date: Fri, 23 Oct 2026 22:38:38 -0700
Message-ID: <20261024053838.3569557-1-rosenp@gmail.com>
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

ath11k only uses the header-only spectral_common.h and testmode_i.h
from the shared ath directory and none of the symbols exported by
ath.ko, the module does not depend on it. Selecting ATH_COMMON only
builds ath.ko for nothing on systems without another Atheros driver,
so drop it, like ath12k already does.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath11k/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 44b520d2e66e..99f625b82fe1 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -2,7 +2,6 @@
 config ATH11K
 	tristate "Qualcomm 802.11ax chipset support"
 	depends on MAC80211 && HAS_DMA
-	select ATH_COMMON
 	select QCOM_QMI_HELPERS
 	help
 	  This module adds support for Qualcomm Technologies 802.11ax family of
-- 
2.56.0

