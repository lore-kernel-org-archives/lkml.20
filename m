Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384388;
	b=ptf36z92y5I/zo1XrQRgRBzjutvpduxnP8aXYO5Z7lV5mgLx9eINoga/UhPRk2RJgUW3
	 6wfnanVBEi22x2k1unOlCp+xBj+qZ4sDE9RschFRjJHlD9CN3NJSLfFtiPiBCJHULs7OH
	 uqX2EabTgoIpIOzIAz8Dc+y8NBIhntWDf+5Oi0pQnNp9sdSGHBTh8Fu0HmVXBhBoC/lsm
	 V3WuEKeBdAXMzUCW39qOZob2in7fjIvinZO4DLGjommwkQpZYkopCWDZJwOv2NK/7ewrr
	 OTitp13wCVn6olJHdgVuCkAVXe2FWKYUI+I1APVESdPMvzDT/5PMWgRHnIF5EWPJR5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gHr1Tu21bGs9T8Fp/x2oMufBq8Kyqkzni5U8VPWCwnI=;
	b=wavSftVj1+x+AukasOxMuzt4fdFDn8HU5fsCP3SFm+5PG59ssj9bOEmpSGskIXutyUPn
	 TOrJJHc7818fjyILup3Rze/QXoXQsVsC3uK15QLnzou9wzvK9NH7pYLfp+KL3UPoByrzk
	 xjw1C9X57B6xFnewkcLZ0N1dAfRvmnrMOOkflI2NAgvXRg2RZEPQbf5fqNJJCTE1WYZCE
	 VNcnMk6p06oyLOFctShYNe8LXL8T6g5RGha3tIponYuW7in6nrW3a5uGs/p5plib8Sia2
	 tqo+2RzfZghZYwcB091BSMqtJlJ/yScI/jFyFm6bYReRU57E7DMbU4DmnfRgv3WLyyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=V4SILspf;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C068F60A261D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C068F60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=V4SILspf
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4322d310e7so444195866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384386; x=1794989186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHr1Tu21bGs9T8Fp/x2oMufBq8Kyqkzni5U8VPWCwnI=;
        b=V4SILspfdf6H/2PHMFsUdohlza4tuw8dzxxXed0CK9iVj/t9JN+k97b7bdMXHKxmfd
         YkxMBzxYq8b92tRN7kHd/f395OF0ElsBouzy8Ut63RE2POsiohfj0a+WkqJqs+o9/9RE
         ynsxTiOGqRPl74wJQyVTHfFDIxPwSwnw34hycLBHc7QEeiYwgHY3sm1j4GsaizrdelCB
         vComm+PMRyu0a+ybTePZf5amBz4yDCwrI7cwdFemygnes3fNcmAQmivVH1AozowARawc
         Pm0kP1kGsYqjSp9i4uJHaKkRk3g9S0JsgzkhVc3RBFPKSDirBSyUru1DLvocJeFS2WcJ
         nJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384386; x=1794989186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gHr1Tu21bGs9T8Fp/x2oMufBq8Kyqkzni5U8VPWCwnI=;
        b=QDV1SYZf/R/fucQH2EzGJgjC+7fI1uH0NbwoNmVAkg3aykyIdlMpKW2RX7nVYfXsm0
         K1XiOEPTowplT8YNIHaWpHHgZRNLkeckvlgeCsM9KW8GeXM2nxEcA9pAx0Bi4iXkQTbM
         O+gtnNS6a0zsjkpyaK6ppEy1k6WV02/dDYFIqfsmzLmFwIjX47VjtmaHpflNjompZGCt
         oiEgq9kPOW0jHpqYpQM1snKQOGBpVPufQUnJQELbwmnXAim+Kk58eOJnQHNmsRKJgwXC
         pbVpC6ITqNtWOYcPZd02iHJMtn8svmUgHuUQLPk/9g/lLgYIWAQWpK5yyWFpGm0s/zQb
         50xw==
X-Forwarded-Encrypted: i=1; AL+hErHpzicSytLG+VITxk3CFHsIzlL8NCN3U4zrhwpyNqGYtG4aTdbcWcTLS0iI6LnlVOFoIp/dzLiNrbYkp9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LeG9dvS57rVDxo9YotKr/PpnFHP6BF/O6TR+xZC3m0O7yBF+9
	cyLqFC26GMTjKn2RuBc6zXwrp+6mGxonfkS0mZiHuYFMqSIN2Eg93ARfvjajpyNYdA==
X-Gm-Gg: AYBFou26SAYvH46vMKasuUrhmA4rvzYQsPzajkLOaeNchjz4QmHqYCPhbYVuKaD0uEA
	ItB4yq/YTfb7yh3aq+yuNQ4WM0wLzTG4+XU8XhiXtBECmyUWCZBVhF/fed1S/HKHxZHBZnILOtO
	0T+5o6u39J92BjQF+gw5jzmk1g/v36haQsDN3qB5vjwqUFimnY7XfXxUPD55YzoD0SfX0pLetf8
	9p59N7LiZJzNLoDQZbzXyID38yKO1ZqV07cVz/WfvDlJlw7gX6V28TKl0GT3rpPBvOj0ilF/FGC
	4RNcl9NA3zaZ7zaoi/xA3FQATaegmgenbgm3lo7rczX5BwEZa/z0GCQpVOmY/6FCZHFPPReZlxD
	mRxwFsYYC8LDkxukafgUfzESP5wI70fDcMvbLY4nSa7Gu8evNsUrTW+VZ/eE9Ulj0l/WFlIgxMC
	O6+k4qEUyVGDiw4yYv/LDYd6zm1T4lAp/R35VxyJDNkInAOZ3Jbam2HVAPyry7qvHLTDmY0yEWO
	dJchv+19vbvTKj8b6E1T/wJnoDFts0EGUmN2UaLiDgp1/Ict054htD+SWr9VY/fs41O23n00r0G
	DKJ1KUuIV0+CrVpNGrowhsR6hCg0sB5N7HxMkszyerO1tStwlO1CCSuwa8gEleBlsHUKOxJ8dti
	kkdiSeFTKCUkTIPN6ns7N+k9RE15p1ZS+gpXl4L1vpRbRAaD4NxbvhLWIxzzhN9Yj+GoPgZ6TTY
	mDudN+AsXtz+bCap0Oz8fp81lJRuCqUfq73tZVezb/han2maKPzLIWluuklCc01xxaHz6/UKdzE
	h9F0EFnXqDDTmKM5GOPJCEn+WYMbIqEtAoKwYGeX8+aALIZ4ABBo3oZVyjqymzJfokGKGO/M/N2
	9m/NLuPEDp+PJrBBjkY=
X-Received: by 2002:a17:907:3e0f:b0:c50:5275:fb97 with SMTP id a640c23a62f3a-c5066d70b41mr112406166b.47.1794384386217;
        Wed, 11 Nov 2026 00:06:26 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm2219265a12.3.2026.11.11.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:25 -0800 (PST)
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
Subject: [PATCH ath-next 2/2] wifi: ath11k: drop TKIP frames too short for the Michael MIC
Date: Wed, 11 Nov 2026 09:06:20 +0100
Message-ID: <20261111080620.244164-3-julius@bairaktaris.de>
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

ath11k_dp_rx_h_verify_tkip_mic() computes the length of the
MIC-protected data of a reassembled TKIP frame as msdu->len - head_len -
tail_len in a size_t, without checking that the frame holds the header,
IV, MIC, ICV and FCS. Defragmentation trims the MIC and ICV from every
fragment but the last and the IV from every fragment but the first, so
fragments that carry fewer than 16 payload bytes between them leave a
frame shorter than head_len + tail_len. data_len then wraps, and
michael_mic() reads on from the skb data until it faults.

Drop such a frame, as mac80211 drops a frame shorter than the MIC in
ieee80211_rx_h_michael_mic_verify().

Fixes: 243874c64c81 ("ath11k: handle RX fragments")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..f77a45b7bf84a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3270,6 +3270,11 @@ static int ath11k_dp_rx_h_verify_tkip_mic(struct ath11k *ar, struct ath11k_peer
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

