Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF84B47F3DE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202914; cv=none; b=N2C728HDLsTCiLoGvKSmVljoqxU5NBmWXs4vwTZNDxQ1Tc3MHF1VjlqYF1F5h2dhO8IdbrrcbIp/JcdmUUep1mpmmX0aO3cFfUliuq0Fqum7xmEPRIiRLv64A8+BiJh3yVAzmOhBlCwS1kIMCgRxgCsMeROMauZFoLLHF67sYOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202914; c=relaxed/simple;
	bh=ZaIFNr9aHwIPrZnhK4k7xdH5Zwawb4hhbdoA4X9T7a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nI4LCMM3U716HQJjENdc4h+KJNu3c1yi4LMj+0EY79d48tuBm2bVlkKGNS5VCGmXL8iNwZ1cUcmFMA2CHwBQtSXlvmVC6T4nmElQsEuE2qfXeNiHceagTg0SmTFf5do1MezoZ2HDZWWPnkAtQr/WgrzuXcMoXC+1q8FkABwwZ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3XWhEj8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K4fwom09; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3XWhEj8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K4fwom09"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CG9xm2898835
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 12:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9N0DSJJFJ/TfaSBM4+7KvNtrVX9fRfDuypNpenjY4w=; b=K3XWhEj8RDkIn/9N
	OvGZrk5C/JZna+JorcXCCv1X9b1/kWfE62IMZMxlOaOG0IVtFZ9GkdmndlLS7WEi
	9wKxpmcEgHypMqtNWrNETy0ZCzwtNhfBl9iAFchQHaFYVsaSs3MdPCFpGrXSbnJn
	MnP/iQSkaNkxwBHhh+XrKabpuxH0hLKG0fUE/uf2XlWql383KUpN2X/W0cEVzCb2
	Ff3C1M3SpP6WhxF/sBbsK0HkkphR+AI+4izJjkstmqMLfOccMp5R2yU18DaaFX5a
	A/mCkQRIHZvRueorLnXcA/E7wpFw6h7iThSNSp/qAIS7gI3kxSMeY0co6T62sH49
	Mt2Kvg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssnr9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:21:51 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so1392221137.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791202909; x=1791807709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9N0DSJJFJ/TfaSBM4+7KvNtrVX9fRfDuypNpenjY4w=;
        b=K4fwom09QoSzU2NrQ1LcA5OnUgPSvXYjvRmvYJTNBLDHoAiYAuyo6XcRr0Fif7Zu3/
         DHkd84V6swEkmF6Ol8qPeSgxyFs1hfzGNDEs4QViDuHIJKXaFXn43tu0dBg5aBPUZPJL
         IHBGkoqmSkSziw6ZTecIWQMCt0sxB6VqHYozza9evTqLDzIjaK2ZnOQg85xDHGoRewKt
         UMs4iLvTO4PgW4S4HL4XnBPylld1wW6M/fBylteuk1g6PFCTS1HLDVK63sto0Loh6vRr
         Bzr7OSyZzk1j3Lt2aJHvpkFfTJZ7/4/IpamGZPUH+MR+BPlhuV1krCYZVP3D2a3cGCMi
         kljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202909; x=1791807709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9N0DSJJFJ/TfaSBM4+7KvNtrVX9fRfDuypNpenjY4w=;
        b=xkRi/iuU6inV98TbhpiDRYMOh+zvNAxzjsU8aaoJ+JC3js/LVBHsuigaqbLKx01L00
         I2Vtd1AOSvJ2LsqpQbEfN22v4YD1F7nKOg3QnLZYUnvEe+3FCGPHKeKeLNPutk7BLXg0
         UAcRUEhRPW97SkigQ8Q6qchTqTSA0JEFgrYdIW6bjm87a/YuNrUQmYDVPgtZ8U/uBKSk
         rYcVtYnQDnzt7ej2zU8+AIhNcTx9ahKVjLB+e/V+pAl9Q7BpxqOSHdF8bOQ6FicZKQ1B
         Q7Wf9/lPDFhNStJ5KGWsRrhn7JsTNC5kpt35cJwhV6Lw0KcTkqk14DHrqlzQe8kpMyX/
         uQAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlEByWZps48Nd7bC5rVskKOcYDNg1CovYyLBkfwVV9PObLcG3mdca1GB1oxjGC1V14uWH8WRxS+zYh34s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjFJ2HhhiS1MsnCy4L1FKHYPDhNFF9jKrzJwjAlVZO2gygQU2Z
	rRRGWX33QP/O+SI0XC4dbXt7QkZVh6JHd6J2Z3J1UQ/DOyaLEoGqYs5ubL+ovh83yCNtD/vFVNK
	jy/+KvMwf+pX1h473i5lKPhlj+I8ukuyCB6JFptxXypvEnv+tQlyEapYel4q/Q9L6WH0=
X-Gm-Gg: AYBFou32o9xG9edY8mZKXSEfMN6t2uj50NatpxpAYOKLGaGnNvwQt520XaUqcutY4/l
	NT+qWPsHska8cUhgmFWjdwuYJYolnGNQygi8qDxi+VOKPuc0RvYD+GKBjlRiftLqEtgysN4O2Wq
	CaXICoVzg+xD6sdqIBP7pnJNR52nRwMftw+k9YAxvGOvJjjOHiYnXZqpraZ1fAGLXEJadRkUNna
	c6smCimzUjtuD1j+me+xym28z/ZUIrUcy4P/tb1pwdjWy1xo756DMWeJD9BYUwp9/ibQms6zUn3
	mvRDwOhkMS4L4u6hWwqh4bZ7VZQrYEvY/IggiJX2CO1iDqG5OF6OaDrSMzwegiOAbkl8D2uVhbu
	a9oS+FDgSKRHZtjB58VZNJS1LbBxvuHau7jQh8lq30zY2pW+x/PUK2q+wCvNo1ai/G4ziF2/Gc9
	FibE/9eHDr0jL+FbvXXATXG3NbbDDzEmESCplwzN7/oZKBO35L8Oa8aJru7l5lP0iR2PK6tw==
X-Received: by 2002:a05:6102:c15:b0:7be:3606:2248 with SMTP id ada2fe7eead31-7c0f55b1f6dmr2820758137.34.1791202909515;
        Mon, 05 Oct 2026 05:21:49 -0700 (PDT)
X-Received: by 2002:a05:6102:c15:b0:7be:3606:2248 with SMTP id ada2fe7eead31-7c0f55b1f6dmr2820742137.34.1791202909054;
        Mon, 05 Oct 2026 05:21:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm324157425e9.1.2026.10.05.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:21:32 +0200
Subject: [PATCH v7 2/8] Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to
 'bt_en_available'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-monza-wireless-v7-2-5a6de7662dcb@oss.qualcomm.com>
References: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
In-Reply-To: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXzSAvRamzw8Zt
 j79rFlQpSKEZwAtpfL9ui3K6zNl7/DFKSb+tgd39GhdfEVlDl+yPrnxV4nuBQqYintXHqEl9+MR
 lOzQDH379gUSotZbIe6h24X92gcCBwU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX1oLOAKmAbFtP
 IV0hDs1vPDkxuI5f3V7eIlEYWEqONd7kR+WeIQJKeV/ePdA72QXqbWFLwlUE7lPt6onzPKgjhn2
 rOFLyXVxBQB1abjLUFhJ1ZvZyRgciQLxE4T1r2tm4dIRQtfoG3EFmheduy79IlnBSq0QLEfRyM0
 kKREH2BB078YGqGmIWxq2F+z6NgobYW1VIB0YTbLun60y2zff4IXydeT/3PBERJL7IKdisCg3xq
 a3Uc2QNF+a25s+GDnr3SWP7+2zd7/R2vF71cADgCpEN0C6sUD5zaxQ4N8B65UkTh/zX8vgDAddH
 CnQvuihVWsfFolaRU0V+F1vD7h6Lz01BMXMfLIOLtTa0g8TcHFYFDz5JtkYjt4blNzAn2Tty1oT
 RsZ5VdJHx9MJ+HNzwbQzSHMxzoiimz3eip1pv3Jl9bg87KsYdzrF0NUc+eOazASWr3WGLwVgGEy
 qKIx78dS+I50H9m//sw==
X-Proofpoint-GUID: 9wn59iffcj55pIZCDjAfpL6YecrXoo9n
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac3965f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wYtw_XDhO1ghKZOGarAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 9wn59iffcj55pIZCDjAfpL6YecrXoo9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

'power_ctrl_enabled' flag is used to indicate the availability of the BT_EN
GPIO in devicetree. But the naming causes confusion with the new pwrctrl
framework.

So rename it to 'bt_en_available' to make it clear and explicit.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e249fc6e44479142e25af4e37bc4e1bdba13cd98..f53f95601693dcd8356b4b825776317061050f1b 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2402,7 +2402,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	struct hci_dev *hdev;
 	const struct qca_device_data *data;
 	int err;
-	bool power_ctrl_enabled = true;
+	bool bt_en_available = true;
 
 	qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
 	if (!qcadev)
@@ -2510,7 +2510,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
 		     data->soc_type == QCA_WCN7850))
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
 					       GPIOD_IN);
@@ -2548,7 +2548,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		if (!qcadev->bt_en)
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
 					&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
@@ -2566,7 +2566,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	hdev = qcadev->serdev_hu.hdev;
 
-	if (power_ctrl_enabled) {
+	if (bt_en_available) {
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		hdev->shutdown = qca_hci_shutdown;
 	}

-- 
2.34.1

