Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794321474;
	b=rehwpq8j+EsvAT9KC38mcK9zBFDe7xZYmvbXQM6QoORtv+D1zKo38sO5dEJzcmviQNK4
	 FztbWlK+sB9h2x4ykPB8jNRP4LrP4xjXeQ919/lNyHhgRITG5L2yJwoWY5RPSeC1zGAFE
	 DKcAwdwy5pylBH3R8BtO8ZCDuaFwkSLvSVgFgnAMTGhJPvaVWjse9X/jaDbK2YtK6iZU0
	 /Sr8D8G4fBYezStBS5ziSCSN5VfjS2OEBXLhqz/Q+L+jcy0tWtExyuxBU4xFV6ZtxjSve
	 Uup5Sgp3couTigQEkt7coWC/iHMpHHWlIWLPpgehu/mNLq+12OrEDbs33l7491VPw7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321474;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tN3vdZ9ng1Mhk2Xe8ShvoPdE+C0i1qFRsvoRSok7RE0=;
	b=u+i3DQr7mi8T9mQ4oIhmOSTYowpWotxzHD9uF10oPeYQpFf7F3kYSiZ5FeKMlV+ThfWT
	 S4tybe5CPRSNs56cXooX0JBKGnmwecpT4/WzJxVV1vj9/tVzzZ0F448uKduu+F6VUWwUC
	 wCDeAaPqoTZR/RdvybviwBNO6lDYCdScoRaHgIVUCYE7/gxZ4EJL49HWMBQTTqUFpV3UV
	 zzhQoQnJtO70YbbDxpB5L9Oy+TuKUBPro3jbi+caYpZHMV1C62S053oMXYtdeooCocw1K
	 oWtXRQ5wLjpb7y5niiXYkij+NMDDkQZJ4PqYRHQNV6sDl98Du4bnxXwg7Qzzby7+nTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHTAXu6q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76678606A321;
	Tue, 10 Nov 2026 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHTAXu6q
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794321474;
	b=W/dEAKXDKQEL38AVbaPMArPp6n0tFfMdgcl9mwvxOtklqu2DfSCW8uzA7s+k8O1h7HAQ
	 vclBQLRsB+DI1x9S9s4ORg5gbXxhPzTHHLLmRakXsyDo6crQzBYB7g3NLdeP3vuZ7CKPl
	 hnTs+ybXGBaRVcCLHKz09iU/4AwsSS32PCCxsSwBfJINbTrgzaW6KVI7BJ4jnj3udZ7x/
	 DpBFagXGToJjAAYEZnXDzi6gT9kZgFlcvPByXnp260ofJeu1vRP2u4A9inYeF9T0P5UZQ
	 XZh9xHPVrclkRa7Z65zTT5seg2YWuiV3+GxuAod4dUfZ3bcVoUcaK8TJZARxkGCOz7g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794321474;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tN3vdZ9ng1Mhk2Xe8ShvoPdE+C0i1qFRsvoRSok7RE0=;
	b=jrCCv8oGK7/obn4jD3QWMWZqeKBZ7o8s/i0Fr7+thRDRPFJshku32aCdyyslMTLyglLk
	 kBHbztYo/cRV9DNSg5qOXeYHPK07EMO/gusIfSQyKYsdnz4WGzUrYvcOHVlkr/YRHLqPd
	 2ui/+mK9an4ga5e/6/Z/g/+Pk+nWk+/2iH/HR0ipCato6zRc9T2+O0UXH4uR4Ggb7MRZ+
	 XwTuQeKS93sitymHJ5bP5tIO5AOIs5gA0dHU54OcmXRdhZPcJCqaAQXhA/vpgr47u2++P
	 mOAOB6xgBBQOSwAmloCdagXNUnWW8tgXJ2ajvSxjyl5qJrMC3JAc2PfbIr6GT1iTpKw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52B971F008A2;
	Tue, 10 Nov 2026 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321474;
	bh=tN3vdZ9ng1Mhk2Xe8ShvoPdE+C0i1qFRsvoRSok7RE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jHTAXu6q7nLlpVJ5O27p6BB+S5hGeZgZWtjJkqDnNWhlOeUapHnMtzwg2RM2Xb66/
	 VC1owfcDtexVHZFr2w0W+8i9zBGztFfDUZRl8ZsWZtiK5/YAN94x1dxrmlHnBi5AGX
	 UllWxx8IoYyI42xtIvLOiN8H50YrOUL9Sxu6Cq6KBv/b9VYeliVES7/zrbYGpmmMIl
	 q+dcBbMFwOzefY4AgGakpdddus3/r2zL2oe21tJqhUPIrLa5XX7ussVOjidcLKHI8x
	 CfXT+vIWOR1nNzXDIXvemOWNvzbP7OZiymZsd0yyXHSi5p8GtB3uXzwos3LQ2K0umb
	 4kuExd9htNSzQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D24D648B9D;
	Tue, 10 Nov 2026 14:37:52 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 08:37:53 -0600
Subject: [PATCH v2 2/2] wifi: ath12k: simplify copying a peer's PPE
 thresholds
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
Message-Id: <20261110-ath-peer-ppe-thres-loop-v2-2-fced87507920@gmail.com>
References: <20261110-ath-peer-ppe-thres-loop-v2-0-fced87507920@gmail.com>
In-Reply-To: <20261110-ath-peer-ppe-thres-loop-v2-0-fced87507920@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794321472; l=1371;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=S3RGt5CprtIcKimatDNBeUJCBEBiBnLLAOmHNGumSF4=;
 b=BmEpdxPl6CdaE5UhPvQdnBUSM+EL4w8eQzXAI++AGbmzFyawZBji8QU8DePhVwjpAQn+yBbsY
 qaD4IMT/okDAt28ox/31Y/GuFOttamdcK4jy9SR6+SRqsjPblaR4+Pe
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Reply-To: christophergriffin05@gmail.com
Content-Transfer-Encoding: 7bit

From: Christopher Griffin <christophergriffin05@gmail.com>

ath12k_peer_assoc_h_he() copies each 6-bit PPE threshold of a peer's HE
capabilities into the WMI layout one bit at a time, shifting it in from
the top: val >>= 1, then the new bit at bit 5, six times over. After the
sixth bit, bit i of the field sits at bit i of val, so put it there
directly.

No functional change.

This change and its message were written with Claude, an AI coding
assistant.

Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Link: https://lore.kernel.org/all/b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com/
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9fd3841f71b71..12dfac1d3b42c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2731,9 +2731,8 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 				if ((arg->peer_ppet.ru_bit_mask & BIT(ru)) == 0)
 					continue;
 				for (i = 0; i < 6; i++) {
-					val >>= 1;
 					val |= ((he_cap->ppe_thres[bit / 8] >>
-						 (bit % 8)) & 0x1) << 5;
+						 (bit % 8)) & 0x1) << i;
 					bit++;
 				}
 				arg->peer_ppet.ppet16_ppet8_ru3_ru0[nss] |=

-- 
2.43.0


