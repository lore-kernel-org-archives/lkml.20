Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569929;
	b=NpoCO5/smCHuS0W7C6dRy51jxfvKtI6tzZKKi2UWNGiPpCVuw3dipwK+zS630WAjbG1w
	 X6VfYLnVA0G6DC3myXh1VFLYuXrdgnsEJ8NONU8PWIyjQEiCCLMYWb20piYHdHzhFUTNy
	 7W9yuPbmQKIgohT+T883nUhHhGSM7z683i3HncV3vp2oSFXeT9b6ExsNoioXxJztKx7AA
	 20KtC1DD2Si1niTMfcbQ7uxd9BCIWpIH6eIQ2t0EvnpkQO1u+vNyn4QMi6cAOnv0i5hTv
	 HZymy44DTX04tu+kp9ZZ9p54LFG/Z5loA9Wg8cd7sWXN8PgXCMDX68y2UgoChvOXnRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ucrcGnxXyuYhogAmjNJch54rUpgpdnz/8hQqaKskjsk=;
	b=5YqF9IP4Kkcs8EgKfDjw5G6wQ1biPlpUJOaflK/ISNA9JyXiW9jXs6F00uW2alONYXwB
	 jv8+rTRCYVzUd6qY+jFSS3FmpVKIrR0jY0wF0EFbJZ1togQ0iJ48vJp5DIAbyWVUowiN5
	 WKJk6E8LVgufnBOfmVrASqCcUt38ZrJdEgoFvdzN9APoTv2Wm7MG3JSJWjin+A1KGM3RQ
	 CrFoWkzEbz88Kw+j5SUR8TS7qamNFwqvnMPtzvCguyk0+Fz10iqIzoFqmIChAuPrBMXvi
	 VzBJ8yCOkJJPuj05EVprKSUQcQaxKk0gJkqHeW//e3lko+TCru4SI4UamQtuFga/I1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jwG847XJ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEED606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DEED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jwG847XJ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso2025445e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569927; x=1793174727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucrcGnxXyuYhogAmjNJch54rUpgpdnz/8hQqaKskjsk=;
        b=jwG847XJhJbV9MnwCiFohonUbKnj6JWHGBY63H4xDYKx9C8HSElWVEdTmW0dTxn5qB
         sg+ehAJ1WM3rvjLZsCQAyeWcyIn+yGDKvq915orp0dRrGGSNEMqdlaUHwuIrPYs9YmT6
         uinEITawyfHiGrsnhbTCBBwIZtLGAoDcVMadKyOc7LT0ycdfZZusmUyj53GLqnRHFaB2
         4H6I+ZKSN4c7bynljJJHON45X1/mIBtXjHBmBFiE8aDfiJBB71OufeK4MVFGiyH6LSDR
         PfXTgcOPZbpUcUyuE5ma1VNoCVyh6XnM+A7hD72MD0yxKr+OjxIxyJnZyh4dPNpuluyB
         1HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569927; x=1793174727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucrcGnxXyuYhogAmjNJch54rUpgpdnz/8hQqaKskjsk=;
        b=XxbtKPbdJXAFR99CpilNuVhWNgdaGwOAjn+YpoUi+dAzP0IFZAKn8591wyl7YXhbQ7
         jLQljJQYsYqBJKqwYFvnxY/IyNoJMkA3mm/2dGANkGkcMnbamXriZnf95rM3t6iCwzva
         IE7hEiNACvYfIm8Pw7tQI13bPUp2lPuCZh3IrbPfzeXflLN9Zm7dDdUIjqC0RbxrYP3L
         RNrAZ0qab/+rEHJGPAos0mA/SyHe6f8Jtg26qnueEOnGVnsiNMtKpyC4bjgvOL+Srrz/
         Bdd07/5oyvSVdfXzs2H1BnkJu2tOOHZAToAi4hj1bGI0AO386dSyQ0bAe1s2zeZh1RRl
         2i0A==
X-Forwarded-Encrypted: i=1; AKwUvBzftZ6VMh2wSufcsojVkc8q3nUBgy1JpA1erKjLo3p2ulq9GuxSWI29VaKV79kRiOF4P4k8xazxdM82dEo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzk2nrl7qIR8eI90KJrucvNhARPDJO0nvMfWpDxFUNWcm29njY
	HV67vytkpN6Pfi1flOSviJm4sBLIsOJE2FkvRW6P4gjauzXjc/66wlEl
X-Gm-Gg: AYBFou1XGfVtvXju3eI8huDcaSEiNH7dBT0vrlBLT9oGpHUeie51ZEXszY/CatIOB4Q
	KhxUbnJzyZxD8WLBiWJosdIxbr6tjFDDiodgk79mUMEMppTAPubjtfORovwltj5ebLQIjTmOYMn
	wbSoaPcIxS4UNLpoRKeT+pVEyowVsEETFhrrMN870Dy1CE+ELjRXos7J9YV6yrYsj+1xJ/+u4iN
	VnioagdiCu12mOEmbyF6W0I4Qi9+poaE9PTORn1iIP2xSbKox339K2umnM6AJhUDRJX6KIwdL5f
	f3LWPvPLAGHw+pmzlTTfQDiCBE3SlctjorTE/r800VvSeOUJwKnapG0oACpX0ZriqMFXgNDLbcb
	huLGW3eIPgD0/6ewJMxdyz6Z0FxutMyc9dJL9zVxVN3zrHe+ensPU6I0fQuFUWIsW9zMvTdUb/8
	wV3ghO8U7VXV+r1vf7lU5mW0Y+/ge0FeBukSs5MUm/hZCsgzX/X3JidPVo140JaCnRKb+5hsjXi
	N7VkFpr+0j+bT1v/cWJ5zmvksrk2hNtjrd9eDxY0sMzmjqy4Mc0kC+9ndHi9PedpQ==
X-Received: by 2002:a05:600c:c4a7:b0:4a1:d41a:afc2 with SMTP id 5b1f17b1804b1-4a1fd8cb7aemr24443845e9.3.1792569926424;
        Wed, 21 Oct 2026 01:05:26 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.12])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1066cfsm38928165e9.1.2026.10.21.01.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:05:26 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] pmdomain: qcom: rpmhpd: don't clamp gfx and gmxc before sync_state
Date: Wed, 21 Oct 2026 10:05:17 +0200
Message-ID: <20261021080517.2161-1-okerixx@gmail.com>
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

Until rpmhpd's sync_state every vote is clamped to the highest corner,
so that hardware the bootloader left running keeps the rail level it
needs until its driver takes over.  Nothing the bootloader leaves behind
runs on the GPU rails, but the clamp hits them anyway: the GPU clock
controller's probe runtime-resumes and suspends its GFX and GMXC
domains, and from then on both rails are pinned at their highest corner
until sync_state.

On Glymur gfx.lvl has 14 levels and the clamp holds the rail at the top
one, 0x1d0, while the GMU's own performance table ends at level 11,
0x1c4.  With the GPU driver and firmware built in, the GMU boots long
before sync_state, and its CLX DCVS calibration does not survive a gfx
rail held that high: the firmware gives up with HFI_F2H_MSG_ERROR
0x007306c7 (ResMgrCalibrateDcvsLvl), the first HFI_H2F_MSG_GX_BW_PERF_VOTE
times out and the first GPU init fails.  On the Lenovo Yoga Slim 7x
Gen 11 this means the compositor cannot start at first login.  Pinning
gfx at level 11 or 12 instead fails the same way, level 10 and below
boot fine, and pinning gmxc alone has no effect.

Leave gfx and gmxc out of the clamp: they have no bootloader-configured
consumer to protect, and the GMU votes them through its own RSC.

Fixes: 93b6c8d10fad ("drm/msm/a8xx: Enable CLX feature on Adreno X2-85")
Link: https://lore.kernel.org/r/179248663855.32151.9955864156939592299@gmail.com
Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index fa8fed5bd3e5..2c9d4beeffbe 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -1006,7 +1006,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
 	unsigned int peer_active_corner = 0, peer_sleep_corner = 0;
 	unsigned int peer_enabled_corner;
 
-	if (pd->state_synced) {
+	if (pd->state_synced || pd == &gfx || pd == &gmxc) {
 		to_active_sleep(pd, corner, &this_active_corner, &this_sleep_corner);
 	} else {
 		/* Clamp to highest corner if sync_state hasn't happened */

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.55.0

