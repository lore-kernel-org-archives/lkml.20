Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197356;
	b=aGrFt4Jrx6EB2Y0Bzegi7Lq70N6c0NCNg1bQXPxMQCh+Vvhk+4Uln32P/bl542sYgtQG
	 vAFQTgwDeIgh8HrE3tY6Aerrw45zVziV0TDXKWEt+hGNHgRbQt+Bf5UcKZibsd+cXwsqR
	 XnJ4cw/TYLyapFLwtz3yEk6EtTfmosheeB+62q+Q/wZm1huwafKxii7Wlm8YRC7KEdSS2
	 JTvAnREnwNntbPI6xdtOot22bBYk4IuEFOByrAgzxQ7Ylur2mbLpf8YTZ/0SJjNg+/G6X
	 mbMsXMfgIolISNES0/g9m6y9ydBIO1HqOujlOIby2qdXRC+Wz8i1/jcGw+RIh2/y7YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R/mNeciGEDV4oliH8vu2vu4EuuS7Y9Kms2mXuzaoLDE=;
	b=tmNqE95UtMqVnnWQd6TvatUPGZUoOG5d0GJJYvQCekF+hCW5kp5rfcO4EY2pDoVFn4lg
	 2UXGzuKwvK7TZb1RPkkE4kucPI8ooYpo2/NNYq8Of0KPtM16IDDQmIWiOGIte39WFH7A+
	 WPkiW0uB8C6LSrJXgn4AcseKIdwDPv5dNT3dtec52TvpYimx3FcLtykt/EA5++i75g8vA
	 YLTnkLvH8g5mZnGV+xvn0JYSfN4uo4ktG4Xe7t/SzD0XnTjUxnwzR2EHgVaG2JOodwHzR
	 mR6H1w/6+EZAWnR9lP0R3fjvgP870UO2/FYMU6P/l+oOMe38RpjaueN9pTBaGAYtzWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+B9NVDk;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A3C606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A3C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+B9NVDk
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1154727a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197355; x=1793802155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/mNeciGEDV4oliH8vu2vu4EuuS7Y9Kms2mXuzaoLDE=;
        b=G+B9NVDk35WhIetAeOybgWF5FUaVx4PLG54HD67lQ+AB9SFBfBsLJ5qsiuhIJCKZiu
         E2zE29XFq3TMc4dc4HVw2SsISFGT30LsXCL9Hu+xtBhwOTXru0BJRqd26LmexPZQlRjo
         uEFruBiTze1LG7QV3EkRWIU24AwrEroLcjLJryAPk7GC2viNF2+DuyKqvV8N4xEiGId0
         f1tr0Vcfs5Se9zzStoE14FYUd78LkBnu+GfrnxqtGB1k0SjLtbWi6UCi54+cAJwFRsVz
         /HagYHytdWo2ObgfDZ0nsdduG0hRcGCk4ixMuATQrzPp76vab96/Et9Ishw25yN/L41F
         dDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197355; x=1793802155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/mNeciGEDV4oliH8vu2vu4EuuS7Y9Kms2mXuzaoLDE=;
        b=bf0CCdaZEDqEDRmQN+NkA7sDmZJY9+pUAYyvXUyS+gXsp5j/r8N/XxIiNmvGzMUv+Y
         31maahfWux776mHwfpT1hUlajMQIm8qCkeKolb99ItFyRlRrA7Eq8zcfHLqICQ+jvZG7
         taAl0gtz0OwGEcmWSe3qgnlcQyosL9s3Q+CzTRPAs/hqTuxXKdN7+fwk7ppc3qoYbV9E
         I6+z1cnvhHIKSPGV/3PCS/QKA6m1zTpejfNNAtGCpTT4D8wyqFJbRJPtLqBBohJNfqQF
         RQFDVYOKFOzqp54cgyEhCC/oJptF0nIPqd5eSyZSBARCMVwFQ/yLIU9fekMOp3n3HzNK
         MTyw==
X-Forwarded-Encrypted: i=1; AKwUvBzTC82BqrmjqzfSxXMj81PY8hVGXbAA+Z7+A1vYZMRkPEVyMxOAVoZdGRatxLie2DfpyN375vdZhGH5F74=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW6iz2mGzU25qrvETfvmWsOkmrhsxs+5dfou0IlZKh//5ad8Sc
	65kQeFGk2+FyN7kBbqnd3JfPwhBbr1AOsk84arGVkH7t5QSbDUYtg7Vh
X-Gm-Gg: AYBFou0LTjCs2PfRmD1LM9Hs1Ntt3BrRwI6pZuSHuodnzvkg6n3plDpivrw8weHCPq/
	RetUUluwvnsoq1stWzUrUVftL3S4U1Wpvj9r+1O6RNZTShUbLDEQxnppETR/7NBcC5/FTXAHRpg
	2IOUqRx49htLazn7jTRHPcUWstUA8GtuJWpSo4e6bGsAc29lgV7PA35vriTxjmSq4zHplMJsAYG
	L1F6m+s5oqchRsi0mRBOymlRrRQsI+wQfObZtanxMrfvSdDtmWT8s0bEQqnqcxxfscDscHsoqWm
	G37/ip9/47kP7h0l/Hhyg6uJqgCLXNqhEYy3ufipwIGYvsxZrHQ8pvI2kmwc+LYkjNQogsNgpme
	8aMZq1xUZPOGmSgs3H+UCQnP/ZJrrUFXqjkYYWqw+LKITlus1ARhqZPa8O/WAxLJWkT2IEO6Iqq
	i/vCkxgl3lEsoiN13+pMyhZMepwD80fYCqeam40S0SGVAF/9AWVJy78PJCqh8wt5BkyeiWJmf0V
	LPG58WtSgxP53C6YvGQSxjM/sY+r2jO8p5NoNfg7plqGRsHItKsdb6uPvl/9GKI8Gum5hHpk6hp
	9UxFp9aoxLj/bj0p2S/cq4fbGf68dgH17TpjXjbDxhWKT6vkE8xe6zwPyR8BjzYy3QZx
X-Received: by 2002:a17:90b:264c:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3ae580dd95fmr2042875a91.48.1793197355157;
        Wed, 28 Oct 2026 07:22:35 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6453ea6sm23723645ad.10.2026.10.28.07.22.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:22:34 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mac80211: reject invalid EHT guard intervals in airtime estimates
Date: Wed, 28 Oct 2026 22:22:12 +0800
Message-ID: <20261028142212.14523-1-enderaoelyther@gmail.com>
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
Content-Transfer-Encoding: 8bit

An invalid EHT guard interval can select the wrong airtime group and, at
320 MHz, read beyond airtime_mcs_groups.

Guard interval 3 advances EHT_GROUP_IDX() into the next bandwidth group
at narrower widths. With one spatial stream and 320 MHz, it evaluates to
264, one past the 264-entry table. RX rate parsing rejects the value, but
the common TX-status validator has no EHT check and last_rate_info can
carry it to the airtime helper.

Reject values above NL80211_RATE_INFO_EHT_GI_3_2 in the helper. This also
protects exported ieee80211_calc_rx_airtime() callers that do not pass
through the TX-status validator.

LLM assistance was used to find the bug and review.

Fixes: 3702a33216e6 ("wifi: mac80211: introduce EHT rate support in AQL airtime")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. A QEMU
KASAN guest calling ieee80211_calc_rx_airtime() with a synthetic EHT status
changed 8 global-out-of-bounds reports to 0; guard interval 3 returned zero
instead of a wrong neighbouring-bandwidth estimate. A real device TX-status
path was not run. A reproducer is available on request.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 net/mac80211/airtime.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index a4e1f33c0377..c31540ff42e0 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -550,6 +550,8 @@ static u32 ieee80211_get_rate_duration(struct ieee80211_hw *hw,
 		group = HE_GROUP_IDX(streams, status->he_gi, bw);
 		break;
 	case RX_ENC_EHT:
+		if (status->eht.gi > NL80211_RATE_INFO_EHT_GI_3_2)
+			return 0;
 		streams = status->nss;
 		idx = status->rate_idx;
 		group = EHT_GROUP_IDX(streams, status->eht.gi, bw);

base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.56.0

