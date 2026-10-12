Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F337417B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787526; cv=none; b=QSqSdUlPHezOQfNulWQBQEC7NonIsb3folZ/TIpUZqZ3B6hV87pTFRjcYJ+nOBUf5cjyzdKp8aM7gWnW6QwQ7+aVyqavD64Jinvvq2dQxg2jre+ZYNPZE1o47QJ5P+1LUm5Xti/onlEzZeBicHtUeOr8mrSaP1UfU67RVyB96n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787526; c=relaxed/simple;
	bh=OU+KP8FarzzKluDXqhhiWU2Qw5yriECV+QTu1X5pFXY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pNfwG6LSXKC+VrtEl5O++ISEsxdOBSB8KiZVW6Pwog2ozYRBtlZIx1Hvti0WRdxC3ikcZQdErmmW9nMqwaxYXb+P3lcG4xZCEfL0I1e3pyMBzVCKXuJCNGQNIBlcXYIozNqTCo9TinPBXPkqpzwNV1MYcffAWeBjBWTdgXmHHbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7seq4+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhX+y27n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7seq4+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhX+y27n"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55v8Z4068725
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l9vxWZJuOUHWIhD1HcgipJ
	l9zJ9rVDkqs8bNdJ0lmkE=; b=R7seq4+qFwevukoTedQxS1QQrZ2UELk5ZWIES2
	opDFHVFrMHcbq63LzlwKoovzg2Pua/sk7RuMZyDMrrU7mTmy/RMTFp4V5DBM8GJ+
	HX/wI7gtm01pt6g2ICzf3gkW/r1capJ2BVndHuq0VrDVgO08fKChuLd+LMvyE9E3
	lv6i2DUjJKz3CddOz6TC3JHM+yqADewyxKyVUB+4CUD9LuEbn06EqGS66IG1y2vI
	Rtp32YQBWBLI4MyLkslgBO6l3xnJ6svWwsGp/qEfRKVgzwCzkgEc6ZrGwLYWDIi8
	M6cRFSNOz35etEne4STolL4+tBeEasRK/PyRqcI62FuxqzKw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjn689-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88c768885b4so2159862b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787523; x=1792392323; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l9vxWZJuOUHWIhD1HcgipJl9zJ9rVDkqs8bNdJ0lmkE=;
        b=LhX+y27n4rTU5OSVnLK/GXobS6yWZ5TSK1ghvdH3nskbv/72yvdVi4xjx1fgq6LhYO
         9s5IpMnepUeT4nueNQvg9KJtdPLHceL9hVLuGSguPFgzmQmtRgm5HR+67mQm7x2MQ6q1
         3ZlHjbHbK2v+p0c+LmBqEOXFDNAxPNdFQ1S/vofCpNE6mObQrzflwfttOzGS+qkj//ct
         cGZVPaPpk+7PG1rFuNbhJSxecfZSzzkL9kYjtPo0J0G9O4S49gbsVPCd1BH5DqtdUoeJ
         zAjUNXVy+p/4Yqi/U4aQSiDwQEGLA8acAz2Egqr6dHV6n3mZ1Dp/HekjRgnucb1unFG8
         AYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787523; x=1792392323;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l9vxWZJuOUHWIhD1HcgipJl9zJ9rVDkqs8bNdJ0lmkE=;
        b=VbXq8aOleiwF6LZ/mjWGam3EhrY1LEgGY/Wp/Jum6bU1PxlYA+V8nwNGp7bJxVttf0
         LsZXSR6M2Z5C85/FwmxdkXg02XQJWRayz1uqp2H+L3XOLwD0F+JW2coq8wPaFd1sYMEQ
         XeOE8Q8GGVLSoe/8+AqzkttDaImsxxeiaSLRc3BYBfsNB7nKc4uqtBJv5RUF7p0Er13u
         ywgFnMTK09h7uWZrTcn9PX6HJpcKK54FzwzYYno6hC0zGsC9pal67fywL9Y603qF7/PE
         5mdDCV4JwL6fO2OHqHNBG/hgrjbk0ePYXYtOEBIlSr3YGcuw7Ks+S/QMLcS/2HiYhV+x
         Uz5w==
X-Forwarded-Encrypted: i=1; AKwUvBxN6dehU4g5b39ZFD0Y2ThQt5l01jzEGEu9m9exvW5CK6ttFQiA+n1sFYX+csUpGBD8Ty+3wmrwAiuKXRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb9/PdFCWQW4S3oCDz4ua2QRZTc/LCZT0mMB/M+1DCGXDBspp2
	R/zwJ/Xiiwm6SQdxRPL2iFbU4zQDJdC3VkkPP+XvPkbdgXVtWuwpQJ+xhxCp57MZnNrga04tPje
	8QbpAmUvUTP+spwxzEpN8pTdHFtX+WwEa04+pluS3iZakBxbkQIlHPfkYF3NLYH7/h3I=
X-Gm-Gg: AYBFou0oipUfPW6x+0ClV3LnGndCMXCOXaUVoTqrkuKO0krRKETvN7WPfhjkKvpssgC
	poG59gB6BRPX+bYiy+Q+gV6ck92RAiznyGEYu4viKTnU9wqwQMYM72QD6bHKlLLZox5Q0AESsuV
	7Yt7po8L5Kp6BwqG+f1Ps9xlQZLzkfBkgVUlX+JpltXQ74YsvWB4wVgpX6f1cey17Cc3Ye7m51i
	4vykV2Cn9l6fv204RMiVr5ciHoUA6Co0G7l37Y/DVixEDF0A33MZ4uL8Pi8u0lgNqRUz4eHrqXP
	cZXXb3vrZEaHfcpNdKj0veQZnpkoIUEht+NId9bb1nJWSELuLYazR/l2n9gWXT9l1Ez14YZgz2C
	71vTaqwtiDTLM6cfqARWbWnGS54/YisIB5pEDQOKRvF2us0BQN9Hc/b9kfY+niGrFTPehERlxLd
	EWnsFBBTuuTg==
X-Received: by 2002:a05:6a00:2998:b0:890:a3ed:8a57 with SMTP id d2e1a72fcca58-897c7ec17cdmr7032082b3a.49.1791787523102;
        Sun, 11 Oct 2026 23:45:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:2998:b0:890:a3ed:8a57 with SMTP id d2e1a72fcca58-897c7ec17cdmr7032045b3a.49.1791787522417;
        Sun, 11 Oct 2026 23:45:22 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:21 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v21 00/14] media: qcom: camss: Add Kaanapali support
Date: Sun, 11 Oct 2026 23:45:02 -0700
Message-Id: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XRzWrDMAwA4FcpPs/F/z897T3GDo4tr2Zt0sZp6
 Sh99zkpLIXZF4OE9UlId5RhTJDRbnNHI1xTTkNfAkbfNsjvXf8FOIWSQIwwRShl+Nu53p3cIWH
 vjjljzbVmQQiIUaNSdRohpttCfnw+4xHOlyJPzyTqXAbsh+MxTbtND7cJzzglxKK5YJ/yNIw/y
 0hXSpeSZvfyARNsKIgorZOBmPch5+354g5zh215FvRK+QpJYioQLxCTggYDUipJW5BYoTJTBRI
 FAq0iU84pZZuQXCHNSAWSBfKko55Spb0MLUitkC1F/yE1QzbyqKKghvgWpF8gVtuRLlDwBQpcR
 62akPmDyll5BTLz1XTnBHRAQtfckX2FahPZAnXMS8MhSgKkATHyAtHKsssBCFYcrPFgna/u6PF
 4/AKbqOksMQMAAA==
X-Change-ID: 20260112-kaanapali-camss-73772d44eff7
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX/h+urpD72uZy
 Rdh/Atx4ltG7QjpqtN4LuuYfV2mbAkMoe7S+U9DmqhbEaTnBU1W6NX9uuuwm0TmkOml0IaIyyhd
 PWbFHUuVc/4T6V3faBf1v6tyCD4IUzrdDZTZg3pJ+6ZGsll4MXmYIIaJsxsBSjsUHmanVZpfQod
 kNpUxzMKRWuNnJ6PUqdgkqCsElT2ri+txMH8MEWhwhAE4jUOYf44TtZvNarBQxadHxyVAny7Ib6
 zDmDOfv3Vpu3+watV//38ZDVVqUQCpnJAaYYQN8B/UbbpPMujDuAlf6GdEnghFAfvpv8xiUc51b
 6wEp+EXDrWYnBDKaG9lcecJoNTxE5QiVVZE9lRFFVv7V4Mmrm5BpE29uvp6DXbskYJF8MKnkBys
 TOO+oiuEurGzGM/cTkEGtv5FpPvyNV3Ez3sl7XmdFr350wrFLQQjNULmmfSaTr5EZoJ1OrgYiaB
 b473yVgBScVHkKHlFVw==
X-Proofpoint-ORIG-GUID: BXOkahD160WYQB9qoEG2v1pgjJ06tIku
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acc8204 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=juvn9zB4BFeI3m4iuAcA:9
 a=k25qdJL-Bay41Wvd:21 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: BXOkahD160WYQB9qoEG2v1pgjJ06tIku
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX6dkdzTjIoMni
 y4X+jmfBea3qS4+iN3s+9fDRpDlmm/YPSKHpJExOZJyCiMEiGEKu6kJQ/BbM07iDOLvXs9JDSN5
 5baaDSYFSOlMgc22BZQVNuwyxmMkvtE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120026

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

PHY driver part for maintainer Vinod Koul (3):
[1] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Kaanapali CSI2 PHY
[2] phy: qcom-mipi-csi2: Parametrise the common status register offset
[3] phy: qcom-mipi-csi2: Add Kaanapali support

CAMSS driver and DTS part for maintainer Bryan O'Donoghue (11):
[1] media: qcom: camss: Issue stream-on REG_UPDATE from CSID
[2] media: dt-bindings: Add CAMSS device for Kaanapali
[3] media: qcom: camss: Add Kaanapali compatible
[4] media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
[5] media: qcom: camss: csid: Add support for CSID 1080
[6] media: qcom: camss: vfe: Add support for VFE 1080
[7] media: qcom: camss: tpg: Add support for v2.4.0 TPG
[8] arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions
[9] arm64: dts: qcom: kaanapali: Add CCI controller nodes
[10] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
[11] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5: Add DT overlay
  

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v21:
- Drop reg_update_after_csid_config flag. Skip the VFE-side stream-on
  REG_UPDATE only when the connected CSID implements reg_update - bod
- Add address and size cell properties in camera node to avoid
  potential warnings during compilation
- Link to v20: https://patch.msgid.link/20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com

Changes in v20:
- Remove the redundant null check for reg_update_clear in VFE - bod
- Define the port property for CSIPHY nodes and align the style of
  CAMSS and CSIPHY nodes - bod
- Replace bias-pull-up and bias-pull-down with bias-disable for the
  SCL/SDA pins of CCI nodes in TLMM, as internal weak pull is inproper
  with existing board level pull up resistors - Loic
- Align the if-else condition in TPG version judgement and remove the
  redundant comments in TPG code but describe the hardware changes in
  commit description
- Add Kaanapali camera subsystem and S5KJN5 enablement dtso
- Link to v19: https://patch.msgid.link/20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com

Changes in v19:
- Remove the internal CSIPHY hardware operations for CAMSS - bod
- Collect RBs tags from Bryan and Rob for CAMSS binding - bod/Rob
- Split the PHY and CAMSS into separate parts and document the
  corresponding maintainers in cover letter - bod
- Link to v18: https://patch.msgid.link/20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com

Changes in v18:
- Rename CSID and VFE hardware version from Gen4 to 1080 - bod
- Correct the description for CAMSS ports in binding - Krzysztof
- Add lane count fallback path for CSID RX configuration - Sashiko
- Align the TFE lite line count with the commit description - Sashiko
- Use hyphenated pattern for MCLK node names - Sashiko
- Resolve conflicts introduced by Glymur in CSI2 PHY binding
- Correct the spelling mistakes in cover letter and enhance commit
  description for compatible and CSIPHY
- Link to v17: https://lore.kernel.org/r/20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com

Changes in v17:
- Rebase due to CSIPHY re-arch dependencies merged - bod
- Remove redundant CSIPHY resources in CAMSS block
- Enhance the commit title description for CAMSS and CSIPHY blocks
- Collet RBs from Loic
- Link to v16: https://lore.kernel.org/r/20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com

Changes in v16:
- Remove RBs for binding, CSIPHY and CAMSS DT as tags stale due to
  split-CSIPHY re-arch - Krzysztof
- Update CAMSS bindings and driver support for the standalone CSI2 PHY
  provider and graph-based PHY lookup model - bod
- Add the CDM IOMMU stream and simplify CAMSS binding example part by
  removing redundant subnodes - bod
- Improve commit descriptions for CAMSS compatible, CSID, VFE, TPG
- Clarify the common-status-offset change with x1e80100 compatibility
  details and future SoC offset considerations
- Add Kaanapali camera DT descriptions, including CAMSS, six CSIPHYs,
  three CCI controllers, camera-control I2C, and MCLK pinctrl states
- Rename I2C and MCLK pinctrl nodes to include interface identifiers
- Link to v15: https://lore.kernel.org/r/20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com

Changes in v15:
- Add TPG v2.4.0 support
- Drive the CSIPHY through the standalone phy-qcom-mipi-csi2 DPHY
  driver, which let CAMSS csiphy_res only carry id, ops and formats
- Add a preparatory patch parametrising the PHY common status offset
- Add the mipi_csi2_dphy_3nm_kaanapali config and "qcom,kaanapali-csi2-phy"
  based on the new split-csiphy arch
- Link to v14: https://lore.kernel.org/r/20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com

Changes in v14:
- Define 'CSI2_RX_CFG0_PHY_SEL_BASE_IDX' locally in camss-csid-gen4.c - bod
- Align csiphy lane registers value capitalization and case rule for 2.4.0
- Rebase this series due to conflict - bod
- Link to v13: https://lore.kernel.org/r/20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com

Changes in v13:
- Remove prerequisite dependencies that have been merged upstream
- Remove redundant empty 'regulators' initializers in csid and vfe  - bod
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v12: https://lore.kernel.org/all/20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com/

Changes in v12:
- Add CSIPHY regulator current due to regulator interface changed - bod
- Link to v11: https://lore.kernel.org/r/20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com

Changes in v11:
- Rebase this series due to conflict - bod
- Update binding commit message to align with previous generations
- Link to v10: https://lore.kernel.org/r/20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com

Changes in v10:
- Update interconnect and CX domain AXI clock names to be consistent with
  previous generations - bod
- Update the struct name for csiphy lane register settings to make it reusable
  for other compatible chipsets
- Updated power domain names to IFE for consistency - Krzysztof
- Add description for acronyms listed in binding commit message - Dmitry
- Link to v9: https://lore.kernel.org/r/20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com

Changes in v9:
- Updates the names of some of the resources in DT bindings to be consistent
  with previous generations and improve the commit its message. The name
  changes are also applied to csiphy and vfe camss resource lists - bod
- Link to v8: https://lore.kernel.org/r/20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com

Changes in v8:
- Change csid and vfe driver file names as 'gen4' to reuse for other SOCs - bod
- Add missing register descriptions to binding and cover letter commit log - bod
- Link to v7: https://lore.kernel.org/r/20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com

Changes in v7:
- Add ICP SYS registers to camss binding - bod
- Rename 'is_deferred' to 'reg_update_after_csid_config' to do rup/aup
  after csid config to make it clearer and simplify its call path - bod
- Remove unnecessary bitwise AND while configuring image address to bus- bod
- Tidy up a comment and a couple of hex values and csid/vfe - bod
- Link to v6: https://lore.kernel.org/r/20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com

Changes in v6:
- Modified the bindings to represent the whole of the camera hardware on
  KNP than just what is exercised by the CAMSS driver by extending the
  descriptions and the properties, the regs, clocks, interrupts, power
  domains, iommus etc. In addition, use the word 'vfe' everywhere in the
  bindings to be clear that all of those resources are referring to the
  same front end modules. - Krzysztof/bod
- Change camss vfe power domain names to align with the binding file
- Link to v5: https://lore.kernel.org/r/20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com

Changes in v5:
- Refine v4 change log - Krzysztof
- Fix typo by removing redundant numerical version in kaanapali camss binding
  comment description - Krzysztof
- Add missing tags that should be posted with v4 revision - Krzysztof/Andi
- Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com

Changes in v4:
- Add detailed hardware descriptions and revise message title to follow the
  standard comment format for kaanapali camss binding file - Krzysztof
- Format kaanapali camss binding file to keep style consistency, by reverting
  power domain name from TFE to IFE and keeping clocks name order as last
  generation - Krzysztof
- Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
  for arbitrary board design with common or unique supplies to each of the PHYs
  in kaanapali camss binding example, based on v2 comments - bod/Vladimir
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (14):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Kaanapali CSI2 PHY
      phy: qcom-mipi-csi2: Parametrise the common status register offset
      phy: qcom-mipi-csi2: Add Kaanapali support
      media: qcom: camss: Issue stream-on REG_UPDATE from CSID
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080
      media: qcom: camss: tpg: Add support for v2.4.0 TPG
      arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions
      arm64: dts: qcom: kaanapali: Add CCI controller nodes
      arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
      arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5: Add DT overlay

 .../bindings/media/qcom,kaanapali-camss.yaml       | 303 ++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   4 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso |  81 +++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   7 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 761 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 395 +++++++++++
 drivers/media/platform/qcom/camss/camss-csid-680.c |   3 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   3 +
 drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  23 +-
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 ++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  39 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 294 ++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c |  32 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   2 +
 20 files changed, 2149 insertions(+), 14 deletions(-)
---
base-commit: c74ef2fbf60ff7e7b956c023a881e87502c1852a
change-id: 20260112-kaanapali-camss-73772d44eff7

Best regards,
--  
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

