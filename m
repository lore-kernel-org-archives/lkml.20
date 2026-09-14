Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF31141D639
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377567; cv=none; b=QVlT8U5a88T6T66FaIab1RSwbObPFml+6bhbs3pcRkpeQbj9xImQ2QUuavUykmfd1WNG/QYYKB3eelpj9sxFydYzYtWczxgbW+wlI7c41IaOm9ETisAoaJ4BJ6gtXKAWkT9zROAfW5qMOwl1VeXTEJXk5DRZfX8WBPTzIR6NIpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377567; c=relaxed/simple;
	bh=LdENv6pEHSZPaMdPoABlUe+8eZ4WRBOkLr7fPIEaHsM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LapX9p2DLxo7Ppq7pdrLF+NEQcYxfLFWWxfchg0aIzxJzJmWDWy23IW8fPqfAyUqsTWrIfL8nWQhL5WaBWBn8Pnc5ZLyIeH0zg0lezYvjAPaj83kKryMi3wN6l9g6yb6/LFML9wzBf7KgwEXOy5f4OUI6SmTG4/VEJIKBxA6UFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MO1mmk64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjeFsERt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MO1mmk64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjeFsERt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8SdIV594678
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zYo6Ia7AJOmeWwK5TRKCoC
	asnx1PwxU0PK05z7YV+IQ=; b=MO1mmk64ChUKs9xKLbzcoZA7q2z8vVbD+KhBXc
	u0sWhlswTJ2wCBRAIvG734XjqCJFBYuulJDIKPzqN82Kzx6rVqy4N9L3ZASr5bfa
	7dlr1d9XkTNeWzgTfP1uPtCDR7fGXeKb63kvL9CqmyYm3u+8rKsFYIa0piUOzVPy
	0lUI+ZiMsOzr9gS8GdSZZIak/iy6hH+59MfkWJxox9qn3gRwpr0APPxlkk8f8WCL
	LyUbxWuaSBmhcbvpRvMii0yeHCSpKcLEaHSMc9yAhHF72hr6HBviLatkCJJWQ8yj
	MQ6as3WUE3iZGQOfnMIauuMKHCvPt0k8ZPg6emOllexP8dPQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevr5rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:19:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398bb9a6408so888131a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789377562; x=1789982362; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zYo6Ia7AJOmeWwK5TRKCoCasnx1PwxU0PK05z7YV+IQ=;
        b=cjeFsERtUuqtMSHxETIXwtZFsxVC/UUWzTdu8ClQdQTz73nAFSodWIF90cIMmtHEd5
         31ZDPhskRMAObMk/J1kbgC3yrkJL9C0gRE7fDItWZIKhf3GqtLjiWmeTdK3Rqtvbd7yY
         5r+QGuCQxhnGbUy0oK7pLeNH0nnZ1aHKPalqdR4X5MQTHu4kBCsiyy34pp2jSZ4j6wzI
         D2eBPYCki7w4H+Pa/qYmzkdiorY+J5XHY64oGGekOz5fXBIpt09jIOy6skKSbJ2HKgD7
         vib4y8x/fEaitG6RaCvt5rToTqepUVrLegdGyHcEvF55NE9P+tVAbMe5TAHbpxZcPf4v
         H+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377562; x=1789982362;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zYo6Ia7AJOmeWwK5TRKCoCasnx1PwxU0PK05z7YV+IQ=;
        b=NpMqBOko0jovujE2KK1QbBYf8GyZgCaOUdyGof7lrWGoibsme11gyUQcsu1z9cdTTr
         piIr0aSX0plDJQU9YqUsZmzfbRc7xUK2obf9JO9bfDMKN25obhsnTRCh6DSC43awpnSm
         Xn+Kbbe5+mrhR6QTnV9pmIITYyPnXe3sgebjYbD6yby8+tj+nINoqWdJ9GLNBncVXstv
         c7wXD3PMmHikpiWn7zwOcOq1zcjIRulYI3LZ/5m4WL6xIK5sTbBNwrqX6QDjkej4/wcU
         pFrfexmBAOi9GRA4TiVmi7+BqWK+Ruwp6j1wQr1MbUWDRKdaYT8ybr/j2Cqpw1hUxwnX
         VgsA==
X-Forwarded-Encrypted: i=1; AKwUvBypaTZfNcMK8rxBV/tRVb+ELDiG/qyyvccdMXmmGbI79jNPeg7vDCjGdsT0fnKpP0w/gEpieeyMPypeDV0=@vger.kernel.org
X-Gm-Message-State: AFuF++mqceA49JsUQo4PKVRmGUkVR0o8KRay2Ibllv+4PvcUJXjN3b0s
	7Z1ZLcG8xi40LwV1LPBGSzsFYTOMNrCUIqi99FpODiXci1LVBtR+saxkC6UTrZeX/Q/c3TNXmKN
	hkTExpmvqhiJJH+24TTmVoWhHHDpD794jmCl0E5aieZMLsFoqo7iYN75C2e3pYvulltg=
X-Gm-Gg: AYBFou1YdOArOme6TP4Y2/vToE8qw2SDIjqtyx+OjWJn4JPEsRdjC/DpaUl+fWRrvr+
	STLBYfyQajius00aZrIqK5mdc2sC02JsSAsJ6tZtBMq2bTYn0Uwm/6vMoVFIUNl2Wk5lnWWXFcO
	7YvnCNDJ33v8nPJInRhVGVU/r/9Squxy9TVwsnd/kghqlJ/Q2yrW0LWDNrI4lPB/3wFd1wrvsDn
	lC53hdYya3dloREop3pldlPK17cA6XmL9CKBUGnQLnkwV2Xhwf2Ow6SkGXYj0Wk70tsdAizv06S
	fwopIK9uUj/qXSSiH+XJ4ajAOd6YwcHfYf6uTCCZNRZe9FB33/mQ06FzUzBhI/NWL0TI8mV7q2Q
	ANOy0oaA476L3fVIE6nkBi74=
X-Received: by 2002:a17:90a:d2cf:b0:39b:34ef:3b24 with SMTP id 98e67ed59e1d1-39debf77c94mr2493497a91.1.1789377562374;
        Mon, 14 Sep 2026 02:19:22 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cf:b0:39b:34ef:3b24 with SMTP id 98e67ed59e1d1-39debf77c94mr2493461a91.1.1789377561909;
        Mon, 14 Sep 2026 02:19:21 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm29416837eec.0.2026.09.14.02.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:19:21 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: Describe the PCIe M.2 Key E
 connector for Monaco EVK
Date: Mon, 14 Sep 2026 14:49:12 +0530
Message-Id: <20260914-b4-monaco-evk-m2-v1-v4-0-dab83b048d03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABC8p2oC/33NTQ6CMBAF4KuQri1pS39deQ/jAtpBGoUq1UZDu
 LuFjS7UZDLJe8l8M6EIo4eItsWERkg++jDkwDcFsl09HAF7lzNihEmimMINx30YahswpBPuGU4
 UOyckNMaoSmmULy8jtP6xqvtDzp2PtzA+1yeJLu1/Lw/BgjNjLUgtjNmFGMvrvT7b0PdlXmhhE
 /ukzHeKZYoIroG6ulGS/KCqN6XpD6rKlNGacgGtFNZ9oeZ5fgEoK0/kUwEAAA==
X-Change-ID: 20260727-b4-monaco-evk-m2-v1-dd56eb997378
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: wwibeBc-d7owQZYhSOTwPqw2cRPjFYU4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzMSBTYWx0ZWRfXxSJdOtD5USnG
 V4dZsciTHpIyGR+h9weHXT8UDCkjmhPR7n755/bMMJiIjyYYYn5RbRaPSUMF2VC1R64dw2zua3T
 O5eoBPz8fvFpxdnVNAH+kGWkJufuFLM=
X-Proofpoint-GUID: wwibeBc-d7owQZYhSOTwPqw2cRPjFYU4
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7bc1b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q_Sc9yZfLxUicUOugGkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzMSBTYWx0ZWRfX4aPAu83niD0v
 rj0vFqGNbfwkJjxAQmgO2L5EYsXtgdxpAsYNSLSwGRfRtpfrmwuWeRDk8+uvdSkoja89DhQuWP7
 /q8o6ujUEyqQYGSwTMCvlXY+/SRNG452MM0oOFHOb6dbMgNW5F51uYGTNN0mafQu1vHOC95Mz6W
 b5g+9ydsIXD3exsfO9Bmioe0iTQaEGg9XTA9hXlwlBP2B7Z9EfpjKuq5NJ05XCLm8Xa4SzrqKhY
 MaSH3Sexz/QmzAjDrz91olz6bh5rUPwLOxxD2x6WF9fRXm+lzJgN9+fjMBz+onhqLSwNCUSoQ7K
 Zd6eP4LZPYonKDFh+fOYwWLc3QC+ytqUMwx8366iJpag5yWIKQlG4WaOVk9kxYv9NKm4YDlIwhW
 MknJh1uPiExRQJicych0Y9/52aOpJq9XLLaBqTz0exQi0r6Plg83ad5ynCAISibs2mXwALH1Sva
 3KGjdZ8ErNzfZyAQ2Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140131

Add DT support for the PCIe M.2 Mechanical Key E connector on the
Monaco EVK, following the same pattern as the lemans-evk series
(already in linux-next, commits 67f06acf/a6d4bb0a).

Patch 1/2 adds 'compatible = "pciclass,0604"' to the pcieport0 node in
monaco.dtsi, required for downstream DT nodes to be matched to PCI
devices.

Patch 2/2 describes the connector-3 node in monaco-evk.dts, wires the
PCIe 0 Root Port and UART2 endpoints inline in the board file, adds the
vreg_wcn_3p3 regulator, and adds the serial1 = &uart2 alias for BT
serdev enumeration.

This series is based on next-20260726.

Changes in v4:
- Drop the DTSI anchor patch (formerly 2/4): upstream BT maintainer
  Manivannan Sadhasivam indicated that changing the hci_qca.c detection
  from of_graph_is_present() to of_graph_get_remote_endpoint() is not
  warranted [1], so placing empty anchor nodes in the DTSI would cause
  hci_qca to probe the M.2 pwrseq path on all monaco-based boards,
  including those without an M.2 connector (e.g. qcs8300-ride). The
  port/endpoint nodes are now written directly inline in monaco-evk.dts.
- Fold former patches 3 and 4 into a single EVK patch (now 2/2).
- Fix &uart2 node override ordering in monaco-evk.dts (alphabetical,
  before &uart6).
- Link to v3: https://lore.kernel.org/r/20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com

[1] https://lore.kernel.org/all/isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24/

Changes in v3:
- Drop vreg_dcin_12v from connector node; the 12V DC input is not
  software-controllable (Konrad)
- Add patch 4/4: move graph port/endpoint anchors from monaco.dtsi to
  monaco-evk.dts, so of_graph_is_present() only returns true on boards
  with an M.2 Key E connector
- Link to v2: https://lore.kernel.org/r/20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com

Changes in v2:
- Move PCIe Root Port and UART2 graph port/endpoint declarations from
  monaco-evk.dts into monaco.dtsi, per Konrad's suggestion.
- Link to v1: https://lore.kernel.org/all/20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com/

---
Wei Deng (2):
      arm64: dts: qcom: monaco: Add compatible to the PCIe Root Port
      arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 60 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  1 +
 2 files changed, 61 insertions(+)
---
base-commit: 80489b8b7c62068b5223af10ead175367dcd127d
change-id: 20260727-b4-monaco-evk-m2-v1-dd56eb997378

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>

