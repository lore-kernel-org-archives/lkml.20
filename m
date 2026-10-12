Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C6837D131
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812314; cv=none; b=HVkK8qwW8JvOiWOEbOvP7aOtiuxORP0GGoTPJvtUsy6iij7ES1tKqcHTh5kvm8R2Fi9zJ4JbMf/8iz7aOMc0mTskET2Kan8mu+deZoRZ1NJmtK8rSk9sL1yjSfFEatXqgu/Nr6La6kTpR0Qy8I+ZyiKRTCIO3qwzHTypscoMCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812314; c=relaxed/simple;
	bh=UMUdaa+RTFUQlwy3L1sCKtcHUGO/pFl9CpT6NAu3gTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZitbKuIIAouZchrxhEO0ktADXmP1ppAOcKAncTWyonOE8ZmEss7d6Xidj1qYiqeyEViYIVOI1V1UVLVT7nTaIK83TVUBnPkPoOWLFb2ePUu3byP2lbZbvrLSrV4p9jGtKrau35TbtEPV6u6Fue9F9NGK95cwyaDoz5GrPqMbs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brF+DncF; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brF+DncF"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so1050569a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812312; x=1792417112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUv+kYCkn2tEB0Tn+6YkUtBsv1Njui8yJ55CrlwNiNM=;
        b=brF+DncFNHmIL1cNrcK/rUmpj/grBlL1LJulqrjm7D/tTPI374r1eLKTUZu2zlDcoy
         5S44qpj9nvRaDhZsLVJMMy6PQQ+3oK3kmORWE28ssz37a7dsFNp081w0imdTJ6AiEXpe
         FP1aFf4rAfxfVxwJshqEHZunbwnsq97OR8xFEecGTB3USh/+5b8ZApSbWDR5h5hyBYTx
         h3sPcJHbHjNd6cZMfaTVTJFonL7rEFQjCfnc2r84fM1g20djRrj6K41usswHIBwoomcT
         Aq9x2WGxJ7VVTf2knHEiz2RhpFl6eA0Z17QPAgKNLtoSMvPC/Hlp4FjGaFVSYK3B3W4Y
         igbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812312; x=1792417112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUv+kYCkn2tEB0Tn+6YkUtBsv1Njui8yJ55CrlwNiNM=;
        b=gZZ6nnjfWxWKUyq5qIESEyfSasbZnbfMzpzBa/6lavis6WkQlc/08yeuqWqlnkrZg4
         ucpkP2k3X5Uojwo//9+ShH5FijJxeYBRJ9ed0Mzx3litP0jNr6w/r/aAa+sXsfLASm59
         THGJkxN1sIqJDSkciAxgKZwFYiQM7akpcfKiQLKhbRqO2ZHuVb6dg4leY5IRHKroi+6L
         EhrzZtITOGHAgw3t1lSkrg/DEYq5k5t8xV3AN770Trm+9RSJYwa0mTJhkiqMz8eN6S8z
         yX7y6CyAidCYoHIkF90pxUmgBX+7NxLnC9eILR8Pi3ZEc3N33AFa++POCdvIuQzyYPV7
         431A==
X-Forwarded-Encrypted: i=1; AKwUvBwnEmnhvAhmn2Cw1qxtQ6Xo1bgknyyLh+buLB5kdh0xXEuJGep43u/mZke7GweCSopoDuY9Bx+my5unaQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYICRGMUGFMabz88HYvehO/Oadt9wc8k12nEh/kEX1V95qu5M7VY
	8ElPjiOb+vefAkZIqTkAmblaScU7dBGlakPTab+bI9PsHoOFuYgQ8/hH
X-Gm-Gg: AYBFou0W4sm29FUOrjLpwsMkJI8QIW+AC+LM7xUNxgMOrWMABxXdKjtQN4Tm0IlNK2L
	1dbzT5MJ6RL2NC4sYSy10D1GhTh+IEdVti3fXvQ3JehjnPhrBMUzNnSw+iRYlmFj1m+is7G9kr0
	078YcN5/SrZQmqryxGziWBKT5brXSvdbJliAQdles0a9SsVF3oRONBp8JrEvS074/XCLSR/CnJd
	UoJ4bT5kGL7ZOfs04ha0l5imPlUjP0dgxNbh7GVfVeldKnjQIg32AA6el7ij3D4eCtEfnhyhE2l
	hV8udrUMiWybQK5JhDcWZXvXeddRYMh5VZ+RFawsOaRZbEPzANqatfuQkUcNuoqPc5xxPtw4hn+
	wuATyC3S6XyQqwBvwa78cm6XDf7czUA2QVS3hRxUmVYjSe/ciG1BpqY0Vhk4zd5GajkrshR6w+V
	quWdF7yKHsGhnJ6fCMit1teBm5jSVSvBkH1clAJit10fstkH13BEqVd9mROWpMyUMLmpdk10Q=
X-Received: by 2002:a17:90a:d2c7:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3ab3a32d9b3mr7681545a91.6.1791812311914;
        Mon, 12 Oct 2026 06:38:31 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab50ce9d98sm14534878a91.9.2026.10.12.06.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:38:31 -0700 (PDT)
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
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v12 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Mon, 12 Oct 2026 21:36:45 +0800
Message-ID: <20261012133648.132363-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012133648.132363-1-qby140326@gmail.com>
References: <20261012133648.132363-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101
- 0x00012101

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index e240ab733ff1..38843d389827 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -111,7 +111,7 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_CPU_FAN_SPEED		= 26,
 	WMI_EVENT_CONFIG		= 27,
 	WMI_EVENT_GPU_FAN_SPEED		= 32,
-	WMI_EVENT_WIN_KEY_LOCK		= 33,
+	WMI_EVENT_MIC_MUTE		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
 	WMI_EVENT_OPEN_APP		= 35,
 };
@@ -637,6 +637,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 0, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(WMI_EVENT_MIC_MUTE, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(WMI_EVENT_MIC_MUTE, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.55.0

