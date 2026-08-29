Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F07941836E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030501; cv=none; b=UVOLogXRgZYVZ/x+mVAo0vpcYt8r9wbrbOe6qugZtJum2OwUiiH+n8nCvCW0xHPYYMfrb8cgCuWynF5Vklhry2N7lZ3XonoT+XXa1GaSUbJuCDeF9xJF0YFnGEk60hVhwCuYWNNeJ64WiibQCWCP7qgXflSt3vCBulhSqpHNIPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030501; c=relaxed/simple;
	bh=jgf8SXZZdg8yn7G96UMAuhh5WZwvNapKXO0ftwAr1TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGknYRGK0fGT4BGziZuYiWT1ncINJUyUrgXIPEpQtEuFhyY8qFyhnpqtZcn1DVkfe7qAPRzLYpoalRGx7uGJr37zzzqpCRi8S8Olsln4DHHDYwm1cdbS1Lh7NckxnG+KyFRFAhclqx+ItpTYIBBtAZb9DVS5YgAfdSQnMZmut7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HbSyQa56; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSExv4De; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HbSyQa56";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSExv4De"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIGx3n1416797
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=; b=HbSyQa56PdtVlPTg
	jg/ToFCpgXpQtkiGkjIrgirOdcmFMkNGR8rZzYrh5qHSDzdReOjbeB/32XqA5ObC
	QiTpGuzP82NhRG6ntkC5uJqFJe/7V9/w5+vrhM9JV0dK6VWT6jj68zZHOa1BBOsy
	G9mf6qlR3SmRTKBuzgsSmVSv9WzIVqfHYVorXrCQJaaR03K0eb7U1jc90tV18ash
	SIulReXMn40WYG5x1sN0OwvHnd7H8/H9vXaU/TDi9CTUu26wF9lisGQ6/KhjfGjM
	7dtNR6jf5C1O9qVxdakYtj1ZVS9sU56KSHDkVihMVYtgC/EQxmFjjM64XE0v7AhS
	ggodCw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgsf5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:08:18 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66d309b367dso2345686d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788030497; x=1788635297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=;
        b=hSExv4DeCY2Upd2EU/jcGPetT1xCaq8BnK0BG5/5ywq6xEYHzKkfCZ3cges4UjtQoB
         okgmmf4XOmWi7U6Et7aysaOUaKoNZQ4nXvBQjSJxiU1ZApI5wNGkE7JHZA/4M12jRHQK
         06LocvfvOpIm7+d9f9zSr6Yy9xwfxf3DDdJc8gpeORjQPPR8BRnIg9XgOecCS+zIl0Vg
         zgI2UNBoL4QGstvDBrwb2My+fMGTXWc9YiBrBE0VfoWry8qDswXFx2UBNJUvL4sc7cEp
         D8MgRaU/YGAOky744MpwRqwNQmZqdARdbj82aW7lGfcC+9nWZJI8FHgrDh4Oc7SQYNwQ
         B6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030497; x=1788635297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cd3jtyg6s34A2Rwus7U5Bm7U3Mlc5r7JJzTGY72wPKk=;
        b=C7NQC4443mVf9HV1T/N0rmEYGeb7hWBvy/dL8cQDBNE/CkRyik5JVk7Z6s2qyoqcAH
         kFCzuzYfCVAK2j/D374Eo/LOorUMh6Ka/NWg2FVsYJ+E3lUe/xmSVOrgumZ/2D8oSrmw
         mZK4uMuMQWbqkKEygfdA4yjGL3KCDuwoKxmmXzZQ8lInKF3pGaSL0YC08HyWvOLp3gcU
         mj90HlzAy4jSRTP3PlDeGCAqKfM90p/DggkdbhcgZpvzk3mBKQXaFH0Q2OOtl698qMB0
         pjTgIE1WKp8X67GC/jhfqiQEPsPNjPUfEGzJURNc9lLu9gxIrGruznDs4VO/guIPZfy6
         1yWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOVirMURgPgytu7e9f3nWxFi4MuFJqFr7I9vyIeiGO4ajlS1ci75X6eKTz4re9t+KwCKCzO0m3I60BsYA=@vger.kernel.org
X-Gm-Message-State: AFuF++m8GXxz61gNGp+hatYO7wsT5BrrqsRq+VTuGLld2uwDCqF6L/hF
	lNOtDb98f3qmUzUusr6v9TjWXHYsiDKeyIEtp/94F+5C5ogpmODxNP4VtMBD5KhhGOZJIEecoJm
	hL78xqPOgECpP3182X3N+/vekYjTfC6G1awC81xyN4gGMk991KAQ65vIjKisOklN1oKI=
X-Gm-Gg: AYBFou06AQvIfC3fmVT2H7vkTnhAp+w7WH6E7YuM1XdGCyGFYe2dPmrfNIGCiZuCTEE
	YYJpBdkONz4ZqHCdqMZybTO3DN/kzNp5FNdyeEZGL0DU/Ey2tGMKe5ZqLprsvM0dvJZqPJKqATa
	top00YMzPgraUOAk0n7X9FnRU7DeAnHYF+UdlujWXfrOgwFdWPM+SYJk7g5ADvGg7A9+KXRK8GV
	o/QvTpx6mb2wkmeLtZPJgqZzd0+oH7cOt1Yu1Hn6Bg0//YFnAgLZJEg2C1Rzj+yZafX3Ii5isFf
	ECC5fDkjeEF89o0rAI4bhNoPLlwUHJ7Lb8Kgsm6v1TGFRQ1af49r8/o5hwTDEPySZpBf3vuNK8x
	0zjTPTqryXV7ZmF79sF7pEL3yjYjP3htNQFEmuEuluQG4HXN1
X-Received: by 2002:a05:690e:4513:10b0:66e:461c:428b with SMTP id 956f58d0204a3-66e55b8480bmr1983713d50.30.1788030497665;
        Sat, 29 Aug 2026 12:08:17 -0700 (PDT)
X-Received: by 2002:a05:690e:4513:10b0:66e:461c:428b with SMTP id 956f58d0204a3-66e55b8480bmr1983692d50.30.1788030497281;
        Sat, 29 Aug 2026 12:08:17 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:44f5:f599:5679:b5a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ecf1f6fsm3013945d50.13.2026.08.29.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:08:16 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 12:08:10 -0700
Subject: [PATCH v5 3/3] firmware: qcom: scm: Allow QSEECOM on HP EliteBook
 X G2q 14 AI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-glymur-send-v5-3-a11bdf6a4b66@oss.qualcomm.com>
References: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
In-Reply-To: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX4RW3a0GAI87H
 yVN7Gc6UAs1L1Ugn5Hv7cETvBe3DTegj3DZSnGnf3pmDXb3MHGuDB0oQm6vU5+ex5fLzpFmfZ3x
 OC7k46sFwu8D4xeOWo9/drruSC4vmO7sNKQDBYt297SsGkj9rZcZADN0z1Sr8uNUlkE1EsPFGg4
 P7BMteKGmGDPnIG9cOOPrm1TM14zkdfXkLyu31rq3N08j8tE2dXvXkYlmBy6BEi0MsQ7GSm7mfd
 aR7Y732RY7LJ3s7HUgBQ4QKijlMeedZPzknaxpg2VdnGrPQGcsJnmuXUaGsvLxqp3d7dLGilNeT
 JgEoDtmx2+lq9ryJBgzx3KbbR5LptcMT6zIVw7J6jMZqyoz9haWruNwBbX4JsHh5UyZZWuqQYPa
 4X/Wdq8fsK+Q2ozMQ4oT9cC5DW0JtTb9VxcdYTsQ0bKhLbii0RoIHczvdXhETMXvB1/eXadRPmg
 qtXyF4HrZ0a822tbj+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX4atJG/riqU7r
 TJS5bKqn3lPWSrIG9loNWNSbO8s+LuuYq7gKL6rd7EuQ05osp82pvv4nhVyJk3tco0SOBow52Mu
 d6fS8mKXBhrtINaOJEtZreTWTcsOYY0=
X-Proofpoint-ORIG-GUID: d4Ypfkr_4nHP8j7PEDg4dE8dSx9xttbv
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a932e22 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UXNKUhSJZRFg4A5DIqMA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: d4Ypfkr_4nHP8j7PEDg4dE8dSx9xttbv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290165

The HP EliteBook X G2q 14" Next Gen AI PC is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Without it the kernel reports "qseecom: untested machine, skipping" and
efivarfs is empty.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..c44c63e1c20d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2311,6 +2311,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "honor,magicbook-art-14-snapdragon" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
+	{ .compatible = "hp,elitebook-x-g2q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.50.1

