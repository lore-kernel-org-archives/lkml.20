Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131168;
	b=tOwbtJBIV+sdOYgjQ+8EsVUKg/eylXtEBau1LGChc+tmsB7+NJo7AzXmagt77kStPcOI
	 ghf3PSyhw+FW462y+yHnp84ynqH8s8ZqvhmhhLP334g6MavlzPZjScS5BK9vmCJhDxvOD
	 BHslQJVL3Hkiqa7P35kf+JS814NEGw1QvGk1IDDzKq9k4iEfNqc6shVkFlQ2Af5iyzi6b
	 ja81Ls9UbePLU6taY2tI0hclf3jzAMFRQGC2JqCYeXIDgu96As07UyRAw848at1QuL3+I
	 h7rken2V627sEbWyL8sHWTlTjgN/En+vo2cy8m/YdxK7RWfjElcYa1Rg/2RiisbdM9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ynuj/xgzrPH7t0ZbRGi449rxxjP3Hij7LmmtRUcxIcQ=;
	b=ZleDHlXY2Yb98UQ5tLeh+MjhnhRwDriTlptvf2Ca2gIXJwb+kxm9z+1S9Kem1ueWTk+G
	 szbdP7ZxH+qqDpM5tPERzIckt7FxZLB9R5sRJYd81IO5LWAWg9VqLxIOqBqIOnOArZJh1
	 e7K0/nQc8rC5YSr+3ZW8oAaYqPNPknnIQAw1WvQArna3G1jZoOC32CQv0VHy0vXjPz6EX
	 OISxyG0j1G6rw7jRZ855gNxXLHuhUcxKojb9YdbvNfTEZtZxFrnGJO9awAbBUsRvMzqhH
	 K7FcoJmFraRVcbqV1x3dZBAlJmjaEBUg3gTJTcdTg91i9u1hv5CJ3NJ+0Y8lsVt9sBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOGKrQlI;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095D5606D80B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 095D5606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOGKrQlI
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso56103a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131167; x=1794735967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ynuj/xgzrPH7t0ZbRGi449rxxjP3Hij7LmmtRUcxIcQ=;
        b=DOGKrQlIBTYA87kY5J1wQsBCfRInJmoUiX8QdoKBmZILX8dNfjwt30s67dySgBYgtQ
         g2as6iZS+ORyTOb/0FiMVLM7CTe1JI/TWgApFHGZlvEvls/GTEaabpZHOGJYfMyZH1Sy
         ufT61Aw7Tp8g08OeZ/C13SSKCiP4G+ht2lMJTuiOpSNKuZCcYNOjh/AXD1hEvAR0RpfI
         LwxaaimOFaP+6miHtGoEsi0emjWvud4I6Nbf52Tdeo+2ha/beaPS97UoPYl++Vyl9d5x
         P2tBp3B39z9zSBi9pd+YTIU6NLSxXcLg1VijSBLOnGWClJb3nc6q11rAjzZVRH9GzQpq
         wBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131167; x=1794735967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ynuj/xgzrPH7t0ZbRGi449rxxjP3Hij7LmmtRUcxIcQ=;
        b=qvgLMjfHEoIHVbeIw6PxTIpOWNRmRlpASilBAl4WdSW1sXd/kEL/ZvIsK4GA0+BaZk
         9Jau6ZoRIrlJdBQ158sMcikZf/F9oOULYqBq/PZsEcN5tM6u5LQfT4u4Yj2NVua0Ml3v
         JRRQr4QSVLCZaHVhywougI75TRjjzl18JIksVpbmIT7eKmdy7QscqvLE8dQljiuR1DSg
         Jg5nLldqx9s4ryGpM4jNi8NRDogZvw55wReANe9mimV12eBPqZIAHuNUfKX9oXjoBx/k
         s0EIiv3NU1XBgVqkvkZwWfskx9WVRlMRkvP67x/xoWwQJVwBkTJrD1GeAsRs/O+EVWyr
         GDiA==
X-Forwarded-Encrypted: i=1; AL+hErFmd10WKDIvMDUdo/5rwrEvQ1QTqWMMPCN6FhnedwaJkkiikDdQgg+wHOg0ZE9nPivJAG9ZdyH/ROTvsPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R0qN0WIPzhjUDqX8E+dl23t5Y+3CTm/242QOtTRthZ0z7CnVS
	KoYMQG+2VpCR+2FgkKEUtzOx2pZ272c/34MCAu12uYPwUhzHd+tiT7yA
X-Gm-Gg: AYBFou20vyYGBjcysiLj4tNMkMRSupVSY+S7qER3XeCq1veHtYGL+31lLNbURTN9I8e
	nuzeeq2t6114/Xzm4TUYV5lM8VNV/JyEfxl5ZXcyQooKFGs/kzyuxN588LjmIIQmMszzNQck1j4
	K6ZG+MZcrRLd6rcHEmiGT6F6wD9PZlDiaajmQbXYqP+sge6Lplk9bzJEZND9Z6Y9oCRBS7xNnSb
	mZg/L+0wvASyoaA0U/P8c533JaEC+48lrvN3ZlYKnsrWr+Htm7cR5+M6+xtoOst+EM7+uwYdR/P
	2gjLO7fSPaUbVjjMdQvMn+zgr0j+ppIuZQ3OV3si1H4kyxxXSqUdUoPh90EsmzdFUGK9iTdw4N/
	Xmi3X4m1/nQHL5q9zXlb5ytagF/DIc9MyTeUA0FtbAd0RY0wOfm0+1U86ohSRLO8dXbsdHGXP97
	suorUao98tjVVaVYDrbESky1EJSrC76oIymOeq+KC05rOsB7P6GVPI01hnFDoPAwt60nIkst4Dn
	szYkDO+jGjDDEI1GQCktr6/Zco0YRBXCCfYYW9Dji/ZetxCD/B9peHjim2ehLI0nK91Vh5GYX2D
	y/W9gdwriYKSp2oYjYKPwfpkxIZWPNFBMhmDlX4Z0XaJ/wEgI3g55Q==
X-Received: by 2002:a17:903:46c7:b0:2e9:95b9:4bcb with SMTP id d9443c01a7336-2ed83741285mr6916135ad.14.1794131167148;
        Sun, 08 Nov 2026 01:46:07 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed813af834sm3222715ad.0.2026.11.08.01.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:46:06 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] net: dsa: motorcomm: Report error when FDB fails to add
Date: Sun,  8 Nov 2026 17:45:09 +0800
Message-ID: <20261108094512.1285796-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108094512.1285796-1-mmyangfl@gmail.com>
References: <20261108094512.1285796-1-mmyangfl@gmail.com>
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

fdb_add() ignored any errors returned by the hardware. Return error for
that case.

In practice the 4096-entry table is hardly ever filled, and since
fdb_add() will automatically expel dynamic entries, something bad will
definitively happen before you fill it up with static entries. This,
however, is in preparation for the upcoming static entry counters.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..a7a9a7439304 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -725,7 +725,13 @@ yt921x_fdb_add(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 	if (res)
 		return res;
 
-	return yt921x_fdb_wait(priv, &val);
+	res = yt921x_fdb_wait(priv, &val);
+	if (res)
+		return res;
+	if (val & YT921X_FDB_RESULT_NOTFOUND)
+		return -ENOSPC;
+
+	return 0;
 }
 
 static int
-- 
2.53.0

