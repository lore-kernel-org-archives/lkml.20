Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFC23E0250
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169409; cv=none; b=W8E5enVhj2Yt3gaE9l/TU08g0LpZAM5qHZGLbnXum02VfeMV7FguMh6JTSc+tO1ZnLCqrxh4FiXln2Gogkw56o/acNkO9/INQqzPnbh79QkaE0zwBP97Il1jnZtB2LMZpqO2L9Xa9Ogq5DDYA11z8hbmbKWj920zlwyTESK/Ow4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169409; c=relaxed/simple;
	bh=ds5EeuA+CTb0BPfIbXKAJvl2PTFGAC/Z73CJ6Krns8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZ9IANeQ7sKrqGWxSqGFEB+ah9Y7pwfVS8ry82OL1dum+y8NllQOMSBv/Ng4CRvNXZIXQckRkiFRYOayGeJKVkjsb27NdZ8Hce5fLtp9bP9Y8tNXc9nXsA/lrUrHhEph7dIzFR6cvQtJoV5aO9+dqP3HB4bGGlIPfww+K2n7iPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoGZKsyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAxCXhcg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoGZKsyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAxCXhcg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V8t2373214650
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yFEAg71NUKByt/pUVT5zmDN6HUPvw1ZY6tWiIuwibA=; b=UoGZKsySMbVNLdum
	V6PYvVRh13yxz5Wly+/Fw7rvsESURf0ZjbA02xJFVC3zvmJpHMzNPAF3NHP/fdb3
	PdI7sP9/aIv8eEifvrG0oQthe6I3yeCWPQSa4INnG/ZkML1xIVPBLWcrApJKKMyN
	ffrJ+g9+g0W9uTJ4j3XhfTwk3VZF09Ydlwaq98tMypVh47svmgg/9gOtcMWl4CwK
	rzqjRdOBvD8R8abmp3aMyauA9bbVUl/yPqzPYPVkMxI9TpEJEgjXT2z7iw3dgXq4
	zZaByDVpPusLrQpI4p9T9e6ZIFTpNLcWee40dT+bxVFNEiYXlrzSKeKIgdQ7fhkU
	o+AQ/A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h906kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:43:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so2026520a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788169406; x=1788774206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yFEAg71NUKByt/pUVT5zmDN6HUPvw1ZY6tWiIuwibA=;
        b=FAxCXhcgD8USX+7u3V46VPp+PgJ9FdxHBTRR79nswCIq9Cwm6oIgPp2Fd9qhCp1fV5
         Y79UCHYbYb3o0nE7lnGo8v3+uKY4TwdiuI6GS5VTFlfUBP3f0UfL1kT/BZmpbU94NnMk
         3KguAImrU7n6pMahmbwkIDgxB6pNwbV15DoHz6v5dA0qsqaf2p+nBTiSIdn6fV9BjmTQ
         1/H0h9YU6GHYF4b9OyrqkM8QKMa7nFm2f+3oByYN8b+htr2oGWbyorV/ZpAxcEca8x35
         EJ2W2dyHN6zXWqZh3acr9wRu06jQyCYm2JlH7sx0gIgrpKSnU4XdaHYiuN+4j417TErf
         5POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169406; x=1788774206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yFEAg71NUKByt/pUVT5zmDN6HUPvw1ZY6tWiIuwibA=;
        b=bUfEc7ehvP7OZJhjvlESrfaQlzbonfJAeIvzAii1KeJOBMZbufJIQybOXpirZN0LPs
         ZpXSVfvnzFMEA4fUzOePxcEedqBdvsaZhnpsb7du1htDdifxq3NzxgPUdoUGV2IQyROF
         HQxj1slPDnAFoAXiBuLspAfAB20guWb+/iEQqo6utv9LJbjqD66yetyzOSQMbCueC8LV
         UapursZ+qRhLYTXozESalpuB0PrVuG/DD2RThOPHXvNZZDRCbDRSpNlDPKnXVytchr95
         M+jNZvVyI5Bj+l7Ck7RuNk85/PTTkY37rrXnfxWbwfzv85hZiYNRp5jWZ+dxu+U4aBzf
         hCzA==
X-Forwarded-Encrypted: i=1; AKwUvBxFtpHT5n32Ky4AasuG0TZATWIRUhNuEUqYPtK53ifAZCJ3QINSNaGZx6dnmc7NEZ4qGPat831w5Dy1OB8=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ+/UyZplFDLOo5R6ABSZdovSnUDRaRdoNnFdf+hPcbJ4AnM+W
	0fgxqivTbWwqrZCqRFEBjEY5X7DRjxwOWXhIMZ5I1DqTMA8CbOnLXhU9fRnzj0inQchOqGjPiZY
	A27ekX/2+rUJR3kHwRQ8CXcz0IIzOrk4HuVQcq5RAgw9iRVAWZJXYxswRTgC889vYPIA=
X-Gm-Gg: AYBFou3OSkOom/oulButhq1PToSpnUGeqbFMXZIsPILm9Zw2W0pfscahgLrZYhBwPXr
	4RihCFE9FgPGohlBh97YnfYj1sbRIHlOaC7OtAfMZuznzJ2JykPHxRy/ymHDmbX/s5lfptTxCzT
	RIgX7VYzpsvawkTVl517WtENuM/k67wvhjSWhQa/SQTL8BdDOiPm5NEf1weYKkZQNDR+m/etYWe
	0xvZt6Njsuz12S4xJV6XxLuSiomcGigH4v0s5S67FGGkhGXBvYVo0z70IDjwQgG7anYpfDDj8Kv
	+mS9bZ9/Z5O8QrK9uI0dxRsapKmp8Oyrvh9yOc53CSmquUBVb2DsxECDEDxil2PgnFo9lzqNipc
	WbbBLCWjUW0rOTs/k5XJHMFQfuVnCiOHg+A==
X-Received: by 2002:a17:90b:1f86:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-396d0ff5bb9mr42028742a91.14.1788169406078;
        Mon, 31 Aug 2026 02:43:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1f86:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-396d0ff5bb9mr42028688a91.14.1788169405737;
        Mon, 31 Aug 2026 02:43:25 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm40782983c88.0.2026.08.31.02.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:43:25 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 15:13:00 +0530
Subject: [PATCH 1/2] tee: qcomtee: Register qcom.tz.tpm service for
 discovery
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-tpm_qcom_driver-v1-1-6f16fa6924fa@oss.qualcomm.com>
References: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
In-Reply-To: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a954cbe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cMdrFq0U01fV1n6vpx4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: adFXQb7k6xcipTtQ0XlNjtqqOzQy39g8
X-Proofpoint-GUID: adFXQb7k6xcipTtQ0XlNjtqqOzQy39g8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4MyBTYWx0ZWRfX41D889hreK1F
 Cg8dyG1O/dTyu4uVV5HubU+fLOdzPD/N2gqF1X14nGOq6YKQNbrVZw0kCZ+mPXLUJmDxLCGhskX
 fDwJe7Mja+5IpAklTjugtnnMUMQJf0I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4MyBTYWx0ZWRfX+73eQpvU0Blw
 Scwvu247ZIWUcUW6u4Wqw/xGuouNWkhRabrmlILZLwvubbqAuXR+MxAhIMQmh30GrgLdGvk0Hgk
 aa5VoL49Cs6/JxHp9B8u0j5faDYeVrzqFUOxpRCgillHG+WzfzY3OdZC/EIw9Tbp7Ssm/wM7Gvh
 JjMmfi2hEEMPhmGvKs51ZrTqUYY/t/9ILCHawP4aprFNd2z6D7+UNjEbANQmAZOgOl72Qgq3CtQ
 R5XLEbmzJYCNsbckHG12UeiOrc8bou28uJzZPAL8MFHo2j78GVEaWdWK2bTVc2i+r1L/O8KIpa2
 /RhE/iXdi3rn4uwBPmKX3WF68iCthPyP+T3YJS46u7rhAWYGSIpmSSIIbHeimiT8kG2bBFkOhiY
 rfW/GobhiTlaUqtyIwagR8aMULEi4pTPfweLVyPe3LtX+TLXrYLAN4aI16tezsc3Qn5E3QqYN5Y
 hNvzxpHohe/56K7dldg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310083

Add "qcom.tz.tpm" (QCOMTEE_TPM_UID) to qtee_services[] so the TPM TA
is enumerated as a TEE-bus device, allowing a client driver to bind to
it via its generated UUID.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c        | 4 +++-
 drivers/tee/qcomtee/qcomtee_msg.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 4212572ff54b..aca4e8c6e37b 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -753,7 +753,9 @@ static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
 
 static const struct qtee_service qtee_services[] = {
 	{ "qcom.tz.uefisecapp",
-	   QCOMTEE_UEFI_SEC_UID }
+	   QCOMTEE_UEFI_SEC_UID },
+	{ "qcom.tz.tpm",
+	   QCOMTEE_TPM_UID }
 };
 
 static void qtee_release_service(struct device *dev)
diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
index ecaf8db67d45..888611b801c8 100644
--- a/drivers/tee/qcomtee/qcomtee_msg.h
+++ b/drivers/tee/qcomtee/qcomtee_msg.h
@@ -106,6 +106,8 @@ union qcomtee_msg_arg {
 #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
 
 #define QCOMTEE_UEFI_SEC_UID            413
+#define QCOMTEE_TPM_UID			489
+
 /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
 
 /* The message contains a callback request. */

-- 
2.34.1

