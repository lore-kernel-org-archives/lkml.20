Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877352;
	b=oxvahoVYTPyXj44W9V0l0xCxFg6p4rKvLUrugJL7yUyxJhG50bCF0uZDEIFOAtW1eFNg
	 Ud5MlseuM+izgWVSyR9jZd87ybT+Pth3a/dx6sYFBsbGLmXIAfz6cHUm483nWmdmlF35m
	 m0NvFsnQZp4JXG5IGxGIwDamP3Yap5p3DEodSM7aEFNX2W8M1mmiT+IJJClUKdaxgxDac
	 mrrd32Z7NX132vxN/kT5Vh4G7fuQrj/3M/aY8pIfHq4/bZWtiL7/CsfTr3YmkRVnH2bxI
	 7ci8B+9qH0cdEw3lYuFI0JfoxBFx4IFmF4bP2N92paf36r9JtiSGYFHAjTMaFne1XZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OSyGglNviyFpT8Uu9xEAndODqt4knqWiiFpaao097o8=;
	b=EgVG3zhwxwaqKArdEeujFtHi2vfFnXxK2AfywzkP7bZnYO9S8znDBmM1qNK5fWqoGrI6
	 WRxDl/u9BiaGji7SGw78grvFqVb0lwr73qRc+RXBhQwVQbmr5LYQYDFI9y2dKfTcMmFu4
	 YCri8dmrDTUIrhcS7OVEPt3bzkd/xNlkZnjEqGvwzsXC9dsGt6ib2ChwPVTjA+T1JsILj
	 TIWlc43C8nIfcZB3HayGKTWhjugugX2IvX7ULd3zI8avcDFM0MtiB0+mSgmuia7vbaxHL
	 No4RI/V4jbK8SoTQFwJgwytYDj4SvOFRnPcsX872zGZ+zCf8DJEegIxe++bQCStAdxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FnpEQ9Vv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CH4WIJfC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCD0606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CCD0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FnpEQ9Vv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CH4WIJfC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5AhvIM1582934
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 11:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OSyGglNviyFpT8Uu9xEAndODqt4knqWiiFpaao097o8=; b=FnpEQ9Vv5tE+BsDM
	PD+fLZrLVW6lU+6/bxawyMYuHXIrlSTNeGObYmYQbDYrSBIJjODovM1KnaV/97rj
	Se9ZDDNvvoOHyAmpq/YWT2zE0EezYfq8Wj6n+jFTUMXWInBFsK5yKgXfZzh88KgT
	kB4dd48oAFfQE/0zJCd3ttPbK4LXvIGySh7CiKzDHyHfPt1rqJ+h01Q5RlomVqNW
	6AJrfmwvoMxWyPYOqkxdYZA5K2RBA5UsfQ3V/7vDqvRLaxcXiQP7qUemEF7iu4GT
	nfYuApiVwJmeyXUJywY9GqafagoQC8sOLt+/DrTzPDd1YbLDaATP4LzI0aLHNkgO
	1YhNIA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraar3v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:15:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so3418901eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877351; x=1794482151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSyGglNviyFpT8Uu9xEAndODqt4knqWiiFpaao097o8=;
        b=CH4WIJfCbCIQZIP3XaVLx9aPIOQ6gsaQ9/9Qt6prYTpEcmuWv2+LJkNEbj/KLGr8am
         6+7GTokFqBh29xHsdxzHL8kX9sKvZx6Vw11vfmveFvVlNadJPx8OFQw7gM3qgBgD7PXk
         DgA2uUnQs/a8vJCoAbiv/M/HoBc21XZd0taQpKtgxQp7F8i6hlUQPRwTVqbpRQdDVKdh
         /wUVEPrFOHoCRv529KcrAuAD0W8pF+/Gct60wNb4+HKvI4g8rIcnZwX3zDvuwMUDfkkP
         eMPTaLsJMYezzf6r6+0EDG7hJR3VtI7xpt3xEYshW145oM325BsFlUKZGGvMQjbow7ly
         eHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877351; x=1794482151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSyGglNviyFpT8Uu9xEAndODqt4knqWiiFpaao097o8=;
        b=hHvAO6+WMDM+58N0zx/kxZISyiN6wxjp4YPljxGdXIac8arfhPAsKrKhuznzIQZZiz
         M/CYOcEsekyQw4rkg7c6czZimWCLvTgIrmj5Wj5QkWQk1mGhfbz99ZUJdRA4uDbM+Wjq
         DOpwgpzlvealfwCx6GZVZ8+Beu4I/ztWyKDOhFGliGk7Yl/3PvJOBi6jtmUPuQ0HeQej
         sad8V+8gUfEsNcyozTFYg2MXKlgNnFjdvhfM9ihciayGPJ0sNNfT6UZlddJ4fSJLLPX9
         Qw0ZCa+wc6wYRbV6dYchPTWgXh2IyecpLYErlJh44CZsLpxpxaJQlcKCW33RTBx/wNfZ
         7IHg==
X-Forwarded-Encrypted: i=1; AKwUvBxIOayMLk++7sv8T20ccQ+g68WYySTuNLx7TSX3PjzmlqGnKrl+lulSH5syhV6MJvjnWKp2Bsb908RJjEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7SVU3eMADv5OJS7aN7Vgus5SSLT6xe98cRjZwCAA/dWfCpctU
	uE4Z288i+TimSbChRUzL0opNN9y7bVAtpDSfTgzyIUB60M2R+xwFz6N4aSTTK/nYjg/7NuIe6Bl
	uV9PeOGFX9+LzUCvb1QuxPnVRllIbyqqcqXLAn0mj9/ESwU2ywk+lUTWwsW6N7+oO9HE=
X-Gm-Gg: AYBFou0eqSEQRbD6JkPLbS9PeXYe2SU4sMRzwPx6QVUsLvRaTVjJJfHsV/nML+Y/dha
	ErLz+iHo9lrvaT23zdp6G8EL25j2KdwiZv9Bv0lpCiK/Rgr1CVjiUUbQjgyGY3JRy298CRxrUho
	8ID2sX/1FfoekOyGvDz6n41pmF8zchW9eDglfGZp1M/q2x/j9Y+myYJs+n90FGxo3rZCQ6Ujhc3
	9pxyeSpwZpIlhxcEdO57lKxKlwVVgZ+BJBz6DSnILS0C2/goLchHfhbSiy+fmDbW396iLeLYCh2
	xJDXqk/u9hxJ+ou1yXHAJ8msed69eD03ddz6e8hK3UJwJH0j6HWNEGDsm2ZjlnhLzHn6YqDHFDo
	BCipHeUYPwvlpxFD30Q6J8s3mtK4CTG35KxGobsZU6G/kv9DfSDZ/mpprRCX5WUGASwuBpZT6CQ
	==
X-Received: by 2002:a05:7301:fc86:b0:36e:c07a:426f with SMTP id 5a478bee46e88-36ec07a4913mr702722eec.39.1793877350482;
        Thu, 05 Nov 2026 03:15:50 -0800 (PST)
X-Received: by 2002:a05:7301:fc86:b0:36e:c07a:426f with SMTP id 5a478bee46e88-36ec07a4913mr702685eec.39.1793877349891;
        Thu, 05 Nov 2026 03:15:49 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd7ec8881sm14002125eec.18.2026.11.05.03.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:15:49 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:44:52 +0530
Subject: [PATCH v6 4/7] tee: Export uuidv5 generation for TEE backends
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
Message-Id: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-4-c7d68ce05c51@oss.qualcomm.com>
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
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877323; l=3003;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Twey1zuZcAHPNfsDJ1UYaEgRECNx0M9KEAwGTgro9JY=;
 b=db++sqPUH/XyyGS7Ka53YiKQJPHZdjl8bosVBr48pSSEJgP7GfLEvetShpJRqRDT2g7wcFNqx
 /XdkqSkPuO2DvN3kMs4uHNGZ+n3fjQcQ208zNAV7WA6wJkuKtqsAyKV
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX6iOeYw4ZQgCv
 ATIa1C1hrDjXAzsc0FAk9a/UHe1SW4L999vndcE3bsGAMJbgw0Oh3zY7ASUfO/wyt3nY2aKcG3G
 DsJa2Ksua867e50/0zgYUtBJIQL495Q=
X-Proofpoint-ORIG-GUID: DL98oSLKQz-63wCf7u82zPptQWvgXTbk
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec6567 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pmd68VmXx7mOn8wi7GwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX0+1edOay20HD
 AOmTPTfvSGk0x1Q8gMOMLpe2DI0TUohquxy2tyc76dFY2ig0m/Hs25iCs/91cpzOl1pnbbvVUsk
 0XWkHNWfiPFwZ7D8qRcRVHWHsPq6WU6KIi2Q4sgGT8hP5bwmI1cEvUnGvJ3ijU+3eUVgvCMIt6T
 1VwxO0WB0Sr+OlEXoqMzz/HmeoS9HwEQ9XSQ2OY9K2saB/xS0w2zuHcgU4e5ueUWTR0QYO5Qw/j
 ZovSdhpvZH2E3YncQJ3BFjhV1nr3p03lssjEB9YrFIJu9/nEZiJUNBPS8TM1/h6aojn/LRDF1li
 JZJZTZD+AK4fnNqfsSLe/OhILfdBMiJsyrObekMlXgcHJij52kk+rQO5u1z9MF1PvNvT0FEvyiv
 /gEMBReamgYALH0oHZ71CB3tmEftuAKwcCR9S0PDRrz2vk4Pyxm4qpod0c7JMg2/q0hJNSv1Heh
 GYtqp/rhwCqcUzmpHyA==
X-Proofpoint-GUID: DL98oSLKQz-63wCf7u82zPptQWvgXTbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050044

Export the uuidv5() function defined in the TEE core to all TEE backends.
This enables the TEE backend drivers to generate a UUID for identifying
and registering their secure services on the TEE bus.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd
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

