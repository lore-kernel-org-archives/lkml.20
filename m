Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280936;
	b=v9TtWBu/BvGHZ4XPdQy7l7CSGPMa/PY8QY/jdfhINJLvrUwGbpiV46bdGGZrjl0AEbet
	 9Hyo66SgPZzwyj6PkMXgM6TQRcyZDYuk1l/+d0eRGe+/j7slbNh1DDxDGKf3aaC+JIHlU
	 6T/BWPZLEoBWadUGZ7lJyQnrt/FPG5z/JwOIt9qaLPopwBJLrvYrhiwuC0HpUF51IVcrk
	 2bEtjAw28NB1cMSF5sPYgpmPlM8BsifW6QNnjtYDlMzb90V7gQSShLG4yvkXX1+5SsRZD
	 BUGaH5E7mwBbYpi7NKC8Kwt97Kfsbx96fyeFiroLj+TGOfA26Hd9orNCFsiYsHxTbyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
	b=vi7JOZnm5ithY8s0GYPhw4CC8yXlwteB/cq/g+Z/YfueWSBlMCLwRENUqBPVRBwS87vY
	 E9abLPRx07+40ECBOLpZfkSoAGput/lyWo+oRM/txv/bLbBVds2dS8PZYdxjWNw7hWm0V
	 iTKQcWqKaG/PB3kEyjAaD815tmQg2cAEJU1GkAIffTy3cO4kZ0jESgzUYIszchLCcEZnH
	 kyTdkoFFSkReZRpBy1BCUerCK23Eku6TMk0IWGc7HPWyRuEFS+lqNGxPjsTsMkjlmUHrb
	 PJq8/iR/iOXeIXkMv/1htilbS+IhHPvbjgYEnoVbgaotIuCDhDq7Jdr+BV9K066Le8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cbaz58si;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTNwGDwt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6388B60A2605
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6388B60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cbaz58si;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTNwGDwt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA2q6rM508892
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=Cbaz58sibwWzB0b1
	DNPpR+nVrWn/Ft6CSpW8EdtDjOw51AeZKZdb3xxiO/rKgWhmSQWg/+6B6JLvAKTE
	44K4Qr3b7gO32xf+a6jNs3RVPt0MRA24MbnEtLlhxDrOt4R8ej7pSW2AD9q9ZfjI
	AADbCK7GgTl43gWxRJRwqqMbdjVjBCndjjzwyRPP6pmQMkjF6Ux4YFdlwj1JFFN4
	Tyq/XJKn1y+BjkpITIhdhZQz48OPC/o1gK0u+ggse6RkV6+MbiQheyAWgc1FTzUC
	RrGSJRFMTkd4DPdXrB/aZ39AXsnZDrzTNEXR8MJsLMMsDbq21geBJtVOYyiUCaB8
	RMikJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv483jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so1390090a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280935; x=1794885735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=iTNwGDwt8/Fa79UR5PY8rVcK8vUMDw7+xytCcgne8LC2yMICPB3ig9ahE/82MKa1+b
         geWODTA0+Hj7urNzhwfhUklh1Rp3vgHvvAsOLI6Lm2GYYek7tWm/GEsOIZKOO1fm4vZk
         GIWDlfLNV64LymzI2Jn+ONqn8X5lvq7IT1tYJFPWqnhwEev8ExdASPo6UbIkD9yLg1Sw
         gndp8ryyEQpRwexSL6LcSYVui+dB2vG8BSdI3rvEY4n2PnywghZwAq/1tCQGoYyIqziL
         jOI3sKYRSuy+m6JtX8luLHpAihbQrXWCaxNinoHx9YgAovluuMYo/kNfwCXo8KsAYUad
         zIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280935; x=1794885735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=gvXMeDZurYdB086RcBDtD5jVWX+mYp2ImnpQpL4G0DV/vRZrDu0dnvDk4CroHmlFn8
         Ss0MDGVUvX7+kEM3GWLFSyh6eSTGWWHCDxzPs7fRNzGlYALhM8dMxjlfZyIujqJHsN3B
         k5tZJIJecuqhU3BLkAqgMt3s/zQ9sYO4hwb2mMGq6ELqH3b8tzeg6ky/tbEPmCs3+5+b
         8gk1Ux9tzqTs2b+exKdHo9O7q9q+hfktB77UMn85TgUKoQpxQYJjml/O3j164hkfwQ+A
         ix8M2/ennQ2zcvnl46tbkTCFfbikJr6J6UIl4VyFudqvAaC6Eg8tpKLnHarEDRGWWxzQ
         L9uQ==
X-Forwarded-Encrypted: i=1; AL+hErEMuarA1+Zss5C0biIAihF903fbpjBvmisrlIDvZ4wba2VXiYhWlbeEGRoliu8rmCmTsVr1MERh+Gi9Kns=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YtdTuQXSHdFDZJyCYYOMgiZjlHF+0opN3VBkD0gaFKn95okRc
	78JcB6nKtzb0/SOFhUbdCB381peldCykf7L/VgPKJIcvzY+kvFlnTN0NlXXx4UlUcBvUP4FfuZf
	EM12tgHXxdRpzvmCKDmdrKwhTAhkvP/5hW9+cOslV2Q0CBB80H0sWgv60eQVLvWiBBC8=
X-Gm-Gg: AYBFou2MioCtCWoSY0XWjpUhrklkseE8PF9OhlFgQ9p4l0+3thOQCpajwfxmYJyJmQY
	yiaeTd7tkv2LiR6nDJLhXZm234RIkgUdHOUqodMOIACqoR2RMaRWtDXxqK7bxykrI0Ni0bxabNi
	hr3t6dP5XRkQ0REAJs+Njv5YFoPCTza+euJVI6Qs8k23rhU75VUNjjZFs3TEQ8wz5oviLDyO0vQ
	Xj6lJAry+91j4cRdu6T1158kNnrk0Z48dABIIOZYVU7d3wNzt2RLDWjmGp2wuHlBlewhBQKYxcr
	5RzKa0Xmf6N6p7mksSXsh3OeoE4lyfKi5JiUBJbQ7jDqe2LwaCwzFB09x4cuk8ucEKjrmlb3Ule
	4Z0XFUyjK0rnElnw7m5e6sO098+uEsSYFkabXFY0k1scxMnzEA2BrWwFLBKKz4ae+Hx1B0IjfR+
	l3X1+ILrDdxU1v+nLYQ2AioSjzgXemmWlMTIj5
X-Received: by 2002:a17:90b:224f:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b166d0512cmr1671690a91.41.1794280934749;
        Mon, 09 Nov 2026 19:22:14 -0800 (PST)
X-Received: by 2002:a17:90b:224f:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b166d0512cmr1671676a91.41.1794280934315;
        Mon, 09 Nov 2026 19:22:14 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:13 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:23 +0800
Subject: [PATCH v22 1/8] coresight: core: refactor ctcu_get_active_port and
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-1-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
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
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280921; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=f8pPXp/NPBBf5arnW7j1D7MGNcEC1eM9jlHACtmmEjygK2LstAzouhm035tQzUlqqjXVnDHmY
 b3+9dIR3KzYC8O8lXd271su0g5mYtW91OCUj4q9M46oxk+UYGuVE43H
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX0dOl4ZG93ZUd
 dYdvRpm3uwafzY2EexxMAxM6aidRt7b3k7basIGf/ih+T9/8A2/GWIDFmkyWM8cjdfarrFPM/o9
 H4UVCAHPt5g7rNc9uCAzKnoHwh3JDAU=
X-Proofpoint-ORIG-GUID: -2HAbVyklpE2V_0MVZ4rdydNUi0HyBC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfXwuk66R8AO7Ia
 flNTzNkBJsNNg1MLv4ZfY1AeLLhEayq1/zfOVyOSaWDe+Xy94mQtMhudUSTNIjbK4KXdrwWFgsF
 OcyDCSTMyDfutwYpEO2EUmQ2dt/cFjdDqHXb4YpiYDTLCMutqcbDPKzAbNrOFPf7Dbmp6EWxsHn
 LFulRT7WYdwIIT06Y19EyN/S64FD9TVgsqseX84SqznwVNY4V0+ILiq3cGiifCSKnyIhExQMWuB
 06+z77YhEwZZVwcwQulDcK6VQjN8AJGC127u4vMuh9MRtKfnbiPbxZF2YK0oX41vrnEb3QrAoKK
 Xw+/ov1uKJT5fVKPA9tclnybSOF2vj6cqeNKpKgf6gyKEix5oQisepDRJNf1Mo3auDg1+njssh7
 rvKGDuv7LtQLHN+onu4Zs+xdGhV9lhbcj6PwrqYAwfWiVUbnriwToS48tkdoIY/GaKyOfNiaiQL
 YvO7dwhg145kJzP3C/Q==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af28de7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: -2HAbVyklpE2V_0MVZ4rdydNUi0HyBC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@arm.com>
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

