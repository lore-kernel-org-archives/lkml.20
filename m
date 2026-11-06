Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934136;
	b=EwEbH6/IJUS84cfgfcCD9+wDyd0D6owqW5dIWZzXYVBpgw116ELxZOsnI20qIn0HJY4S
	 TIFGrqHC01WxdtLiyaFWR1t4G2yY8euY8xU79hRpyt5pQiOr2/CLHO7efrgFx70Bg5FVf
	 GzkKUegQnQHF6RjTrQ/5mqGwcazcEtIBMFitxU5oW6+FMpsajKtnjjO8FEwctdAmyXNCV
	 SowoHmf3ZuQi9XzkLCX/hf6+oRrm+GrOxj/p4ZzcVS9H7bEApR0t6Wli89XoxwmVHX0ZY
	 s6olXPBr/VvzfBU7kAT4pBLrO7JbmfZ3ZBZJoIBKwHJaPSAU8etc5+pC6kxeyKTgCCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8j3XvDGdW2LdaynxevrBPlpdLDG+c/bQ89+apeYiX/g=;
	b=wtM8syeOx/0qEAZrwCAwWszMg56RMglNIhcJBY8HLdaKtiROCJNpCwrGPZrmGxElwkvz
	 KfbTRkPibKbWYTZViyRQFCdLdkB4lmQjX/bBDU3+7ADjle5hwvPtWk5m00xu4yGhtmiJc
	 EUNP1X0UrbNzwWJ00ohSVocsTQk3AntVvG84ZwRXUSsIi6S4hydqsWzvOLICpQavPFLdn
	 F1awCBlGG9Q2DCymRe/8jaiBhwMSKcZlwoBZVRh20pzixohA9RgpIFR69FmTx3uTiQiHf
	 OwQevTOX6Sz9pdntG04b0q1jNqlXJi31A7HvET/kT59ZXRsKnKOBh/vgNiNoQiqkANA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RHWtcteQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZAcDcqX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFAB606A339
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AFAB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RHWtcteQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZAcDcqX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeOAv3295442
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 03:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8j3XvDGdW2LdaynxevrBPlpdLDG+c/bQ89+
	apeYiX/g=; b=RHWtcteQGaMRU64YkRnqkmV191vilO66tfkPxdKF+xU5483fDKF
	WZS9j5/FskroCvWXB1GiSvDywhNMVLx40cXNau6z3VpqIkfx4KroopaQ4Fdy9UOv
	+vMJBscOU74HXOxilluzEp4OoPluQi6pc6n/mdrmY6O7/tV3dTGMChHd2yZ0qt16
	7I1GCyA8+LSCBsoo13UoXipZeuIO+ADcWrAncMPpZ3XHdA3FB5T6VdJFqW36ZOYD
	S+AG2ARJNu7+NIS3jE5hkzLxT8h5jpAT+5cbzLwaHVI1MCALqeHRIS1DxtxFBjUM
	SoalYoUejOlhyOAZTZeoq5Y+FioN4sXf16w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9rm0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:02:15 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1ab289bb41eso211622c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793934135; x=1794538935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8j3XvDGdW2LdaynxevrBPlpdLDG+c/bQ89+apeYiX/g=;
        b=UZAcDcqXVYesCM9ONw3xM6JzBcw438TjOAas4MGM/nsMj5SIhIbyCpYkfImxuTf5R1
         x1vZpLM2qM/KvyaoXPUYbMV3CBzqDFBSBfVELCnygeSYY0aRCJsJFkL/H8MDbVO8gM9P
         ztTRbQLOBsEo+wU1YwWUznQE6Y4QhbqkyDb/hAPI/YotAA2ttTQp/tyoKccZpCVc382p
         HZWjEAknNn/hC7Fnsub3RHQZIHDB4jvFjwC0v6TQJuUP/X7RW/f2jbhTc3XvExjanvUD
         FtRfbbe2rrz5YzyE1KMlq/sZ1RDXNX66KKJplvED51OZCKaQw7O2sI1sXbYEjIV9QuyD
         hlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934135; x=1794538935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8j3XvDGdW2LdaynxevrBPlpdLDG+c/bQ89+apeYiX/g=;
        b=bBGcy9SPZ5SJ/UbFzgd75xZFIQQb9rIyeaDYJZ3MJTBEnYxqhYcIeJgFfXBA/Dcl/7
         DCXK7ZSGFY9dCufl6KcB1HdmWjFpV6mQTEtQwHUSUYGE6fyknc+4qMdmU1ELTzxcPVOZ
         i87LN+E5jgWtLrbIeqQ5azSiuWRUpY2wd7vMK7G2DzL5UNc+G4bTqKz3vQNE2LntRHIp
         1OMLuRSEcF31T/gHEtp5RFlzvItBk4NrvLuauVomd9+TfsTesbvMybOioGH9/3O22ele
         N4KZw8vCh2ivcQDTLulkybKMlNmj/YLZMMzxN0xKXzL2ETNuhAOpxnhKHr8MjXDGdndl
         Ucbg==
X-Forwarded-Encrypted: i=1; AKwUvBzL+c29v9BY0zS/baVJ32ILIXloonPJJ2vuHX8JCq/lxzIIGgVPb5pSgZqTnV7b7DD8NdQEQTZmAv0YLDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FIuZVWnpCzlwdgOLHYiwFdYJB8gsF1vw6IBYpyO8ucE4Gvr6d
	520Qx4gTWbjUu7mxQbGkL+zPeH6qxUzx4JdSvoeefRD9uC93IMjRdjykAngvxkjDkgnSuVahKIW
	RPdjMN4ymDgsPaV2KdomkDzIAJnEOZ1TEQI5OkN3sf4KgAIEFnEH3anxn+nXDiLbnkPA=
X-Gm-Gg: AYBFou11IqQWf/+C/3DmFFHAkjmM75qw/doVrZpxINdISlPO7hIjxkasdVvck4VxhP4
	Db6KbAehNcROahdJZUmLsYcypd5+YXqCzSnZNXvdND08gHqkPhYpt7dYyYgeGoXpCx8ZPEhGY9W
	RCzVgT1iVxVvwf0zx3ikWQnTIGJ2amK1TYU7T6GDC8/Z0hyx/K3rTQiB2jbA8w0DPpcm+6x/ycJ
	ikmWY8k1q19du0CTk/dnrLmFktzDME3ejKayQsoHKCLLX6FDsmrnY6F3wVgxTkgXixsmwnP331o
	xIPW21mPV4mi4ye9wRhSSP4tY00eD8H8Qwp4KAZVnOa6dGVTjS/IJNFKjSGG9BggFWUIyiXtNnQ
	GsGd9RT+INnjFUnjyROlZTx1veRPVaIa86zGRu7G4bFAL0JqTlS4yEHwchZVRXtJfsAFCfDn0WA
	1uNBcT4kke+AAg4XV7OmfbAb5Z5U0=
X-Received: by 2002:a05:7022:1702:b0:184:40db:6bb9 with SMTP id a92af1059eb24-1b24f4aa5eemr6002999c88.8.1793934134735;
        Thu, 05 Nov 2026 19:02:14 -0800 (PST)
X-Received: by 2002:a05:7022:1702:b0:184:40db:6bb9 with SMTP id a92af1059eb24-1b24f4aa5eemr6002959c88.8.1793934134052;
        Thu, 05 Nov 2026 19:02:14 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm1484905eec.18.2026.11.05.19.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:02:13 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: dts: qcom: Add CSI2 PHY common-phy providers for SA8775P, QCS8300 and SC7280
Date: Thu,  5 Nov 2026 19:02:09 -0800
Message-Id: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX/yx47IrJ61DA
 lEd/gDMJTVaYqhVXIqyBZObGDGdObXSCZVtf2PAz1PLcsQEGckXUERfk77x1s5iyOUP8ycG1pvC
 CDSCOY3abkKb1xLibvL4flfS6KklwJc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX3wy+Isx9iomC
 +m6jrEY1O2T+7/gCCCkxWMpnWmOugS5gJf7oGOzvOw93CHKHGNeJQmHBaGcjODdMkMRQYc5qvWW
 awqIu/RtdtFT+YsKl6xzocxNxfgRVWqjSQUjWuEYEQP9WUo8BtXvM3/32gIGGdBwAxHwrq6P4ul
 lOjfsl4OVY3KbUlvqD3I7JLer1L7Xd3IPnYutXkH2ONAdFN2JKeP7GUn8qoByLcfDsioSOYfM/l
 A0UetqOuxNfb4RKUSe7Gr+lZVqB2laMFk8pBb7xGMCB6kIr4NifbLR7L1BaDPa4BXCrPASFSbP8
 yvokh5duMRi3ypbMgYppUI64qQ9/73L7PfPsMAOEY2JHwiiOlD2VFD29RO39z5qalxMaFgIp9/C
 qPijLxREHTddS7ENKAFcGHDP7yjuVB/7UG7c6NolfXbGDlqSFe45kwF6q0w2nVpb6f+UWT+B20t
 Y60TmWQSYQTS1KdhHbw==
X-Proofpoint-ORIG-GUID: ILSzBiYR6emS5ktdO3L_8JDRb2gYRarR
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed4337 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TtAy84kTgrs9sRaG4nIA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: ILSzBiYR6emS5ktdO3L_8JDRb2gYRarR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060011

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
   qcom,sa8775p-csi2-phy nodes.

 - Patch 2 adds the three QCS8300 CSIPHYs (csiphy0-2) as
   qcom,qcs8300-csi2-phy nodes.

 - Patch 3 adds the five SC7280 CSIPHYs (csiphy0-4) as
   qcom,sc7280-csi2-phy nodes.

This series depends on the compatible strings and soc_cfg entries
introduced by the driver series referenced below and should be applied
on top of it.

Depends-on: https://lore.kernel.org/all/20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com/
Depends-on: https://lore.kernel.org/all/20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com/

Changes in v3:
- Patch 1 (lemans): moved csiphy_opp_table out of the soc@0 simple-bus
  to the root node (a simple-bus's direct children need reg/ranges,
  which an OPP table has neither of), dropped the opp-300000000 entry
  (SA8775P's camcc only defines a 400 MHz rate for this clock, so it
  was unreachable), and reordered csiphy0..3 after camss so soc@0's
  children stay sorted by ascending unit address.
- Patch 2 (monaco): same csiphy_opp_table root-node move, and dropped
  both the opp-300000000 entry and the extra "csiphy_rx" clock from
  csiphy0..2 (QCS8300 binds through the sa8775p soc_cfg, which only
  declares two clocks, "core"/"timer", for this PHY).
- Patch 3 (kodiak): same csiphy_opp_table root-node move; its
  opp-300000000 and opp-400000000 entries are both kept, since
  SC7280's camcc genuinely supports both rates for this clock.

Link: https://lore.kernel.org/all/20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com/

Changes in v2:
- Patch 1 (lemans): dropped the extra "csiphy_rx" clock from
  csiphy0..3 (3 clocks -> 2: "core", "timer"), matching the driver's
  sa8775p soc_cfg, which only declares two clocks for this SoC family.
- The "undocumented compatible" and "camss_detect_legacy_phy() does
  not exist" comments on all three patches were resolved by the
  companion phy-driver/binding series and CAMSS work landing, not by
  a change to these dtsi patches themselves.
- Patches 2 (monaco) and 3 (kodiak) are otherwise unchanged from v1.

Link: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/

Anusha Arun Nandi (3):
  arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers
  arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
  arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 136 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 104 ++++++++++++++++
 3 files changed, 412 insertions(+)

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

