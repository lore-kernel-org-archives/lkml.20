Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793476899;
	b=eqxwUZ9cd1trJuZNggSE3RWXgtbdz/md0YRMzQZvjCoPdli4s1J+uwCeN7xVQVxw9p85
	 kv6QSKoM1Z5kXDyf4eORCcMlgkNLLQecEom3s1k+qZwaTnJPSXDgGFXtfw0oNnKzjmolS
	 MxGrDoFFtPguc+GeA0vZZFrMJy0MoEmbwRHSaTiWgyny87CHRZIX6Bdv0/XUT9uOljnPd
	 yIjXaNVtAk3ZZR+L+ZK8AQTAW5TpcD1G0Peem9in+5bn9FDgAS79lB7U+ohWH8abzAj0p
	 Wx0Ych1agvs21fKdS3+SJcVXTti+R2IR8jD/dsazSRo90ApgCx2Nk4V4HoonFwr/6ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793476899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nF8QWNalgOhe92tcpQzuwmgH5FtwIG5LTyzb5xD3w5k=;
	b=nMzQCCBtxj1WAwKaQM1mhaQYlzTAZlK4zcKFZ+zcsWDJCw0QIAGCBd5jhUkdv7Z5ixvB
	 6KyErnlhsvSLpjcmXBPKqGSFJQTn+/AnIKJbvPNpo4ZKo+Ia83wJG39ELwxuJwQ9WGg0J
	 HMYz0XHKgk/Y4Vw6l2uEE3qWd0CyavZNbT9NKbvIqQG6J80c6Z7z8q0SyqTactX+Tlvs3
	 fNaW2DAnDEz7jQIU8BXZX9lJB54+TXm4KS4mk+SlqpeQATVePnCEEFyuEfUOwhxeHqMZH
	 818/9kJ8B6JFyp2V6wePAwuT8qxw2NUai/eb5wmudRHrvwHHlbK8EAD5o6QeXRF+HAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tZK213An;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831DC606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 831DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tZK213An
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so20032695e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793476898; x=1794081698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nF8QWNalgOhe92tcpQzuwmgH5FtwIG5LTyzb5xD3w5k=;
        b=tZK213An9akluqenagV8+crhbr0O7YSPvgefVvnAkHWVXYvYlsGuovWCQiCI1qzNNW
         czl5tS6fglK3/BaFc79f5Sokuxlzz+pN0H26Lbc0s704JJcpVHYstOIMekCw8djqW0DI
         gOsMQggN+hM4f5bWfRSpUvxKJIJYaMn6+3gbjNxgGy29449/eN0Yxdfi+7TuXdswwF4z
         RiQW8KsjRv+eovnMrOk+0RQp2tYc+dqrafT9sLUESzHpGZRtUwg4dFF1SUQzaprebDp4
         nUuDSUOz5v2A/yieaqZTOsmyAUTBP8NprA9Bj89XDscpL6egGy7AAgk5Mc21HlUJYXtO
         QVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793476898; x=1794081698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nF8QWNalgOhe92tcpQzuwmgH5FtwIG5LTyzb5xD3w5k=;
        b=bBp0hQ1HHNjdJqtXNfe+iJ1cK8QJivOQHeIFNbWQZRNO/8iXyfEjo7NlAQfGMziRzC
         +w8AijxnHUuiGS8zUm1YCSj0RKJmooBQ4tXDWz86kGahsupoT84GaIEckeJyiDxrKoFU
         bgUqg2vmSK9mNh/q/MSmJ82yBvCMZuHpZJnIuLERjP4tbdJEHXttLyoKilY/j2pOhaTw
         Oa0IcgqtRnprNxHhKkL5EJmEOUXpxYDwv5/SvpbnW35CzCpAENlDN8MAFl26Ko82/h3c
         DU9mgkNAIMMGKOxUInipAFJWKhPvpUHuLHnSQKFFqKrkgYyfGKsLf0DBzkU8/8bwAgwI
         VgzA==
X-Gm-Message-State: AFq9FYJCPMv+/SfmbwylxanNaNiCJSNWVuyfi7dgPOEVKiVsjH8/KTKo
	BJXLj5JyUn9WkDvETEBu5rzUEyNtCirTAofta0SDD0B2GhFneFrJ9Rb7
X-Gm-Gg: AYBFou0pIljb5GGquyBYiGRLlA0e+TA3SgO8VcGlIIkIacDSaTpdyz7TAFeQdgb9ZOI
	ZraZhPidGH7ObFoDXgH6W5ppADDTEBUpuGx/ZeYq7C8W9HdFMApBmDRdagYEfOWvzZIUQtbstHo
	H+pDdHoTzQGqvbd6WdBYvv6zWEth/eUhC1Polc7kCx9tnwZw77k/SPiCiVaAVDMlQkXMTd4wxcR
	sYVmbNGAWgXZ27shQCDQ2kSgvawuS5KPzaU6HMzeNd0P02Axz+qETuuoiGmG3IwHTfkUeY5WQi8
	ZbXnZO64xcyhEFVwyJjNiGh+mrQUek0br+M1XbCKMJdWqEZ5gSiR/5LBwyNYLj4nPmsasiW5+dD
	z7G7Afp7/R0EY3J+j9ACGNGBJlG3wCOQmrg/YkpLYTH1zfUFdZDsoNzz6yz05M2sG61gLK5xu9N
	7cCCbaXulZFLpZezwVqufeM52e/G9Oe9U73dF/Mfu+BX1HcNtsyQvOighgDyzC8sGSFZGW2FXWF
	5BhG/BKrpW/fLxmm5sXar0qrm8Dcb1PdO+UhkEgYvzc5UuSJl8HfiVFCfQ8ut+qzFTYB7vHFB2q
	rsTpv3p4CXORx7uW+ff5eWKEh/V5++q9veA9KQYNr6fExvc/Vf7/Fa8UwrCR8YmX4XGBleM+n+w
	ws9oAVehjeAnmFTY=
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4ac181e759dmr147569495e9.31.1793476897685;
        Sat, 31 Oct 2026 13:01:37 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c0b6sm9845387f8f.41.2026.10.31.13.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:01:36 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH wireless-next] wifi: mac80211: fix unlocked STA statistics fallback
Date: Sat, 31 Oct 2026 20:01:33 +0000
Message-ID: <20261031200133.473693-1-devnexen@gmail.com>
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

The unlocked station statistics path returns -EAGAIN whenever the driver
has no atomic statistics op, even if it has no statistics op at all.
For drivers without any statistics op, which is most of them, every
get/dump therefore falls back to the wiphy mutex and the unlocked path
never helps.

Only return -EAGAIN when the driver has a locked op but no atomic one.
The link variant also checked the wrong op before calling the atomic
link callback, ignored its return value, and lost its entry tracepoint.
Fix those too.

Fixes: ab5d6dd9c9b0 ("wifi: mac80211: implement unlocked STA statistics")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 net/mac80211/driver-ops.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/net/mac80211/driver-ops.c b/net/mac80211/driver-ops.c
index 1f3e0765a8ab..d19ae7fbcb6a 100644
--- a/net/mac80211/driver-ops.c
+++ b/net/mac80211/driver-ops.c
@@ -659,12 +659,14 @@ int drv_sta_statistics(struct ieee80211_local *local,
 						   &sdata->vif,
 						   sta, sinfo);
 	} else {
-		ret = -EAGAIN;
+		ret = 0;
 
 		if (local->ops->sta_statistics_atomic)
 			ret = local->ops->sta_statistics_atomic(&local->hw,
 								&sdata->vif,
 								sta, sinfo);
+		else if (local->ops->sta_statistics)
+			ret = -EAGAIN;
 	}
 
 	trace_drv_return_int(local, ret);
@@ -684,6 +686,8 @@ int drv_link_sta_statistics(struct ieee80211_local *local,
 	if (!check_sdata_in_driver(sdata))
 		return 0;
 
+	trace_drv_link_sta_statistics(local, sdata, link_sta);
+
 	if (locked) {
 		might_sleep();
 		lockdep_assert_wiphy(local->hw.wiphy);
@@ -696,16 +700,18 @@ int drv_link_sta_statistics(struct ieee80211_local *local,
 							link_sta,
 							link_sinfo);
 	} else {
-		ret = -EAGAIN;
+		ret = 0;
 
-		if (local->ops->sta_statistics_atomic)
+		if (local->ops->link_sta_statistics_atomic)
 			ret = local->ops->link_sta_statistics_atomic(&local->hw,
 								     &sdata->vif,
 								     link_sta,
 								     link_sinfo);
+		else if (local->ops->link_sta_statistics)
+			ret = -EAGAIN;
 	}
 
 	trace_drv_return_int(local, ret);
 
-	return 0;
+	return ret;
 }
-- 
2.55.0

