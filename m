Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F55E3CB54D;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719828; cv=none; b=ljE5eBEnFEIA240DQ03WAOUBjnybgXBswHCVJP3J58Dohlo2vpfYVMCPAGUFXOd4G6t1eUzzdb9CHRrtpJj/GRpmq41fy4oBFiAXlr2vXgTYpwFM7wbUSLSnE+RD5C9YV65MGHMnVvayVwtHl6BlKpz4oXGbrQivHov4+BheQZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719828; c=relaxed/simple;
	bh=hWtjtaprJYt4jyipWU9LokTTRoke60o6AWtWpZvW760=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UH/mCuPzhNKuJg6Eu08k8PUKHqwzvC5wuqNjDUCe5gafm87z7IeOWWm23iU5txoWTh9f88nWl8pjWKz+v61GeQBlbQ7Yjunduj07dVATq8P9QkeqOtQkVigwodaCBZfduUcMNfX1eGjdKkMnBXVjS8b/tWNy9Uth5iIgHM/cXrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCzez3hX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCzez3hX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E46B7C2BD01;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719827;
	bh=hWtjtaprJYt4jyipWU9LokTTRoke60o6AWtWpZvW760=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kCzez3hXHuRyj1+c76Sj44WAE82H1MVfNByAsJcjp72GvNkzdvGVquMWQ4IaSXgst
	 OEg8eup7irnx4UBIudD33y2L/9pblkRO/1JhNXEBwmFT8QHvQeG4nHHqs/vjOXrd6n
	 5WqcX7jZLM6ToSjW0HS3x+j9Q8dHowN6CBW0DlLh5PsZIi6nHHZwZjII7MQOq5zOc7
	 uo3wpHRgqlRDd9ItmtEn3GZ/BWwbNBhmMBzXwnQ1QlRgCsWjbYIQokTLK0K/0sF901
	 0BvgB29MfIxvol8AgOECQyXQ/N99BcB2NsjPzh3xRQfgZ8/e22/r762io8H3gwxa+v
	 MNp5Knq+k35rA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F22C79F85;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:34 +0200
Subject: [PATCH v2 11/22] thunderbolt: Find Apple VSE capability during
 startup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-11-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=hWtjtaprJYt4jyipWU9LokTTRoke60o6AWtWpZvW760=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTQeP+QZZqqv3lf21S5op6nGjZtsUQ7d5LZFzQ2y3m
 bnmeLJ2lLIwiHExyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACbi+ZeRoWHKom2Moj7Mexm0
 trcsX2nZ7Hpdq8WHU87p1d197PO1JBn+hzCoq79lrpKR3axyyW6+/2WPkmdMV47cMXUUML75Qjm
 NCQA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Only Apple Silicon host routers have the Apple vendor-specific extended
capability. Look it up when the software connection manager starts and
store its offset in the root switch.

The Apple NHI driver can then use the stored offset when programming
cable information without searching the router capabilities itself.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/tb.c      | 4 ++++
 drivers/thunderbolt/tb.h      | 2 ++
 drivers/thunderbolt/tb_regs.h | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index bf1c192ec10a..d2832323cc36 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -3025,6 +3025,10 @@ static int tb_start(struct tb *tb, bool reset)
 		return dev_err_probe(tb->nhi->dev, PTR_ERR(tb->root_switch),
 				     "failed to allocate host router\n");
 
+	ret = tb_switch_find_vse_cap(tb->root_switch, TB_VSE_CAP_APPLE);
+	if (ret > 0)
+		tb->root_switch->cap_vsec_apple = ret;
+
 	/*
 	 * ICM firmware upgrade needs running firmware and in native
 	 * mode that is not available so disable firmware upgrade of the
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 4373336d9425..fbd1a0a9927a 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -132,6 +132,7 @@ struct tb_switch_tmu {
  * @link_usb4: Upstream link is USB4
  * @generation: Switch Thunderbolt generation
  * @cap_plug_events: Offset to the plug events capability (%0 if not found)
+ * @cap_vsec_apple: Offset to the Apple vendor specific capability (%0 if not found)
  * @cap_vsec_tmu: Offset to the TMU vendor specific capability (%0 if not found)
  * @cap_lc: Offset to the link controller capability (%0 if not found)
  * @cap_lp: Offset to the low power (CLx for TBT) capability (%0 if not found)
@@ -187,6 +188,7 @@ struct tb_switch {
 	bool link_usb4;
 	unsigned int generation;
 	int cap_plug_events;
+	int cap_vsec_apple;
 	int cap_vsec_tmu;
 	int cap_lc;
 	int cap_lp;
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 92d893634d2b..a37e55fec157 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -31,6 +31,7 @@ enum tb_switch_cap {
 };
 
 enum tb_switch_vse_cap {
+	TB_VSE_CAP_APPLE		= 0x00,
 	TB_VSE_CAP_PLUG_EVENTS		= 0x01, /* also EEPROM */
 	TB_VSE_CAP_TIME2		= 0x03,
 	TB_VSE_CAP_CP_LP		= 0x04,

-- 
2.55.0


