Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA10D456292
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545418; cv=none; b=PEqPxaDPBx4kI/4P9R3iTly+KuCSgJ+S3k3tkL4qr74tirmgMD+XHkQDw0MUAVVtIKMQ2bvt0Tzjz/+mocFwokKTywV7NP61gVRemZ5u7p3ALUw+dVrhVlpxD9llP12LNP2D4hTLar5xt8APkuaiNvUEMVDRkosMVbyu/AVUNcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545418; c=relaxed/simple;
	bh=HbIfItTOo8OE4am6c9ivPQcztfXU6kk/9gwLzj89GuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o8JsuIkd3FI/XG7PRLLnWttUcb6O7biUkfEmwBiKwWYk18ouVP80CbPnUghE9jogaElXQaoUmnmuTKexI7hNLGlXwyXBgypaSh8BU0eR8fO2KB9lOSiN/n+Zpc1l2xaRXOG5jx3FsWtn8xLEqsLF8ZZRaGEIXC9trUWgYL+YROQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6FiNCSQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DvIl4Bl4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6FiNCSQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DvIl4Bl4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68mdV2429356
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NsEV4uVA6aessXGwFZ9cUl
	Nd6oEQR/Eydv18K2tX5rA=; b=k6FiNCSQo8PYZdB1mUws4tI/J6YsjAo8uHO8n5
	yUITh8o7+zc3wdYyWRNoFno9wLja5Vp9DjLUglaKzw1utmXvLovJxTDXO+VW68P4
	M+FktSOmsPMr+BCqDkXP4ztNt1D4rWW7Kio++8x/J9wksKkraoiz3e6IcpFn9/iO
	vBI8JHu1wadL1zdJD8+5/fUxerifpEa/wokOUJx+c+zguxOBV/3OO8FfkVzja9mC
	KoxIvagHRyFvnJjCUs3Nogf6t/gytNEdfbuM5r1XPlCm6LxDsBYlgmmau6gRswtR
	pKlVA9QeIU+mKmk771bFhU8mvdndL1pTh6Azom1kjsWGVlEw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfhqnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:56:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so6508743a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789545404; x=1790150204; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NsEV4uVA6aessXGwFZ9cUlNd6oEQR/Eydv18K2tX5rA=;
        b=DvIl4Bl4T2DWjFlJE6AVfE3N4cgLMVtePluJiWQy3HOlRP3dLR2pIpHTRaPXccytn8
         DVuVPcYTHaABZuztfDnsRHecHioXdPZ7N0ajb6sX9vApRO6ywAg90IYc3ljG/YloKJwQ
         V7lFAQFLJKloTXdo4Ulas1Ku3mq/B/51EYYLVmNrDG7K7oWkaR/7HkCH5GP5BxnDadRI
         k15GQ2jNf7eNzFFWSsqFmtJWhI1ycV5v2qs6PW8/EXVAZ3ljUWTX8GRtsVAj/CK/QWZE
         I0mdX4kyat2V7KZNSKIV/ONcVVLjgvXsiR02JNPig/LzFyqI9iRb8dFUXnyB+9rZ3vt1
         pZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545404; x=1790150204;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NsEV4uVA6aessXGwFZ9cUlNd6oEQR/Eydv18K2tX5rA=;
        b=KU8B4tiZ/w+5Va/q7I177XdICwd66h7Ryrx6C2TEYZjXlj2tvq26Bzz8qJoiXomydY
         hezmzMLRBvkbcGUrrjBotQ3g22a5G4oZhxpwT1FdGgxIA8iycsXe6akPeyT1Oo1hVJxn
         VpapPlNAtBs1s8/KnczcDJUmcgI36KIzMaoqL16FeQ04Sg9bTk0eZl5gGEMxZzAyL4hD
         1+xFkUdh4b84WCgbslufSeF7Uz2hHtpossXMPHIjC1jDk5lJBK9+7mVpk2aTO9M7Cxb4
         JkonORZu4NnT9fCks0bv3eolLfpx60kaxHb1efTFD5gKx0kN3oysC4uSto43kyL1n1YU
         YT7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy2RZO+Pdo8QR6dowCtCg0Zj0ylVcueWtF+jMs49HC5wwnTZlq7oeSVc4eOE9urBORkvlK/frDI8kytrm4=@vger.kernel.org
X-Gm-Message-State: AFuF++nC+DNivY19G58ReIIPS/dx/Lhw0yvdjG2/MeZ5cPEnOEgkzmVP
	fx0W+CIddzZwjhqJNWDU7WhXGZT4uShrAOGrS5Phh6Wa2ntNjNQnD1+2ZWOg/tONB+p8lEFUuZN
	J4TEefgTObm+Th3VAMGR1s+E9iPrvoM/p+lce4vw6pK1XyL844dVeLfdMdRpiNqmpa2c=
X-Gm-Gg: AYBFou2RiNtawspmgcTZTYJuvLfFdmX6BsvA7PRB9cRVvT1gPkO71S95qjr6q8NLi5N
	Xshjzs/MpetHoTBFtCDGk1Vj1orYPUOKh7L+8TBPUYJACxCkH1l1opjfUQGJC59VOPVkKO1m0LS
	uCrkdaa60tA3TZmBqEqUVZw0ATVHtW8VLVu5/J9koTiPzqJyN59xYScL4HUcWsApQsVIi2Cqj73
	dHZarDu/i6Su4pV/5rebtTzLrOiAmnaLyni7xc2yqM8w4IFGX87i8CYDfELytb1OrmaPde1Et6T
	4d7AZXaxN7pT7bkatd/k6vpbmsbFx6jZIcWwy+41y6B+m8f16rNRmpOA3q9pZyIRyNlTToclBHi
	IEy6AgdEap0pAfLYkIM62NJPcLUG0DZjFy1ydtA==
X-Received: by 2002:a17:90b:2885:b0:39d:f130:8f13 with SMTP id 98e67ed59e1d1-39e1e4d3357mr4052783a91.21.1789545404279;
        Wed, 16 Sep 2026 00:56:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2885:b0:39d:f130:8f13 with SMTP id 98e67ed59e1d1-39e1e4d3357mr4052719a91.21.1789545403713;
        Wed, 16 Sep 2026 00:56:43 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d13cb7sm4688714c88.7.2026.09.16.00.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:56:43 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:26:36 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Fix missing PDM subdev cleanup
 on probe failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-q6v5_mss_pdm_subdev_unwind_upstream-v1-1-ea6575aa42db@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALNLqmoC/yXNyw7CIBCF4VdpZi0JNC1eXsUYAmXUMQGRKWjS9
 N2LuvwW5z8LMGZChlO3QMZKTM/YoHYdTHcbbyjIN0Mvey2PSgs3iJeuownMJvlguDiP1ZT4puh
 NSTxntEFIZQ9u0HtE5aHFUsYrfX5H58vfbfnAaf7WYV03ysbaT4oAAAA=
X-Change-ID: 20260916-b4-q6v5_mss_pdm_subdev_unwind_upstream-01a8b467ee1d
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789545400; l=1514;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=HbIfItTOo8OE4am6c9ivPQcztfXU6kk/9gwLzj89GuA=;
 b=SBvixAsrejmThHZXVm27H8cvkn3KKWNuOT3UtPaGhGtqKB3jJbqpeAu9F0gkf/CTa4bZpNvnK
 oPIn0cNrh+8DhkUUFGzUZVplKa8ccpg9IvO7f4uk9k9MbxdijPmDymv
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa4bbd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nKoQMm1Mf4hYkZarmuoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEwMSBTYWx0ZWRfX3Z79/luLU7EV
 WBGkmhqphhgyLamaaG/nxUTpguflFdSmC5k+cMkKsc4A+/fR9mD6KAdg090wztl3hgoyE7fypvv
 nTgV26pAqnZ5UA0WcwtOF61X5kr0f/vVZ0OzQiyqlWLiWt5FP1C/X7mlq9eksrM9HexmAa97cpH
 0wai52nv/5+YSWz0zv3WUS9A5kEK9Qcc9By806A7r6Yncuq+8zjw4s0dFiAHiwmb75VR1JpCghg
 SY9ku+eEPG7PXBXRZOIep3X3qJ72xutt4LuCF6Or+n+CsFNHoKG6A5+P3puOqcCdhmsbIi0UZa4
 x/HB7g0xgQZxOeJlYYc0YSB8WnaKGYvoAnoVfprHUrJGsIZIOk+l+voI6LfXHzcgX9X0zCZgC/U
 7ajd9eBvB+0QlmpibqbYucYQIYRs9GaNQVmwC6N4QXDhoeQj1GzTsNbhMYMKGUJ2lpMROTmjx50
 8cHj0X4U17eYrN3zecQ==
X-Proofpoint-GUID: pzW8e1X-H7QLDmMfTjvuGLRz33MyXRO3
X-Proofpoint-ORIG-GUID: pzW8e1X-H7QLDmMfTjvuGLRz33MyXRO3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEwMSBTYWx0ZWRfX5v7cyX7Hvdua
 payM0jMAIuWVzI4zbCRX1Mg0+QZn8YiNfd+T6PILFF3nln5vW8HLjDbyo5PdbWQrBvG4RfHtgfv
 zsf5O3Pv2eCFxLmvPR1Za4w+w5IhF1o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160101

q6v5_probe() calls qcom_add_pdm_subdev() but the remove_subdevs:
error unwind never calls qcom_remove_pdm_subdev(). If
qcom_add_sysmon_subdev() or rproc_add() subsequently fails, the PDM
subdev remains registered in the rproc subdev list.

The three sibling drivers (qcom_q6v5_adsp.c, qcom_q6v5_pas.c,
qcom_q6v5_wcss.c) all correctly call qcom_remove_pdm_subdev() in
their probe error unwind. Add the missing call after
qcom_remove_ssr_subdev(), in reverse order of registration.

Fixes: 5b9f51b200dc ("remoteproc: qcom: enable in-kernel PD mapper")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..1574e26aeaab 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2222,6 +2222,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qcom_remove_sysmon_subdev(qproc->sysmon);
 remove_subdevs:
 	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
+	qcom_remove_pdm_subdev(rproc, &qproc->pdm_subdev);
 	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
 detach_proxy_pds:

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-b4-q6v5_mss_pdm_subdev_unwind_upstream-01a8b467ee1d

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

