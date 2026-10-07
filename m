Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8B7430305
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362269; cv=none; b=Ve7+lPUF//osOzfwBqmb9DaM4GXDhg1GXopjvUFAl6Q/zEeEd2K7AEM43iYzVECKMRYUW7JoLozpUbY5zpQgmL79rvs716MpvyfgcmhCEqYKytlzM+anGulRwM2eoRflkkE3aNnfjGsHxuIIgSSdIGnXhq3ene48lS/qDewjS8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362269; c=relaxed/simple;
	bh=T7NwYuMLXlaLWNVt0s7LrRxSvrLhYEZRMYxHpznZBm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I9zKppNSiqJ175ggdsZslmFzo6VV5it5nAZtyX+D5zeeSQc3Zm4tytxtamjZrXgXMQ9uM5S9jPsfYQaAWslJRqYmCGYw5/fI3MOoIgHJyxCI7sRfjorIDjbvfOBPpxOVtVsqZYXojc6kU3OgDZZ7PWjv1YeIGGN0ePU0PkSGrok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtkyCrQV; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtkyCrQV"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-34c89609923so1180892eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791362266; x=1791967066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkuOm9iXmeW0EP5oRudZdRaRXze4xzSnZq3aYWaRFyA=;
        b=mtkyCrQVimge6u0kCtuG/rHNOD5tNDT6pCWAeB+vxfyTDM6xr9cdyXkJfGIN44Em0O
         CN9jRWyI/9QUJFY0ImTTeceFI4yYtP4sajmNvwAenAHfOGNnffpYVrUZIvu6sku6bKBQ
         aS85Pn3irRCUZETZatJtuFtwXNI9n2Eiro2DGWXeQgcS7btKGLfongNSRE78WKNOTqHc
         q6kaRZ7sy5KNlAwZ/UYBFI1fwgNL1LCw0NEW4XS5+zo+DW0ZkMNRXNn0S8WdUmweY2kd
         pAN9hEd4TbOiG1ubeObCRleb/thAW37N2XZ3Xtq6PFFtH/3LHI49RX6ku4MKIt4NND43
         ikeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362266; x=1791967066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkuOm9iXmeW0EP5oRudZdRaRXze4xzSnZq3aYWaRFyA=;
        b=LUKs3iZw2uzae1QlC73T5Fm79mCcvU7TeeuFh76xa32Ya78ukEQXy48OuaAIBEj5ta
         m04iyx6FIu5USUrj8RnlvNdTLYq9FGqj3Hiug5wUPI+/w6MY5302AXyKKCznYrZPulZ5
         MZU4MHw2asjGhQu0XZzPziwi+/d7LbWaMUNVLrKoW00UYoRBLV6bO5D1NuV7HVZ95Kjf
         aMAt0KtL9AOjhkAStjCg9Gv0EseQZz7zyhPwcnIyG5TmHVonra/cia7HNiAohtjCnRzG
         cQDgL4OGgnHlwqk/ATVbm1ajlQc13Bhq916f/FmgInF1iHinKZnipbwN8RP8mRyp/r7I
         5Uiw==
X-Forwarded-Encrypted: i=1; AKwUvBxkzNXdP7aHGAxZsp+XFk0iyAVnf6ZpVFvIUfvC1jUPYLTltjf1nK3LsryhjqTTiYW5aG5m92OX2GXm+vg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTvtk2KUqpqklAIsT87evUpwy4DePlSpno4OlB2osH8kxHCLkV
	77/Qy6Dsy2Vn07iVDgIWdoWuZE1rU9oUJFY8V04Fv6POk6Fb7Qr0+7J87X3G2eY6
X-Gm-Gg: AYBFou0vbp+9waM1dU2TnJRjRDd/ZBPWcbesmtQYseXSa/AwIQoOb4msPWhOOHTapU8
	JLL3l1v3aS251Ly+seP55IlyyNzCzA7UdSPP+JjjdnOD4z0k4C8QwBaLSu++qFm1gST5F65Gu8c
	RYwrWYkJhtalJjfLddjS1m/OQ+FL+ZiJbapK2PqSWhj6fMimZ8Q4XUAuk8xJDtQgazkZtR2DEyj
	7k0vmgHB+Tt1icQga/Ts1UIcVDxrirAKd1fbJh0eHWSutDc9TFhBbdrX0w66lWNrRjHpzCGP+k2
	qG7rtiqojYYAdPHW1Q3u9KpD9CdJePW3D+5P7v3ZxBAm+0VF6+qGt+bCQHiIgPJBxipkHx0WV2R
	FdQ8AStXrslIm43N6CWTm6aCE6/oGJn5DPWiF44JnFloIRENTyDN7zlLLcT8cz7YzRvDQo5CE71
	mHTnyUZVjDFA8njSq6y/4xM7eVYu3FddnUEk3JH3E3fyL+lXzQJL91fUQXi8Piv/OBgQMw5ibdz
	g7456WH
X-Received: by 2002:a05:7300:f542:b0:34e:f5c3:96a with SMTP id 5a478bee46e88-3515deca0d3mr1526588eec.39.1791362265645;
        Wed, 07 Oct 2026 01:37:45 -0700 (PDT)
Received: from Hruday.lan ([2409:40f2:1168:fe18:f738:9eca:7e0f:4b32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af7ab9fsm5766569eec.18.2026.10.07.01.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:37:45 -0700 (PDT)
From: Rahul Rao <shreeramrahul94@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rahul Rao <shreeramrahul94@gmail.com>
Subject: [PATCH] staging: rtl8723bs: align arguments with open parenthesis
Date: Wed,  7 Oct 2026 14:07:17 +0530
Message-ID: <20261007083717.14031-1-shreeramrahul94@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a coding style check reported by checkpatch.pl by aligning the
continuation argument with the open parenthesis in rtw_get_ie().

Signed-off-by: Rahul Rao <shreeramrahul94@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1b95ef6996c6..8f0257ceb700 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -749,7 +749,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	phtpriv->ht_option = false;
 	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY, &tmp_len,
-			pnetwork->network.ie_length - 12);
+			  pnetwork->network.ie_length - 12);
 
 	if (pregistrypriv->ht_enable && ptmp && tmp_len > 0) {
 		/* Added by Albert 2010/06/23 */
-- 
2.43.0

