Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070333AA9F8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146477; cv=none; b=ow6frIQANSuPm0Ux0n7qXU+foHmkufYucmgyG1h4SwSD1Q5oAN0NirOCF+p75ky7RdLBHRuKlH3qqJcjZbiRK9iW5xsD7gn4rBp5EWbSJntfnHMcW30KyU9a/ksai7UTFw8hi0w2147RBzxFCq2BNryE900JVYUyiFtRRCZ2CWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146477; c=relaxed/simple;
	bh=XhAM0hdu35IW+//Ub6Dx1ZV1XdI+/BBgfFUj2g9sWlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZX0dDo3MN0TaAt2gH/LpyPU+6WCEwARan8vv1/etfn1OJgAsd+8LkElJh4J7AGYbAxnB/Kq+5ZiltrDaTes03BR73o4PHJYb2RWD6KmR/SYzvXcjs1IJGuw9TD7e3LRxJ5LRLWzEtmhIF3LzAtXoMP1hMXMeIjrRNQBsaw5AoP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyDKUfCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayp/ddYF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyDKUfCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayp/ddYF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bghu2322444
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rqgRXW9fq0Vk9XP3ULfEudkKUo2XfXG9j6m
	IbHSFx9E=; b=nyDKUfCMJDC2D2qwxU1QiqAqj547iwKY2mZCmDof5HAgO3fFRqT
	sxf54t5+UARLRu8x+32IMUmZmj/87hTekPdWUUnZq1iCKVKWs1qsevFnFXwHO3hd
	4KFnUwhgQ5kkoulEArz7/6fQwFmtygmtfNU6JNy6J/gOYZCRTlBzrPY+HMxMv4/A
	o/BE+DI07hq3J3zBVjKz5oF2TaFlJRG1HFxgLmqOFhtRoxkPnX3uMJAIYugoiwRO
	7GCF+C9NaGLkP7sefCScBlzynOs+6xD42DIyD2bvIJVJUchCOA+BYfn4/1+ZoOC3
	9C4bqTcX6rRU3ot+6HXS2CbN2zvXKfxeKVQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgymcjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:21:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1175456a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788146474; x=1788751274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rqgRXW9fq0Vk9XP3ULfEudkKUo2XfXG9j6mIbHSFx9E=;
        b=ayp/ddYF6CVc9UzNFMLI8FCKTGCD44cmv6kiPHL+ns+LyPdgqAVs9N31BSIjwF1U2U
         Q6gD5f/pADDVsE0l0dX9pW5kEEozAUjklu5i9itidzpFBBHbMGGHd3t+QiaA+xNuQay/
         Fu+b/FyuAxJP1eYW1apJZDS1Wn/QlOO7BIa1vcmOP15CZBnCOn48DSOHAr2Wf757YbNC
         dm//0OYIVz7tRzHeyYZZOeq/1RTSG7WTI6GQyWDfhmjy49QJkFulPVonU1lK5My9XZvf
         kP9YMzZMpGBzAawqFJTYI48WRUbFUI4pOeTRXmjT8HifHUy7SshufLXRi3sImLxaTnbY
         NtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146474; x=1788751274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqgRXW9fq0Vk9XP3ULfEudkKUo2XfXG9j6mIbHSFx9E=;
        b=ini6LRVjlBvOYeNVxiUFzcKBRNe1Avd5GVXBsJvbl+yIPwH//wF/t4NFlN2cA871M9
         EiGKm8KbFbvA5eDwa5H+PeBRPbRwjUJVnuC8CFsdZ9D3dWMOyfog9Copnf3+/ukORnow
         DES0qGfFqbx8UUjYYG7UtAIK8Y1FNe6I9Ae8imla6zIeB/sjkHOt7S6Niii3QK1pJ3LM
         7qTejnZ/iGTfAaFWihc+IOlaleFpIvi2hGpZWRttpRguTxtMt9+z9I1yMpRr4s5DyFBB
         MZ9R2H/H0ba7V+Eoex02jucBJfkeAwEHVffoJDz8bArQYz794481V78UiB7LgA4IBUjN
         eo1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwD91ljqlkEso+GCpaI8cxUJl6l19w4REsWfPbQY1y4l+Narvl+oOBpcQhl5TsRFXiGEzK9GgkR6foPKsY=@vger.kernel.org
X-Gm-Message-State: AFuF++m/pjPPxg0DlCtisPGXSAa2hCsoJe4Nt92HZvAoC9y+S5b3GZHk
	Ai/Noh24m6WewcAGa+fz2TtXNWj3I54Xn0ii2V4FmcUJiy+8Kng8pqJYHsjFcdT3EWGb+Jml5t4
	6a4zC+kbI3mPM0J3tIZz/oei8wX5m5agmNEeq23jvY3alcGqEBwR2KBUuZ635V5/TkFA=
X-Gm-Gg: AYBFou3HNNQYAOoCQKGu5Bjj78YS91+YgtsNohcS6oe8nQQtE+p4vX7gav4QDP83M7K
	1wkDdYpi7gR186kFybVp2vqv1KnhjUsQhHSZfpvaqlIXRazQQtQk/Zjh0rafzmT+LV6/h7XQUsO
	cIueOb5a95DUoXbJis9WS3o9p/MW4Q9EQ9agrE0s2Vm5JM1Iv7RXriFKN86IKBvjdcjDzwkgvX2
	QeMfJZufv2kXj2TxDHylPLm625UzY3bxe/JmDkAssFu4fCVKIgy39yxU0aYIoK+go37XrQAib+b
	XHMZShRHcQGgOZ0S1ngkxW6wuG0iMf5aMphq7s5xfYNJYIFkO4alplnyaqaztqFqHEzx5gVeKON
	CqoaTYwBz64RXzL5R0YYemrtweUs9SJRNZnUbxWYhwTMlfz3m7U0XB4nxZK6B
X-Received: by 2002:a17:90b:54c6:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-396d0e24bdamr39154172a91.1.1788146473847;
        Sun, 30 Aug 2026 20:21:13 -0700 (PDT)
X-Received: by 2002:a17:90b:54c6:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-396d0e24bdamr39154122a91.1.1788146473416;
        Sun, 30 Aug 2026 20:21:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm25599208eec.18.2026.08.30.20.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:21:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC support
Date: Mon, 31 Aug 2026 11:20:57 +0800
Message-ID: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfXwWnkm1L3ZmEq
 kHfKNQWRu5Lj5pWBXR9SwRlTlNeEron6PeXJtIvIXcg7Zg9takAJ2bi6ve6YGLBy6lKmjEh+VQp
 i8db6Sh/jTtHA2sPD0vIeFnUg4+S77o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX3v4AHBAkRcXg
 ccx+6p/Ingv/+dkU5c8Dn6pV7m4norXrFlU6RzqdU79fYJ09Mc519q7ebma3puItohy/zl+QgEd
 CyVXH4sIJ/T2TbcOGlo4xUpL+SdFkBhUUtMbGuSJXIxYhEyUG/MLtiBdb8xKUKmD3wGYOR6f8cW
 HhDOW7TUudJVcPpK7XPyGX3u3KN0B6euLSNhj7ocXlJ4A0GKzxNJm3ceYGKwEDnHJYaNtRQ6iza
 Yg0+uiS2GxGNiu+t8q/iMtPoyEzbGJTe5Y3AaeAsfVWBdRjThEWYbRgnTG8kq7aOF198uowSLB1
 l/8KTjBiB8MuKPuQsxiO8gpa/etLnnSjhQpULGYYl8Mr9+syvO7ysnc8xOARH0D+9A6D8+YUC2j
 9ARmjom+CjXXXXhfqFe66TtmuJxNHO/8+TtMw1tL881fW4ncNsSDySKp43sRE7BN/L+NNs/EyUB
 8bCRg9NrMgPbFmWVINQ==
X-Proofpoint-ORIG-GUID: EWSnqXj76pgAIg2QJpVfUGxQRKY_XhC_
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a94f32a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=16TN1hMwoZCMAKkeDF4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: EWSnqXj76pgAIg2QJpVfUGxQRKY_XhC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310026

This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
and the PMIC descriptions for the Qualcomm Nord platform, and adds the
initial device tree for the Nord Ride Embedded board.

Dependencies:
- Base DTS: https://lore.kernel.org/all/20260828034958.3165-1-shengchao.guo@oss.qualcomm.com/
- NMXC power domain: https://lore.kernel.org/all/20260826135454.658615-1-shengchao.guo@oss.qualcomm.com/
- PMAU0102 MFD: https://lore.kernel.org/all/20260830034719.140213-1-shengchao.guo@oss.qualcomm.com/
- PMAU0102 GPIO: https://lore.kernel.org/all/20260830042939.144376-1-shengchao.guo@oss.qualcomm.com/
- PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/

Bartosz Golaszewski (3):
  arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
  dt-bindings: arm: qcom: Document Nord Ride Embedded board
  arm64: dts: qcom: Add initial support for Nord Ride Embedded board

Dhruvin Rajpura (1):
  arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU PMIC support

Shawn Guo (2):
  arm64: dts: qcom: nord: Add support for ADSP and CDSPs
  arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  63 ++
 arch/arm64/boot/dts/qcom/nord-ipcc.h          | 144 +++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 590 ++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  37 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 906 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   | 543 +++++++++++
 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi  |  54 ++
 9 files changed, 2339 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi

-- 
2.43.0

