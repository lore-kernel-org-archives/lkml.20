Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387962;
	b=zZAMG18WiohIiFyKOT3eLmw/68WrM9waK+RnhR10I9NjTxQMnoLdrCzPi6VttpY55sqi
	 NKUxFed7ev6uWfZHxeLkgJSQqyPPXPHYGa7W6kaNi79PUy5jMENjkt0tXiO3GALB4u7ew
	 uXUgLadOTXNyeGhyLcQhThcp6Gvb2mWQs3BqYes0cqCLCu8sqQIZvDcjgsk8UF4vRf/ca
	 PU9s6nNjanmXEZ49uA8lyn7PO3Z0fqM3g//WpoQcOB1ilVdKeq3aFENJ8p8lTOo8dPpYq
	 3L4NoL70wgWgu6v6A/giVNOvXGEU0VQiaASuOfpHdi1RNquqGweUP1eCnQ1vemlZoTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
	b=zjGfRRhwDobChV4p5Jt6nMbrQnf0TDCG3557foqByxzkOWMpWOB/hkB0Ryj9qD47VREA
	 107bC28gli3IqwRdPn2/EmB/o02M/C4vSex9HcgIcaucElTRW87n9rJH/0y/2nYY+Q7og
	 9d+SHTFEsrodqO74XhaEbRZveBHdF34HsYTKCYE0JRbJCndA8awXUYLVck2DXydN5wdpo
	 DwaTE5hx6hCk577rWB6duHLRb7/avhDkktyf7U9e4156ccfHDVQ1swlJabDCNWYcj4wTI
	 GLKPry8bvy0XFb3oMp6yEK8IXGoGukCGhvd+vT2HnoaLG1tlwdzfRuXV/oK0v3VenkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjoqT0KD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VbN+f9CH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43995606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43995606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjoqT0KD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VbN+f9CH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KMCE2017384
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=; b=GjoqT0KDHuZKIFSG
	gcxLqcDBpvdsaHA+ld/bNgzJmDDQjYjLDqBq+/DJowUtCWxj5cnbxpeMkk6II5H0
	7Ho3fKM5Wp5VOiIVGWP8ccQ+ekArZmiuWOQeDgNogB4b3SpZRYp6BMa+UojlGNEB
	dLf+tpB+OGejv3moOOPjKKbv+AikqpuXzLh9O+7W0fryn2MdskF1CNqWzdOklH+5
	YAHWmsmEyOkvnxma3Ik9p/6KQhznjXYYqsFlqhY10jWZ/nB+I3YQa0+7myXuIK2H
	JyT87ZcyfOgmuSUhwupaabDiXqQkbd4NEh5dv0hyQ+hqZZXkMKa1uOYl0Qng8Znv
	8IxRJg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cawcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:06:01 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so5802417c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794387960; x=1794992760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
        b=VbN+f9CHA5idfFemD0oK+BWaYpaDJv6Yxj7yQga1ipcYXx0E7C9RD6RlvyEdIIUFhn
         WJV6Do2TeUbFbluNgmoQFaRMsJ0xPWNdCnysHDsIvKEyjQAeGHk85zbaYoQ4E2H/AEwT
         R9qQ4nAM67Vh1pXouW8GvRua1YlwlVBNBrXRkES0AaFGIbBxPN2E+0+cORwAeQeN2Opi
         oLjf95+IWC0w0tRXmQ37rXapbWuT3xgh5Q+QrbIxArS4J35SMUwZEZE5JSPve4FF8+wy
         zil43Sb8XTkjYLLbhWWQuV1NjN5b4liG6ScuTtIjZETwtwJZP8KFy3Pb2QN7md0h8sbj
         xFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387960; x=1794992760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
        b=Havew5GEAHilPsA5Pfnby96r8zurlKFQCPqwFJjIsIDvXljcSvqW2CEzxc075xDm4l
         YvHKf8UOn6a0AjKBD0P0pWzkdSUA8Mg9rY7JSj8KnDTvueR5X7FnUPYOqJD8nuGKOX+a
         v6zwh3Eo1hrQMRtkv2P+AVP3AoMfqV0c3Qaw8WHiJ4QNytDvXkWQEYCXjg5sY3hzUWyR
         3Wsj5UvzErGie6SVBnHnn0H6PKO/jE4V4qYxnIdaSjPq1YuapcCn6qJT7//G0BLn1ofQ
         kzWvzLDxhUQHWBT891eVZ3B2pn0eENQXgrP7pTabXEcLp4wOpM9HLr3nn8MqsrCnHba5
         YTqQ==
X-Forwarded-Encrypted: i=1; AL+hErHHVlHaBQFm02ZhO4jYcJAwRY1pYFfdkFGUhSgf/c5Dx4foWA16pkFNKtXAdGa+nXsOusSWiOEdOa9Lb00=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zeHfm170yiz+nklGxJhPnCAO/69qhiwiZvoOBne34Ti8pJtbc
	ITf3o5IFcPy9gdZmBkr1WagkLXhYTkLEd/KwkWwkApotWqSl9MBefg3KOVFtB3y0EgYXWKVw2l9
	xJC8a4vJAUzZ9dmiCMIUH5Dtbaj2PaFccNWeWAeK1SrtciIvBO1FL5lUHXJZdle66YFE=
X-Gm-Gg: AYBFou3WiA+mipspwmT7nQrhARzINI2/e67YvMLkZIx3Ahu37i38P2zWOFS5JNY/YKQ
	Pe38zu+tC3sSOA4JNT9yNvClXYlavetgRdRApRqy7KLD7fS9rZe9nP/6mc6x5VcRDq0FFtPjFoS
	oRN0xsx/jDY5rBtup8CP+F0yuDyNA+kBTcoebugGCsHKPpXQwiTrXkjrScsIppwQmxo2UgoU0a0
	8UeK2rgCokbzHrblfyVLOJnbj7ptAXkPDwawud+LPYfHLO5L8Rb17v+3ubA6A413QbYUllOpvQ6
	+E4XrkbzPj3JKc/g2EdVE5qLsngsaBhf7aNu0+k6xfrK12bMKTvkBaUrf4QJuqjN2ygtd+7YQ2t
	A3dU5XR7ef1+MyKk9HZk6d5bm7ncr4R2FOXfo0CXdgXG45WYx3msPpCYuBEmk1yZQ5fS5Ox7NBG
	OWZdvtsQ==
X-Received: by 2002:a05:701b:45d8:10b0:143:26eb:18e9 with SMTP id a92af1059eb24-1b3c032d6b4mr1818510c88.28.1794387960068;
        Wed, 11 Nov 2026 01:06:00 -0800 (PST)
X-Received: by 2002:a05:701b:45d8:10b0:143:26eb:18e9 with SMTP id a92af1059eb24-1b3c032d6b4mr1818486c88.28.1794387959552;
        Wed, 11 Nov 2026 01:05:59 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2ff3bsm16915277c88.11.2026.11.11.01.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:05:59 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:35:14 +0530
Subject: [PATCH v2 1/3] Revert "media: qcom: iris: use disable_irq() during
 power-off"
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
Message-Id: <20261111-fix-disable-irq-safely-v2-1-8e13f68c2ef9@oss.qualcomm.com>
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
In-Reply-To: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794387948; l=1211;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=OJRJ4n6Rjp8IwVJxm+5+cJyXLWroXFMzWgufd/STv+8=;
 b=OTeb3Fut9eI17/5ZEOA+56fDKV66fy8SrYjYvNGchCAucQVvQ/T0uPh0FhK+1CLl3eSZ74GjR
 FLwQB8Q7PQaCSEcrYuBLpEqbE880dxOT65FHw3rnqWpKoXDymmadW+2
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX6vvcUf2GtR8o
 wQ4Bgp0wiL3BqKrvSTLMvSB807CWuwi/B+67cYGkjX9ZMSQqu/+WB5DxoyE8hT9/k3JkCsLaYJV
 NGK0WJRPA8+izz0JUxJ4Fd4XES7i6FICmH+vZPeW/V/+iPwOj3bops8Sb/HPuLLDGGt8RV2URtw
 g0W82Jb6sPt43kKh1DbnC0XCDJ3PiyUvMyOECWFwT6tnOt08qx7bRhjm6CdaWk7dTd15kUxZjwL
 u8Ja/KTA4rK1K+ngWvFkfzNX1+TlBFIx9IuS60DwdFk5vtmWZlIDEqzukaP/Ohi9iOmizENBwfA
 yzHOtd0J5TR4XMn8x0RqFQFU4QM37mT75MOf2b6+J2IyqntgaLqUnsUnfUGfONmB+T7ScRXKWyG
 +/skoFxxE2Rx/joF+Zeyduu7L7F2CN0esYBau3At/2BVXj3H6FgNGASC0LVLz6sDuM/ZkROP0oF
 85niaUxDi4g36m0bD2Q==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af42ff9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tjrYt7ayRFslicBUeoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: z5mUi7xVkjEh2CldKVZB2G0WtG9ubX2X
X-Proofpoint-ORIG-GUID: z5mUi7xVkjEh2CldKVZB2G0WtG9ubX2X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfXyXqNnCyqDArf
 wgjY/AyhyeIfsk/NaGkulGQdPYA0KyOv+AiPD49mUws0j6PL5/Lo/iYCG2I/f827Xr7igwAIzYO
 012mnfJYi4or2dKOwyIms5f1HTdqicU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110036

iris_vpu_power_off() is always called with core->lock held. The threaded
IRQ handler also requires core->lock to proceed. If the handler is woken
and queued around the same time power-off is entered, it cannot acquire
core->lock because it is held by the power-off caller. disable_irq() waits
for the handler to complete, resulting in a deadlock.

Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..1e183fc4e58c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
-		disable_irq(core->irq);
+		disable_irq_nosync(core->irq);
 }
 
 int iris_vpu_power_on_controller(struct iris_core *core)

-- 
2.34.1

