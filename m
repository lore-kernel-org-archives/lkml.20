Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FDC49B5C3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064422; cv=none; b=HzPOyswW01opj0TRnfxIkMNiY11hgedjIwN4zN1qrFVylZWf32vUv/SchYdIW6XqmvA3Ne0IIIkGQRn2tHtgSR7AXAvsyXTgCUsPn+pFeJcmWtL2+8N35rA9aP3WPNjx0Cso+aOvsh05lJnuzFqjYtrCEUbFeUUf4zPsqwacsUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064422; c=relaxed/simple;
	bh=0Kc794OPno2pW9+u85wr/YtBS+yp4Ljn3phxmGe7iJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6JaBdE7NJF8tkI9bHJCeEw0gY1Vm1rIXC1tWT5UjCF+ElSiPqM9krQ6Z751P6m4TPIEPC5jZkG45mrVKWthnv9ioQvE5fyQNt80ul5NlIAan+sFtFw6nrr870QJg83tvzT6wVtNk7mOE8OncaVcZavOvLicnd5uIiAAupBM1Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fg2eELCJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHAOqnUj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fg2eELCJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHAOqnUj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAQ37S4101541
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3H9YKHNrLlGtzYAMdj326MBl/MGfz8aeOp/tdjelI0=; b=fg2eELCJIw4NVXvl
	kIkQc2x+GAOzfRjwzY/zAWWnXKVdcCiob1Wx8LQhJUx/DPDJALiBi4VOSAiDj3fS
	lXv19llaUGFdyELiDrubMQazALFAPR5sNJC/wILbB5gq0k5RJVt8ViDAi3Q+Qmw0
	jknIdjpHm81vpnfTP7ptaQzjyvSl/bWewOC67tRqivpkhocwBlByIvNgGOuWYXhI
	wYH2BBX16vRrS4vGAAkpZluNvSNsUwv6E9jt466Al9m55LLx6lWZ+c9Hdv+vkIJ+
	xsCyfuoFcSSd3kM8q2QxPvJZ8TqDlAKSBxqC/dUQHVocxnSF4uqugIqHgjeDg4kt
	a7gI4g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r88w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:40:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so6271258eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792064407; x=1792669207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3H9YKHNrLlGtzYAMdj326MBl/MGfz8aeOp/tdjelI0=;
        b=EHAOqnUjteZgQd0lUddGoRCQWstDWbCVKSLvcliEy34qDRNsNzgipBFOJZT8i7zT5E
         gZoHE+4A3LPXUWwSbU3+zwEYEmfkQ6WbCC1WBhnqT/fMAQ6xrRmAAH92QxXa81ZPHhKk
         Ud9BpGEqhIOejKK45AxOkEnkBXdTE6A0qzzG3mv3CiSW+p5JjA/jPN74CdxGKCNQNiMq
         SLKVphDHFZIwENpFerblKplXkdtwHRq7DDm3TfR9M9HHpcCu7u+9ahn1Bvgjn4y6A5E5
         6zuwRTDnEY4BHttszVPDysqmMuxzcjw3tceBn5w5BinMTe8XlBrArgD1/Vjxgpm7c1FT
         UgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064407; x=1792669207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3H9YKHNrLlGtzYAMdj326MBl/MGfz8aeOp/tdjelI0=;
        b=nyBAZnS6qjbgvFcmdSHBR6ObXPaPdPUnsDsp2ltcdXYXqTrMYnfvd59pOYkyVCuxUJ
         GYeLq9VexwwYjtSJw7yvuEyzFB1IiFA+amOpV9SuUy0ZIKbgx8Esl7+T1Dd4Lvbe5OFs
         VCPTtkGBJ2Zgb6pW1waN2YOwwITDwzvnQbAaCjIKVaYFRgNEoqJQUxFp9lsdnyA+D3gH
         zjKw7ZJ0oivjX2KU4Vs4y+XCg2H3J7Y/BlKSSsnSVcFEVkGTQVPmi25oVlt24lSOHta+
         7TVJQuEHpqWIAz36/DVpNND5dnbpv2MILoJcNwx2z8U0pgsGQNuoVWBjodjQFb0FjNOR
         3ipw==
X-Forwarded-Encrypted: i=1; AKwUvBzIn2CK5NLoLkRErTG800CooCGnbggy/YD2EEdwnl/VlYLX5D/07pHsam816pDakQUbJC8H0MIHdQmBmMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8YR53QJSdZCSpve+O+nZMihH1qE+7NxsKxDtOV2/vfpdfWcrK
	6zXoQTTLSetQQlUR5J4d4jZYSwbxnSV3kWjQpc0iV7F0eBeLUQ762W40Z9PvkweAD1fVFWRNefV
	8EuEJnjbuPTPq09+kdbhASB/KMVtwxwePSsfr/LFbYxKOLg2429AP8bQhRdBI5BNHu6w=
X-Gm-Gg: AYBFou3BrjdbeEYdb99K7vktJFXL94jtM7g5ZLYDdj6EeBQwzyhX8nJmX6F9zO/bzDj
	vPWMP010of1+rJbNipLmjjj1Gp0/rxq7lcqp7/18zlmoPqYKKzwsKhw/4LuMrCjzXbahkQ/aMOq
	tPTgr6RJwZ9H7K1b2L0jTsx85jT9x6aWoBix8DsPyRgWXii8WnCp74Gc1A1wVn+ZtXiG6yxTsfG
	SSZ/FnDqQqQzseFe34YBTCmQdgYUOcz2H2vAttBFglDvAN3TI385sD6E/yHwpBJx+c4QSauBfQs
	6TrBCevZDnR5LDUK2F1IUvdGsJ/J09EFokvpvyuZ93rqU5YKv05HQ4tgwjy8dRhfbn4ukYy1G2A
	s5OeytKnW92V0dHT3an2aP973lQ==
X-Received: by 2002:a05:7300:ec8e:b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-3537e0792c4mr23860381eec.15.1792064406354;
        Thu, 15 Oct 2026 04:40:06 -0700 (PDT)
X-Received: by 2002:a05:7300:ec8e:b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-3537e0792c4mr23860337eec.15.1792064405790;
        Thu, 15 Oct 2026 04:40:05 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm48144891eec.11.2026.10.15.04.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:40:05 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 17:09:38 +0530
Subject: [PATCH v5 4/7] tee: Export uuidv5 generation for TEE backends
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-4-1460691b35d3@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
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
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792064379; l=2929;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=0Kc794OPno2pW9+u85wr/YtBS+yp4Ljn3phxmGe7iJQ=;
 b=3Xsda148xCgAgWWIW/3X1xBDM3z+OpNOIoFgRq5osdaIUhrqScLhSvBdQJC++d5laCbZ0nkSe
 7qJqXqp9npCBbTo3odHlGA+lJHpDGnKqvo7y9QKWwx/zOrO9ZzM2z+S
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfX2YMH+n3Tekow
 wd1NU4QKXHGYJX/Fa0NehubLLNdMICy+IoIwEJaPsNL8vf/CEQrHR+Q91J+GpzY0USEL+aTvbhD
 JSv5xnqOeE5GyZC6K0gjtR3urIxOd6Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfX6pORCYYaqepo
 HH8K3dLXjkoVztZefzYJTnnvmUeNLjUXkce4oYKTM0OawHw24ITQTRfMq/9ZyGEiP2ipCEPPJzc
 ny/sS5E5kh1Ub126IcUdY7WjpW4f+ZN+vOch81Gj84rChyyGQnNIVzGTipPrql07oTO1gHtyBkb
 fK+dHaT9x0MlSZiIe8YWsbO/hGyBmC7LW4I+ztpy7dAsAiKQt88QrrhxI1rSnpQ4KbnKQbVx9/6
 rErYMXCo6M6wZFpCF77GGFEkuPW0cRIvH2Aj1UXRQMrUUJOwSC40TkF65Be8ngsmXGEeNxBLKwy
 7jWAa953hh+GSKMRFaa1aZNl8bcKCe/yjbvz9CYfDAbLkwa4gqN18859oMF5WrH/Zfc4GL0NhKa
 Biw2U8uyFxyLkdxSLcCIQv3G0iBA686ggoyYBQCzOrvcMOaLhyoedGY0maGBqU3bGVU7LjpMOLs
 rJmrI6XucUFoP72KHOQ==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0bb97 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pmd68VmXx7mOn8wi7GwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 1oGuPZRmKpLBbgFQk_pErViA99pi8cIt
X-Proofpoint-ORIG-GUID: 1oGuPZRmKpLBbgFQk_pErViA99pi8cIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150046

Export the uuidv5() function defined in the TEE core to all TEE backends.
This enables the TEE backend drivers to generate a UUID for identifying
and registering their secure services on the TEE bus.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   | 19 ++++---------------
 include/linux/tee_core.h | 15 +++++++++++++++
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index a03a3d645dd1..2d678d414edb 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -134,20 +134,8 @@ static int tee_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-/**
- * uuid_v5() - Calculate UUIDv5
- * @uuid: Resulting UUID
- * @ns: Name space ID for UUIDv5 function
- * @name: Name for UUIDv5 function
- * @size: Size of name
- *
- * UUIDv5 is specific in RFC 4122.
- *
- * This implements section (for SHA-1):
- * 4.3.  Algorithm for Creating a Name-Based UUID
- */
-static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
-		    size_t size)
+void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
+			  size_t size)
 {
 	unsigned char hash[SHA1_DIGEST_SIZE];
 	struct sha1_ctx ctx;
@@ -163,6 +151,7 @@ static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
 	uuid->b[6] = (hash[6] & 0x0F) | 0x50;
 	uuid->b[8] = (hash[8] & 0x3F) | 0x80;
 }
+EXPORT_SYMBOL_GPL(tee_generate_uuid_v5);
 
 int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
@@ -228,7 +217,7 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 		goto out_free_name;
 	}
 
-	uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
+	tee_generate_uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
 out_free_name:
 	kfree(name);
 
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index bcb5418d6fdc..a3f4f88b8423 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -272,6 +272,21 @@ void tee_device_set_dev_groups(struct tee_device *teedev,
 int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 				 const u8 connection_data[TEE_IOCTL_UUID_LEN]);
 
+/**
+ * tee_generate_uuid_v5() - Calculate UUIDv5
+ * @uuid: Resulting UUID
+ * @ns: Name space ID for UUIDv5 function
+ * @name: Name for UUIDv5 function
+ * @size: Size of name
+ *
+ * UUIDv5 is specific in RFC 4122.
+ *
+ * This implements section (for SHA-1):
+ * 4.3.  Algorithm for Creating a Name-Based UUID
+ */
+void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
+			  size_t size);
+
 /**
  * struct tee_shm_pool - shared memory pool
  * @ops:		operations

-- 
2.34.1

