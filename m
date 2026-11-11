Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383519;
	b=TCF3DLZNPJEKDX3Hahqf7hS0J3G3V1OWvzsYFHrnMjwi/OLErA0be7it3V5nxVrKGlBH
	 WnX7NOPsGLcQofU2yAsNFOON6fqwJfAbI6fdK2+WRtjiZgTQ7edreUlFX2CYkencpaqMr
	 bVnKWBDhWuXDF8A9qZN3levPNqeRZwz2VFy4uO+Z7SG5ZF+werfp09K95aWSUShWsyhkS
	 GLzuvZWVqP/uj9JbAlCQH7Ec+qjrXR3Uw0z1+P5CAzilLO3wKHcfHrf9V7hQnr/xoG9gE
	 PAfjKoqqh8SNScLuS5UxbnkgXnsO1Y7zTqW0UNHIQCz89q8qSpx72rz0rJgDLTSuVKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383519;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sbGapmF40loUUYp4PlJ5Iv/5btWlxr3ogTT7+r0GLOc=;
	b=4D+pBJPcSsv1Mg2WUw22V0v1IfufflequGc5AweJ94/a6xjeK6o3bd/W1ln7dgC1kW0r
	 g38M1tYQth7zgwrZCT795+rC0fHJ5ZQlK9TPgEi1v5xorrrW45FI+sCH7lZXCePHj3kF9
	 hFttfjloWgH1sfRPX6VZnk+Dp8Y68TN0jG8f5s6FVeGCCFEpXo3xoIuGngUZ/qToy3zBy
	 7CVo+O29rdK+OeOJWZP9lPGcCaRh6x2X9PcPIVkp7+Dpqmzfa2Irmekmdr4hkf9HyBMVr
	 01jzcRPkPIIQCJc3DZfoO7bajwZta5iiUHnprWWy6keZ9bLuFyqxmOOrHXaquxRBUMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g6jN2/TJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ocoiuj1r;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C7C606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C7C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g6jN2/TJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ocoiuj1r
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KIYA1386358
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sbGapmF40loUUYp4PlJ5Iv/5btWlxr3ogTT
	7+r0GLOc=; b=g6jN2/TJnKQlQ3LWHBIjulmA/nJ3InBGL9LDv2WANCxjJytwuSd
	Z2LY3dz+FlvWmP2i/illxSJ/WOKeLRvPzVxINF7/OEWKaclEFIl8/jhcg+qpBGZk
	k24ELdPMONKhUao54VpiZ5C3UlrnmWC538ym+hRimmqJ1OIitPMso6fHmB6M71xb
	qNjL/mNJzOWz1hJ+RbPpjdj03hOrU1I1LoCaaE3UNLXoD9X3prurDD4QsukDzhNv
	HcZjADIs3Ertr6jUvcH6+v5gxYmbUZDH4wHqV+5Ij2TZoN2rv1+UA9X8Oa12XIp6
	VTy2ySgG3gYj9SNcl8IDM1OXotcH/H/AVDQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm9fsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:51:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so5125692eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383517; x=1794988317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sbGapmF40loUUYp4PlJ5Iv/5btWlxr3ogTT7+r0GLOc=;
        b=Ocoiuj1r/eto6Tazxq7OR+Z18sK2NNwOK3/aa/FLuj3IoNI6fWdN+q0ZMJw/tWvVb4
         q9/aw8iKnU4+CeQ/NRWr6KQGt/HeGD+UClaWvgipHy/RnEANHCk66wwUTMnrT2VVxMCb
         FvlqKeZ8FLH0sL5Sbuj0UlbHfY/eWWvdw7ZFkedrnlCM11C1f3ARp+hJXtxKEQW7hMNv
         Fh9LYx65z9hd6qU4b05YFCU+gQbuHnJsbQorgNeaUfRJGvCNB9WmsOJsSPDpn3tfl49p
         H9j78xIFBQo/bwTeSedPxoPamS5rRe082yX9noiaUDtJrfsghW5NiEHRkRyQq02d9LI7
         5G+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383517; x=1794988317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbGapmF40loUUYp4PlJ5Iv/5btWlxr3ogTT7+r0GLOc=;
        b=CuwqWBILvaRiPkUqtx80h7tigtQKgq6KItYERWPUoqjfhZ6U5et5cLgvpO/u75bwor
         KNd/GOpVrGBy7boa7qRBXuTblbgd278T27pqisPhBawvg6th+Cpn2O3QSlVobA4fhXZz
         FtZF9LhSCwXlvcLYyezovTrMXc0aUyTo9yuRUf+fIUhXaknoPBz2qBadpentIMEZ444V
         klbBKxXqf2gj5i9cZ4auFe0TElLemEbAJQdFrxIeb31PLjqlpHZQun74f8gNxSoe2gXQ
         vnOzWyODS0haimSXED5iirWoC0DPN6MkT6LG+WGRqVECkEPOpVzw8NGK/aOaDuoev1h5
         bVkg==
X-Forwarded-Encrypted: i=1; AL+hErEbDHUTRzYd9cckJMHBN9yfS3Iju1i2r28XEVAsEQAngpHkeusMxRn95BfEWimGiynOTU8azXWIBxupVOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LXmGor7GIOUdgpYzZnVN/AMaDuwCbIpQjM7gF3FCT0CGJPYOu
	brrqAXCo2WlJuYn3T38I0LJKcuxXeEqoOVT/X9/P/OohzxRFnlT7ZZdbw+V+BdJ909LXyicX1Rb
	EvwIp8FplCLv5CoTX40L/4j0e7AhSXuazrn6hblV48ZspxQCJdVmM7V+tBk+C3+HicVc=
X-Gm-Gg: AYBFou1z2uaOgP0KlqYEqWIMEF9IPGiIIIVR/60L8cX7H/JafZeGI5saZwE5zLE8X8/
	Ty1wzwE3s/1DJQKUxlojrqUH41dPQocgkZ2oaTEv2W5Qge689P7hT2c1Qjms06V2HwFBBm/8djE
	b7A8TmQJsfGQ/IKo6Xgw2lIaTyYVyFlBR34BbbT3kGFwJiYTw48eKcvf8l8OMdT0LQpXUd3kZVH
	3Q+S19vP3h84QgMYV2L+RsptzuUL115ra/LuiNBiZqLQpaM6CjiTgpnEEPpIFaGXT6PKCttlt4S
	2CtLLiSsLTmYSaqXJCkVIZKyD1cuh0zrk8hItDEj5smWzChM1M9xEY6h/oMRw1jj0AcqnE8p9Pn
	TUgxMYj5u1rbLphPmZOPAQ3vm/ejvz4mXyrBEW/dxHK0UAzOeC/61t4JOjbIPnnxxH4ap0KKLis
	k8gH5ROe7KSfnnnl27282i2B5+SrTVj+e8
X-Received: by 2002:a05:7022:b90c:b0:1b3:b131:6a22 with SMTP id a92af1059eb24-1b3c02f09efmr1648453c88.7.1794383516491;
        Tue, 10 Nov 2026 23:51:56 -0800 (PST)
X-Received: by 2002:a05:7022:b90c:b0:1b3:b131:6a22 with SMTP id a92af1059eb24-1b3c02f09efmr1648419c88.7.1794383515897;
        Tue, 10 Nov 2026 23:51:55 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:51:55 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 0/7] arm64: dts: qcom: nord: Add PCIe and WLAN/BT support
Date: Wed, 11 Nov 2026 15:51:34 +0800
Message-ID: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MZHTjfHztoEN44KU5mPdABJJH23tVwIz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX2AqJd3XfC+Mx
 6SfnPf1x8W/H7S0s0c7ZdliSgM3YAGrpRQQ5QcKS8Iw0w9NRSjSvOihJSL6fAvsjVuduoiMYLiB
 7JGuo7v7KkCow0US7qQYMnslAr2FgJs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX61jhPssBWLK9
 FEEVHiwQ67eelYjikafhSS2IaguAe+9EzmIEPxuXiLTZLMw/1d3wQDZSreLKeIqN2ZFWjpcwSI+
 jnLP0vsua8cElSMheAKdn7y49p8zt3ZNShR0TQ3/pEW6uQnT3wodhdPSwNxIFsRoYTGlUOG5bIK
 fTaRAT4Nh88tr72gh4Wt4o+PZc/PCVcZ6bQLJsyCINI/xQvsGhd860IJRXRn8nmyQPjA4U7Kuaa
 FvUEf1dcXuylhP5oH2kD2bv2Fg/bysEBXKS3w2rLnpc2t3MHGE43MrZh9EOXODY/2bEndrzgV+7
 Cmyc97Pif2mIa/1C1cgrOdEUVNZ4TYA6lAVf9VDsTz3ImjU2igRpOotijedDbllJfP13ylDu4QT
 JKeiC+E+wh/Fi4SjxJXWE4XFk/oTz7fidx2Wm8/U33Q+/1U7Cxhh7dol/GMiljJItKlsOujIKGL
 77C4W7RyjSKmq5Napgg==
X-Proofpoint-GUID: MZHTjfHztoEN44KU5mPdABJJH23tVwIz
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af41e9d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=U0NwJVSz-9pN22jjyd8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

This series enables PCIe on the Qualcomm Nord SoC and brings up the
WLAN/BT modules on Ride and RRD board.

Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
multi-PHY. The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
selected by firmware through a TCSR register that the PHY driver reads at
probe time, so the DT only describes the PHY ports and hands the driver
the TCSR handle.

Changes for v5:
- Rebase on next-20261110
- Drop RFC tag as dependencies are cleared
- Link to v4: https://lore.kernel.org/all/20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Correct pcie_phy vdda-pll b/c/d supply: vreg_l1e_0p9 -> vreg_l2e_0p9
- New patches for RRD WLAN/BT support as RRD boards with WLAN/BT module
  become available in lab for testing
- Link to v3: https://lore.kernel.org/all/20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Tag the series with RFC due to the unresolved dependencies
- Add PMIC E GPIO7 for enabling WCN DIG rail that feeds the WCN7850
  VDD_DIG domain
- Drop RRD WiFi patch as RRD with WiFi module is not easily available
- New patch to add Bluetooth support for Ride board
- Link to v2: https://lore.kernel.org/all/20260915015632.283642-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Add missing leading zero for pcie_smmu reg property
- Link to v1: https://lore.kernel.org/all/20260914071944.164217-1-shengchao.guo@oss.qualcomm.com/

Krishna Chaitanya Chundru (3):
  arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
  arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
  arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY

Shuai Zhang (2):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
  arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support

Yu Zhang(Yuriy) (2):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
  arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 179 ++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 179 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
 4 files changed, 1577 insertions(+), 4 deletions(-)

-- 
2.43.0

