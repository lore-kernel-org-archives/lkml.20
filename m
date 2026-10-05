Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBFA480327
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202911; cv=none; b=jgd3MRRA9Zs/xa7S/EzmtPy+9NpqB76R0cDrj/C+T9j06/qF4vvJnOgVfb2bhfzsdMPgzXy3tgCb7sjWbTgWH119I+bPHb2jr1OzLFWEpeuL+XSYERANRnJF/oWIpIwgJuWPopk4OgIDJ6iIJbAaB1AU9UUEMwhoinXSYThTFdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202911; c=relaxed/simple;
	bh=UbfvsxV1N2Q2BwLuWb1XgYTj+UMWr2glJ7cM9WRcoZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6QsPap7QKNHYlDRnZsePAVYThLhSuSxlhtv4BrfGwCmLv7ByulzSJ1C6PobRVgAD4dkuJDN8/0SkGde7m8BuK3l3H9Bc8lZeVNYNAZeNqOcmOrGs23SM6XICv7ty+n1sr/v6/MV4Q/OzT/2XgVFEg7mhdKZ6j/Ro9Gh0FQJld8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1s9ueCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCsl8DIU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1s9ueCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCsl8DIU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFfwO2366692
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 12:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khcQaR9KeJm7qpoXnT6a9/DyCnO60USLg+886y5MCh4=; b=X1s9ueCyZhaUEX0g
	fb6dt+yMvYvSoqcIc7Xvs2Wpp3UL1HuYyMkjjRcHrBeRD4Ztfmpja8tEiY/x8iw/
	8XS2lTFV42K8w7uRO9BwdX4xV6m3wIszxruVAYmT+qnCibpwnecJoP4sFuAFpKk3
	NYBCdcTnkeX3kBnwvRcwyYR/p/o1w5p/CtVAuhzjnBKwh45txawBkaq0quX5F1+q
	kQStTo8KOcImqG25oBSiOMZWKJFMWBZ8age1yUSRXyNWBtMXIVzvru0LewHlSexy
	iMNdWro8eQtz59IZNqW6ounfJ/pYI1O/+ji79ULOm9vmr00NdqGPJ6daMFx0IG+i
	8EJM+w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvrckw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:21:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso357756585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791202908; x=1791807708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khcQaR9KeJm7qpoXnT6a9/DyCnO60USLg+886y5MCh4=;
        b=NCsl8DIUorVPzmgt4Q/FVjzG6nRANqscLHis47k7x/j3/Dl26A5p0MSxSYCWH1BzZ0
         9J+DZWOP/mYjmPM7s8MGkXdPuuQbyTtb7t8W7QtwOzclrue5g9E9o+rI7aec/H0whlS4
         taWCvFOG1BIH60+uml5n2eXzRnbbFq8h2uxLAZ2idpGjI9jMkd2sLE+TraxcppvMYEbs
         ebVEgnMS2Q0CnDF0dJ02+yNQotq+lLbopKhVjb7rigPg+Ii8RLyFLHaI9DhhspWoVj8E
         ofT0O+ZN+tyVpwiCmBTiR1Ime+okQsU7d86Dwl7aByp0e3IDYD7Yz/vqJNoiHZo9d7az
         gTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202908; x=1791807708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khcQaR9KeJm7qpoXnT6a9/DyCnO60USLg+886y5MCh4=;
        b=Sj0/GoAG3pD+RibYeWtkjlXGB5dBpP8joD1AyGh9cgpwJuSav9UMm1SbAkTP/0Ad+e
         55uOuzY0QXtZR+wWUiVvticoi5Z7x0dlEQT6jNyDXHyXPhlwsmZhwA1NciOya0f+zs+c
         0k8u9EqxdsYbYyfCmKWU8j8qpEaQo6WtklVP/WC9s0iLiUGUzRCCnvOys35sCx4BiZtY
         ZrCSF4fFYodWApf1OhfHpCmmqj+3Cf7IP3s4/qCYcQTP7fzGphYZFwNuXrfhR4gGxRpf
         41f8ablnDyrik2uiJugDaEA61KuhnK8NbCTtkFXU6lsDnl9ixHaqc7vVX1bRIXhK069D
         +qeg==
X-Forwarded-Encrypted: i=1; AKwUvBxi8JCEuTYxH1PAUYSSl/cKcq36YD7tKyH74Afv8448DGojTpLMgvdcPjeo0EV7YNXHYXx+J32kiiwWG3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lYOac+xylNmUf3AeOLQf5nPyHx7taOBx0Ylx/P0mDuO0bRTGCb
	K47EbaNrRT6ILSzCKVFJkzHyzf9D0SWoFAWSoOVqiHfUzQ3FUnA+p8eOAGyd/k7VO0FgjHf0DoT
	GQuz2mYzFainYcaXPWmmerbrUFmudsMhRmpwKfbwE5VYi5UP9mp5R7+k2ojhNKqFRfrA=
X-Gm-Gg: AYBFou2JTNBo4+awoJMwQc+VUwVBCeHRXrMdRhrzhg2rWUenB4qOwkCaWMpaug2wych
	817JPsW6yUt1Xm4nwQOjlhDPL1hIk3Y4+rojR5p7db09HR2Il8W4ZgZePKvuKKGL8wJSQvofXq5
	q/NuENNDO/8hdL1qn/uGspJk3l5kT7aFD5CIby6oHYWzK6ieiDzobomLJL8zj0c6hhnmW4BMwjX
	GfuW7ei+9bfjRjxaJmjRiWT9ZERqxWiXmFYkXB43IzUpWQd1NHD4YZko+QSr8MqdfQ88sDsCSav
	5DLEC4LeNUzwowO2ilz8v3TfWdBtS1Gs4seQ8cjvtEsL8TqaTe3CJohP0y/95iq83yGO6XQTrkw
	GsybDjyAHtZ1BBmVJ7BCgXuzxnpPWdYSFxz7oevxwTT3xFDDh9jalvf1ZjPawMmTKSeZALyk6Mm
	jPAs+rjKKnl5O0eAM1SBwoEHTuTdOCRE17xJamjQamXhyfBef9TelyiUrxhR6VyvwZcxPCmA==
X-Received: by 2002:a05:620a:199d:b0:93b:beb3:5898 with SMTP id af79cd13be357-93e510787ccmr1202222085a.49.1791202907818;
        Mon, 05 Oct 2026 05:21:47 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:93b:beb3:5898 with SMTP id af79cd13be357-93e510787ccmr1202218185a.49.1791202907310;
        Mon, 05 Oct 2026 05:21:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm324157425e9.1.2026.10.05.05.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:46 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:21:31 +0200
Subject: [PATCH v7 1/8] Bluetooth: hci_qca: Add M.2 Bluetooth device
 support using pwrseq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-monza-wireless-v7-1-5a6de7662dcb@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac3965c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=14bN-6-z4zEjTU3E0XQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TVOCa2F7kMzxxPIbpTBSOo7rWsdwY0H-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX5tCShGAzvEWC
 Ej9K2aC89S95/IVSMYdMgDul+fSBK001X0JfT1WYDgvdVBxIhkClizbXo9UPiuMmpPs3Ebkndle
 sq9CJR9iODa0tC6MLbKcdHuYxaLyRNYRQ2LPIaqY0vC9SyipZJ++K2QSNiYB/6MhPh73yMEos9t
 5QslbBHtom4B+uezAgxJHRugjbYQ2NrQGmhg8N5A2h6KqsuLaJPvAtoAWOzWmR2w977vUU6/Tm4
 RnBpp3RzlPAe8ixVcDWxEZM/kWbPqoku8ObItX1PHqvx2INm+QgjM63V9kN7bbTj1jzGkXp1caz
 xc62AViAIVJqY7EN/bFCkAwyb8UCdrPm/F8J0yx8Zlb7k3vHi7DyqsQsloU1MU2qFRJfKKxnYCR
 T2286A4lWVizo46JtxE3bnCZjv8PobnzGqW8Kfp2G8CRberDnTZYdXLtRHEwScpCFugOeAdKgYu
 BxvAJH8C/qdoOpCK0Fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX9y/zSJ9F1CPH
 Cag3JYvyHPLKkLenZO0vGZRJ2+nDghvzSfHAveHnSSJpmOGIky1iKzJvKdjPocaut5egwdWxG94
 qTf5rAh9A3T/4L2OPsLPC4ABwjZdKYw=
X-Proofpoint-ORIG-GUID: TVOCa2F7kMzxxPIbpTBSOo7rWsdwY0H-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Power supply to the M.2 Bluetooth device attached to the host using M.2
connector is controlled using the 'uart' pwrseq device. So add support for
getting the pwrseq device if the OF graph link is present. Once obtained,
the existing pwrseq APIs can be used to control the power supplies of the
M.2 card.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7089e9b639b2aad2d5ad2d43b07f495833757805..e249fc6e44479142e25af4e37bc4e1bdba13cd98 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -25,6 +25,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/consumer.h>
@@ -2454,6 +2455,18 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+		/*
+		 * OF graph link is only present for BT devices attached through
+		 * the M.2 Key E connector.
+		 */
+		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
+			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
+								   "uart");
+			if (IS_ERR(qcadev->bt_power->pwrseq))
+				return PTR_ERR(qcadev->bt_power->pwrseq);
+			break;
+		}
+
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the

-- 
2.34.1

