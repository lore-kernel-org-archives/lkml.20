Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384386;
	b=il6sR+bd1zi34GUb1zxVH2O0qkiSWH/TU1Q1blD/HdNnKt4XurQtNBawDRzPaP3RqLMl
	 173Y6zTlfQQIHLNhggTHS+CucNW74SXxre7bPBQnt4CcPDFZhtPw8sGtaMX4WDakrUqU+
	 TjYSC0GC4F0OFrVfmWpDP5BpwUV+6fRIY4ioH9Tw85I2NMcTHVtwa1bcZb7pWqYo2lgxi
	 Ni+mKoxCJm+JOCA94Tg4mRGIlFKSW16ArApu2XKlKFs169eTHWWtg8Bwf3BMUay/GmHse
	 bhH/X3zDjxAZ5IvIxa+6D3GL5NfqtRApJl5i+OOoviAvPbsouAOr6s9lrLUFHpHPEUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OW9QJPSFWXvk4TDdxTnmEns6NJG95v3o7EuXSqNcnZM=;
	b=KutZ4cAUtekDn/iVhzk3UAPVFjirCuTE+iFZi+xkvdAohCzwtku6xKOGEO5sQSu4cpvJ
	 ux+iPi8jTXAvnAvpVla1aPPLtT0GXn65wBAZa67t0c6yEne++LDdQqJHaG2xJ+iGckGK6
	 uLl7byZDrM/3YZssdqV1O8RCbFOXTHfZvERGozG1LN7fLCUAY0gg6EW4jfHDcDK/HSnP7
	 kAybyCI9/RcxKDlwYMky31dD0snxjZEOhoCIKqFFlYQgbJV6K5xYpzab0yn1uZztGhcC7
	 Jq8sUxkw9RWg1kd88eg+6nCI/W68HaZMKDjNIfvdtHwT2ymvVff4FbMXppWPj8/XJKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AlYTsRL+;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A0160A2600
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A0160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AlYTsRL+
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso3201121a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384385; x=1794989185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OW9QJPSFWXvk4TDdxTnmEns6NJG95v3o7EuXSqNcnZM=;
        b=AlYTsRL+0s1BR+PujwdU1lr/Y+4yy5c+uBqYJp19RM9D8QOLaKAA8mI8AjO0BVn0cW
         ANTBzYjL2VrTEUG5aGN24Ro81LbeZ+daldaVrx+gLfCxIFaQLJmKciZIFZej3BNCdwL2
         O+4H1D9D2OcO0J6OgFblPomMjEaeqwzPvAh6AMIvi0Jm43mM7Jx9463+rXutmQCSFyad
         jVLoTzldDsDeIp4MEZNUJLoEc+SI89nBduKqNi2BiG1AIO67fQMOhG2ywQaoYeNILoao
         Esez4mHZ19cNsX9oGufEUMDg2ZoyCOnKsUsd2HbxdIHkRh7+3dLkhcg7qjJupHJtZor/
         D2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384385; x=1794989185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OW9QJPSFWXvk4TDdxTnmEns6NJG95v3o7EuXSqNcnZM=;
        b=biLGyf0XyJ/gtmrL9srax7g1uHZurVzK8KTgTDD0YVwWR2lNPXVyPgVdIi8iI+8j/4
         y/O64p77GSwFiWNPdHeSc7s6BXAmEho9i/ZOW6rYZSL5sqLnlI7qJSgYP3d5heaJee8r
         SKzAB54bOAD96IB7SxfoY94l2TtuwO8sOXIofdJ1lRDGA8zaZod6rMTGuyCBc1b5Sx6B
         o9f1N3FZTpRV404c9CIE+Ic/dabp2E8yehu+hwPp8yvL49Z8wY4GZ8IAd1CGcy2i4xlj
         CchSnXK9Vn8+PPC3liZVzLi2NLEIg+Ng0O/xNvN0KyHKTayG8DiA3bAqvtDmJbi/v1aj
         8xUw==
X-Forwarded-Encrypted: i=1; AL+hErGZ38ePYc9ET1kiBsL4lbX4I8qMK5vbl8hchU1VKfUE/CxSHeYsaNzpvv37IxUQr2wQvyyp7cZXfSxciiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K6NEeZdQ586cyJb0Rj8xEmWF1gkQNiaBZhRQaS8hJK/bQ24lg
	2+UDrjJT4iNwMEeRDHiCtDqLgNcLCHjTdtRx3saigyyk7QJaSISoSHLh9f5VyksDmOPbcDFizK9
	QOcOB9AyE
X-Gm-Gg: AYBFou3sVoKlIALXxG/jWuIY2h9JnoeGDGJjPbw2MTS5STbI2xiDqS669/m/lHzhiv/
	foBL0tm/AQr//bxtxFUXqkYlp1Bw8xH48xb1mvmi/xtUss2J77j7zeknIUx00ItiSmkT9v0wgwS
	XB1acQL0LYdh/oC+1ohDnIaFQgg2myKSrjjGfaN5AM5APy5aU7psR3nP17s6g4LySXSgebULDNB
	VAcolL9Lm1QYjYDSAQAQztrm8D2Ex8bGxFRjU1IiZBNUQtTI77vtwlBFaX9nldVNdehrm8cgERJ
	6h8vZhCpyNh9KeBu6HPniisn82Yp+FbjGLTR0pY3rsYuNDFxAFIc1r+OmNtfP/prkhH0OMhqssw
	EbsmYDc6NFRsSidEYLUTb3x+l8sxisVGPjJzAEfitAwNl7a4ADQVp2cPTV8MUufYcq+V96XnIik
	SrDoVJOOf8t+qsROoQFLERuOo8s97Q084nnR1vIB0T7dEIAiFbTWqII42QtgnsUos1SaoxaaT8n
	crqln39bYBXdq4i0/YCKZrm2lHTKFGGh+c2B2FlPoGHkPo/s8abBwFsNjCd9m7sVwN0WX3q5j4E
	Z1k9jfyaqelZSyzKFDVi90kdLrzJgfO5vblz+HOj2fd+pehYqOwSp8befK3zBiiMgNF5p5EvrRG
	nJMsS2AHgKew5WFh/dfhbH2sUZviP5ZrPYxhyvSa30ZGkepmClQPNjD2EX8uYvd1kdKRN/6mWG4
	YdLOUYuQNshFBJ3scR/e9BtYl6ZpGyLF2DpOUOTL5FDw6/4BRb4HlUR4Ab2cUh4C/P1l0jLgdQR
	8lpW1zJFWv882Fx7dUMWaBQQrqJFzzf4ueN6UUPlQ8QI9CUj1I630t19+u3Ox+fpslswE5vmU4W
	mHGTrVG0Qn6ZRlHERrE=
X-Received: by 2002:a05:6402:2b92:b0:6b3:c089:5806 with SMTP id 4fb4d7f45d1cf-6b777347cb0mr1310917a12.4.1794384384746;
        Wed, 11 Nov 2026 00:06:24 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm2219265a12.3.2026.11.11.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:24 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 1/2] wifi: ath12k: drop TKIP frames too short for the Michael MIC
Date: Wed, 11 Nov 2026 09:06:19 +0100
Message-ID: <20261111080620.244164-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080620.244164-1-julius@bairaktaris.de>
References: <20261111080620.244164-1-julius@bairaktaris.de>
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

ath12k_wifi7_dp_rx_h_verify_tkip_mic() computes the length of the
MIC-protected data of a reassembled TKIP frame as msdu->len - head_len -
tail_len in a size_t, without checking that the frame holds the header,
IV, MIC, ICV and FCS. Defragmentation trims the MIC and ICV from every
fragment but the last and the IV from every fragment but the first, so
fragments that carry fewer than 16 payload bytes between them leave a
frame shorter than head_len + tail_len. data_len then wraps, and
michael_mic() reads on from the skb data until it faults.

Drop such a frame, as mac80211 drops a frame shorter than the MIC in
ieee80211_rx_h_michael_mic_verify().

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8a..56f0673d2b6d4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1030,6 +1030,11 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	head_len = hdr_len + hal_rx_desc_sz + IEEE80211_TKIP_IV_LEN;
 	tail_len = IEEE80211_CCMP_MIC_LEN + IEEE80211_TKIP_ICV_LEN + FCS_LEN;
 
+	if (msdu->len < head_len + tail_len) {
+		dev_kfree_skb_any(msdu);
+		return -EINVAL;
+	}
+
 	if (!is_multicast_ether_addr(hdr->addr1))
 		key_idx = peer->ucast_keyidx;
 	else
-- 
2.53.0

