Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340093;
	b=dBm5AnX3rn+yvJ3bkBS8Eg0fovUFXf48lUHgoM5ukrAR8ybjq7gtBQAYFIWVsqqS9cXw
	 sQCih3Cac4sq+tY7ynsBkEAYtpEeae7yY2Gd9ujaROW2p/Jt7KAC72Y9q93NiFbljDNuy
	 9IFX0CCPDv+ljEyF6cFDJJdsx7o/PL1hqmvkhcdMSptyXp9cBo/r/50rbZr/I6W1se0Zo
	 KHUR3GfIvkklDquT79Ikkou/6+5IzoDbRdiypVfG/tTE9HJfxpMMFXltqTuo81od25b1m
	 fkFX6RhUhj62P+q5T5/xettSwuO21JyvHIziqdWpWiYAS381nI8M5jGaiOgGNaCyXCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340093;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kVbZfBH2UwULzm0do1pgyVFKiUnR86x3CT+qhi2HHvY=;
	b=CRprR7JYid37yqwWpYLrviUkqLC2qnxvcSDbVQy2Af1uC4+h3lr62zN4RvP4N2ZNpIc8
	 bjRMz9c62twqzA0rYLgUUhe3ZK4Dn4poiz+MYPOCZ2iAIXYf9wI4tkvYWDT+94gJkhPSn
	 AV1ycInUOxiAgGYXlZJ6qqVliLCDowzS1mw/V4Iq9iQfA1bGr+fqyxkmxR2yOAJeZ9oLz
	 OlRzBLDVw9U/4hTJ89Uy675uIudYZTOTdm5JRKqmgYJJsUarXw5Lmya4jW2BHEkxGB78/
	 P7xn8Dq+hMuJj5VEnLO1MOXVG7F6BebxJZ+oIJ49NOfoKkXKuwKuQEick4/Xz6Wc3dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AO31bISq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAevWAJ+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8C4606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8C4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AO31bISq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAevWAJ+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F08C1738519
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVbZfBH2UwULzm0do1pgyVFKiUnR86x3CT+qhi2HHvY=; b=AO31bISqWDTdEryq
	zN8b8GyaY/3STo7U1oIXf12PruIHkJakOnW/dA2KST1L+1oK4qADOFInp/dic4vd
	RF/RdJm8dyB3APWjcffZvoxf5DqZkAi3/CjZYK0xB5tokomGRN//wGgaRgI8IzRk
	afNabYgOqAKzfWraEtlYkDxUgEnmC4kZtYV2PKvqSMkIezQI2ev1cutI3vKoeAGu
	VN4L5HuXth8ISEBXYi7PRngcq/dy9R3WwqYyjJ3Tm8cCv6NWQPzOUwYNHhpMbXel
	lYuIgnKkG5fGe2/IotSDA0vIki5bxfUPwIV5OfRC8cbGO3f7ekRfEVO8TMDmOrlW
	fePkWA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhepr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso512142a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340091; x=1793944891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVbZfBH2UwULzm0do1pgyVFKiUnR86x3CT+qhi2HHvY=;
        b=bAevWAJ+Wq77sQIv5LyccpxuOpFYWewUF6/ENzrhn3oTjR0czFi4vfBKR/HUZmTPtU
         Gx48z51CDGBH2sNzrAnJ3RP5r2O/PazSU44mZKJdfkdpKOCuixZY9/8J5mtwx118Tanv
         EFIK5jp2gNW/et2mpYblRD7NqDp3QidRQzsr5oUMxL81m55J4qOEUjag7+vxuyG5FCD1
         NaKt/VKVXj3VVdN8R0WroH64EqL55eJq4WHgdOKVl5VJQbSeeKe1L34oJK5cf157MOkh
         TQdkYpR7AAa7FrGwWAhLFGPk/r7ffdrl/woqwaaMgvifmnyANfrB/IUNWQPe/R2sxLG6
         55JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340091; x=1793944891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVbZfBH2UwULzm0do1pgyVFKiUnR86x3CT+qhi2HHvY=;
        b=La8PQBDaeN8I3VEDzG0IBQK7wzD50q08dG6pz3KXkO38XkjlMUtPS98g3VhsayGcOE
         eIvSlI489CwIZknapUAzVBexzFAlu+I5fGFPt3LNt9mYHVFkZy3ecYOmRPZUvSPjaCtj
         wgwqRzgbWvuCdt10NVU+QzsT8JvxEbSdXjKto/AMxHuQ7moBPM1fMg6GZUG+r8BK10v/
         Q9erOX93rM/so2Qz9Ehd2P8ymOScA481CORkz5j23awcJZpD9pWSaae1oH/lzItJ4wmY
         M4YpWnBAGxh6W0j9i5IzyJRccxOfQCldv8UQKiyatzXLnPExkULUqdVarkj+44jMnCMp
         0rEg==
X-Forwarded-Encrypted: i=1; AKwUvBy76kW5LOwbN5nKWQZSHW9cNAoOMv5MxGtRa8cJuS65A8yI8XXyQGJFGBNJtOnFShrxLlG0W5MHTIjqeu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs4AEcEI++nKyn9fiWRoVHUEfScQixLTyb51/Nv63iIjbyjA2k
	afYV+X95ImoCiAq7s/25qR2n083j8ugeGOgMIfFvomB+icUdWJcIT1HDRF7AmP5p3wInHYVCxnn
	eIbdGJriLDE0APUS8D0SuhDb5IxRLpkXjPCv12Zo8j5AK3bKw6/HmOKvyHs/ae7j5GDY=
X-Gm-Gg: AYBFou1yLuZjnzQRLZ//rBg58qpodXxIbNNC2tib9Vq4NsZ0Q+yINwr3pKkFpRZwre/
	SICWytu3F8XcwYH6CR1KgyQCWTcQ4jPSnQ0Fr7wRELy47/Ywrol0NkhjeI0kmXbx50oZI3t1BEJ
	wBa3OXYh8n3WY7sjHSagYz3Y8ZK2Qlzy/D1RzqmJfV5Mulo/t7DmiScV5uecOICDIjZC9wp1S5m
	+xYxG8mY9wCy6uR+H0o4zTFfqz7ftQqLjO7C4EradisCwZ9FGfsopnrtls7BOGsVmQopySq8MqO
	lD09pUPbTHHdw4XfxEhn4qLfSDneIyPQEK8tXwix2mnMQ49GCVf67+5G6Zc0XHNRSSQAt8CP3ru
	mtekh6wJOaX9AfYZLpRgpquJbq7zgLbMRxZxGSMraXGN6om/bPPO63e0pnjO2WuCOkL14r4GqIK
	JxSpoxp1RiV0aQde7vI9GFd/mmKLTS0VH+s4Uo
X-Received: by 2002:a17:90b:268a:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3ae897ddd43mr983243a91.60.1793340090572;
        Thu, 29 Oct 2026 23:01:30 -0700 (PDT)
X-Received: by 2002:a17:90b:268a:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3ae897ddd43mr983210a91.60.1793340089953;
        Thu, 29 Oct 2026 23:01:29 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:29 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:25 +0800
Subject: [PATCH v20 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-1-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340075; l=3918;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xakx5gZ5wZelc/TfakR5ZpnBjhyve9fD5siK/ePXlDY=;
 b=kcwepGFTpzUaWnwqy/D0qsQ5aK32oiSB3+OPWiP1AbcI40opizt6GW0S2L5PclWTDMT8ac/ij
 0RZyDMzd7AVBdtB7SV+kHdpUxYKQlX9N5aUbcyqStMLUOTTDlnB475p
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX0fmunKSL8zLS
 pTyG/oACZyMeSkAGz9JHl5dYhnU8FPmyqLoBBQWAkcmD6TkdR4jCbuwBQihh1f4M3nG5M2Gi1eB
 tYWR+L/gcg8iTLUPd/bT7hTnXKYgy2vbhQSBXgoE7ZAp5gHM3IfTEcxcakWtEM3l5kVhWwIR1QM
 1vETW1iFX+Ia/OSKISVR7eVKQksHt5H1ON4R6FYNGPsoFJgMu6m3Rp25QWh7OMWwKrOua1KmKXi
 z9ABBvHFBzMNuBTeBeHUAv61FiJIkiQkeV7w4+d2iJVZIMNGMAWxHrCzwABZp2ie1ru8oiQEJ4V
 s5q4kt7k7v3kV38O4qHkRJGK8GA3ZxpDuidt8smvcl94kTBXWrAESC3KlYFyfd7E2+gZBp7+uMF
 TakKrX9gn+kI6fV3ncf+nf2rZEsNIX9MKy/Uc9+EdwctP9jhJiUzx9nU3OxDbHLcTff/1nnqUYy
 gZTRgK2CHYQOogs3GsA==
X-Proofpoint-GUID: XWWCzH4-E5LhNX00yxqUKPzoh-U0oRQ-
X-Proofpoint-ORIG-GUID: XWWCzH4-E5LhNX00yxqUKPzoh-U0oRQ-
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae432bb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX0lObyOmAyBuH
 8m7uf2EXYADnYgYxVuK4ZENlm4lIHdpx0eLK1bsT2kSZ213aakAABiAIVtSUIEDXepn1Q2sijtB
 jUTKxzZUfH4mV4n519eyL7rH3VkwX/U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 21 ++----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..32e8b3e51519 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (!pdata->in_conns[i])
+			continue;
+
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..739105acb0a1 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,8 +128,8 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
-	if (port_num < 0)
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0 || port_num >= ETR_MAX_NUM)
 		return -EINVAL;
 
 	dev_dbg(&csdev->dev, "traceid is %d\n", traceid);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..854c0a3cb080 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1

