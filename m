Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794012241;
	b=z9EcYdAGwpdRxyI2ZVIi9VAIDMO2WeIduU9qpKR542exgodXZ1t/NMpaHZ619s4w+G9U
	 7gW4rGxNNEdHst/zZOKI44cZoNpQJZ9nwXLR68IyWOylUQMeZFs3Zp05PKd49y6zMVWbk
	 zcy2WR85C2N6QNLrhS8U6wPl7Riw7Vcf0oo64r0O0sh+FmsC2Uw83wjKXY4lgP5erJzpn
	 B0EKDAZbOaJLt+n8e7Z02oXemRr+l3DiIjRJllLyBCdfbd68KGdn10z3sPiJcF0v71hM4
	 BLwQs4wazYEergW17zFZ6b1Ho+x8Lh4lykBzGyWPS6E0F99lcISapOfh66pTBDvbD7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012241;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=mgxIMf7VPWpAsivL89NwXprZXyc4QaXDamELp8vRhWk=;
	b=hnpjNZvUs2DanRorY7nVqylIYE8mFEP2NcNHwHeEAeAyb+beYFqDr3jyGpSsxU8ffbAF
	 MQCtbuZf57PgkmWvnnZPw+Bw54XTiGUWZVzvg5OCB6I233rC5wHOcAksMxrbNJx7cqgaP
	 uh1oO+MqZC3eV/RLhZZpvcttdmbFg696KjePOiZR07NZOyVakQbICmpUXPN9o5ZAAJK4W
	 SX61emXnHmXNvVuHYgBL2RRNfepv+jfZnPVxoSVdeZ4HwthLGcI4Jggf3i+rcKJVXWphi
	 I8f5qpKFmr41vXfM63qFWWhi6Y1JsVda2+3k8fxRvAynVUYBXshm1i9omHlXwOReQAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hp+bm6XC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0785606A32C;
	Sat,  7 Nov 2026 00:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hp+bm6XC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466D21F008AB;
	Sat,  7 Nov 2026 00:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794012240;
	bh=mgxIMf7VPWpAsivL89NwXprZXyc4QaXDamELp8vRhWk=;
	h=From:To:Cc:Subject:Date;
	b=hp+bm6XC4IshqIdXxccsXK00aYnB9kOswrgeZV9Kr4ipaTkzmYJ/RcmJi/nj1fx1y
	 dSNGe9s7EDN7uINQimOaoWfod6D7M01txbtGB74mdn7EWG0CmfEtm7TNf4bDMacHZl
	 yrgXZh4K8l20K0U9TGZ/PeXqyEoRZ3Abu8lZz3cIlekFUs5aT4IuRHjAkKvsaktKrw
	 Hl3xuxQ5KjEatLjOS5CT+ivMjUrexLg1rJvVqNlmPk7vmaY8MoqF54izyZ5W0CMny9
	 HvtHx6m3jHHCnZMtRwaG/oIrYw5l3cVGlzujWyK45CybpXmPwwffPxdkcUCaDdZtDZ
	 yEybNPuirC7LA==
From: Thorsten Blum <blum@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: info: Use snprintf() in snd_info_card_create()
Date: Sat,  7 Nov 2026 01:43:37 +0100
Message-ID: <20261107004338.323417-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=707; i=blum@kernel.org; h=from:subject; bh=2wtZEpDXo4iMrkN/FXglZU5GVC2BSNKOQaYVY/7gxPs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnvSqw29t3+MmXz4oPLlrH8a/678/DjS5Y9Ususo2U2F qa5RqYIdJSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEqjgY/rufdX50LLrEf6p6 6ccGxoXN2d5ln2X2fg+7sNQi1DlqsSnDH34upcPuNeuZ1FrYV72bKtl94sWi0nhWRZOiSRPqjv+ 4yg8A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

While the current code works correctly, replace the unbounded sprintf()
with snprintf() to bound the formatted string to the str buffer.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 sound/core/info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index 023b4736aa6d..b0ed66d0336d 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -484,7 +484,7 @@ int snd_info_card_create(struct snd_card *card)
 	if (snd_BUG_ON(!card))
 		return -ENXIO;
 
-	sprintf(str, "card%i", card->number);
+	snprintf(str, sizeof(str), "card%i", card->number);
 	entry = create_subdir(card->module, str);
 	if (!entry)
 		return -ENOMEM;
