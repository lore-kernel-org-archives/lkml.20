Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FA425A321
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241026; cv=none; b=EfdI5yWBlrL8U6ZAxbK3c6YRGb7EHTkm4rbiY5Ox6oSovlwg3wqUkJuHnn8ltR257VUQG3+JE60Hw8J2ao3L8+6+a/0R1GQpHCqaq7V2oBRgWYiO5OhAbJ6ptE9w1x56QHzJku6Eh9Y+EJNnosCGG4y4tyM0dbCqVEhJkbZNBlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241026; c=relaxed/simple;
	bh=k59oaERz04BqM7S0rthAXQ/2ts1J9ySRWi3F8Prk1SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JDnG2AuMGtnzTTXFbZA1A/qtHolqhZr/+oIhcC7JQ6/ZdOqLIlojM7rgwqrUHoEHKy0CeKLgtZFeUy2SQ7UOXPX0bYD21DyiV7NGFbLVWVbjxzmGz8lKg1tOwz4zot2IB70of+EzFfpzLbdY3QudnINFkZJmir/j5kV3MFaZ99w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso2585046a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788241024; x=1788845824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1L7D2BGcJa8YCR09jb/VFXv3QPDgwb09GcaN70Yl+M=;
        b=r6w81f3AIjDJXZAXddcg01YTfQZyHJm8ws4HtaMQTkOpvlc0yhppLyl5loYiOqYBVt
         f5pA71OtztWn0rve4mlkhs6F3OcGZBwxppMuRdwk/tidpfaBGtq6C6+dcvmDRMx14VHJ
         SYhqa33+2QNOmw5NrF5OVFhLcBxLGN+VckE4Hq6Bq4OgG+QJDoZD56tXZtCfKg8XiLJ2
         K4FMAa6y0dddSLhBM3Cdbv0uKa5blhfK940C0ZaDqRNzALL4m/IMQ8Z97o6Uol0WlmDy
         jIAbnCR613/1pTM+kFbJQFa9ZThMCFYcE7yZOv0dd5XnuIuomu4+wA+jBrSGtDvk6dAC
         w+lw==
X-Forwarded-Encrypted: i=1; AKwUvBwzGL1O3Yk1oyIHOmHTMeBOMP1pgJvIZQ9y6AQTJmmXUnjsSalbPdCUD/pP/nRDRD//LWlGzmnexdkxaQw=@vger.kernel.org
X-Gm-Message-State: AFuF++lYeeyhjRNv0SlZIEUQAYC/iKCoQdPf5YSO+HMAfXOy8UO9vpjZ
	0vdgCXlscaFEl5v9Vb7+xwTD71EyW5lMbhYo8614G/LSWWEVRgZ8Tvc4
X-Gm-Gg: AYBFou2WbfgxAlGDgBbvz+Jjf5GoWEnxsRe5aVMCqDZUvpSITFVDLtQUMjdMKLFEi6A
	SuKS16fpfuyQEVVOhQu6dNSpUrfES/4PylA23yMkqDDca4fd5L8VJIRy0FPwe2+4L3YLjQiAJKM
	CxV14AO1SCUCW4AuaIvQczELx9mYqXdHg8VCtz+s3Tcoz0bb78W0ILp4yxCOmCM/v97zP5fJF36
	C1JFZUOb6i/bG3oXn43r10FB3A0s0xFpYYMETVz5TR5CBGoNkAtxPdHa0ncVmIZKwH72fYk1gDU
	aotEbvI8tukmQOiypnEPasIQaniMZ8WNrt9w5kIiehwmt8U51OjpLuy7vtY1CQ7ukHFL5b4ljZY
	YhBdIAcku73NQiDWWdXpvzHqkojEak32qi2fbH+7kdjxWgAPamptTsW0PDkM+xuzgH8r+amLec5
	RR78xWk1dg08GBJuKfrjwf4bwOBKtg2MQMwax7W0e90fDHb9ssDujtD0ErN711dPRp5pwaElF0e
	uNftehfNg==
X-Received: by 2002:a17:90b:3c44:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-398dcefc24amr19417604a91.19.1788241023780;
        Mon, 31 Aug 2026 22:37:03 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm3643324a91.2.2026.08.31.22.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 22:37:03 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: hansg@kernel.org,
	krzk@kernel.org,
	m.szyprowski@samsung.com,
	sebastian.krzyszkowiak@puri.sm,
	kernel@puri.sm,
	sre@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH] power: supply: max17042_battery: Fix vmin assigned instead of vmax in DT parsing
Date: Tue,  1 Sep 2026 13:36:52 +0800
Message-ID: <20260901053653.1668492-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The else branch of the "maxim,over-volt" property check assigns the
parsed value to chip->vmin instead of chip->vmax, so chip->vmin is
overwritten and chip->vmax never gets the DT value.

Fixes: 6a3b47a5a5fc ("power: supply: Match DT value types")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/power/supply/max17042_battery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index cbf3ac9c3e14..505a68c26463 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -1233,7 +1233,7 @@ static int max17042_parse_dt(struct max17042_chip *chip)
 	if (of_property_read_u32(np, "maxim,over-volt", &prop))
 		chip->vmax = INT_MAX;
 	else
-		chip->vmin = prop;
+		chip->vmax = prop;
 
 	return 0;
 }
-- 
2.43.0

