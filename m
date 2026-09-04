Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE3F4CB8A4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536549; cv=none; b=URwvi9uXZRS9DX51ChTjYAtwXDWP7h7wOJLeZhRmjf9XxKRV/+tE/xXGrV9CvuLWom8HIogfRRgxDwns0ue6rs/79yZuQ4P5F1SWZPD9c6SzR72Yl6gWNjoD/Oz20OgCt9UPR0XHgXQyIMS5YbfP8tYriUxfdTG/HSBtk2FgQug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536549; c=relaxed/simple;
	bh=eabw6YropvwFfJY2b+1eTw6YCvYiFIzBiSUIvBH6EIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OzYIA3sY/WqpXcc6TYk+8EyQF01kjLKI/IDURIwoR9k4tVAbxFmhs69JlkHYyZq9WNPj9PCPMFW7GLaoiTsGrkruuG4rQ+wqQmNFvWI6OBJ2l8huATw+/xsPMin+PzqZxCNFBEkWNt8p7FIrh9zqcbxceNolbQ+R42ahEz7nARE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WOD0sO8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BnnJ5S8V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WOD0sO8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BnnJ5S8V"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684DgklT3719482
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 15:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9j9KM2LX+O0X8B9cuB6dNL2MqmnXu7obuRd+dtnPH8=; b=WOD0sO8Gfg4z0nx7
	ses2bEkjW9xSgpstGlM/6aKKiyU5vO/8ImecVZGBw9oPsQaOs+Cw3qbZiQBWcXlE
	cIppwgsVgKQgiazaownlpayyzo42c6whucfZFbEq7uWiKs/YO5HMBEgDrNjrw6fI
	/ns+5bqUwUkKnDhgxtOvYU/DQTPUU2CSjMZ8P4F7otVt51ca2WEgj7w686v9Jwka
	jG1dNQXBmEyzotB5LkBFDGokBaBAz8EUlbP/XNTJ4itaIBBtB2i4Luyh2KD6b0FG
	I2I8K5kMKfq0d9TivCMUIuX99S7k7w/fuEiQkvQaUzUV9S20k891yCAnHFl91n20
	zeTj0A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd2p0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:42:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so191069185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788536542; x=1789141342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9j9KM2LX+O0X8B9cuB6dNL2MqmnXu7obuRd+dtnPH8=;
        b=BnnJ5S8VLYv0Nnr+GekGp22SvHN4AK73eAx5kBCFTz4yReFL04vujTGKdTJ8XJcfcE
         G2CXPVoYxa6KAozHCSlyobwM3k6s3G77VtCytxQcz9TF+UDaeu3C+5csnWeIKRXRaKxY
         dIC+eQiASY/WhHZu2znhCkQ0QHL0rBGPmcUM2VexKgTVeX0BXt4dL7nxAGB/wnOu3TEU
         5sMJ9gdXZ5n/7fscIMiGFTb2bgfwIRq/zjIQH9j8alJt18oY1vkBeT7B1YudZRC3jFJc
         Ucz1hgozmEo5z0JlHovf283jpI/SgDxOtByFQdKZSRDuf5Rc2nHfUBwxizGBB2cVJmfE
         48Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536542; x=1789141342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9j9KM2LX+O0X8B9cuB6dNL2MqmnXu7obuRd+dtnPH8=;
        b=Y+39/HWpymw/NKYS6MwuD2TbThJsjLAUpy5tj+64+D6RK1tv+v91rr5zsMVqh6++b3
         VNwT1ErBSMrCACCUQn6xdC9Gt+qBTWF3Gb9C4tu02nVTVSO4z0MZ3dRBL8JmJyQDmgVg
         oxpJk03gsaJK0NQ5/D5wV91x85k7yh2IQoZ0QIWQJZWW8AQaM2ipdzoDZ3VCR2rxzBjg
         Dpp4HnZ9o+MKaXOz3wFSvWfe/bS4J2YlUJ0hXr46CRgEZoNWshQl9n5ar2Z1+MVGn9di
         5bIvZZbwRvjgXrafOLWtzZcDOl+x35uPXw+Bxv8gMvrF7BOni/zgTxiO6V6fwPwnJO+p
         YhJA==
X-Forwarded-Encrypted: i=1; AKwUvBzkhPmE17xdNqnE57DTDYWDGgOeLq0B5CzFVojPhjID0IrZ+M5E4IB4P2tOiiw9QUazpWL5mFowcdbwXJA=@vger.kernel.org
X-Gm-Message-State: AFuF++l6/jbvtZhlV8zlSNwXsAFchBAMZOjSOmj5IoY/38IbOdmgMCnG
	mUzNv0RfOrgJX3G6A/rQ7SKXmgZCgzqpkZdb6I/nxLi3ryfcrCXF5tKx8jbeMdIiUsHTN9GFlqx
	UeQPwB061HBVSyz/KacwEzELgAQK5AnClmtXzsunWrEAKKpTsrsCwR39+0/UWOSuFtRE=
X-Gm-Gg: AYBFou1hPfzwkTcs6oBZptL3C6ycmAeN29do1Zn8RkDF0eDtXiv5jQOPs/2s9j0yjfl
	+R6mHpY6Ut1mRxFobxrEaycOJY4LEM3IqbXrCtRdh7Xa+ns2giBvSMZ7eA/itGXZI1IIL9mG0Mt
	pDAYAbdB5+V1Vs6sHEupcx+ZdHLUmQpRR98zfxDCi8adQnrTPI+Yrkg5anoUXTkcYcRZU1KE1xl
	QIIJP9kKUvNU+zT9MWm09kQMr59zbLTdXuoZJIFHREGZx43spgibxzOeVTnlu1h7fKZ08V0fz1e
	6ueOaZqrpKujhIS53gNDJli6+b85KwHCvqNbiMTe13C/xPlaDjp5+KrAbec9OQJHhPWXZidvXuT
	ZLxroeZG/Z8Bc4Jz/pjkBeKD8mIBYrU9dPQJ2AOsjVvAJlf8LzdvlAHwytgkS+PcCvJNX8JbOC4
	YoZOWYYa4SBZMYZecm89KA8jSI2qyFz4w6M/cxxGHt13wH4EhfvXY=
X-Received: by 2002:a05:620a:6494:b0:939:957:ed2a with SMTP id af79cd13be357-9396e00b139mr1257454385a.15.1788536542128;
        Fri, 04 Sep 2026 08:42:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6494:b0:939:957:ed2a with SMTP id af79cd13be357-9396e00b139mr1257449785a.15.1788536541696;
        Fri, 04 Sep 2026 08:42:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm160668505e9.3.2026.09.04.08.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:42:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 17:42:16 +0200
Subject: [PATCH v6 01/11] Bluetooth: hci_qca: Add M.2 Bluetooth device
 support using pwrseq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-monza-wireless-v6-1-d8c5042b3efd@oss.qualcomm.com>
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
In-Reply-To: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
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
X-Proofpoint-GUID: IXbLuN1yC7Q2LvhA522C2LGkZlKgL61L
X-Proofpoint-ORIG-GUID: IXbLuN1yC7Q2LvhA522C2LGkZlKgL61L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfXyLUGeMVAw9iF
 uopySqDZ2sqrRej+XtJMcgdvBUtdc9RlGip/qQjQ4cfOzCCUxe5HUFwzcqRfTz+rkucaVjsvtXl
 K2XDo9JMps4cgyH1qCF7bMpbrvpCtMA=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9ae6df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=14bN-6-z4zEjTU3E0XQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX8rLF6E69n7cN
 cJ1Lka08Xm5iNJIAhPr4dKpMN/0Dy0G8t4FUQ2QhoM5eEfksErAZuSgEWoUIA9FBcwC+vJELKGe
 AOzTN7getQVLSbKqdi2kKvx3iW/NU/V30XPqnUGg6lJrtgC/NG+WBV/PqFSg3LUN5qanCFAwToK
 czdSs4ObJOlZ0nDxwXVEAshntPYlrIq+MYn4HP5rBYZpsrv7PtHVTWoNEkPk9AQ2USRhpmZxkce
 nWoXOLjsHdh4YC1CTbmuYTBC9V4+XG39l0ku3Z0zI5UIt7NPieX4ed9/KOgXSEwmDOV7YfI7Fd7
 2IdCDCx8suZWdmQhJKqzdgNU77sxYnG5deTYIO6Avuo59wfCDBv238b1Iot1JaZh96oJp5fan0b
 QlIA6QFVMkQ9FejYkLKCNnw6pxJ9i70UUQOycGZIbJUdR4CE7wGtxZXLbfiFri0mXZSetCWMwTJ
 DIHy+H+2/6goXeQsPeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040143

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
index faa964735adb17a05f2a8fac16f553b37b96020b..c8ea5507bdc2c83f214e3154b5ad6d05f418a1d4 100644
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
@@ -2448,6 +2449,18 @@ static int qca_serdev_probe(struct serdev_device *serdev)
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

