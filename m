Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC434DF4C2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451646; cv=none; b=mVdQIM0reJ0XkiECcevOayX99KYiE+aNItq9k4N34vTumddz4aWIajabnRcLrZeClsi0Om22YIa/7WJbhmyEoYUzs/gRfTPcCegp4rKzQKFNacAEVwFmBT73YwhFrln+PbZFZIR6zrMUL+7RDVRZ//pKTeaDUG7sZ9PsqV2akwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451646; c=relaxed/simple;
	bh=jXCCj/bQhP5fW7MLDqzm75BnmROw7pKkSIkICqJG7PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bN8jbAL1M6lV5l1ApLtRaNXkgOT0XvUjyy04BlodD2p2COdk36bXV5JLf6a4fl3rnKCHzi0ZdC3Yj9kL56hRnKmucCbTMWLcvMsVOyvMjKFTzpS0ywL/tAFRWtbweiTgyWz5/OM78iXLKmYw61ey8UZmVWPVE6ezn49daENsW4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOE9o1GX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+UoruRS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOE9o1GX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+UoruRS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G34fj3958092
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 16:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6zwWKPqIMuJyW8MrQ/3doI
	2w0uf0NXevVdzDlnZBlSA=; b=OOE9o1GXyuEUNr1/67OW/9e6vmLZI7l/cinOc3
	q0IGABvgBBbfBNLULJkjlHJtXVYdXYTyYuJsU/tsmy3r5jQrPxyBlPRO9NTd88nO
	/rPehc9XE5dY5Bz/G/JMZuRYxQ0zoA0wm+M/2n8Vq+Q05D048+Or6dE7f6iQFwsp
	oND6K3SHzyIxFla0C467wsuOGfg3jEefl7l2BJbnXbtl2SM/VCSM4Sng66TAzvRh
	PK2oJiUNQvin7zuSDoydijf1u6k3XFG9Ma+BHvO2sWiKF7eALLb6kGoeJaEMIJmC
	EmtkIFINczm/E/9NyNIM8Risdd8I3VMl8FZkDm4FAjLTvqsg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d11wba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:07:23 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9ee20bde0so2996601a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788451643; x=1789056443; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6zwWKPqIMuJyW8MrQ/3doI2w0uf0NXevVdzDlnZBlSA=;
        b=I+UoruRScgUCGDnnoWms5240W3+9FYsB0pteg1UUIy+zasYzHZpc+b6cXp9T4TiF90
         bbLolAY7Hs7pO0PadZtUCQ1mToOgX6AZH+ARpGOFQvhq2ljuQrgzJAU4fXy5vEmkNPgj
         /qucntD2lEeLkRU1DqSy4tbVO7timdeo2qLXNuPOCMuDSHt1hpYCOYswmgMi37aKyM6V
         G9cw/qT19TvXIGKaOlcXsQ1eIYB8F2ZiyRpa2dx4qauIa97dHimCHfcbyy1K8h42oZDJ
         gx5cKDxmASlaYkBE/qGbyhnxcMDbdpUnALDjfj30Eq0YdRZEZCf17kzLDlw6ajLo/RGO
         0+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451643; x=1789056443;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6zwWKPqIMuJyW8MrQ/3doI2w0uf0NXevVdzDlnZBlSA=;
        b=i/3KqWKPG2Irjmony0gRyvvgwPMUQLIYZeCYI4MlH6cziAElluUSZcTGn1sqi2Vvls
         gluNr6WIK1VFV0Kt/vOeVVp6BfBHMjTa+v5b9X2Xm0j0ZyRnYvy+yzkcexF19mXmnlHT
         HegVgdDVvQyfaOSvmYkqTDXydLssHPBg6oLOH6JPd8mUCnMMezG48DwjPoCfU4tC42/m
         MSIOFmMJkybsAx5YV/Yq10KkYskHpNLK09uleXT9mdHsfrZp+aT6Lt91up6d4ozbrZNg
         5y0lBpaNksQPsaXWBUtu/YMU3kgpXqmFgexhAQP++i9CFgbu9dMkyzwcrVZjd4/xj5vm
         uvGA==
X-Forwarded-Encrypted: i=1; AKwUvBw+CLWfjnxmXFDL27YGm+wqMR8O0IU3vZs9B7BU4t4tHaqPp/HpVDfNp4Xq5Yi6O1fvcznRVIALkws3EFY=@vger.kernel.org
X-Gm-Message-State: AFuF++kieUSxWtJ2aIoj3UqzIWMzgkjXFJCFo+Vbwa20dGkVC4bw0MHe
	KK1efRUCn5vYDE/wuqeeyjd2s4sN8DvJh10ybBvBb2UtLJDqU8BJ8ZMhdhU6CP9PiOvfT/DEmt5
	5deZhAZEurAvCyE8McUWIDj64jv2k50pr8VbCnFQ609kHD3VifNKplSVcfwCUmE55vnw=
X-Gm-Gg: AYBFou1EAMVhKwx+vS7sVAGwQZjzufsvMckVU5udgMt9/o3jvT/K6dqfs85m+h1F044
	CfZJW/VdZxHaN94IfUUmeh1r3G0ViEoeVmIbtXBQKiz7cFzIuFnTvDxnndoqaT2JC59ISvrdqZm
	q+9rXRvz7RhGLDRgt570e+MYSnJPyvScRnyrJ5TL+EHm01wWryHRcBFi2+P/u26Vqu9RN8pYHVS
	WVvKixJdci5GGDpkiiF98D8pNbKHpX+VOWnV7PhxuTPJX7sYrpqEvA4DQmTzwG3euSTZ1srYurJ
	lG5iy/5MwtYp8JQmydnk/nxW3ALv/XsDdvDrbGp4uSvqMghtVUvbmTtBBHlg6pbcEHJfDAiWKmV
	4up93cMh3Tj7yDSOf31w38Wr0atOQ61GdmV9aww==
X-Received: by 2002:a05:6830:6b04:b0:7f8:4ebe:2854 with SMTP id 46e09a7af769-7f84ebe297emr9395494a34.4.1788451642819;
        Thu, 03 Sep 2026 09:07:22 -0700 (PDT)
X-Received: by 2002:a05:6830:6b04:b0:7f8:4ebe:2854 with SMTP id 46e09a7af769-7f84ebe297emr9395434a34.4.1788451642251;
        Thu, 03 Sep 2026 09:07:22 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6daa20bsm319118a34.14.2026.09.03.09.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:07:21 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 21:37:14 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Fix qmp reference leak on probe
 failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-b4-q6v5_mss_probe_deinit_upstream-v1-1-c40a6d317be4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADGbmWoC/yXNQQ7CIBBA0as0s5YEsWDqVYwhBaY6JqXI0Mak6
 d1Ldfk2/6/AmAkZbs0KGRdimmLF+dSAf/XxiYJCNSipjOzkRbhWfMyi7chsU54c2oAUqdg5ccn
 Yj6JTw9UE1Lr1HmonZRzo+3vcH3/z7N7oyxGGbdsBMTJTLoUAAAA=
X-Change-ID: 20260903-b4-q6v5_mss_probe_deinit_upstream-92f76de554cc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788451638; l=1712;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=jXCCj/bQhP5fW7MLDqzm75BnmROw7pKkSIkICqJG7PU=;
 b=8f7qDFqEYaOd0T11ptNz5B4pDq6p6HS81mlDguz8t3ODm2LGHeUmpBWH6vvcRsERQwvVIXGEM
 IVVKiHXPdDKA0rCKBsgV9uBlnpYSCehvxt6FwU/E0uUusMonPlsCm8x
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE0MCBTYWx0ZWRfXy00E1oTBfiJV
 s8nE7zHT0y5YS8/+u+QD+jm13yUePY2C1bvorBiKgIThS/8MOZjWkXnpVZcabF8ly48Du44b/I4
 AKpiPeRMoUUPKwSBXaJiRLUlLfIY+oSrU/8TStijFm6NN1njwN2RThovi4FCu63QbLmhk0TxvGI
 ELF5pz/sMrZcqSLT1bQg2EHHiiL3a3xl5MWlIBBj80A0NAWHZjvPyf/jBHNlLhzlq9lC2p/yNTV
 Ao4TsAQWEuZKNdW4n8Hr0Clw5PBgRUBEBxKwDskSwMcWLA1zYNcy82/l7U/y5RJlS+1G1MlGxYh
 1N6n0AOrd8cd2i1NjmeYp8OYaeXnLlzR5I8xFRvybd6qM8qziDTgPS+vx3sNOB8HMsWssN2ai6C
 bmSxEd7JT08O8CY5BHr/K3/6Stc7wcdEMUZQdAJ62gqXeLa7p+GmT50ENEpOjga8fVX31eI1ruV
 J+nDXnQ7eiiUIs//oVw==
X-Proofpoint-ORIG-GUID: mMd0q6RfbPbXGilTfL_djY5QtfQ8zv0L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE0MCBTYWx0ZWRfXz5Kr9P6r3VLx
 DdLMDg5Dflu5EOZc51A3zucMqgwtSdw/aOYR/JZdDFoXEMx5LlWQistzVkoJ7e6Hnegz7mDSYEs
 VcBVjBAG9G8r9rJObOaFCi8plyrZ9pU=
X-Proofpoint-GUID: mMd0q6RfbPbXGilTfL_djY5QtfQ8zv0L
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a999b3b cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_IghOn1l7u8uKlrmoJ0A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030140

q6v5_probe() calls qcom_q6v5_init(), which acquires a qmp device
reference via qmp_get(). If qcom_add_sysmon_subdev() or rproc_add()
subsequently fails, the error unwind falls through remove_subdevs:
without ever calling qcom_q6v5_deinit(), leaking the reference.

The three sibling drivers (qcom_q6v5_adsp.c, qcom_q6v5_pas.c,
qcom_q6v5_wcss.c) all correctly call qcom_q6v5_deinit() in their
probe error unwind. Add the missing call at the end of
remove_subdevs:, right before detach_proxy_pds:, so
qcom_q6v5_init()'s own failure path (which jumps directly to
detach_proxy_pds:) still correctly skips it.

Fixes: c1fe10d238c0 ("remoteproc: qcom: q6v5: Use qmp_send to update co-processor load state")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..387538ead2df 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2224,6 +2224,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
 	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
+	qcom_q6v5_deinit(&qproc->q6v5);
 detach_proxy_pds:
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
 

---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260903-b4-q6v5_mss_probe_deinit_upstream-92f76de554cc

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

