Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794457797;
	b=wXSW8UKQSe+mTIgFLeVwR/4urbUKHX2SOJK1UGOfTLbJbWxcV+KWXD9NjOeRRiwSebEZ
	 9W718/Kf0ySvsTA3bOdmhk4NcomuQJ28kWql1hsA2YGp4cu6TSX818aif3Zap7D9hUyuF
	 MZBnkkq/cbBXMPV3TIRbF3PEAJchaBaBuT31Y9QuatDl0m/NbuXVuLiB+s50Li05mKVvM
	 mXHFR30L9gYEON/bJktSpjBQZfX3nkSVlRzyeeDqzf4eBJHUWEHrgQdyZydnm2A288ZgD
	 QH7wjI6UcmcGcbvheOLWBt+oL92rMBuE1Da8+TAyb3CdauwD0cUnmuybbJqdGOIaX4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794457797;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TgVNlb9qjM6ZO+q5UoCrsvegC7I7n+tFz3ZHn9Xe214=;
	b=sjYzpnviaDfFy6pKzP7y1+NYD2MJyoEuQbmtf42lyS1Iqho7qmE87/1FT/0qyQ+yXXcZ
	 cEAPLaJVI17UezFpfc9lgv26PtzASZoUunUnrL2oUsRUZuHjXcqhBqdlZimagnoubUDZ/
	 MpbFRn0ofThOGA/p9A6LcaVIdfsJfQyNv8Ramod2YgoXYDskiKQHYPRNTLN4oAdeiwT+H
	 1UW4vMw9sTWtBJGggNsfCEEsOSZ6koTYAG/cv6J+wv2pPWYGY5To8UZ3f84J82Y+4sp8D
	 j6PfH3SHrjT2xb/c/1OJu5vE21ZAroJh6fdtgyB8GaRjtjfCzDVDpPlAwYKmQiB24iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oozVrttH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A139606A31C;
	Thu, 12 Nov 2026 04:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oozVrttH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794457796;
	b=T/JbhDJwZ7TL2ROEuCafRS0E+xcAjB1IbEW6v3sMvoygGZOYKIOA20JWOQbk+0X6wKoA
	 hdlV8ZI/F8aZsA/iqiwFuoUxXwaySDBgSnWaSgbXxMpUfLi/36MGhmaZuIc2zh3l5fGv4
	 XiL2172hVKm/cBlQikqv94s9WWQe5G0pXaBrMoliTdFz+mtmwZR8f73/kmiQVHgHlpxSY
	 rrXDrp4IM6rq1tQaC+M++pzy/ZpVJnJ8Q1Tz6dXM7tldxLOkqT2q8MfTHgO73hNvsVCfe
	 kVelLS5Z3cpxbOVCVzSiiXVB9HKX0HNKLPk66X+QWCqrJkgdCIv+tWSMGQL5CcPxNtg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794457796;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=TgVNlb9qjM6ZO+q5UoCrsvegC7I7n+tFz3ZHn9Xe214=;
	b=p6JecLNlHz1x7IsjnLTS65A0PO3jHy5eUKoWaEZKcsYQNUlIxJJivO8UEWmJ1xFv2G8+
	 tutP4xtxqUtqOzgFpY5Hqyk7b0S/WOc6HPraZOX1iWjaTpupgHKLz1U9o1wn9LFHQrDTs
	 aMarCL/HDoZ0e2vcKjewpNHFDe0UNaWqtmXoVHsAVANMppdBEZPUIvL5t5iyFdy19goxG
	 ES6MKkqEaVP3kQQcT3VSgx/goxERC0DmSV1AF539uyHqOmipDQ2g3mz2c+c5UNlllJ88r
	 KimUPn+ztF2PlNbqq3CcoPtokM9GJg6RxSp4u10wZn6j1SD4VDp8zy4qTcdsvqxZzDw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B2731F00A05;
	Thu, 12 Nov 2026 04:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794457796;
	bh=TgVNlb9qjM6ZO+q5UoCrsvegC7I7n+tFz3ZHn9Xe214=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=oozVrttHVAQ9s8HODN3qyThbZ5p0FGSSp26Qc/yPdpzRgNbKJ2cGrwNMKtsGz4GXE
	 YGCt8owh/YD8807ZfyKR2v7T2tnoWWlB0sP2SDUx/E0ZjGHDAw1Dw9gFsO0I26T3oF
	 DCDKfkw6BkT6hfew+jSu+lsTEH9oVriBOmYxP8BmYOT6GhkVw0U+VPaG5Ktq2axiPE
	 VI6oC0tNSxnCF7TGl3DkHkwzcc+sVyHgFjVVbt+1eYKO/cusyIBLY5cE5lPFOkbK0p
	 t+wRtvmYvhhsPBiCl+PzExcfxzkjSAY5OSO/Sez0b/J2MQu34LYJdA2I4fgPMXW0g0
	 0eUCTQkP1zUzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EF36B4927F;
	Thu, 12 Nov 2026 04:29:55 +0000 (UTC)
From: Yusuke Hayashi via B4 Relay <devnull+yusuke8h.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 04:29:55 +0000
Subject: [PATCH] staging: bcm2835-audio: remove unused
 bcm2835_audio_retrieve_buffers() declaration
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
Message-Id: <20261112-bcm2835-audio-unused-decl-v1-1-3b63a24b033b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMJA9WoC/x2MQQqAIBAAvxJ7biHXiugr0cF0q4WyUIwg+nvSc
 WBmHogchCP0xQOBL4ly+AyqLMCuxi+M4jIDVdQqpQgnu1OnGzTJyYHJp8gOHdsNa2pNNvSkuYP
 cn4Fnuf/3ML7vB0o0Dc1rAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yusuke Hayashi <yusuke8h@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794457795; l=1434;
 i=yusuke8h@gmail.com; s=20261112; h=from:subject:message-id;
 bh=a+TgyUI6wkUkFO2I4cpqAGWsRWGHAWy+RkqW/CQr8tE=;
 b=bFuG0CHsUqIN8TsqRDo45PNlrMwwZoe6/DklH1Tqgyl9UR6UthH5+qMZ4VkD64Y1ybu8lGEc6
 BozwNImwss8CQG4yK414WsNFnI5f7Fz6qGtJvrZ1v3leU9tHGXi/E20
X-Developer-Key: i=yusuke8h@gmail.com; a=ed25519;
 pk=7SzYbbTWl4u1a0gmKeMxAqo7g7F1K7tnWWGWQ+LnNNs=
X-Endpoint-Received: by B4 Relay for yusuke8h@gmail.com/20261112 with
 auth_id=1495
X-Original-From: Yusuke Hayashi <yusuke8h@gmail.com>
Reply-To: yusuke8h@gmail.com
Content-Transfer-Encoding: 7bit

From: Yusuke Hayashi <yusuke8h@gmail.com>

bcm2835_audio_retrieve_buffers() is declared in bcm2835.h, but its
definition and sole caller were removed in commit d7ca3a71545b
("staging: bcm2835-audio: Operate non-atomic PCM ops").

Remove the orphaned function declaration.

Signed-off-by: Yusuke Hayashi <yusuke8h@gmail.com>
---
Found while scanning staging headers for declarations without definitions
with an AI coding assistant, verified against commit d7ca3a71545b, and
compile-tested with Clang 18 (LLVM=1 W=1 C=2) and GCC 13 (W=1 C=2) with
CONFIG_SND_BCM2835=m.
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
index 5a1348747ff4..54ad749129fc 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
@@ -107,6 +107,5 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
 			void *src);
 void bcm2835_playback_fifo(struct bcm2835_alsa_stream *alsa_stream,
 			   unsigned int size);
-unsigned int bcm2835_audio_retrieve_buffers(struct bcm2835_alsa_stream *alsa_stream);
 
 #endif /* __SOUND_ARM_BCM2835_H */

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-bcm2835-audio-unused-decl-426a1123b3e8

Best regards,
-- 
Yusuke Hayashi <yusuke8h@gmail.com>


