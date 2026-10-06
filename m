Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D631B3E49C7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284368; cv=none; b=eTYDvSEq/U9uJYS4os7GHs2riEwMV7Le8pEwYLLOaqN1x8mbazFryJe4Rvw/TUAt4xDnJFWGjhmMD6QTVuqiAeFcpFHKg2B/0o2arJFLblQwW8fmJwc7TyOGxicUH/PKkZRPeMaiUpJ6yodqCM6yXV7sP2jrcHEM94Oh2mgxmJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284368; c=relaxed/simple;
	bh=bsqj0MrlNxJBGdn52PPpqxU8a0t5iO2tDFDxInpXNls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RKOYKFFzF4dlDdhh3kl6LitlPVMCbeIFCcPTMk8D6GwXotUCuYIyZHSps6TFI5V57At5+o3jA8OtDVY5OKTKxTEHYDVXLcyTG98iJy+/Z7yDhSdzMC+SITIvcTWvKceW9qBeKdfVDbwBgez9Zktx03s1RKYobj+YXXd48fzckgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEk47c8I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SyBNSnQ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QEk47c8I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SyBNSnQ+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ARJn23764675
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 10:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XpO42RVClc2EAflS/sZPqPyusSPwR2/3qRdOywT1h/0=; b=QEk47c8IBiiWbRqf
	3NwvFSb3DflyCbhCk8jUkon2RPq63Y8PqNE8dyra6o9YhfCfziRFFEcxFTLrznz1
	9VJNih3seaLKh2UDKNsAC7oJN6jevB9k/zOycXj+Yj3dJ2TzI3BhvLwN/Sx3CP3P
	exf0i0HnkatxRjekYnqH9wWmfGB44d4sB6X0hJLvl7VHzIERrItB49q0bRjts3gj
	Dkg3a0gK8FCnf1fY9x3Lkt183ukMYxnrlXjB5F6SFAAbFMqB4NY+S733TUIPG8eb
	uJYBu8zzz1Ht+EC6uFEVKZCk2jBZjbeDHB/xlQ1nfzyGOPKnHls2wXP4kQnrDLwV
	ECf54w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkukjnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:59:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so655401a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791284365; x=1791889165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpO42RVClc2EAflS/sZPqPyusSPwR2/3qRdOywT1h/0=;
        b=SyBNSnQ+VYtq0WCvMusLshfl3UQZNLKoONb4Om6g+r68QeYEb0i2kjAnIuAFvAhhKV
         SGsoikErLz3v3GWFwUlCKr99bspVcLT9eqsORc7I0Fze2mcdSGUaxzQQ/NHfUa+Ojik4
         C3jVKE/NaRJa9n/mY+8XWLpdxuI5MCc8ehrUu0RVq6aXlIqOvb8Wv5sEgrc+s/PilVNb
         XwXxQbM5OxJK02sfOnV7LvQzh7JPs0bOJ1M/qslSAEUjJyNTT4iodLWe4vh+/JRhFmXB
         UzXTYKOFbvn+tJoxR3iy6l3TmWkhx46nN5mL2rn3xtJ0YCaEK6mMpf982X4/AxAXkgKN
         JU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284365; x=1791889165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpO42RVClc2EAflS/sZPqPyusSPwR2/3qRdOywT1h/0=;
        b=wNBHc1DDgRvY3BJeDbBOF+EVPHJiANFXvUn/v6JAZ4gGuRP5gsZ16uAY4vDEM/1fAx
         /g09OIxa/m6mJ9wmV3YkkvA6dEo6YrwDj34IkRM1MnQrz/NB4dGu6Ra3dDAC+WpsqXvU
         YCo/DEKHe+5oxykl/D1lC1CzxeoxYurolg6V5tPPMnXPmMzjHon6cTPOFujdYlzsy0rU
         s4gbNHc5IsxVzGcSIaKc7eXHqthnSAPTY/7lkkiBs+KvVUWYYyA7+O9bSJ5ANiMKstg0
         jPITQeRGvWPe/ftfn5BbMtHFVqJavxf2gzkn3PK7BgoNl65Q+/Fk4ohoOYO2ZCuyDToJ
         aPXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSMfNxDztPWKoZYBZEt67nYLdhWF0vk6rKaDiQeyX2yZ6y83rIiTScRJEg3956ERmSJKDjzy5NEtM75EI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDzt1ODiCDBEqi6Bl+6owZmw/5fZ/LEDUIk6rV65Q3EyAsci6M
	MxLZOOL8wiuGvg+JtD4/jZU+T6a7J/pJuAqepIY3wBmTo1IYJRFoTCpVdYkG6VFYvIqO4JuW+j+
	Pyv5ooune1Fwegb3jtvabPaGedOXw6dm5+mIimgpB2YDLkJ3CDUR4Jlh9Tmt4m0sIUlE=
X-Gm-Gg: AYBFou3Nm8lPWyJ0Xrg6Otx0WB0gEMp363BLcWFBhSx+Os024O5D9Vd0yvCUhfjU2g+
	YWZopfm9YcpYlBkmEkVKkVo+KHhZDFb6L+54i6nNXt0KDoioWLKYGpVC+ZzQlx2k5C+6pzUdlcF
	b8nTLQbI6zmMh8Em6Qmrz36cdhmkWUzBGOR8YVLaeIK8rdQ2fmj9PaiDlXEZDQQNNIstThnP2Ch
	bzkbcm7bQKBInRlPQAR48UrSvsq/K5ITD0pptRKJE4DbaouQjYCcS5nkuHh7kSG8WH5dJi9DzT6
	2ddIFZJyL1Qrw06CmdGsvonCCqOr8Ezi8IkOiCIv6UuXNkRYtkEhXO4QGtaQ/avKlSpRX58yws+
	mNZzx7ZGtlpEVELCb4NXAMkeXZtqehtVBNyyuAA==
X-Received: by 2002:a17:90b:1c10:b0:3a6:e159:a230 with SMTP id 98e67ed59e1d1-3a85464c5damr1570550a91.45.1791284364394;
        Tue, 06 Oct 2026 03:59:24 -0700 (PDT)
X-Received: by 2002:a17:90b:1c10:b0:3a6:e159:a230 with SMTP id 98e67ed59e1d1-3a85464c5damr1570535a91.45.1791284363750;
        Tue, 06 Oct 2026 03:59:23 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6e592a83sm2182343a12.31.2026.10.06.03.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:59:23 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 16:29:13 +0530
Subject: [PATCH v2 1/2] mailbox: qcom-ipcc: Remove redundant
 mbox_controller_unregister() on probe failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-mbox_double_unregister_fix-v2-1-cd5739b60718@oss.qualcomm.com>
References: <20261006-b4-mbox_double_unregister_fix-v2-0-cd5739b60718@oss.qualcomm.com>
In-Reply-To: <20261006-b4-mbox_double_unregister_fix-v2-0-cd5739b60718@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791284356; l=1425;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=bsqj0MrlNxJBGdn52PPpqxU8a0t5iO2tDFDxInpXNls=;
 b=fddXm8cKap1flGMKmo7H/r4Y2Gm/CL55VjOzYaJAaowVNa7R6Dax7bvZmdk71Qmy4AYGLP1KE
 gN3IHPceH44Dz5VooQ+zyZw8EewE7osN7RqpfVxjxoOgDKSbEvfHi1h
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4d48d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UIB2xnHzUC-C5vITtEMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: y1hMlCM_Cet9q4KxwY01rdgZNAKeFPSK
X-Proofpoint-ORIG-GUID: y1hMlCM_Cet9q4KxwY01rdgZNAKeFPSK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MyBTYWx0ZWRfX1e/dAslDGYEv
 CR75mPuXI0eIVDx2uF9Iu7fJMFsaGJO/oBQUL+lPOTsH1KeiBUxOeuVahirrLt1FkRTuTI+msXz
 n7GZMnFdGA6T/hgoC+WVSqQU6rhvb1M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MyBTYWx0ZWRfX1PS/c7WBTkqp
 bbZZhzdN/99ZRUF5Lp4u3+Xy6OW0XuKaIgLnHG6+9jabv2HDzp0pGsqCN100e+MStsUXVN/FkBP
 VVR9M6pfYe4JBa6GN+5jsY41a/vS8nNbZxGF2fV24Qr7+KI5h31jODrGTV5VHsJya9mQ9hy3s3Y
 28x8CeHvy9Vk0j5ic3jJQjmjho4I1sx9a31HrnKDcNNFxCY/bghzuM22L/fBOucFh6lOD+II2Tc
 XW35ZJ8s0RdjNGH/zOa/hOWbpuhM3MoLUnd4ZQP30PsXBjJqzAcWF6nI6asuPoG6Rf2poESNklg
 LiBZI+Ih4WufEoi0+Y2Rm41SrEbAIm+DFF038Fh/wIo5Dp9eGWKDo/B4NjBZ7lldbxw+ki9KHMZ
 n/WNWrRbAhYaiTsGiwCW+YXGLk//OuX0zGHtsvsrHXiPTkG9zJOhV0nz23SPF0ehczyJoH2CC0P
 T7TPYhj2kdVIN5n+R9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060043

qcom_ipcc_probe() registers the mailbox controller via
devm_mbox_controller_register(), which automatically calls
mbox_controller_unregister() through devres when the device is removed
or probe fails. If devm_request_irq() subsequently fails, the
err_req_irq: label also manually calls mbox_controller_unregister(),
resulting in a double call that corrupts the global mailbox controller
list and causes a kernel panic.

Remove the redundant manual call and rely on devres for cleanup.

Fixes: e9d50e4b4d04 ("mailbox: qcom-ipcc: Dynamic alloc for channel arrangement")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/mailbox/qcom-ipcc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 185b63f724d4..b301cefe4954 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -329,15 +329,12 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND |
 			       IRQF_NO_THREAD, name, ipcc);
 	if (ret < 0)
-		goto err_req_irq;
+		goto err_mbox;
 
 	platform_set_drvdata(pdev, ipcc);
 
 	return 0;
 
-err_req_irq:
-	if (ipcc->num_chans)
-		mbox_controller_unregister(&ipcc->mbox);
 err_mbox:
 	irq_domain_remove(ipcc->irq_domain);
 

-- 
2.43.0

