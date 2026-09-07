Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B231448E0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788744970; cv=none; b=Q6JZwibUHwfS8ZjpdD6JH1uWzq1io1WGbnVC/07pCgynJRh2A5mFNQ2agCcazHcl11e0IJV7+ZeUHJQA2QG27nMGfFnYMEdbFuwBKfCJGP6Y/TugrTjD7NOcSRth4UwsYqGb9jF4JwHVqZAYf2fsuCxP30euarrPn2AUTakaw24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788744970; c=relaxed/simple;
	bh=8tRPSMm1sjNSe/tfk+YCAAqbVDgLivTCFXSECEsou/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d0W6hj6WJ7o8yY+5jA19KRbfgEO0qhHoycBQHpQtifgqD4cO91SCDsbC/YDEb7NPZe6INuoGyKh/dJic3Jv9mgLCHFE3ciRV0k1q5eU1eQpgFPF0SjSNPatjcrOO2yGzAlaVERIX9Ay6QIkUWSlEUb7gh3QjW1A7gAluKBcOMhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XiJLvzA2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HY0zHJEG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XiJLvzA2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HY0zHJEG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6870AsOe2450087
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 01:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Gxgn9z2kNf2dZM1o5dqncl
	Bm3NNKWm4o5QPBqeNdpFg=; b=XiJLvzA2OB76FbsY+RpveaO48aUPxNXy2YMgWC
	+JhNeF5/x67f78FxIIvXxqqBHYOGgMI+ExjFZ+EcejAYLML1EfDxtp6joXl2+G8T
	x/mxFWSYd4YRDXVxM4TU3UezIG466qPHG7rN8bwgL6FcfDdll4/xBGVymmDb7nxY
	QP5XI2jRp+6KbMwh5RhH7/hH9/Pcz5AwT/WyzVtX+R84iZj+c0NteN4Wid+/VKyM
	UPLm+/2AmqCsQPwaOQjZEV6V5JZOD3FlyVyhwOwPb9pP0bKn9Xtr8ms55nR+zhKy
	CT0Ie78Ddt642G4yR82XYbqL3bPkKvJAjlakyafndmMwiO4g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq51jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:36:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc132709c76so4219924a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788744967; x=1789349767; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gxgn9z2kNf2dZM1o5dqnclBm3NNKWm4o5QPBqeNdpFg=;
        b=HY0zHJEGCWxlZdZc7wvm6+9S9Z4pe5EalV+YJeQZd64LGiWqZzkrrqe9PlGhzRCMt4
         Sek/GiiQGQoVezKj1MFRdDB6SYuSABOWxgzP2B41fwxTv2eRXzXA7uIfKZJXR7zn6HWs
         PRanHFuZC3BvDFQjIDJG1dUVC1HUw5ZZmL9GQgO4RWgzyMUWBTCVrtZZI9rSgb/DAYXo
         +EaBhoUrbhN56xwSOkUg/16L/voLSEdPovDTnCg9qacY9bxiaX0T3BvJ3xwV60qFrG17
         ZyqA93JprR398DX6uKWPqylxEF4XcfDvptR4ts2b0ZB+TbV09PrMAg2Xgzhv82+54vqK
         mj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788744967; x=1789349767;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gxgn9z2kNf2dZM1o5dqnclBm3NNKWm4o5QPBqeNdpFg=;
        b=BVOpsmsuza1x55fK4kOP6p6DeicAAJjpc2QzmwFUPNLKIR2AgxqBL8u4lcE8wRMPXs
         HsKenpfuVIxZ+7cCQrFb164F/7xxPaRPxPVGpFmrSwXv2vsU+EphmltUcQsusgDzPHw9
         eTFAXq/FOxQLOCFhn42hwTGg2wkrP5bZhnZ/7o8AFmgfIflkbvmmTxtXjCkL8HfEPpEM
         Gqa3dKZlqrKnjTBVEpoz0TOD0bLSTdxA9ZfZfHRwpiLrP1QnFXcq5EDjJ6mPM+W3QJH2
         GcnO5hsCYOkhWBcVKTrMMz3Ak0mAjVo18BFJutQDWPj4zdeA+q4JHCt8qOVxdJf49WJT
         k/3w==
X-Gm-Message-State: AFuF++nVXk++6ef0Kan6CO1KDG7nE2Ktpg2CsHh6ZtTLTpwO5o9Hb2hS
	UifMSS5HF9FB2xLqZ+9cVCdGDiof40SdJAvS9EmPqrYoCxG9c2BDX/sKcc9FAPjn4EkvvIX/qv9
	COkkJpL/nUAB48N0dH/z3LJ7N7od7RXiGcDBYsFUDanVRIy/fuSL8LFC/I9FVi+Uxvj4=
X-Gm-Gg: AYBFou0HhDwxYHt2C8RiI0UahKMuS/gRFsUjbDAsHssL6xFffAfUfhvUHWq5MLSFQwR
	7olI5YzqqocsLaIXCKQ6fntQov9rbJXxxDds1xN3xGwSgT7Inbn3cRMqut51COvx6iyBTkPT3W3
	IlbdNukQZYBc02Ox7aoF5epKWbq1kbWHm9oS4Y/SKDKs4rH1pJa0D1BrxMrwN+9jhbpadAti9A5
	OBMWPBYb03EHsgj2q9uPjsgMqxZymhXqtbi5bChBg+AgrF647JJDJFFqdh2zE542HuA19EfG2yc
	ZbnNG9c9PF6VqdxHZbSv2sNj+HFp5RyanuDNkuln8mOOaBbiauyGe+O09Lim9B1lZTNMbsUaYTF
	RfxsNxAwUW0OLYl+v9romqDk3eptxXsu/CcU=
X-Received: by 2002:a05:6a20:914f:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3da3a03e965mr29748227637.18.1788744967077;
        Sun, 06 Sep 2026 18:36:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:914f:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3da3a03e965mr29748153637.18.1788744966585;
        Sun, 06 Sep 2026 18:36:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm22671204eec.13.2026.09.06.18.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 18:36:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 07:05:56 +0530
Subject: [PATCH v2] arm64: defconfig: Enable PCIe hotplug support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-hotplug_pci-v2-1-7b4b99b548f1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPsUnmoC/22NQQ6CMBREr0L+2hJaU0VX3sMQU9pf+AZobYFoC
 He34NbNJC+ZebNAxEAY4ZotEHCmSG5IIA4Z6FYNDTIyiUEU4lScRclaN/puah5eE1OorDRSmlJ
 qSAsf0NJ7t92rH8epfqIeN8XWaCmOLnz2u5lvvf/mmTPODLfHUtv6woW4uRjz16Q67fo+TwHVu
 q5fnhiyv78AAAA=
X-Change-ID: 20260728-hotplug_pci-aeaf5d55d85c
To: manivannan.sadhasivam@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>
Cc: linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788744962; l=1321;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8tRPSMm1sjNSe/tfk+YCAAqbVDgLivTCFXSECEsou/E=;
 b=NYsa16OEvf+TnSI7q3Rq4XX/BzbUToOTiUDzkAvkPHIKxRiFiP8tEmIsB9hUlI/Sq37jOUANV
 BP72tokBvKKAdfx3nwjco8PVYdCV9fxhkja0fmShDabLmPCoOeX21CX
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9e1508 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=qIbWdXD6M1inJYch3NYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAxNCBTYWx0ZWRfX+NJKiYt+IQHs
 40fO3Somib9HXbfuQqWzgNdtTnaj6EZEz7kmOdAg+Rs5QPeb81Ym4A0NgbnwNm8UQRUc7A5J3Rk
 USryYSmLJ8Lm56j9xTFkFhjB8aYkpdM=
X-Proofpoint-ORIG-GUID: I9TqBVIWxpIjpxrF10iCtyNjfw5kbHfZ
X-Proofpoint-GUID: I9TqBVIWxpIjpxrF10iCtyNjfw5kbHfZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAxNCBTYWx0ZWRfX481SajXfwahb
 6ab3oNa83kWMcC9EDwEGy8RJFGB/sW5QP9gzO6P3EdGBdP8SvX4SfchdDIRvGVXvw8/MwRxjK+n
 9h4myIYlsgm5Ncd3BbN5O7h7R5T2gSHOXWN0/7Kupzk4ZiaM01lc77uTNKCxMevqiVMFrpyY8Zb
 J1GNK8LMBc57dWwhUky2uMwHLRQ62mdWjQYa4EajkhtZijqKyBPY/B+F3r8+S+HCflit/04DbtI
 kHw7UdK/svasSIM8a94sAvwSEUpXGL/HfZPIqN5ZzikEiqg2638LyQTedboGH8cGZUeAb/pfTQf
 uql17I1x9CCUOgpynuCW9iGqYpXP70NOqdacg0OMoz7gukVlk2wUHGE850i+JbPJPJYSgT8OWQX
 LuTXX0DZ7ZtRU3jPyrTFlRnfwN3kMuWGz55TZ+4gro6YHItCLu0UsfdZlV9rgyjj1D5Z71/Hxl0
 Um5Qg1LwyBvNoiOZnCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070014

Several Qualcomm SoCs, implement PCIe root ports/root complexes
with native hotplug capability, including root ports used for USB4
PCIe tunneling. Without CONFIG_HOTPLUG_PCI_PCIE, hotplug does not
work on these controllers.

Enable CONFIG_HOTPLUG_PCI_PCIE in the arm64 defconfig so that hotplug
works out of the box on such platforms during bring-up and testing,
without requiring every developer to enable it manually.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Updtaed the commit message (Krzysztof)
- Link to v1: https://patch.msgid.link/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..127f1134d6fb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -209,6 +209,7 @@ CONFIG_NFC_NXP_NCI_I2C=m
 CONFIG_NFC_S3FWRN5_I2C=m
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
+CONFIG_HOTPLUG_PCI_PCIE=y
 CONFIG_PCIEAER=y
 CONFIG_PCI_IOV=y
 CONFIG_PCI_PASID=y

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260728-hotplug_pci-aeaf5d55d85c

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

