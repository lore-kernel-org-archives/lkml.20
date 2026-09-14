Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EE142252A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378789; cv=none; b=sIPxBHH4AfYmLEAnJCca36d3+8zL825P9Q/tvjUfp3lm/ikHgoJZbaLre2uX2bhkcrQA7P4PUB7DWWyJuBd9bZP7UV4cnu+OD3wtofWNOYiP65Mabi0Peeu8cUmsTKoaqU7lQL3paPrHfaOseDPX/qLhjoLli3Izybc0TBqgck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378789; c=relaxed/simple;
	bh=Jy14sVbtBOA4INaXpzyNkK/bT7ygjH1r3zg1u0X4N9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7NZcsKRThzh39m+NDDocRakXS2QEUPoMCBrGtRDaJm08FEW3tv8VAkEmu5tbxUbY4Wk9kg6BW7LGSs/RN6aRQ7tXlwqWwiVG01XPKrVZ5f2Rr4sWm5sTfLmja5RFuoZyZikIdx9y64MCd+G/+eqBwTqqbgiYLkQV5fcBhH6LM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJwc0xs/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXlHuw/Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJwc0xs/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXlHuw/Q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikNw4057513
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=; b=KJwc0xs/gnV/VDUJ
	AbPpWQ3KScrRqB5m+kykYuRtCYi8CH0ADcKxgLqAD3GSjgfkqN/WacHGjllBQ27N
	Lqu7WHocHa/tadb82TF8S9emN6ojTDg252zI0ZOdI4VW8HZMSv0dkFzVD5Pfk9+D
	IybVvRN5jbYo1yae1kYDrQU+MhpTkRi89g1PEL2jwR4FJz1LUCos2LnToBZyVb85
	kk3VYBsZXtmQj2nPlGalwANd6u98BByZdM4Crx/TqsjDqSvX7uZ+bMxbawBrItyo
	rlUH7LZItb5OhqjSksgKJYWS7GlLoL5ml0dcZik0SDdxSh234Ew1aYzlwlEKDTag
	tVcH0w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsssga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:39:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc7337e2a7so38725075ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378785; x=1789983585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=;
        b=QXlHuw/QNlndKmqmpl7sM8RQk7Jpzg2aWBB4jSrKH8PUPbA12u4t/KnewGkp7Y8F0z
         m1XFISDkf4k6BtSC8YCDqCdVKO367/LWXDribl9+vjVSPCqPqdH8xRMEYC91pGcYw2Nn
         Cx/pCIzfasU1hfOZiqG+lohGf85J04t5SOOQeHiPxReNpb1mMW1l85ht7GCRyDyhmg7X
         1GTdUBkB4Ya6X9IWmMLfNF7ybAFS8cnyJZEnYH9g+SD+0VsDHzFruaczZxYrV8tjwnqy
         AwIiQ8Hn9OnCiM66jXtrEmacC1K2OUazWA+1yDVgmPr4eNehDR4SIvmxWSHSf2/0fyp3
         2yDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378785; x=1789983585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=;
        b=m4tAev8Gt7ZWJr058efiGZAJ47DZS01db2J4lhkA3qp61kAihENmC3WaiEbZu0Ue1w
         epdyamfV5K+RAMp6Iij1tkQ6943rMTAa/S/a+KVSNDEPkBGx9JWBsDQcPGGJymOdQGfE
         wMw+PQAB+ppxocx3w3EqAlxYbq1La+V/ICU9rF8/5l9kp+pHaVU4ZKQxzowl7FWTeMzi
         y7hGO8NrNhsNJkQmB2xtpdARcp0mhFNj9xes9FNBWQZDC89TBkulgLZHxfsLAmNePp4z
         hbgLT1SRDm8oVETjdbHGO9qTEWgFFuRmNbIlLT0FU4SCIUl6d1p7WDYUU9TOv6yj9+oC
         whFw==
X-Forwarded-Encrypted: i=1; AKwUvBymiPyoosQGHJ94+f7JGIgmZgBV3SzejcU0sugK77nnQIQ/8B0Pms23rwcOWAg1lSpkwU4KJvXIztCJKxQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m5jD6L/lXCvbh26Dx4GMpeZftKbaMz4Dl1Ig484ijEylWrpCgw
	crURK9l7J/3kVcgQz4stJRt1S4xbY7jjfW3iK4L8MDG8bPCWH5O/0NekF1VFfnL5awHWfhkr7Se
	Fn8Z+29bMeoOOK8NEF7bxHmj6HwHwdKHI/9/10jB49YEOlFH2m4CP+TCO4tBhYPWSeWY=
X-Gm-Gg: AYBFou0Sc6VJYa/pLDYA/hwitSc1w0cVAXxg61FGGHo9XqBzia3cKSOIMTLoY8RrSEi
	c3xg8C8YQa/lxGcLNHyLX9Yc/BiNICF+bmVlGhI2tMd4tkcEZRQ1BkGAtAVtTLjZpF1xlk/3W/p
	ioXiJSeZpLKgTMFpWYQGlIEvTLKGbzkUY/6t/Ju831ybxIQZblx6Fnbq/X0YEST1VbnHc4A6ind
	uE18I9YEACSHauV7v67iz7Y45OI+yB9vQf1T5xZWpCxMoFHa1QPtA3/D6WiVFPE8LdjW2Ia6+/x
	F60q2z0yDw+dh7HZuA9HUF4/FvXJfQqC6IAWiIlH+OAAAv3+d5mHRxA96g+DGPxc02H1aRNZ3M9
	A6h+TGfGUbJpLruArRjNAb9Vby+hkEfRDVru5MWCVvwWfWO0TFI3JC/2e
X-Received: by 2002:a17:90b:35d0:b0:39d:efb1:dccf with SMTP id 98e67ed59e1d1-39defb1ddacmr2679921a91.6.1789378785526;
        Mon, 14 Sep 2026 02:39:45 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:39d:efb1:dccf with SMTP id 98e67ed59e1d1-39defb1ddacmr2679850a91.6.1789378785086;
        Mon, 14 Sep 2026 02:39:45 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:39:44 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:49 +0800
Subject: [PATCH RFC v2 01/10] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-1-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378758; l=1084;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Jy14sVbtBOA4INaXpzyNkK/bT7ygjH1r3zg1u0X4N9o=;
 b=8qVts8kvOfruxq59KFcdjO9xhhSgezIyTV0q1/20EcQF+DfUllQOZoPY0Owrd4E15wWT9eUt0
 Aa/3hS1ds/7BuqTY+P0ocnYLZ9q7OxXK12q95t3cvNkvuz4MnkRAN+f
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX01NIh2tO2oDE
 AO4Y/LUDrHMOLXlY+RDta8f1XUHTypKllV1FuFbwyY1EVA9oy6L1UNQXiZvIGWbnWnHFsPx8IYf
 bNp7I53XsWbguMMQA1kzg6+NGRaVqqJwvg+Yny2D0bsyQ4cs+fjScPuhPoCqR41RC4qXGtZQ7ma
 UcKdQlMKH0VRyanFhhfqYc4bV2OdzHkFS1tiXV6VgPC+lto86sNG+VRlqnY8Du0VdCBrfVyB1Jh
 g6fP/kntSnW4lS1fhyqimB6yvPBDK+em8Wjc19A4xWCazkRkKovGnL/VDHwGd5YlfGtf02ZiuJ8
 8s5JHtARNIKCfVrhvxTW7oIKrn7XQP5YWTxBzZutyMIJU0M4okovnqgFkRChlG/O+U8ZEghyHIu
 ZvVsURgDSqb4qEoHtE4pWdv27BW/VBSBQRn/A3cQcIcmR5pmBWzG/dCXv2/KvFnoYBvGcJabSZY
 FYQytArVVY4jPMEN9wA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7c0e2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: kUlsc5nVSjMBXmUUaD71RMOD_oUiYWtf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX6S1OiiQyEkl+
 X6n+5VMQ3v9IBjB6SvpVnbFLu+1rs02sv3xIhzi7yHl+UhDjEd2n2NSHQ2CyiNo4aGqcPfHsWHE
 p9afKVMhq58mk7ST27ngxqTanXk8hZo=
X-Proofpoint-ORIG-GUID: kUlsc5nVSjMBXmUUaD71RMOD_oUiYWtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..6da217abf689 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -552,7 +552,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

