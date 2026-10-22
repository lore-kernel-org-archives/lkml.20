Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687261;
	b=YELSzm+w3Cz11l9wdKN7aC9RnoyJB7fNzx5EutnKbCjFAtXjoxRazQPJzunQTI+9FrSw
	 S32d4ZzUO/u8d34VkMtP+EwL3fuKeuUUPZ8eTPCi+68d/taljZHv7HPGB1tB6wY2ZGIBO
	 h3mQW4+tg0EIUtevf+1Fe8Tz2wmgnNta914OKEMUimlBxv+4Qt8dD9kl3l7IAXDNLcnHO
	 JyYL8E3d3kn5IinzfWuj0ydS+08YGqwmcwUQjiNTpmVMx6GXrV1VdNMrn85PAQwikj/NR
	 Ya5HjFzSete0lrRNlL0UFXeEjuWSHnDzQ5ouq+iGNcvvHVAxSDh9EXU9/fNx+gRNJUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687261;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=4ukBa9EJ7USEtoaEi8e1+b7Z6heRCBugWO7Lj117fXc=;
	b=2aPe9x4xWoZrSpRieYkSg2J9gqes+Dvo1COEGMzFu1fu2mftP8bQzxx/+ff2Z3JIYY6d
	 g27n+WLYxATcZi+cdTxZ1biFw5xDIn5SufzpESmJDQzcRUfKhjNPja+02POjFPlZEFzyj
	 YhkugM+sgDAcd1x2ISYdsUNJBZXAMLh2LeOzUtmjbbzz6sI8y3A+KhqDbZzNt6N7haFUD
	 TVUXrR4SKMGfnQsDtoOre7kehkMlIFr9Sk7PozGks7ur/mcdfFPDhYCbZdkSzfORPDdfS
	 kyrWTRPzi9Dd5zwaKfRqgzAEMP8fjwirOItYWHx6M7HMxzPsgN6w8DcMfKV2bB3EAdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a+ogSzb+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B624606A31A;
	Thu, 22 Oct 2026 16:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a+ogSzb+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2791F01825;
	Thu, 22 Oct 2026 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792687261;
	bh=4ukBa9EJ7USEtoaEi8e1+b7Z6heRCBugWO7Lj117fXc=;
	h=From:To:Cc:Subject:Date;
	b=a+ogSzb+XHWaDhzjVgwNiMDxYQh0piVfMTZV65FuTVIJza/1WFrQiMhYmJA0rOf8r
	 Ak0nJu97MWTk9mQpLih6Y4QoQHuDbx/HspbDJKfoGfuRmq5aF2IEmSLQcgxciT4POG
	 0tH/JJHrNxv18E4CU0Nbk8xtOXlCM0sNUlBvhNh6zrULlcwUyuVaM6tID9iNuvjq/Z
	 2waJyj4XHVfN2BOWc/h/Jv7EB6ke1zuKSxey/d+0b78ui4kflzG8/EOFTrT/XVGjk5
	 nWOdPvHraIfW4pjuOU5n163qzklatB6wekBeUIXgQNFrwhrEpxQY0czuHgz2FkTmRM
	 bsEzkisxW8ZaA==
From: Thorsten Blum <blum@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Cc: Thorsten Blum <blum@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: cmipci: Use strscpy() in snd_cmipci_create()
Date: Thu, 22 Oct 2026 18:40:11 +0200
Message-ID: <20261022164013.95811-2-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331; i=blum@kernel.org; h=from:subject; bh=HgltFDZWqkou11AuRCrLgqLX6WZWPGoGqfLHpuG8SZI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFm3bHJnF86wDjQ+tp655uSPZYcF5pseELGMD85sqihYZ MxendvRUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABO5ocfwz6zl/o8lgf/nekvd f7ltwoJsOf2+DfMaKvbtZt/aoybkrs3IcIGN8XxH7PrAkASG7ENZ6Ud2XDV1mNT0NEno9p5N9Zd uMgAA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

To prepare for removing strlcat() from the kernel [1], use strscpy()
instead with the current driver name length as the append offset. Also
use size_t in the multi-channel branch to match strlen()'s return type.

No functional change.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 sound/pci/cmipci.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 9d9f784e3a8c..5722b722da95 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -2980,11 +2980,15 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 		query_chip(cm);
 	/* added -MCx suffix for chip supporting multi-channels */
 	if (cm->can_multi_ch) {
-		int l = strlen(cm->card->driver);
+		size_t l = strlen(cm->card->driver);
+
 		scnprintf(cm->card->driver + l, sizeof(cm->card->driver) - l,
 			  "-MC%d", cm->max_channels);
-	} else if (cm->can_ac3_sw)
-		strlcat(cm->card->driver, "-SWIEC", sizeof(cm->card->driver));
+	} else if (cm->can_ac3_sw) {
+		size_t l = strlen(cm->card->driver);
+
+		strscpy(cm->card->driver + l, "-SWIEC", sizeof(cm->card->driver) - l);
+	}
 
 	cm->dig_status = SNDRV_PCM_DEFAULT_CON_SPDIF;
 	cm->dig_pcm_status = SNDRV_PCM_DEFAULT_CON_SPDIF;
