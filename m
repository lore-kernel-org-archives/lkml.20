Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475607;
	b=3nv6Z7MzJHF/QKjgeG7UHN4kt1pfgT0EDYxAhqZIKcsoeSko1MT4+FYJlo2FtNkkWmah
	 rCNPyJQyVqMx3c91nnZlxPTZ17j58k4VthZoJyRzngVPJbhbJoIIZKsQ2POj55Q00ggwA
	 CfpBRtZBglXDYr3cp63BQOcZZBFMuNuo3Dybh/yrBxf2mZ/8xDu2z8GKA4XlRkeQm6hA9
	 RkCuJCDKe2+h1c5mJSZnjxI6YpkOjAt35X/ev57inyg+9eu57dOnsIflO0rXWOegry1+g
	 bCTpg9gBLzhijky2uu8vsy6t/PKIBrojxQewVBrDOIlDAU3AUb0VzTjyvUTrkpqYTeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475607;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fkjnmb8ggLb/84Ga++hOlK7lEjrv+JCNa/KKXlrq3oQ=;
	b=fpl+hoWYm891YKoU3fCAE14zoP+b+UjDnEYSkdU5OEf9PckUquRRBtkHT8y9y9cTD6g0
	 9ZEWL2tHufq6+KW82ZbmRCpCX8t5mF8cI9/EKHtTZG01wuiZoOiUR5yIuKfbkrriSTMBd
	 BRWS5KY/a66uysVMJa0gtkPgPCcJGilZr8uY3nkwWFEzljnZg3BgyjtnceZ9CpV1A/qkA
	 mP4+gCai+q2tlDzKPcvCx1SAeYU1OB7hulVupwD59SqF6TDF+NvYuXUp+fWZcRu6+LLEQ
	 hMuFcmQss9KgWtaJG7yGCnBBYkWLMlUqZYD2tmEpa8KlWiKa1+DJbIyfDmQUCbTs69A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L/EPgnFn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6BD606A31C;
	Thu, 12 Nov 2026 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/EPgnFn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79AD1F00A06;
	Thu, 12 Nov 2026 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475606;
	bh=fkjnmb8ggLb/84Ga++hOlK7lEjrv+JCNa/KKXlrq3oQ=;
	h=From:To:Cc:Subject:Date;
	b=L/EPgnFnLTt737bs87LmLJNK7LSDwmsvC+C++AVwbCrxQ/Tbv0UUoWyu6wWzRY4CI
	 j/pNDCbH016zGGqgq5BFhJswaDBN7XgHqecpPwbGS7Ua0WRYoMGqqexWpPC5cjSRlN
	 SU7DT9o1zCM+WXWMZ/t0Y0xAD7zjwwwkJ7/EvdUqz6prJQxMO29vZ8xVNoO+zioGt3
	 DUvLokKfBZGR5iqOz0RlAi+PMsmOBs6QjP+R4/KdvVqniS5y3zpk/LCsOdg4IJoLcq
	 xiVoM8fLUQ+3Y4yGpsS5mxNacvSVJ4/Y0vnC8xF7SFEH44m56wRuhlYHoLfG6Zdbm0
	 r1yfiJ0Cgw3TQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] [RESEND] wifi: ath12k: fix QCOM_RPROC_COMMON dependency
Date: Thu, 12 Nov 2026 10:26:30 +0100
Message-ID: <20261112092642.1144415-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
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

From: Arnd Bergmann <arnd@arndb.de>

The AHB driver depends on the remoteproc interface, which could
be in a loadable module when ath12k itself is built-in:

arm-linux-gnueabi-ld: drivers/net/wireless/ath/ath12k/ahb.o: in function `ath12k_ahb_probe':
ahb.c:(.text+0xb2c): undefined reference to `qcom_register_ssr_notifier'
arm-linux-gnueabi-ld: ahb.c:(.text+0x1000): undefined reference to `qcom_unregister_ssr_notifier'
arm-linux-gnueabi-ld: drivers/net/wireless/ath/ath12k/ahb.o: in function `ath12k_ahb_remove':
ahb.c:(.text+0x1146): undefined reference to `qcom_unregister_ssr_notifier'

Add a dependency to only allow the AHB portion to be enabled if either
remoteproc support is built-in or ath12k is itself a loadable module.

A better way to fix this would be to make the driver more modular and
ensure the AHB and PCI components are built into separate loadable modules
like it is done for the ATH10K driver, but that is a much larger rework
that someone else can do in the future.

Link: https://lore.kernel.org/all/20260313094852.3716715-1-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath12k/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index 0d5d1c55bfc1..4e8a301f2081 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -17,6 +17,7 @@ config ATH12K
 config ATH12K_AHB
 	bool "Qualcomm ath12k AHB support"
 	depends on ATH12K && REMOTEPROC
+	depends on QCOM_RPROC_COMMON=y || ATH12K=m
 	select QCOM_MDT_LOADER
 	select QCOM_PAS
 	help
-- 
2.53.0

