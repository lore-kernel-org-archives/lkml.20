Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D010E48B383
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331219; cv=none; b=l+GnbKB9v4HK1bPr6vcjVTl7MHYt9MVGAYvk/e/Ae12AjNuu3FpgiK31blQq3B7MAicXPzR5H+XLOqpa31f/KBapxqwzqVFtqXlXJb1qMSCJa7r/HL4u2FK9E2tuxFg0XrVRW+N3hbQpcNDFCAwh/v0vEOEzgn9jQTWBvdYyALY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331219; c=relaxed/simple;
	bh=kj+B1T4aLCS/nzuyqzbwSZ3BJPr+Sze7VYEw9AAD2aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXaCX6ryWoOvies7Gh3SjiJ9BhxgJ2hZ4VVVzlgKA/UuI/DV5KGvKC2fgti0y0scLJciBsxtokG78PkhFrWBvuJDPk8cyfBhe4uN5OhZ4VZFc0UpG29dQswmCkcGK96tRiUTv0oC+ryF5CCiZluXpNH2F85Hg/GoXGaMgeFZCP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4Y9CNY6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DozDrTPi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4Y9CNY6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DozDrTPi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4Jdi609258
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n3vTP1V3Fah
	npFShyDWIKuDXZUTyfor7i7UwWOsQnlk=; b=V4Y9CNY6MuvPz+Hi3QcZIeVd/J7
	Shpzx7ochWBMI9PvqUwlC06KoPwWxX4sc5kx6qPzqi3l6+A+YRACHZ/prURgv0z2
	o97mQS3y4XH4hKmApLwCjb6n86KhEjAul5piK404MBHcuWoMw0XY/uMZAApOszmO
	THSlvQwdelc3ZPyFaNGGltfXOpVvAJVhvUNTAxbuySQjI9zDMj/UMo4o86BuqWqb
	jA5HYTwRnyA3ZTb1jOGm+uizhy+q5QFpa9nj6Bm29pv5GoTx7fmmKMGA/Z3AIj9R
	vUGvxOLyO+dNGaQlymdsgR+E5fnJnYu4EhFyOGQnwY6jO7Arel7X5aQ1GsQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvnr0ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:13:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341b0999491so935302eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331215; x=1790936015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3vTP1V3FahnpFShyDWIKuDXZUTyfor7i7UwWOsQnlk=;
        b=DozDrTPiwfwK+vaBBGfj8ievMnVT5lrKwjx76JKacBoL+B8Hsbel53qOrodouiK8wV
         eIID08M0zNztVPVapCP3QwDC9yeuoiWnuupbiOxtjxAIvyoYl0PQWenVCO9DkQ1M30+Q
         MYOSJcHers8nmcgNMp82yHoe6Q/NND9pWGuRVthjIAWs3B4yjfAcSCfELS2rtQa9tUYu
         ADmipYfl0bmbcnwVEJWzkToPy/3c8FrBUf1e7/TXgDPvDb0muJ++/UH2+p0OFSjMZqg1
         5j+Y+3hA+pGFRC0OM25AnMUr6oBb6dxA/9H1c9pIdiPfatBvkMvxrbpFxGbycYlQReaK
         j5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331215; x=1790936015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3vTP1V3FahnpFShyDWIKuDXZUTyfor7i7UwWOsQnlk=;
        b=soDqpgA+co8QOTEVPZNM4OUQZXR1VL0GsFRZPeJ0caxsvu+tnCGUh29fKWq2M9lIL1
         U9DmK6w41joplFUhDMGk1vXU5rsrT1n2oLKkgackKxpKebBUxyAul7D5YwsvzJ2sOSWq
         u6Mqv7aBpc8qm+XejU4td9MtV2s6DPbYIaq/ZnfCm4R7ZQzWmqLbKtioNO1IRGYFGGQD
         RW/IKT3JX4R4n8jFRrluhuhY0n6MoOQdgwG9HvSnSkPS8gkKbrcRMoCliQiackAorhtM
         xBPHevIToNYJDR6mGlcrYmjU00753/dn710F/ZPaTUNYxT3/A5UB/kShSRtVRE3EfNg6
         BtSw==
X-Forwarded-Encrypted: i=1; AKwUvByBtjkCjFaF1W9VUAS64KNmx3RW5Q3F3NYiCijPLik8PUKqAt6/eEyEuBnkF72OQr00/M5Hee7sS/RIXW8=@vger.kernel.org
X-Gm-Message-State: AFuF++lpia4NPU6rYZTW7fzH6++Kwq8HHCBZvGSOKVlR6YbkUAekVp3/
	pNzJxcCLsvnHm0/ytfDAQzv8E9ANi3xNnRcThNL8DywYy98AO3Xqc0KSeoi7aOs1c21lt3J1h3n
	+/6bExgtElEOAkJJs4qAzx1JVtdG1QALF73/Sq3x9uPfXmOygZc5CjVWg+G8z+eK3ZUQ=
X-Gm-Gg: AYBFou3h7nF5cQSIjxUmeT6CqLzL7PXUZbgT1OwoDK1jhqPmzc2VkUO4rhLxCt3VoZa
	p/yrE6RHIC3PwJApuw8SJF2/SPI/4VsUt2hyTSZ/SxbIYzvxoS66VGharDoCf3dTDFY7EO2RxYm
	G0hrwrpl0R0aYPkKFXNP/TC+LyJCsBK+Kp8L8PY+UU4izb6/EDKwsAe+/UxJxyqzQcutk5BZKek
	con/cz6nsxvwOy/rxwKKLM5M94NsjIehpyXrKA0s1ohtEwpZ2M6OX9n5uqAPIyqJ/eiPoF1SW7m
	Z2f9BlCV5A3zA0+fItRm4eXARX+q3Op7ajlgLKHqdPl/aM3V6J6PJmO8Ys+0MGKS/siPBmksyW3
	6ZQ+Y5KNfP5xprhDTcRJq1/nHug==
X-Received: by 2002:a05:7022:108d:b0:143:7cca:e14 with SMTP id a92af1059eb24-14503f6a36emr3579050c88.12.1790331215249;
        Fri, 25 Sep 2026 03:13:35 -0700 (PDT)
X-Received: by 2002:a05:7022:108d:b0:143:7cca:e14 with SMTP id a92af1059eb24-14503f6a36emr3579000c88.12.1790331212990;
        Fri, 25 Sep 2026 03:13:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5397961eec.0.2026.09.25.03.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:13:31 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: dts: qcom: hawi: Trivial fix
Date: Fri, 25 Sep 2026 15:43:08 +0530
Message-ID: <20260925101309.3826038-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HO3ceCEu2o_WAuUUqSM4OWrun_8f5ERw
X-Proofpoint-GUID: HO3ceCEu2o_WAuUUqSM4OWrun_8f5ERw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXwB91kDhc4cw4
 VA3U+JeKJ8p42j7JeVLHB7IrzjqrJGrmy5af8rRVGiSZjS+aLKfluBvvrEyYYmxXHA1E+mgDAg1
 el/92O5yDTdaYvWquqV+mgJbAF+M/Vk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX5Mdfrp6rPtnP
 crswmUEPPHei5uXHr29axrFTPD8QxGU2yQLR4goOnZCRkGZX13BdS9YWvuxAXbGbjwD8APBARHQ
 S0rFZap2ezLuVXF2MFi2nu/CaE3qf5H/W/eouVdEPfSwcpPDuI/ZTyifZuzTeXDQcelfMcUlDrb
 RYiEpP8OG4WY0Ye6HSkwdMyvwQf2PCYvWeT+OqeqqvhMys5LSTuL7DiVShn+Q3k+d6kQENEORZV
 mv/fakEIZmguVYLHiiONSayGrBYDwCB3jTZ4IhbGVBp0g0PvxG6wzZQD4GUvfigQ0DMY2+qLfD4
 M9OMSY9CnqXz4y7aS1HQMjNGf9vg8SBndwnv/hmpGAcNEwZTQoU1b4DBu6otajl1XeJOtxIRF67
 SLDoYgYSLBWeGVJ4TUcBf/Owaqxj69gFQjeAkH9psZ274sjZMEvWkXag/LBJgnRmrAHaAtTTQKh
 z/v8nMs+sRAwj7EH7XA==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab64950 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Dodmwxs2qinD0bs0ztoA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250039

A stray blank line sits between the sdhc2 OPP table closing brace and
the sdhc2 node closing brace in hawi.dtsi, and the pmic_glink_dp_out
endpoint in hawi-mtp.dts carries a commented-out remote-endpoint that
was never wired up, unlike the intentionally empty SBU endpoints for
now.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 1 -
 arch/arm64/boot/dts/qcom/hawi.dtsi    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 88e0afa791b3..c38e5fab7a2c 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -120,7 +120,6 @@ port@2 {
 					reg = <2>;
 
 					pmic_glink_dp_out: endpoint {
-						//remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 					};
 				};
 			};
diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index d47440791479..6b0a0ff0faa4 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3295,7 +3295,6 @@ opp-202000000 {
 					required-opps = <&rpmhpd_opp_svs_l1>;
 				};
 			};
-
 		};
 
 		ufs_mem_phy: phy@1d80000 {
-- 
2.55.0

