Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A50835DA6E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370396; cv=none; b=CLQtgR9wLmztRcY0h+nWhBtwMnfXz9RPqcSVwAnATkxPVuemiQmXi30GoSyGhjjCv9r+nTOTLtMjWiIBlBA3ocxRYe0WnuYBjpLXqH28bbU1JYbcHD9QLUsCnpmGxtIMJ5jurQV4viA/a6nBmVS2UxuETh8mSxj4lg8YAbNSYvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370396; c=relaxed/simple;
	bh=q1ljk6z59O3AZSsPtTvFwtfAbufwzglG7sgdImtEKuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qMgcqRJnwS6plNBitxVDvbkWU+G2/5We5Quzj/bfsraheQ3uukW0VyLcC3u+jYE03SLQL2JOUdCfflzfYh0ZhkjLkUf+sayaHCPt9nsEvcU2Ej8hXWWuSYNQ28iX1DAfNcCVxnIIVXyQ5g93ozwXfQno/LXeYh43IunnTivW89E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oh7ZNtHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DpCm6s0Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oh7ZNtHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DpCm6s0Z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ipnV793595
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8SX7emL9Dk1aIYNg0ZKMDsjeP+BjQgq7Sr3
	pyrxA7lk=; b=oh7ZNtHMfgGyk1NZaM0giPbdhcB3eNh5vnPn1xziodmUx1fMcYu
	WuIjEuh6WOP1By5B8ArVtOgWvVzKj0DoecFbpR/SHcjOKJxuX/AobS2ELXaR6N6+
	fLchPo2BVqkQvtG7s09WJESxrHBwAa7kOk5cClZECOV8kky1IVSsFfAGCkXG20mg
	2MX8LMg4kdUayhKoTcaxD4yg/l+RfGkHr4/c5wa+JwBcn2uQT4MFGSH3I1M7k1ap
	YT3ULZkPkA8lBTYNk5iBmgYf4IWJ8ClvNHdr8YHt8sM+jWhlXWdthfB6/Fi6lk0+
	ZskJGKroA2KNvSMsNb+Eu+cgcwvUPKAz41w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnf0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:19:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so3843368a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789370393; x=1789975193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8SX7emL9Dk1aIYNg0ZKMDsjeP+BjQgq7Sr3pyrxA7lk=;
        b=DpCm6s0ZgsAQJaLUnUoZVSR8UPp5hk/VEyzEZ1IWQyP0fkxsOE7Sm/guxItDnGgZdJ
         vTSp3EPkBjAqhPnKaT86UYDApt5EvJo0UOcobNYp73hOIxHzPfeUQQXIVw5W/RGyXZUA
         hNpj4HjG9W02aOlEq/0u8MpVljydBU4spSe8+KimQg74MXB/Au4qWQAdzeAGl1AizNz6
         3L34pLd4J0zc85RZvMjwvJquGugwa0ezoZdvWnaGNQ2B5inkNnoEWuVjcE7hN7GFJLcH
         JOT3fHIIC1yJoWiZwZxB/i16hbHoR/84i10ryZEOXPWC/lCIzUBy6liMARNdlVysv9ma
         Byzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370393; x=1789975193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SX7emL9Dk1aIYNg0ZKMDsjeP+BjQgq7Sr3pyrxA7lk=;
        b=gPkK2+uBBYQo8tknw2gSX5SJwrmDDvhDsDj/j6Sbo61bzzLrG8OCcgaubdQipsSdAn
         d3CMtS6427M6kHfBp43wq/wFI59idLKAdDLERiGJDDdWKoJttFomjS6V3Y9UknmNKhZ2
         zdQNc8P/ylT2i+bPiQme68r9/uYAzUofZtKhIXvKh11OyC++oaxdDhnmy/wNsNNl4/5J
         fng+jRhMIZ4TIaE6EHuhyJR5rnE3QnFYnrA0zRDtQkh+SA449jfCkChc/1/XvGoQc1Rh
         E2CcMUX2She/JFM0ctyHaZ8nJg2cPE+1oMsQXOqQIurZKKICjJwkaYUxUHfD2cbbqT8u
         ID6A==
X-Forwarded-Encrypted: i=1; AKwUvBwuDYnvQyqNFqEdy2Ptezxjd/LHeGDA9eILliSfwFjDHUie+uQRYNTQrlWVR4/kB1sv8C5esXP3spG5n08=@vger.kernel.org
X-Gm-Message-State: AFuF++lAlDAQ1q41/eomU0G7CumG78j7cDrc5Q0FnpcdrGqIlOLzXDWP
	5zrDwAnDDaHoGe05ecBEVLmZ4R4u3V4WGpls9XllZ9LP2yrZUvW/dv8k2y/FcWtQ8VghFqboeQA
	CFQJPztHmmLw7gH0Hv9d/IgOchbmvTDmkDO7q9GgskVVDko7DhR4X35xDymaD8OwvhBKS27yHT4
	s=
X-Gm-Gg: AYBFou23t8hhaTcc52GebWhLyAQ5iMbGE9vUwyi3fKiO20OMP+YjjOm9Ir24srFKv1d
	gjvvMI7iJSYODB1Xwn9g3WKGyPs7d1uZ+mZnfXtK29aJq6Le5ya8r4iBhuOMVxvU6E8xV6Q3aME
	bjMWiE8rit4E78GL5KXCAKmf2ZS1q9x1ZbvCBQjCbwWM8qKmmM8kKzAlKn11c4Zgts3ERH4IBSh
	T7IMAyiZAcnjreRBtBpI6fu/ooGNLF3EJ3nfDH1RDvsESdCjVDzA01SZ194MjTS81cOQBM8r/3F
	tv9glX1DtqRNeaoKBenXZxdQI0ldgcgK0etIA+Iy9B5CaoMKv9TCXjJEkmnfABuBiNis0XSAUqX
	xFEuuw6tfm1tBYUAsSSxqAE1PHkXrg60nWXsyuJCW+lHryHdHQbcjR8lWWHkl
X-Received: by 2002:a05:6a20:d70f:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3db4039d992mr2900066637.4.1789370393458;
        Mon, 14 Sep 2026 00:19:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:d70f:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3db4039d992mr2900019637.4.1789370392985;
        Mon, 14 Sep 2026 00:19:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm14782238eec.9.2026.09.14.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:19:52 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: nord: Add PCIe and WLAN support
Date: Mon, 14 Sep 2026 15:19:39 +0800
Message-ID: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX7dYsOV0WauAf
 Hyhh8XysbkguD5vLyCfx3iVLSLuW1fVmUIkHYB8oiUFKl8PI5iTII998eshVfqmKNkgHtj/SF+v
 U6y3gK3hDqQUdlsLNQvw59p1+5hVGknPJjQq/jv0Mmn+VbbVapPUVvJ/jI8WQa8n/3CK444z/V2
 dz8zGodBmj8/6CKsD4A99qwogO17UMy7Wc3TvPTGCYIDVvFENUOE48jIUOJ7Kb/UcHjQAByFRtw
 h0NUf8nKqD6kZyQSUh3B8M20kuAWsks08vwBk0/bhn21qzM1G9w54xQMOC4fDvRsdkUwpoOiiNq
 KW1dXoKW2NM6REOmowFlVw22OpMRTZIPFh5kuInoqNKinoPWUr7KdJOHq3EpVJpOKY80E7k0yl7
 FGDrS6YX5xkvKmqaTfaMRlN8SRG46uLMd2rx5HDcdtcR/W+oga4FvbZuUSwVc6GmZ62uAtjmupW
 rYvlYEHeq6ZU7pog1PQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7a01a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-CvtibuEYNIfTV4diQsA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX1TPjiCwwtBYQ
 jRXXquON3y85BqbmqE6bF+dhkyzBtBlRGV/O8U8XyywM3EMDFp+hZa75lt9hWYh1zU4BJJXQr8a
 1tA3/vq0oqObjBVkYG0au4ayW1V38gM=
X-Proofpoint-GUID: sP_8l763bIa10hVDsg3T9pNXFfTdq6sz
X-Proofpoint-ORIG-GUID: sP_8l763bIa10hVDsg3T9pNXFfTdq6sz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140103

This series enables PCIe on the Qualcomm Nord SoC and brings up the WLAN
modules on the two reference boards.

Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
multi-PHY.  The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
selected by firmware through a TCSR register that the PHY driver reads at
probe time, so the DT only describes the PHY ports and hands the driver
the TCSR handle.  Patch 1 adds the PHY, the four controllers and the PCIe
SMMU; patches 2 and 3 enable them on the IQ10 Robotics Reference Design
and the Ride Embedded board respectively, along with the per-port PERST#
and WAKE# lines.

Patches 4 and 5 add the WCN7850 WLAN module sitting on PCIe2 on both
boards.  The two boards power the module differently: the Ride Embedded
connectivity adapter card derives the core rails from the module DBUs
gated by PWR_CORE and PWR_CTRL1, whereas the RRD generates them with
discrete on-board bucks behind a single core power enable.  Both are
described as they are wired.

This depends on the Nord Gen5x16 multi-PHY driver support [1], without
which the PHY does not probe.

Dependencies:
- PCIe and PHY: https://lore.kernel.org/all/20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com/
- DTS prerequisite: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/

Krishna Chaitanya Chundru (3):
  arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
  arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
  arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY

Shawn Guo (1):
  arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support

Yu Zhang(Yuriy) (1):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 151 +++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 158 +++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
 4 files changed, 1528 insertions(+), 4 deletions(-)

-- 
2.43.0

