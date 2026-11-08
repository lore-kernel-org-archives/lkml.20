Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142190;
	b=hbhIEcC3QoYw8R2Vt3oSO1nhQUh1U0PoNcg0xp/MdZaU1wpKAx8PsAggsr3RiAZ0E1Uk
	 VBK6o1qcgwU/HuXBuTWxqeqXc+Gp4rwG5Iq2mXbXf3IPqHKPCG+I05WkvBlERY5zt/18s
	 H5/1xEfSbxwK2oKLxRL+8ZNVAlt+DxlWPo4FX3NKgS5F4KcjyafUZhHfcX+zlmqF7K4DF
	 GN2bxl5H+UJkPXdiyjTfiA0p8ZJ+MUXpFKdUodQZhQYMUojizuQ5GgAnCs7Y5S81uDgdT
	 elg223o1CqWPPI+IaEpGyqQat1vY11oheHVZqYHzwn4EqCgSIZLdPjXJLOKZBxUINAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KxflWA4WOI96BKFzV6JbVT2LnPTK5JHYTV9TFwfYl1I=;
	b=EUnMj8MOfTjn87+WwZ2WFIsExK9OSIRSfjZt4t/5uRqu/0Uf0qpIialSqZ1skH56chkY
	 wxdaf2vkvp4sjYS7A7w5lMHCiCKzwNxoyXPQaD3Opz0d6Lhi0X1wi4pfdcfZCxCmQFYrt
	 ZpLAmX0ZkuzkhdZrMb8dCY+WWfpO9AatzUKlTJhIe4CcT+mX/RPr1A73rbYHKia52H6gD
	 l+g851VXR+H0hk6DuqczPnRkmB/HF0RwXB1NEGy40ED3QqvcAZqMvFo5DuE45dn4VkDBc
	 SC6cgBrYe9ijs1AqXdV0oDvzpjXv+LpSxXkwTWXRd5cvW9Y8IUcqnv2VSlte15+RpbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y61DbvZe;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1B4606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A1B4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y61DbvZe
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so141525eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142189; x=1794746989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxflWA4WOI96BKFzV6JbVT2LnPTK5JHYTV9TFwfYl1I=;
        b=y61DbvZe2lUmXfaLUEJfKZqVmCjPt+aeuZSUhBiwmJEvhKOh1+Itf3YfVdlzN7jE2l
         LLnzdiAePJG9UFfp9h8tK9d5IjbvRQ9BwEB2fGR5Kbn35vnRodj55p/yK0Y8gBaxjs2E
         t71Rn5eNEpfinLST5UzpczmCV68TwNc5SaAu9FugcxXRzmt9N/qeYM7XmhQmAShRL6xW
         4fjHowOnSzn+alMx7Q5V6ehydC/0/rMIdTXUxl9HVdeBJH1aho5/eIeNZPPimpNVaJhN
         CBYHlVR39JHK7GsKHfHWBpKUBg9LXbCSmuCP9OpBFATU3wp0QRUlAvyAf3ABeh+SnHxs
         H/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142189; x=1794746989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KxflWA4WOI96BKFzV6JbVT2LnPTK5JHYTV9TFwfYl1I=;
        b=ndXlwlMosptSDRhDPy50J9XG65B5iKfXoJ7IRNbPA1p7eXn0Y0E9g+CWPmkWdjUwoW
         UNZ47nfzItCYQst4bN0JLBcqOvk8MwCg2WHAfIiyQg+N45VaXBXZZLI5mFyVFWu9juvc
         Fhiq5PYoamctygow8F0tIouyJqK+oVa7IaM6XVUDpBY/Zo3Gbhwgj/OtcvXPbkHp0dl7
         gPPO0WAdmBlYNXIoj0jU4OCFzAPflBLjaTC5J9xPuZbQ7AH0QCqvYyld28f+goYq1ZiI
         d2pSvhhdoAG36MbnMI0GIkBgEWXzvGv8jqp4eMbn5J19ZMHw1EDavBtiecZIL2hCJaYx
         uZtA==
X-Forwarded-Encrypted: i=1; AL+hErEIZ1qI+fd/F+NfMBhW2l+8sVLWX61SBzseeovEXGeb/8V3IMvNzJ/J/ZBwXKZ8ocFh3apvMjtMrZCAstk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QE5gd8MInO+CMr0DF1owGicavxakJUEY1al75YLxdzopgeBaz
	XioHylTL14sjWPHiMJ3U4ex2id9Hhz6SNy1Iu5hs1pMHw0tTFvfSL8ju
X-Gm-Gg: AYBFou3d2h1MPpdrTzmQOn/EQmFbMVmLwDhAdyA5f1hRXiwcvjE9gQzNPwidLASQju0
	H8Y0Vs2xF1sxpOooXDGZzVHMFS0m+OAEICNJlSLoBKRe48i03WtAS3h1mVOxISQ5n1UrhhepcOP
	uqPmWQQld0mZkbCIpA4MnP/Jp33AdxJS1aH01qxv2HlYE0jBp4IVngE/Y/oV9THJ5zScMXH6iEF
	5GbaZH9f2sfXZYjxBTy1oRphB/3LpJreRSMVLRne5G1LmT8+ynhkcUvsMzhnpmP0Ip8w5KTBohs
	ffMhSTr2NWSgeC8JeJEnu189nf6Za+/5mjL29/ibR/JrJEF2sSxhfnA/UDcpZFzyB+Mb6zBvJtz
	S1aqUxNa2nUxWxWbSRe55RLVfsRaRuI/eGRxIL+4r7+R+HWSc7LdhYqtIHQdq7AVaBx0TA6Gt6O
	sMRNHHYLgSSZYXdONq1lN2bSTAosyb+SyrlR/F3SMdr7zIMPrySjBl3Ym45SrmGx+Y7aGo4T0ZD
	a39mtnXD6Pul02e3oYmLGUVWuLsQHketf9TZwJbGnJFkiZ2mZxSglFepsgq0Bu9j6AHX1LCNEAB
	LGW5zdcgv9xlA7yzy1gPqt3bOLQzGgpcZT4RrOAZ1MSlbj83OcHPxhgixIvYlBvm0cuiItwFydJ
	ahY6bXQ20tK2S/f5x138XxGhOhsHKTZCLEpyQmPw2
X-Received: by 2002:a05:7300:7943:b0:36f:64e9:f1c4 with SMTP id 5a478bee46e88-372573d2436mr3151348eec.6.1794142188476;
        Sun, 08 Nov 2026 04:49:48 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265619774sm5623975eec.8.2026.11.08.04.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:49:47 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 1/4] ALSA: ump: Clear stale RPN selector on NRPN change
Date: Sun,  8 Nov 2026 21:47:48 +0900
Message-ID: <3ed25a99e07b8cd803f9bd6eb0f88ef00ae23f4b.1794141913.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794141913.git.sammiee5311@gmail.com>
References: <cover.1794141913.git.sammiee5311@gmail.com>
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

From: Alyandra Zahran Nadhir <alyandra5b@gmail.com>

The legacy-to-UMP converter keeps separate RPN and NRPN selector
flags. When a stream changes selector type without sending data first,
both flags remain set and fill_rpn() gives RPN priority, so subsequent
NRPN data is emitted as RPN.

Clear the previous selector flag after flushing any pending parameter
data and before recording the newly selected parameter type.

Fixes: 0b5288f5fe63 ("ALSA: ump: Add legacy raw MIDI support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Alyandra Zahran Nadhir <alyandra5b@gmail.com>
[HyeongJun An: capitalize the subject, add Fixes and stable Cc]
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/ump_convert.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
index ecbd894f4c83..fe7d3ee3c6b1 100644
--- a/sound/core/ump_convert.c
+++ b/sound/core/ump_convert.c
@@ -378,6 +378,7 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 		switch (buf[1]) {
 		case UMP_CC_RPN_MSB:
 			ret = fill_rpn(cc, midi2, true);
+			cc->nrpn_set = 0;
 			cc->rpn_set = 1;
 			cc->cc_rpn_msb = buf[2];
 			if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
@@ -385,6 +386,7 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 			return ret;
 		case UMP_CC_RPN_LSB:
 			ret = fill_rpn(cc, midi2, true);
+			cc->nrpn_set = 0;
 			cc->rpn_set = 1;
 			cc->cc_rpn_lsb = buf[2];
 			if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
@@ -392,11 +394,13 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 			return ret;
 		case UMP_CC_NRPN_MSB:
 			ret = fill_rpn(cc, midi2, true);
+			cc->rpn_set = 0;
 			cc->nrpn_set = 1;
 			cc->cc_nrpn_msb = buf[2];
 			return ret;
 		case UMP_CC_NRPN_LSB:
 			ret = fill_rpn(cc, midi2, true);
+			cc->rpn_set = 0;
 			cc->nrpn_set = 1;
 			cc->cc_nrpn_lsb = buf[2];
 			return ret;
-- 
2.43.0

