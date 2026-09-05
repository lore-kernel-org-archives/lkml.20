Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59584ADD88
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622159; cv=none; b=ibkjWFwlx7BivqzloFsd+eYqD+P5xFovtIUjwdMcyJRdEVW7YMjr2/GqbIDrqbUf+GPT7gQSLIobI/Wa86c0p+BaM7Uu4IG+QSFdLJ9D6VwOuOdg4DGK8jIpW2i8zcE/Mj4Z6IFqgSjGIyBcXV47UFhKH0OBeFLZZldYQQ2EzJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622159; c=relaxed/simple;
	bh=S6XBJpEz5Dek815jzmE0b9XkrXDLKdAJjoolsM8gc9o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BUxA+68zUFtjfbZX7lUF7k9uGaXe91FQkc0VXxHvto48YCjF/9hfHF7BlRwtVoihGYQ9X0URLGPJATSQPXiAJciDgFoGSRnWGDzvLq1rOVXIodPk83A/bzHPYgk7T2dt1bFtKOxPhjiXDEu+QuEBXdBTEt7jhvob3TlkrFB/KbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxP5jvUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gn+kIKDB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxP5jvUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gn+kIKDB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685Egn6r2541109
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 15:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1J5mbzKQXdFCMf3jwBjnv/
	NJRWMI84WrAPPqfVmtmcw=; b=LxP5jvUx2lKO/eOcO1/amnatFkIbZ6u9R5XRuV
	zabkJz515FblvKsvfODp8AHwH6L21GuSYhnl7dHBbRDMFEH82hiFs2/0poDhObl9
	22ODcFy1Pmeua3qym7an/qDSEJ3uKzSWkKFu6k8hYCB8qCLhpMphQo41ItIgfKqK
	0PDXMdn3XI7/zRh0W2pvMTUjdgh//gcnoNp/VF8nKJ44BFT7OtHHuQ9hYLICHyzO
	RHz0+kRVSVXfVA9ehghnsv+kuUgEhy1TxZlFLK9BHS+4lKFjiMjHNZeyNdNkkBHx
	4XdJhiiKLdIyNAmLkvJVfjHBa1qhcOJpqIBkPWLBkAgsgzZA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhhg9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 15:29:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc435388657so2636889a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788622155; x=1789226955; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1J5mbzKQXdFCMf3jwBjnv/NJRWMI84WrAPPqfVmtmcw=;
        b=Gn+kIKDBkJyLmuSgXmuKhdBH65eqf8c1iWnpTGKfxITVebt5uiUTryv0rZfRVIz8PP
         yfpjnj04zwxAJ38at99aun8r0RmIxKlriymJxTulvMGHl4qZ5YDjt8/ekH0vPXLcq5OY
         pw0UQ1/RKWVJXCaCu3MqenWoEMSNKjd4/ioxS/uyC/mTdHjncdFblGZfCOwHjMqTw5LJ
         XiewLzDaZLDx3j/txB4wryPx6q7o8OHw0ZZcNXlMJ9kHLXwbUEz5b5CkxyRfDkaBUWbm
         4mlcNXiXVJQk0OezhMAmQ0LbmVN4EKrCil61D3wzBhJGrrSYH+ltAQe1RwznolD1JE04
         JYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622155; x=1789226955;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1J5mbzKQXdFCMf3jwBjnv/NJRWMI84WrAPPqfVmtmcw=;
        b=hGp+Ns3zBnxAIN7nGzAZ1YBQ9Ti45glBAN6MSgcbwTfEW9c8a43DATSu31F8Ng+Asg
         vCaHTAgKME6cttJyU1sfZez0B3yXGYAr5IO9i+JZ4N2WDAn6gXTT/7bDUCr6kmsciX+E
         f44JSD8nssBcCynEYzAnNoaVEF9dFPTgB/eGehWPhkngp5A88LHJLeFGQFRtxOb1VSGE
         1Dq0r8d3Tk0JMl6+FY8MM/AJrTJKic5L8tk3HXXOIcS2gcmU8wFvVu/hUDa+B0hGD1qZ
         FZPVcowUZjgC39ohw1NMe1fBw2gSsAFM6ciWx4l2GFhpbPsWwxbB37+swiEaUDPwXx3j
         MM4w==
X-Forwarded-Encrypted: i=1; AKwUvBwFkoGVulQLhrhmRqJ8LBF5EOfMqFRkEZFo7O1dv1lwxT9ovTvjGaNDYIVg0umXVmy7QGp2WypHqLXBMWw=@vger.kernel.org
X-Gm-Message-State: AFuF++mzBGvSVyXeDn2mTbRIq3CmBLgkFjdW8TUljfVRG1D0kIVfmXFW
	AOISshz89l/Mv/XVifaFFaHYt0pvxxsHSs+7+aH9u2REeoBy69aiJb3Iw2LIwSPdnyOPPrToQJ3
	M5MRbmU4oH9SMmRV2RGbSTdtrIwLDDrDKXaTuYM0Nn82m6ddm7l0bjUJMwNlY7975kt+C41L0n+
	w=
X-Gm-Gg: AYBFou1LJipNf+D08PjjMeFc4YEpU4qbRdhX3naaE2H8aqiGPYxbbfzdgx8M79weHyx
	8epF1k/C0a5UxS09Rt3On7Gd+pKOn44NzgHOKCCAQp1Aho1ArpsJoVtvTynwt0Y8e4PmbriLoRV
	bp51h+CaJIDVor/SBdOffy/0+IQYH2HbX8EZr8Z9MATuHEgfqnYCrOOkjAJx6I5tpOPi5PBo64s
	R/UC5rQ/LnUInF9il94dePuiHZytJyv3H9FhuIBLJJLjNyNWAjvbolwhoWCtl/n2YK5WP3nAsGd
	1k2SXeqomIq/mmlQb/m5G+SRPxKVqRffqb05/Ktj9twXoG4QkxhGuBaOOj55U8n37zo2G267srt
	RpBh5D1F+u8qGQ5rfBIbiiKCtDt+E+76Da1vyimf2g3PJ6CqNDk6H7gus+bVm9r6U0Qnvpw==
X-Received: by 2002:a05:6a21:7117:b0:3d8:5a37:549c with SMTP id adf61e73a8af0-3da39eb8acbmr22462829637.7.1788622155343;
        Sat, 05 Sep 2026 08:29:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:7117:b0:3d8:5a37:549c with SMTP id adf61e73a8af0-3da39eb8acbmr22462764637.7.1788622154950;
        Sat, 05 Sep 2026 08:29:14 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm23592635eec.16.2026.09.05.08.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:29:14 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v7 0/5] Modify interrupt handling for eUSB2 Phy targets
Date: Sat, 05 Sep 2026 20:59:04 +0530
Message-Id: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEE1nGoC/yXMMQ7CMAxA0atUnrEUTCGBq1QMJDVghlDZSYVU9
 e4NML7h/wWMVdjg0i2gPIvJOzf4XQfpecsPRhmbgRyd3NkdkatFQsmFVetUcPZIlMIY9ocQfQ8
 tnJTv8vlNh+vfVuOLU/meYF038Eu/vXYAAAA=
X-Change-ID: 20260905-eusb2-interrupt-v7-22c8d8138b74
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788622149; l=3296;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=S6XBJpEz5Dek815jzmE0b9XkrXDLKdAJjoolsM8gc9o=;
 b=8BWq9KCEu1Xr+PEyUZ9vWUy23HYTgxcbm+CJXK14EYPeucN7Aj/6bD/42c4UKRxSERI8X1aKh
 6/B3WjwWnZHC7BRkzspkFzGOdKecsDCXY2lhE7zTbAzc7CGtCZrYW83
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: dzJtYWQi42Zn1gazo9WTaI1eSjcRgZ3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX4mYr1eIORcYq
 syHVkQtvNKghFIzxd09WtqmsLXsE/kTafdrix1EurUY3T6ynRiaf3V/HoVxMpiqZ1AGvsuWat6d
 H+ywgXPQ4vd75IZLPVA3lhuE5ZVcX0EhEMwxjm9YtZr5Xy8e4pNRRkgo//q6GJFXSmbA4CM6Ndh
 W66oKssgsehEYDFxnNnU615urRTSKaHcyPjwzYQpkuoRO1wZzYYNtjUepUfe662NixOnGKXYemp
 xB/tU3CmKlB4kLU6Qkh4rP5dxCDzrGJGwwk89K82v5d++st4Q3wVuI+v4Ql+Cku2K5Er+fqklza
 Yh/tm4xYl4faC24hChu4i55YnX4gCIA1BEQmMuExxFa2JIvpCYQpViy8+66d0NIOuqGXQkTpyKp
 SyuzuKPRIR19BgpIwgnUuAccGU09O4pV44sjcqpDAOZtu9Wrq7HGKcoo2SgozF9QI11uwfVQfGy
 ZHoVcwlReOyummD+sxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX8OBCnfvCBiOn
 yxSqVDsH+44+0bz5S0wkkAzzPJJY8COux4l1DOitWHlMOoskdF4Nl2mOby6RVCw4zMdSKhce9PO
 eCRPAIrcC53Es4ux2Jp5GdzoxpzddbA=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9c354c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7T7YwCvgW8qH-pAI4vUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: dzJtYWQi42Zn1gazo9WTaI1eSjcRgZ3o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050170

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

Changes pushed on top of usb-testing branch. And v7 is only compile tested.

Changes in v7:
- Removed NULL check for phy pointer.

Link to v6:
https://lore.kernel.org/all/20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com/

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
base-commit: edc1518454f6439e50a9220e9a3ba09044ea8d8b
change-id: 20260905-eusb2-interrupt-v7-22c8d8138b74

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

