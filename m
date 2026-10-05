Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8481836B928;
	Mon,  5 Oct 2026 07:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183672; cv=none; b=TLy/RNZiYkLamiwzNQar8uEYIxAdh0t3jTsTlB9OLNgxMoALXUaiArwpqck4SzRYKDEdP86m3c5OPjrRldR19sTA565BwwdTxhFLuFh1GTywSq+WiBOAwrQeVsgW2quNCw/UJfIEud9wM4NIenFwexFPUpx57mC9wZVYRyKG3+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183672; c=relaxed/simple;
	bh=XZq8VL8ZM7hCSbTrhYYxSsjLxgFUhffoXPS7oiE6TAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XI48TxqbBnwMwz1/sTvr5uZEMR2SXiLoRaICIwf1/MalPGTsiOoa355w8xFYhrt2pAessJKjN4+5wxffXUm5j7ExGaoVaJqPfnNHG/laRkDJmiSNUoesfe/WJRK3im+RCi4zxa0/NFtX2KY11eC/rK9jz7XH9SYuRjrPXy3Bpxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qpE+m16b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpE+m16b"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1B3DC2BCC7;
	Mon,  5 Oct 2026 07:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791183672;
	bh=XZq8VL8ZM7hCSbTrhYYxSsjLxgFUhffoXPS7oiE6TAU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=qpE+m16b7T8KDEiZAAn0EcHAkVwQX2fa7eqMUZvjUsLyUZrGRgop1YSrdhR4d/Hvw
	 ldlMDn6LYZ3ixxNteb3t+ulCptvUzLC2dqmd28SNmt7w0LNZAUYYWIFyXiMpF0ikvm
	 uJpYpQ36KhJMxBm6NlPN0FI18dsStiGnEAInGHqC6OaAZkSiKWBxkrVSr4Q5PmQel+
	 +FNHYu38/pKqBqRAlpWU+/8EOXDeFfApu1oDxA1ezjFTCoM6KXoWLxsz1erM5tPiKS
	 1xp9tlNSM7gh85egpQgwIeRdPi74V872t4KE89+I+s1Z/FnFmWiVsoP7o2dRBQ1Rle
	 EmltWTlFeU+hQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3ABCA5FF0;
	Mon,  5 Oct 2026 07:01:11 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Mon, 05 Oct 2026 15:01:10 +0800
Subject: [PATCH] dt-bindings: media: ite,it6625: fix I2C address in example
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-upstream-it6625-dt-example-i2c-addr-v1-1-11ff60e2293f@ite.com.tw>
X-B4-Tracking: v=1; b=H4sIADVLw2oC/x2N0QrCMAwAf2Xk2UAbbJn+ivgQ2mwG3CxplcHYv
 1v2eHDc7VDFVCrchx1Mflr1s3bwlwHSi9dZUHNnIEfROxfwW2oz4QW1xUgBc0PZeCnvblJCztm
 QriOHafS3FBP0UjGZdDsvj+dx/AET7kEedQAAAA==
X-Change-ID: 20261005-upstream-it6625-dt-example-i2c-addr-248a5f819c6c
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791183671; l=1520;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=OrLWDLA4fM9Wv4Fc/STWxB87oF1ekyLlK5DPdsFadMQ=;
 b=KX3ZFIpwstxZAimr7Zlu7TDoTUNviLo5yCwTNEP/fatQ3WXXRNdDtRu6886ZzF0apvOYl4irQ
 kjYNt27xnIvCFs8F6OXkIWG2GCJoqbkdcumZP7ANvRqn3PveuIyW6tH
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

The IT6625/IT6626 respond on the I2C bus at the 7-bit address 0x59
(0xB2 in 8-bit write form, as given in the IT6625 SW programming
guide). The binding example used 0x4c, which does not match the
hardware and can mislead board DTS authors copying the example.

Use 0x59 for both the unit address and the reg property.

Fixes: cee2619b011a ("dt-bindings: media: add ITE IT6625/IT6626 HDMI bridge")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Example-only fix; the schema itself is unchanged.
---
 Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
index 9b621f726249189255692da02049ebcbf1d5b43c..b766f075dedd4668446856aceb854b24726a1266 100644
--- a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
@@ -142,9 +142,9 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      hdmi-bridge@4c {
+      hdmi-bridge@59 {
         compatible = "ite,it6625";
-        reg = <0x4c>;
+        reg = <0x59>;
         interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
         reset-gpios = <&gpio 2 GPIO_ACTIVE_LOW>;

---
base-commit: 89a3d2a2237e017cdbefcb036db71ce74e67faf5
change-id: 20261005-upstream-it6625-dt-example-i2c-addr-248a5f819c6c

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


