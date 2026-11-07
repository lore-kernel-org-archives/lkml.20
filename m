Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060606;
	b=DaChJ5VJ2PZvutrvh1lqkCsz6j4vJ/bD2ofP82yihCHrHyyxOQFn/lZOwjhoQDy1y1wF
	 6GuIh3U13a6qZ2mMbA45nIi1X7iV+5F37JhCe8TRnqqN8x2YnSo8XIl+vR/FljaWGUnV3
	 /aiFFmO78YqFyUi40n/ywEdNiVWcMHhdUTD6JP5Me4Rgo40Jh60M2LgbOfn71GwLI9Ln7
	 +XWHs3x6dnQ+UD5f6Pm8NWftzS6ammuFQ0fM3INPrMSb6m+TmvQEk2KweF45WJsWfkU89
	 enG0JAwqo4awIv+DpCBF7xuJ0UFzN90uBiBssfDGlJKwOcz6BOaRbm2/zamXN8WtDOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060606;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=C8bC2NsVqIFwWmt8X0WfCRstENmmaEaTk0k2lcazj6E=;
	b=HC2XMWvK0EDqw9Xjde8/s8jJNWoI0iqTvQ0USq3wrieLKlRlqejTqtcgOaothjcQAUMm
	 baUKXEIFQW81hIAGBoP86vVVqQIUo2Au2WrN6co2UnyEJoYCxaP4b2WYoUyrcltvgACBp
	 ahN1aDpZVtyjIl8YdiDK7kbsmykMzvMGE58hUmOKdw/t2UOZ1MhbF6/jessziJtWaBZjs
	 JlJZMTlQPw1oy1+hTIv7fjNLsiXEO9wMj/BN/WZn6HJN5VKBCtXbY7yzLqtVsSGHCRA4E
	 gLF8gxoOCdPF+fy8253IgYgI9S1uFlWcactO4zBWIcKgKtXkhBn8iugG0P79JBmohsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kzg0xtA5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE186606A337;
	Sat,  7 Nov 2026 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kzg0xtA5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B711F008A3;
	Sat,  7 Nov 2026 14:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060605;
	bh=C8bC2NsVqIFwWmt8X0WfCRstENmmaEaTk0k2lcazj6E=;
	h=From:To:Cc:Subject:Date;
	b=Kzg0xtA5gccVDznLtPnQdQGd1KXPPQ69cZRIQ2ylggTySqq1CWGTOVf/CUzmY5uUy
	 7tvA/yRdksJDbys4TML0UNXlJD9P8xfZ2KCv52PluZFArUarfcGQASGzDMa02/VOM4
	 IzNEd/uVLWmI+1mShVZfXT6G82SDHlNja/PW1fzArx0r3xIymXNzHp7B3aFBtBScEV
	 /Ep17ebQKQ2C3aAUyeUuGYYXeKDXxwq3y5iwcPxcWv0bfhHoXrEYhx5HM+jOCVlXpZ
	 r4oEPL6XfB1uef83lqK6N81PDM4NEzrTPIRDhX1wOw94cfYUqdMnhUfToHGi5fHu1h
	 011ABihxPACSA==
From: Thorsten Blum <blum@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: info: Use scnprintf() in snd_info_card_create()
Date: Sat,  7 Nov 2026 15:09:48 +0100
Message-ID: <20261107140949.350482-2-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=850; i=blum@kernel.org; h=from:subject; bh=5luqy0+Wcd64e5SmWxt/h/qdAaxawGACjSa6NGWz5LQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnvDfW6T0/cmdYrJh8hYdpiEdq0sX7W5Xrejus3E+VKL z+WfdraUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABOJrmZkeHs1w0D6y4V1ufM1 dxnutfXrX3ReX3O14ept9rKhFc8WnGH4H7+n8c5WF7kMPeYZ+5rn/TKVS6iXnbva8YiQTNBFnkX 7WAA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

While the current code works correctly, replace the unbounded sprintf()
with scnprintf() to bound the formatted string to the str buffer.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Changes in v2:
- Switch to scnprintf() as suggested by Takashi
- v1: https://lore.kernel.org/r/20261107004338.323417-2-blum@kernel.org/

 sound/core/info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index 023b4736aa6d..2c2a80a7d0d2 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -484,7 +484,7 @@ int snd_info_card_create(struct snd_card *card)
 	if (snd_BUG_ON(!card))
 		return -ENXIO;
 
-	sprintf(str, "card%i", card->number);
+	scnprintf(str, sizeof(str), "card%i", card->number);
 	entry = create_subdir(card->module, str);
 	if (!entry)
 		return -ENOMEM;
