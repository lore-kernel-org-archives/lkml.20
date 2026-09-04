Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA4A4FDE4B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536576; cv=none; b=txCMckhcnK3Kw4evRDNB4p1e7Gs0RT/7tBofeqi64ONgZm9HZmc4GoeA+iKChRwXf6SzVELOWuyWlAh/dQscMDzGP8/Odr91ZuXiUtvF9XlW7wWZSJK/QwW9WnE1gqgtHQLoQn9rF80/NJfNTISjkcO09Xj0x/JsIWVJA1LZ1Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536576; c=relaxed/simple;
	bh=ql+lzgCyBPEjEvO5d+fZjVYHAWX/V60lJU8VXvadKEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdsrqH1Gnf7pdsXcwFVdD2Xk0xhuUuN3gqs+giKaSTT+zSKomykVrm0QClWOZUvVmLU8JTKEor8iOHp4CUBIHWDMju9yepEIkauli+XZA9XYPOT5M2PjpCQ8F8DwnPel89woo5pq5UTw5ejQctFYeUjC/RRlZTlZ65amNiAiUsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9rAaPex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuqIieRd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9rAaPex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WuqIieRd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiKIS3329469
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 15:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MINzBqJ4IAJHoJgZZ9M8ZzzajtUoGcKXgzz7x3DJbF4=; b=G9rAaPexNp2ooVdn
	uu2Vq/+Oz4C+BZX510p9D7XyPn4KqVMjoiW1jUVj/mbJoaUMqQdNg/QRJCYJ4O/C
	or6zcqwEhN9avQ8Rw0sZCTpg6y25VtPXxGo/T+41agBrJARpscxSVaGXzpHehtYe
	k+mjSsrOMzE3fO2myy4s87VM9bn+fNFfvmTu3bUCo1hEqLCjO6zonauA2K7ZFV0r
	hX8uBA1oxSnqb/AVTVg7dfL+7JdyFe9j24v9FhophxnS9SCQrDRUmJQsKjGEXFo1
	bxua11PLWeR8U6DwjTp84mqdvpVzAfVG61XhFQx5ydLz5wP795qx0QPeJqCzO599
	wibaoA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00y88su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:42:38 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e9e2deaa4so934782241.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788536557; x=1789141357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MINzBqJ4IAJHoJgZZ9M8ZzzajtUoGcKXgzz7x3DJbF4=;
        b=WuqIieRdKkssahH/ozo2uv2t9E7LSU3P7JWyxsoQyQtCErR+yPzvsFJs7nO7Tzslro
         m+k2bBIPnSgvO+LVDaHry17GFRw+Dp+jt42IHTVtvVhytTjA0tcMRDE6lql/UZSQtSo5
         mZwSZAYMYmxm7kCfdUc+rSh1pXSXxsgtOwrhuea49LGapC4yHmrwbsAxqvpSx/d1ZkSU
         UPnWf7v8Vsy9XDgetV/n/+UmqncQWIKJ8YLBfqEy2sUyqqNCNQ3enuPgqfxPOCTss1NB
         a0kcdoRh7ibftYrQcDyd3vI95tyZYfPETXfBprGDxJKYYS/D4zuUwEuUnqzhP+3il1co
         MFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536557; x=1789141357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MINzBqJ4IAJHoJgZZ9M8ZzzajtUoGcKXgzz7x3DJbF4=;
        b=KjjuE29xgbXFl2urvYtECLTf6JZbwkCfKO+OUvvAOBK3Ahh5Tm7rZBPuZQqk7eD5up
         4FMy/9rPSjpIlsWNS5HtlVU1fEj8ttNTTTuyMyPRz1jSZM42z4uxjJSalRhZTiSh6JWK
         WgtRkfYp7/1U+mg62aUfpdKNOH9SGKXla6z218so+DGJKrsi/lyfCJtOEcLL8KH2Z0au
         sqVqR09t5GALpQJXbdTivcDm9NdZepQxIglgNFtGOMlJzGw2o9MQat7aSWJfnDQgpAjL
         +OM1m+hIFu2mkzIKg9gR81bLFYdWvTjRS17SHrwOn3l16Wnw0XxDBeP3JOAQbyxghIFi
         NwZg==
X-Forwarded-Encrypted: i=1; AKwUvByurXuYE14CMRvN9cmUyCIjXMM5eClQ5yJhqCgzXZFs+054ADIMVK38VyxdsGudzhgky4DxEsgXWY7uLK4=@vger.kernel.org
X-Gm-Message-State: AFuF++mz0155QBRoKkmtQXBW1kJO31U9TPEnnkBAhxVPaARxUmMV+hqW
	Bf4d8qrMxE5i0rWfEf3em3pSmemHMx7zz4COZLehQNM/JhigXUyXarQcqxm9+Ku1gXW8CiI81V9
	DxARqu1o1n5s9Tk8Ho30G9sjcSnRjR48pgelPhwcbEpri1a4dY+8+VojwKTOAoFbPGHo=
X-Gm-Gg: AYBFou3Bl9Y181Ul+jt0zsCYkilVlKDOCIB9DIanaXU0CPAg4zd/Ml71Ba3dlkCeWMp
	qgzbdbkhUhoL751AGvnBORAyz1nSokcGdOiubH1eKIQqSjBGgNbqboRaE30y9oNDP5Ddtmh5Zwa
	qQdD3yQUz144ClH7HN1KJ6qFmqwroDMpmgNYsXhujN1c87HPC4M25N2qjwt/s9TMuazK+lKmD+k
	8ZLkD6+r9IrPrHX8mnCFQLF9KW8GFyktjRXr0QGJfwQ18EO63M3mWp/3Ex6Emr6FfoYiZNuM3UK
	s5WYSNQ2nzRf+QW2WTcyLa+AtFz1loA6Uk7ICpDTxentvw+hZVgFzhnuyYjaJQdQBYHI6Ir8sh4
	jwV7Zlbdpbao+VqmrcM4ITy6hROAkYmU4XZvw0k48eISaxeKVJigdkCtqQHRuawJIiaYCw95WgH
	3vj04zFdM4giMgLxwQwLZpx+v91/P7HkFoOALZ9PU/FKp7RLcOXLg=
X-Received: by 2002:a05:6102:3e01:b0:785:c3dc:2f5d with SMTP id ada2fe7eead31-78a4aa13b57mr2612959137.9.1788536557179;
        Fri, 04 Sep 2026 08:42:37 -0700 (PDT)
X-Received: by 2002:a05:6102:3e01:b0:785:c3dc:2f5d with SMTP id ada2fe7eead31-78a4aa13b57mr2612933137.9.1788536556685;
        Fri, 04 Sep 2026 08:42:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm160668505e9.3.2026.09.04.08.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:42:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 17:42:23 +0200
Subject: [PATCH v6 08/11] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-monza-wireless-v6-8-d8c5042b3efd@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: gg-8gXKOWU-TyX3o0obCxbjmn9kN1lMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX3nzwI1Dr/+iR
 wIhSJU1xRTvpTjJBgj5eOzb1IT6gg41BajmAtTkyNe9xkGEgNW3EEUTGxwCyJkdwSGw/UHYCfgS
 xBKYWYiXrdXBlxDbxU8aiNyz4Cglv7srxRsYFati6qhO4gCKzVFtNWgoQjzTZ7FCZhOQbYFH2Gv
 NHNMX87vriNKhaZvjwSd0W6x9q9azaOpb6HiACdAlacYqovvXehWl3bqEtAQmcHNQmb6ki0WOLr
 50Hof8rJKd3sOBazW+fFSNEaA5QSR8Nzgsrc7MOCuQdTtpXJZf7SSonebTqZZc13JM0uWsVSK48
 v7e1Erm4DPTcRL3cAHEw0iU7BySs46OG10VQGQCP1Ie9+jyLqWpj2OXTpWxZDuFA7nyzf8M6Vj9
 71tPvEIfBjXyEcSDEaTbsHZ3yVVzK2SThfzzZfZXACPbUIIvgTasVSqtDlTsd6fy1PA87rxYV+3
 vH6Oz3XOXHGY/fDLNgw==
X-Authority-Analysis: v=2.4 cv=TsPWQjXh c=1 sm=1 tr=0 ts=6a9ae6ee cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=reVw4oyKNVL6WbIJD7YA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX/GyLiUleIMbL
 iFFG3vpB645BrCxhpuK/HXQSzXWTs8qDLmd71ka9W6ZFU21iJKdxKQLOFsXheJNAC5OnSJz6C9+
 h9NfPMlcOsRydGNFdOTY7dpwkIju7aM=
X-Proofpoint-GUID: gg-8gXKOWU-TyX3o0obCxbjmn9kN1lMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040143

For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
controlled by the W_DISABLE2# signal managed by the pcie-m2 power sequencer
rather than a dedicated BT enable GPIO.

When the serdev controller has an OF graph (indicating it is connected to
an M.2 connector), acquire the 'uart' pwrseq target from the connector's
power sequencer and use it to control BT power instead of the bt-enable
GPIO. This is factored out into qca_serdev_get_m2_pwrseq().

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 47 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 30586120c4a73a50a29af235b511c3ae97960e27..db0a968dfb00fa6f1abb86a3f6d1be89dfe80c6a 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1875,6 +1875,9 @@ static int qca_power_on(struct hci_dev *hdev)
 			/* Controller needs time to bootup. */
 			msleep(150);
 		}
+
+		if (qcadev->bt_power.pwrseq)
+			pwrseq_power_on(qcadev->bt_power.pwrseq);
 	}
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
@@ -2390,6 +2393,34 @@ static int qca_init_regulators(struct qca_power *qca,
 	return 0;
 }
 
+static void qca_serdev_put_pwrseq(void *data)
+{
+	pwrseq_put(data);
+}
+
+static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
+{
+	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
+	struct pwrseq_desc *pwrseq;
+
+	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
+		return 0;
+
+	/* The pwrseq is looked up on the serdev controller (which holds the
+	 * OF graph to the M.2 connector), but its lifetime must follow this
+	 * serdev consumer device, not the controller. So acquire it with the
+	 * non-devres pwrseq_get() and release it via a devres action bound to
+	 * &serdev->dev instead of using devm_pwrseq_get(&serdev->ctrl->dev).
+	 */
+	pwrseq = pwrseq_get(&serdev->ctrl->dev, "uart");
+	if (IS_ERR(pwrseq))
+		return PTR_ERR(pwrseq);
+
+	qcadev->bt_power.pwrseq = pwrseq;
+
+	return devm_add_action_or_reset(&serdev->dev, qca_serdev_put_pwrseq, pwrseq);
+}
+
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
@@ -2420,6 +2451,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
+	err = qca_serdev_get_m2_pwrseq(qcadev);
+	if (err)
+		return err;
+
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2429,17 +2464,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		/*
-		 * OF graph link is only present for BT devices attached through
-		 * the M.2 Key E connector.
-		 */
-		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
-			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
-								  "uart");
-			if (IS_ERR(qcadev->bt_power.pwrseq))
-				return PTR_ERR(qcadev->bt_power.pwrseq);
+		/* M.2 connector modules are powered by the pwrseq acquired above. */
+		if (qcadev->bt_power.pwrseq)
 			break;
-		}
 
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*

-- 
2.34.1

