Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529198;
	b=dXSN4R0cEA62bRdmymhVXvMrm4GuX5YTcBTk4g3CX7f33B0eKaafrA9PwcH7sKzhIVPw
	 eKDf+kmE6xMpVZkv76vTUtQHEAyX/5KZax4wo8tji8CJh1+1oOlhYi0IT8Wj9WGX358xv
	 odiXxb8HIlD4nPtesGio1wD3Voo0ZsMw+fODWipHyHBSVd3y1XFtmRJx+V5GGdeVhuFXU
	 q3RG5IWQIvn/ltu9nb1e57ECc+V6vPHJsJVb8+oqN4h4GBIUizFAlvUSP0UdX7FArJNWF
	 hDvIpoVX5FsvqO50obPEFxoDoizdVQf1jqMmxbdtPE+p/RojCa2VKUPXcdY34WTpcpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SzV5+z/r8UMr39IPMHzKFVdGjgJGBmTzawGLO6TTG1M=;
	b=vkrWz82KbJsWSsx2VvrZ07LL8eSa3/RGyrxPLeqtApos7Z3ENzkDxQNzlq7KUt+Sfdl6
	 XHwMyvUBvuhH4vPALE4Zdr8c4A/Pwmhl5gWyqhRouZtNzl//SI2ezQYnYYwmmZw1M+hkU
	 rNirO/7jWJLBnFA2SJpCHYRYbI7i0cKbZe4+PBCfRfdMxowaCQn7wg4bNrTbg3lNwTyvy
	 aOrzTD10QeS+la4lZAGpGaKQQWOhCPjrbMajzztsTWvIYxevGAnbvpfSFuM226Vu4jecW
	 g2Z7se4Zz64SUg5CTIOJ+hgcpLEuSCdanczdTBK0yAmnqhaAoNJPtGRA1k9hy+1iTMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB7eOqrC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z7jw5Rjz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7806606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7806606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB7eOqrC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z7jw5Rjz
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KI7kxn3499176
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SzV5+z/r8UMr39IPMHzKFVdGjgJGBmTzawG
	LO6TTG1M=; b=DB7eOqrC2guZxfoLr+G4n4ZtWrYGktNhRE3vBY0pF5hPHkvrWmF
	34qH7x0l9xlRKR6LodQf6rhIUdPOemOatoAlminkuHOtnGzT14r4oY45IIKGWbX6
	mtA9wx0pNynHMBIXAutXhzfCuehup8KBY3fdNQ+Nr2uPIitvwSlI7rSCd88yS10Z
	rzKW3xQNqX0We7vF7ma2//QedQ005HlGR8j0E/QbBoCvhYqHyW+RtKq7//pknE+w
	wZXfwRloKhcadRTq4N9jpJfP0gg9g7jXCU9ryxipK/p3Mqe1gnNio/IBl9R+7MJO
	eKMnbApzfIf/NkZLMhRfKSihfo/Bfo1eNCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabghc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:46:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso16373985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529196; x=1793133996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzV5+z/r8UMr39IPMHzKFVdGjgJGBmTzawGLO6TTG1M=;
        b=Z7jw5RjzGVKrvXH8QpFELrryn+h+kXwAUS5+gc0poBLNpCXAzqhiyM+D9ESGzuZXxu
         99mP1qkAkayVn9IqGaPqx/vVZtBQmY0RIqaqJm9XvWYQuzwfUuyPxYvBCjiQGG3p9ZTR
         31dGiNcQyWSZBX5qh0GTE0Ata4XyaFz6591YHFvoxZjpA8WCnJYKPztwXL3WvxuSTIhF
         aO4vxWEP2OQx+N/J9bJESKZ/ZPEKjvDgzoCrSVyj9YepO79IyfzPLQmjw+D90813ja1h
         VoyZh63WOAoL6tVMi2Q83bFt8vhcpNtOZlLJhdXIU2WDpq/NR3C/P07P/Kbhv5uygm7p
         hk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529196; x=1793133996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzV5+z/r8UMr39IPMHzKFVdGjgJGBmTzawGLO6TTG1M=;
        b=oZxhkL2+uW7KZQe2nCIzpt76oVu1vDbokTObZo6I5kS8odQwTs9fFyOl2t5MfL7HID
         x7gvY748k08+FF9orkvL0ouoGMHOyoI4+RafOmo0dJvVVzpAfDRoKtxS40DTbxMo9CVx
         zUx8oW/2SV28Ecyjs97PBsHxhmtYEcoVnFUn/xUymFetM5Y/BwzSZcNwGMZSZMOMUnUV
         eJdoy8jPfwjobpyxj3NGNsSU28SZk55CGoKRgQOMhcBuYRrteagIoMfkiyrlih3T/6IZ
         YHcjh9np675wBfPOgFw65J0B1fhr8V5m05AHKt3cDkWoT972Mm3dns3wqNJ+7L3OpL4Q
         vNwA==
X-Forwarded-Encrypted: i=1; AKwUvBwYcA7pUaH1SpF7FomyhWxY5ICsbpACLvs5gH6Nq/JPA66dSKd0jfk51uJZsu6XkE5cp6OMxLx2lXxvU/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9naFQcKpd9ElEKOolQ1hdwt0TY5wR1tW7N92QtZ8EeA+5l0q2
	iBTolGkKGd+1DlWOMmvEEu0l5BfT3G2SkGRsRYQ/g66KW/Xr0ZvbaV/5I/b9gZMONXFFgGzTeZA
	Odu8lgNr/Lm9o2dUauj0DiidGwX3086/E1FGBtYv+Xazbd5YKOj8/b051kMm+Yfer2jA=
X-Gm-Gg: AYBFou04swBxGqHNDl00e2kqI/KdN1LEjntJhM+1/cNChWmsW+7492cJ+OGHSSOYI4e
	nhToHuH0AX1MNbheEYzVE5obB4SXPRPeuPc6obF1V6oSMXgjChojMBTP0JK64yf5Ft1KhfYa68P
	l5TWiqvw8GfEbldN6nqvHbIpvgtOc+joKv1d2IEh++yyrgEL5AQxUUoUsZ1Kq8LbLF3FgNa6eJ1
	7W4RVN1xEw+8pwUPyu8ANBEv/F+kBToTyp1SC9EObWcBmjkij91iDliQFAamrxDQRPZDWoQplTi
	/TeoZX+xST4nQ2t3Cs6HVoAg/PFdZpB3vHuKI9DC5moCm2XV5tdO/+sjP6ked85VehbI0Pit9Jz
	GH0ljljG7GyX8crW0XOB5JYKltd6vWdf+GJ0vhV32prOa
X-Received: by 2002:a05:620a:8006:b0:93e:bcbf:88 with SMTP id af79cd13be357-93f57ecf44cmr75479485a.4.1792529196120;
        Tue, 20 Oct 2026 13:46:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8006:b0:93e:bcbf:88 with SMTP id af79cd13be357-93f57ecf44cmr75474585a.4.1792529195574;
        Tue, 20 Oct 2026 13:46:35 -0700 (PDT)
Received: from trex (50.red-81-37-172.dynamicip.rima-tde.net. [81.37.172.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd59482sm4536935e9.4.2026.10.20.13.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:46:34 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
        stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: qcom: iris: fix PAS ID passed to set_remote_state
Date: Tue, 20 Oct 2026 22:45:57 +0200
Message-ID: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXzERC8WOxALLg
 20yvef8fgYVmS3hBv6Erk1ft5+Qa4GRVV80FlNy2rROKOiyGyRsVFF6IPItS4fh7z3dcKCCe6Bq
 TUTRpnJOBDjsc5cQguE8RL7hEEeQYdY=
X-Proofpoint-ORIG-GUID: Nnnb4PheErhg0974nsch6fuunpJyNdxp
X-Proofpoint-GUID: Nnnb4PheErhg0974nsch6fuunpJyNdxp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX7sy74wmoiaf+
 bE1tpIwNOhgOtUBD3lZYpyCKuJl82gOPP9j4D0bt6AaCWkiLn8L9HCY90XE9Ek7ugU7fuQ0WZ4z
 W6mNVKPMozh+LpQFOnf1PNaSGy1vqScyGkt6xSHv3OjeTUVpmbXA59rDSWeS2Z0YxRj9g7Ou/Ep
 NqROOc1DgifI2NKD5fO8je5YQc8Xh9CioMuXttZs+DJ078IlFVJjyT11iAZK6TWiOuguy9k6n1z
 3hmEGabCJzsNA3LYPUjTiSiv+fLRGlXxMaDcBsxMNWRr/uLPaW3q6pnIgpjMnjh7ClpVCh+C5Q5
 bduGfba6xd5Xci2XFrduOQ7ocdPo6AOaBqmyGpx4hDEHUsiZvEIaOpPX/w1S6LmEdvi6MC1Oq1Z
 a9vI5qz594YI7zkNz5GDLiYZVHK8Ybh7k988rq6RVDUyGG/8hWfxsa2jahKysXiI5XLGdJ63IeM
 grku6HkxXoOjtYks27g==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad7d32d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=VbO86HPdXvN82gCvB8O6pw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=mLYu_wAyvM-e7FxXmqQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

A PAS ID of 0 does not identify the iris peripheral, so the
remote-state update never reached it. Pass IRIS_PAS_ID, as every
other PAS call in this file does.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21cdf1c39835..6ff5eefff391 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -195,5 +195,5 @@ int iris_fw_unload(struct iris_core *core)
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
 {
-	return qcom_pas_set_remote_state(resume, 0);
+	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
 }
-- 
2.54.0

