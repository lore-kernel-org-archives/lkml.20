Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769347;
	b=rN4WjQvUIJJf6YHGSOlLWEqEfqCg/ct5uTJerZsuSymimhz5XjqL6LcxV4H/aNDsZwA+
	 nvUIkwIh1byedUtChCpXAL68/nF06bgX/Am1qBWPK2stmHY6Xb0GEf8FvupcG8XMqgE0a
	 23RvwJJTCjwPlZkEEbqqzDErzUkNimMJnZVYnUZv9mUZ82BJ2yX4YxwcClEevt9eXH81W
	 upE3Qdo2L2tAxLiLcDGwZvMejq/51q40EBotlDXqPZPuvTmZhqCySrUDJPL5bqXc++6BJ
	 Eibp8USCqhNSr0XUXuu8xav3upHsyVE1pCy7yGHfG+v1DnuWjwzRjC3SiaOP2F6i+qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YsJQSb2B+CKDpbEf2xoX6pdiv98jadHVdh3+ouyb+E8=;
	b=Ge648NL/cQRDaMlFeuHuc1QR9b4Ck5ZJahaA16qyttGZzD5j3noG/vTj0zMJ77eQJjOB
	 058sxHI8ZVKCxpeSdKB9b3K89/z4NXEEjpYSNblYyJiSnJR+xo2ZGSSmM1svPXkjY81EO
	 kk/+7KApJYezlQotC5RfInEnD7mDOzBAOU11RtwnQQSMG3cQDL0DbLnhZlrGsxeZG8B10
	 ml5VrfEpFzlDMLqD8pV0a7O4RUra4SrpEPI5+NjhyRAf+lZ086GIIv4lzXS2vJabU1oRm
	 GZUNX7MejLLVYlPkKOZYqaYaVjSiO/nxQy6e6/9gFNaun6sUQNajK2bDRRXWiUVN96Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NA52DDVJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MT/g4f7l";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B94C606A333
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B94C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NA52DDVJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT/g4f7l
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6rSe1492211
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YsJQSb2B+CK
	DpbEf2xoX6pdiv98jadHVdh3+ouyb+E8=; b=NA52DDVJl7tU2Hyx/ae74dxyyYi
	jcGBvlB1BbLrxheNUgU+eZM5kTi5ZaHVHIL49Dqri/987pYIus2A2YZaMcThc8k9
	k8OpZXGuC8WIEuMH91Ov+AwJFfD6RJhr+rGDMQF4BgNii1k1mRvUEib24lNqvsBZ
	9MRajVU25Z36a7TY08mUiWtIgkRXc2afBj6f8cGGFKvbODmwxubAs3xEeLQuN4zJ
	WbKqvlzHZ3K5rh8ZhvjiUJsUrrhN3/lwS8hnDlNHLtp6GDD3s65VRaHi3eHJIDRQ
	QxqfeDoNgl78zdIHdWKAJ02dZ61koWbgNv0T+k/KXOwiDNvjbhaCTPwOeTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmaus15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so183807085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769345; x=1793374145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsJQSb2B+CKDpbEf2xoX6pdiv98jadHVdh3+ouyb+E8=;
        b=MT/g4f7luUw1xqQFYjPksQmS/jZ4JaLljRQ+TjnIiLFtOa9VNJIz1WHgumL8vEbaUv
         nEetM+9zSXipzeXgbnUI72zg6bo6eYWipR5g7hsrIhENQe9YXWFiaPvZXJgo+KyHtHsT
         CELZp10XRjSnoTCwl4muUJF54ckJguAxLIIthc643HkkqNpSMUEZ+kRjyJlWAUzPrHdE
         ESvOPqqLmrrJhtAl7LRsqE/sremIdVQi76MnArcg+o/DU3rw0TRLWEBLgfnvoF/+0ywO
         iDInnT9AaGY4nMaDKgf+O1PYG1o7DG4QhpqA0k5NbigFsp/Krf0sPS78QtwLGp8T9yDF
         27Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769345; x=1793374145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsJQSb2B+CKDpbEf2xoX6pdiv98jadHVdh3+ouyb+E8=;
        b=P40SbB9K5nrAkeHLTvLL9cN9fDjvMQv28s4VofkfVHM7tQGv4hJae0N/DVAojoCfK9
         AvAXCjVV+aziEUaUkS5AVg9Dp4z1uN3Olo9i7aCmFnjURIFC5peq2rqDnFMFoW9YQ/ud
         KoYFJwX5ZxnnoaSqNXhiW6JZEu5OgiU1Cot5cGvMM8H67mJapomfbs7UqwvgUiqj8LiU
         yU4YqLoTE8A07jW/ZzWjbUF64GBrAznCw1qMCOqV322x433bUDe9ApYC3zHdwOkmy1rA
         CokD1zJ5LVv574u+qVDIpdM1fLuVmZCZH+7zpijtihkygwimLl7oDhE0RMRGC+ZznkYF
         eGlg==
X-Forwarded-Encrypted: i=1; AKwUvBxxe3SucWM2bu2XjVSAKUwbDleyMorajPrCRdZXa/fuKPpsyFCIFao1Uqr3IxwDmy5sq9DQJ5viwvJo/sE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzkR6wSz97mTN0pggu7K1V6E9Owxryvaz+YzlgrZWcDycjuBAv
	kv7+SU5snAPvoxYgutR4CN2rr/vLoqoWnXBN7nXx7xANTqZatCvEajCXIQXL3AOc+FPhgppV5yY
	wp7XrySr0Vk7e1BrrOtE9H2oKhw4V1p8nkVwWqZh9+FUIMLrWn65io3JWOmNiOL2Bg2g=
X-Gm-Gg: AYBFou0FJ9WKqXnBT4XmDz71fxbYoTKfInn0oEFXHT9ifUOqg4jENQAcYddBcJexfTq
	wynV2vUgYn/5ob9kAf4c+Y39BALJZgRgtkDpvgiTCmeU37aKJZhCSCJTOquZQ7voqK6ztyOlAiN
	bULwCdI6AO13hgehFIutCE0t0dR1O/RaD1VyMFWFAMZnrM7N3zghdpa7ClD0z0thQDy2PRy9jqx
	bO+7IU6C2Ab6Z2Tiv+NlvUx/oaqUK8kCz2A6SKGREc4DYK7q8uIGfiNOsia5a8iC9oOZcPdZsIo
	dPtaigqX+UfEbVbfu4RG40dzV82Fih1EScwWp4hwQTf1oftHhC50J2lHhEY+GPjwnlUchmIZURM
	7raQ5Q4PwDAflAJDWNOB4rkMd
X-Received: by 2002:a05:620a:45a7:b0:93c:c4da:f46c with SMTP id af79cd13be357-93f6f824b06mr449464985a.56.1792769344786;
        Fri, 23 Oct 2026 08:29:04 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:93c:c4da:f46c with SMTP id af79cd13be357-93f6f824b06mr449461385a.56.1792769344328;
        Fri, 23 Oct 2026 08:29:04 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:29:01 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Fri, 23 Oct 2026 18:28:54 +0300
Message-Id: <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb7d41 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yH3Gd9U0UaHnWrszFSEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX1XOVhBxquLqV
 Y+TYCwc0DLLMB6I9cQ4wUC5naSnxDt/TFgAoORj1pVXlAqeqx3psWt5P6KfaPWfH2rizzc/nO09
 Z1Nj9MSAiz17/cl/9N3/Uw/1qxsRwQM=
X-Proofpoint-GUID: 5VzRuQkH75oLAcAnUV0roc0V73rq7N6O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXxlToZ3LJlfm0
 MoRQYTmyEmOShJWOg/lARUjHl4FOCDWpq+U0iRd2S8URaWMDmW4cOYhdmnbB0drQWZGM907zrvn
 /EClKhVAg9+SZ3Ws7JkKCmbHSE81jCCX3NUOBkn8YV+87IyX7GkFWqRPzP+fxVfPjAChvW0f+jR
 AOzpKZiddSZ1ewV1pJP5bVY25mQEjqmVdCugGbUOLOLzJ2HGAc1LoONqYSMhiFKvw6HarOl7n87
 neKrSODRWUBilnJfjANm7Wh0xrjCgyuQGexw/NXqeUsBk4v+KhFKn9TDns2EiOayUbcGKc26e6l
 o80f1vc7ng7Z982qECOa5h/+mwkcwt/csxavM88xFlQH88ty7nmldbVoBmZqgNE/UESGEJmudTK
 AuY9T9HPjB0xt6vlGYGO/AgsJddqltXR8Vu39upSSY5mXp+DBIlHDZFjaWF9ViX0gNBhIC6b/um
 rjA7iTYPqJ0tA+aSn8w==
X-Proofpoint-ORIG-GUID: 5VzRuQkH75oLAcAnUV0roc0V73rq7N6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

The VFE fails to power on when the pixel rate exceeds the highest rate
listed for any of its clocks. The rate tables of the VFE clocks are
independent and need not have the same number of levels, so a clock
with a lower top rate than the VFE core clock, such as the SC7280
camnoc_axi clock, makes the VFE reject pixel rates the core clock
still supports.

Clamp each clock to its highest listed rate instead, and warn that the
pixel rate exceeds it when the clock lists more than one rate. Take the
clamp into account when another line powers on an already running VFE,
so that a clock running at its highest rate does not reject the
request.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..87096095b1eb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -982,15 +982,13 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 
 			camss_add_clock_margin(&min_rate);
 
-			for (j = 0; j < clock->nfreqs; j++)
+			for (j = 0; j < clock->nfreqs - 1; j++)
 				if (min_rate < clock->freq[j])
 					break;
 
-			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for VFE");
-				return -EINVAL;
-			}
+			if (clock->nfreqs > 1 && min_rate >= clock->freq[j])
+				dev_warn(dev, "Pixel clock is too high for VFE clock %s\n",
+					 clock->name);
 
 			/* if sensor pixel clock is not available */
 			/* set highest possible VFE clock rate */
@@ -1041,6 +1039,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			u64 min_rate = 0;
 			unsigned long rate;
+			long max_rate;
 
 			for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
 				u32 tmp;
@@ -1063,6 +1062,13 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 
 			camss_add_clock_margin(&min_rate);
 
+			/* A clock already at its highest rate cannot go higher */
+			max_rate = clk_round_rate(clock->clk, clock->freq[clock->nfreqs - 1]);
+			if (max_rate < 0)
+				return max_rate;
+
+			min_rate = min_t(u64, min_rate, max_rate);
+
 			rate = clk_get_rate(clock->clk);
 			if (rate < min_rate)
 				return -EBUSY;
-- 
2.34.1

