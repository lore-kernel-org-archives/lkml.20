Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956979;
	b=fJrRNQunjt+1gf6JqnGH1IJ6zoi/jiZ7LwsyVY5ygGCpDRd6es/bUT4gCY/Hm7GcIWl3
	 5FfDEJVWZOj8PWzcrLsE6EVU5WRdGDDXAt5d5XxJW96whkTEVOBMU9zLgX/VWioOOF4Xe
	 0/+JIG4LgMh0wycr/wQU52u5v7X6DybdmHPw7zOrNTnIL7Vh30RZyUIfEkWL3ggJ/1/c2
	 h+1sqkKHR2Pr2Ei5kgQPmJyWlEK7XsaVuu/KuHHuJdzMED10h5H/Nle5ZJg043VUSx2Yg
	 HdmRBw4qeJ+XI5eyeE9oiS+FF+G20qMqsS+/BX4+ckg/RiOoNdgObkO/5ktyMWxjtpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wMOFZY244nygca19B3RPi4rKsuHnVMQUvsXeSfGlKIg=;
	b=VnCsr7CY3HwFoZcn4fK0B04f9uwQVeU6sTuEUo7zk+H6bil4ImMfe9pYjL1VnBL//3Ic
	 wf6gnZBCpZUDHKdzBkN81pMGDY2bx+sJaW/aHmk8AfVsSxI4E1LYdFFP6qXy/oQglTRt/
	 U0FrVulAfEDZDsCNH9rqKjG2vvgWWgHFJp0GVscWXVIYoKI3G4smja+KW1GXxoBdltSoK
	 AAX4U/P/Az5fsPoE+emyB2jS16Bz0ustMcGjbNI10qf3tswcg+db3xpUWbcbtmz12sl7y
	 oxKZ6PBLg4a6nmiiEIBBVB13f+xz/4jqUoPwR8DHwrENCj5dtXU/usqTVrmGr7HigsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JcJ4bt4z;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C60606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C60606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JcJ4bt4z
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so13399635e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792956977; x=1793561777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMOFZY244nygca19B3RPi4rKsuHnVMQUvsXeSfGlKIg=;
        b=JcJ4bt4z3SNx9hoMDlqg66KSCWiWA56jw1TajJQkqMjImupgz97mGq7QFARp5f3vMB
         /8B/06OnTql1tSyonLwHg2fg885SbdxqzcS0c1cMpll7R8kA3yPT8cwNCbrN9wLbfKXk
         FNbvXgQ9YBvwF38fDdD9dYQPP0IbmCsGdiUGMPu76MLbmoXiIcEfvwPD5u9I/oX3Q1pJ
         iP9Ver33D/8yh4dyvdwClLkCpM3uAU0/gIgAROomrQ71Ip8Kx3WmaAEsM62cIu0T9/rV
         JqIWl3BxuMKK2trMnDGS3Cywd+MdBdyuaa/6t8CYpNkWXlML1gTGDVRrM4TqM8H32/t2
         YhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792956977; x=1793561777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMOFZY244nygca19B3RPi4rKsuHnVMQUvsXeSfGlKIg=;
        b=vnfEtxSc633ShRJQ4MhCeYuod2iiLn1WyN1J33G56RLK8PZuxpcvOB/MvB6NXmkqBU
         cqsXYvTwrbrPEM9gP9BQwrzNdzB2Yf/Mi8bFkhkB/9y1ZJBEui//fbEQvAq81FgoNczQ
         Ds4PaNv7gbQcCrTnagEmCp5fn7u9kwV2BmrRfklVXJoJrxvCPrv1YPWIViF8dpCs04u4
         VwhlkYosDi2gxKBlyB9lD/YQGAIGEe4F+Cwfvy0MAtLyVsDD6egmS4Payd8T969tt5HR
         rBDjztpD+kkGn1qUlRMO8VYOsw3jRX6YRTaFzjl9qiPnfAzgvq3dnkcea7pz7M6oPSHu
         40HQ==
X-Forwarded-Encrypted: i=1; AKwUvByM8WZ2ZVtajVTILvAhc1e6BIvAJaFcPnaQASThDg6itSFkgvLgT/OpiEqAbo4SCnByvModTwXhReGwAk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJFob5fm5gNrceywlLMTgHkzfK1QNJag+WxoJyLl5vmqeWWE20
	RGvUjuzpuqeHZ2jl4584KRak8Ee9YTkSqlmdCqzj1zU3bZ+1x49HRDg7
X-Gm-Gg: AYBFou2/KfxjxDOBtlAkf345x9SWOp3cY4d/f3/J1zBGWEweOihD27W6QtzrpVu80vR
	tgxXXFkxkQOPfPX+0C51PActhsuPODE+Rfp+zWRLPDieocGrgWg7g6ScQlQi0/P72JEPutDTflx
	FirO8JrXessr9wXIHzKhrqN1RLkL7ZmjzrRkmN7DFxtqocs/0RXU1O4wgBhx67d2w+C2GdiLiNm
	WpSXadbt+yiUfAbGYjyBPu8kK2oho9cbiaUkNQvTDIZD6S7eV9PlJy+yQ5HZHnDKf/SvrYX/lxu
	fMkBaJD250KlC9TB01y0ALRCkm/VCJYUFeSLpThGcK8CmpMVilzP0QbQK5y5evbFMTXzQ/H6A1o
	s25q8kGDNdQ3KcKdDutKDX/d0LFMz25Sbvz25KYuoqIS5m9ikPdZmDOTUkiTNCByk8LMJmScs6H
	Tg1HwMq05iPeX1hxJ9HLO2mXTiruUgk+SZNKczQ4aoN4Luo43R97Qj8rXdaC9ZRXSAFD3DTZkzB
	Atd7K/vyXJzJhltDGN1c02+p2RUaCo2Qgi6YGW36PcbM9hOAkLQzga9bhRPLg==
X-Received: by 2002:a05:600d:82e5:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4a35aae3e29mr111501935e9.0.1792956977032;
        Sun, 25 Oct 2026 12:36:17 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa097sm156667425e9.3.2026.10.25.12.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:36:16 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH wireless] wifi: mac80211: abort chanswitch when leaving an IBSS
Date: Sun, 25 Oct 2026 20:36:15 +0100
Message-ID: <20261025193615.1123718-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

ieee80211_ibss_disconnect() leaves CSA active, as ieee80211_stop_mesh()
did until commit ac7472a24bd4 ("wifi: mac80211: abort chanswitch when
leaving a mesh"). An IBSS left during its countdown and joined again
refuses every new channel switch with -EBUSY.

Abort the channel switch the same way.

Fixes: cd7760e62c2a ("mac80211: add support for CSA in IBSS mode")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/796598480d47c5bf474d11828769e864b8209558@linux.dev/
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested with mac80211_hwsim and on an RTL8822CU.

 net/mac80211/ibss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index d74b66426349..b9ab4ceb0332 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -669,6 +669,10 @@ static void ieee80211_ibss_disconnect(struct ieee80211_sub_if_data *sdata)
 	ifibss->state = IEEE80211_IBSS_MLME_SEARCH;
 
 	netif_carrier_off(sdata->dev);
+
+	sdata->vif.bss_conf.csa_active = false;
+	ieee80211_vif_unblock_queues_csa(sdata);
+
 	if (!sta_info_flush(sdata, -1))
 		synchronize_net();
 

base-commit: 9d8ec0b5b5295bd23d979d1b2b905de25c36fff2
-- 
2.55.0

