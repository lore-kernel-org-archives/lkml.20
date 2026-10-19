Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428689;
	b=IM57EBi2X6fOjGrztunbE15y/a7Uk8NAQIykPU86csUz9VUOS8QGtN+e/L52eUB5jKI/
	 3jkGSb4fX47NH+7ptKiAOW36Y1K7o1JFCbSngJ+VUUC0yKvLOI6TjdB5iSqu0mseIwZjm
	 S+wQ/s7dEZF7YhfLAafQaDM13XUbSVzgEQBF9FH+tcQguu/4G4fTe7+nchIx/fnz7475y
	 FtCyUk87F0hB81TdVTPdvacB1Pe1YyNGi4SIp8z9wRRejrc1+hkvl2yLiBgobu1361WFP
	 5LLEty8Ua6els5ioe8SPTviVJ2T1RSbBOlsER0TtewSf+8XSbkVFr6Kw1TstUUdi2TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428689;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RkB3nKluq3zGaP+Lq9pgKNeSDo2wBXhOYdQntxLiANQ=;
	b=TAI7s/xb5LdA1i8ddlReJsRPDuVZmUtMkp04ZKXCWrglGk4ivf+htdR9PR02SvL3WIWb
	 LqtL0yxwOIFRCbfCQVRJL3Ggess5lGtvCC1LscNvbxMiNPX8Fhd8TNodjQCnQshxm9hJ/
	 jnAMgEQGkY+Jardoaj9cGgpX2oN2PknT1ns/G+HOO2vUVB1HDZ5O5LBMuzpBvvtPopni3
	 bUoqVZy05/8W17A1DNNqA0MpBtNQqBpRGXqTmIXSZjEQg5xdzhzsqV9OK2x4KWc9iTV+c
	 ArTJJy3JH7Awdf5XIqpS9Bqz1yxdO49yei38Hzt64Hx39wb7H8R7ywf+uu/ADNgPm3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2ESmQCG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9C6606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2ESmQCG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E509B1F000C6;
	Mon, 19 Oct 2026 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428689;
	bh=RkB3nKluq3zGaP+Lq9pgKNeSDo2wBXhOYdQntxLiANQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M2ESmQCGguLVo/zt4MjcHLHu6TKHpzWEUGILBzSfG/hJk1aMPVjn7JKr2psRLeI7z
	 IsJE49NETJTcEMt9tKvKBJ8QppKVMsdvm68kS4fPWP12uxgDMgfE6vId2OcgGlwyiE
	 6b6UvVwu5Xg2SBGOD9vj3vmiKfyXZjmfD871yZlbRbDYGviSyj20+0JsM5hh3FKLuH
	 J0PPlz4991QQNSZwMyxMvLjahdzPZKhjQqMkmkmMshRKnDsR4fo800qzhjOUhVvNZG
	 N+W08pY4kkwztToPcFozIueV9ROs7GdyyL6LmFOd5UbF5mTVzJrmIdf9v65t4W55Nu
	 u0xHZQ7iau7bw==
From: Dinh Nguyen <dinguyen@kernel.org>
To: arnd@arndb.de,
	schuster.simon@siemens-energy.com
Cc: dinguyen@kernel.org,
	thomas.weissschuh@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] nios2: remove 64-bit division
Date: Mon, 19 Oct 2026 11:50:15 -0500
Message-ID: <20261019165015.2656521-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261019165015.2656521-1-dinguyen@kernel.org>
References: <20261019165015.2656521-1-dinguyen@kernel.org>
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

The NIOS2 is not a 64-bit platform, so there is no need to support
64-bit division. Remove moddi3, udivmoddi4, and umoddi3.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/nios2/kernel/nios2_ksyms.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/nios2/kernel/nios2_ksyms.c b/arch/nios2/kernel/nios2_ksyms.c
index 15a223cad84e1..400d2b8158dae 100644
--- a/arch/nios2/kernel/nios2_ksyms.c
+++ b/arch/nios2/kernel/nios2_ksyms.c
@@ -31,10 +31,7 @@ EXPORT_SYMBOL(flush_icache_range);
 
 DECLARE_EXPORT(__gcc_bcmp);
 DECLARE_EXPORT(__divsi3);
-DECLARE_EXPORT(__moddi3);
 DECLARE_EXPORT(__modsi3);
-DECLARE_EXPORT(__udivmoddi4);
 DECLARE_EXPORT(__udivsi3);
-DECLARE_EXPORT(__umoddi3);
 DECLARE_EXPORT(__umodsi3);
 DECLARE_EXPORT(__mulsi3);
-- 
2.42.0.411.g813d9a9188

