Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496895;
	b=x/YbqTaS/a1KcDmH84m1Zt7k/uclO/6L7kfpEGzHuL+2+lBb+YtNkybleSgABh3n+ouW
	 KVxa1v1y4WJTA2WpZEThqJ5ZGUevdc+qTbXBljfkUvISwz7/YTPAGu9fdLrVWybSLYV6L
	 xYg3ZMMQNfx54zY4ULMN7KrDayWr9HXhOuO8l9cGaRq7sThXF37fiAm/G8zC1VL/quza6
	 AfpQVHjrPqm7pvnMoJL56eAW0VBxheZaJi3bPdLaEA5nM8n9MlPXeqPMsdb4mIGSrxtTl
	 RnC6rPoA9Bw+DqIv478/kIrvHtyFTh2SjPcamI1to0skZyPjIAhbl7GIAVa6V+ukiqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mhO5tZaSEOK7ztK6m5HAnmqct10WDg0rx6VsTraTme4=;
	b=HnQQAaTeKsEqKXC5x5ILwx6o4KCUr/Z/KKG1RHfwkg75M4zp4tEkE7pJbrpmUnHTAW/U
	 C6shSNoYOy3bUHQo+KCt3Cvt6ya7i/uyOyMV2LqU0nyzEJZmRDjrrGhHeT6+Sx8pG0fNk
	 CgMuXhke8M4yX+8DSOnWtacbV6XUMLjuxBzIaCkCRL88uW94/qb6EtYhyKzZz5MPz+0It
	 lRBB0lZydXXfxzBMKOI5F8LDYNqAxX5KBopNY/iDfNNNzrzH970Q/+KciVntVwgB+HPbF
	 bQR0rYmMwGB1azDLVKV9XUq3DtLHbfp4RNcTaQHjTYOdNh8+5mcy5vdRAEDeadtOTyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J6iKZ8Pn;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17CE606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D17CE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J6iKZ8Pn
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a077aed337so263657b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792496894; x=1793101694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhO5tZaSEOK7ztK6m5HAnmqct10WDg0rx6VsTraTme4=;
        b=J6iKZ8PnsYBneJnuwFGXQTE8E9F3ZTEtF6AxHCnttMZUpn3XzHi0u2e7qX3/uiNeBw
         SZEfCAsefemUiODMrulmV8e+55tD+79FYAewfa3eVGN847oARWJ1dP3TijM+mzreAscn
         oyBp1QCGVPLKr4g1B3yaL2Z1vDoA+vouJ65wgfry3/ykTymP/YGUbjejktg7UEVckcdk
         RyK4pA4LdQCCYCSE8FTd9BJpF8Secf9jakKA3PceAj8yBurtjUWfGO7+nwxvYJKhQL7Q
         PUfY7WrVuYgGz0xmPejQbBftsCHatMhC2mcOSf8JSyc7o8e5N7wg/eZGERHIpxeNNGxs
         I5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496894; x=1793101694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhO5tZaSEOK7ztK6m5HAnmqct10WDg0rx6VsTraTme4=;
        b=WdhkgScYewsLfOBSRZjjQftffaSBb9QsODx7q3khUeqAvxnRkW6eTk2mClgag3rHUc
         /Mzi8uX63Uxd9ntAHidNAX+qOm0oWfVP+H6xMbJMEgocDI/h0KmmrO4ac7HuJORISoXb
         U2uy4+M5WDknI9GzTFea4acXoScCT9bYCb1CtmFePuzbeWeOgGrpv+L5t41aGvb5Qu7Z
         pxl6/wqe3/7+Ew8SZDbwy9j3rCyMoH8kLRynAvdt6iQpVRmrieJ4jxgxkrJUedH7tVeE
         ZPdK1hINtCaqNVDNokylZphSfcXyp93BG7ttC/NwIDwEBcWf4su9Bfw+73MwmwxRv0dR
         pf9w==
X-Forwarded-Encrypted: i=1; AKwUvBwc1tuvsEb5N7SsYW3UTQuQCAPx1EKShtvz4yDPLqeXasIauH5Azcg5kYPjP4VPXWVMhnbbCY72tz3K27E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU4t1GC++JUX6a9V+XTslZgb2n9m0otL3VKXHM1LS+pkvS/f7y
	Fc8iruXZDG4WAceuWvcKMY5NxrFakB0SH+pyNVeV7gwTo0VA/iQ3H+ex
X-Gm-Gg: AYBFou2pflOlh6SAnb7H4Ly8cXjLa3amoxSUN6FHEmti7Op5P2At+ZAj4+HCIXd9fVa
	sOJjR6fNRDXOmxSVMDDUWROV3I8ee62VRz0wOz4W8PU9qt6i0/NAGjedWxotYVmf0vAiCPmIZmD
	vSd75gDPNsFqumSkbRVLQpkHkXlhmxxaNnhmq/Cp0pAzasoJLz1lHKNcpuo04gJ0euKMlwj/EzW
	rzSoxD63lyB3JzJ4rJF25/XNNIfIqc1oZdBQLLAWclycJQZC92MFs/GN3RiuXajdySrtmuyN1fg
	8NZzigfPT9MJ8JI1H6gvcsH3DPB1ynKDkOV2YvfONBvKPd+zR/OH4YjRFKdflxVfTvq90vTfI5d
	EYtBxIf5k6w9zvjqC0YGU0ReMtEf8EV4InimCHLL3DeNe8r9SF01BKro5uDjhbrotL5dWyM6zeF
	F/nxuBuIzpBVNdNlI1FpcMgKYKkVgxt3+PEhic+XkFoFr54eHTKuO3nFrKjEuIfp8yo9pH3z3Vo
	Zw=
X-Received: by 2002:a05:6a00:2d8b:b0:8a0:582c:5c09 with SMTP id d2e1a72fcca58-8a07bffd972mr1187619b3a.25.1792496894150;
        Tue, 20 Oct 2026 04:48:14 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017c70sm4761701b3a.48.2026.10.20.04.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:48:13 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: andre.przywara@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Release the mon_sel lock on mpam_save_mbwu_state() errors
Date: Tue, 20 Oct 2026 19:48:07 +0800
Message-Id: <20261020114807.3915705-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
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

mpam_save_mbwu_state() takes the mon_sel lock at the top of each loop
iteration, but the four error paths that return after failed
MPAMF_MON_SEL register accesses do so without releasing it.

Take the lock with the conditional mon_sel_lock guard class instead,
so all exit paths release it.

Fixes: a3a94c13c442 ("arm_mpam: propagate MSC access errors for state saving function")
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..c067b6d57d71 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2037,8 +2037,10 @@ static int mpam_save_mbwu_state(void *arg)
 	struct mpam_class *class = ris->vmsc->comp->class;
 
 	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
-		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
-			return -EIO;
+		ACQUIRE(mon_sel_lock, guard)(msc);
+		ret = ACQUIRE_ERR(mon_sel_lock, &guard);
+		if (ret)
+			return ret;
 
 		mbwu_state = &ris->mbwu_state[i];
 		cfg = &mbwu_state->cfg;
@@ -2061,10 +2063,8 @@ static int mpam_save_mbwu_state(void *arg)
 		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
 		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
 
-		if (!mbwu_state->enabled) {
-			mpam_mon_sel_unlock(msc);
+		if (!mbwu_state->enabled)
 			continue;
-		}
 
 		val = 0;
 		mbwu_arg = (struct mon_read) {
@@ -2088,8 +2088,6 @@ static int mpam_save_mbwu_state(void *arg)
 		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
 		if (ret)
 			return ret;
-
-		mpam_mon_sel_unlock(msc);
 	}
 
 	return 0;

base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad
-- 
2.34.1

