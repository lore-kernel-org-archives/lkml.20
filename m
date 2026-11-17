Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897282;
	b=E7bySFyZ0+xXhzMr/GLuLuckMo21RxJm/A0RIzP3rO85CuEnilAQpvjushD5KMbZQ2/i
	 i+trejxx4jGa/196rGwAsOaQ1nADSwNTpqGP7EnflXEN5HpzoY5q1o+QWDEiG3iEG8DZ6
	 vAbVRjWa/vU3K6MS2xFdq7VHZdUStpyb1kLGodbnOg29/tAgURPLsNuPfUNj6ZnAmQD8Q
	 AqTIPXpnJbhGH9rveUv+Y7dv5Oet72A5ghAXkGbwGbzG5RC+PF4EifO0BBHczZ8jjqLQV
	 j/xiFpxpc2AZyaGjxOe+oAzXmqb4suYCx5W1sLvZelPv2K+BAbgefwNT+sjsQqfcm3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g/AXX8p4qj1qLShF67tisTsKUUeSf1IjIefQ6GJ36wU=;
	b=ewUVmxyjwFULjgabxKH7wvdFFurDpLaMaYgEtsa6De6hRVhANIx7P2RRq+f6PDX1jz4k
	 wUTpJ4+8lkN7WMU/onX2a9WnWIs++81+Sq6If7B+s7lOH/eakDBhhRCWLd1lFNHQfxurh
	 gZ3FDhfEA+/FO5EAu94NwbyIJ/ioh4D+dK7J0uMmuUwc+RWstzPAepiIcuTBCs0Jsxmbr
	 22GmEZ8h/auM5lRQ9VZh0zcTGsKNTaEt5VfuVOr6Vtn7Dmvt6+wfurSru8dCkOf2Dc3Lg
	 v+/tYbLQ6X5kYee7x0F6aL2Gararc488A2LVLusgZUOvLDyKHg81iIY0wCaswQomuGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kwSZRjBN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JUGCZvmx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E93606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E93606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kwSZRjBN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JUGCZvmx
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2a6lc2463410
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g/AXX8p4qj1qLShF67tisT
	sKUUeSf1IjIefQ6GJ36wU=; b=kwSZRjBNUVeNvNqDGMZa1Cc22BBpg/6/uho/2q
	dkOf3xBlTbhqeEBfECjVb15Y1Su4A/48IC0NdFKiEXiVpJ6BNHg2itEU7EKiRenQ
	GL0POp3QDQXsJcBUBFTnMJa6zC3FI/XmVx8HIn6bDP102pDDpyAW5kdxh6A+tuuu
	nskVnliDVr5XLlk9pdW34Qvyd0DpiRP9GPA9tn9g1LMT4GyFGOmxs5rTw1H+6613
	p8JTBbTztllH6H3BcaahFLJEWhtZXOI75pxw6gYaIGcTk3w/xw4CZg6c9L9eAgPc
	l8J2hFbHRLFFAkPDLSmkOBgVNcPTy0eaR8KbSloG2bnzXsxA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgm9qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:34:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd652c0385bso2923162a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897280; x=1795502080; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g/AXX8p4qj1qLShF67tisTsKUUeSf1IjIefQ6GJ36wU=;
        b=JUGCZvmx/174eCYATCACtre4A8Xn2abGOrTjRTp7dIRseJL6WemrgipK7Kyr5T1Y3x
         EiBsTqhylxrfCNbMrrbbW8/9k3JQ9FCKqTQMle3EQ2OucbAc6ZJBZWCh9JJM4EMyoARz
         Uzs9yu+GhlfrHdycNEBshzvCW9Cmw7VUWWM3qH4bCH4pPfOwpouPqyHF8gWWFdSIiSQw
         /p0Qb5AIddl7i0AUnsnZkF/laAGg6bEshjUabOznf9LAX4lpLANChgndPsXSDFRAqgpl
         Gb+5pljP6lZ4GAMODN4J0WEtQFE1gnImPxDrhuldv0Q8GonrOejEWzFzW0e7AIdVkrx5
         x+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897280; x=1795502080;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g/AXX8p4qj1qLShF67tisTsKUUeSf1IjIefQ6GJ36wU=;
        b=uTwx70ka2jToyQy4OQJH+hWzos0jZgKgnNsI/TRk4tiaEpjGxYu3LP7x1fc2GFNh0O
         yn4VlFE+PuJLd3PF4Dy9AchHFm88qCf0leLA5oySRqbdkWhrRerhq+hvCrF2FfELzRHH
         DcjM3Yjg01L+O4dK6bOCn96tvoZVjxLKhcFETmqCatLy87q2uwFSVqScX9EhOaqqN9nf
         hNwLTbk4TM/Q1mOiLsUDVhJVB4p85Y38u+3Zjuf64PtGScscwDF2IiQJIQhuPNc2iNNT
         8kVIX2+fyxgDhmYQRTocwLYQRMxWOFXZ54HN/f5O9qm1dMDT2+g9wTD461jGrp8CTq9U
         Ys3Q==
X-Forwarded-Encrypted: i=1; AL+hErGaMVFlGg+eR74BA7Y6PMacN4bySMLG9kpKKu0VbdyFSYP0MbI/HTkrb6eZzyTkjKAInshRrlxeYCGzpFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E2zGxXp1AOVIPMfsVEBy+PIytOVONBE+VYZ1lDhOgSSgP+Vfh
	6zRo4QNnHD2vZW5h7iMww9DreZFBKjvEJnafGMuvYT8bhmUZ/jilVGc3TZUibKy9J+askJr/tuo
	U/kSLzaZQoC05jNrL7lVzpjiXAIQBJ6NHZRN7f2gD8OUWyVeNXCDATQqciKrgQdw0Qlg=
X-Gm-Gg: AYBFou0WadxG4pRZ/WRtzXiVZDaq/5MYdp/XsAIGefLTc3q/+tQECjjW5LjME8TigEA
	AklXYw4u2UE7dpg59pwsxalO/ZMBZI7+pXfK0Fe5qYX9HHqY350yahrLX1wxflKJqKjCPjA3kuu
	nq1ddSVrR4Jc6VBOUFKxyUgPFFlfwaP8W0UdDsweN7IHiZKn7pzKEkd3Z3xGrx3e7Sbw7aaqzAP
	xjuvnvTNjISfkeB0lXkQld4PhmxNCNB6VpxHqcAyq9G3A6avFPBYHqb9GXjaj5MxrbSSnxajAP/
	9hgmLYHj/bOwN0prJ10222yykwzoYMb/YI4ORJJ7H/rQn0jVVXmrTgLmq7mYIAYJ5IOkFAMspOZ
	ZfcBO98Zm7WBW3PAF8JK15Ck06nTFEF31rs5aTW1A78bMCcm0/R2SmWH7OBbxk5CEEZNCcpeGDE
	o8Yt0WIznOQv66t6K7XGBkU1jw7dXkrr226j255t5wF4+/szFx
X-Received: by 2002:a05:6300:483:b0:3e2:8c8f:f11a with SMTP id adf61e73a8af0-3f7a87cfdb8mr10237675637.59.1794897279998;
        Mon, 16 Nov 2026 22:34:39 -0800 (PST)
X-Received: by 2002:a05:6300:483:b0:3e2:8c8f:f11a with SMTP id adf61e73a8af0-3f7a87cfdb8mr10237654637.59.1794897279531;
        Mon, 16 Nov 2026 22:34:39 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:38 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/5] media: iris: Enable Iris video codec on Eliza
Date: Tue, 17 Nov 2026 14:34:29 +0800
Message-Id: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHX1+2oC/33Oy2rDMBAF0F8xWldBj5FtZdX/KMXoMWoGkqiRH
 NM2+N+rOJsuQjcDd2DO3BurWAgr23c3VnChSvncgn7pWDi48wdyii0zJVQvrATuYpyoUJ1SLhM
 e6cfxkBxooa2zQ8/a4WfBRF8b+vb+yAUv12bPjyXzriIP+XSied8NYB1E1IMAYaGHkEYjJAbjF
 RgZE5gwAnpgd+tAdc7le+u7yA37r9oiueA4hhCtH0Ma3GuudXe5uuP9+66NTV3UH0nJp5Jqkkk
 4+MYJpcUTaV3XX1Hc4dZRAQAA
X-Change-ID: 20260914-add_iris_for_eliza-cfa43039a976
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=1929;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=KqHCk1CExbEQKbOp47126ICIyfQogaUNymyxYJPGKsw=;
 b=4q3NAOT98xG4yCsAzKwG6NOVTvRWSxj7o8meFYC7mTOIPXYiDcFLy9QzfHDIKI2VAAhAYNkwx
 pn2jCsh3BsICm5cORmG/9Hgi5pgbQlFJcnbA/WYiRHq1uWZ3dsKJ532
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX+hiv1+gpsKAq
 XubsRGusqS5DNsK3bKVJawsxRcdfGcWpjmEjbabGAlsefTP11BCu5RzzWx6TZIIYjSdwawGbWZP
 T0zllQ4JhnTkpBJvXMdPddLGd6d+56I=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afbf580 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OT0-6WW5Sb5gBQYBlqwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: uxytPG3jpv-hgN1-o609c8D7PnFZDEo1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX03oL/S7dA6br
 WQho9z1PKOaWKr2IlHpxTbybNbkntpPRNgo5suyWMVxxTpAS4gJXCMbxTgAdbvxxb+0A7we+Mjw
 VysmxI+fJ1T/9DQmg81aKRxynL4hft424sk5tbV9WyvOG2uI9Qj4yY9BpTrLT/OaynkI57m519g
 5ZrrFB11uW4PqDq0235Z1Y+3+gSuLoJ0SUO1AxYo7uJvRarzR3Mr8a8AADFsHwjamkszfq87/zH
 9jwgN7lRgwd5rtYR5WXJ1qa/4wtCnzhq0OXhKC/biPz+zP0nxiqljvUJDxRX8RD07eh9Lt/70Lq
 fEaQ1vAU0GxSaYD1Y0/cedAtrqrjovyHq0htZhOrVJ7MzLevoz2ysuSJiDIR1Fk7VqUFecsc32K
 iW63WsSQiBiPqfkacTg/2d6ZpRbJ1QcXHFqnSmVjbA4/cx8Ux1t9Ql3oVmTpS2fi0jxX6apdfix
 MZAOFQlcQl9FZDRvVWg==
X-Proofpoint-GUID: uxytPG3jpv-hgN1-o609c8D7PnFZDEo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025

This series enables the Iris video codec on Eliza, allowing Eliza to
use hardware-accelerated video encoding and decoding.

The Iris codec on Eliza is based on the VPU3.3 hardware, sharing the
Compared to SM8650, Eliza has:
- 2 VPP pipes instead of 4, limiting the maximum supported resolution
  to 4K.

fluster result:
H.264:
Ran 76/135 tests successfully

H.265:
Ran 138/147 tests successfully

VP9:
Ran 225/305 tests successfully

Dependency:
https://lore.kernel.org/linux-arm-msm/20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com/

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v3:
- Rebase to 7.4.
- Link to v2: https://lore.kernel.org/r/20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com

Changes in v2:
- Enable iris on eliza-evk.(Abel Vesa)
- Link to v1: https://lore.kernel.org/r/20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com

---
Wangao Wang (5):
      dt-bindings: media: qcom,sm8550-iris: Document Eliza IRIS accelerator
      media: iris: Add support for Eliza
      arm64: dts: qcom: eliza: Add iris video codec node
      arm64: dts: qcom: eliza-mtp: Enable iris video codec
      arm64: dts: qcom: eliza-evk: Enable iris video codec

 .../bindings/media/qcom,sm8550-iris.yaml           |  2 +
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |  4 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |  4 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 98 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 7 files changed, 158 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20260914-add_iris_for_eliza-cfa43039a976

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

