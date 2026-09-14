Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7469F425888
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378836; cv=none; b=YwsTCzN/Yg4Y6gGpvKivhOKouJ9ZN589829U+ONm33B7lTdOoLUro8lgy7/qDh5wasX8CNbfza27E+BXQAi9rf8uhGvW2D24iY1T1lmmnJGEBSrVEkHwiuO1REc5/HvhH2DzSI0cdHyGYll8bRgk+ld+5jzyLmQ1SGp5Yjw3US0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378836; c=relaxed/simple;
	bh=Eup0TFC52Dvb5C0RkUrvytnZqSb5g4QWq/ztKU5w+8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EnJQ2OTE4l/8yD0z8kx6w/hhj7Sa0gi5L9aCXEGeJsvF+gqj0WR7BxwyDOU7BP4lVIFE9+wwDBGttVvastcbAn7ZwDOfl1LuiS7TfAD7BuKRxQpGjQs0Qvm3HA0Hm/Q13VYbvWn2MFOtSCRpWV6Q2ye/ksuKtvWA86hkar3ozWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRHBF45z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=am6KVJ+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRHBF45z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="am6KVJ+1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7SBCL3351861
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=; b=GRHBF45zjkMEa/aQ
	DPBEp39VwMgYCtsR+lOVJ9DVytz9ho4CvOvD5hneLrwyFgr3W3Cnem7dLCCDt6pd
	kzDnJir+5XMq5ZAsk7FiytBnp01hyY3Rwv0xpNUw3pny1PrD9h3CznEqY82yOc9x
	jTe+g4H4p+KbnaJLMcEE1H0i/6RtGRY+2tWwTwVT71Fd/72VC1CDDrlcASX79cnt
	Ijj5W58vhSGpxJYPh7zgfSXUhXteTkvyIWkB4t/Rvf2YFtMGYeBn34ukjlmXGfPc
	CMiEKWNI8zCI3a7UVUSql95BtG9MmWvsVKiTT3rw5kPP90lY0ftZl6an0rW4giS4
	ywIXxQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0eqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3808103a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378834; x=1789983634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=;
        b=am6KVJ+156hCJflJnhS6eZHTCM95OvK1MroOV9CmTQ3PmpnSIjqO8wy+hYgICCKzn6
         WaHTJBbF14irVS0j88vwKSkkxdKcwOBzMjfxJVMerdSIdE76fsnTZUW0obRUCOgU2bxa
         zJkkwYSLq8tdlrhC3CqV5fbbpC97leFw/5hbmr46hKWt5G8pq1f6hp9SCpdc1XXJ+RdR
         9S5CVoxsHOBhDzzL/JCrJE3dY2H6Fj4Y+mlTJjHEFP8/uvcaU8iSvkPhGtgx0+DSZvn4
         PhvPv84I+/y0zhvKZUKJ/S4ee1J3Agqgih1V5JBz4Nol8rxexhI8Z3ZxlCuKahdfrZ1Z
         X2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378834; x=1789983634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=;
        b=O5cas/6/PLfSWvgT35NWJfjRSsLZzNDej9Ve36f2UhsI1yrhbF2szCvhbLamXN4AIe
         yxnRkjVzB88uYgbpDSriNu+C1zm/SNyRciXe4Je4j057QY5+G/cjLGPP4zVVFZLBPiQ1
         z4uzGO56z4PyEfLqpz9snsK7IAK+jtzIzmS9nIomL5Z1bK96nBQsB5MhKvblC5htM78N
         TUr0xkIqsW+mFZ+ce2hWzHmbqXq60vncpKGRlntXMMJs7hANm4lcLEmgrSz/MYzgIHOY
         mEHxA1JfZRCAdcY3bfDMIZmqvtb612pO45U0fR88JzA/Li1IJPErLtVZdzU9JXwWN3O/
         9D2A==
X-Forwarded-Encrypted: i=1; AKwUvByFgxWc1socO3Lfmk3DDsR3kpp49WrcYO4R2YzmmLeBIXbcP0UFynbxk7Re7gou+wp8k2AAwiUy0DzW/vA=@vger.kernel.org
X-Gm-Message-State: AFuF++kGz1IhNEHVyZTXppKcNfyjkfK2F8Nrm3PKVnyiYoXjrGpAGrwo
	FTGKX7+hJnysF3d/mP94pZ78mWj/FChgI5e0IfgSRyCv8tJOMCze9skH+zNfluxo9GJ00z5FzKA
	3Lu6qEUFMX7uqmJ2n/nM+6tdSO0vAXLm84uTpSxkzxaRxYOCPilGKBqxtP+V/P9FiF4E=
X-Gm-Gg: AYBFou1fFgJCjYrv2pI/wfJ2CJmWMnF4cOlE8q3o6Ykob0N8HG+Pj9Y1Dkde8db9YPh
	1KQIZ6ScJGOqrohpnRqjHeR3Fyq4zOZlMmORTx29i6Jgmw7E0xyaYSYCDpEsiV1gYt/hjlcfvQr
	WpiYG8+39cuiDX/e+0SyAqNdS0jTP8KIs8SuR1JE/w+HA+bR6Plw/GuvyJKIgWJFnHSIxMOLLCo
	ndrSG8xoM9wZ4SxJTg3rToVkYCVXrzsavkQmHDn9dJzGbMWVW6zNkml7gL0pfkya5HfezYwWHj7
	PKFuZFkg/LjdeOeYS+Zpxpuzqz66yc1Bc961qx6ykdekWdv3ZKWHtM56Hc0VilfhLK9NS5KKGKp
	5CftkZWRJuL2kLL3rGd2NmBJxnbrbPeH7GSIFwE7x4UwPbemqr7tCPLeh
X-Received: by 2002:a17:90b:39cc:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39debf94eefmr4068717a91.8.1789378834167;
        Mon, 14 Sep 2026 02:40:34 -0700 (PDT)
X-Received: by 2002:a17:90b:39cc:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39debf94eefmr4068644a91.8.1789378833728;
        Mon, 14 Sep 2026 02:40:33 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:33 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:55 +0800
Subject: [PATCH RFC v2 07/10] arm_mpam: Fix mpam_dt_create_foundling_msc()
 to create MSC platform devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-7-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378765; l=1946;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Eup0TFC52Dvb5C0RkUrvytnZqSb5g4QWq/ztKU5w+8Q=;
 b=fXbWfUPGaOjktIrRdd0qWh/gG9DAXYutlr2e3ZmvjdmcsduoOF8c4KLO90VZPV33CVNCkTVC1
 Rxwgo62tnAQBpp4OtifMAO9MA/mDvKp/0V6F38k1t2gH4Muaj3j3HEI
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7c112 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rtFuv77GRgtEkpuRCi4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: GzuqVlkuD12zc-xqbT-IKmtBMIrln6Ig
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX2EUmq9E2syyu
 mEykvy6T7Ux2/gAdma9vMgbcsHX5qas0KVwdt68LiUCmO3a3kWIY/qUVxZY5tB/1eOYcuGhMfky
 LIend3jDTYW3OtiDpQd1khXZXqu0Meo=
X-Proofpoint-GUID: GzuqVlkuD12zc-xqbT-IKmtBMIrln6Ig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXz9/2c+7j0493
 RKw4iPLyUSQRWTyrS2PR1Ym7qvHt+RURfBX/17P/bnoQ02d2sYin6PbGzsm3hRsyg7QYt0oCHwq
 Czg+zcxgrxGzHZT4zbtMsWcrQoLZcfnhPPfVg5J5bcQ8nLXAPm/OMMQ8zXIgU6so7OlJTGNdxO5
 nxEUjnaMS//SW06pOc7oPPt3ANwI7d0j6DkGgmnZPNGISw3B8obgGctL0JFbAnNNuwpJ9tJpmpm
 IyD1MG4DCw7qhVXQRhj5GLiWCcqDFXdQ6ic2X1DlLqNEe6eYxAFPYYsRXGYjDSxPziQiBtdhPxs
 AMt+wYmb01Kex6c5Dut5cGr+OHbHxszIxcOLaB9HAruJkZsH0L0fcbWyKcviHoimyXVCsGZ7uK1
 a3F+I3Sfy2AcARnqATiC+FQNGU2mILvDPYoo2rq7EXR0FSjabye6KSCveOqMMncWCD1gbb8jO07
 apILU4IUJX2WjEa9obg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137

The original code created a platform device for the cache node itself
rather than for the MSC, so the MSC was never created. Instead, walk
the cache's children using for_each_child_of_node_scoped() and create
the platform device for the MSC child node, skipping cache parents
that firmware has marked disabled.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 480e38cfa86d..7ef3ed55b066 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2366,23 +2366,20 @@ static struct platform_driver mpam_msc_driver = {
  */
 static void mpam_dt_create_foundling_msc(void)
 {
-	struct platform_device *pdev;
-	struct device_node *cache;
-
-	for_each_compatible_node(cache, NULL, "cache") {
-		struct device_node *cache_device;
-
-		if (of_node_check_flag(cache, OF_POPULATED))
-			continue;
-
-		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
-		if (!cache_device)
+	for_each_compatible_node_scoped(cache, NULL, "cache") {
+		if (!of_device_is_available(cache))
 			continue;
-		of_node_put(cache_device);
 
-		pdev = of_platform_device_create(cache, "cache", NULL);
-		if (!pdev)
-			pr_err_once("Failed to create MSC devices under caches\n");
+		for_each_child_of_node_scoped(cache, child) {
+			if (!of_match_node(mpam_of_match, child))
+				continue;
+			if (!of_device_is_available(child))
+				continue;
+			if (of_node_check_flag(child, OF_POPULATED))
+				continue;
+			if (!of_platform_device_create(child, NULL, NULL))
+				pr_err("Failed to create MSC device for %pOF\n", child);
+		}
 	}
 }
 

-- 
2.34.1

