Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BCF19F12D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814781; cv=none; b=Li5IsAzMD891r394Ub9810bji5a/4Et0lJC9Lzp1s2B3SNpRgiks4n9mFyOCFeT75c4dfGc3F35XcIUp6FkMOn1Nbrs4OXS0XaUNuV9an8/5zefXWOR0+50kNHRwCRGx0Z9vwkneD18KwPDM1nF+cSx7mAjJ98HtqAwA5XmcDu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814781; c=relaxed/simple;
	bh=Rp1WZBUeoF/Y/bHb4HFHa7Ec10D2a+zX3lGfOaKCM80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tu/nIh/iC+xdJMIlfhv/4Yqypjo3JUq1kTUMuKOXt9YxewiwkwbwaIn0/6LLC7TyDmV4PQ9a0sVAqQFfe6/EtioRXV/yXQwQvWoXrETM6In0UQ5PodA5mrfvF6L1A6b83lExz6Wg6qjrH1XjEeQGKVaDxRRC7+x6wWkZ52bMWdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srY0sF0M; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srY0sF0M"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so1114505ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790814772; x=1791419572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/x4U6h0R+Ycs7vP3rbjmSILj11/wYTR/tBgTHYxKW0=;
        b=srY0sF0MA75thiVLd0H09V6OOqrFKY8tHmLeXT4AaitzXEOMEcwwUQV4DhkS7zV0KV
         DMPCzNRrTZkXovTtStXP8rhTw8KWEf+bWxO8SijcootLoyTr1ILd4Vreq/+JoYakLpEV
         z45jfVukYYLd1e04xtdvSM8soQc8rGnNIhIGXbpGHR3/RcvU7UochqL/mlfZkoYdrNBL
         SID7dD4yLA85GWM+NXlu5rd3aZabIn87ty6BpMQy2Y7girDjcjnPQkaAEvbxmEvtpenT
         gds7UT8dr4DNAAvEzvprbvtvCDCggs4cEJll+SMzX0txSTR0vihZGli8BbMx2Iq7W5Jb
         GLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814772; x=1791419572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/x4U6h0R+Ycs7vP3rbjmSILj11/wYTR/tBgTHYxKW0=;
        b=ezjjikTWXUL+2TTdphl5w/0/0y0jsklLfjytV54uZzwdm3q3CTjXgwDirMS1MYM4LU
         uvFBHbzOOa4Kgd4lrdgbA5J1RB6C6Z3lUYUpwahkAqHD8j2E43oRoAv1881sdivSyyVr
         b6pW16WP+iv3IhsV7oAToVjCBq8orsfH+1jr8lx01ssppf7TEQYeDWchhatLrwkPLDz7
         uChbGxcdfh7LUiAzncXFJ9EIsHR+P4CVfPNrYoCQdc9LuxS5t8dv1hEiCYddtEEuRAS+
         YTJccg8ILdOetB7EOHyHpGe5VxXlXglb8VfRcWv3USs0Fe1AXEijr7fPLQsgxLQ4Gc0K
         toCA==
X-Forwarded-Encrypted: i=1; AKwUvBwDOnUIIz69glLrbtlDASQgVcnSMTUvH5iPUGdREpsN7UPZUEI49MjOAjpjI8KKWZFqIlxXF8oakHBBWK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXCRQClNOyU3Xp7K2m8fN9z5anrSwgEgG+Bn9FHu91twtBuxOT
	QkdRtV1+Cykznpn/OPBBhU09fJ0xGc3TzuKqoe9F2mIf35mfjRvkney9
X-Gm-Gg: AYBFou1LIVZ6VOIE7rRzyRWvz0fTS+W9iUroMaweFsJPVNPxSw8fUDawahcU7mjRNDO
	/KzNAB9gtopBvO05NmTQqOJqg/FpUW3PCKR0WppGN1GqAQRkW8/8OeTJsczzfkXTZ73t/Stx+Cc
	Kp5M1M6dAkm0Wmpmum46AOPA6A8GXPUq4DGsQbzbiIvvWGfK8geBWDsZhZkFykhP+zAhRVUkhG1
	7sw7p90+BUVSzJBb1BcHTOWALu+A41wVrGSscoM6cOSeMKC2tAZB/CZAH45Q82r1g6rffeyIijj
	uAuSce7/tX0+6K3OFpivhxZFoME/ekR7uTpVZi/OytH5mCHgQVufCVj91dpv4YKH6xGIA/w8k8U
	u0MJ2W2YpLuCBCmRCdhDApbyk00qULLPJU19gRJk5oQJkXAt9h1gbLhc3O2TQm3sme+uqE1yYcb
	C/35NctSDGFITafg/Vy2XUu84jqGEd7F0jerkNnskMTy6fFKbZU7q1I1zY/DXYxHI=
X-Received: by 2002:a17:903:2b0f:b0:2dd:a937:9bfb with SMTP id d9443c01a7336-2e3000ecbddmr6606795ad.10.1790814771975;
        Wed, 30 Sep 2026 17:32:51 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b58345sm3161615ad.66.2026.09.30.17.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:32:51 -0700 (PDT)
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
Subject: [PATCH v8 3/5] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Thu,  1 Oct 2026 00:32:16 +0000
Message-ID: <20261001003218.39421-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001003218.39421-1-qby140326@gmail.com>
References: <20261001003218.39421-1-qby140326@gmail.com>
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

