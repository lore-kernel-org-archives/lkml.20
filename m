Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC9C4AD7EC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473834; cv=none; b=Evkn+dkCDgWhGJL/ru3+fSlAECFa4cBteZoXUaoykB1MYidIhuamIS23KJL3XE/qnM5d+s97RrmHL13hIXNvGBFSxYhsgN/KrwYaA91Bu8S1h6+klxWmJoXTH6x2q0Y1GN/HJy/CROkCwnoU7UtvPKlGsjv5DZwfUhNKzF0ShVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473834; c=relaxed/simple;
	bh=Vu/qOKjDSCHMscpTGAgvAhSIJKvZ6VpKbHq8SJagBkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAR5KwpS3qh0jk9KaONASdpRASIcrcmS0pj6u1ZpUT3eidEWn5ZoGQulJCW6z/cvybr+5Iuj3ogURMT4H3jD1GFTQqmdW8S9R1TqhuyzzuRlqfI38zXomEsDJ383KPc+aLxQtGCA7K5fvzcnJJU0hElSPWxYgjdzl83NZFJLFmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVRD+Y2b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APvCsgbN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVRD+Y2b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APvCsgbN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gvoR2584537
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWuTRuraK8gbjCwKph/KhRyuid2F8Jq/XlcU3WwTW9g=; b=ZVRD+Y2bPjQVE5iJ
	H/XvtgJ9LxWybZBmkZ9p4c+7FMkVs/TqZdVvDiRAJpEqKJIdcfPePmkWOe8zdcgZ
	+NSYB2o7MnwKiB32DcKkgn2yeoK0WsLNNo1bS0gBmpna3VDOmzj3U2St9L3AZVjG
	iE8ec/yt/0tYurKip4NF2l8nxUIpnU9PLDWn0eCFA9/1/PJRev8fdqWoyGT3mYE2
	7cQrFUXfx9FvCJGKO6kTYZVNPjh3v+Vj7mOuK9A6pht4ta5wdfqN3rjxPv6mDJfm
	JIG0V+mydkol0abgVaJMl9G8rZIZ22qKl2aluR/AKo+G8iSh3atGgoU3rHD1102W
	rddahQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9vxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:51 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e99615e0dso754631241.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473830; x=1790078630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWuTRuraK8gbjCwKph/KhRyuid2F8Jq/XlcU3WwTW9g=;
        b=APvCsgbNqR8/jXAaeu7Hmjdao7NcaxD/4FbLEAjk5p29MJ38s6sfstqW0XPmrH87uN
         EppnyZy+dygrEQVEo0DNTRwJ6mjGqltgNSBUc5Rts5rtt6D5m91juJk7nSWG8i9P9T0q
         c0tmlcmqS3Tm0IFgpM4O2ODbyzmACY7Kce6e5LiD9fv0JJ7K86DncQOsoNcJMbgmcD3o
         Y5cSice9m9j0He55Hdv31Zzj4d+KQqhtv1BivWxVPw+zOLxmKpb58UTfa+LADY5ln6ng
         QV4kDa5gEmXmV1NoqGsL8paSGqzYkOMhJ0leOh0rlpPbmzQBVXObmC+xwx5sg19nglnE
         nspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473830; x=1790078630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWuTRuraK8gbjCwKph/KhRyuid2F8Jq/XlcU3WwTW9g=;
        b=lex20ZWtLOR4B+NfC6FEZsHFyuZtifSR1hPPaJBbPNiIIpSXQC3AEQzFzdLSpDZiFu
         EjR+QNOMXU+sd6Qf30x+EzK6EzEpBM4jQyQ8WDlU1mTocGFpz/6NCw6Xte6Li/ezAg9W
         liFVqssyHSWodX5sRg0aMhoyY1ifIjXeRJ9J/4uJoJmGmhwTQFcmkJCCcUE8RfUXnfdX
         vXCXDcggD5gFmveowe5caQMDU3icspxayP7UbRcYesL00AykUDXPkjjDAqdb4ob+GzLy
         sOPGPsPQoGiT+3VxwJiVC+v+3eJbti4bFisw4CR/KcJMp9W75C1raePnwIIzElvQ3XKV
         ZooQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0olSc7418lWp34WX8uof04WRFeEOKm0i5bKfG2r8esU3uAtv9bxWXAwAiPHhykTeO4MSeiCs382yTSzY=@vger.kernel.org
X-Gm-Message-State: AFuF++li6fgD55XxbGp5uM6S/kijaRL5s2HII4Y0pBoqQUCA2gKUeWuA
	zBYdhsPk26sKiAli43ax6Kai4BBLzCTacneRRzZlxEQqf14iQzuNVwDjBLnW7TpoOtMFLu8fiEa
	+HmKF8Gs6Lw6YuesOZDHMe4jyjeN517BgiZI+cVfHF6bGCVTmXz3e2hlUXjpkSfojmR8/B487KR
	I=
X-Gm-Gg: AYBFou0IawC3lgUSw/3VhDI3vJsQS2NQ8HLlQE1g8b/vkLGs7Yncnfp53Zzu2QVL4Bt
	hQJ16askNWXU47k9F6H+oU5Gk4rMylpJCkZaG5ddPiWUQZxJti4G9ksbUQE81dl57HINVzGZFWQ
	oAHW7ukTyO2dDYx5lsD9ibi4Q1MNJJtwUbCg9uFVC0f5gPCdwpZzUAAwphaiknk5WRzGCRnLFtR
	NgQgc4t0cumgtk7YkbSyUkxeaCQjw9sidwHXQw5couCeq613f/hKGZsk76Z4eokZ83GCpKiyC2g
	K0Zi/5eAIEJsb8xzsKK/WoDFJiSFIWAFGSz5EJmj8ZGnJwvuduLoP3L2IiKfNZVrzQixnTYMWJ+
	OWfsEBrY=
X-Received: by 2002:a05:6122:a019:b0:5c5:924a:4616 with SMTP id 71dfb90a1353d-5c98a192f99mr1610307e0c.0.1789473830384;
        Tue, 15 Sep 2026 05:03:50 -0700 (PDT)
X-Received: by 2002:a05:6122:a019:b0:5c5:924a:4616 with SMTP id 71dfb90a1353d-5c98a192f99mr1610229e0c.0.1789473829888;
        Tue, 15 Sep 2026 05:03:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm34247401f8f.20.2026.09.15.05.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:03:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:03:29 +0300
Subject: [PATCH v2 3/5] arm64: dts: qcom: eliza: Rename existing EVK to
 suggest eMMC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-dts-qcom-eliza-add-ufs-variant-v2-3-86d72a2a8f47@oss.qualcomm.com>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vu/qOKjDSCHMscpTGAgvAhSIJKvZ6VpKbHq8SJagBkI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqTQY7MTaJ1H5EuOPLyj/3LL7yxpZmITDsf9zs
 VLHO6cBf3eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqk0GAAKCRAbX0TJAJUV
 VuNeEACcy1h9Q4a6CNIPLiRd+nRtKdr8MgGISp9qcoEvyp81UCNnMBVy9F16GVckWQSUlC+IBrl
 D2dPu/OfFyTvqfcZCxcB31H7AtWoknOGN6clWX4t75mo3IjW9TFSkyky/ZNbSwwJwKKKqsMSEFv
 yx3ikZg0Zp3luBPMHS2xmSKqJFnjnM2eiCHzgEpECggFtn0N2rJRIxXhl6449IXjpda/WOAFBbc
 Nst0qhwqJ//CYfUeKnNJ/u/urfFmYozzKbkbfPsnsvGp8syqqVyFCwusGomB/DVFebNjExaLP0t
 UJRDLSjzVckKJvQ+psFpKWPzHxaWwBxJ4zhvWVfu/2RaYiTQFrpDZ6MMgGoH4G4faxyPlQ0NI94
 yhFxaaBiiYBHpD1Jrl44JJNlL4aELPlPozKvTFB4i9G9ktcEX9eemwFDfcG8bjhf0PX1P8HaICt
 eXwxda+yQDOhlFwBqfJ9l19ygRh4YjX+C6NSp2i1BoDqfjyo2fzLNL0PKCFFnP6+saq0F9WYvZD
 +CxrKMPfvZx6dsLnZXQmh65h1AVoW2aEJiwm4FmN7rfCGOr8Hls1pCSAI3SMlo+fvUVuY+D1fsz
 5I7Vdtp+P4BdAU8Er9uuPEJbsqAkPjZEVHDxCvcLo12SRclBgdz1XbkkxXayrvtjxFFMqC05C4l
 mPV6zpizly8a4Rw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX6Oki5dJzweni
 6eHi5hj1HiDL/mlLxMGM4XK1amoklFoEws5i3AzlJ8s1Y11mdVHx751GKaRR8oST9UGLcE34ktv
 hj+f89aK3ljlMeeaYHdK6Tan8k33phU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX/Fe4fuK9k4t0
 LTg8l/0pI71WO2drZTAWqKMcmT+seNB/7vIsnT40c7jJ8Qykf8P1iyO9G4A7MidelN/IHvKFxQJ
 6qS28+wy6IbU/ystY7ySX31U0OmfNtz3y7fffohdjFlqg/DEyW9aiQMtH4g/qDT83f1EHDocLOj
 t2nW50mKGtiWWEfTd01jM2Mpv/rGdu+0U3um5FV2/TOA5ZOAIF9Og418EUYjxoaTwLn2ieSC9jR
 QJGb4m0ICMmEJ4xiPrCfuyJFqCS4+/l71s3BvwQ7gcdm5h7gFh73kNuOBwAGTMKkULMjjVYvMFk
 KTvWiqEX2dKQ75iVikTAYqF+q9bYVP0rIbr4M8PjrYVjofgMfU3HISwCQI603ZAVhU1LQajFwab
 wjvsSv+Bg5HmGbjvRyL7WXwFsWU8dFFS64j9N3HzMyJrIamz0gU1JjQ5EvtLPA0/sLjssEPccbx
 eZOzMLT3+AWbXd5oVFw==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa93427 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uCsTHrIaqIeOh9K-tCUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: vZ566wXUARGNagPEM-6vAcy2bCPDGVw-
X-Proofpoint-ORIG-GUID: vZ566wXUARGNagPEM-6vAcy2bCPDGVw-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150174

It turns out that there is a variant of the Eliza SoM EVK that comes
with UFS instead of eMMC.

So let's rename the current Eliza SoM EVK to suggest that it supports eMMC,
and then rename the Eliza CQS EVK to suggest it is also eMMC based.

Also update the compatible for the Eliza CQS EVK to include the eMMC
string, in order to differentiate from UFS variant.

Neither the CQS SoM nor the CQS EVK has been made publicly available, so
renaming the DTB will not affect any users.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                      |  2 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts        | 18 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts             | 14 --------------
 .../{eliza-cqs-som.dtsi => eliza-cqs-som-emmc.dtsi}    |  0
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d6547fb18edf..ccaca98ad4c8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,7 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
new file mode 100644
index 000000000000..36f63dd1637f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-emmc.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK (eMMC)";
+	compatible = "qcom,eliza-cqs-evk-emmc",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-emmc",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
deleted file mode 100644
index 43d428a4ed2d..000000000000
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
- */
-
-/dts-v1/;
-
-#include "eliza-cqs-som.dtsi"
-#include "eliza-evk.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
-	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
-};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
rename to arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi

-- 
2.54.0

