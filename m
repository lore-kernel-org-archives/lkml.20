Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B351A6807
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195883; cv=none; b=nF6ob8yHxc68GimPXfPpc2ZX5t0MZOEqhNQwO4pTO4IzUuOhbQrLzJbGY1eyUCY71LMWiehwGRhqf+wxBPk7kBjDgfNC14JY1QNArGEz3Dbzuz/wq8JZvP9ZbTfx3D6rfWoZ8aA8vtQJTNWjzNKgdm81io51Ljx3ffiBOASHa6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195883; c=relaxed/simple;
	bh=bQChtrLj0fV4NUZooNZdboNgMs39XExDGu+d9ixnI1w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y36AFSVDko6UgK5QmUL3qgitW/NGcGz3+kMiHLgwpMeSDa4yOLXckiZgwPLHZwkEp2ttJ0XAEJvYkHCwRcdYlpj0cGJmZtemnOcZkMBTc01P5gEqiDpHeEY0PHciSlJRJgC6iKE94rd4tBgVyys7t+M8AD3BZlxNsq9jhjtddD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/891Hyf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQcFXgSd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/891Hyf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQcFXgSd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFIKZ3322683
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oKphrI7ZiSNKLYHVhj/lH5Hw+pQG0yApYyA
	hWQjXN5E=; b=n/891HyfjTfpBOLGYs1KEk7gOul6VMtCkk+ayYiHTJMh25PfHZw
	sUQoshI62BDvN5fU5FwmeUhJndiL1tT6JKkDYcFlfsWXwsbUshEW8+rNtuaAeE/c
	+vtGViBuTjdJ9pTPB3laAFA/MZv9uxFmGQQexyM6D008JQzuKn9xd8VqY7mfkhb1
	01wKIZZJBjnssadBj1m68hd2/le0Aa9IwU2n5Qd+VHLJFi00wdzKUVPbaODsGJ3b
	JsWgS/sa6QVqiVHCQXv2pFWAlL3UgA5JLcPO8b1ttdXO1vdtbZXkCI55m99rPKwa
	uQOJBuND22mHMdB3d8oNw3/eRm9nAMv1Nog==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumttna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:11:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-143826c4a13so376950c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792195880; x=1792800680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKphrI7ZiSNKLYHVhj/lH5Hw+pQG0yApYyAhWQjXN5E=;
        b=HQcFXgSdCP1/2lkw5JBGQiZxKW0cUf79LUn0GOXlOgMgdK7kG8M1P2mBxiR+okX8MA
         93uyh/ZixI9lfMH+EKSuZ42mz+Kn/IzLT+LljWovsvlg4zorQDdj8CIU4Mwj1OItxMlk
         nXME+KTbsFw0aoLDFnsovQz2ElrzfD7elF+2STX/WCJeZWo6OZcJ6ErJXC92fy/mqHr0
         KcEu+YZg89NnnMgx+E7/57yQ6kuDOP7jNQFB1lgMSMwfFGRZTP5Gn5bzuI8/1OoOgd+o
         qBmCpoGKVk2mXPI/NbED6oTuDBCjUlw0LX3y9TRAbRPKnKUiqcvFQYbi1TgxilJd7cMT
         4jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195880; x=1792800680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKphrI7ZiSNKLYHVhj/lH5Hw+pQG0yApYyAhWQjXN5E=;
        b=LMFlNkOJoPT6a3VpDjPUz+y84nyzDmb+fZogacULgj2WDTv/87TiOf1OA0wE2AwdJl
         Gy7tOn0pn4p9VcHM66e7FOiSD0T8tja9r/JdZzft6UvZV5OuFlOg6TDE8pSdce3igZyu
         /FVMvMT8VihuMyd71HwfpnUwjMPv1/X9cQFg4jxyDXlceJaea48w0Lf75pEFrf00Rgzf
         ucP1umHUsJLcGOoex/mreN5n+8JvXhe1zGHc+SUw8uwzyx5h+7SC+DxEy5EZ7hZ2JOus
         tFsv1iXsow1Ne6mZcuHhW7tWcPUV0wmBWUjpPZ1HmwHSpHmeAeL/mqUERzO2M94sWcLU
         tktQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBmiCKgHdYWWRZZM0jpK9KgbKmss1BzgwgOLSR0NOL353rr0MBcC8lCuUGMK7g1IZBQ6LUAYvyOShUbU8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq3a/tbcsc6jo2I+E7jTSdPoZCxTtsrtFJIbkPSHG8rUfHAPm2
	GPNesMqtn7uVXda8fIu6Q044cuyAIsevZCaikd1cjwybLVOQTj0G656BevSQClw8R5yy5BSX3Ez
	GpHAvdhv0IsFRA/RWRpGwiNzmOifo9KTmes6scAd1eE8csrj7L50ofKvu0HPozVmDqsY=
X-Gm-Gg: AYBFou2ZB1B8woqATwozaYNRudxwbMyqcn9qCK+xVyOZrqV/0MpZ5s7bXgAJQre+WLu
	vdH3KQS33N+EZE5rpsRhnfVDSwFlI6cbrnZVzmNpUq2p7Qk3g20KTs7+AB/odGw5rCHci6n2KW+
	gQi41f4+I6iWPSQECrtKzX1yreY8ZkcrHR4iKFd5RWHMaDqjzWOgG5jJqWtergqY9iU3ywnTOKr
	96VtoUkSelxHK0j0VRHImfmVGKluttl1mEzCTe9vq/KL2zuF9DSU/6Pi/GAaOU+egePjpPRL2lI
	dtUnpLPsO4o2ecJ2wmlv1AwGCjgHFfL+5o+fF9mk43TBnuMwfBe768mlc9ct5LFowB0wWfXFoBy
	md4j/dcZZNzX8+JnHcyliNvCPIw7aCqmV/gIq83pxopHIvFfK/LvsBA==
X-Received: by 2002:a05:7023:a56:20b0:166:3e26:c4b5 with SMTP id a92af1059eb24-18512296a15mr1732248c88.18.1792195879663;
        Fri, 16 Oct 2026 17:11:19 -0700 (PDT)
X-Received: by 2002:a05:7023:a56:20b0:166:3e26:c4b5 with SMTP id a92af1059eb24-18512296a15mr1732201c88.18.1792195879082;
        Fri, 16 Oct 2026 17:11:19 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm13441361c88.11.2026.10.16.17.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:11:17 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
Subject: [PATCH 0/3] arm64: dts: qcom: Add CSI2 PHY common-phy providers for SA8775P, QCS8300 and SC7280
Date: Fri, 16 Oct 2026 17:11:13 -0700
Message-Id: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwMCBTYWx0ZWRfX/pSMdn5fkU75
 5225mlPEZq3XYA9kKkaJ4OGUNH3sJeRnARXlFLtuAVB55CvP+L+KZ3uiDfu3vs+WM3VQkM+RVsm
 oo6itgWKSXevpg57vOnZoh9G2pV0DSw=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad2bd28 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=g5diQEdcA98iFwkwvTMA:9
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7Ivq6zizDGkdrrEhaVN1MrqcMGZStVrn
X-Proofpoint-ORIG-GUID: 7Ivq6zizDGkdrrEhaVN1MrqcMGZStVrn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwMCBTYWx0ZWRfX67JjO2oYBCOq
 SN0EY4z0wrVFDw/dyg+9qot0LHTtGopxJalVO2KlR1baEBn+IUHzGZMmupoyPiTc1XM9rNJS9sU
 iDWQ8loUWwn0zbLLBN/2wSevNroNtzh2QxKoKqoJ6LUhsisozcGUyanvi9IM9WEkViBFd4pEGpu
 verg4BzIyUTdYjAPNsOJKGJlCReNaSHOyV8Asgvjttlk60KllkxJFC873K9t0MId9+ScFLnNtdo
 h5WFnGOJfVrlxyI04/8oNA2ZG0IVwHC0xCBx3f/oMb3ttoUdEggBvkTnGLDWHm6OcLbvIcGEGmV
 /9k7j8g0loR24EbYlxas2Az4LSts98geHm8+QQq7DKfNdfvyLeYLJN+tDwUHXJz+GIbKvXV4TnS
 DZzD6lo1nV/ZPgpPVKKCM05gNqwgcRjJsHS+AA5BVGG84iyqzllvmPW44sVaKTHv6J6A3gHm/1N
 olz7OmUY0giutOydRLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170000

This series adds devicetree nodes for the generic Qualcomm MIPI CSI2
PHY driver on the three platforms whose compatibles/soc_cfg were added 
by the companion "phy: qcom-mipi-csi2: Add D-PHY support for SA8775P, 
QCS8300 and SC7280".

Each CSIPHY is exposed as a standalone generic-PHY provider node at
its existing register address, with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing), so that camss_detect_legacy_phy()
picks the non-legacy path once a board wires a sensor through one of
them. The camss node's own reg-names/clocks/interrupts for the
CSIPHYs are left unchanged, so boards that don't use a provider still
fall back to the legacy in-driver CSIPHY handling. All provider nodes
are added disabled by default; a board or camera overlay enables the
one(s) it actually uses.

The three patches are otherwise independent and split one-per-SoC
since each touches a different dtsi file:

 - Patch 1 adds the four SA8775P CSIPHYs (csiphy0-3) as
   qcom,SA8775P-csi2-phy nodes.

 - Patch 2 adds the three QCS8300 CSIPHYs (csiphy0-2) as
   qcom,QCS8300-csi2-phy nodes.

 - Patch 3 adds the five SC7280 CSIPHYs (csiphy0-4) as
   qcom,SC7280-csi2-phy nodes.

This series depends on the compatible strings and soc_cfg entries
introduced by the driver series referenced above and should be applied
on top of it.

Depends-on: https://lore.kernel.org/all/20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org/

Anusha Arun Nandi (3):
  arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers
  arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
  arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 148 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 114 +++++++++++++++++
 3 files changed, 434 insertions(+)
--
base-commit: 37dc35244bd8c6be6d79a6ac591d14c660822dd1
change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

