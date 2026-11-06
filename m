Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793990908;
	b=jv5RV7lWtrNYt2b8LolS9uZt6uFTrkWGIS3JRSh+MLjeZed5hNVesKy26vaFUqlgE1GQ
	 iwQmCqAbBzgcshGSKsrQMNzpu1TFhb2eAzVRgHux0t8ugFq/QMXPZ/xdD/3nCo14uCw9K
	 ZAs1bGhtGtIM0p41+R6uR2sk5397Hmvp0yWsJClZQRP/vl6zcdyrmaDV/UsDWXYSx7XEi
	 kkXkJfyHehlp7d5EHiQM22IXdtgvKuEAtYd06VKlxsoM/L2g54VSUsL/qhkh5o+5xsgZ4
	 XoQdayof17ldwACg5gfy7X0IXD3B/Ngr7hJNYYWXLqBB2S1bpvdhpbSi8ANmQP0Da6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990908;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=csVR1b1qOunnprGs/YKmTHhPqHommGDzIirA2HbkNBs=;
	b=dSU1bjftAOOxC2loor7kLS6gjpcqlTW9d1odEuqoZnmKKYHcWSgt+2qqO9cP79hBu8Kf
	 CD/lT8Oc+ZBk/LSQOXUSeCfSHH2xLX8BQnIZUx4gDiN2WF6M8yfrczt2Oqp3+2v7TjfF9
	 oA1JtE4mxEUBBOiqQWAyleMz9dGLxvtxGww+hp18H3Y5NAfllq5ja+mrbHwCHAknPDKUJ
	 Kv6MRIndRPaIj8FGaSroA0RwZ3aAWw+D/GvjysXFwYFKDAmaL/rePfjY8TtBD3tsDAlNY
	 p6l+2Ju6MckTX3L6dIdX79qU6bHQq1HwUJG1Z1yJ+oimWXglzITtgsaDDS3LkJ6pmew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZcbEq8pO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55953606A326;
	Fri,  6 Nov 2026 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZcbEq8pO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793990908;
	b=zrMBcnPJyIaFGjvLo/GeiaOlbKmLpkhsFIK5gbRha4STMsQRUYQ1/hDLGCQ36CibwkZL
	 xOY2DQa78LLAya1e/jTUqIGwAxGmXyiq/CtydxC9FZi+NGLHkf1R8PxOW6lj1TYlwFRt3
	 y/ZVhjDCsotvOLylzGHIycMtjmed+o7oFujxUqulRNj1DcsQGC+ay560Z+3+77SJDQcVM
	 wIaEg+OFcomWQItXB/k//+Zo3EMjcxd0xdFlqXsk1LF8ZA7tqErFzrnEQBwkO56H4LnSX
	 HZkZOUjs9XBHAKl0hh7pvg2sFwqN+q6W2IUHqnJ3Yee6gmXF2ASeSqRmppKJLV9y7XA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793990908;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=csVR1b1qOunnprGs/YKmTHhPqHommGDzIirA2HbkNBs=;
	b=LdHql8uTVhxZ4wgz6lmXEvDW7lbPsZS8U/sYPfdJKeBkXD0cNqEg/p8Lt6+MQqvi3oQ/
	 KNCPh8AxyfPf3HZGlcUI0uwX/C9ZixusV1+VgeRWACmuHNf3Em/sxcOeOZpNlRS+YWhFd
	 uhPwog72u5YC4Wr/p4BDib9b5WC8lCfOSgLu95KR79vx2ciHLup+FiDwBEkG3UhV92mP6
	 xWKJ9IeioDy7YV6cNwRXIW5yL/+Q9JKA9zmfLReFJoNRv9TuvU8Vbv1OBg9cBcHWzLxt7
	 NplZYTGFXcp9egyIwWu11Ec/UA5/H7T/RgAUQrRwwgBFEug9Qtts45xHX6uirC0cZJA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 707931F008A1;
	Fri,  6 Nov 2026 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990907;
	bh=csVR1b1qOunnprGs/YKmTHhPqHommGDzIirA2HbkNBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZcbEq8pO2TyJbAVy4EvEOFhhMI9NYvNSsWGnIbRpYSeomKaKbVuwaH90F4xPxyvkG
	 pOwCAO55/yiHdnsZQVdxhO3w733bPBn8d1EqjllKeVEif9QmmOAXXRtD0Hf46zzAZX
	 c9xcg/8jQ+ZvIkJJvHxxT6YZ/GntvrxT307hHUeY1xZaEIc0K+4tMDF3F6uWr7BTOR
	 XoLlzTfGi/1VU6eze1MTTtNExt+dSGIlgdntpCp+1rmwOl/m0Ez1jYxSTbJYshMk5K
	 oXtOBfkrl+lmifJLw2Khij6qZ7nD3/MZVFl4gj8svHm1+TejuBiCKNt9d6BZPn2d8x
	 NnLCd1yg+Aprg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EABD647832;
	Fri,  6 Nov 2026 18:48:26 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Fri, 06 Nov 2026 12:48:27 -0600
Subject: [PATCH 2/2] wifi: ath12k: simplify copying a peer's PPE thresholds
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
Message-Id: <20261106-ath-peer-ppe-thres-loop-v1-2-f6bb5fe9ffb3@gmail.com>
References: <20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com>
In-Reply-To: <20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793990906; l=1559;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=JLN7YicOXOFCr/vXZYPyTuLNZ3CcFDfpEDaO5w1TJNk=;
 b=Pa8jp3EhLqfYJuIC7j4KkGCHkhfh1h+xKMZt9a6cFmdDX3spOspd8+5b5OhSlyFuwKhqyqXF2
 ZHVoE/lhKZABcQNqO1MD6D7HrYmmogO93RLPDR6yKg0NyBvFKos6x/+
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

No functional change: a userspace copy of both loops gives the same
ppet16_ppet8_ru3_ru0 for every 6-bit value in every RU slot and for 2.5
million random threshold fields. Compile-tested with W=1.

The change, this message and the test were written with Claude, an AI
coding assistant.

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


