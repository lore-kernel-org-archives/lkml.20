Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794321475;
	b=3E0AETCBD6vR1j4AAs/ek1Wo9mWGVS7r8ZDqrTtGlXeu9NZBhxNcAJi4ownbuZi/3piM
	 sybwXNmCQDBBXd04+nl6i9jnjYNXgy7fBxy9YJ3BuY8v8vTM/H9hregef//uIm9qoo9h+
	 aJh5TVqsbMbE5L5MSkRjSIl1LaGtfjnMIsDfZyAZ5JbjOENubPU40ATYEEB4bhw561ei7
	 ALRez5WsG6NJrbFvWEW4aLzaWOPojiUy3H+5aNKeAnGEAPlWBAqifiwzkwGGAgrUo2T7j
	 1NoYYydnXDX943xi+opz6uf/ta2v921+cLGaRkGJ2wRCoOLyQkcdbiJyqSUnN43IAtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321475;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TH0RhbJ4444L2PfImVqZG0ogOGpAWT0oGQI0lbwLlys=;
	b=zbsxuNaZIg+uT6dEU3b6TcXVFPDXryAT9wfOOwlAMzrMt5noR4D35laUWquzyGfWFM8t
	 Mxl0DfsBpHTmHUkqBtBUihqxXBJZf9xl9PzxG9svcNWcewVpZFeninolFAQ6yBthFq50D
	 5VAfyIzY0Ml4xMJYASM91i349f4Ig0TiP+KR7L0iea32ALC/6L5ffRCX1G+tyLQZrKKKE
	 Im82szjMhSZJrwXiQcOh8p3LQex7fSh87/cy2szsdWKxtbkgdNwd73lHyMuy2Du6YqEHC
	 l4qnQJPzd1yvacHDa3YTxn5RmKUI/rKX5hZLUy5F2GE6dSDob6eEMFxPiBBJRthIlYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzT62Hy9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73A7606A325;
	Tue, 10 Nov 2026 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzT62Hy9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794321474;
	b=Zs3dnLJjauRbws8/ITbmi0WZLIYeRYBCAFTjCNq/QCJj60OcV9WT0CoKRRUFyZSWDlbs
	 pa5oW6RF4Vcbk+znw0jfytyBZUUp1JYZJs/i37w/P6bKbFSfUOrfyiFsQJ79nbXo0Zx+a
	 BfKNnhFOe4oYuYRYOe6Ltdf/7eqknb7SPAiQuh5EVD+WR0KvBXox03pi380P8OwxqdvwG
	 XNW1SDK6ihU8w0F1fexCsrDX7L7nyW9OR9NKAUDfW6MZPynDlmu5RQqCZH7Yu5eh97bcN
	 ce9hqg6BC2DxLRPP53Ndp+Cq0RiCt8Q8axBUcYpybLBOkzGyUKBOo8eVAyjhRi2NWMQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794321474;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TH0RhbJ4444L2PfImVqZG0ogOGpAWT0oGQI0lbwLlys=;
	b=wI8/Wm5k0ZsQl7hqrYaOVHzwW+3Qzfzp5fRuqA2g2ABKYIo+0Im/Yrh/h62xKaDJGDNp
	 N/E/dN2T8FNofunwm8Oe0/zxNmT/Li2YxXxC3DFwR9JusBCLh9dR1kIye5fpzyxdb3xSW
	 o2ujYmtDufcszHfgOyKmDTQoWL3cOdqUpaNon0wtTwXx4FAYHx2mEAV7j575bTDaCQ2F0
	 +BAdmzbuVr6VrsYTpEbDJcqm96GSSAvERYcqGGWe0vNJkfVv8hhsNVZWydnmmC1N2aQC9
	 oOC5+u1zlxCK+vjVvQvqHjXyeR4YTWWS0IuLLbDm3/9uwchZY5EvUGi2Hd0UMcHIBBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52A531F008A1;
	Tue, 10 Nov 2026 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321474;
	bh=TH0RhbJ4444L2PfImVqZG0ogOGpAWT0oGQI0lbwLlys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TzT62Hy9N4yY0kJRuyflN2z2mecgmq5BuXoTRI+V6TxanGvJopkhwSCun0kCwxHyv
	 2mEivQSQBKZKYg5tmWBA06WgSHOvAy8eWk9UG+G5wr9rjkri3w+Eq7lX4hy6ctPK9f
	 pm9UznGpXX+U1xj5pCigZ7MbF+I4YV4Wu+mC9NqKKWc0q8KB3RNMXSvcCfPwoQbg75
	 069JFhLp3m0CcmIqEXCPlZ8nCWJPO+epXCrscypMfrGceh1x4QdXCsDfNUb/3PySYI
	 ZI4/febIuWsLWX4iND7KdIqLNnY/zfTGm1DTFUutdMg7rn9vmctkXjwNWOw6HSp8GG
	 6oCj93VgS5Tmw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C0EBC48B8B;
	Tue, 10 Nov 2026 14:37:52 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 08:37:52 -0600
Subject: [PATCH v2 1/2] wifi: ath11k: simplify copying a peer's PPE
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
Message-Id: <20261110-ath-peer-ppe-thres-loop-v2-1-fced87507920@gmail.com>
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
 bh=+v0/mtei21f+uWsVMg5ZCRb77EqWbxbixU5qhwUbCuI=;
 b=T4WDyBltYopDh9pNqvEwmGuyvOV4RHN47HxHiexGgQTrBn6RmOIBzBRPZdqVwztDMwGny8RtK
 HIc+nHYU2v8AVtVXU0y+hawhSJ9xXlLLJ+PAKhqJYa/zEn92c0MlGc/
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Reply-To: christophergriffin05@gmail.com
Content-Transfer-Encoding: 7bit

From: Christopher Griffin <christophergriffin05@gmail.com>

ath11k_peer_assoc_h_he() copies each 6-bit PPE threshold of a peer's HE
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
 drivers/net/wireless/ath/ath11k/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..d7ae9e8747233 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2496,9 +2496,8 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
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


