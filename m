Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581962;
	b=zjS9va28MSfJe7b0p88t09q33t7Z0GNBvmYtXrY2FmasaSrK/h9uPeQUv9XUE43WnRxU
	 CjJyePeWqYsHlvjJ7lJmhm4qf8JopDQ+8nG5VEPZhi/Jjeb+2331092e0e3+08VK74pB7
	 WKp0bo6yJtrmzaFE2W1dPuZTIr2udsvgNxC0Lh6hZPTAUymM8S5JksyFCDIuJh5rq8Tji
	 PdayodSLi05ND49xozwYhwrCUFIIU5ePaCdNld1WcBaHzsyJvfu5bISZOAI9eUPhW2xjr
	 BoZjzbjwBTA9j4RddK7rkJpktaB1qIXx9XPZjeY3scZhMTbLervaVG0Fp2rO8o3gnRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uSgU66UvvSwylDygU94JyWQL1mKuGXT9QBuCeFw9T5Y=;
	b=V24SBIr45dD/qbm24lc/s02xvxAqcagpa09ZRsETW7VSjPCpGA7hA93/9/KvBavhN6pn
	 Cc5oiNICkOKtXZEfEqcUwhd9Sp8PptRC3fOB+N4sC9uzDvZnxnQ2ZhUXCSZSsFXZOU3ia
	 7QbAc5vbtGl+S3NtucBQyti7lU/TMzUraqn6wVNRLRVbVMcnCWRnMR9mCmLuXa2ZoYmWS
	 UkjopMFxAAWWyRMFQeOE2EC428AdoTGj5TlnYlYgSKt8IBU1U20Kuumubq38hXerbxPnv
	 y7TadtupFCp47G1hoHWha8tKWlGoAAwYssVWPFDbrq0PSPwxXh8nbZ/j4JbE04acFtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KkLC7HeY;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17C2606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D17C2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KkLC7HeY
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-18cdcfc05ffso579617c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792581961; x=1793186761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSgU66UvvSwylDygU94JyWQL1mKuGXT9QBuCeFw9T5Y=;
        b=KkLC7HeYFLkHWL6a/YJIjripfrp8Tlbapk9ls0aJmQSlRiHSs3GU0Xa2g9vkueejnn
         WGepQ0sG8Mu4CLV8tsdpkkx5sVuMVlnWNE3BU7BnRQNGMqEdP+T9wl40+sYZIT9BZjA8
         akn2KMFElAh6pXjn86N+wFie2wmntjE5RYBkBxqwaHx5kamu8DjWGrwqgPHrU1RMrSIb
         kUeX40BH0ZXQ9y92VNIusYxBx+5sp60OUrmIX3dojenW2z0AyyH+N4nd8CpixI/EQqK3
         ft3iATIbj+/QXBxEUpGMwDSOs9powJaopfl7VRpwByD1k6ZQZitxxiSW/J1EHUeC+TJc
         C57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581961; x=1793186761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSgU66UvvSwylDygU94JyWQL1mKuGXT9QBuCeFw9T5Y=;
        b=JEvWZB5OM6IiD+RmkfDw+AR8kaue+iWHQkEhFz4Xru5Fwon0L5wbdeNYZ4wCfFN4Gm
         BwpwN4W5+ogKxs4gTmKcHnVUj67scT+vZyYrXAuO9DnP6YoLTmnV+D6TqsdAXhjOFpDF
         vTbZeACvZ0FkxrICQrLmLssnKuU40vDVVC8bPENTfqOK218qU5FYvXdUDuNqkV37BANF
         eXrMithWaBY6xu11jT8M5ScfEw+w6S4MD0Rmshfjql9hc9xSfQ0J6aVC8qAmWQIotb8b
         7qK1bpP6n3zt7cCnwPzBeD7zjQZF7aMvfvuWyE82zpsS3g1xx0AvUYgyLBEaYmQ+Nrnb
         i+gg==
X-Forwarded-Encrypted: i=1; AKwUvBzUI4uDyZ2EXeUFtmnfzaeWaws5LwW7ZRDnMyXnwD7dVCBAdQ3o2jEci6IPzYuevCg4OV+2bqwbtNBVul0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2Yz80lrqeQD/cBRIBqemsi9Or4W6acWAOXKHaE469OHgId2YF
	Ywfh+M0mJj2ZmHG7NPX68gv9xilBoG0NRJcg4oTf8sngH9ObhpbTgLNs
X-Gm-Gg: AYBFou2nSGZfTGVLzl38w470KNf0KPPCcD1h7vvrxXYBOd6czyIzPTD6B5sYTRLCESQ
	eyVTnK7hMU7kvh3t9yLy/ES85jULxsEOtUVwtoBlWas1mnYbwT3iNluAADbR2qTV9WqlSfs3bY6
	xXpMy5Ert05JL8DKBxONmsqp3GkjmDcusTYViDKWJbBKpvjUlSFFYwdZBBWiLnC7RgZZoLV3izN
	/1ID4b5i+gQzZbTK1cj9THI0HYeC8xd8gJH6QVz/QcJqnmSB94faYhHpUaJybERBM1x7Clzma0I
	cWmKtYE6tfQe1qj4holsqVuFdDp8VYtE4Q735317Nr8FctaqJTC3KJx5+i6qOaRJkxw+M92DhAF
	i/3Gcd7iMhPt58xLX1IHJCMyPcSbmGq5KxjhL8N8qMaNIEj0h+UWthvt++fGGGCdOSZLpPF24Ey
	qaJvrMl30S1QDbSoHlWsexq6nHmq5ZoPLD9AQ3Lzt8jUA7+fAYhrYIWGo0UrVSy/hcj4sGSEcgK
	JTsXCgrsjtatPoMHDCcqTcS8NPj7F1Gst4Zy5uAff46rvBxzHwUur4emusbmKmWqjMnrb/jVh4q
	yeCRXv7b0d4RGINmTx54j4di6+bBI3+0+hMEt8rfGtw0L8jUUwXnjOKOgAbF8ke7zzk=
X-Received: by 2002:a05:701b:2051:20b0:18a:d0b5:fa42 with SMTP id a92af1059eb24-190a604f7f6mr2326894c88.19.1792581960622;
        Wed, 21 Oct 2026 04:26:00 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903ca044d4sm5810344c88.17.2026.10.21.04.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:26:00 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] selftests: ALSA: pcmtest: Compare all captured bytes in ni_capture
Date: Wed, 21 Oct 2026 20:25:54 +0900
Message-ID: <20261021112554.4037107-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ni_capture test reads rate * time frames into each channel buffer
and then compares rate * time bytes. A frame is sample_size bytes per
channel, so with S16_LE only the first half of each channel is checked.
If the second half is wrong the test still passes.

Compare rate * time * sample_size bytes per channel.

Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index e025a7bac26b..18ee72d5d4c9 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -265,7 +265,7 @@ TEST_F(pcmtest, ni_capture) {
 	snd_pcm_close(handle);
 
 	for (i = 0; i < CH_NUM; i++) {
-		for (j = 0; j < params.rate * params.time; j++)
+		for (j = 0; j < params.rate * params.time * params.sample_size; j++)
 			ASSERT_EQ(chan_samples[i][j], patterns[i].buf[j % patterns[i].len]);
 		free(chan_samples[i]);
 	}
-- 
2.43.0

