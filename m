Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AE54DB567
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607102; cv=none; b=HWVVQXyWapDYyzVpeyfJShf5JWBjMpwl+bX+hFxU+YwBoCswNu0g/sPaXn/OCOy4+7eyZI2p2SKtMZk7sxXp71OrbEpuBSDqH89gO/GJBeOSAUvXLkJmoaxc5DdoUTUNiC9Y1LckaIdb65zypNGKr6iiMf3a674cfzg9FlWKiDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607102; c=relaxed/simple;
	bh=KTd2cyxGDFb6Ywz/ZP9Ug5LgVHty9vgzA0ysOJgFOFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJBH9gcJTraKfZn15CoXAk/D1tXaZdguO3JfPdmn6Bd0D9pYfuD6Gd2gg3V2QHmrZO5zbSR2aHtAcTMtZyr3REiezNw2E6WgETX/8fZQziUPFfGLpvy5b+tRFZhowFJb+2IakFtYFx4SlSP2SYHqVYVOqZOoGZiajV+6p63uJmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5QNXn8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvHa1aNl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5QNXn8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvHa1aNl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe0WZ2864007
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=53CsVaJzTItyU/Vs3m89Ymy9Gi+nZqgsQuW
	6jskAqkA=; b=V5QNXn8P7gC4V8kohAGiKmwO5tha6jV+bq1gFLu/SIeXa+txmvj
	8oVgFSQKqozpb6zZEULpR6osY0VUFBG9e5yTSRQ4IMDUt6dALG8WGCFbEEUZmqZZ
	cpsFVAJG0TByYAXJhK05jOVLtLgx8OSYMcc5UMee+Yj/JkS5r7PYGYzHVJozL2Oj
	0JvEzAIuXzEImbC1ycn2NeoC2Md0+BKNuLK6HeaxmIU7e8Ow+eVJUWGgKrjT80b9
	X1zw/GHjyoaL2y0i2smo8TfJ1eFAYnQvPCwYa9NR7UFrstMI7nWNzc3Io+dXYV9N
	Fl+oOck2I1TTniMtlrGn6Xls+528CxU2Sbw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t21ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:51:39 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-790e3ca4c85so439902137.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790607099; x=1791211899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=53CsVaJzTItyU/Vs3m89Ymy9Gi+nZqgsQuW6jskAqkA=;
        b=NvHa1aNlwpaX6DjT9I+26zxjDEialyxP4YDSqT8Ua29sAWymsphhZhAfZKR3e/RCd1
         j08McunppD6xkVbY0UmXolbd/QaH1ZpRLnBhyY/wxeDDlSDny9742+EbIvOEPTDMo2GX
         9V5PzEprLq8VMpGFBGKf8wAWzMxotjAHXxELpXHR2hMzSjx6QfFT5gmcxwF7ODMWc5Fb
         cahYWJPSAik6G3/+ccwbEhD9o8NVrREvrDxkXVfOVCdnYVJA9nAxFaESIUlvRgNZzDsV
         OyD9TYtYSK/7MK5qPn8pAHoTKwEXDRV37Xe21uuMnMVxcJfhhUoii+xDNfjkb2wgwgba
         hz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607099; x=1791211899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53CsVaJzTItyU/Vs3m89Ymy9Gi+nZqgsQuW6jskAqkA=;
        b=YvqstOmntHwyQgRcOkw0kqdC/ep6lubqGThkoUgqylnDgdX5B9bZfWEVNG4J4j+zd6
         RfVv/pWC3qJChH89MJMRhDLt8gopi1Bacnmvwn5yZk+Qz9Jo2X+IH6x6tt1SPY/EPzBA
         cUPuLmD7LbHT00A5E5kmVIo+VQxrUsZXb0wcCYtCzbSY5YuQPMysP0NHtPFedeFv2Fc6
         VclriDbkj9Cfq7WAcXIaVJFIRHO5O3x9gg5Ojo8GIRJZlpUBueAQ3fd8yi3DkixMTXgj
         szyYbNU/aJe3BDFlQzPccQy80vig9BAbHTJXz5LNpf/D27S9ETNF0PCp6DeDT/LKLizN
         DZ2g==
X-Forwarded-Encrypted: i=1; AKwUvBy8WF4nr0eLdzLa47xHyGIYiFSS91rnd4ypdOjt0bjZF3AYUECLOZv0ZJiaV+mm8JIh4/u6iY6rBsGcOC8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY7sCNd0Cw02yQhiPQxX0LE5dxij4FmlS8j5FT8sB7o1wQQuVz
	izZWp+f+yxWJ5A86JextBhgI6DUuYRVPzm9eo4mr0mIOAh1Zfrd8sydA/u+LGlQ09JJ44jKfQn9
	AAzB68bq/dJWxjTjx6+N9I/bzAQKYOiXtjr7nj/21zDLrtUHjrKLR08cADU/x/CaLyO0=
X-Gm-Gg: AYBFou10WkxbE4xVwvsooxiYsyScRSamK6oPbTYCFqdbK2ht60bwndPbW7OZb0PmM9Z
	+EhQ5kClwoWDXIs/dvLPqGRBTqxsBXLzSAkLPcNp6uYJECaIzaP+BgpANUmJU29WU/e2xqFIu50
	bznybbyrqIgGGF3v1xCNzCANKHtlfy1+KDu+S89kHOhq/RgD9S2pV8PoHSLbtM+z4yDmzi7LwbN
	GUJKprNANYKDff3rEPaSJd9OGQKqVaXO9qdMsKvMbOsRO70M/aU2kKpWBWl8s8Ed1bwTRVi/kdx
	IZwCz+lh4/nuKHQ2AB0lE3Yfnh9QebQ5auBmW4V78k4jfsuonWMM1P4Lnw4WzLjdUaKSXXAEn9E
	kEosHp96KMAvs
X-Received: by 2002:a05:6102:5613:b0:7a1:f9df:e35a with SMTP id ada2fe7eead31-7af1e0f0518mr4040597137.33.1790607098857;
        Mon, 28 Sep 2026 07:51:38 -0700 (PDT)
X-Received: by 2002:a05:6102:5613:b0:7a1:f9df:e35a with SMTP id ada2fe7eead31-7af1e0f0518mr4040575137.33.1790607098030;
        Mon, 28 Sep 2026 07:51:38 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1a01sm42777315e9.0.2026.09.28.07.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:51:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: Lenovo ThinkPad T14s Gen 7 (Mahua) support
Date: Mon, 28 Sep 2026 15:51:19 +0100
Message-ID: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX+TNkbpp6AfJd
 tFZGt2kQ/SGE6j2irrSWneRwJFNr2J5Tv61w04bkSvJE8rosa102kczRaw2pJDDrlLlrR/Ex7yC
 f+h98KL/Q3yq+g/4blUviyr9Htz3EFm+Bh3Vx0HbBckMR/p1aXF+XKlYMJcqli/cK9udUssKP9E
 KWfHoiCrwoJcuPDr7axb10hp8o2HaCORM2JTLYbCcf85GG2Epvmw+x39o5V6keROF36jf2MGR4y
 eP2NAUqh0THMuvZ3Rb7Ao3rXz0jjcou7rBzPiw6xsGb7I3DNei7yjwseIQBo3pm+8QFjPcYWk5Q
 CmyiWXU4c13PjYaqf6aI16b/Q1kjygMtVN7Fp/1nDYjtLLL2r1ii9RXDskyqfnaKI8OnTIhT6rR
 4bpu6g3LZ41rJAyOtTyZ24x0ZTJZhrlJ+JBC11TWpCD3WuZHP8dYCnEmbcpoCDs4z2wA1CG8tO7
 9gszLP4ctdcQmzUGH6A==
X-Proofpoint-ORIG-GUID: 71uW8TAVMJPPig1NNcCzggWtHv5dzA4P
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba7efb cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ON70hpHyYZ8ZvJF-ZIgA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 71uW8TAVMJPPig1NNcCzggWtHv5dzA4P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX6JpZBPUijy/y
 mTDZ6X55LzTeCdAJFudMTDzqjHIzzt310hZygRGy1aRwr46KN3sGTzgy5h9eYLZ3m56j7Xshe9K
 AgeBqyqyhxmZ1hq0lsp6e4EHH/+g/10=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280059

Add support for the Lenovo ThinkPad T14s Gen 7 (Mahua), a Snapdragon X2
Elite laptop.  Patch 1 adds the board compatible under qcom,mahua and
follows the Gen 6 T14s pattern with distinct -lcd / -oled variants.
Patch 2 is the T14s Gen 7 (LCD) device tree itself; it follows the
Qualcomm Glymur reference design used by mahua-crd.  Patch 3 adds the
board to the QSEECOM allowlist, matching the pattern used for the Yoga
Slim 7x Gen 11, HP EliteBook X G2q 14 AI and Zenbook A14.

Currently working on the board: internal eDP display, WSA8845 speaker
playback and DMIC capture, DisplayPort audio on the two USB-C DP
outputs (DP0/DP1), USB-C (host + charging on both ports), WCN7850
Wi-Fi and Bluetooth, NVMe, HID-over-I2C touchpad / keyboard /
TrackPoint, lid switch, internal USB2 camera on usb_hs (via PTN3222
redriver) and Goodix fingerprint reader on usb_2.  WWAN wiring is
included but untested (no such SKU on hand).

Changes since v2 [1]:
 - Drop the panel-edp patch; the CSOT MNE007QB1-1 entry has landed
 - Enable internal USB2 camera on usb_hs (via PTN3222 redriver)
 - Enable Goodix fingerprint reader on usb_2
 - Picked up Reviewed-by: Konrad Dybcio on the DTS
 - Re-add the QSEECOM allowlist patch that was sent as 4/4 in v1 [2]
   and inadvertently dropped from v2

[1] https://lore.kernel.org/all/20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (3):
  dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
  arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
  firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 1272 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1281 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts


base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
--
2.53.0

