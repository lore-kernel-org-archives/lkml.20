Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD395427EF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079557; cv=none; b=SQxzdfEo/joImacULg5HqwJCy2IlBXlOQjSzj3LtLOFwQ3GaRFO5YqvZEWUtjDvTC94F+NmWbn5HlNBxeo+9zaSs7wjQhEhaOdliYrKhIo3w8sZ+Zl2Wx0lUBId4w1fO0kU1qMMtBrpZR5hsU71qiZH11ZNVa9qGN5g3Jji9dBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079557; c=relaxed/simple;
	bh=1dlM7Z4+tJdQen1X96YsAEa2D0A13iz8IrrDf/8d0tU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TTaitYP4N3PF4J757eBavWuvaDFYHrZ3vfmQCTspMTFRoc79YZNBkjBr39uxfChAy5gIGlZmZwsNerg6hH73ER2KR6zroHglr5SQxyfOR+LGSDR40xyen320OUmoyFHguJLECWSdD837jlTsa5klnLOH77YLMzqhCVtLLmRHIAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xq9pTWOP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSZzUrPL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xq9pTWOP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSZzUrPL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPLj44077840
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g+oIgXL0Upy3cOX9OQ0bCY
	UpD1ds4ORdqAu3wAb90u8=; b=Xq9pTWOPsA2WE8J5a3J0Zod6+uSWe00PublddG
	4nnjCLU3cOk5mdbH1hl98aZJHrG6CoqPOJDYqVAIKDpy+awgf07ybCjS3k8XhP2h
	4PBhkUgDOOV2Sm4QSQZUcXQLLPUgPQOpvQD0PGhH+l1e0PQrGA+FYs67C47f3Y0f
	dSIVnnm/xDWTGZRTCBbk7C3+XuS1tRonzMuUFN9a2OGzotzTB/x551KG06CTLBPw
	CQYTcUWIStCHZ8gtEE8ojkhZ9G8wHKywaf5inroY84yj8VV26kZVw+K9MIcp9Piq
	3lHryntFOommW3xAfF8kkFQ4TcM+OO66OIHtfzOVKx0cFFcw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqgu2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:19:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63bad3d09so57065805ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790079554; x=1790684354; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g+oIgXL0Upy3cOX9OQ0bCYUpD1ds4ORdqAu3wAb90u8=;
        b=OSZzUrPLJ1i73kz/dMG5bz2UG4UGyUOAXKp4VvcXgrK47rdoHc/YIFDvhhDnujxlgt
         YoiOWV8bXlIAq5WN1MLfbpFXR/ONvJ3x/9pBiUgm0dyViojoEU90Dv/BXXkHfNeLKVot
         A1m8Zhlm6fYE+5zIzP37Kyagusaa+ecSVAywjvP7ML8RR3zNjbQjNgEkzTXCxxXJ7aNT
         6j637/7KI9BGIsVqdK5EgFrZw75HWy9CGyn5J3iPCBW5f9YfXNpOXYe0hX7VFjuDeKtI
         lVVzHbKn7fXme7PPzRVTR1j1AWJxMRTf2hre9VgodynDwyNl42oH61Is19CgJS9eooVW
         rcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079554; x=1790684354;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g+oIgXL0Upy3cOX9OQ0bCYUpD1ds4ORdqAu3wAb90u8=;
        b=SBmRIMURTmzyW7yxHSH6wCJAlckb5rfWlU/69BpSCUEyXMzLi2Z3zmx/U3s4Wt9slz
         KC9nGnZpxEhSjyZeqFzumYKQOAJTuVXI2Do+72vlj96lco/tIPCoxz6PIYoWjsiQLR7c
         r3VkKLRpTmE1GZXJEC1aX/RNaX73ZTmSDT7N8pt5pW2mtszt5KmtLberxxfs4E0S694K
         gSHTFdjSTs67Ev8BYY+HEhEAl7ANHB6b9CKTmOS3CYWE6usI406wtA8talbBBIj/7Az6
         Br2rRNT0Boa5XOiYcyvf+aFIDUzGiXkXe0cpkv2vnhifdIaspUDgJC2UZKMY+BnoCEv2
         5kQw==
X-Forwarded-Encrypted: i=1; AKwUvBwBNJ6V935PlMaMHmMmW9Ce3n9nSK6aWrKYIan62jHAdBcp5n5UFYQVREBWROlyiUjWF4ZcPRmFdb52GRA=@vger.kernel.org
X-Gm-Message-State: AFuF++lGk0tmyO5o4X1SVrlmFjBgF5TBM3spim8z7cGWfEu/4eLVPdoA
	RuyBfuP94VYA8AZwIcciUUmePDgwQw6WUu9YYfHldLmtjkjhIH9ChsIgoX3Ioq+fNfEaQrDd2uo
	jWR5xlkF3YUg5Fknn62VqTXKrm5K8oenfGDuLpV+s+ZtLLQ0H5WGUjJi+lRoDnA4mvF4=
X-Gm-Gg: AYBFou2NLfnPh5t4x5liuSERUqGuJa4ERAYdK0e8n4m4Uir2Sryj7lzpVCKAgdSvm67
	Pxw3/iF3gJAh28wBlIVhMBG4g/+oXu+jwr+EwrqoOcl4LJSjuThA6Obbx9NTwvSbD1wuQcKk74H
	7tDHVDpPfiVs/MrhqZmI/mxU57Gm7qvFDxSCO4Z98jisA3vwlNuQVsgCkUj+VstUwBvUoTJfrE4
	jEzYfcomkDW54r6qSFLZYRv2tayUD60pOYNHgX9pKzmqDX9pSBpsD6xtL3oKSHaG/ifmpX5B5jL
	5FmEt85M55JMIgSgSsVOC4bCCsMeFJU1JTvHBKoP/sEKR2pbfReQUMEJPs/BvndoDdBVkbKuj8l
	uV22k/tc7Zp/A4EWMeMz0BfqpoTI938I99Q==
X-Received: by 2002:a17:90b:5408:b0:39e:6c6a:4b73 with SMTP id 98e67ed59e1d1-3a0732799femr955868a91.61.1790079553800;
        Tue, 22 Sep 2026 05:19:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5408:b0:39e:6c6a:4b73 with SMTP id 98e67ed59e1d1-3a0732799femr955827a91.61.1790079553157;
        Tue, 22 Sep 2026 05:19:13 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07385e516sm562203a91.0.2026.09.22.05.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:19:12 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:49:02 +0530
Subject: [PATCH] thermal: gov_step_wise: Fix stale mitigation vote with
 non-zero lower bounds
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260922-step_wise_multi_zone_stale_vote_fix-v1-1-789f68dab229@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADVysmoC/x2NzQqDMBAGX0X23IBGsNpXKWWJ9atdsIlk4w8V3
 72hx5nDzEGKKFC6FQdFrKISfIbqUtDz7fwII0NmsqVtys5aowkzb6LgzzIl4W/wYE1uAq8hgV+
 yG1y7umnhhgo95dIckfX/cn+c5w/kC89CdQAAAA==
X-Change-ID: 20260922-step_wise_multi_zone_stale_vote_fix-e79368ead1eb
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790079550; l=4592;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=1dlM7Z4+tJdQen1X96YsAEa2D0A13iz8IrrDf/8d0tU=;
 b=+vpHNJbU8cMwcO7pfZw28j9gugoSp0dF22vG80lUHJTUD8R2bYlGD0ZaubWOFzi63SPqkIgpc
 7uOHPkfx1sBCsxtTuLfd41BkhdI/NMWaLHAup7aJkDo3wMVn/6jiG9Y
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3OSBTYWx0ZWRfX0An0GkwccZ1A
 hIXaivZOwk1w3Z3Wk8a2x2XW3XSWf6W53dRe+P/q8RGybw6+UI/olESK0M80WeDX3T9IlSTuC+7
 4W6t825WO04EpnqT3KriTzWl8qUfYlB0d1hhFrxD/te2LPENIBCvBqiIoqqlXW195BH2DOikXNw
 JS3MANtBWsm1+yIAhVL9hX8OAYIyjFW2emJe+S5gzVEmNOJ81jpwHDbUWlnUhVrQabchn3Rq0JD
 St8+NZTPVHPE+gRr1w7HSmn57rfTpvT2AVLXR23MYJ1RU4JOAhBVfcHmD65F5eGKKjVsyTjUuIT
 NWHZQo+538LRB3i2b+oD5adyLm5pmT2WIIQW55Oo+gXB3u1mJPyccVApy58fof7owi9S0JQsWdA
 4Ad3smWrjN1oIlxnBMBpE5GOxkyt/R99OpFN4yY/YZOd/pHLBm1o+NG+WCoJbaSSIvhgjIfD7bS
 0hMBO6PuF8OOr6Sohfg==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab27242 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=67fxiblbIBgiSD12K_sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: oI0rjrtVmW4lkN68bDhx6-C0ZarChF-0
X-Proofpoint-GUID: oI0rjrtVmW4lkN68bDhx6-C0ZarChF-0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3OSBTYWx0ZWRfXwT9TjwGWkrW0
 KqyX/fdkIryUHv7zMsW5fey+TAMYtRjR9lpMqLYBqSEKAW9LAMZHLKBo2fejb0gOuT09Vxcj9Q0
 IbPmxEStU5IqBslmHLryNVpvRmKrFd4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220179

When two or more thermal zones bind to a common cooling device and one zone
uses a non-zero instance->lower value, there is a bug where the instance
holds a stale mitigation vote even after its trip is cleared.

Problem scenario:
- thermal-zone1: Trip at 50°C, cooling-map with lower=0
- thermal-zone2: Trip at 55°C, cooling-map with lower=2
- Both zones share the same cooling device (e.g., CPU)

Issue flow:
1. Both trips trigger, zone1 requests state 5, zone2 also mitigates
2. Zone2 trip clears (temp < 53°C due to hysteresis)
3. When throttle=false and trend=THERMAL_TREND_DROPPING:
   - Current code checks: if (cur_state <= instance->lower)
     return THERMAL_NO_TARGET
   - Since cur_state (5) > instance->lower (2),
     it returns instance->lower (2)
   - This is the BUG where it returns instance->lower even though
     trip is cleared
4. Zone2's passive polling stops (tz->passive reaches 0) - no more updates
   for zone2
5. Zone2's stale vote of 2 persists indefinitely
6. Even when zone1 wants to reduce cooling to state, the cooling device
   cannot go below state 2 due to zone2's stale vote

When a trip is cleared (throttle == false), always return THERMAL_NO_TARGET
instead of instance->lower. Remove the unnecessary check comparing
cur_state with instance->lower. Since passive polling is already
deactivated when the trip is cleared, the instance should always be
deactivated regardless of its current cooling state. This ensures that
instances with non-zero lower bounds do not retain stale mitigation votes
after their trips are cleared.

Fixes: 042a3d80f118 ("thermal: core: Move passive polling management to the core")
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
When two thermal zones bind to a common cooling device and one zone uses
a non-zero instance->lower value, there is a bug where the instance holds
a stale mitigation vote even after its trip is cleared.

Problem scenario:
- thermal-zone1: Trip at 50°C, cooling-map with lower=0
- thermal-zone2: Trip at 55°C, cooling-map with lower=2
- Both zones share the same cooling device (e.g., CPU)

Issue flow:
1. Both trips trigger, zone1 requests state 5, zone2 also mitigates
2. Zone2 trip clears (temp < 53°C due to hysteresis)
3. When throttle=false and trend=THERMAL_TREND_DROPPING:
   - Current code checks: if (cur_state <= instance->lower)
     return THERMAL_NO_TARGET
   - Since cur_state (5) > instance->lower (2),
     it returns instance->lower (2)
   - This is the BUG where it returns instance->lower even though
     trip is cleared
4. Zone2's passive polling stops (tz->passive reaches 0) - no more updates
   for zone2
5. Zone2's stale vote of 2 persists indefinitely
6. Even when zone1 wants to reduce cooling to state, the cooling device
   cannot go below state 2 due to zone2's stale vote

When a trip is cleared (throttle == false), always return THERMAL_NO_TARGET
instead of instance->lower. Remove the unnecessary check comparing
cur_state with instance->lower. Since passive polling is already
deactivated when the trip is cleared, the instance should always be
deactivated regardless of its current cooling state. This ensures that
instances with non-zero lower bounds do not retain stale mitigation votes
after their trips are cleared.
---
 drivers/thermal/gov_step_wise.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/gov_step_wise.c b/drivers/thermal/gov_step_wise.c
index ea277c466d8d..4fa4377f0d42 100644
--- a/drivers/thermal/gov_step_wise.c
+++ b/drivers/thermal/gov_step_wise.c
@@ -65,14 +65,12 @@ static unsigned long get_target_state(struct thermal_instance *instance,
 				     min(instance->lower + 1, instance->upper),
 				     instance->upper);
 	} else if (trend == THERMAL_TREND_DROPPING) {
-		if (cur_state <= instance->lower)
-			return THERMAL_NO_TARGET;
-
 		/*
-		 * If 'throttle' is false, no mitigation is necessary, so
-		 * request the lower state for this instance.
+		 * If 'throttle' is false, no mitigation is necessary and
+		 * passive polling is already deactivated, so clear this
+		 * instance state by returning THERMAL_NO_TARGET.
 		 */
-		return instance->lower;
+		return THERMAL_NO_TARGET;
 	}
 
 	return instance->target;

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260922-step_wise_multi_zone_stale_vote_fix-e79368ead1eb

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

