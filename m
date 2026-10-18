Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7C4C6525
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351458; cv=none; b=VvuB5W78u1wISzNoRzp0xa4N2qCNoGdB/yRZPcCelL+fesd+NT02ADRdqa8X/CZN3WfXiysA4M1N/YRQZva61vNKhI0lrQAJ/prRVVo9YyeU4Mm0MpwahKog43cEIte2iKG3JnGFvUik4YiKD/qW3zQhSwtNRwtioO7r4CmsODA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351458; c=relaxed/simple;
	bh=uWpEzD7A2z9BBVgL+L1BqfLh0mFLnWBMyojankD4Bys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utE2Pv33Idb+Xl7pO9Gx1vGOvmPTCYOSokMOKGyB0GEcVWZT/lpvQ6KPH3FBB4ktbjSGahITWNbxFd2he6fRMywRbvxeJ2WdO4ms5fwDZmsvUD9hJbc56mVoRROQ9+1Pn83eyPw3EqGMfg0LhGtR89SAXOA3ZQUe+Pykj7Y1avU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9D4Jd3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJclcSVf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9D4Jd3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJclcSVf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IIU2lx918721
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=meykzvnfYzX
	i2RMTimQviyiTW8uxbnIMjVzBcf5ea/0=; b=E9D4Jd3INo8GpCLHpi5eq7ywjm+
	R8GAuEjumpQOy6hSD/iKAlifEXffhZtpfAPyUfeJoE/eb7Ii99TKOQDnivMAd3s8
	9UQzbSbnYXtC1SENpfq7hkW91Zl5fk1oLk2PQIwjENQFnLmugG7dy0TKwZ29Od8/
	IWfMWdgifFDI9KL8EjZZ+gZm0WeUb1Jp15kPDnb+bEr5cDqv/sourCRLO8BSs73X
	hExmyTvD4LzmcO/mc+ZzBptYilWGchzsCqpNP7BhlqjOhzJfk0miGHiInXwpxxRW
	F/lR8TXakki7JmrtpT+h3wj/oU6SFlU6Eq0yKZFMsfR8O4N/QljRIGKnfOQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc016kvwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so341699385a.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792351456; x=1792956256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meykzvnfYzXi2RMTimQviyiTW8uxbnIMjVzBcf5ea/0=;
        b=aJclcSVfwE0Mc4/a4GMKOny/E77NtPv3tJiVHxYakqF1Pv2JteigDEf0MvW9UKCen1
         OWrG29nikcRQGkgKQ6ikp51JlWTDAy4awes3kPMvAFUchDnuq8hLzBdUaH3vdUW+FMWj
         44HaIlznBoMNpuMDNXTXkPPhc549HNLokxnPIH9M5wR+wEhM09r8ncr7xNrSLv57b720
         NY6iZtnkYFYki78IxAXrgRFw+0PqeaaF5SXXj5L/DEhpUHYMWZqEuPttEOXuz1HNLxa4
         tmwrHza1RZjpUtwxG5Me/Y8aHUeMlKi/R6K8j7paK170hM4Z85xVW1eZnIzbcc62sTJD
         +Hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792351456; x=1792956256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=meykzvnfYzXi2RMTimQviyiTW8uxbnIMjVzBcf5ea/0=;
        b=azwgXLKtYgYY7Le4OSzPvH5/T1JG+pUb2Kvjdp0Z54jRCzMmpeuG42eNvIxP6wyAA9
         eINQWlV6ZIj8g7DOvKdh5zIyaYuRUBUn4yuVQ/s3uTBghVcFywtM8L2InId0YE+NdRDb
         gibuLWPVNnHGP/apPde7Xw9JtQidnU8tVJ8Ag5FbBbzwGtbwUU7FRIDNoXa183CusTgS
         aapCgvNdGQVjAfJgx/ye63mYdYIyPDFzk0jQ+oxEIUQWVJD4BRRN+lQ4cA1BDG8iPaXd
         5AgkSaqrlZNq/ikETqobC0kpM4p1jnK9mgwUWCAQkJoBwdg+rcaXj/8y21lYjJQ+lDOw
         jNkw==
X-Forwarded-Encrypted: i=1; AKwUvBy2Qp+a2JM4SgXYpFW1tRPxyHMInpd9cIs4q8dfgsCWwILpcUfY4+zvJAX21uf+rJq3vK3XDtrGCYmrMgA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkTgZRChDcdgWqpgfWLUXuXJWhnuT8sIp7oqaljcdF5m2CNf6Z
	7G8EDZ0vBK7yqWT3Zk98rqzrrUPh0EH0aWH60AllPRp+5FTvPAAukXZuRshGyIVqjLrBhXbs4ig
	q09TSh5E1mEw2JrQsLeFETQObVZBxtZB4d8cti2sDIgRwk2ukHHLHtGnotH24c8SQq4c=
X-Gm-Gg: AYBFou0QubOc/iVwYnWd9NvLC5nf6qHLHOCcrFo0rijEoMNUJVit9B4+T+bP7QB84hf
	WsyUuWzQ5osRcX322FRiAa8XrlkszAMz2HAJG3VzyJrIlN6jDLewkM0IFfLGz6/d9Ne93a4aEtY
	9gEmO32f0xhLLxNl0UmPJKwnyuyO1y7awqWlBQhEYWKFnSpgoYWwA/V+o38vuMH8NSoiGRQRF0Q
	A91z16eTHxaLQ0FAXpU2+DU2jFdJQZUEGa+7DPzFXOUXaqMHZX1JGKp5QxofaPJfZeaDUug+AgZ
	OEN0A71wN7DStg/fAct9c1Hwmxxv4U55+MleascbA/J44Uba5+oW+pyVRvYaWrSGMYiYFgDM02c
	KKTjRpCBIJ8yU
X-Received: by 2002:a05:620a:6e8d:20b0:93f:353c:6bed with SMTP id af79cd13be357-93f353c6dd1mr373737085a.20.1792351455582;
        Sun, 18 Oct 2026 12:24:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6e8d:20b0:93f:353c:6bed with SMTP id af79cd13be357-93f353c6dd1mr373735485a.20.1792351455152;
        Sun, 18 Oct 2026 12:24:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm184417105e9.5.2026.10.18.12.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 12:24:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 3/4] ASoC: SDCA: re-enable IRQ on pm_runtime_force_suspend failure
Date: Sun, 18 Oct 2026 20:23:58 +0100
Message-ID: <20261018192359.287987-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX0rKf8VwS7YnJ
 aU+y+/MVA3NIRw9I++zsWUhNJBNz6RttRfZF9OlHFTrO+EnnR3mi2fsRATtFgW1oBiGu2mI3pse
 dsJmEfPwBZNCjhqnyEr77xqXTd2cApI=
X-Proofpoint-GUID: 18gIk4JPFW3O5rUUDw7fm19pcR3kUK-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX0I73hQRSkLRw
 ruWrDJgmXCRgwvOZU5rVJKX+SqEXLSQ1NUi5xYwg2o6O+dsHIY8Wa3FB+DtQUsPAxmReHFfMo9/
 MAO8eouz5XNjLQ1BRi15PAhXsKAm2YUFyFT28VVVIneM5aesBRXlQgptsyhNl3nDWjK+a+gAOlW
 w6yvfrNm85uFeuLrFBvb6OxOOVCQs6quHC//QEsKZfFy/zL8i8RpWgeWdOcVv88Uzva5u7uJlrb
 BjyicJGVO+ss0uMoQFLqVi6/hx3EQNYaebdaQ9lscQl2zSDZl6Y0LrXE0QrcyaT+HyPOUNyrKdG
 qq7aL6/QnLpXWopQnPOF3A0bowlyHxrSs8fBmpIWidI1MtFLTpxF1bTvCrA0+Po9VYwG7R58neT
 Ktuz1ePC2zfCCCsJUzKJqenAG+tAcgVSwt0HCYjuN0+u2l5NUrCFwdrZAGAfZBZZf5GphEqt8FV
 OG09hrPU7Vuqo1oEpXA==
X-Authority-Analysis: v=2.4 cv=COm/zhrD c=1 sm=1 tr=0 ts=6ad51ce0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AaUSbDpTSIYfnfK-pzQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 18gIk4JPFW3O5rUUDw7fm19pcR3kUK-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180077

The SoundWire IRQ was disabled before pm_runtime_force_suspend() but
never re-enabled when the force suspend failed, leaving the codec
unable to receive interrupts.

Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 3361db188046..8396a4c058ec 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -264,6 +264,7 @@ int sdca_class_system_suspend(struct sdca_class_drv *drv)
 	ret = pm_runtime_force_suspend(drv->dev);
 	if (ret) {
 		dev_err(drv->dev, "failed to force suspend: %d\n", ret);
+		enable_irq(drv->sdw->irq);
 		return ret;
 	}
 
-- 
2.53.0

