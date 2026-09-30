Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89057403AEA;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750570; cv=none; b=C5VhaPlV5/Itrx4p3NqGt77LI6j7+MHHTJgssuAld3v1pon50p7EqSXKAoBroO7oURWSZ2eqhfHEhKwpeW0Emqa9v47M3pQOvqG/H5ehYo9liabysfHhC+ApvFRMznqVUhJHZkhbbW6FCE6wP0f3KSpcTghchP3G8h+QQ7f5/Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750570; c=relaxed/simple;
	bh=VY0sEM523SH01bCMUPYNNCgBvCGlXFy3JXgkUJlHGsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIJotdzjdH4d2i+M8kUsnyvrjRT5Uv4LzU/4IjY26QS0bghmLZVYzy0/hPKDYaw0mKlm3Pnl2bUvGDrnul6O4zhrs5cvProQ1+PEkP9CIqpaiyz2qbfeEhuwoQL05UH+Yf1AyfBfAy7hyUmoa1mJWFEaFNCIYhZc25YnHPdkY50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUwll++9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUwll++9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4092FC4AF68;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750570;
	bh=VY0sEM523SH01bCMUPYNNCgBvCGlXFy3JXgkUJlHGsE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jUwll++9GcDzumeZoHDLTYFUrqyukaCiPkU6np++KWZLAXod5CavoUi8xKTFIEfXL
	 4GHAd8K9Q4kLgDjuWpbEKmJ2osg2NkFRutfFlZYkWfoQyd2AaPCxEBdv/8CzTzMVQ+
	 w1W3m93c7GfOgBlFvX/3SspQ1UOEMXLBo08ZmZ6bmEZlW3SUwlxQ+wijjGG44N9Ity
	 iBwtz+ktGiIxFdmMxEFmO+r6FRBYfRcsTOBmzEeHYXuZ3IpYWPR1AIPCm9SiMKxAna
	 VhdLK7tCAAf4vlWC2R2y66VaKrdm5Op20++ZIBnEnriC34EtTwTi8Z39rP85Aa36NH
	 8y9hmI1tJf26w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31609CA5FB5;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:25 +0800
Subject: [PATCH v2 07/21] media: i2c: it6625: drop redundant parentheses in
 status helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-7-e353f887e7fa@ite.com.tw>
References: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
In-Reply-To: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=1911;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=hMUgQungpbvUXhPIcEyCYMEDenPhUZbplvI5NTD2M/Y=;
 b=4p861QfJr2FzWeA3OL1lEpTKQ3NGHwgCOHTW7FueOiH3uBLPSw2Alw7HbSqqcxefQY4NjMEoj
 Hb08iDNDKnQAe5mNLkRSn8ExlMOcA42HNpqwjovl+Mq6BQ2fjV4r9vd
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

is_hdmi(), hdmi_5v_power_present(), no_signal(), and audio_present()
wrap their ternary condition and true-branch bitwise-AND in
parentheses that C's operator precedence already makes unnecessary:
'<' binds tighter than '&', and '&' binds tighter than '?:'. Drop them;
behavior is unchanged.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 9382a64706919d380e8318c3139b42a4a7b2fd55..b48252a71bc1ed788de2df79c5fdaf7895f6e0c4 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -554,7 +554,7 @@ static inline bool is_hdmi(struct it6625 *it6625)
 	int val;
 
 	val = it6625_read_byte(it6625, REG_RX_STATUS);
-	return (val < 0) ? false : (val & B_RX_HDMI);
+	return val < 0 ? false : val & B_RX_HDMI;
 }
 
 static inline bool hdmi_5v_power_present(struct it6625 *it6625)
@@ -562,7 +562,7 @@ static inline bool hdmi_5v_power_present(struct it6625 *it6625)
 	int val;
 
 	val = it6625_read_byte(it6625, REG_RX_STATUS);
-	return (val < 0) ? false : (val & B_RX_5V);
+	return val < 0 ? false : val & B_RX_5V;
 }
 
 static inline bool no_signal(struct it6625 *it6625)
@@ -570,7 +570,7 @@ static inline bool no_signal(struct it6625 *it6625)
 	int val;
 
 	val = it6625_read_byte(it6625, REG_RX_STATUS);
-	return (val < 0) ? true : !(val & B_RX_STABLE);
+	return val < 0 ? true : !(val & B_RX_STABLE);
 }
 
 static inline bool audio_present(struct it6625 *it6625)
@@ -578,7 +578,7 @@ static inline bool audio_present(struct it6625 *it6625)
 	int val;
 
 	val = it6625_read_byte(it6625, REG_RX_STATUS);
-	return (val < 0) ? false : (val & B_RX_AUD_ON);
+	return val < 0 ? false : val & B_RX_AUD_ON;
 }
 
 static int get_audio_sampling_rate(struct it6625 *it6625)

-- 
2.34.1


