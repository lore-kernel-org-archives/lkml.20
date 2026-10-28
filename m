Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214384;
	b=W1GH/knV/MI6a8C53SZhnAXVkXQu0fVNN5hRaeBnFfMwPKhvBJQF461N0ZSC07uuYb0B
	 4Ki5PG9dlC62MvE3eZ8doVU/rD604zUd5F8pCzqbW+24rtbJHB+fmNw3xya9PUTODTt+l
	 nmO7IsBgdbYnDjF1/ob4p/vCrxjnConb2hnT9duz4Sd7iBVC4JeGJptRqNVi+l7/q2gK2
	 17aZPWjE6Rh5o09i/PEUuuurK5cwBaZ7/uM/Po9OBJMQByAif05L7HzwQEvHb00wMA2Al
	 cNftJQ6PVK4Cb3E3FCwG6uyOWcbb0MXfuU4XCq906Wv0gsmHGQHpkG+NgbSQySwmQxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a3Qi+G0JuRyVKt2+dHOX75qxyqvs1hiwMlJx9ufdRtc=;
	b=17hJgzx6CGAZLYHYw5QOYzKfo4VX/LhkNPwQ25kT4ob7uHUPFfNCSUQOItOKAT4CV0AO
	 5TDk/DMHOIqe7U5rKaRpR3j5+RLqClHqLiy6gCg5gbb0EOaDG5Jpj9bYFThGIFBv4IOfL
	 RvNCNlGHR8yx7rnkPMjEJkJmVb3X57Q1rF/46yKI4qiZTL2yna0BZ8BuR4IB2P/gpTT1S
	 i2HM2iJjqIAC6Ei8wTnqrOZXq8hc1u+5az18yTy9N/7pOu0KChCsV0I1rPFsaCVe3dQ6I
	 OmaPQeLBAnbUuTJUn/bezAZLjiAa2vP7dHxvR+SQkLxh0VU8q+bwFR47bA4bZ1m7Erw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ut+REY/1";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69900606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69900606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ut+REY/1
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-369f3e9e431so1089475eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793214383; x=1793819183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a3Qi+G0JuRyVKt2+dHOX75qxyqvs1hiwMlJx9ufdRtc=;
        b=ut+REY/1uXOs0SQYKtZmKOZAoDiX18DIJESIfqy0LczZMXzJGXfUTqRuemfdth0JKv
         9/XbuestJiqI0ALSqi3/y/TC8BYOMDwIek45Ms1m6j2feVgD4PO+mwfIMtQIPQ2MrwkP
         NEOWWkazP636CMbyYjdneCiPl/o+8cDn3WbLCe3B+IY6fZ0BUzQbdoXJtr8GxzlT+MCX
         jafB1ikae1qqQ1QiEfkgHYdi7EXgJcMNYbnopgA+MlISQkZlN2s5/9c6VSb4ZhpLJhbo
         4qTbzpLjo+uh0fAlWoSr/C8fr44IlRlf39ql3W/4tW7ZIPm+xUI7+lQLMKOpMIjU6CmO
         Qeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214383; x=1793819183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3Qi+G0JuRyVKt2+dHOX75qxyqvs1hiwMlJx9ufdRtc=;
        b=BhiEW31XhR4/2v6wS9Csu84E74F9L09xRxXHvy0eTb55d6SLZFHcvcW5JuOaK4kMqI
         /TQezlW5/0RLGSVRVdRtEBJMgwGtBPfEHMsq6hy+ZYTP1XQ03vJN2DA1GR0CgOIrfgaC
         vBq6OSiRXmUfyMDQxlDBvySRE87iibZUbOcQKMH1XxEmhNmwWAo9neZ591unAfoLWZzz
         WbjW1V2dbEYTgp3g7G3yTAFXQ0mIWZjRW00XD7VmofQ4SUhHo7KjH2SpptvOsW4WoHDI
         gOiUMVhfIfCo/+k5gL/rl0ssm4Qpzdpt6bRQMnB3CFXcK4ocTEG0dA3x3ZLCeqop7DGp
         tCeA==
X-Forwarded-Encrypted: i=1; AKwUvBwtaRHJUsBUW2b4Antg7YVDInj9P7HH5yMwPFaBwXRHpGE1D/uqR4+bvVR36Vnblewm1GfNiHOH/yyFwFY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlOpEkYnpLKEmvwd2tuJbhN6xs0L855wFwHeiXHuBhJvfDzoco
	3hgQWoGjGvM6KF1oNbLCusbnX6JkVALbgFDRMcFbq6ejllQk1IMpOXHZc1VAZWyp
X-Gm-Gg: AYBFou3YzVLtidvTgtr1S75Ch3EkJfhWdCO5wwE3RNYPkm/NAifYAB+8deUgqF6ukJr
	DTQnN02gWb/Yoi7RZUW4x8toyjB736uXVnKsTlE2saDF8zwohnhC2WJx1Y5Bvp01+RxMf17BHtn
	O4JUoUL58jVssUsPIUW6cXc1Po+GK/FToukxzJH8vMEBBx2DgD7af2YnOHRjlAUvflQ+gAyd2Cn
	4PhNSqMcRiRTtrz/nc1mm77wv29RDRKLM4gdA20iiE0hiZG4f9uNHfUxY4Jd4RP17I1H27f+p1K
	HcR9/isLqSOrbS/BDDPztgKzKfqWo+Ha9teUnWAg6g2jfe5Gs/+wba/v/MiaFF87b7I89dyE8QL
	vhiSXuhuELBF7RiEYt+sZkzfdy7syZxCwQBRRQ23meYcjJlz9LDzHOG+B/jtyjhyy1yZPW8Y7dA
	2WXheSzD3fQUy+MKiStaXlGrRd/zDvWut4NuOUOR2EWbCHPFWo7jgWuRloKNsGev20h+DFN0SBU
	JDJIy2fnyf1FrI5vehQk0gMsnJ3U2Hk9kBtSs/Kky/rmHirNoS9j49bvo/fezTr5FOgrwJRv3Hj
	BT0NlDdXKokSl/0EA/nVSpwbAAFx03HVKF4hqVO3rxjYrsz1pNg3uFhRKWpW4ANt+pP1R7MkYH4
	M
X-Received: by 2002:a05:7301:6908:b0:361:cd8f:7422 with SMTP id 5a478bee46e88-36a2fd7466dmr477849eec.9.1793214382948;
        Wed, 28 Oct 2026 12:06:22 -0700 (PDT)
Received: from samniyama.tailbcd61.ts.net ([76.20.4.3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm10576943eec.24.2026.10.28.12.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:06:22 -0700 (PDT)
From: Koral Ilgun <koralilgun@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	nbd@nbd.name,
	linux-kernel@vger.kernel.org,
	Koral Ilgun <koral.ilgun@adtran.com>
Subject: [PATCH wireless] wifi: mac80211: keep the radio index of a replaced chanctx
Date: Wed, 28 Oct 2026 12:06:13 -0700
Message-ID: <20261028190613.497063-1-koralilgun@gmail.com>
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

From: Koral Ilgun <koral.ilgun@adtran.com>

ieee80211_replace_chanctx() gives the replacing context radio index
-1. After the swap, the radio of the replaced context counts one
context less. If the wiphy has room for one more channel, the next
reservation on that radio creates a second context there, beyond
the channel limit of the radio.

On an mt7996 with three radios and no interface on one of them,
every second channel switch that a station follows then moves the
station alone to a new context. The driver retunes the radio while
the APs on the old context still count down their own switch.

The replacing context now takes the radio of the context that it
replaces, if the new channel is valid on that radio.

Fixes: 27d4c03441eb ("wifi: mac80211: add wiphy radio assignment and validation")
Signed-off-by: Koral Ilgun <koral.ilgun@adtran.com>
---
Tested with Linux 6.18 and the mac80211 of backports-7.2 on an MT7996
device with three radios, one of them without an interface. The station
followed 16 channel switches of its uplink, 50 s apart. Without this
change, every second switch added a second context on the 5 GHz radio,
and the station moved alone. With it, all 16 switches swapped the
context, and the station and its APs moved together.

 net/mac80211/chan.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
index 9cba79507767..b814619e6701 100644
--- a/net/mac80211/chan.c
+++ b/net/mac80211/chan.c
@@ -1457,6 +1457,7 @@ ieee80211_replace_chanctx(struct ieee80211_local *local,
 	struct ieee80211_chanctx *new_ctx, *ctx;
 	struct wiphy *wiphy = local->hw.wiphy;
 	const struct wiphy_radio *radio;
+	int radio_idx;
 
 	if (!curr_ctx ||
 	    curr_ctx->replace_state == IEEE80211_CHANCTX_WILL_BE_REPLACED ||
@@ -1506,7 +1507,20 @@ ieee80211_replace_chanctx(struct ieee80211_local *local,
 	    ieee80211_chanctx_num_reserved(local, curr_ctx) != 0)
 		return ERR_PTR(-EBUSY);
 
-	new_ctx = ieee80211_alloc_chanctx(local, chanreq, mode, -1);
+	/*
+	 * The new context takes the place of curr_ctx on its radio. Without
+	 * a radio index, ieee80211_num_chanctx() counts one context less on
+	 * that radio, and the next reservation can add a context beyond the
+	 * channel limit of the radio.
+	 */
+	radio_idx = curr_ctx->conf.radio_idx;
+	if (radio_idx >= 0) {
+		radio = &wiphy->radio[radio_idx];
+		if (!cfg80211_radio_chandef_valid(radio, &chanreq->oper))
+			radio_idx = -1;
+	}
+
+	new_ctx = ieee80211_alloc_chanctx(local, chanreq, mode, radio_idx);
 	if (!new_ctx)
 		return ERR_PTR(-ENOMEM);
 

base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.43.0

