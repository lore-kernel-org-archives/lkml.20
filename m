Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B5B3B3BFE
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286464; cv=none; b=MSNLMjhhp/cjnhBXfkKgQ70iZJZVzKe0g23NQlPiCgzsNTyyuVYjSKhy9oHwZN9/vUR0TUePjLVJKWR9bYf2eNfZlzkv8isM9rDU+6WSgHBiXIEMlH4WXti60sTE7BLvZuhKQJxtj8jwii7QsHaIAWjmXoLJEbhrBtux2VkWXWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286464; c=relaxed/simple;
	bh=V6V67HDyVwvDLDt9fmB26sYcY1MHYbVDIRs6gvhxmoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umR1+5t0wmdH2zadBtIpPTXF7/9zhYwAwr4Xi6mLVh6TBbzQWiLJfhPbO8WwEZ7TT7/B2Sd5Ad3Dc/B2kPEzNy+713IKi5FwPfwgAgoqHGiVNWo5PItyAlAUH7rsJJogdCcPzdCnB+ur3m0D2GIZEULYmI+A4g44hO4FeKzgNhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVt5RnDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UgfoUGEo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVt5RnDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UgfoUGEo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPTpc1707832
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 11:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3m8lL1hF50/CqIcZMmwBNIsPVljpYvteygQ2Xz3F0M=; b=YVt5RnDRq2xGm1rD
	mbUHvUuqsFsBaI7j4nhg+FS8v7msootrv+mvIzhBylThHBgZ1+amTzLkyg66vOym
	U1C8aISc2FoB1MCT804QydLin4r8dNhkEF/XG5SipUpyvh66z2SreJnGCpZC9U2R
	w+ikdzhmStAnWESblGgv4ViuTdgYud7VfjglUNjYZdCQMRvLqyaxS10XlnFjH0bk
	wr8CMucQkjuftRLxWk4FHzbqAHKtRnR+NF7lCS2QoK4oz+hLA4uQVlgaM+lDtHG/
	oniFfwcJL2cZKvMDPbuUGHltZLHt3Qsd58HejzMpnOq5dhnVEDDgrIhZgnOR4Ly5
	+vmOIA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc50dc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:34:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so2865830a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791286461; x=1791891261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3m8lL1hF50/CqIcZMmwBNIsPVljpYvteygQ2Xz3F0M=;
        b=UgfoUGEomy0e9BAiGrt6ZsIdblRyqjQ39U5PFJJs2p9ctUeRssFh41su65VQ4kawhw
         mij2Pf2x+XPADeVOhdyDlvqh95LbydL1Y73W81ae3zWm1xdtp+OHA5pCTJwayN/KdMo/
         uBUch2cAe7fCpqppZRO3RgMuJEq3qzmQrOrzKz2nSrNz1cJh1+yKuuYPtJZblnDss4dy
         0ejibH7xwTEFSYor+SSLJBOGSU0u+fYqAU9bkMYx8W5S4G1kiUHllxDV88RsxVE7/dHJ
         0uFteVbeLeR0kmda0YkWLPMLIBEbJtwkHaGPsAlnK+99GOFtUDaHexnzXIrkqifJz+M7
         DO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286461; x=1791891261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3m8lL1hF50/CqIcZMmwBNIsPVljpYvteygQ2Xz3F0M=;
        b=UOsXUZQ6p+bOjoSI00Bme/mv8KicVjDhSizNOl/RKmQ2PBiMUjTv6/dJ95HztO8Ysy
         CXMpKvuER4Zs9snJfTM908r9AEgkjsG4FqszK/mvAcTtaEmBnqdGaDiXUDHKXpyKCjVM
         6BDJvQkrXeHNUOIRgxxfyK7TEQeeWItx4OvX5wSjmq9qB/kMfsFy2lqq7ott1W37ygCZ
         gATBsjGSSs8xboMLSpfgkFHt0ap9pQkp9EjMOlqOQm6kRq1mm+rWV5ZBuxS2ICAUrAev
         EaMnAnkQaLgbZ3+JKQg94GrjmsQ955CFPv2pe+xYqLtYUGxvH+blpIPaZQk8ReLKBy9E
         oFyw==
X-Forwarded-Encrypted: i=1; AKwUvBxL5sbyDvWkWyayqslUifuZVIVA6yCNrc0obtgspvxoDj8nBwyhN6bHBa35cf2ebwLaWY2RDOfhrtj2AJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkIygZUuxhYcL1493qGsduspA5Y1Amh4mR9Y8qyt++YEg29v2G
	l1gq2NqzPlXuZXgAbWkKwyMeSjnsRTi2rB8pzs9wQhyJkjoCVvai7E0ecwgytxZFHevXOo38GGN
	o6XX1DxxI9Lq6IcasF9zc3Zno+1kBhPVDUF/3bjq/duGU6vgTwCeMHpLqTTye6LSXEmk=
X-Gm-Gg: AYBFou3PL/BdgeO2djmeSEge4VK9S0vKhHx6vBs6b2WL2rBhUEjbQ+ynYiJhCh77ZTP
	k7DqRuZ4yEcYYdWB8uXAbpWkpqA4A4PErKZE869ghq6JKm4V69uMvFDHVW5p1qAskuF6GgmlSZ6
	/S48qkPdyU9W/wjXDUoOZibEuGY7gOMEZVxLP4WTFU2V+QbK4SWnuweudprzGaBOKI0Bs5x6KPy
	HM8T8MCajvhXaH06FGODoAAPqIBLRZaeZ+jGitaouqOt8ipDWJAcQZSTUPF+PvTOUfgXctadek0
	pZzOrr5+rWxgxBQXTObj01NNkanfYwAgIXV1SXUl//AuND+Kd1t7YoXBFNqPbOSf7fM3pirZcc8
	DEP3pZZMR+W1Kh6s/adfpeIcL
X-Received: by 2002:a17:90b:3b50:b0:3a1:6719:6892 with SMTP id 98e67ed59e1d1-3a87350ab25mr496945a91.11.1791286461227;
        Tue, 06 Oct 2026 04:34:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3b50:b0:3a1:6719:6892 with SMTP id 98e67ed59e1d1-3a87350ab25mr496932a91.11.1791286460766;
        Tue, 06 Oct 2026 04:34:20 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm9330092a91.4.2026.10.06.04.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:34:20 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 17:03:25 +0530
Subject: [PATCH v4 4/7] tee: Export uuidv5 generation for TEE backends
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-4-bf1c8e2a64ab@oss.qualcomm.com>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791286430; l=2896;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=V6V67HDyVwvDLDt9fmB26sYcY1MHYbVDIRs6gvhxmoE=;
 b=H+AL9sPBWZtubzOPpqMMxaz0a8SEPvsgTWpF9sb2XyuXMZ4q8jYMSuyYS08eK0e6/yne6nJnR
 Z+ljMz64mfRAA3RJrzkO8xT+ddXNZvjgF2NtEhj1lFKbvx7AoYmeXJn
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac4dcbd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_y_UpZ8dDEjReVSEE2UA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfXwNz9l9hhedIn
 Psm/w0Uy1zMxhvV6njitExaLA5e3D/bPQ8GTfQADW5dLNZdXP6HQz/mKye9tAWGVVeYlBInsbJo
 dI3fCWkdPRQg7qGXsXdul893yosfaTw=
X-Proofpoint-GUID: 2-IPVC-pbLoddGJZgoJpPz7AaU0GuS2R
X-Proofpoint-ORIG-GUID: 2-IPVC-pbLoddGJZgoJpPz7AaU0GuS2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfXw+a9sjkthnu+
 BvqvGFS/+JJz0KcD4KYZto70RgzGcwrRopuVYHnGMt9F/LEBHbiUUz0O/CmDtuYrEFUEqjFQ6g6
 PP6EUCNULxEB74a8V4ygM5tRzcaH94CJmHbRR34XAY5p7K6dcMnT+yMyhcSVGBcS2Si2S+P4FVi
 rqzE6Nm7gyep2NrcskpCC5nsvdR/CEJcExzTEJw7JqLijzh70F8fMldyotS/ACi2tyKfBK7HEeL
 H3WbDZLoFuRxU0YDOgaKazp6xcyYxtqrl5cWDdy/OtNsI9oXrvyBXuA5e7TuNfiL/aQ+0tWrg0R
 mujM7D+ZuorvgmOFNLxF2sn1fgjsxtL8Keqg+FHhszmQX1pRS1pwX0hmf0Z0BoQuh8pNZ2DD9pO
 fviT422X61hB+nLlkaqfEDPzVLdPSol1MdRLOXc5nZhiukowX7nagzTOvh95hwuZmE8iF147KTD
 fcKUfqkDP28INoTPTjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060045

Export the uuidv5() function defined in the TEE core to all TEE backends.
This enables the TEE backend drivers to generate a UUID for identifying
and registering their secure services on the TEE bus.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   |  9 +++++----
 include/linux/tee_core.h | 15 +++++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index a03a3d645dd1..2cfd302d1393 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -135,7 +135,7 @@ static int tee_release(struct inode *inode, struct file *filp)
 }
 
 /**
- * uuid_v5() - Calculate UUIDv5
+ * tee_generate_uuid_v5() - Calculate UUIDv5
  * @uuid: Resulting UUID
  * @ns: Name space ID for UUIDv5 function
  * @name: Name for UUIDv5 function
@@ -146,8 +146,8 @@ static int tee_release(struct inode *inode, struct file *filp)
  * This implements section (for SHA-1):
  * 4.3.  Algorithm for Creating a Name-Based UUID
  */
-static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
-		    size_t size)
+void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
+			  size_t size)
 {
 	unsigned char hash[SHA1_DIGEST_SIZE];
 	struct sha1_ctx ctx;
@@ -163,6 +163,7 @@ static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
 	uuid->b[6] = (hash[6] & 0x0F) | 0x50;
 	uuid->b[8] = (hash[8] & 0x3F) | 0x80;
 }
+EXPORT_SYMBOL_GPL(tee_generate_uuid_v5);
 
 int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
@@ -228,7 +229,7 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
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

