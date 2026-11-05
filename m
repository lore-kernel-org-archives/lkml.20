Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877359;
	b=LOqkXQ2r55Z5kJp4o4/1W1bb+cQVxyBVSGMU9A90s0QWmWQ3VitLmMihuXHsGHyTcyBO
	 5q0ymUUxqOw2snfiaUBjeCiHM8l9RR4l0YFyAX8ss/6QT4nsYyuvvltthy3r1/UUw6pxc
	 Fq9GRLic8Rva3+KhfzfrupwlF06FwslQRhUXBcuR304rxfRyDnTfl22fHyY9Zdaaa5U+A
	 PpcdzYxJEL3J7ld1fv8gO/gP5edR36mHAPShly8OJdsvFzqVsGuLQVS/XsgzljHo2eiRI
	 F5U+dUBdVxaULtaGLxuK1wOwIxIGxgKdA8rKpI0iI+m7pUnnGOmrDPZaFxoWEdyUxmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=17ktzONhFtW0QOK5lDDuX3TZo9Dp/Ha10aNsxMpX0y0=;
	b=0W7iHjxiVT2YJcEuQouWdaX/ERVAFUzb7hx/wxMGQ52m/E4x/QiD+UtHOx5MTEodHHYV
	 vPejeGoU6RicCTRYnB1WPGBIMHt3opHbQd3BYb8GJ05HB1jzddMTdkiBzO9BplvaEC5yX
	 Fb3wxQOqYU+mxSQLkQvKMdex8Os8VUcMWxk2w6K/IwnvBQ9yGjGeiVu4ZUNdI6ssrNwZA
	 ZypA9d7f61Yj738pgdb/zV1FESlFvd5plmcnF0f05jhEpnWfq40k0K3nuxZq01FGQrs8k
	 TQBOgjEfLQMUs6KiTjdUHDPywXg3BNaEsCPc7lVLQIIhdtOH+DmzKQMKLxX8NKTrcSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SDcfoJS/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HwEz4i4G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED481606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED481606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDcfoJS/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HwEz4i4G
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tGN53684548
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 11:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17ktzONhFtW0QOK5lDDuX3TZo9Dp/Ha10aNsxMpX0y0=; b=SDcfoJS/iw0NRHxP
	/Pvxf+hw+rB/tqxEf8QUvDdw3ZGnNzdnGp9jb0TfcJP1RUtaw/fUqlR/Nxd8PE4M
	QSHsD/E2sH66I4o3QxwxLFQECrK9V7mwSwH+xpyDjnWY5a+M5Ew4MsKq7L4yI4rM
	y9QtMfdxzgTwU6tj9HgsmpyQ2zgjiTNcv0FAbqP5ctT9+z3Dvt+7ODtXBHQvO/z7
	5cOkzzUPGM2XCJD7pM5f+/StqZ7XTFPVrp6d9YwXGpwo4bUE8TF7N4iDeP6Dur29
	t9ZlCtOPK9U8s6JUZqg+FDLdpFR1MatG0KVz9j8oPgXTPoE9fvRP88aLBvFm3l/s
	TmQsSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43hqq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:15:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so6123748eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877358; x=1794482158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17ktzONhFtW0QOK5lDDuX3TZo9Dp/Ha10aNsxMpX0y0=;
        b=HwEz4i4G43FMRfj7MnWbpxA/lWKIWO4vj67q9caJV9i+RRlQs4BFK3ETJItEIfeBB2
         k9mbyE6PQyqnt4e0wMK7zPy4SzLdlGOm20/HvWWa04vOPFA7zolSG3diqqparvpCd4z3
         F0GzTWVOM9zJu23DD+Mmou7z/4BkbBNaMmAHfOlwnbD7TclmlVFQejrVlxL/JTy6mWiA
         nd2Uy1Bpu/mmWCEsr53z4tunwJ1uE7zMn2rbDlxXIuGLcJ1JHbH+rAvMp8OiG/VS0+0f
         +QfVXfU3BOMwv3QkcJxPK7Togm/VSHK8YxKyNiN9czkInVTbkkLunyRZLN6lNsbpA7/I
         V+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877358; x=1794482158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17ktzONhFtW0QOK5lDDuX3TZo9Dp/Ha10aNsxMpX0y0=;
        b=Swrzd0OEFU46YSfnz+kXVsnFdebiPFGIQ7iXHd9QerK4RwPFt9gOmWhpGqKzGeWexi
         gsxrZCFwibhoUzuuNELN4A+pOMBg+iaqJqwLrcxhpWkM3OBdsKAlYcXm6M5RiCqiz8eU
         ndRD9g0/HvIXFOSjwExsKal+5Z/v6vlHMxEj1aDEuaRQdekPtWbDKzpqBJd4H2HDr+DT
         wKC1Tr0vSFd/3O05RIyGeHIw01TA1fXDCDdapXV5oak+omwxlBrGWVVXXK2KJOeMjD1t
         djl0YuIE5JfO+kevWV2GADDQNz4FGAipZks1QLJTeUOmFthXzyXZeCrbVnyPCUigyKgk
         Jksw==
X-Forwarded-Encrypted: i=1; AKwUvByR3inKJAxjDvSbTCBXCzczzNOshLDxbH22BrtZb6dhck9TIDssF5bnEZgUKO+lisVKyUxNHCtLaSbG7ks=@vger.kernel.org
X-Gm-Message-State: APuU4Z81AL7wCQhPEEgRG5iVz8K242zqVjKgflPQN53jrdva1amajG1b
	SlLQu6VF1zI0qqXmNXhvZAqhtINlyLv+uWsqfGOs7FICRMdngu3pWZz2a/faJgE06WPOXIHmwBc
	wbVHQKrmSbxDacDTKVKVzHP44cm3MqeRssj4SMgVT10LREXQhH9jWMGTg0eu0gRNLzBc=
X-Gm-Gg: AYBFou13A6Re/MHzGwFrc+szp0c1p8TYt03W/WMsBm5zHe1jgP2W0gr6n/vQAZzy+Th
	7AI3Fu5G35DhPrG6idhisqmEOOgk2MaOQUO+f6bcODv66GPNyyr2vmKlvdvJh0HVIW5Dn6XHluk
	gn5GivqF1WuxI+k45QkqXdIv29iM5MAvmE454g+c8GFet3hE/HiFiNB+nnaGn5F6x1QBM3tyeIe
	z1nh5UHlecOxD495HXYOOgy8CfJ39q842r3TtwEGupOJhWG91p+ZC0fkUC7XAGrUFh25tKswakE
	TJF9ebt/qgLSGO+O3EeQDAP1lv7/NqrhBEgA8sUUtkdgJww/Mg66rv8xfy1gtyvrEgKmjemb/aR
	SVO6ojYxuWR/hWzHBnK3v23OVOs4arTawCdT69yyg6LUyIib+f25sAs7DPHzWG0GlkjMamkZB0w
	==
X-Received: by 2002:a05:693c:8806:10b0:36c:b8b1:a44f with SMTP id 5a478bee46e88-36cb8b1a618mr7704521eec.31.1793877357467;
        Thu, 05 Nov 2026 03:15:57 -0800 (PST)
X-Received: by 2002:a05:693c:8806:10b0:36c:b8b1:a44f with SMTP id 5a478bee46e88-36cb8b1a618mr7704487eec.31.1793877356675;
        Thu, 05 Nov 2026 03:15:56 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd7ec8881sm14002125eec.18.2026.11.05.03.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:15:54 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:44:53 +0530
Subject: [PATCH v6 5/7] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
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
Message-Id: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-5-c7d68ce05c51@oss.qualcomm.com>
References: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877323; l=9940;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=QayOUxWy+YDq22j/7v4CYME0ywMF+t9k2WML8V1Ckgo=;
 b=Ws07m+SELe+/+fEUNQmacrjX3H7VqBs7uRysMTrAbuuwyEiEl1plRNZOpEperGZ5cQdBCStJ5
 +qSRBLeLHNVDFXxDACBWNOTqzEtpAnNpAsAGFQc7aIM7wz3+yZNFwYr
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: O2QV3lV2DdZRV0F-ny8U-LMxi_qZZZQa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX4bwMSLHUSTJz
 vRigxaGSm8yAoP9KWoz9RPvtDP4e3QKzHwGFiQTWiM5vELK+/1tN/tbVvAYWvOBCUi8gHZYMzOh
 Vq2R76OK73Sm1cbVET98okOsqnaIQdth8i27/eEIlHrlcjFzVrB1UHxfpA+DyJIdeyjAoNcbWAD
 3DU3Vo5zrRuUnJ1f36r9RzP26vHqHHdd/IK4u5gcfOV4F8VLBz6v0NvtE0fwZ1DX/kEccB8wGYg
 gKQ1vMOOYT5C6gMN5y0+OLyaaSJewCncLVAayeuPwPO9aLSp/T1cz5faXM6liC7Flv99+qLHgMa
 LGZdfIBeCRDM6W6zLVd3uZuKBqqf+xfiHwQKG7QlByZy3u9oArrstRtSIjEMvsz4ZYR+FDOKDFA
 Z/kRopN105H9YubaVTQDEsZExfe29Wd9vo9I5nwDcizerWbz3uWa70vkcYwiaOjQD13IC50142w
 eJvvkq9zWTTVoCZDy2g==
X-Proofpoint-GUID: O2QV3lV2DdZRV0F-ny8U-LMxi_qZZZQa
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec656e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nsqFTM80TsG4aMfu2G4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfXy4dJUWFVFLf0
 zVzdr2Vz5IVHdkYDIP2ubBFJ7cpT3Tec4zQ33SATcOpxoQO+fxCEsC4vMScSwQdPPqaVqnm/Hr+
 f4pXdawvdOGMG7FGP+ti2YZpbMZlJMA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050044

QTEE exposes certain secure services implemented either within the QTEE
kernel or via pre-loaded Trusted Applications (TAs). Such always-available
services can be readily accessed by TEE client drivers via QTEE's
object-IPC protocol if the service is registered as a device on the TEE
bus.

One such service is the EFI-variables service, implemented by the
uefisecapp TA which enables kernel clients to access EFI variables at
runtime.

Maintain a static list of such always-available secure services and add
support for the QCOMTEE driver to register these services as devices on
the TEE bus during probe.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 160 ++++++++++++++++++++++++++++++++++-
 drivers/tee/qcomtee/core.c           |  10 ++-
 drivers/tee/qcomtee/qcomtee.h        |  10 +++
 drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
 drivers/tee/qcomtee/qcomtee_object.h |   3 +-
 5 files changed, 177 insertions(+), 7 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index c97afaa1b4aa..96badaf98795 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -676,9 +676,13 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 
 	/* Get ''FeatureVersions Service'' object. */
 	service = qcomtee_object_get_service(oic, client_env,
-					     QCOMTEE_FEATURE_VER_UID);
-	if (service == NULL_QCOMTEE_OBJECT)
+					     QCOMTEE_FEATURE_VER_UID,
+					     &result);
+	if (service == NULL_QCOMTEE_OBJECT) {
+		if (result)
+			pr_err("FeatureVersions Service unavailable (%d)\n", result);
 		goto out_failed;
+	}
 
 	/* IB: Feature to query. */
 	u[0].b.addr = &id;
@@ -698,6 +702,155 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 	qcomtee_object_put(client_env);
 }
 
+/**
+ * is_qcomtee_service_available() - Check if the QTEE service identified by the UID
+ * is available.
+ * @oic: context to use for the current invocation.
+ * @client_env: Client environment object.
+ * @service_name: Name of the QTEE service.
+ * @uid: 32-bit UID of the service.
+ *
+ * Returns true if the service exists and is available.
+ * Returns false if a service is not exposed by QTEE.
+ */
+static bool is_qcomtee_service_available(struct qcomtee_object_invoke_ctx *oic,
+					 struct qcomtee_object *client_env,
+					 const char *service_name, u32 uid)
+{
+	struct qcomtee_object *service;
+	int error;
+	bool ret = false;
+
+	/* Get service object corresponding to the uid. */
+	service = qcomtee_object_get_service(oic, client_env, uid, &error);
+	if (service != NULL_QCOMTEE_OBJECT) {
+		qcomtee_object_put(service);
+		ret = true;
+	}
+
+	/* When we fail to get the service, QTEE provides the reason. */
+	if (error)
+		pr_debug("%s is unavailable (%d)\n", service_name, error);
+
+	return ret;
+}
+
+/*
+ * QTEE Service UUID name space identifier
+ *
+ * A random UUID that is allocated as a name space identifier for forming UUID's
+ * representing secure services exposed by QTEE.
+ */
+static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
+						     0x93, 0x4e, 0xa2, 0xf2,
+						     0x0a, 0xba, 0x98, 0x42);
+
+static const struct qtee_service qtee_services[] = {
+	{ "qcom.tz.uefisecapp",
+	   QCOMTEE_UEFI_SEC_UID }
+};
+
+static void qtee_release_service(struct device *dev)
+{
+	struct tee_client_device *qtee_service = to_tee_client_device(dev);
+
+	kfree(qtee_service);
+}
+
+/**
+ * qtee_register_service() - Register a given QTEE service on the TEE bus as a
+ * TEE client device.
+ * @oic: context to use for the current invocation.
+ * @client_env: Client environment object.
+ * @service_name: Name of the QTEE service to be enumerated.
+ * @uid: 32-bit UID used by QTEE to identify the service.
+ *
+ * Returns 0 on success and < 0 on failure.
+ */
+static int qtee_register_service(struct qcomtee_object_invoke_ctx *oic,
+				 struct qcomtee_object *client_env,
+				 const char *service_name,
+				 const u32 uid)
+{
+	struct tee_client_device *qtee_service;
+	uuid_t service_uuid;
+	int rc;
+
+	if (!is_qcomtee_service_available(oic, client_env, service_name, uid))
+		return -EOPNOTSUPP;
+
+	tee_generate_uuid_v5(&service_uuid, &qtee_service_uuid_ns, service_name,
+			     strlen(service_name));
+
+	qtee_service = kzalloc_obj(*qtee_service);
+	if (!qtee_service)
+		return -ENOMEM;
+
+	qtee_service->dev.bus = &tee_bus_type;
+	qtee_service->dev.release = qtee_release_service;
+	if (dev_set_name(&qtee_service->dev, "qtee-svc-%pUb", &service_uuid)) {
+		kfree(qtee_service);
+		return -ENOMEM;
+	}
+	uuid_copy(&qtee_service->id.uuid, &service_uuid);
+
+	rc = device_register(&qtee_service->dev);
+	if (rc) {
+		pr_err("QTEE service registration failed, err: %d\n", rc);
+		put_device(&qtee_service->dev);
+		return rc;
+	}
+
+	return 0;
+}
+
+/**
+ * qtee_register_services() - Register the secure services exposed by QTEE
+ * as mentioned in 'qtee_services' list.
+ * @ctx: TEE context.
+ *
+ * Not all versions of QTEE support a given service. Hence, we try to
+ * enumerate as many services from the 'qtee_services' list as possible.
+ * Not being able to enumerate a service shouldn't cause the driver probe
+ * to fail since none of the services in the list are mandatory for
+ * establishing communication with QTEE.
+ */
+static void qtee_register_services(struct tee_context *ctx)
+{
+	u32 idx;
+	struct qcomtee_object *client_env;
+
+	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
+		qcomtee_object_invoke_ctx_alloc(ctx, true);
+	if (!oic)
+		return;
+
+	client_env = qcomtee_object_get_client_env(oic);
+	if (client_env == NULL_QCOMTEE_OBJECT)
+		return;
+
+	for (idx = 0; idx < ARRAY_SIZE(qtee_services); idx++)
+		qtee_register_service(oic, client_env,
+				      qtee_services[idx].name,
+				      qtee_services[idx].uid);
+
+	qcomtee_object_put(client_env);
+}
+
+static int qtee_unregister_service(struct device *dev, void *data)
+{
+	if (!strncmp(dev_name(dev), "qtee-svc", strlen("qtee-svc")))
+		device_unregister(dev);
+
+	return 0;
+}
+
+static void qtee_unregister_services(void)
+{
+	bus_for_each_dev(&tee_bus_type, NULL, NULL,
+			 qtee_unregister_service);
+}
+
 static const struct tee_driver_ops qcomtee_ops = {
 	.get_version = qcomtee_get_version,
 	.open = qcomtee_open,
@@ -779,6 +932,8 @@ static int qcomtee_probe(struct platform_device *pdev)
 		QTEE_VERSION_GET_MINOR(qcomtee->qtee_version),
 		QTEE_VERSION_GET_PATCH(qcomtee->qtee_version));
 
+	qtee_register_services(qcomtee->ctx);
+
 	return 0;
 
 err_dest_wq:
@@ -808,6 +963,7 @@ static void qcomtee_remove(struct platform_device *pdev)
 {
 	struct qcomtee *qcomtee = platform_get_drvdata(pdev);
 
+	qtee_unregister_services();
 	teedev_close_context(qcomtee->ctx);
 	/* Wait for RELEASE operations to be processed for QTEE objects. */
 	tee_device_unregister(qcomtee->teedev);
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index 60fe3b5776e3..737d1d9ca18d 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -898,19 +898,21 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic)
 
 struct qcomtee_object *
 qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
-			   struct qcomtee_object *client_env, u32 uid)
+			   struct qcomtee_object *client_env, u32 uid,
+			   int *result)
 {
 	struct qcomtee_arg u[3] = { 0 };
-	int ret, result;
+	int ret;
+	*result = 0;
 
 	u[0].b.addr = &uid;
 	u[0].b.size = sizeof(uid);
 	u[0].type = QCOMTEE_ARG_TYPE_IB;
 	u[1].type = QCOMTEE_ARG_TYPE_OO;
 	ret = qcomtee_object_do_invoke(oic, client_env, QCOMTEE_CLIENT_ENV_OPEN,
-				       u, &result);
+				       u, result);
 
-	if (ret || result)
+	if (ret || *result)
 		return NULL_QCOMTEE_OBJECT;
 
 	return u[1].o;
diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
index f39bf63fd1c2..b1fe1d317150 100644
--- a/drivers/tee/qcomtee/qcomtee.h
+++ b/drivers/tee/qcomtee/qcomtee.h
@@ -39,6 +39,16 @@ struct qcomtee {
 	u32 qtee_version;
 };
 
+/**
+ * struct qtee_service - A secure service exposed by QTEE identified by a 32-bit UID.
+ * @name: Name of the QTEE service.
+ * @uid: 32-bit UID used by QTEE to identify the service.
+ */
+struct qtee_service {
+	const char *name;
+	const u32 uid;
+};
+
 void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic);
 struct qcomtee_object *qcomtee_idx_erase(struct qcomtee_object_invoke_ctx *oic,
 					 u32 idx);
diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
index 5d7b21fdd368..9278a361dc70 100644
--- a/drivers/tee/qcomtee/qcomtee_msg.h
+++ b/drivers/tee/qcomtee/qcomtee_msg.h
@@ -105,6 +105,7 @@ union qcomtee_msg_arg {
 #define QTEE_VERSION_GET_MINOR(x) (((x) >> 12) & 0xffU)
 #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
 
+#define QCOMTEE_UEFI_SEC_UID            413
 /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
 
 /* The message contains a callback request. */
diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
index a241ab657318..e2f2508aad8f 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -317,6 +317,7 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic);
 
 struct qcomtee_object *
 qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
-			   struct qcomtee_object *client_env, u32 uid);
+			   struct qcomtee_object *client_env, u32 uid,
+			   int *result);
 
 #endif /* QCOMTEE_OBJECT_H */

-- 
2.34.1

