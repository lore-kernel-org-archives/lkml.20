Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F248A33032B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763820; cv=none; b=eJi5F0wetSGqGF1mngc79EY0UV97XScnOxdv7sfnhwqzQXqYkssb02MnTUpoKVRGaK3xqRdWioaSFEpbus6ykVYNeHO7wwkGHS0TJEmp57ZXtwJK949u6L8mYS0VK3Gn2M6euUNGb5P8WpCajD379eTD4rS2VCOSPArpU3TW+tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763820; c=relaxed/simple;
	bh=iRMieqTLpzSimePtFDUM7IYXtNUy6nl19l5tmntBsn4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q05mz7VEQak3cvTKIsY7FW/yfFFqFWgrKwvZLdPGvWIrrYQYSQvkr4qp9dEYg26duuIt9oJ0o41M+n3TvxL23qWVxS4zl3waNoMCXH/UkH5/olrMcQ77JxVsJNI29c1Ar8K9mdMPGSOlW3ZxhwJ9rTyy1daJBRr9satufyxQc5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1rUq9sn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSp0i27d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1rUq9sn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSp0i27d"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGv0mY1310719
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LmNdSIC3rzSREG9XYk3I/s
	eFKqFe5W7iVUlByjfc2Dw=; b=j1rUq9snaiDIcZ6SEq9t2TXHxtklK1pG8UhQob
	2UhM0tvdZrziTJ5arh3qGxCfH8oSDzYB/NFFF60yBHSlnFk19CwvDSMMD+GilijR
	4xgZXCaYrsvE/lZ9dM9vPDy7fpgxXuyyihjNoXQy5d4s93wcVGLnbw2aJ8v3jMNo
	wsRz9urpM7g7wVUUm3NyEqzixjaEzIDf2O/Y+TNs/os1aNjctsaVvL+Tbup6IQ0N
	x6dylSdEVLj+xNpjNmLJZb9+NXYoI1OHoRWOoRtMGDfp8rnY+8yX4pB7mDoJ92zC
	qxniy484VPWps9AnsimkpmX537ZTnBSVnAbs/X3LTyamMQ4A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a94w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:03:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacd6d37edso17284905ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763797; x=1788368597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LmNdSIC3rzSREG9XYk3I/seFKqFe5W7iVUlByjfc2Dw=;
        b=FSp0i27dAtnrl1UYb6hVj/O9XcJi9LyzVo8MCtvBLWrhNwDWE2rUiNDEq/KOlT5D92
         wdFqApxNyfZ8MHmUPyDe+gt17WWfzIfRA1zL6q48tT8G6SDulqQAQfJoCHy4SM+LaGvj
         m2vMubk4kQp/89KEppYk6tLfit8+HqWcydTldmN7mp0dbXnWxcMNyeJ9E4tNy+LYSvKI
         9GY1qOCx3hiLMq4rbQIKLgv3qiyuJdW5844gVILDgOwAp7+QBI8TCiTT7/50HwSdu2wa
         /Vgza0YIo8DtYkIGAcwekg7gwtNyh8kEzcG0A7Vik9kSC7vB6/xWl7Xo1c3/GQEMXDf1
         EJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763797; x=1788368597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LmNdSIC3rzSREG9XYk3I/seFKqFe5W7iVUlByjfc2Dw=;
        b=Oh0VWtOnjJfPmmjDFpMk72tzAzOIhlRc3/FoyT7iok9P80RwGXcMfGK/JT5iiQfYL4
         qpLvDRb4Gp6xf54SlqHRPwBp9wcURspUioAi/o+PEUUrLyr9Uyyv9z7m8/fzZ3I6HJLy
         Y1IgihUtPoEs1/hzLSZGST4P0W5vvbRapWPK4PpTfiFxadFqlkJASpzvh9heceO6qFFl
         +o8I71Jid/9EmT/Zi9maOP5XbMK4Tt9w539LXZtd06vqPO6f/1kk26KmPu3B1j66y2oZ
         ySjTUCSB7rMkOxgm33anYr5JeS1kHj51ru6/WUeHnDzoriXvKLOkNbTxPwbUIS+ALbFR
         JVbg==
X-Forwarded-Encrypted: i=1; AHgh+Rotcge3fuOPXmjTo3WttOa0FkwKc4shBGrysdsJYP2gUtPXQM2qx7yMrX/YO43Z3Vnh7jhL2TCBidv16Qw=@vger.kernel.org
X-Gm-Message-State: AFuF++ku2rd0cUGP+qHFROJIBn1VJL1JEIPWDdwJNum45+0PH/PrOPVB
	DMYktokaZl+P4qyjrCqeFdNObF9+wveWkxP9LyeO/4dGB/mHUqC6lWdYLapYYGhmaUYWt+lEiEo
	g4LTW3swzuTUIDOtp+mCQ7cq74+aPpHY/wejHNiMQb3y+zWDub+DyI8lGL/JiamqS1fI=
X-Gm-Gg: AR+sD12HDFbyjPq3NyThQ8b4i30ftUfSTU3ybU5RXDbHioNzJ97kVDPuAD0eZB82Xrx
	OsYPb0BfXjgBkTsY/4hl08KAwdV65wnXrlT550GVYhfSu1LL/UNfJixwr8JCimJHbJtWZRJkW5R
	Y8BnWNhsXZrd0V0HpLSptxoOONKljLZiKCsxc0z7QnUvtXCgq9p84KlCQdrlw7Gu7Q8ANQUhImi
	D4/45qMotXjyXKtTB0D/hysKA+aH+Ac8xJZ0+Lnq2XHv91yOuAGxmQ9INWMWgxdK3j0ifBsvkQN
	sVDapKmgZoDJYZ1Ca/PZwogZkwVr+rX61MvXB5rGidHVRdZRxh6OGdVwqTCFh0NN8W9kc640AtN
	j2B0bN252Z5wdOxaW7Kdjqdvz25xH9oozdKvN43hf0gJfrTjqdCyCPhG7eYbLActrUCyNMA==
X-Received: by 2002:a17:903:32c9:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d7079eb7e9mr147013185ad.4.1787763796690;
        Wed, 26 Aug 2026 10:03:16 -0700 (PDT)
X-Received: by 2002:a17:903:32c9:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d7079eb7e9mr147011215ad.4.1787763795999;
        Wed, 26 Aug 2026 10:03:15 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:15 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Modify interrupt handling for eUSB2 Phy targets
Date: Wed, 26 Aug 2026 22:32:50 +0530
Message-Id: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADocj2oC/yXMQQ6CQAxG4auQrm0CDUyMVzEuHPzRuhhJO0NIC
 Hd3xOW3eG8jhymcLs1GhkVdP6kinBoaX/f0BOujmqSV0J5lYBSPwpoyzMqceQk8SAT6KH0nHdV
 wNky6HtPr7W8v8Y0x/0607185v8h0dgAAAA==
X-Change-ID: 20260825-eusb2-interrupt-v6-52bee4b24121
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=3052;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=iRMieqTLpzSimePtFDUM7IYXtNUy6nl19l5tmntBsn4=;
 b=8Hi4lnh+nhaU79Mve1F6xuAiE8FRDM3Pl+datid4o4gWdyBZ7IBa2TC2v8D88KUqqgVqCJZ1y
 xkQA4nXpFsPA90gB99x/0WHHlpaKcPLf9VQEBfW0iMvXn4WYU5qehdr
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: vd_v4GruWyJNHCZgWe8H3fCr3kHkEjso
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8f1c55 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xjCIpWma6R3UThYtaJkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: vd_v4GruWyJNHCZgWe8H3fCr3kHkEjso
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX6sOwXoMrM+lD
 AeMlYL3fZCJ8a2XOPXjV0jndleOqTodOrffaicaQnubewymkEXPXYfjigcrIcB7BsKoMjCaiVB/
 HzrYcFdHaeUv9sQCYIWD+7hwCAMtKU7/eBV/RYrk3UzxY9Nv3v955ZWP0tIH+o9kW4RyXivoe/X
 v1fKKe9TBTobVZGtiRR2u57URnnjtVt9DEn8SNrjIBq6qO1nbgjJe362k9JdBt8Awm1a3zcjEG2
 VvWlMugVAgjpqEBdqeQY8+Z0ZlVUq08XieFWeNoScOE689jt5SdI1qWlH0z5AYZYwHuj0GcoznZ
 OIKLoYe9Dc2hyTkvnBpss5Qh0NItDrlXRStZpVo5DDK2j/8FKozEuJ5MvSzPnMhPH4/gciNjlTo
 tO4aO9rea26bxRZtYfNYuM5hs6E7XuE1g88pDtC3aTDw2Tc3zBm0pRoik0uOXelvvVLyliNZHTc
 mAH8/PNQvEFdI9F8bEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfXyfYOIrcwfFKw
 S5fF8jXuTLkMoMbwNYp3xPsCt2hM87iINP3+fL8BWnZYv3SlAlQv2IQelo0UrD8jE7ktW4ASIoj
 lwuDtHUUHCAAgZoJK/t76HMgrDzsgO8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260141

eUSB2 targets handle wakeup interrupts differently depending on device
speed when operating in host mode.

According to the eUSB2 specification, remote wakeup signaling in host
mode is detected via different data-line assertions based on the
connected device speed.

When a low-speed device is connected, the host repeater drives eD+ to
logic '1' upon detecting a K-state on the USB lines during remote wakeup
(eUSB2 specification, Section 5.5.14).

When a full-speed or high-speed device is connected, the host repeater
drives eD- to logic '1' upon detecting a K-state on the USB line during
remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
eD- line states, configure the wakeup interrupts accordingly

Add support for a new phy "type" attribute to be set by eusb2 phy drivers
and be read by consumers (in this case usb controller) and act accordingly

Changes in v6:
- Update commit messages to reflect why new EUSB2 phy type is added
- Update phy reading via index rather than by name
- Remove redundant header files in phy driver changes

Link to v5:
https://lore.kernel.org/all/20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com/

Changes in v5:
- Add support for phy "type" attribute and set it from m31 and snps eusb2
phy probes.
- Removed adding a new binding property

Link to v4:
https://lore.kernel.org/all/20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com/

Changes in v4:
- Moved to using binding approach as suggested by Thinh

Link to v3:
https://lore.kernel.org/all/20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Removed multiple glymur-dwc3-mp pdata entries
- Replaced use of ternary operators with if-else

Link to v2:
https://lore.kernel.org/all/20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Updated commit message
- added supported eUSB2 targets

Link to v1:
https://lore.kernel.org/all/20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com/

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (5):
      dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
      include: linux: phy: Add phy attribute "type" and associated helpers
      phy: snps-eusb2: Set phy type to EUSB2
      phy: qcom: m31-eusb2: Set phy type to EUSB2
      usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets

 drivers/phy/phy-snps-eusb2.c              |  2 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c |  2 +
 drivers/usb/dwc3/dwc3-qcom.c              | 63 +++++++++++++++++++++++--------
 include/dt-bindings/phy/phy.h             |  1 +
 include/linux/phy/phy.h                   | 27 +++++++++++++
 5 files changed, 80 insertions(+), 15 deletions(-)
---
base-commit: ba8376e8c76c6512c98949dffbf4ded0b782a365
change-id: 20260825-eusb2-interrupt-v6-52bee4b24121

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

