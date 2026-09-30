Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910DC403B1B;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750570; cv=none; b=lyZJdTDcNAJXWhUDcYxmg4Ada9HCxkQP4iYI1Py/UGTV2+bKcBRQ0nIpNmthlhW9qSpI9IamOqDO/DKmF2RISn3hhA4SqG9qyOmnzXMe0hBzc+jPoTuKLJftpPfdK13xAEJHT07Ra8CL4i3sKVyR2vuU/HJCZtYSxKF+QaHai4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750570; c=relaxed/simple;
	bh=cDPMaol6QHe7TLUO9f2oW68IB0rx5wsxTDo8tuEeOYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfGDJiJEfQul4ZY1C9kAP1RONv+UxiKeMEm3P3Y2cNMXrCs7S/ZU0gUYv/nJGHMLxkCfoT4g56Kr3mSrgm1FpOedhflLNxhWzUF24LN969Kj1lXGf8sCbUNxa9cMNKjUYYdS0Tl0LSmDD+ECydxzYMIoKsIzjSzmEk+HPIOQm/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQKxrpGh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQKxrpGh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60B02C4AF16;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750570;
	bh=cDPMaol6QHe7TLUO9f2oW68IB0rx5wsxTDo8tuEeOYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UQKxrpGhIYmYnBHTfK4EzYl16M3vmhXev79sVP2orkB2jDGDMaG+bTqsFvUXVrHiz
	 p9eqfio4PAu6FXLTLAhObEPtF0Gp7rzM4G4QAjBzgPFQnznh/iJIsA0gL9uxKr9v6z
	 4xaHzDQXFAkMVEGCq2j9r9aG6EYnyCA5mpvbxPZEVvgN7sLW5VL2XV5jeyAKKmlxfr
	 MWUGLlgseYioA1rsK8AofHeNhwYmDaY+RmMrddfdLHi0J2rNXGKszPEWuQFcYygPGb
	 ByAQ45AHThrF/4r3xGzlglZ5qfVyYDIK7tLZGNC1YraU4X0eNHs8nWOKuW1eQFeWUB
	 HKxm7RPK43FUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F813CA5FBD;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:27 +0800
Subject: [PATCH v2 09/21] media: i2c: it6625: tidy CEC buffer init and a
 continuation line
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-9-e353f887e7fa@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=1972;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=mICEuUYSGNnJU5+TzTlAKH3DyJBxrCepqtV9sdWebjM=;
 b=i9GEumRrbTmjXXp8TiFNMUA35NM81a3/VTRB58wJQnrkZzilXllauMaWpN5/3ElgiBVnKQ9UK
 rHL1GfSBTe4BGki3+H6eEj7EtxUijrHEhTRn5R3IRWAlH3tIEAG7KjD
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

it6625_hpd_delayed_work(): wrap the container_of() assignment after
'=' instead of splitting the argument list mid-parenthesis.

it6625_cec_adap_enable(): assign the cmds[] buffer at declaration
instead of two separate statements, matching the pattern already used
elsewhere in this file.

it6625_cec_adap_log_addr(): add the missing spaces inside the cmds[]
initializer's braces.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 0fe828cc5aff6d61957c3f0a781033dc94b7754b..8d368fd5a64cd815c7a9013c863804c32eee7fc1 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -757,8 +757,8 @@ static void it6625_enable_hpd(struct it6625 *it6625)
 
 static void it6625_hpd_delayed_work(struct work_struct *work)
 {
-	struct it6625 *it6625 = container_of(work,
-			struct it6625, hpd_delayed_work.work);
+	struct it6625 *it6625 =
+		container_of(work, struct it6625, hpd_delayed_work.work);
 	int val = 0;
 
 	guard(mutex)(&it6625->it6625_lock);
@@ -996,10 +996,8 @@ static int it6625_initial_setup(struct it6625 *it6625)
 static int it6625_cec_adap_enable(struct cec_adapter *adap, bool enable)
 {
 	struct it6625 *it6625 = adap->priv;
-	u8 cmds[2];
+	u8 cmds[2] = { CMD_SET_CEC_ENABLE, enable ? 1 : 0 };
 
-	cmds[0] = CMD_SET_CEC_ENABLE;
-	cmds[1] = enable ? 1 : 0;
 	guard(mutex)(&it6625->it6625_lock);
 	it6625_write_command(it6625, cmds, sizeof(cmds));
 
@@ -1025,7 +1023,7 @@ static void it6625_cec_reset_la(struct it6625 *it6625, bool keep_enabled)
 static int it6625_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 {
 	struct it6625 *it6625 = adap->priv;
-	u8 cmds[2] = {CMD_SET_CEC_LA, log_addr};
+	u8 cmds[2] = { CMD_SET_CEC_LA, log_addr };
 
 	dev_dbg(it6625->dev, "%s: la=%d", __func__, log_addr);
 

-- 
2.34.1


