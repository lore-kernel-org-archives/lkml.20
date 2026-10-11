Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01540372EE2
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723788; cv=none; b=RFtobDnqeZxM6ewrpMdVM7SWf0Kv+fDY/wciG9w9/Z5G3AHjOXANJICSdy4B+MuqFWRzBey9AqlyeN6L8ecdmpt5oYaPVlh8g1W79hfXmKXlOCGV9T0wy/y99/HirlJQlzNFQZZ/CPpcALLsPFzMa6obFQrSBE6F8GRW8NA0yOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723788; c=relaxed/simple;
	bh=EmQtqJt4Vi3RA8CmOOmxHaZi5ueEFNlsBRJNkkt4Vhg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qf4/eT1ySDVX5ygWaSoUl+sOYyNicbSRoL3KoVdJImUsUlqJKhpCwhTVCoQwT/PLxVIGdwwGktXmrwh0MQRY/sJivtfGtF+vU6VlShHIkpyX0ccQoWOswbtjgOsvfogZ1J3cah7cNOZ/qki1D+v/Lwd7Vu2oBV1BOH4R0HOBf9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaIRrDB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S93kzsl4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaIRrDB3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S93kzsl4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B85kKq4075869
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AUOpgf+RXp6nS+oOyvspr4
	sE84ahOJ5w11wQz/WnIpw=; b=JaIRrDB3eSnlF//sA6Uo3GQOepbOhW0/awKUaZ
	tRn/tRPfduVghu1MbrBs6Is56iYEXLPjTJCiOwSaazGD5lN9F671K+WamAX+YMhn
	Q1My3SiCDFs4TJEjXVG0hr9UblZ5d/QDPp3I92jgM61Tdk1T46s1qMIJqtjIHrM/
	1YVaXZi1R2Hkn4M5xmPqkpY9D2oA9MkgdCNeufOINnWak9Cs+l2NV3rvLdzV89Wh
	uyqoq9HEySZ2dQw7OIIhDXfKxehX4T38BTWc3N1IcoSMSdlgXOdqvN/6gWvbvidO
	mQRRTsNkdRn2Fb76ZEEtY1/zMrlWtIm6+sdtfLr65B9Kz8Ew==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fbcku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so3655635eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791723784; x=1792328584; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AUOpgf+RXp6nS+oOyvspr4sE84ahOJ5w11wQz/WnIpw=;
        b=S93kzsl4biX7Ux0xScUj/E1GmgceVXEfO5qhZXiLxCpvc/MC3wugyVwP2OfZ01VTa4
         97fiE9F//cepuzPUtLVbTwZZJj9vaoBCcaQcnVq32nzKsE1a74MA/tLd4n8baF08DlFg
         J9cLgbpDSWmCEIZ4FF9ESXGTyvpIxyvKAfUhhuKbkI5oM4qmLEHRoi0eyaAHg+r9hxFk
         TjDh4P+bpBTqmlZ8O8/WEin/+grzTtNCI8ySmdaKCFqsWjUa9XMGSoCPQgxjdW9psx84
         W4SwcM/zedRSEqKklv10v1eKkfH/ln4LCyx1B64PUHXOwH8xn9Z0hNMAX7LlNrjf562H
         JniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723784; x=1792328584;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AUOpgf+RXp6nS+oOyvspr4sE84ahOJ5w11wQz/WnIpw=;
        b=1w/4kRD1UykCEf7sOETsomCpqup+PLJ/O0o2SLmuJhUYmTcr8R+EftPbI3ZIu+1Znp
         0tCPV8B+GqBC6knq4VxDmfoVWkeac+Adbsid5XuNEQMbtHIgaUePCQtKlKs6XNEcP09j
         YMXy1TVTv/4Em6HiOIU9wDm2tRrln2S3L18ydaNAeUf7+pPcvT+15U6OpTmENwPl8XBZ
         D5qJdvkvb+BlSDCO40Gihy9L0SrY+7Q8Egdi5WCsTATs8LoG2lyIXrpCBPXBdjqYAr5L
         S+lpHmA7BfVIYpqLAAQoRr1JcIkXTOhsIVbEf+/Omtvbr1JoZC4+8AT4W6wi7PJWKGkj
         YhVw==
X-Forwarded-Encrypted: i=1; AKwUvBwPHHc/pF3E0UmQzOY8vfMnxI2Y2khNl+9YASWU8jroqcuB/HeXcRS5b5ci2dDMxi37ywPAep8k/qu5pxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ5gapYsjOuhiyDsIXMBXbM19W/jgygcWTN+GeYCNHRm3pT7bJ
	fCcWrs4HCP/2pexjjoFrQzbl0cntL0qLz4Qzzd3lwkqVJz6KMmRvTKV1c5rKIM9GmssrUVnS500
	jDGO8RZWCb7mbaqjo6lOZw+V3GG85YJXHuTohrWqcxgXyJXj8lpp7TH5ejhPjeG8OuSQ=
X-Gm-Gg: AYBFou23aqP+X+G/PVCV0MxOlI64ZlK7zlK/9jRZjrL0tfVvdZE7wYdOkAF1CYETQY5
	uhggPf+zY0G+Tms49IRnopDZ/G7s6vTNVfDbPVrMeIHWt6V1+F/6blCL/s0zzfPbR0I4SJAiXSn
	nN1bZjaYU6edVH/pXQUW/v4Jv/R57uTxHDw3Fgc13IrO7c/nXUeTjqGWyYiR/eJQCbZMiQjII9F
	jG4uF/9FVRWWLd6VRIQ5ZBO9KbLgH4RBlY/fMEVohTgdDHnPYdFabXWLgqhTsb9RNyuC6Ta1qlI
	cPxhLVeGpWHoUghE0l7V1rxLE+mdnll8LJW6VLJ2ddpbgGvQx4UxeGkfitMAMyT5fGC7RcKiQiO
	0KXMM/5TsnARiI9HoKAgtbmcI8aOod6N29OsrRxIsRCI=
X-Received: by 2002:a05:693c:620f:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-3537dfc7ddbmr12020346eec.7.1791723784036;
        Sun, 11 Oct 2026 06:03:04 -0700 (PDT)
X-Received: by 2002:a05:693c:620f:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-3537dfc7ddbmr12020287eec.7.1791723783231;
        Sun, 11 Oct 2026 06:03:03 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm27009074eec.3.2026.10.11.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:02 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH net-next v2 00/11] net: ethernet: qualcomm: ppe: Add
 support for IPQ5424 SoC
Date: Sun, 11 Oct 2026 06:02:06 -0700
Message-Id: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM6Iy2oC/3WNQQ6CMBREr2L+2pK2VjSuvIchBMpHvpG2tIVgC
 He34NrNJJN5M7NAQE8Y4HZYwONEgaxJRh4PoLvKPJFRkzxILnPB+ZUN2vYlueGspCqdQ3bhNcd
 GiboVCKnmPLY075MPMBiZwTlC8UvCWL9Qx21xYzsK0frP/j6JvfH/aBKMM5HrqlUnVArxbkPIh
 rF6J7LPkkCxrusX04Pg0tMAAAA=
X-Change-ID: 20261008-qcom_ipq5424_ppe-70b0ed41bf1e
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791723782; l=3540;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=EmQtqJt4Vi3RA8CmOOmxHaZi5ueEFNlsBRJNkkt4Vhg=;
 b=4JzeDAF1Kv5VVNb3WK8PS0ZE9c00Zg9VC7TkTDXUogzoQJ1KwUQ+oeVWbVtBFx377cxYv2y7x
 EHr7YBQL9zsAf7qFon0iBCjX+xr9ASUiF3Xktk1QOwLRP6b7UddiRKe
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfXyN/td0SAWQ5/
 LvMBEnjpyS258sA7MsCGnQlf6AwWUX9bofoLSfAf2lnHyEk5OHcLwrPlMwRNMwKwJP2sSR7pih7
 Jsnl5JUg00GCllQXAO0GhWLVmdgu96w=
X-Proofpoint-GUID: UzvkLJcku4NcestZI8on2FvizxRInh_s
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acb8909 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_HJu7uXci_xTbGPMvK0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfXxctK9YeZG7yx
 WFzsNORAP9FO2QewAEQFRUZczgx8buMTDiZRPyOlILjaO5dRJE8fIxhWLAKtMHrICRwPx7Yw4fQ
 Uwn9+urYAtDkCXDUbUVk7gHNbFiBUBiNmdknS4tDS/ixXFSAC3G6B1rwdJ3V0VEmHazoCIrPSMs
 qTlD0BQs8fPLiQIEtODiXk+ZmgXXVmzPPVvdqS83xD2KORU5PFHJ7kg4OZQh2KVN7tVUeMOT1sT
 IRM0zOGNFP+mIRQB/KRSgzFBU794B/+C6Wu8VmAcN/T5mqZ3ewMqpYf5yau/SqOVPPs77J9vMiO
 l42zJE59T9q9i0A0A9ygS2DuqYpXSb0VgcYZ/z3OcG+cu+oHBAWj/BafTrRNR9bchmTzuOWkPZa
 dQ0uovgzSc43iXb6uV2fy1fXHeqv6kDgsJMyedHfWpHr/GEtoR7o39VnskSzRL2MrDm3lQ4rhw4
 rDQMqBzFbsf+bOxXXNA==
X-Proofpoint-ORIG-GUID: UzvkLJcku4NcestZI8on2FvizxRInh_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110051

This series adds support in the PPE driver for the IPQ5424 SoC.

IPQ5424 integrates the same PPE switch core as IPQ9574, but with a few
differences:

1.) It has 3 Ethernet ports plus 1 EDMA FIFO, instead of IPQ9574's 6 ports,
    1 EDMA FIFO and 1 EIP FIFO.
2.) The PPE clock runs at 375 MHz instead of IPQ9574's 353 MHz.
3.) It requires a different, smaller set of interconnect paths.
4.) It uses different BM (buffer management), QM (queue management) and
    scheduler configurations.

The first two patches are independent of the IPQ5424 support and correct
issues in the existing IPQ9574 support:
 - Split the EDMA reset in the devicetree binding into the separate system
   and APB resets.
 - Fix the multicast queue configuration table access, which uses an
   out-of-range index for every multicast queue on both IPQ9574 and
   IPQ5424, and accesses 5 words per entry instead of 3.

The remaining patches add the IPQ5424 support:
 - Add IPQ5424 to the devicetree binding.
 - Document IPQ5424 as a supported SoC.
 - Add the IPQ5424 platform data for the clock rate, port count, register
   space and interconnect paths.
 - Add the IPQ5424 BM buffer configuration.
 - Add the IPQ5424 QM configuration.
 - Add the IPQ5424 scheduler resource configuration.
 - Add the IPQ5424 scheduler configuration.
 - Add the IPQ5424 service code configuration.
 - Add the IPQ5424 counters for debugfs.

Changes in v2:
- Drop the Fixes: tags from the first two patches, as they target
  net-next and have no known user impact.
- Fix the multicast queue configuration entry size (5 words -> 3) in
  the multicast queue fix patch, and update its subject.
- Match all Ethernet port nodes in the binding, so that out-of-range
  ports are rejected by the reg limits.
- Collect the Reviewed-by tags.
- Link to v1: https://patch.msgid.link/20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
Luo Jie (11):
      dt-bindings: net: qcom,ipq9574-ppe: Split EDMA reset into sys and apb
      net: ethernet: qualcomm: ppe: Fix multicast queue config table access
      dt-bindings: net: qcom,ipq9574-ppe: Add IPQ5424 PPE support
      docs: networking: Document IPQ5424 as a supported SoC
      net: ethernet: qualcomm: ppe: Add platform support for IPQ5424
      net: ethernet: qualcomm: ppe: Add IPQ5424 BM buffer configuration
      net: ethernet: qualcomm: ppe: Add IPQ5424 QM configuration
      net: ethernet: qualcomm: ppe: Add IPQ5424 scheduler resource configuration
      net: ethernet: qualcomm: ppe: Add IPQ5424 scheduler configuration
      net: ethernet: qualcomm: ppe: Add IPQ5424 service code configuration
      net: ethernet: qualcomm: ppe: Add IPQ5424 counter debugfs support

 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 102 ++++-
 .../device_drivers/ethernet/qualcomm/ppe/ppe.rst   |   8 +
 drivers/net/ethernet/qualcomm/ppe/ppe.c            | 137 +++++-
 drivers/net/ethernet/qualcomm/ppe/ppe.h            |  15 +
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c     | 469 +++++++++++++++++++--
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h     |   4 +
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c    |  14 +-
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h       |  83 +++-
 8 files changed, 742 insertions(+), 90 deletions(-)
---
base-commit: d8674294aefef02266c4d47ad10131f1bffbe534
change-id: 20261008-qcom_ipq5424_ppe-70b0ed41bf1e

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

