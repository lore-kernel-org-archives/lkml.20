Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA5F35C197
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120944; cv=none; b=aR72Se8QFDBmQuAux3222SCjpumUHjAUId+R+5qFMF1CBBp5GONBI+e6fz5YoFWlUfS1xZbWzOF408fwZ9fkDiFZxBxvHTRemaL4nRFRcLV9X1L9QVCfLMTNa5QgSkzMBtwrKi3mR8C9sQLssUkj5jXst1g352RjAPrECFqxKf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120944; c=relaxed/simple;
	bh=jcENE6rblNsMBQ2TtLoZhpJe3IzOMkCs3FQKrhx0eD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DquCpn5uQWcEVBgSZdFEPdK4WUgmWPxwRTiNPF6jf5lFqTyl3Mdj6bXMxUjiOS583WCZ6S9tBiZ4+orW2h65C5gSXeOY4qKnR9e9jJ7x/upefcUvEgGdmlvur1Z23EJwVaP4uzuFgiJeidCXCJ4bXeRG/zzQ28G/UCO0c1gIREU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lD8ZmV6g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5q5Ez7K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lD8ZmV6g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5q5Ez7K"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FKKCRi3800037
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RGC/QxMhfVN6aPNvFvuuD0sy0cwQERaXx2h5yO0ek1U=; b=lD8ZmV6gDbUHEnJN
	zIKz94ksP35NolSKboP1igNSZR2fjbKsm+IQYr1atd1DQjDq8EGX5UHDcppXxw6Q
	CPZkuUa6QUmUVJ1eQn5MQ0P2FquJ84VrBXyxGNBYUkXgvPgBfK1gNCJB94iS82jY
	QQxP16QROKwYYNtQLA/Y1h+TuDR/qNZqicyc69AJaJB3s6DyyKQ73t2ctDSHhpV/
	UFLkQzNl7K7KNBHk8pu0/WxYxfQoNttcXEKFNvb0XijzqA7F0nuqFUpw+1IcfKLf
	EshyQykoReL/J1XmB1qTV7cz1CCUfOPFPJ6zGAXT6x40yPp5BtU/Rjbc7U8GaRYQ
	ZDmCqQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5se99qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso13835383eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120941; x=1792725741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGC/QxMhfVN6aPNvFvuuD0sy0cwQERaXx2h5yO0ek1U=;
        b=K5q5Ez7KHQ+fleE2a0SfR6pd+DwMljbPN3hbY+qp/rJGBiWmA4yzAt8p5a0bY0qXJa
         fySGJotAYpZ+u+8/5ITJV+SybJtEMJ7XK8oDw00M7W2QCIbfDJ/xfz5e0ikXsNdVsVQA
         8elxa4iWS+htYr5gSR7ROCWyNDoNNAAgQXUo0WR4R21tnyVwbTYPo6Emxx7PqaxiTb/2
         ks9q5Uv53yONmZ66cuwNLwWRTQDFp1YxHybEGgyK3KNOWeqNhtUo2kyPN+FcckqnA7i2
         61cK70aJaOyYVGxqs1srRqlktVWQZtDLdDDW4QLvO2zQs1GAgVowpLQmEuXfXaQk2Jdq
         vlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120941; x=1792725741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGC/QxMhfVN6aPNvFvuuD0sy0cwQERaXx2h5yO0ek1U=;
        b=CKnQOBa8JVpsEzR8q5AJjLjTkMUvphkqu9++Gcf4u9U1++39JsfRMUC5xIMV5nFqdL
         PnWf6DzOxm1QLy+SfPnYs85vVQbk8KOwLB1aK7WixvgkK+r/mP96z8UQZ9uiqdscCqHD
         RKxe7VBOC6syE6SbavirixtwsYm3CuyzcYoBThXq6iQhp1t7/Cgd5hGnpm6tX5h4/iUE
         sw6a2wi9YIOcrbGLjJZiUim6nTWJE+nFO2uswl8dm6dv3ZD3nY9wl1PJFqqEmY7hoVJw
         pcNNOJzSEyBerGki7aUg0OhPOPVerSheLN6mu/xskVL1PGWNG5RJtLIV3jptaFlnlxLc
         k81w==
X-Forwarded-Encrypted: i=1; AKwUvBwh25uFdXRX64B5x+KAPzAjnvo+mW7jEGmt/HNsF+/O7jPiGbZSFL1bRwXoJm2JvMstu+DzTMP+8xIfV1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjV5lZJPH2jeAd43YgaAGs8t74dnc60C3GsXfUMxAPb3MFmO99
	WEUoG2OZmr/LA0h8kopRrHWVZYnecXQcx71GgjhsBX6rYtM8uOxfzfrXClRAlmRIoiF3dqHdPo7
	KBF8elnxmgfLvLLD5MPQfdDwQYOpdoq9qCMW9rSwBdvLsBMLQIhoN8gNnHmmaEQ4IDrE=
X-Gm-Gg: AYBFou3enBP2AotKFgqIFvvv0/d57AQFnj8PCe3lBD8ZnA34LwEBYowi/CK7hLRwAv7
	L4RuOS8Fb0JdEgEyWUtLNCV8rrprLs9rlW6K0u3EUWm+ZspHQMGvya8YJfTzBWI82ctZ8sLRUD2
	AE9f1Tcq4r4T9al/cWM80RsBdKE0xCUZOq/vk6d11L7ZhzkWmUQcw/t3TK1p4xrPxADaSvQTAc6
	TlT82fzwM+ftEhABv8/ZbwnjYbSxJORYjrKpQ71rJF8BcdME3swjQNzTWMxBT0UsGgmES5JZPAm
	03ikzLqLGATdWWYHYT+u4e3fzJx8llbTVuylAhfqxOviLVgD4d6cEhFc4ZlSW47ly430x2pntwI
	sDZKv3TN+1Kyn23adtnkw47MME6zd8r0boILV2cBE8lJAcoFm8tWUdi+PeagcBYXpR4kv0xdPGC
	bs8O7T+DsGA4tc0yMjB8mC+w==
X-Received: by 2002:a05:693c:87c4:10b0:356:4b46:9393 with SMTP id 5a478bee46e88-3564b46940amr25057550eec.24.1792120941161;
        Thu, 15 Oct 2026 20:22:21 -0700 (PDT)
X-Received: by 2002:a05:693c:87c4:10b0:356:4b46:9393 with SMTP id 5a478bee46e88-3564b46940amr25057524eec.24.1792120940616;
        Thu, 15 Oct 2026 20:22:20 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:20 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:44 +0530
Subject: [PATCH ath-next v2 07/17] wifi: ath12k: Add hybrid_bus_type in
 ath12k_hw_params
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-7-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX1tIg0WlxWERS
 BHzDI1gpx9K+u1H/scKvfPilw3ai/Ks5DZ3U68YHrW0M5DHEq6CkSY5rYbUNqDgp822x6i7ZJEX
 2Vv4M8kfDqE54CFsfvYHWmwdbxWB8Xc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX0RG86ePS8KhI
 5s8fnahEaj514tHMmapMn6B5vUOjJ0W11L3GHHXgX1P0vaQEAVyOQ4gJgBeKsg25sGBJe/hi3Ae
 kRS0MlQw1Z0KnRkFCr3aRkMVqLkJ+QgrSIPec9Ytj2v8BJJ6/k3HhtS5WEbh1ciDaJ2VL89Nci1
 vFTQHKO1ut88wMAp8UMErqfAlwHQhGtcj8ZnT8np0oVxAjhV4TP/JXVPqyPS8iknxqhpOybDRoz
 CyFQeZVjd4ioMQFM0LsRKVEKhQOTBftLB/86T5dAXhXbcqTIT0l7RgHrRAdJk1/yumUAus3c7MF
 XzemA+hpp6Pif+PEItTFlZDQJkWHFsiXmFsD0ZdSdppjjeuPWO7iGCgMQeTIe/E6yGP7P4uP6kK
 9Vk1F6UU9zHJAb+60+uIhyTa1ro2/Vwy8yWQ+6puZOeLB1DkF6MxpjE19YVgPBIF14CmlViOJfj
 vor2wAnPC5DtRIIV3cg==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad1986d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZOe4Ua_9D0VdX46zIBUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 1ix0My7qHtCwrvgqRCOCedbusetKKX2x
X-Proofpoint-GUID: 1ix0My7qHtCwrvgqRCOCedbusetKKX2x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor,
but it is registered as a platform (AHB) device. It uses AHB APIs
for probe and boot. Because of this hybrid nature, it is called as
a hybrid bus device.

Introduce a hybrid_bus_type field in ath12k_hw_params to indicate the
hybrid nature of the device.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       | 6 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 833aa6d43ce4..fb807d5a6ae4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -240,6 +240,12 @@ struct ath12k_hw_params {
 
 	bool host_alloc_ml_id;
 	bool advertise_iface_mac_pool;
+	/*
+	 * True for devices with PCIe hardware registered as AHB platform devices.
+	 * Such devices use AHB APIs for probe/boot but PCIe APIs for operation.
+	 * Example: QCN6432 (PCIe device attached to Q6, registered as AHB).
+	 */
+	bool hybrid_bus_type;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 616ff695763c..728bf19980b9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -498,6 +498,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -594,6 +595,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -686,6 +688,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -772,6 +775,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -869,6 +873,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -958,6 +963,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn6432 hw1.0",
@@ -1043,6 +1049,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = true,
 	},
 };
 

-- 
2.34.1

