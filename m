Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285160;
	b=Vpd77Nult35XCsr4t9sXvmaVC2Ppp5QXy3ZI+6osVsuGRSLFTiGYkW9vxnXaiKhQmEhT
	 dLjWq6TtAXyX1sc1HHoeAHa8Umk4XG9kmTgBK1RWGk3/8IJORh6U9trThTNe9Myix+aCD
	 HpuGwNn9Xwu87wjsUDzUAVerSLAF412oU+sOM9Q0aSLNvqWzvrVjn8JD68a49RkGnfV2B
	 6IlU3cNTHPPDTZhEHD4txrPzC6AWc7TAkq3uK8wJxpt4rpbwR7bIM+a6wIkYzrrA4DM2p
	 bi6mBcqH1JktE4ucM17RzJvwIM4wOZMt8etUKqWfAXYFq6JI+tfVxuPrBkO8Gfdqg3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285160;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qILeyMFmFQ4VLcR3391O/erwLoS++PVnkbeP9RcQIf4=;
	b=shqar+8pRVd69gPrGYYI+29Gik4zffwzuWdNFQ4N3oX29KGVIxVCoSQ+GlFcSS/pg5aR
	 y6en9VXYJE6s/0SpJbnW529pK6FmAw47hnZfOTNvh5t2jcU23qgygQiaXJt50AV/iFopg
	 mOkg59pfKYRjvUdvaPyYx0nkpNX4ZUd4Nad2ag6mrXSC46M7c8p/JLqL7MP6lGdT354Xf
	 QnvkSMI1krEaTJHDkJSwxUSz+eTBzlmk2rIst8QbOvTwC74HrsYyVLwiJQTU/6qIoo3yj
	 gZEUnCXwh1Blpob32QOp5+G/aZ9DluV3q7cRCzsxK6vFeJlx4f5tz+rbn4nbsY1iWvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ggZa3Bh/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE9B606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ggZa3Bh/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40E71F01825;
	Thu, 29 Oct 2026 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793285159;
	bh=qILeyMFmFQ4VLcR3391O/erwLoS++PVnkbeP9RcQIf4=;
	h=From:To:Cc:Subject:Date;
	b=ggZa3Bh/81r/LAUn/GDsu0KlMbswKJ6O+3kQ8HsFSp/oZyZgl9kyseHR8gJvJ20CS
	 R38/6lIp4lR7vwgHaQUrWkBRHRppdlYwGbYPCOOMFBrcoRh6KaYWdcYFCih8o6pP2D
	 IRH0B3usT87avFoBRzlRoyfZX8veZ5kkGsW0fupU7yDOE1hq2n8Z2PsjQHi6g56wWb
	 n9ecLWJdLadVLEQlXGEbeUeObaFzmlTy3EsCszoLOtzA9tLmoH8kBD/+6WUnovAvpn
	 EM0zVEZM+bj2k43yBLQ6gnW11lOO1C+g22bZzNiAjCI1qsfPlAd/LFwgX/LTFsX3u/
	 RYtIN4cU4YGcw==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xMRO9-00000003x08-2W4K;
	Thu, 29 Oct 2026 15:45:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] soc: starfive: socinfo: fix compile test default
Date: Thu, 29 Oct 2026 15:45:25 +0100
Message-ID: <20261029144525.941746-1-johan@kernel.org>
X-Mailer: git-send-email 2.55.0
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

Enabling compile testing should not enable every individual driver (we
have "allyesconfig" for that).

Only enable the new starfive socinfo driver by default when
ARCH_STARFIVE is enabled.

Fixes: 96b35a1251dc ("soc: starfive: Add socinfo driver for JHB100 SoC")
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/soc/starfive/socinfo/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/starfive/socinfo/Kconfig b/drivers/soc/starfive/socinfo/Kconfig
index 64f1b1e04d01..92bef1dd9d7b 100644
--- a/drivers/soc/starfive/socinfo/Kconfig
+++ b/drivers/soc/starfive/socinfo/Kconfig
@@ -6,7 +6,7 @@ config STARFIVE_JHB100_SOCINFO
 	select SOC_BUS
 	select MFD_CORE
 	select MFD_SYSCON
-	default y
+	default ARCH_STARFIVE
 	help
 	  Include support for the SoC bus socinfo for the StarFive JHB100 SoC
 	  platforms to provide information about the SoC family and variant
-- 
2.55.0

