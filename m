Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563359;
	b=AVENNmSN1lpDxlzkR4QMzMF0XkwO2VHJwjdKlTbmBm8x1jL8miyEocmPc+6K6fYDSVmH
	 gyvJY4OU2EKU6A6cRK5S/e3cpyr3RgW+7gSC5mlSH4yFrPq8jsIpw1aOsSw1sKJfQuKKR
	 tzOsYTPBzVZKZ5aUVVivdsXrVv4BWrQ7MicxdBc+wsexwx4INJIAgHlI5PeIQ9810mit3
	 /KQZ8uBkUctnh3ly/hgk4Wp7s88kGJPAE2Z3TjRXQGnyhofj26tVlhB8qG19Lyt6TxDYu
	 wkycdTNxGfSvO/8QyaP1EfbiHh7QmEeuxB7szPAiBZFamv0m1VQZjqt+4o1SMHARrsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7P3j+H8hHPpSBQ/nouk3NNH8J4RFZW7ZLOXVVsbRkPo=;
	b=r3IBo8+G3WYlo18/dHmN1aw2/0PpEA7Sy1rWKsi8O7nXJDqwQUxKoU9iW17eQsKtbQ/E
	 vnFIanVZxWGSworLjd5t1gDWZQ/35TDz3Hav9fUUn5M1hkuxsU1+tjv//skUPJSQpIk7G
	 0h1bCMHNTph7v32ynoTtPd+n8Vkz+8EuJxnjZfibJxMamalv+wDsePy6QJnfSNwWAGeT1
	 opREgHnqxuzRVgNJST0/RG5rKw1/WXU5/sZ6qWpgBktB2/tFncB5pxsB6PCBXw7WNYaQQ
	 w3vrP7Ljk6ooLbjkyz0B/igE3YR3nde63M1UjaN30ndhITOuOPgh2Z5/vHgkzCJ9RBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QZLv1sw+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YI0g6GjO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907BB606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 907BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QZLv1sw+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YI0g6GjO
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQpQw4031031
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 20:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7P3j+H8hHPpSBQ/nouk3NN
	H8J4RFZW7ZLOXVVsbRkPo=; b=QZLv1sw+f7eRn5dmViLQOx3AqOcxHnfG3ZC5w2
	CjQTrPsro2FE0U58N1lTiKDHyjh38v+vYta0YBd4nyNr/Mtm1bnZdMMc6KKAnP99
	mmvMSfrgUX/k3X/RsEJHzTRxjSFQeaGkuET9oaAzeJGi+v6HSqx8DWjsJ0KU7MGn
	VQBeSh5dp6MBT7OSL7g7p4mFjK5klu/gl167AtKwZHK/T4BUJC+E4K0nqiu8i2Wz
	5Eei5G3j87Pk0cL75Gw1Ewi/A2Y8LV4wA4eowo6hMGuvlGTOxWy7Xh5vZ60hd/Pn
	HDNHrnG/KAoqHvbMGpuhfPq8xCZniTD5+vpXwOO2ddWUN+qA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk3w57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:02:37 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b16286c152so43612657b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793563357; x=1794168157; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7P3j+H8hHPpSBQ/nouk3NNH8J4RFZW7ZLOXVVsbRkPo=;
        b=YI0g6GjO4HpHU+Y+kuVyjdhVWGuycCDPbRVdIWEwcUT9qgfw2vqHeA0FvUNPFjp1x2
         bl3BK+sdhD/+kGpER0T4EQNdgWcp0ARo5ItFPDGzVWsG7bD8CZvGMg/MutxScZJWVLw+
         y6LwE57KQgk2etUZUFABLKag0B8DirIj4mjHOz12xSWDz4gueQRvsoIDdIqOrDwvu91W
         exasPnTQSk+jgp/3LLxSwhk6F5MWwqSE8VQLz1PedgC7le7fYrViLjDzkfZp+nwkJkb/
         dd4lgG1MkB1+n5jYf3SIKD5rVJug6ZDh4VTXv+cuHSPHQcopFAf/wU8KRrYkeJDyDATm
         TUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563357; x=1794168157;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7P3j+H8hHPpSBQ/nouk3NNH8J4RFZW7ZLOXVVsbRkPo=;
        b=VMCvjQjbFEaNhgLiVOvIIfNy9c9JzdcPRoIbDGPw/WSWdy+513jUXWotUpAn44kldh
         Yfy8S9fH3W4BYAwcQvqKnGtS6DvqlohHX8BX9o9G8ixHQTOF58e/+j/TLSX0hb3LSj08
         j3gxiffJqeWPIrWSuE7eUN/D93puMHyGCr9Q1mGtTLxyjR9w3v38kfuHLjlPFSCmOBOZ
         B4VZp8WptLk+5D7xgsf0IiL9/VUPXjy8QuLkS9ZGN+T6IjLszNdRU9jS0iX0HtU2avMC
         MWjgwTvPLc3tDCDBFn1LEssARcBYt0aMotowa+xswmLVn3i88uaBxQBxNSMW4LwOCy30
         0ymQ==
X-Forwarded-Encrypted: i=1; AKwUvByIa9ssgZSWjp+bHYV262sjqZKICLN/5ydgG+3DZpo3mbHpXat0zOA6X27cqikmluoRXjE+AdBiAHJyVfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mnBCdJ6pOPr5hix01R9CgXh9nS4Mlpm9bGmrk9IsA+NXKpDsw
	zuVNl8IzwhuDJH+OXV9WUBnsFENSFwZs7ukE5UJcICshhf5Vm8HB2ZJ5Mrd37C1VB6JtD835kRS
	88ZIyji9U1N1Z3bSCROMuxzPd1YB9B8OorsEuulM1MgO27aPiXLMOOiCNzrOSvImRFmo=
X-Gm-Gg: AYBFou0FgHveMtU5zooDPT4dxgVpY6Vbiy9OHLE+C8WhdFv6cB2uEypScQJIva2iq8L
	AizUOX5B6S+7JzSPO4k1VdExyg5a1dU9kCHq3m9V+Zm8yuOD494er8xTD48H5FzdDXiv6aziHr5
	HFkIFfw85NM+hpukAY/gJiPIJvr+IQ7kgk/+NWXSauTuMHph1Kl58Rv/4aLyAVIgvTjfrBV6VBm
	asCoEZ5rFgWHbb4/+zu6rhr14bK0QN0yOrQWD0NSk3PAV0sv5hEQeSOSvBd3YSY53nNn95yqFfy
	Rca7h5yEuCSoVcxUXgERP988eFNlw4KloftlH8oexZE5I2P2zC0qd2/zTUciB77AkHUP6V6GEwY
	U3DArQ/g6e6ddLyra10DkT0aUQg3TXg/yXQU75q+FZp8RyjV+sF3W9CEob07LqK4QbA==
X-Received: by 2002:a05:690c:c50d:b0:8b0:e13c:284d with SMTP id 00721157ae682-8b2b671bd3cmr42732197b3.49.1793563356805;
        Sun, 01 Nov 2026 12:02:36 -0800 (PST)
X-Received: by 2002:a05:690c:c50d:b0:8b0:e13c:284d with SMTP id 00721157ae682-8b2b671bd3cmr42732077b3.49.1793563356352;
        Sun, 01 Nov 2026 12:02:36 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7198c65sm41034807b3.36.2026.11.01.12.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:02:35 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add HP OmniBook Ultra 14-kg0xxx
Date: Sun, 01 Nov 2026 12:02:33 -0800
Message-Id: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANma52oC/yXMQQqDMBBA0avIrB2IQ7ToVcRFjWMzLSaSWCkE7
 96oy7f4P0HkIByhKxIE3iWKdxlUFmDs070YZcoGUtRUimq0K/rFyej9B3fC9qFYU6uM1jXkaA0
 8y+8a9sPt+B3fbLbzAsfxBxcjjGRyAAAA
X-Change-ID: 20261025-hp-omnibook-v2-970e4290c445
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: KnIFRnRzpmnzYHRoydmGQzkzr1uJCz0_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfXxFkWTACLJ2EQ
 AEFLSE24ymkEM8hkwszWIMfeyJDBzPT8IiFkcda6fqchOGjUxfo1b2C86Sg1iZeK7O6aTJqG641
 CUGXNruNVIfhVP1ak04XDe0u7R2xJUdSWnC2gdY3VMw+zbleo6/pGpsQTnQP/fzKfrz/SU3pY7W
 3ssCk8jYqeFQdOnJEFyFw7qhsHu4/dR6dE4FqE1jIpxjrjwtUs2IJ4JL+0yoCcBnkXV37jL8XG8
 ipoh09UYEPHQJDkL/t1ZaMWHm8j5KdT5E3K/lfzEkv2fKecDNC8t0ZINe3bHO05+RF+J/XMWzM7
 TVnNWMir2nklmk1ZxqcmNM1AD7jiiFR50ayQmygcBsFYbQ4STDi/Vr6TwUuH/mnmjOHFAU/6X/D
 ijeJzHcJFrmOBJebC5RqjpYkdikeUQl5V/nlnn2JHqHSianTY5aiglqOz/aR/8poETf1/DHNksM
 0LqpFYJXQyR/cwiIvhA==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae79add cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zEFAF26_c48A0c_HBRkA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfX88riI/no62LI
 jnAGegLfoxP9FXzXf1VLXg9BoHgcagxBwvwl80OlR2B5y+6d/FPDAaDquWyxpz+ofpCFVVkK3aY
 TYC5h5WyQw68c8kk7ygrie+1Ur07hZo=
X-Proofpoint-ORIG-GUID: KnIFRnRzpmnzYHRoydmGQzkzr1uJCz0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010079

This series adds device tree support for the HP OmniBook Ultra 14"
Next Gen AI PC (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2
Elite (Glymur) laptop.

Working on this laptop with this series applied:
  - Internal eDP panel (2880 x 1800)
  - 3x USB Type-C with DisplayPort alt-mode, USB, Power Delivery
  - NVMe SSD on PCIe (pcie3b)
  - Wi-Fi and Bluetooth
  - HID-over-I2C keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture
  - Real-time clock
  - ADSP and CDSP
  - 5MP USB RGB Camera + IR Camera

The device tree builds and boots on its own. USB-C DisplayPort output,
including over retimer/HDMI dongles, additionally needs the qmp-combo
DisplayPort PHY update series for glymur (not part of this series):

  https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com/

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Changes in v2:
  - Rebased onto next-20261030.
  - Addressed comments from reviewers on v1
  - gave sound card its own model name
  - dropped redundant items already enabled in glymur.dtsi
  - annotated gpio-reserved-ranges
  - Link to v1: https://lore.kernel.org/all/20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com/

---
Jason Pettit (3):
      dt-bindings: arm: qcom: add HP OmniBook Ultra 14-kg0xxx
      arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
      firmware: qcom: scm: add HP OmniBook Ultra 14-kg0xxx to QSEECOM allowlist

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts   | 986 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 4 files changed, 989 insertions(+)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261025-hp-omnibook-v2-970e4290c445

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>

