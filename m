Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C8F43F0A6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093679; cv=none; b=rFDolTFal/lZTA6LjNj5FMaGvGj4MJOZ+CU0uQpkdyS+k/O5MZDOTefwGnwTQiJPbaDduLaalKx5w9AH0QRJC06yWK3j57J79jKG4hbToyZuVy2+y4TSIu0P10nask+/Mw73xHwccGoiaRFarxAd4aec5l0VUiAR3SwZuvcGd2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093679; c=relaxed/simple;
	bh=OGpe59J1qKtUFqCU+E7+QmVCO/53r56q4vFIjT3Ui1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAC96UP2ZCtWlRinNBofrF9De9W3xdcCmlVzo3EjRLyG4WVgIs+b8VDQZ3YPYGC6FuAzpGT/MeXCY1e7dH3DON8AW/+iFasfNOqAOVQbY5yVYw83yfUJ6diRJBbpYdk6BNagTvE8chXLoQd3cJcFoi2/Q2YokwJYRR+EEI4PHio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZjEoK48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAxgbsN/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZjEoK48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAxgbsN/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FG5d8p3493212
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6q3S3XwD3ss
	KNTNzg+SEXrc734GFwZ80COO3a8rdsI8=; b=cZjEoK48lWk7wepcehAUJRrbnyJ
	a1/4Zso2ZJYgbTNc9xl4/aKdz1y7YWA/TvmG++4IijvmmQGTgIHAyiwAMtQXSRo1
	HNCSsA9c0R/U7tEYNmsXaMC4obIuZDJizcFnN09NKmFDInDc9/+b3kdabJJox+1G
	v0RNRPTzKxdXXqBawtIstdLW7Au7l/FPxGDeRO7sDdNQ8rD6vJYpxi2lJOgFSyXx
	XYrP3WJPKrY0g8FOEDxiXYbngb8J+dUgMlKx2aXcM/2zFgZUMnTQ5GO50gi9UY8S
	kT/KryFVABeosVQybw095uo+29YAsI5Gsc4cNZ3sihMGGGoprGOBzVrB/8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wru13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:47:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so1090445385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093676; x=1792698476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6q3S3XwD3ssKNTNzg+SEXrc734GFwZ80COO3a8rdsI8=;
        b=NAxgbsN/NpWfTUIZSMw3cH6CkMNsOb2Af8tK1xVkEACEsZGupw6x6RJBXey5vh9HN3
         cDRQd1qpp6kUnuct+SrZipO41cVDVx5lbQwmgKenjIeLDE/Nz6Bl6vWlmxG0dby85qhi
         XV0yjSfeUgIyrMhnHN13XzG6rbBSlhM7wAKpcGeVo+gPTwT9DSFED7cf1rZhUSNXZeEj
         /EiY6zUz347I3FrlAcNt/IPYoeGTHEYmzWzXrZRtaGmB1jUKtvhjg39/I1JDLB0tw8Le
         Mz2NtoLzRPVy5oD8+Q95Hw3lvZ3yvjU4XOrPpUkDlLj7NCnQHCnw63Sj4hQD03DjJyLS
         JB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093676; x=1792698476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6q3S3XwD3ssKNTNzg+SEXrc734GFwZ80COO3a8rdsI8=;
        b=VbjQ6zecLt4a4Kz9o/zKTFl7wRtuOQODkFsHq92yR7wfQvBfc9wfyq3bb2GVp+WFzJ
         xYxQBNkD7h0KPN6Lbd0SZ1fjxNU0cThNgQ9uDJwrOdjVTiqg8k79Y0Fc8lOfjfVuFsJb
         XFkiJ7tLy67AdDKTdAhqyRmicxrEKPjKbzTKEYuXwA1c4u0OtDOZl3Dk2AfnjKu39IQ/
         Gij24i2iWjzqAodcez34j2kI7JGadTanoR8MtqLCPbNmx7nceFCdpK5ap4/lmbXxDS4y
         z0OARk5zP4yemWJXH3yBjbfCui7awWYjUozFLmMM34Z8lZa+QJ3frpysndakc4ifxC56
         18Mg==
X-Forwarded-Encrypted: i=1; AKwUvByo5j7F8umbBa5V/Y9x5iK0otZJ2MFAj4qM3GD0iexAbmbYQvAWBNXZh8Yr4arQjjXmhfMLf52brNksIUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjd7xuIfdszE+WNv8yA5r6Zcty+/bqQjMU2mhhXPSebqsHv4uG
	vXumFjHGO+AKVGLquL3HPwfcaVWOchnEm/ZD2jrlPiULcLUB4+r34kpGtuQHjnLLaer48edNd93
	CbOZSg5o9jMNBuIffPhUZ9ql3cOSg0dw35bfxbmC2WTo0aGz9LtXv6DXALyUcCAnYgGo=
X-Gm-Gg: AYBFou2coQ4m3e2K/b8YwDp3HDxTaTZRo4eJ4xxHo0xoUFBOCvP/niRyZCYzo7EQP2N
	EmlxNJxREtjmGNeYm1mHJdIxwabnogiRdnqMLxHZ2B8APLRnQC/wtM8Kx/IlyzxKZ3My5Mf6fOC
	vdELsb/sfEo2/pSYIegZi9kWRr+lXDlq6fvH55C9u+wvk2O79Iz6wOBnHxAAltnJxmOWwNHnPRm
	rRsdZhHSERvw+EjbpWxNSzO1dy921WBIc91nkN2MX5ORODrQKx+2K1BpNYd1yOuT4xyR9zg2788
	5h2X2+Mx1Gs87OXZSHsQTsEW8oeE/evmF5PUPBpjJbX97CpXyVSvCHI3jbRkpe5nbjzormWExD9
	jQXhuuXuiV0Yo
X-Received: by 2002:a05:620a:648d:b0:93e:4594:f5ce with SMTP id af79cd13be357-93ebd22590amr3604370885a.41.1792093676352;
        Thu, 15 Oct 2026 12:47:56 -0700 (PDT)
X-Received: by 2002:a05:620a:648d:b0:93e:4594:f5ce with SMTP id af79cd13be357-93ebd22590amr3604366385a.41.1792093675818;
        Thu, 15 Oct 2026 12:47:55 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible
Date: Thu, 15 Oct 2026 20:47:29 +0100
Message-ID: <20261015194732.64428-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dS22Zp1CyMJHQGT96fBLZm69fkoYR9Wy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfXzavb0/iRgqZ2
 32TrEFBHfGVakfbfP7y5T1pqV/cdA1/HrQvFT0yYgoKnoMApu8sGLQJmOUzYmfR4fhsI6kyWfWt
 XdAfO9yP3UBpu2NJFj3IiXq6LM5slNGlORdTE3aLFbTrurjjPQocLNgUmHkblREvrn4x+6zSPDq
 GMUKdw5Li+oF9Nhe87r5wphiQheUtXAQRJi7UbZaZYPDG+vgB8TPurrjpAGn7SOAADV1lVoL8da
 WOycEQGl0IJtOKGlxMpG6aM7zuyahkANCyorrDEju71dC6GuAYq/692I2kaISI58walgu38npE5
 rGGJ++Bfms2quzo0tkAUj710JsEZSSo1Wa9lRtBQ9uZq3jAavxGLZ1RZ5KgpBJ1OQaNhFyoSwVt
 Xowg/ul5/l4dGxsFjLDMvG984ELlkP/St3BvWSQUUpZfW2gNwV2bcy8Q6eszZ7s1ee/frbpsAdv
 UXp2vdzQrpIYIaBQLbQ==
X-Proofpoint-GUID: dS22Zp1CyMJHQGT96fBLZm69fkoYR9Wy
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad12ded cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=QIIdgxlFtvIS5BbdDE4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX8dkUmH6K1k1P
 zhWpedbOs+dIWBoMXncmmxWNMnA04MIANVfrDKGL2JehpedTTGVcOt4jRmmqKnnNWgwE5tY+HDs
 wKUtM+RcQdQ8BhZKtzb0s0SbQN57QSA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150078

The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
the same two-channel LPG/PWM block as PMK8550 at 0xe800/0xe900, so
reuse pmk8550_pwm_data.

Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
(EDP_BL/PWMR_BV_PS).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24ffe079f221..485fa2a7a848 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1837,6 +1837,7 @@ static const struct of_device_id lpg_of_table[] = {
 	{ .compatible = "qcom,pmi8998-lpg", .data = &pmi8998_lpg_data },
 	{ .compatible = "qcom,pmc8180c-lpg", .data = &pm8150l_lpg_data },
 	{ .compatible = "qcom,pmk8550-pwm", .data = &pmk8550_pwm_data },
+	{ .compatible = "qcom,pmk8850-pwm", .data = &pmk8550_pwm_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, lpg_of_table);
-- 
2.53.0

