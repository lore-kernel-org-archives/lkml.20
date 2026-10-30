Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340110;
	b=HJDMqB7kjlGGRH9zAMWPb8iD4mmrfP/PCnhgrfmiVlLMGH57NEprdN3TTyi8lsuIT5C+
	 GSKGXSTylO/2asAlMJ4qnbNUQpv00vYOuJqkWAkAJrjcg9JCBqAEzXz7fpEB6pufFmObo
	 KSbSTVMcesWYA0nQ7aKphA4ckM+AxOmJghk5kdXNnlhUTwZXWtXO+y+yTsKt7aVxguf80
	 C0zFBzF4/6y3AqqhIIj6DtmlWD+mTyjTsHzccQdmN1RRLEdsT2lbZJbryTksHxTBYQP3l
	 do6+EIuKDWLxewky9GN74qqaFOk3kHOvTiPPzW2h5JfP/sIsSp2YmEIKwzV2gkeOxNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340110;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=;
	b=iUZg4FNYmSzV9v6WJ3HCDtQdVaxEa0XS+mr03zwp3pt9evdmWkLc/2ow4cJpDITK35+D
	 sQ/UXJ4BIDZyA80HiU0pP7YDVMLKWF9aVmY78XIqmYGGUYWxjzbg3OB1Mj0MoQHyyOvZ1
	 JAndE9Cvzewzuocz/zj+LZWdSawCZZAKHOOzscUoQM8mt/cYyAcnaBga4pYb7xGHuQaCp
	 UtcV4dheWOf3juOgjH/Xt0B/jP01ww/a5kzxkGL0eYQAL5NXs7v1ePPJp/UmiUZWKQyV2
	 5OJJfbN9Ydud0zNwJXRvvQtla4cclboyxyazVHuvWYz9vhAPwvxbniKpv7rHXKxjUKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1GUPYVa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RALYOlK6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015CF606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 015CF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1GUPYVa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RALYOlK6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F8VV725522
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=; b=p1GUPYVaYt5x8Fsz
	9U6Mxmjhx3MccUJd+BBFhjIfoqgJhdbdtnA7caz7aaITIb6YuR9uHHJtqOWp8mtP
	pw03LDSf20pTjpHMJktId1q2KCbPMmXUjG0eM7KNhdF+jLjjtIdEyYXR9KsZCMNL
	XzcXthjfQlumz0fHxcLPbnEkGzG+sbjXa17x6WgRCIpwwd2AtPP09qA2d6DBb3At
	Jo3fF7K53Aklw57ZrUzR4F+v2EGdg5JfLK7PFsyqirn8DvBWC/UXsCOmu0fnz6Z/
	JnmXhDSVy7SLYwtdKAcUGPSzezSG4DCFFYdDYZSLjsZA7jBN5iUC5DlpSTgJl838
	z102XQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6phe1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so353049a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340108; x=1793944908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=;
        b=RALYOlK6UcnYG+oHngbgummfaCT8BrOjgLEi8pP8pbvkvUqKdhTu8JCF6qqCJ+xheT
         pEfpDPo7a/XRv1FiSFhXduJRZt4zA3J7xTglKVRyv+SjxdsirTPnxKA9zJpx/pluRWO6
         fW/IgBfJ7hs3doAO5NuQUPZsfMYn9fyLZyXe+mo0dJXcESFsNJ8tgt+Uo6I0LYZBRnVj
         /vs88YObq3fNfVSq8E/F6STas0ojJZO/DZq8VrbIKl6iZBiSt1DOgMSKVF+zF2XHazaH
         SgLyDEGXX1IQdsGcaW6esf8ptPjhPYaetfoW8Rz4qMnB5/Vmu2z0w1IIO9Efksb3tkhK
         JAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340108; x=1793944908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=;
        b=hDt/uqfHfjhcJSBtTKFSpmzCt4kcBDnFcEIXkMCOLWJ2xIsyps4qpYBvE9F8RCOqkA
         AeLT4YkVyM5fhj7YG5LU4L/IjuZ1YvKYFpWfSKK9n8kHVmsWKuH+6I37+LuVFTolu6dy
         MUU1+yXZLbnAacWNsg6x1JesjaLx+8YcHJl1Vi7s5Z19T35pnUzD6PDWaliJu+NVqBOA
         AJpJb5uw2loE+GsGZf1YNN1NYmj5Vgehd2ia+42inWzqdU4OwXejJRjLQRSk9706Gp37
         fyMrkunA/JByaM59w/0Bs0P7PH5p4kpjht103CXHex8ULyAvqbHDzHChDPSN4KPq1wWE
         eGNA==
X-Forwarded-Encrypted: i=1; AKwUvBwtnTbf5tHrlIKGLkxlH/Mfizuro/UlEAyji+pEm/pqsvutHRKPyCdGpBw8cVOO8kU6YxImxtwMgEjkd5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYK//zaHGKQFfefS7uR1DRACg0mEhCCKyJWhnyiJrmLPhU+cWsAZ
	yfS0pKrCt3tg5nmXb4t0bxvcu0FbkpdF5Uwxvf0ueJ0S2RStx41GUeJyH4muPedQ5h+3JXHDkxg
	FEsbvVvO85RyoCtUTu9YyMIvZgvVBm9N9Sgwko6zTyBmeEMy/DRB8Gln3QpBD1moSvcY=
X-Gm-Gg: AYBFou0CDyhK01NBIwIaHozq8roVLpzvEkzeOQC4zt81OFvKVeaVRqXrN0dE2hUuNM2
	HsAi1BpcZabXaK4rKDSdvAJdQMNEmEXbKRtNfpDB9vrJgSQGv6c1xhJQDlgl5kcFD3DiMUYd4Rs
	1QYqUFlFypZeZToQ4XzhprG8656m/l8uX/7BPOKegPE7dLZoILofQcpSDIgOMND75SBJHmy35hE
	tf4jAWe/HpD/BwsmRs/CMPsSzay/EidTLGhwLfFTU92OVUza4ygJX1enPMzIYYbpeqTrvna4C70
	SoGcXe/CXn406y+jOD24UNui7+rjVSVuN/Z1B+492P6N1FgvK8xuq1i4yueoMUGmZvkCqsT3smA
	LHj69pIg08M/lfMHVren0illxbe4IQUzXav28a0TXoj820al5wVIe2hshJJQAOQP4xA95POYWYd
	Dzx6B5ithkB82wjvlJo05kki3Zkb8+PQlCfpzL
X-Received: by 2002:a17:90b:2f06:b0:3ac:9785:4c34 with SMTP id 98e67ed59e1d1-3ae6ece52a6mr3382659a91.4.1793340107322;
        Thu, 29 Oct 2026 23:01:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2f06:b0:3ac:9785:4c34 with SMTP id 98e67ed59e1d1-3ae6ece52a6mr3382626a91.4.1793340106771;
        Thu, 29 Oct 2026 23:01:46 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:46 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:28 +0800
Subject: [PATCH v20 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-4-bd5c3ac9f916@oss.qualcomm.com>
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
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340076; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Ux/UFuXxomeyORdfFTzlVtMlH0joNUz+K5vYGMS8MOs=;
 b=zUuxdxhuBcLR8U3IQg3Iv054zxt9xGDwIBldKBF6CFaHA+ue0fpUG/4QbRrBHAyzjq3aGRwaz
 0/2iRE3l1MADNe8/cz0GsTnUlOawLNECCXvS+oE+fhoRK2QP984GRxq
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXyqWHZvVKHtK9
 CIwntsRUTshNKNQbd0AwAIQHs9TOTaI5WGuLaDA4WhzKx1XtsM8rDw2inmNgiKsRPqhHPDJrpyT
 0lZAlVg6d8s6aFt9+s8UeDqYT7mDFNEJAnW8XmmSK9n9eSDn9+YERIOqUvcKg4fjWh420Cy12VT
 OuyMGoARMIA4PEwywhm/ksr9VxgXuxOoGyIlYVL78j7rNp70uDMExSXYZLlKUlCLzGVbvAdRJS4
 M/twhlSgVku0gqZ31mRbvQorsOc0fYozVO6AiBnMgZyId+AaTahNzNy4b2+GYSEXttSNLm8qAPu
 7xx7CmK2dftGrF9A9nG5sxQ5qNZ2d+SRb1QgLeTj14TAENwDhi+6EpDc4GNSJEMeILlQTrI6p6J
 DdDol31x0ZNmPK5PKT+fa3zleRoD9JAh8TY2OgzJCsrJ8ljwTsFmMWJYUlI22cfMBuJ5AkSl4ko
 V1I1Wcqo3gN72OGjn7Q==
X-Proofpoint-ORIG-GUID: cdXAwzbGBDzjuTput3M4NwoeCc6aPv-d
X-Proofpoint-GUID: cdXAwzbGBDzjuTput3M4NwoeCc6aPv-d
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae432cc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX5+ANiJdMm3Bq
 MF5be6qiclms3NfH/KZWbp7RAOG0SSvOO8CmMKfNJU6fLoI+xdcdSvxkpvck9Jw4C954peYeQYS
 fPictnH2njSYP9eoUhr9LfLqD78aMWQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300023

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 5981deb45d28..7d41fdf83c5b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index a14645b04624..fbb015079872 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

