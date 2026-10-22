Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680874;
	b=cggG4sxUO76chXW+9egsK/1/yCGfLv4hRopQECLj6iK+R1CXsNrPWl7+O6v8fyygv9Ph
	 0PGkgnZ7Wb+VvRFCMEdWqhE4ifEEcPXsuU6p3uT935yhDWtA8cW9BYasZCPufohLwsCHB
	 eNs5N78oLzQBvRNIr62snw82fDVisHICASdHIR3yzFMc/d56yGxF5zfZRDDaJk2szgmCY
	 yUKzA5+wwT8jlLCvGPSKIXzmHc6oApTa3vFUt5HoNWw8BpZO4cDnNl2tHenWe6zo7+i52
	 a8ClPRGUWuP49RoYlLeWNG4CyvH7FSvvwGPoRwnJ6+zRTJM+M7Q3xzRDcEWL9APPKHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LeyVFsqCqVWi/yTiZu/t1rp7LlLuz+7A3YoONaVMHFI=;
	b=q+uw6ZSGO2I9Rdhf0wR5ieuY2hEhr1fBUF21sq4v1SER3LYAKwRS3saE722owY/9PJEN
	 jYV1FPCuM0wyWjXC9K63Z4Fw3ikbHmqbRXyZRbK6vO7wrx/xhSmN2tm5gAB1FuECj3Ga+
	 s8XSUJ/4Oh7Se/zpQvdXnf7uQUoJuPka5s8nEtV9fjjoYkgkGQAWh/Fsa1sZGPqbN8GDP
	 nJIrviGdI8qEHKsRdRFZYP0DyWGXCd0HlfcJX42VUnzKlkbqXurJqEmKH9RNcutkCwLr0
	 LWCBZcJK9fEAnxTgcmFmi1Lv22lNLc1MzO97Gh8P1dHxuNIIN1M70wAvBE1Xq9hZfqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FNu/nGsG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IBhFJD+R;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F6D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F6D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FNu/nGsG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IBhFJD+R
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFTH0376549
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LeyVFsqCqVWi/yTiZu/t1r
	p7LlLuz+7A3YoONaVMHFI=; b=FNu/nGsGUGijxpOunvpAFg313nntuufV14mIIT
	limhirkmXmrBmRiwMvw88X0yLt8F3mvnvnMn7CGMJIS+DqODnB4qclY7195jk+Nd
	pX2tCdXY9juGiSVl9+xBVskQIpSN3mF0GCoHK3lhc1S/1gwlf10hpmcJXAA7KWjK
	kpcVpTskb1YQ9gzGVFlCRERPzQ69inOCwCpzrjTGZ5HxPF0zxyon0x69U0Wx6UnF
	5FkR0UAgWNCVxTdyeqvuuRl3ItquW0v6dNmHjNsBv5uo0cxj9OyF6ozYDeWf2fBd
	D2mJrINo9nwDH7SaTv+YThP1Jtm57LzImeRMatAIFS/A8aEA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bm6su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:54:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so4418206eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792680871; x=1793285671; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LeyVFsqCqVWi/yTiZu/t1rp7LlLuz+7A3YoONaVMHFI=;
        b=IBhFJD+RqeqclMEX7pIpqrUS+jJBVwSZCY/LFxNaf5i1dACGbFRdSmyu5zoCLvZzSx
         W0mECvPoaIvUm3VEKHE/QzOfXFuuF2PuzjG0oj9hVkqa50/RSfNrqdsDAaXEL7csw17f
         EwTQtyYyXfbdB/Q2Fvt2cGQz8CNOcC/2OSU1y/mfBDVXnP3ucriJH9QrM/dhtvFAtSjj
         tQJJiaZvWiYVjyKXinds5f/Uy0vNUvtevNpfu7kgZmUFydDJZPFOGPOLcy4W6TY5AkdS
         mo3pBw5DHaQoY8+hcLVYFNBjQyHU8jEKarbYTxpt3P+pz0+RVIQvMJ2S8YMwc9PdnDXT
         ZtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680871; x=1793285671;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LeyVFsqCqVWi/yTiZu/t1rp7LlLuz+7A3YoONaVMHFI=;
        b=Whh8AIGzJoJQ4cC6WtxV/6HlBTGwZuMEKu7WajeoOwVnEkdD/MyxtS0dgjgoH1IQAq
         3Bo+lDTvqCr9yocoAFYx1AdSCZI+Z+VHZQLwqvqTJ+zVWiNrXZyGAo5TSmzgXTFv74pZ
         cZ5q2rh5cqBoVEiBp2FJobKYZmHOLnwjF+RW7T5t/0HP+JKKtdTEpTidLP8CNxJKQnwq
         VISktChJc6xZAkDgS+JSi/T/jKbQ2KYCbTRob/0IlDNOs5v61IPjE7dSQf4yePM/Eg19
         KxveBFnwJDk+xJ9ZoqRADB1+A/OqrE9Q/OjnaF4hLtSQQ0Emz/qW986FjWKcX2z+xKcj
         1joQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdFGrpfzeTvvLikzQRdb3k0s65WpyDPI7n2KdDAnkwdGFpEg2Z5YmknGKuS9oDz5H3bmw1ZzyJy0RPiZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsG5ydgeD1dLMnv7NlOOINjI2gfS2aw6qdOvK2za5RpB39ohpa
	SFX/0tI+eZ8UcZ6m8rhDX0BuzEkc8xQly6jx0MiGwU81BLVtbk4A1opCVisZD7p1cLyOs53bnHg
	Nyzv0+yRHrp1eNhMXPwBaDFHLqUed3hP7kJKSHLzO5uBGm57NLdHONbtajlctHFK3HL+LKkjvir
	Q=
X-Gm-Gg: AYBFou08b7z1M55JonfqWEepdJqpDettM0NALWGypJcZpgmV1LJ0PIxsTSZ2Stujeze
	fPb2MDddHvwQ9HpT6uY3ONPpSh7VmCJvktER2Ks8A/uVW9pIh0i2EY/UpE27O30ezXasSBZ3JT2
	ieHW339O4z8eWmzpixVRGio4qiML3vcIrr1rx0y+6WmSDBmyttj/51mqWGQ6ELOTMDfG6JKzTrk
	gJeHL/gDGf0Ypw3yucoqEch2Bi3o75jFrjNwr1bCim1oKfRorNNRHPCQnbx0RjiJjikneTU/Vot
	K6XdnWcKL0HlhLPmS1VDVeltZy8gOZJAdd8Ra/De+0lUAhrEhR8wKl+/N3MqrIU/OaphOvEc7Dx
	wtFQluhHBmFwm9RTER9f0dc2QpMByslOJSMqq
X-Received: by 2002:a05:7301:8615:b0:359:8492:20ff with SMTP id 5a478bee46e88-3674c43a7a8mr6978994eec.12.1792680871407;
        Thu, 22 Oct 2026 07:54:31 -0700 (PDT)
X-Received: by 2002:a05:7301:8615:b0:359:8492:20ff with SMTP id 5a478bee46e88-3674c43a7a8mr6978969eec.12.1792680870900;
        Thu, 22 Oct 2026 07:54:30 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bd2a6sm26250257eec.18.2026.10.22.07.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:54:30 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 20:24:25 +0530
Subject: [PATCH] remoteproc: qcom: pas: Release DTB firmware after load
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
Message-Id: <20261022-b4-qcom_pas_dtb_fw_release-v1-1-d92d84a05544@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKAj2moC/yXM0QqCMBQG4FeRc91gG1OoV4kY2/G3FqW2oyWI7
 +6qy+/mW0mQE4RO1UoZ7yRp6AvMoSK+hf4Kldpisto2RlurolMvHp5+DOLbKfru4zMeCAJ1rNk
 43biawVSCMaNLyy8/X/6WOd7B03ekbdsBhcScl34AAAA=
X-Change-ID: 20261022-b4-qcom_pas_dtb_fw_release-95c140645cec
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792680867; l=1584;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=40dojUEYiTck5avIuh4BZLBGj7u3joSJCzFWspEillw=;
 b=HMYQhkmCsBufTsqpejcDU81i+XJ/9B031qiPCSbjZs8maM+zPlzrmJBFmkfKc+l0CN3jB4U1m
 iGFeS0C3y5/BwCarm9Ozo6DDo2U4cHbU3laE3PXpypjuIp5xiJveJQz
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfX+ebJzpe/BL7H
 4eF7b0kqp8ITca3rOIdL9InmO3ji2qLm9CEi976SV9DFjxGBR48IttKc/PJbeknhdnUXJ7I21u0
 SJZBMpmyb7DNAhWmM400+vPz7osRhWcrpmr9FX/pW0WT03xzz95/fTqXbhM+T8G9Jkw6yhaTexn
 Tvv5fKgIB2imGa0FEH1GuHuGyD7TUzrnrOYqIB5ySyc9MVhlBnz+f3Z7we1R7G5//5jJX/I2MTn
 UYQAls3wuQe6hypNb+tXEQVaDIyIyPMBFXF7A5KcQvwdycNyTy2rMYubGedZoSTgRriR+Opv+rf
 G3PR5SYIxhyLq7ZWRWgBexgbJIMCvf7rMnAhxdnOaJ1UPJOqkFy8JH1AbGd0r+AE6zfQwD6Qv/N
 GcMAt0RtiXlSoF7Q3p5qloAGIiXWGS38IlCkl4simtwWsr9EUgllklDKpxDmrykuMjYlyXOdR/d
 4XA+6+YIB8z/aHevRHQ==
X-Proofpoint-GUID: -BGHPbptYK8qXTX-oRvGeVBJbHhWDsZI
X-Proofpoint-ORIG-GUID: -BGHPbptYK8qXTX-oRvGeVBJbHhWDsZI
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ada23a8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y1IhKJFcC3I6eYhxwIsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfXy6aGjTICBXqo
 f/JYczGd8ElQdDQFvV7tHwW6oG1WShNcyAskMl5y0PdbokKWNUimr9box8eHnvyS4gkPNyq4tXH
 5CqJvAEmkxcACDvGdXR6J905jzBy2FI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220059

qcom_pas_load() releases the DTB firmware only when
qcom_mdt_pas_load() fails. On success the firmware is never released,
so the DTB image stays allocated, and each later load leaks another
struct firmware and an extra reference to the shared firmware buffer.

The firmware is not needed once qcom_mdt_pas_load() returns, since the
metadata and segments have already been copied. Release it right after
the call, on both paths, and clear the pointer.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..2ac21c502d35 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -279,9 +279,10 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
 					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
 		if (ret) {
 			qcom_pas_metadata_release(pas->dtb_pas_ctx);
-			release_firmware(pas->dtb_firmware);
 			return ret;
 		}
 	}

---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20261022-b4-qcom_pas_dtb_fw_release-95c140645cec

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

