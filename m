Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C323DA7F8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896006; cv=none; b=Ea6FJYQRh+z/mQOnCCr4X6H5v3xSq0PA0CBhoFEMPajtw8xpQBPEhUMX5e6S47Yw9iX0RU4BuS0o37UZtQFn+RSzc1xH7sUpXER9czXOD7ph/cbpgP1KZMPKtdJuYWnwLxDWZl1eiRJ/gDHX+LfarXhCsdA0s0d22mASZDxZ71M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896006; c=relaxed/simple;
	bh=TQYDLvaC60nSO/5kc+ZxMvsQAd1VH7NGzqKaIB9PbXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m3crzXJo1Sj72+Xvw64DV4C756NS8pvlcYhIlVPukthEFKBII1AgpxmYzf2EEADlf2rzCLM/WSNbv3dgexJGUR7/iwp4ZmDIbcFQ91/EaXdNgyIhB9ps53Du4XB+59XQUV42J6RSon99CCbSd8OIs5MrmiICA+WyL20RZwywsvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNopTdwX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/W8J3Uy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNopTdwX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/W8J3Uy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VltH1792076
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=M0TpFX4x8EpDL4Y+43bF60ZhBeLF+S9qJuT
	dULSmfgE=; b=nNopTdwXgasj8VVAFzR3CvNf0GV/EpIVD6cIYeXQ7sXnsVBmvf/
	yQis5gO4aWB8Gcu/Qwp31bqXTvhFV39Fq8E0kzwgXlyCKEq9iBQJZoI8g92Hes25
	bbmSEK8bAeKQLsjS66XAhlhgV+lZj2pLLr9ZnjquV1PvQkjbBBYH7ooySsntyuKe
	vk4G3soqXZl2dNq73SuwAL42RlZ3UDG4URthdLCzXNPGOt1Ib5ZwxyokKGEtEej0
	G6bDDXZlOtqDdaDgqxI/IR8RoA+xElsvnmD6Zp6J1WzbpFnUvSC4ZPuYDTXo3lSf
	yTzQz5cusIurcDIU2bp5nzcg/hkRh/aUN3g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqftrty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:20:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86917d18880so3520904b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789896001; x=1790500801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0TpFX4x8EpDL4Y+43bF60ZhBeLF+S9qJuTdULSmfgE=;
        b=c/W8J3UyG9y9T/ZtorcIVeuQrYpq4EQ8e9yCWk+7Z8BiaVBmUxZBi40G0lK44Bp8kB
         YLhg2TZYBc6D8lftGJLcmtuhAwZWNqcw2C2LSzueoTCwIie08P51yeJ5umwjNPd6bcAF
         Rv+MUW7iZBIA2yfmBkx+NPoWrV99lDuywvprFDYefZx5sFHPXOMFNe4o80rUl1lzOPN+
         dni/LbdA3SH2eFjmVR0NOj2QaysW05BOIKQ9vuK13dm+TZmbNKVv32Vm/djkLwyX20pU
         YWHFGb1yTMaV+eSTkLIKIxGOdPeumlJRlq0Qwm8Vn+KlWlXjNNETYeFBBnpS2EcrKFHi
         6P/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896001; x=1790500801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0TpFX4x8EpDL4Y+43bF60ZhBeLF+S9qJuTdULSmfgE=;
        b=vdjBPmxsspdOMO9IX/r/9vArGfRgxv/24WSUBpC0igGW6OpPZYRwBCQMSg7rQxvv2g
         AJu4022yPNUuF5veKZ9Dkx9JZlYo4dSewWiZCYBLHi5SakrpRny8nPd5/+p1ogqymUvM
         P0Qt6+hJOXdsBpEZ5NWNiNCW+yYJUio7lueTo1+Qor18QqmJwblzzqEq8b7eCYzNIMek
         MW+xO/6DQ+taVlBDbwAkR3dTFjSDsh9UdCx2Z/us60A7pUXdwS+pXvfIgl0Y8XQd+9Ii
         qTxVDk5IczXZso8xdlUXpwI1JDfhNZyAbOE3UNRUl/aoUoWA+BnabY3Nv0uU1Jhg6voA
         d2pw==
X-Forwarded-Encrypted: i=1; AKwUvBxcSJ86JtfHN9m+gNryjhbpihBnEeivGJCdyZQhGp9uHSqs2tZsWF8wvtteOVce47QrH77pna+rZBixAYY=@vger.kernel.org
X-Gm-Message-State: AFuF++lf3+NWi3xPLSKnvLHPSZlBfwdfdImw8Vew5aTluBVtZgr5fuFM
	TUldszuZgjEKMVJ65ksCNmZlHiDXiqxG4xQB/nQCg994m3qQjdvyFIrzyzLvBIxFbzdO9HJmDFe
	2EUo2XwqAGDeB/3MRBDJIwbUTd01KEClhLb4W5WoOKOkfflAe2Sguztwvh/3DARGgCtI=
X-Gm-Gg: AYBFou1SO0Ipzcjd0D2wmyjPKnjqYDAeSXawYImNJCJH48+oqIrWlJJYT4mY2ijCPD7
	LyNWeFJHAICK3PLc+D5h2Kj21zKu7S5OJc5TMNnTXxJ680cNb9+uNajIRF7xBfYz8hhRoRoZRqA
	kJwj3D2kZHVsw9jJWCwmP65hOuDe9/+icNL9vnvWQf63T4Bu6UhbwPP2zUedlEQ28cy3RdBrZjn
	20CW5sDdJSASQhx8pWiqL3pkidXxGDQMaYEP9UGzfSgIl8j+rUENdltE2+8wlDCqpeUmedgBXje
	CFv2zeJN7CTKreBGvV9xj4uKMThuH/OK7jckQk2yDxshzx6sQKmgGujr8JumCKJmPpGK8M60nxo
	CKqDO2WPtutleNp9WQ58mVUlO9SLIphXUULcJNdb0o2RJeXZIaKaDufBd3oEO
X-Received: by 2002:a05:6a21:3a42:b0:3dd:a196:906f with SMTP id adf61e73a8af0-3dda196a68cmr5966984637.57.1789896000545;
        Sun, 20 Sep 2026 02:20:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a42:b0:3dd:a196:906f with SMTP id adf61e73a8af0-3dda196a68cmr5966959637.57.1789896000162;
        Sun, 20 Sep 2026 02:20:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm9353630eec.28.2026.09.20.02.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:19:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: nord: Add display support
Date: Sun, 20 Sep 2026 17:19:27 +0800
Message-ID: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfX03finfdhuBqr
 KJT/7zKU2Pof3pIErrJlrt8OHXEO9w9WHSE9COwDkmNa8X7I0zD5xdj4mxZB01xJ3Jn7atog+5G
 jBrp4VaQ4dEdm8B4wosX/2OT1qq2/T/l6ZIHvmFK3BuVuimxX8zeW5ASfsFbvCuJQbTnFOrHblA
 54zfs4L4Y7b6Ji/N16b7Rd6JeXPg1tiZLARepIjUWFIklSPamFcCjtPcBS3BnhAcd9v3AQAW7pR
 AgPuMnqTgqMiJS6XYFEvwkfZ0aMTLinKIto8Vd1saF4rTPkzaIyX6r/4Lr/6K6tfqdDdMSjUUU5
 60vM0AEtWlO0MoG/hWrVncfywsssqtCGDYsvPPMHn0AluKw+q+OVekKMK5aGFApVC0kl3c4TOJE
 d/rkmNQVqUKYzjRZ6WDos0mL7Y9teSFYmlNYfvBy0v0tC9FqLn21qtMA5PaTZirH7nWF9dDsLwx
 LuXd6dcqctoCKrVjHQg==
X-Proofpoint-GUID: 3Oy4BL0wfJp1gCAwez6ZkZBFw053LkHG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfX0XWl5/jNfFty
 G8StfcpecmOLA6GJu8O+n7iITtx1Uy5/6us7vryykZPKvEeTv2HwSDZGo4uCgA3Iqs/B4Qa4oh6
 LKympyLSnZ3elkI8uVhOHe752c8oWDY=
X-Proofpoint-ORIG-GUID: 3Oy4BL0wfJp1gCAwez6ZkZBFw053LkHG
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aafa541 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Ma267DgbQhYX1yKuqE4A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200134

This series adds the display and remaining clock controller nodes for
the Nord SoC, and enables the eDP outputs on the Ride Embedded (eDP0-3)
and RRD (eDP0/1) boards.

Dependencies:
- Display and PHY: https://lore.kernel.org/all/20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com/
- Clock DTS: https://lore.kernel.org/all/20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com/
- Ride Embedded DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rename label mdss to mdss0
- Drop clock controller DTS change from the series

Ritesh Kumar (3):
  arm64: dts: qcom: nord: Add display subsystem nodes
  arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
  arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 523 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 128 +++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  62 +++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 266 +++++++++
 4 files changed, 971 insertions(+), 8 deletions(-)

-- 
2.43.0

