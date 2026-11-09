Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218887;
	b=B+zyYe/3YEVlFcXMYzviT/mlA5LdjTTfgRsqiUcmiiuwdIJKTETeUC634OAvJTApbNbm
	 DkFioVkJKYKx0RuxeizDNXUSKVYY4s111GhVfbBOrGH7bvkT3HObYqMVf3Rskpl+zfuOB
	 4ioJuKR+tQf0nyFXgkS8ZIzSHopDHof+HQkVvlPgZdnX81LND5ynRWyls6Q9QDaZikVUQ
	 Vx0IGZrASRpxp8e2ZYIIjjjVy8z5T3sRcDd+VCoAlWiqRr3SkjaDmnrBDwRuEi9NZNnpT
	 D2Z45U9B1FTHQp6Y+xpkrlinO4PaysJm8PhVvpEIXu4RxUBh4C7iyTXfnnl9YxAtE7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=;
	b=zA20mvpeVvDYmkNBunl/wJ/nxKRv6VQY55p57CbeaoHmemK975LqMx/QgC91k9f4tiRC
	 hBicaBv8/kobBYWpPbq6O6+lH4QDGgpMlgKcOX27gjalfJfyp8d5clfTzK6P2Y/m+qsPG
	 r8a7nXn/42kOjGLKt2IgonA+2xlOKo6oeH4XIcFx1c6yWZYZkPhoEBXO1ntRIgXPtpl53
	 q61e8U/xgNOk7gaebIfz6QLypzcS991661i5czgzhJj0v7chp62DyC9kDMqovMLDJuBBm
	 72gI/Xy2m0wCymcEs6VJA2UrSJM861u2wv0ynmleO5au9zH+kHVWLWiI/1suNNDXkeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GKXgB7yE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W7aJJPnH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F496082BDA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F496082BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GKXgB7yE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W7aJJPnH
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v5Uj561978
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=; b=GKXgB7yE4Mv1oFqh
	ygUrAW9IFXSMTPxl6YO+3eOOH0fhJAjY2hxHMaWH2FRvPjt8nsMCa84XY9v4WXaZ
	9EYp/3/XAsDP9/0RVEYAv0+Hs+rcTiM9eOouFGiH+VUUSPGh3prb7aZTwxOWNFd6
	AlGpj8YGcp2FJ7uEPL3Upt6vwpa0obnzZ0dOISjdmvvAapVDIVn/aRv5UinkfnB/
	u218ecYj2GtQCrJWBayTNGT/3bri9VotkQE3/hfV8UadgJM9DJMX2HHPSfc98zYw
	3RoCav7d40LsJJq3L7eXccu/7K2GYC7eaXtq9Snh/n1zKo0Ray9aOwHvUs/o1eF1
	1Zsv5A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdvx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:08:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd48746a49so421217a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218884; x=1794823684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=;
        b=W7aJJPnHIa524oYBq4xdgV5W723GiSX5uJXjA1psSNUjYRbe/oJentu0Hh1BfXWJFW
         649OwWyW5/60CMuZQFMle8ulbvAxB5YTPcmhwaE/vDnFX9EGolVkEXPyn9EFvO0a1VjI
         3Ka4nafCPxvd+M1HUPg8U3vqEJjpJuubzRFgKrbq6RZ9CN/Lo+qZ5J0p5Vtrw7RSiSXY
         SpRRxXqXIB5JK5AaISFkKPR93Hqn7GNu+GomYw1PNd1mQ3B53cVrquaJE5iRIp5asm4h
         Hwpj0Y7nji5hTxDzSkzOvVna/6Vv4/V7N3ptDqwQis6xLG7N3W2rpe0nlX5/tWUXHBj6
         /eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218884; x=1794823684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=;
        b=B/S5zc/dkaHc9VGM9c5NlkHgLUKl/2UA+PKEDQyNL3rflndqt7OPlPPTkU62/Oro+y
         PV5f4k7sdahoSj9E4+3rm0RYpg7qvUlqB65zB07CXxjJAHu6p68JftyBd+Rf3yke3oWc
         5EhJ/uTdEy+gkgfgLqPHQ0cWlphTpscOatEsV8s04dKqtZ0DBab7V8RaWeHdpgmkr3Rv
         AfDcWazdNrQqPThG6CthtzB/FXRVkyIobRXfjk77GeT/MAVtQEpJ9zOhTq+4giwZiFk5
         n5kp3rjDrA3F1/c+lfM1OYhkpsl5AjPJoobSul0bSuEU6g+eNigq6buMTVli3kVZdqZB
         b0hg==
X-Forwarded-Encrypted: i=1; AL+hErFjtq87bZyrBuJAH2q5PgG9e0HzUOcL935eIds6dbsiCOcrbtKDrzIeL88jMygoOOTDvPl158X0dlz5Pok=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ytraHLF1czfHLaH5V4pTj4uiUqPs0Zo+ie9LxtyyN8NyDxA48
	2f87DJBUfv367XY3kPZN3PjUNpowoRqjBYgFV/cwzQHD+3GpiijVDlcrkg8UsccwMp4gLHLel4n
	7lbL+7bGDvyssYsD0+61cPohgmJwX4OPc06NBW2lmPQxzEm/ZyOXVk5Clmdk8kQVLVaM=
X-Gm-Gg: AYBFou28Jh0OzJg2gZf9z05AxD329AxFnvR5aJrz8XVecnVlHXGbh6g/FUpVFocVk37
	ycLK4zzyM8Ms2ZEFzFGYRuq3hxNZGCjOyFCynuMloPTFQDH68XoZKc6/DmDlpu8hS56A5+F0Mml
	FJ/3baip6Zr6FSk/KDt7ZSWlIXC52umLF9M/z23UxoRE5p/LsqcDue/IZjaUe6lth2Uw79BBeUB
	E0YkFRpGO6fuD+X09O+0WgJgeodBEkH4lOwzCPbwTlMjWbSscR53SygSnLLf0n5cJQV7foHW9ZG
	9fRf0w/BAtmudsntcbi3bxAKPKDTwkAHl3i0Wms5drm4OYjwXs8GQFPfSArt43ut7t4evr3kfhK
	fVa89hGovm8U5WY33MvA602dZIDOR2gwqz5+oL3lYf5MRyyKCi37pTqFFEyMuWTFEZJhP05ZtLo
	kBONleouUyzt2tMrCQ9MFgTcDC2Ili
X-Received: by 2002:a17:90b:54ce:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3b12d57c488mr3115045a91.44.1794218884201;
        Mon, 09 Nov 2026 02:08:04 -0800 (PST)
X-Received: by 2002:a17:90b:54ce:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3b12d57c488mr3114999a91.44.1794218883733;
        Mon, 09 Nov 2026 02:08:03 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:08:02 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:38 +0800
Subject: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on
 DT platforms
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218819; l=4036;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=SVcR+hwi7W8WiyGR/9ZEtnITz44WeNpESQ+Zf8I0XbE=;
 b=JjDWgv0VXlw0PJfE0V93nb8oTc37DPPbjQTjoe3GHNpeRdv9e8sfXmLcZGGjGPiF9B66D54dx
 GKk8AyJt6vPAL351yRRkOtyss73IJPxqfW8q0RujnUA70L6H2N0pH+l
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: yIIrDTeI5szBibupcM-xdn27PJ7hlxUa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX89WoGEgVHOHX
 J8z7jndgP6fsVDPvXdjxSnebTJMlLnsMhtRyGVZt/TCavcjVOMmLuHVLRLYu5OMVVAowFr3Kz3w
 whzqH+AJaML0o3i81DwvrZl8HUZPsNI17xX4MEq25fgIlbdduCauOl1bA8vB6+AgFGmcbAmDUma
 siDVWh29pSzh9mey1gcVPEOeQ+EjnatXjWAcNzNbEWkQ5NKRSOVZcvpLgDGL7IgEsgrgXon0nHe
 BJrRIypQkzADBs3ytndPC3R2B8rZ3fr4hGtCVNY0pkPkuAL/2mY7hGw1fh7dv3en4gsiOC3E+t9
 WY7vnHu61lj7PFXhP4Tre6LnicV1/LU9XgEoVNao8RyP35q6hzlL8XuyED616FHzBnJsXlUoP9J
 CWY45nB5oGv0Fv7P1HBFVg7mxzGL09WikEwte/vzhCMjXi4SOtLPHF2c7iUJ11NZ9vFY68WUAOc
 NJci+RkQhIsJZ46q0Aw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX0r9iSuZ9AKZk
 Fmew1DeLMVuVY5XkWLO4NRVDAEXrdky+sbqonV9LCkH5pXRodaCX26Loh5Z6XLnd+z72YRNEscS
 HaLKgy0m5PygT3b6hAseJGMGRkW5EFU=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af19b85 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YM9RNYZJZtWq5EK5GGEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: yIIrDTeI5szBibupcM-xdn27PJ7hlxUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

From: Shanker Donthineni <sdonthineni@nvidia.com>

The MPAM DT path only handles cache MSCs. Memory-controller MSCs
cannot be probed yet.

Add support to discover memory-controller MSCs from the device tree:
derive the component id from the NUMA node and create a 'memory' class
RIS, and treat a memory parent as accessible from all CPUs.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
[ morse: split out of a bigger patch, added affinity piece ]
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context offset conflicts; use u32 instead of unsigned long
  for component_id and compare against ~0U; remove the unused memory
  node reference in the arm,mpam-memory-controller-msc path ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 54 ++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 78caa8ae1349..e0ac6ef83d6e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -365,10 +365,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
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
@@ -377,27 +379,47 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
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
@@ -2574,6 +2596,8 @@ static void update_msc_accessibility(struct mpam_msc *msc)
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

