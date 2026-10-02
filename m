Received: from mail-dy2-f36.google.com (mail-dy2-f36.google.com [74.125.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96785348C77
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914104; cv=none; b=LVutHzWGbq0NxRsOjfS1GxmH0famfKO/UxjmqF4skRlW42OZBo+48kh4NFWwnEyLlkfz95EsDdNkCRjeSxGnJIlYTjUeuvBTxT9uNZWcl/2Vjfs33kZo1QWBwE5WBN6fAX91+z2RKBLJQL3WzmZJh2yfc1yxCqMZC+owTszY4uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914104; c=relaxed/simple;
	bh=DINkjq05zx+pWUD1H/kC0SeYGjB2tuKtoVlRFcjbv30=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T8LMJv90pk+BKnkC3leAbVkr9jJmWNVth2uvGTb3K0NWCQUcRpUpcqOyUb6F8ImaMacuU6mUeAhHwaV3GukLDN6pqAxgHvgarOYkYm//3q4PQZpcD9mXuFgX8G97o5Gd7kpCZYRjXPGXluSe+QOms3CdCttpd5Lshvy8Qj72X9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbbIOqx0; arc=none smtp.client-ip=74.125.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbbIOqx0"
Received: by mail-dy2-f36.google.com with SMTP id 5a478bee46e88-328664c2da6so6144175eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914103; x=1791518903; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dP1W63z8La+eKKPJrNiJLOuUR8uNl56iwVgv8Gujr9w=;
        b=bbbIOqx0A+Y4/5+wZsFMNOAaTf9cQyMLepYM/Mgqonov1Wr03mWzp7JjP4j838nMsB
         UgY/3VLQCENKt3keruK98f7H7yK13e2eU2ENrqEFHUKRZoMEyqC2cF1Ny8zlBugdvT0b
         GMEP0SsUN3PenaJcXp8YFpKPrb/0W0ZCvQ3cznW4XP0cYc1v1ZtRhKRDwh+EOYW0YNtk
         M2sMN+awKZCpGuxiy2KQDmiBiNXUYfF4D4Di21FQE8T9vpxi6LRPzPTYtNcEohhRnI1J
         3hiFhAHmqixX0GiX9H74emm6JjAenJLcngkaLD8yiVQoWL3X9A2Aihovt/9HpOOtwtPX
         F2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914103; x=1791518903;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dP1W63z8La+eKKPJrNiJLOuUR8uNl56iwVgv8Gujr9w=;
        b=KPzK8wxgAcBam0ZcQ3Mp7TWtQuW8Fm/EYTWwvPRFlrkgn+l61H51sfvClk+Ry3suYU
         ebet9cBNeztKXIQfjlQZy13e6qi07QBgTedJ2aaHqJuJ3sG72p0fDhu/t1xI4xrCdqbl
         u85MuuFwZdtGijkPJVM7unU84JcmkE8g156JQxIJKwd7Aumyz6mL0TuUBkRg1YxRfgGc
         7pwloO/v3kbN3M33Q/Dnp6hlOvQp/9JBlcSJCcIKgXJIozSpfkWEYdDNrs5kPPp+sW6Q
         J/nVLRq87N2LoG5Uqskw2QfIwFG2cv5ABFB0C5HUdqedtrAhHhtxHZzfVd7XQvYoHLtE
         cwkA==
X-Forwarded-Encrypted: i=1; AKwUvByB28I7CBcdRNLi3zXD34A12yZfZD7M/URTE1wgNCec+xDNjDzG37Br38uZty+3QbgmWWLPuuxvDjCBFWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeZ4TB0yKqZL1y07H+TIJwWI2VRCkiPa7OZML/6FiYL9yIy5jz
	w99Bg44BJjF8ilAEp6BWUUlcMYTnGmTiPl0VTurO6bDXNQZm4mcaSlf3SexDsw==
X-Gm-Gg: AYBFou0LvH5HA2cK1JOUm6MuMCaKpoEGH4wbQzLyfoaXO/upBswLfheYe0/TXwWTe5i
	ltYiXherP1RR8a3xho47VwP4PNNGuujSSoWYOrESUhCB+T+LnkOSQ5utGPyZqM3WxM0sgtmy4Ca
	OIIZuL6g2wpZLJTp5vhm50FgoO/GQ4IlkB3tFGC72LoqFcWW3MDT28El/gzmQnWW4xXWjN5msOV
	/21OhKv0wfDgc24r0sILGFTrtgLhNTjbw9/wmiSy3titM6jNtRIzMeixSifO1Ir7SROhaVzaomr
	LuvLMGpXtXie5iXKB73AvWPRDl07uax8aYaH60YWdyjox05V1rzlQ67xhkplYIrlcoNut/HrP1t
	zf7YSQLwlJgtZa6NUZT10pEelouQpu81eO8d5A55mBtVWyJEJUACecxLK7dTZKT2jRL96aXPVij
	wd8SPRaL9IIK8QgfzkjYPRIC/iSBs+keZoW8Ioeeq7Kr7CPstw2/cBs7c4VNb6ylO2WMFOl738q
	Yg2doLsmQM7
X-Received: by 2002:a05:693c:2184:b0:33b:9540:89c6 with SMTP id 5a478bee46e88-34f150a0140mr1465702eec.6.1790914102382;
        Thu, 01 Oct 2026 21:08:22 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:27b5:8987:8e28:81fb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35105dd1dfasm492558eec.8.2026.10.01.21.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:08:21 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Subject: [PATCH v2 0/3] staging: rtl8723bs: refactor
 PHY_ConvertTxPowerLimitToPowerIndex()
Date: Fri, 02 Oct 2026 01:07:34 -0300
Message-Id: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYuv2oC/3WNywqDMBBFf0Vm3SlJBOt01f8oLsxDHfBFEqxF8
 u9NhS67PAfuuQcE59kFuBcHeLdx4GXOoC4FmKGde4dsM4MSqhKkFPo41jdV6oBxx/XlceSJI1I
 rSWvqSEgHebx61/F+hp9N5oFDXPz7/Nnk1/6S1b/kJlEg1WSNNlKWnX30U8vj1SwTNCmlDyFiI
 6G8AAAA
X-Change-ID: 20260922-rtl8723bs-tx-pwr-limit-9a19bb9f901e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790914100; l=1760;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=DINkjq05zx+pWUD1H/kC0SeYGjB2tuKtoVlRFcjbv30=;
 b=SYiNR+UldcO66hyDKNIhAjGTxH2eguwPkHW2t/Np5ErNgsf9v6BTrrFkxlMNG3l4yUqH1i60q
 HUHXQgtUhfzDNRzMttOweWq0Yjxqck6IbToHgiSwDXMZ4PIix2D7uuU
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The function PHY_ConvertTxPowerLimitToPowerIndex() has several style
problems, such as mixed-case names, deeply nested code, and redundant
bounds checking.

Patch 1 renames mixed-case variables that are on the same scope as this
function, struct fields such as TxPwrLimit_2_4G were left as is. Patch 2
removes redundant parts of the code, and patch 3 solves the nesting
issue by extracting the inner loop into an auxiliary function like it is
done in rtw_phy_tx_power_limit_config(), at
drivers/net/wireless/realtek/rtw88/phy.c

Checkpatch issues a few warnings and checks for deep nesting and long
lines, but these are solved by the last patch.

Compile tested only.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
Changes in v2:
- Rebase on staging-testing and drop the patch that was already applied:
  "staging: rtl8723bs: rename PHY_ConvertTxPowerLimitToPowerIndex()"
- Dropped these two name changes, keeping the original names:
	regulation -> reg
	channel -> ch
- Link to v1: https://lore.kernel.org/r/20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com

---
Leonardo Martins Martins (3):
      staging: rtl8723bs: rename local vars in phy_tx_power_limit_to_index()
      staging: rtl8723bs: access TxPowerByRateBase2_4G directly
      staging: rtl8723bs: extract inner loop in phy_tx_power_limit_to_index()

 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c     | 87 ++++++++--------------
 drivers/staging/rtl8723bs/include/hal_com_phycfg.h |  3 -
 2 files changed, 30 insertions(+), 60 deletions(-)
---
base-commit: dbc2fa996f44602af72ea56efa68c043407eaaac
change-id: 20260922-rtl8723bs-tx-pwr-limit-9a19bb9f901e

Best regards,
-- 
Leonardo Martins Martins <dev.lmmrtns@gmail.com>

