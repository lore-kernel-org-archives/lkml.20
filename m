Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793675113;
	b=QwDebnDrOoHNQQv5dWJTC3q5R6TJn7+yks1txkxPGBZ68KfTKL9eN/dlwETVSMkdMDzR
	 J3MogYpuriSW34chWr7QjXLmlp1puauCgZhJpFMcCM4wfaUMNMZ2ZnA9TayT7sKxrXtnm
	 t1edHffytWEV21/qba66FE6CmlrEGwCWO4SwozOgZMTYjn69dUmbUCmQpV08CSvk5H4lN
	 DhqCBNovS8Bg+ejpqg7Li6kZDfj37gFJtsIC31eUwT2tHghXbz+i0hmMU2nV4BwFoeVLm
	 Fp27coxxLCm4f6AjKU0/Njh97NBmPpxWNgT3vZKaICDKYy5iH9gLV0oVP/Zmmn4DlxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675113;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Bmu7dyUYOtJQQ1uZjUpIQxcis7kNNLbZ3CTR19AsNKk=;
	b=HFUBkjDf9yAB6g5Q1W0fc/Cn3oy2wiW3L9qhLIZ1kW+6kjiTSzlrr7G6c83K+bydhux5
	 h0sdzqINYEjS4DBDjdlAJ9mJUA32LzcN3eR8oISvA7oaPvyLYWQaGtanktvIj9JZ4+2b5
	 q/NBqQQHRK/Lq4pKMhu08tzN57pm1b1lu7sTQZccuL0SaO/EPrq/kb7WqKxN5QBS4s+V7
	 ZRfLKa0DzDqPtkgMc/r86v4PukC5T1nr8slxMGyx/0oDSMPV+LI7stKCpMxI5TJ2ON/YS
	 dLMIwG3Vke87HE3bxq3xDLW50SaE+oNH2eLMVPkurg2140CSHqNuhopZ47VAsDpS3WA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=akwBAbgn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5442A606A33C;
	Tue,  3 Nov 2026 03:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=akwBAbgn
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793675113;
	b=dBNTWKGoLILP4vHJnJsscDReMahWQsZND2PHYJ0lGZNOSiuXugFwe+XbxP3PwKul3IqG
	 rZn3z7sUqtybZB3QTzP9CDRt7odeNFByqEKhWGiGIJP/gHOXHls4Wgjpk0VkLaJSrAwiD
	 n9ru671AvHTa0VopvaW2DRFZuPPsgJ4qpZzJBsngyUC9DSAeRN31M4ENylf7zoX0rC+2l
	 Gf1halbTrAjPpxKRG+6BgdsbvyMI0n/rJoWiULzvucl7sabF0APsqM/Npqw3uUtSgzqEh
	 o7QgKledW5k6kzZEcyxcgo15VfzyFL0sFjI+8y68fqHSu7FEwNIylqaxdy9YZM1x6mQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793675113;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Bmu7dyUYOtJQQ1uZjUpIQxcis7kNNLbZ3CTR19AsNKk=;
	b=H687fjyrAQHGVqh/D6v1tGzNiUpqsTmr1MP4+6DJeA//OY61EtSKCuQfqdHXIT7enIf8
	 5VXTw1JmjsNNmtuy9n1TuD2aHABg2RQDUuRn5dO1ANR9YT173bcPs1JPd6tCUVGK+P7JY
	 OL+rWGbxNuZ492Foy+dqHWp1eDkgNcXyU6HdtfTlVyuHewZ3TyWx91NbZYJpBJoKzrP17
	 uJmzuZJ/iOkJOVacDqo18njUa0GYAGpDCDMifUUSd6ZejJDvDkKIpNbFK5Z8+q1MBj3+J
	 2Hc4q2HnVE+O9SKkG+EgEwsgVH0vTKL8VoiX6wugCzOo1oAejN3+MegRJHq8csQeNgQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 234A41F0093A;
	Tue,  3 Nov 2026 03:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793675113;
	bh=Bmu7dyUYOtJQQ1uZjUpIQxcis7kNNLbZ3CTR19AsNKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=akwBAbgnhow5/mQdIv4E9ltOLMc7Pf72wzf5jFPxSs/SzrH36643h2Z3wi16/U/fO
	 IKO/mj9Ppu5prEGaUadfBocTFgCqdMgi5nRwR2xN5nDWIPJQuqgvR7To4CBuGW0SGy
	 Xt0F5IVq4IOmO86g5iO+CWjOObyV8EX9PFDs5+H5Ak6cLWtWo6hodZjbrTZcz3bo/z
	 78qLyxoVjxBEd72Tdp6p+qAjudSHtOCLUBYET5va83TRKS8QansXzmUyt1Cr8uNryl
	 WG2Ial0DviUTg9qOlPAb79a5w0er3WGK2m/lJI4B/WExxooRqau5tV6nSQorY0dQKG
	 FHqOirJ31U9OQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A09D446774;
	Tue,  3 Nov 2026 03:05:10 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 03 Nov 2026 11:05:06 +0800
Subject: [PATCH v2 3/5] media: i2c: it6625: report the detected sync
 polarities
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
Message-Id: <20261103-upstream-it6625-dv-timings-fix-v2-3-127b879da6d3@ite.com.tw>
References: <20261103-upstream-it6625-dv-timings-fix-v2-0-127b879da6d3@ite.com.tw>
In-Reply-To: <20261103-upstream-it6625-dv-timings-fix-v2-0-127b879da6d3@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793675109; l=1426;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=9OhnloEM0m3b5kRMQgRs0vKcCFvguI6ucWqlorkA/c0=;
 b=PNAiC2aNgx5G3IoibysbyGqLuCO9McywXFB05iwypUK1VzVvZ/KgSG/QL/RzPrHLdbeKuEgvp
 f+du2DXJqn3AtbcNNdBdFr3rfLhlWsduuzzK28RHVktJPpB2bhw+3xj
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw
Content-Transfer-Encoding: 7bit

From: Hermes Wu <Hermes.wu@ite.com.tw>

QUERY_DV_TIMINGS always reported negative horizontal and vertical sync,
because the sync polarity bits of the video info register were never
read and bt->polarities stayed zero.

Bit 1 of the register is set for a positive horizontal sync and bit 2
for a positive vertical sync. This was measured with
negative/negative, positive/positive and negative-H/positive-V inputs;
the mixed case shows that the two bits map independently.

Map each bit to its V4L2_DV_*SYNC_POS_POL flag. The register and the
UAPI order the two bits differently, so they are mapped one by one.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index a499b5e39acfbb1acaffc077d4f1fbdca3071a40..85f10d10337130565a0799daa32311510e312a68 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -818,6 +818,8 @@ static int it6625_get_detected_timings(struct it6625 *it6625,
 
 	bt->interlaced = val & B_INTERLACE ?
 			 V4L2_DV_INTERLACED : V4L2_DV_PROGRESSIVE;
+	bt->polarities = (val & B_VSWPOL ? V4L2_DV_VSYNC_POS_POL : 0) |
+			 (val & B_HSWPOL ? V4L2_DV_HSYNC_POS_POL : 0);
 
 	if (it6625_read_bytes(it6625, REG_H_ACTIVE_1, (u8 *)&active, sizeof(active)) < 0)
 		return -EIO;

-- 
2.34.1


