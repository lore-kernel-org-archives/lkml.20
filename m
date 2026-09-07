Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BCC3FCB10
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762850; cv=none; b=N0z9NKxdSO4NixvVZPgbOBFEKK5SGoJGjFC64M6HvhYNFEjCJ83Jslay/tKxMv2swzltSAqWPY7hEsVtCr9wiecdZFwtIPna+kyo9QuiRyfhN1OP8MfRbE9S8o+KmJHcpRfzWKTbtFizEpqLsLJmPgYg7pDir/5XZ5CDkirVUsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762850; c=relaxed/simple;
	bh=FOQT6r7Vhnd/HfW9QjxbBHGrf3p0Xb6nsG/ugl0Wl2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uU7UBI0nZzlw5a7ebaPr8Yb8h5LK3wvK0bkBznCpvxgE30fzzZiqQfSm/bzTlpXebPiWQEkUci1g3fp93NTud07gLJnfAaUs/C/bh6Qi0Uke2b6rcU70gt0zJMKucL36lLTKHNFdTTcCksE96zB/udVtroGzoC47V14WirEAlw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGjdxOGu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLyrGUNo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGjdxOGu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLyrGUNo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l8jO2390820
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 06:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pTvHz9qoo7lj/uPQcyd9PK
	fnFrlOY5B4lOYc+cWrhM4=; b=DGjdxOGurNmE+bZopB47TB2PJonBJ+xOIJRcdu
	ELSsxV8DHkRNv82HBz99H67Ek+sKdyf18XjhO0D9hKBYJRA8LU1EDVVyK2xdHHyh
	uIeFaG/HVDCTtThOptqNqVBmc1NiOFsQjo7zSTVdo7vuH8JSiSa4oxTBC9xi9mHy
	Q5RwgtHwcUFEF0fJXwmMZvr4c0j8F/OzgYeSlOue8vqmQtNKuRjAC7cZ37NL8vTi
	JsgQ9zGRjEFU2qxtR3tArMOFltbHZ0jO0bgl1ZwTFnTvPYNd1NWiDCCDWcre1mCd
	bQgHmiFEsUtFQTN0lpD2w85/uJHcPDbY9Y4c/GsPAzfHm54Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuendrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:34:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb687f82eso38987495ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788762846; x=1789367646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pTvHz9qoo7lj/uPQcyd9PKfnFrlOY5B4lOYc+cWrhM4=;
        b=SLyrGUNogNZz3g+4j56CFfa1w+DBO8KmIjMEe+hp9XjTDm89YGmnnqZOFId0wwA6U6
         W02ge4HdVkpHB06sUZ7fft1545+RaNek4ktBKerLHqYzuEyivZZ9Em+aOdwhjZsyELIQ
         ltVCpu0O3Rr6F2hRlxLYhk/IzVsQfiEqZNpP5bIwnjxHoD3xwWkjcWXjohp2EC7vaTF3
         1AJza3ZhSa5htkmX+WvSFHy5u1fYdCUzVtR/lp7yEiHRwJ71tYL7x/iODZxwJ8130huF
         3+eSYONauHJbEipWqQx4FUhg5LTHog1ot04vftyhDtX4DgAxnJzyyAfJaIaPMORo1E3A
         rVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762846; x=1789367646;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pTvHz9qoo7lj/uPQcyd9PKfnFrlOY5B4lOYc+cWrhM4=;
        b=r3cRpWNrpPGgw2quk6EZMStiAWuCqrjjh6Wrja0eTKYkeVAKwJyf1yXkGaCSFCeoHB
         S2bHxkiYgE/lYzKGpJqvWzYConcX+gN2U3ri9/3DlugUGb8vFFSmKjSJ0+CAGoOZ/lDV
         qgHg2CklinuKpZeHBaJ0MknORMQjFN2Lfe+c7/mmAjZmFR9coQiXMKD9GfqZkcPL3avr
         SGU2LPOkUJKa7eJW0eym6r0LuNS/A1RFZ/6AczGM9Dg1IzE/zPQ2OI+GapZLGdJdX0T5
         H5LKjCEu7o/dlgAk5qtnPnGi2Ed4lY9LdBMZeFqK9UTgfjFR5cvoFW/NUW4jR/t8uaJ4
         Sisg==
X-Forwarded-Encrypted: i=1; AKwUvBxEdQDLcb/nkWgmg1e+NF3KsU2J0Wn9N9tQ0jsWOdSQofqL2z/9EMrVelYHVeO9zR5ZVtlXzaMcjD9moJs=@vger.kernel.org
X-Gm-Message-State: AFuF++nrWk/I3STGzMNLCJFLVi0AK5Iqhu+grp+1bO/usAqsJBw2s6RJ
	w4jxpsbUKi+6TcaZQhaB8Pqoj95M6DUgmmCk89+cL5lWZHAJzqODGnVLC/SkUbHlum2mfyi1GRR
	7u8gzeRx/4SjqC0dSvYIk9S6U1YipEjmXkYp3lArrWTQbEy+hCmdZEunBRTW7D+HWXOQ=
X-Gm-Gg: AYBFou0RNOkzQvUQSwx+74oXCXmXUp9/z8AK6RcpzSSozjH+bCN5ogWM463P8uFTrDX
	SB0OpxzE7Vf05D2Zf5dmTcvTrMj+SPGvjQYpi1fNpW2sW4XU6YTwQ+NoQgZ3bAvXGPz/ss724aC
	X9NmrokKwnCSyP7uPwK5DwnTxf3OrmNrtQ4byqxec+iG6dW0CdgZYC0WJFJ+jif8njGhY8ZdgR0
	k/y93fyebhQyRtz2Pin0DzFTpCD7/dfscw9+3dag2mxtsdJSFIZCDmNqsjAlCszAGTj0wTLS0yo
	SFWcMDVw4EjkWUa44h6EdlhZhM3o6zuN53LtDXFryc7kK/MNAk1iT+kWEXhAJ8gZmRh6qDxYnfj
	Se3ZXdl8L8aQz9TXGO2Y/YtWq40fBYbdp7VYh
X-Received: by 2002:a17:903:3d06:b0:2db:2427:97d5 with SMTP id d9443c01a7336-2db242798b4mr205997315ad.4.1788762846115;
        Sun, 06 Sep 2026 23:34:06 -0700 (PDT)
X-Received: by 2002:a17:903:3d06:b0:2db:2427:97d5 with SMTP id d9443c01a7336-2db242798b4mr205996705ad.4.1788762845710;
        Sun, 06 Sep 2026 23:34:05 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm2440549eec.14.2026.09.06.23.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:05 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel overlays
 for Monaco/Lemans EVK
Date: Mon, 07 Sep 2026 12:03:52 +0530
Message-Id: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFanmoC/1WNQQrCMBBFr1KyNhKnbZIWEe8hImM60Yi1mmmLI
 t7dVN24GXjD/+8/BVMMxKLOniLSGDh0lwQwy4Q74uVAMjSJBSjQqlJGxmvYNT3vupHiGR+ytMp
 a7x2pwojUukby4f4xbrZf5mF/ItdPml8i0m1IU/03Jlpixs9UnS3/liId5AhSSeXKClGrJl/4d
 cc8vw14dl3bztNZTdo9MsnpE/o6owZ0YcocEKA0eUVWO+Mh1wiOLBhdkANjQGxfrzdHoQvmBAE
 AAA==
X-Change-ID: 20260907-rpi_dts_overlay-58088ffce047
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788762840; l=1868;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=FOQT6r7Vhnd/HfW9QjxbBHGrf3p0Xb6nsG/ugl0Wl2c=;
 b=9avyaWPPCw4SBnNo2p/iK0EDEjdBweCAtXOU/opfYBJHasAIAmRVD9+i6mgC8y1PDw/tAUviQ
 OYo+WLXjcfVD991FSX6jBhoPb5SSd98xVqa7D2Wl4OM4LpthdrmEn3X
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX1uzLrpl4dFqs
 0yZKhYZA+N+wU/HPnBaV06ua5V3fTQHpHQUy1Sme5IAe1U+S/ynKpRwtBnF0VJhZE8hSPLV3vO+
 sOyUMEsEvzFA5fx8uLsSgaTnrn2djiss4s8LWeSiD5HpaQix/z+uJr3yIkPCuvvX2CjX2rNj1G2
 11vK8e8OEbqxEx7hi0VOph8j/dEHqcjml17qZfah1Qv7j1NFLUaebQZIGZd+hKE5mo8HZV+q/uz
 Snue4U1EF712lLerUw0BfDxYykt1F2i5s0EsetNJDfKvDEtYdptVYxrLpFfXWaOfNMdBWsbYrtp
 CjNQV2IR46F7qjfsgqmo7PEe2jAYTO44SGppmSGMjgQA+j2fb8Vj35q5UzYNSiwvVpTpiBGSjcH
 N5FXWJXNeCTXOlhB86/eYFSiD56FEVQ9nOGnRxdjuKyTdEtIQllAZl6Ktu8HQLbdp4YBQ+Tkw60
 BwjP1uBf+XjyfKYaguQ==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e5ade cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=aaDu5AvUN9vEm-sYl2MA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: twWU2cQPC7_zhYS_06hon2QmlraPJlcF
X-Proofpoint-ORIG-GUID: twWU2cQPC7_zhYS_06hon2QmlraPJlcF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfXwJcBIEWju8Mm
 yhPVhPC89pwHvEkIznbSPqC2S39WG8cKovN6HD1Ox4hlpf2bWhEoRL4KsWxNgN31z85UNTeF3Xa
 9Unveql4qAg3iDy9nUsfWmVO2Cjd6Vs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070068

Add device tree overlays to enable support for the Raspberry Pi 7-inch
DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.

The overlays configure the panel on the primary DSI interface using
a 2-lane DSI connection and instantiate the panel MCU on the
corresponding touchscreen I2C bus for each platform. The changes
allow the Raspberry Pi 7-inch display to be used as an external
display option on both EVKs without affecting the default platform
configuration.

---
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
      arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
 .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
 3 files changed, 169 insertions(+)
---
base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
change-id: 20260907-rpi_dts_overlay-58088ffce047
prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>

