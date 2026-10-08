Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE4B3C4553
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442088; cv=none; b=agIG9SP+fu4g277tLTf7FnAp0VvR1DD9o8USClbHbqh4SbFcvHgKDXm3OW31RqmGgshT7TL7wACOQttHn8c0Cl0QgYOeyHYpE2bGhGwJAPGAyB2GIRaMDLl297k7JTxMaPbNWCiIaeI0OtfyPPj6pZgM5OAhmZ4Ay9OCTWw1pus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442088; c=relaxed/simple;
	bh=kmEJ3h3BCBciNsEo0HYcrYwwyoiW4wt74444qCBaBXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tflTPNp4+JPpq7QcvxAReeuk2E6tTVJdhRvorzWsukQ723dCm12yWHfTDHipP+cuDMSxKl4ITJvRCXCpzfy04VASym4u8tmbJqxca7ybe0x/fjzYZjF1QcS86VdALcmC2+CcWLujqzyTdkE4Dg+UfXd0kKcwmGqW0G2jxv/fQnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loTaOGp4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MA2j9o6P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loTaOGp4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MA2j9o6P"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BrWV314479
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fe3v0gUYbBBMBNCPc4Rqjw+lQuh6LCbM/R2FTCITKuI=; b=loTaOGp4bx+GSRMA
	SUqbvQaP20bIMXVOvndQH1hMXClnypRT5w6UPdhSaWGRCS1QT9P2h7gQMI7jbLwD
	5ULwANBh7apTGOSc9bLOB5gyJIf5lIc+AVK0rdhHh0qiF4034yDdf7wIuUauwpRa
	S5FAufFnwy4XjKV8w3jzc0dro+wkW+NcPRGCI/ifz2ldfjW/Dy00aa9JQC6Y8SR0
	rE6yLUvvBSFCElpr0WDz/gJu9XqdQ+0pqtlyTctNGBmAtZDCdiN0jYhC3hAT+3gv
	Ug/vR72vXyGca6RnJk119s7f9nKoYHIlJ3d36QoehOsXmpy0vQuqnTCy3PcuoZrf
	2yFwWQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31g2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:48:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so1388818a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442085; x=1792046885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fe3v0gUYbBBMBNCPc4Rqjw+lQuh6LCbM/R2FTCITKuI=;
        b=MA2j9o6PVbibW2zKGH5sMdfiW5NtroZI2qRRYMpqg09YKYuPCCdPbuZJDvCRM0AEI6
         IgNHgrG7itnV6kkwxTv5eFmSDHoi1uUgjyoYKiEVidxbUi2Xx1oCHurs/30tyRxyIG7G
         zsUNghKeNOKACjd/lTx4Hkrg7I9uJTZBatqZBNi0nfdNqa2Y8Bp0sOp254i9smp504hf
         EDUhg6nlcmWnUBgj6ORV7qbSAOPoIIOZ/Glt5/+dzUX0BUJisfQZ676zyJ5sTa+/tVuf
         eAWuSljANsC4qIK2ZOzrvM1P6PcuW7GHipQnqZ6d5ZxFtF/ic+nbcozCGPp/UWMX+zSO
         bzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442085; x=1792046885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe3v0gUYbBBMBNCPc4Rqjw+lQuh6LCbM/R2FTCITKuI=;
        b=PzRL7MNDbJFsoqtUYC4IAYNwMEkwN3Og87Bl1ztU8ea10YSsYsZvCaSk1vjgXEHLCO
         BFukDprNr3h80urHTCMvHxSePC0UX2wORbV4RHr2AMupYq4ci+wl0KIopwPQmKCLMIAZ
         TrwPGmZ9n23UrocbjiGccyiZYk9e0RP/zcDrkyjw/bTksvxf98ca47zb+8FdDlq9hKpe
         bOferFfUhebY5HFzFUUlePv0JzGy9AOW4X7VrxzjZzAi6/XGS2GJ5WbkBVmZSuvR9KUF
         a8XaonBe4USnr4QOhZ40A1kLGGyq0p9wRL7CdjqtniMBHR8alQxMb8qP7Eo47uF4c3US
         4tbQ==
X-Forwarded-Encrypted: i=1; AKwUvByt7I7oKfc44MaJWjreBe2J1Eo5JgX86vlDqa+pSY0s/ldgt2FSFnHUtJ5kCLt2Ruy4k655Y3DoGmNEIVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfWMfZskNYUXelxbrFxxvZ5XRb3a9ZQxPVIScYzlV7YVI8JAvj
	0iwONJxQyIqL5gyJMmU3jCH/u1Ij6Cr3k+3GlgRWidg2yc1LF6lsQWPc0g2I2IyaXrlqKA2wPva
	bVkh4VuN8od54jhg0r31iHh2jQF/rkw4oMRucITgGbpzk2waoz2EpFHnLcfFhOXl0JVw=
X-Gm-Gg: AYBFou0DAdN3KPcOhQO3pqQr9/ZTzgbF5gnF1VRCp1DBdxtZW7V9+/nOgixApzPWDmb
	jvqgvVkveGnHHLgAwXIn9vgJCriOlI9Wj8MZ2N/DFxTY4oJJPS/RV9d+Pq6GR4B6yMtHK4S1/b3
	oEqdouVUdNbL71Zi0vVdoBRigYi9waUKNwYhonVxhhJ60fYVyIya2edDlVp3DQvnEQJ2g3qUaf/
	hfhrwA0j3TzWXkLhv5UYuOkz2Ldqx3ZcDKINGJYc/vE2ngZMCxuEusoJ4ACdOGiPxcNozSO5meP
	+dmrODPY901okoPvZvqa7UMnN9xRO0TB1K0ZAYzykJr8IdpTS1AiPYHtnrJPJYrxLMK6vgsb5Mh
	V3tLpOBXc/9Hpp+qkilUCmNI4ZW2epJXfVPSZ2j0+PDuAcwPBp04w1b0=
X-Received: by 2002:a17:90b:288c:b0:3a7:eb0:119f with SMTP id 98e67ed59e1d1-3a8a0f259a5mr3337610a91.43.1791442084979;
        Wed, 07 Oct 2026 23:48:04 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a7:eb0:119f with SMTP id 98e67ed59e1d1-3a8a0f259a5mr3337594a91.43.1791442084504;
        Wed, 07 Oct 2026 23:48:04 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:48:04 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:15 +0800
Subject: [PATCH v3 6/8] arm_mpam: Add support for memory controller MSC on
 DT platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-6-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442025; l=4057;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=IyjCt9e2HWnLpXHhmvzVNYem5pb2CZCxUbGNx8XbqAM=;
 b=AbRTdccivHdzG1PG5LEspniMT8sWNpqFZ3ke2ws2IwfWLlLEzGZ0uItRckFXz01pJZNhCd96T
 Qyy1ZPJVHLJAafN0YoLbiByqNGfBfH+Ema7zrFZkTpDEK/kZNEeguTc
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXy7zcU8iqCznQ
 AejWOVfkS7wnzlH/JUJPnCCgS0vw8sc0/mnV7/dTmQXvG8KrSxtPEzEWYUnLt1kPbHs9lIhUtDi
 ePNzFxPOM4dzOtoSRtkGsUtL8X78OVzkHwUQw5mluIooMUXJGY1yAI/1NMuvHCaI4ZQ1LMuxfDo
 Zwc5dslhBwYeqORmYbmshMK6DIIH4wTj5z17a6rJ85l2xuKlhR5cT0MNXe0PaDCF4xrTye1vHU4
 wQBWpJLaab1w/hTl5vBgqqARzLqS09JaH9s03M7ZX9YGxxrOd+5DxlYmqGQ1mu01hQX47la+z3t
 GJJkHV6oTIQkCApKsgbFrZIsdNM5m4PK6MxqLOZDP5XuYzZRRgrDoJeeyE7+ib28n5KmYuJ/Lga
 qufJjeXZbtIvXJF5M95xb6UVX5dh0mbZ/5PGd57Hx0C/668aUatLtpRCFNzAtaHHCftF2Ia+nve
 me89exLHkfaTjfpi48g==
X-Proofpoint-ORIG-GUID: yNLRP3GfcZKjixZlFt6fKdfJ9o-szCZ5
X-Proofpoint-GUID: yNLRP3GfcZKjixZlFt6fKdfJ9o-szCZ5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX+aljKoI2WhbS
 nT7mISpiLPuw/HmQtJU+ZekOhc3/iAZo7yc7D4yUH8JlnBTNwjCx9Lf2trESRTu9cSoArFNxLFJ
 4YAcs4bw/9bHZ3FfV2AvW2vZbD2gRTE=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac73ca5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YM9RNYZJZtWq5EK5GGEA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

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
index 0640690eae2c..048d32e69f55 100644
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

