Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB25270EC3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814197; cv=none; b=Dk5GN5yox0NgQa2+AhjQf7TLRNiEfrdoybiNNpl8/iv1LsaUJv/JdSmGYMkENdjC2sdSI8GDJq1D3xM+cKVBgg7HUcvyYqGgbRZ597/wzOY96xhnSpBSvJSy+Xwz2iZgutXTumWstGTTlKriaq+4OrT7aOJA5b4bA0pOb7kWkN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814197; c=relaxed/simple;
	bh=Rp1WZBUeoF/Y/bHb4HFHa7Ec10D2a+zX3lGfOaKCM80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbqNFRhOF9rZHFI96E+lAhYDSJCmeoJMkQLLwdShikbOVfotwWsDZDy3eqgjKsmHJVnGqsQqvW7Jnzz0HISzO1GpuMj9upTvGKwzj4CVOSnzrmn88jVRSGgqlvW8qnYOOoKhsM4o0n1GpUkJzN6UHQJM5e6vF6P+wZxJhQgp/Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQ+jaMi+; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQ+jaMi+"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88582e2153eso1896524b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790814196; x=1791418996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/x4U6h0R+Ycs7vP3rbjmSILj11/wYTR/tBgTHYxKW0=;
        b=sQ+jaMi+QZ+ZBXcMwrGkusg8JpksdThG7C/WNWov8DDRO20TpjQ7ejBwkA5PG76HQI
         LfDl0nzhpRbBEIuuQ+SC4mPj2DSe8S9uNu3AqoYikwWUuizRpKBbA+3tKpw4CfmNmOX8
         yj+b4hjz0lQAZQVRJ9A7EGVbygeDQw3yMXa7rqSSBtV1kjfYspf0VoQo9rm5zydpWoQp
         UcnIwoiUHWFKRLp3t/Tk5ILDpwOWLhbHVvXrDi2N3xXEkf7rh2a8RuFCQuYkH6aMObc2
         QsH2jkzy+Ux6h0IIBwB2n2hkP2OxQqnTt4DGi7QboEEPddpdiZyzRiYBV1iyEP20fKDV
         gksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814196; x=1791418996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/x4U6h0R+Ycs7vP3rbjmSILj11/wYTR/tBgTHYxKW0=;
        b=xSSMm1MJDPzqQ3tzl8kzm+KUlT0V1sQ3hs1IQopOF2PFkeHid2OTklA9q8owhPnXlI
         xHTzmme/NgLKJZACAsXnNeFybyzrmwEBT3fAsQgsnejNk7HRxOYifRvL1rCXm7kX1jam
         NGWVTwkXxRz89RVYyoeVidPEydWzgvmxus4p7YiD2GCAWDe7RcOInNNcRrhCqUNEzZ+G
         SxkAAuIVYIJgazmoquqjE2OLUDI3jg4m3zD6Mg3qpgchdD4pI/Lcld7e2E/zeeQHRfHw
         lNxI5zj2Zfnufb1y7DqMS6uSq0wsbOAePvQ3NjlS+eyBW/U1Fk4ZWtYA3D9jph7jJked
         kQEQ==
X-Forwarded-Encrypted: i=1; AKwUvBz41KZj5tXyRNWIHzssd3Cja0hkIiHVH2Z1WvPSwzoC6FETix5H3wKP41J4Hoe7w28Q9u6oOLYsogQZu8c=@vger.kernel.org
X-Gm-Message-State: AFuF++kd0ZGsj0OyGVmvgd9If8UBaS/G6tIDJZmlu4PJIfngpF+TJXgr
	kbIHKC7HdQXSq5dJ1mZY66zDR44swIBrn6p4sqJexJ91ptwQUWD2BcDe
X-Gm-Gg: AYBFou2kSE0Ej44M/gGeB4IL9F+FVr+3WxMJ8XJBTxFdhp+bY4Su6d76yhtFWxTsiVU
	wPl9u0jdlkq3S4QrswW/OTbvsKWWHUi+h/azK0I5dOA2WGV2ZXV6rYzPsRXObT/q86BfE4KJCa5
	HmPWslU6owPYC00tP79bfWkab7hoQJXp85BVY7+xQgaPE4joQ7FchlDSEaESAldrOm0sgGv0/wH
	pYNwWKjGShl6NDa5GqB6S81dF+JCHkdRsbnCmVAFIoMzIyUYPvdVTIyo1uupQSqYocOh6OR8jlA
	IptZ9E0iYncmtciu0hGgcCd7CHhgmMt8QYlSnnrWzmA0xY+1Qx+MIyLTxonfwPYh6FP5epbjjxZ
	8n2YKQ7vg4OyslZERBUNKnvbTuX8A2pEEEnQ1DmEhNqcfvjhJ8j/qBAFFmPDW9HC/zcDZ0cwIsk
	ZWG0SswYUk/syJt86KVXPsgNd6R5X9KUTEV0dwuru5/i79LhHpB8hO
X-Received: by 2002:a05:6a00:408f:b0:878:34d7:6a30 with SMTP id d2e1a72fcca58-8874b5468bcmr2315929b3a.36.1790814195618;
        Wed, 30 Sep 2026 17:23:15 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818deef3esm247601b3a.29.2026.09.30.17.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:23:15 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v7 3/5] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Thu,  1 Oct 2026 00:22:37 +0000
Message-ID: <20261001002239.31461-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001002239.31461-1-qby140326@gmail.com>
References: <20261001002239.31461-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101 (Fn-lock disabled state)
- 0x00012101 (Fn-lock enabled state)

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 85683eb116c9..e28df14d4b8a 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -636,6 +636,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.55.0

