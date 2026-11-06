Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979105;
	b=ZKIWA6wLXnRI5Clwb5J/rnd1Q0J5bP6Zms1+DppmVk+7hoMANIUWOvmWfemIsGT6lvHH
	 Fq5cmzOACZHdYp0ALEvYzD3wwfC3AYfM3sk4370AJQXOGp1EZELgk0rO8jCJDIECdPLvR
	 aVqoQo2npfgzXrZ4DV1an6DX9XZUgra689NYR/Tl0/8PN/4EtAr3LgNWCS9TXHcU2dtwx
	 aqq7wdz8+JNlFHTRAou9AB1FVUbjh8n8ibEyexJdN8YdRqy0Y+45I5K9J8ww7GTswzQ6z
	 EOrz4WF0eTx/3gkuUSCQq2Qw3No1+kDXpqS/wllkdMCvmtVc8wpl75W7773eDykZH5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+ScA4TABl+6PBH4zwVV9pBFVHBJlE5FX6STG0FpjfsM=;
	b=PGWjRS+GWmVnhFT7fhbafXA/KwnTIY7+2IKjkuoYkRg61pDYGaqfGtF3Sd22tkA9QEVj
	 GevL9jLymy460cMuQE343KNCWmOHSHwxqa/Smt2oaPZe+C8ErjgYCETH5CQUM9fm/jX2I
	 jSNdSkK8Hfi/7+DFtG/bqu5QBcfLlgSpbAWbt7blmmvOpaOcvAGJ3fFKeBFG6QZ1lrjqH
	 IcIuN/OQR+S+h033Y+Yu/kba2/zudheTjaMFzwEz/8hcjbSSfqxXJwxnljG0HPe5x4vaI
	 DfqVZ4vFR8O9WeZQLmQSi3PzEa9+lQQ2kMptfWvvqSRPaNC2RPujAR2gaZFf9gqi0zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UERp314L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEq+ieZv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EB4606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0EB4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UERp314L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEq+ieZv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F021d045096
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+ScA4TABl+6
	PBH4zwVV9pBFVHBJlE5FX6STG0FpjfsM=; b=UERp314Ln92keGijrQUH8QLI1Gv
	uOdAi6BfrGlrNhVrpUe8ZeKn7UnxyVMNpaX5qkvpfmAGhUMPhXvDKqCmhXYwZur3
	svgu3MlRI7QPIdCKvB+gq4xR/Uc/AsneBdPDEasvdnV50Y8ZGvN2i+hl6k9uTzwY
	EylgnSyI+qrrhnKnhF7EuRWRR2piR2gwxqcMOavQYXp3/AJa7KX5Ytgqh+JSlpbN
	4jVfqe8vf5vQ0I26XUV4g7nMA8FRgCOFMhO3P9HJySSp29s0kn1wxIpR6cufWKeZ
	KDHI26CIOttCaT3UhvwwS8MawjjlUp688KShpXFJOL3EmShxyz6VFj7Dr0w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa3bu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:31:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so1530767eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979103; x=1794583903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ScA4TABl+6PBH4zwVV9pBFVHBJlE5FX6STG0FpjfsM=;
        b=XEq+ieZvv1nx3Gp73YWMcbwY40TZVJxcB9zTd9B9ssSO0ybdB64gr44Jr0+2/fNZ9x
         NqjntgWmbmpk09+Zll3/azlrLT1KRBsbEIfilssYu+dmsQR53nEbWnN626kP3Ro30jbf
         XHUPDa/AEMsYqYovKF+x9tMygSMeT5bPRC6YBs6c5hiP0yncE+/I1tuEveJ50VRCkv2E
         79aINUFe3oLlkWAzpB6SRkTSndU8AY3rv9SZCseBIr0m1ptNiN3Bc8G9nf7oBeoM9pmX
         UtLfdB9L5cLmf4RbsWPdHxWhXEtkbdPSikDfVn1hWrTrV6Om43qk/yelYU+737HE3qbu
         eypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979103; x=1794583903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ScA4TABl+6PBH4zwVV9pBFVHBJlE5FX6STG0FpjfsM=;
        b=V6NgMOD2u7IQ0nVwe2rtaSRzSR0UDRX6E58Hh1s8gtRn9l/MjnaNQz6/EsnO/v6/Vu
         c61HM2o2nXUPj7zXpe6E+ELPwo5mtP2JHmzK1gIkmedQ+leRiTMisy4r5lRWaeQwolyt
         /AVGE8wgji4Xb1QRmud9SLXKNgIHUnvOHBM85OigHp8Q5CHD2Gkc5nXLICzqlHEt0sFu
         i7J5joFzcLQtlZq2XeVczWltZaJJ0kif66FPfy9U+ZPkjF6f1kF85yxQw99bCACh8dRX
         41ijFEKDomUuF+NNTfrozDuGgpHuJQ3ltrjDfpbh12u2r1IwPk8PeiNjOtQyVlq8X5cF
         Yafg==
X-Forwarded-Encrypted: i=1; AL+hErF8NPVU7Gn+2H4qAeF/0rHrGXTmI6C9C/L9AdUlFxhggXl6w5Xy2lg1uD7RsisPbTBdwJi1eOpKXeCzZqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DohYQfStkt7GOmpU5DYmK0SOXFg4vRq41vKwwow9rBRIxcp6l
	ZeqPDbqLpFU534g9J57FgQZaRY2j9dYG9/5dwE+XTKkcIbhIa37Fbby9wbhgqXYYshIAigtuIWh
	dRAP+66f6MV4O/NGTh4rPPEniE/6JCzQ8OpV8co379FCCb2/BjMS69sv6br6O0T6wH/g=
X-Gm-Gg: AYBFou19AtfyUpO5AduaDax95FzQW5CduF59NrVG+IIbTpVklPkRA9GeuQ+Jp+l+SIX
	UBWSFRou0WVpZT/KKcJhhxnyYwQXhPk8DFlgkB+lplyuv/WaayY2vMvcIagEONPJWTgz9Ma5uXR
	M4FHRmkm65SReI6MV7AwqeqXSABtJEX5e9Noa+rdjVWsNhK8Enjeoa4G8zLcw80f3KOnJj4eT59
	9L5cQLIC88u5Om0B6shdkZyj8xUnZTHKr1hEHvmGdyy+pu1WX7AzrqRzOdWTzUA+uDh4IB+UPAN
	KphxWkWI0NbnX/mSCOADWRhKuDSdzql374d1QBly4w+GNuwdN9/RDNA1HyuDS54ZYu2SVDSUxNC
	80si7jJOcFtrJervYJXQv5pLDxU89p1PHoVcAZdljJY0e4dhZM7Bvdh0uGWY5HohyWqjSWKjr4k
	H1p0VxHBk=
X-Received: by 2002:a05:7301:19b0:b0:36f:4a4e:6218 with SMTP id 5a478bee46e88-36f76524e83mr3801047eec.38.1793979103099;
        Fri, 06 Nov 2026 07:31:43 -0800 (PST)
X-Received: by 2002:a05:7301:19b0:b0:36f:4a4e:6218 with SMTP id 5a478bee46e88-36f76524e83mr3801004eec.38.1793979102402;
        Fri, 06 Nov 2026 07:31:42 -0800 (PST)
Received: from QCOM-seNJUcZa74.qualcomm.com ([183.82.133.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm13618197eec.15.2026.11.06.07.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:31:41 -0800 (PST)
From: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: qcom: iris: add error and status details to diagnostics
Date: Fri,  6 Nov 2026 15:31:24 +0000
Message-ID: <20261106153126.120858-3-dipayaan.roy@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
References: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedf2e0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=4lT0C3RFl5dsjxM0/Vd6wg==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=DRlHrK8Gf7G1pQlfUA4A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfXwjJXT1SEenqB
 D9gSpZuqHmPLPIzcQwyc3DJxKkQsJ8U5SIYSfq/2/w2GW+QWYEPrGhrYGhyg4q47uQ8o+NNH94h
 6DJ4i+8IjaAVTMSZaD7vBt4ZeehdjAk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfX6n7sd6+OXPpg
 ANm4wICh4ZwuLoa25B9a8I3F5+oF+VzQ/BMAQtKuyRVajBtPWz1Gomnu6/aHhoKfyHQnx6QY6RC
 fSfeot10wioVkX1aXO/u5aEWy2Tti83KI+64om9s5jivryC1KmL3X6XhOhHCOGpk8s3Az4D7fK6
 NUX4Q/2fNCveIajNZPDx/D9Z3tnQEKe9iO96sAfuF1Gk2ULgsbfxpr9VsieqmKNgSGvhq6x76cd
 1uU86cD3liqMC5yDh1oeRojrfJLY5JDS2qPz4x0lTtJWyn+/IFcEm+peAkv4mXQq5rcxsVe9ndP
 hJZTj+hYrickadqE00Whv1iJIm57mG7ni5QJfUmjoYIM/Xsv3CbiySPMowuC9OFoGcqzfFk5HIv
 glsfEO+CHs+ei6setXlPak/N+b6bn6lZ7RLuHXIMQY0QX2NUc388ulK80S1LrxDfEinP/7M+jh0
 FaB0KHQz/c3RzwqskHg==
X-Proofpoint-GUID: WUAPYGkyyphHKMPCQ09TPkSom9lNExGh
X-Proofpoint-ORIG-GUID: WUAPYGkyyphHKMPCQ09TPkSom9lNExGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060061

Several Iris error messages identify a failed operation without showing
the return code or state that caused it, making failures difficult to
diagnose.

Include available return codes, hardware status, queue positions, and
packet or session identifiers in these messages. Also report the header
details when an HFI response fails validation.

Error handling remains unchanged.

Signed-off-by: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++--
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  9 ++++++---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  5 ++++-
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 14 +++++++++----
 drivers/media/platform/qcom/iris/iris_vb2.c        |  2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |  3 ++-
 drivers/media/platform/qcom/iris/iris_venc.c       |  3 ++-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 23 +++++++++++-----------
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |  6 ++++--
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 15 ++++++++------
 11 files changed, 53 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index dad906d03fdc..1fd4cecd7956 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -138,7 +138,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 	return 0;
 
 error:
-	dev_err(core->dev, "failed to suspend\n");
+	dev_err(core->dev, "failed to suspend: %d\n", ret);
 
 	return ret;
 }
@@ -179,7 +179,7 @@ int iris_hfi_pm_resume(struct iris_core *core)
 err_power_off:
 	iris_vpu_power_off(core);
 error:
-	dev_err(core->dev, "failed to resume\n");
+	dev_err(core->dev, "failed to resume: %d\n", ret);
 
 	return -EBUSY;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index ffa98139f0eb..1ce7f97d4087 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -301,7 +301,8 @@ iris_hfi_gen1_sys_get_prop_image_version(struct iris_core *core,
 	u32 i;
 
 	if (req_bytes < IRIS_FW_VERSION_LENGTH - 1 || !pkt->data[0] || pkt->num_properties > 1) {
-		dev_err(core->dev, "bad packet\n");
+		dev_err(core->dev, "invalid firmware version packet (size %u, properties %u)\n",
+			pkt->hdr.size, pkt->num_properties);
 		return;
 	}
 
@@ -382,7 +383,8 @@ static void iris_hfi_gen1_session_etb_done(struct iris_inst *inst, void *packet)
 
 error:
 	iris_inst_change_state(inst, IRIS_INST_ERROR);
-	dev_err(inst->core->dev, "error in etb done\n");
+	dev_err(inst->core->dev, "ETB done without input buffer (session %#x, tag %u)\n",
+		inst->session_id, pkt->input_tag);
 }
 
 static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
@@ -530,7 +532,8 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 
 error:
 	iris_inst_change_state(inst, IRIS_INST_ERROR);
-	dev_err(core->dev, "error in ftb done\n");
+	dev_err(core->dev, "FTB done without output buffer (session %#x, tag %u, offset %u)\n",
+		inst->session_id, output_tag, offset);
 }
 
 static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index f0782c4b1e6e..b82f50458fe1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -980,8 +980,11 @@ static int iris_hfi_gen2_handle_response(struct iris_core *core, void *response)
 	int ret;
 
 	ret = iris_hfi_gen2_validate_hdr_packet(core, hdr);
-	if (ret)
+	if (ret) {
+		dev_err(core->dev, "invalid HFI response (size %u, packets %u): %d\n",
+			hdr->size, hdr->num_packets, ret);
 		return iris_hfi_gen2_handle_system_error(core, NULL);
+	}
 
 	if (!hdr->session_id)
 		return iris_hfi_gen2_handle_system_response(core, hdr);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e2..ef556e54f6f1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -112,14 +112,18 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
 int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_size)
 {
 	struct iris_iface_q_info *q_info = &core->command_queue;
+	int ret;
 
 	if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)
 		return -EINVAL;
 
-	if (!iris_hfi_queue_write(q_info, pkt, pkt_size)) {
+	ret = iris_hfi_queue_write(q_info, pkt, pkt_size);
+	if (!ret) {
 		iris_vpu_raise_interrupt(core);
 	} else {
-		dev_err(core->dev, "queue full\n");
+		dev_err(core->dev, "command queue write failed: %d (size %u, read %u, write %u)\n",
+			ret, pkt_size, q_info->qhdr->read_idx,
+			q_info->qhdr->write_idx);
 		return -ENODATA;
 	}
 
@@ -254,7 +258,8 @@ int iris_hfi_queues_init(struct iris_core *core)
 						    &core->iface_q_table_daddr,
 						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->iface_q_table_vaddr) {
-		dev_err(core->dev, "queues alloc and map failed\n");
+		dev_err(core->dev, "failed to allocate HFI queues (%u bytes)\n",
+			queue_size);
 		return -ENOMEM;
 	}
 
@@ -262,7 +267,8 @@ int iris_hfi_queues_init(struct iris_core *core)
 					  &core->sfr_daddr,
 					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->sfr_vaddr) {
-		dev_err(core->dev, "sfr alloc and map failed\n");
+		dev_err(core->dev, "failed to allocate SFR (%u bytes)\n",
+			(unsigned int)SFR_SIZE);
 		dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
 			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 		return -ENOMEM;
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 8faf709c26c1..b770cd5349b6 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -135,8 +135,8 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 
 		ret = inst->hfi_session_ops->session_open(inst);
 		if (ret) {
+			dev_err(core->dev, "session open failed: %d\n", ret);
 			ret = -EINVAL;
-			dev_err(core->dev, "session open failed\n");
 			goto unlock;
 		}
 
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 0dd33ff447bb..d359d3716ba1 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -529,7 +529,8 @@ int iris_vdec_start_cmd(struct iris_inst *inst)
 			clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
 		}
 	} else {
-		dev_err(inst->core->dev, "start called before receiving last_flag\n");
+		dev_err(inst->core->dev, "start before last buffer (sub-state %#x)\n",
+			inst->sub_state);
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
 		return -EBUSY;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2f2c56bf9122..a7a0f14a78d1 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -602,7 +602,8 @@ int iris_venc_start_cmd(struct iris_inst *inst)
 			clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
 		}
 	} else {
-		dev_err(inst->core->dev, "start called before receiving last_flag\n");
+		dev_err(inst->core->dev, "start before last buffer (sub-state %#x)\n",
+			inst->sub_state);
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
 		return -EBUSY;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d..80f0a56712bf 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -168,7 +168,7 @@ int iris_open(struct file *filp)
 
 	ret = iris_core_init(core);
 	if (ret) {
-		dev_err(core->dev, "core init failed\n");
+		dev_err(core->dev, "core init failed: %d\n", ret);
 		pm_runtime_put_sync(core->dev);
 		return ret;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index c3b760730c98..cd22534c0904 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -17,14 +17,12 @@
 #define NOC_HALT				BIT(0)
 #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
 
-static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
+static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core,
+					  u32 *power_status)
 {
-	u32 value, pwr_status;
+	*power_status = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
 
-	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
-	pwr_status = value & BIT(1);
-
-	return pwr_status ? false : true;
+	return !(*power_status & BIT(1));
 }
 
 static void iris_vpu3_power_off_hardware(struct iris_core *core)
@@ -32,10 +30,11 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	u32 reg_val = 0, value, i;
 	int ret;
 
-	if (iris_vpu3x_hw_power_collapsed(core))
+	if (iris_vpu3x_hw_power_collapsed(core, &value))
 		goto disable_power;
 
-	dev_err(core->dev, "video hw is power on\n");
+	dev_err(core->dev, "video hardware still powered on (status %#x)\n",
+		value);
 
 	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
 	if (value)
@@ -78,10 +77,11 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
 	u32 count = 0;
 	int ret;
 
-	if (iris_vpu3x_hw_power_collapsed(core))
+	if (iris_vpu3x_hw_power_collapsed(core, &value))
 		goto disable_power;
 
-	dev_err(core->dev, "video hw is power on\n");
+	dev_err(core->dev, "video hardware still powered on (status %#x)\n",
+		value);
 
 	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
 	if (value)
@@ -116,7 +116,8 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
 	} while (++count < 1000);
 
 	if (!handshake_done && handshake_busy)
-		dev_err(core->dev, "LPI handshake timeout\n");
+		dev_err(core->dev, "LPI handshake timeout (status %#x)\n",
+			value);
 
 	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
 				 reg_val, reg_val & BIT(0), 200, 2000);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 90ccdc0d2a07..0369f2497f76 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -117,7 +117,8 @@ static void iris_vpu4x_power_off_apv(struct iris_core *core)
 	} while (++count < 1000);
 
 	if (!handshake_done && handshake_busy)
-		dev_err(core->dev, "LPI handshake timeout\n");
+		dev_err(core->dev, "APV LPI handshake timeout (status %#x)\n",
+			value);
 
 	writel(0x080200, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
 	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
@@ -314,7 +315,8 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	} while (++count < 1000);
 
 	if (!handshake_done && handshake_busy)
-		dev_err(core->dev, "LPI handshake timeout\n");
+		dev_err(core->dev, "hardware LPI handshake timeout (status %#x)\n",
+			value);
 
 	writel(MVP_NOC_RESET_REQ_MASK, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
 	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..4a56856a8df5 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -83,7 +83,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
 		if ((ctrl_status & CTRL_ERROR_STATUS__M) == 0x4) {
-			dev_err(core->dev, "invalid setting for uc_region\n");
+			dev_err(core->dev, "invalid UC region setting (CTRL_STATUS %#x)\n",
+				ctrl_status);
 			return -EINVAL;
 		}
 
@@ -92,7 +93,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	}
 
 	if (count >= max_tries) {
-		dev_err(core->dev, "error booting up iris firmware\n");
+		dev_err(core->dev, "firmware boot timed out (CTRL_STATUS %#x)\n",
+			ctrl_status);
 		return -ETIME;
 	}
 
@@ -128,7 +130,8 @@ int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 
 	if (intr_status & wd_intr_mask) {
-		dev_err(core->dev, "received watchdog interrupt\n");
+		dev_err(core->dev, "received watchdog interrupt (status %#x)\n",
+			intr_status);
 		return -ETIME;
 	}
 
@@ -172,7 +175,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
 	ctrl_status = readl(core->reg_base + CTRL_STATUS);
 	wfi_status = readl(core->reg_base + WRAPPER_TZ_CPU_STATUS);
 	wfi_status &= BIT(0);
-	dev_err(core->dev, "skip power collapse, wfi=%#x, idle=%#x, pcr=%#x, ctrl=%#x)\n",
+	dev_err(core->dev, "skip power collapse (wfi=%#x, idle=%#x, pcr=%#x, ctrl=%#x)\n",
 		wfi_status, idle_status, pc_ready, ctrl_status);
 
 	return -EAGAIN;
@@ -365,7 +368,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 	} while (++count < 1000);
 
 	if (!handshake_done && handshake_busy)
-		dev_err(core->dev, "LPI handshake timeout\n");
+		dev_err(core->dev, "LPI handshake timeout (status %#x)\n", val);
 
 	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
 				 val, val & BIT(0), 200, 2000);
@@ -530,7 +533,7 @@ int iris_vpu_power_on(struct iris_core *core)
 err_unvote_icc:
 	iris_unset_icc_bw(core);
 err:
-	dev_err(core->dev, "power on failed\n");
+	dev_err(core->dev, "power on failed: %d\n", ret);
 
 	return ret;
 }

-- 
2.43.0

