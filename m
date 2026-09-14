Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4B0423788
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378830; cv=none; b=ppCh4lRY161+LBfGaUPvVvDA0ylgaLo+3Kt3WpMfjeqqrU08WrQhxL3C6ocH/8Vy1RQ5/gTKAT00pV0OkpyNHmjycBR8+KK+/ehSc4HYc6jWSnV4e2j47n2crPcTNpWX64oBwIJJ0cjBLDqujLEDQIqCovr82hXGZ6ljYVqENuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378830; c=relaxed/simple;
	bh=1RQ7P/dWp7OBey0lplY8RLtPZF/1STFcgfAyWMzstnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLnVs+rhiTYQbG1ZkmW1V5MGyXA/5B7M7gTxuMZx/LRb2avi6BmzokIuNVuuPVxcdmN4u3tnEVXBdl+MsgvWrOXoe2l1gE310HDPzcmFaIYvLooyWF5/m0/9vQrLubQvnueDISGQpiuNPAjY//ejQXRqf1Y0VCluT8AxMufZFNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLuri/ZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvDMy/A9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLuri/ZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvDMy/A9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jUbX3740843
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVYpLMQ75Ps+YlBbbpsUx3nDLsFWRA7tNL5NlwEkWCA=; b=SLuri/ZGxlWJF7WO
	maL/CdBolq//hxWNOy/ChbIIXq8R0VX0rsEvYTiBIIT3jtev4t6mkEXZaK94t1WT
	RU/DFLTTQdoqev8ym3QpxGm5gzFg6tZM2fLSFMCnAkjzsrwWT5XniJCwCZGaLQav
	upIESA8kkAhfpsTMQnc8co02rV+W/hDA/AzcfIOj9HeIQt80bvrrNjdUhgV19B/+
	FZ+rqFRwwG/OrPHmaob4PSCbkbqtX3hyFse/uFoNXKY4Q5gMQO1WZHU5ULxul9/+
	E7nRVjk1tW+k/W2jr5Gbj9GYoPOGRGFLMrMBPhnZt+XCvDc+fX3k/lb2qhG0QgGi
	CvU8qA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddyvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so6718290a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378826; x=1789983626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVYpLMQ75Ps+YlBbbpsUx3nDLsFWRA7tNL5NlwEkWCA=;
        b=jvDMy/A9X1O4ROXUZTl57IDfCRk1WNP163BcU1OMFk7+YyIzrYtGGV8JkIC+efqYrm
         iyaJjnzT/Z2rZxAVOn+FkG0NQQOzNyKCyntohbm3c9D28N06QD8zmUnykwSak1xPkuzu
         084PLzv/utNji6fGyOhLy0fxawD054wcbq/yPD7yg+LatVopL0AfLDlIR+USyNTs5CEj
         Tac+TunmEWd3CWZlyrjRvUXR3nww1FzRqEQvzSU89e5z7p4OM9AFrAQjcf+1Vu7dCTQg
         Sj2BWudnBqU5Wzxv34fZ2odnLDfzpFOQj9uk5sGH2HgXUPu0X2t4oIpyhsj2W5NELttx
         SgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378826; x=1789983626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVYpLMQ75Ps+YlBbbpsUx3nDLsFWRA7tNL5NlwEkWCA=;
        b=dJWUbLLevNhjcWY/j3DNfkj2bfdLIUqFA3H4WeCMVer/JajaKUZiDsx1B7wj1B/Lbf
         Ydf3KB+iY5DrXJPT1+sVEZPVNQA2LnMP1QmR0Usa7K6f/Q+/1a8s4rkaLKxJO/atEFQ/
         NFRzx9WAPHKH4Vi8tZknzLVMdPO0VNIwjFHqGngLpr4kpR7Tad8zAfXFUvlHhmgJKboj
         a3gHPhrrlWKDxhsHbe7bCK8b8x7dEIHbO4qkjyJ2SD2zuUTN0fKZ2Ufalk2AxVrCMWZo
         ESCvEmB/E4tvLLpXmO5aW7Ep6UHO3HDDC0BVoZ1vEGj3QS86K/0NuUGKge83gmriDwe4
         qfAA==
X-Forwarded-Encrypted: i=1; AKwUvBwO0jhnS+08HjJ+ouOgsETGteYBhHP4UxOZhAhB6gCxzTxEfkKeXabqne3AXzJqvMsTp3QUG1y1aw5KPtQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nX07SWu73nkpJD+v/pFs0U+lZ2VQwZvZvrUKKFo2syHAA0uB5N
	UQfHqDlBbYDXFu+ekxve83J1eHPHSDnXk3/YLRG2t5ylIaM+ovw30qnDiVwndRe9JeghQf6x8rT
	cRUIcD4kiVAn3rp5gQU65T9Ci/QUPQQiN2T3eL1GSpVUGwhHD2RmlmXAk3GcM8jUx/2A=
X-Gm-Gg: AYBFou1Il8u9uS5I7MTAlSkC77EEcyZ0XAcFGx9yQIa41s4BysBUHU1dOYBJSc3a3G/
	1z19NcCriVbI4DkTustQ6GCHTzN7xd1xJ9JoqP/nw7A6O3gFTM0ow3dMf+X7JSUhwJYzO7TYcZ8
	6hOuRlVYNLoTWCO0uBuSj4X4IHBvkfWpKgvKxGXkMrHN8/HwCPFLcXhViRmRkF3gB/nNehb1uzi
	BDay6t7upDGh70/y1M3Ip1pBBOB0HmaMjttHWw2553Th/UreriiI6yrwhE2yw2RkNuuZ3qtX1Rr
	PMXsNSYNBl074PelX+Ao8aNsAlja3j7qYmLBsKI0rgN52hmCCd/fAN8hgPs8V+YL3j4DrGMbXrm
	OnntFHc1gMLRe6dlgZCDesJIY4NULPR1fiRl5JsCAtCrDqqx2N4NPDS7P
X-Received: by 2002:a17:90b:2541:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-39debf6bb19mr3764524a91.4.1789378826200;
        Mon, 14 Sep 2026 02:40:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2541:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-39debf6bb19mr3764448a91.4.1789378825789;
        Mon, 14 Sep 2026 02:40:25 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:25 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:54 +0800
Subject: [PATCH RFC v2 06/10] arm_mpam: Add support for memory controller
 MSC on DT platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-6-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378764; l=4057;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=+NDfa41WasI9nPmv5C8GV9yjkaezFDn6xOh3LjQQb2o=;
 b=nndB5WmbB/5Rn2HufOKANj4QsiBTb2AeSx7P12aYsgZMX7fASXgh9AggBJb1dAxvoBx3dsxT9
 nqcLEqfHz3aAmOqUgtuzElXzhj7LhNQOHqwbkckULfU4KRlR8BwVQV3
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXwz3jTjCnS249
 D5Ve5jS/gUY9xGdNUpH6SPIxC1rbX5acz/hkvKkkD8dyi+v8KyT047ZZwnHqiwohtln2XjdSMFt
 /Rji3jZDHLf+hm6Zf0y2zP9ZXIdXvhS7tRvaP7Ziaje8M5wDIbCfWLQ4l15uNPCb0D2biupE49t
 D4K4L7cXTEdqhFujUpNC+9GX8pztjGUV/hDcCfvHsOP7wihmLKMS+cgj8LWSf8rXLTGs5ef5Tl1
 rhgCWogpnCj5NAXfpjGYiNcOPJl3ai66sreepoydGgRqszyIXoyRJe60EXFifldfxWbQI4QFxd/
 BKAMJGwvBrYEodvCaWamIKAKi8e+GqbTE19nQfpSU468+USy0RLy517wrjmDOkaxpdmJRq5KyMr
 tF22gsQkS7w+wOR1+iU+z7vaefHL3bRzycxUkE1gfiNOt4W8Qe83zZ4HarT04VyPnxCHu6GF1VR
 DXhms0Wjij3KKIoXfQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX34mOdoHS5Y6H
 7I6lkTJ44nHdBkvidqLetYvMfTtQOt7OW8VuJgtoScI1pscu6KgKH/Y1EaBB4IEhdVLrI0czD7h
 +vhOdE2/F3oFnR1AAQQmWZJTm4I4wRg=
X-Proofpoint-GUID: dpHjAh_8l3mwrHJum1U9dm9IAE65v_rp
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7c10b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YM9RNYZJZtWq5EK5GGEA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: dpHjAh_8l3mwrHJum1U9dm9IAE65v_rp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137

From: Shanker Donthineni <sdonthineni@nvidia.com>

The MPAM DT path only handles cache MSCs. Memory-controller MSCs
cannot be probed yet.

Add support to discover memory-controller MSCs from the device tree:
derive the component id from the NUMA node and create a 'memory' class
RIS, and treat a memory parent as accessible from all CPUs.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
[ morse: split out of a bigger patch, added affinity piece ]
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context offset conflicts; use of_node_get() for the memory
  parent to avoid a refcount underflow; use u32 instead of unsigned long
  for component_id and compare against ~0U ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 55 ++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 7a5b27e87759..480e38cfa86d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -263,10 +263,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 				  u8 ris_idx)
 {
 	int err = 0;
-	u32 level = 0;
-	u32 cache_id;
+	u32 class_id = 0;
+	u32 component_id = 0;
 	struct device *dev = &msc->pdev->dev;
+	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
 	struct device_node *cache __free(device_node) = NULL;
+	struct device_node *memory __free(device_node) = NULL;
 	struct device_node *parent __free(device_node) = of_get_parent(np);
 
 	if (of_device_is_compatible(np, "arm,mpam-cache")) {
@@ -275,27 +277,48 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 			dev_err_once(dev, "Failed to read phandle\n");
 			return -EINVAL;
 		}
+		type = MPAM_CLASS_CACHE;
+
 	} else if (of_device_is_compatible(parent, "cache")) {
 		cache = of_node_get(parent);
+		type = MPAM_CLASS_CACHE;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
+		memory = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!memory) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+		type = MPAM_CLASS_MEMORY;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
+		memory = of_node_get(parent);
+		type = MPAM_CLASS_MEMORY;
 	} else {
-		/* For now, only caches are supported */
-		cache = NULL;
-		return err;
-	}
-
-	err = of_property_read_u32(cache, "cache-level", &level);
-	if (err) {
-		dev_err_once(dev, "Failed to read cache-level\n");
+		/*
+		 * For now, only caches and memory controllers are
+		 * supported.
+		 */
 		return err;
 	}
 
-	cache_id = cache_of_calculate_id(cache);
-	if (cache_id == ~0U) {
-		dev_err_once(dev, "Failed to calculate cache-id\n");
-		return -ENOENT;
+	/* Determine the class and component ids, based on type. */
+	if (type == MPAM_CLASS_CACHE) {
+		err = of_property_read_u32(cache, "cache-level", &class_id);
+		if (err) {
+			dev_err_once(dev, "Failed to read cache-level\n");
+			return err;
+		}
+		component_id = cache_of_calculate_id(cache);
+		if (component_id == ~0U) {
+			dev_err_once(dev, "Failed to calculate cache-id\n");
+			return -ENOENT;
+		}
+	} else if (type == MPAM_CLASS_MEMORY) {
+		err = of_node_to_nid(np);
+		component_id = (err == NUMA_NO_NODE) ? 0 : err;
+		class_id = MPAM_CLASS_ID_DEFAULT;
 	}
 
-	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
+	return mpam_ris_create(msc, ris_idx, type, class_id, component_id);
 }
 
 static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
@@ -2169,6 +2192,8 @@ static void update_msc_accessibility(struct mpam_msc *msc)
 	} else {
 		if (of_device_is_compatible(parent, "cache"))
 			get_cpumask_from_cache(parent, &msc->accessibility);
+		else if (of_device_is_compatible(parent, "memory"))
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
 		else
 			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
 	}

-- 
2.34.1

