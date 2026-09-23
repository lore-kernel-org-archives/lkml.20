Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8C03C13EC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181250; cv=none; b=X922Ci0kjBROtykcJ2UXABXDyZVPhEgcO1gLYTt7JEhsR2t7Sh3uf8PX178/wsYaDFkHL3FnZTkpOLnS+YFKW9VyKediEwqsxCQv8aTRoIizcMRr6DFK7H0MjLyzA6Z9oN8cYbm/QL4WlmajBwhj3yw+CMJDqtjnfIBwNBT6hkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181250; c=relaxed/simple;
	bh=coYj6sdykkd1PCi2KNjcYdAGy8fu1yFBf4PZfUBvnrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYpB3TaV9/pmNJstXIYmsIChPLFAa4K48EqfvwJemZ207A69qdNgFoU8GBslgjbkyhh8PBYDHYnRXHWilNWG7Dm8t8xHwI1o5mJ+zC0ykPAu3ved7YhZZ/j+OwZCyftcuiNzrIYQsFGWwfgAczo0kVrcUXlFcJWApo6Wv5/nvH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2LWSuA9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAZT0ooo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2LWSuA9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAZT0ooo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTjMX3938188
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llOjDMEuBFDv+DyQdi/V2z3mxuMuRRhWgPZ4yTvTgrw=; b=U2LWSuA9ySbC9DCv
	oxBX5bPcUF7vpwb+ebNWmeTDI/8DmP8rIYhSSyMr/L13/5kX3Zjq4feHf/XlD4pS
	/1LdmbKvfDr0LkK4zyy71hJLrSUx96gJm/qXABVc9UNw4U0nx0VnFcVHM3q6ygqR
	J31VkBwr2MRdO9/zJX/BcUWJuQF29nQN/jHrpc95HEYpQrR69IWH+RcxNYa1GmEC
	CASNA1IRQfAakvJrU/ff3iqHKAsQrZ7JDg2ZTeNfEMyfDf4aaBnV2FhfCi8V5DaO
	w2a1xoe6qOcbZRzp38FT+9h88POIqobtecGmuoEmWlHX3mc6Nnn9mNBR/iXBsz6J
	BMH/xA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm9vc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db8c152622so7307315ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181242; x=1790786042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=llOjDMEuBFDv+DyQdi/V2z3mxuMuRRhWgPZ4yTvTgrw=;
        b=jAZT0oooBgcDa9O/kLR9M5vCeODvhRctJOpVOlBafLgzIEPIDQNKyXxEOGw8LDIYdg
         M+CDXj6YwUhK6pW06bD966TOH8pFO7xiTw1//YwQOul1Wm4xCvpBPBG69XUHXoSO1LuK
         QR49Jig36y6u8BUCVLc1MxvdDiUMBuK9N9PTwtTjiR/8GU/nxof7VVUg9Rq+rLqMqryA
         +hCXbjXU/9UAsFXKbN4RI5Al8At0b88yGNF21x/HBru4xBijm18nOajJnqdox7G6ddWq
         LH3JHC58un47Aj0DbLedE02/NKEJvODUH8rDAIgE1GJbEaCscKEPdmcxhlHBy18ZJlWy
         jh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181242; x=1790786042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llOjDMEuBFDv+DyQdi/V2z3mxuMuRRhWgPZ4yTvTgrw=;
        b=LeXTwT41PcQlp3MXY4DuMD3CvFhMVCXUxLu+gpN/GUjBOOriZEXaJ5u8lzh2iduNpi
         gXtAgj7Iu5NabLvkiBmNaTHimdHgJhmyEqSR+Mr8pMSBFvzNU8pFkRaTdOZ3+uLGBds1
         JGVlF113LMZ4aS9jkaqJ0yavCsUwQPZTitPScJCracYXq7kwdvnGD8LQkzzegErZyKzQ
         O8J4PSZbb+v0/N+lsQsn6d188+32SJ2vAv+twPKlIYnc3DDNlwGo+1MpWNHxTqQgqlkp
         dS5Q/Mz+UluQEmIzioSU34d5/zb9Ft3xhjHtVAXrPpyFjFAUWneIenWNTFmdgzMw0dFc
         B68w==
X-Forwarded-Encrypted: i=1; AKwUvBwjuyv/SVwD820f2Uc0tZCZ3gMEg/wZOTDj/bLpL+zIorg9H/siab9FZp6wrjshZrqM+zoprDuDaoP7Ouo=@vger.kernel.org
X-Gm-Message-State: AFuF++maoommO1mAGdX/k72CNK4mgkRET61BgdNA2qlqYfw89OF6aaGy
	ImSR5OoEkOEmJ1CrVC5DRaJVqKDkYK6SAI5gw/IgQ/gCawck6u2rryIoHCevwquLmvi9/oRJvYS
	epPlDcaRjWQpyqCKEs9bFz0w96KgCy6IsKPhaWGiBM7RYd4EQxt2Oy0LYd1Zyn++t0WI=
X-Gm-Gg: AYBFou1YIPwenInTk8tHW+jwR/pUKM9iVz1/rVXEF8YKoR+HaumALHHlWUKgCLajWEm
	TJ6c7XvVdPCYFbsG6aqR+VWrunNRj1OxAIGCysf0+HM7YgcVkZktBE2JbJkVkXSSBp+WVW3v210
	FKye1y/1gViPQaOexRde4Md1/k+EtXrLS5ZUh+BzMSWxb45XelKAp45kTrHiiMf3pQmW6RluICw
	n2GXr1JWAJ2ZLUB4iDOp2c4duwnj9KEpi2JPzE57Ad4UwG2h2bgC6FjtQa88kPQNnsNEXcYVsJY
	oLpG8XHYd7ZaBzb1vyPVyNtvQLmBxsyCQowMo/FMHp+YmRBtvT3ttEpGZqokX12aXODOnuQ3K8G
	qssda0c61YhI/a4ngys7TIRrzgS8=
X-Received: by 2002:a17:903:2f85:b0:2dd:c053:ec71 with SMTP id d9443c01a7336-2df69dc771dmr26576365ad.36.1790181241908;
        Wed, 23 Sep 2026 09:34:01 -0700 (PDT)
X-Received: by 2002:a17:903:2f85:b0:2dd:c053:ec71 with SMTP id d9443c01a7336-2df69dc771dmr26575935ad.36.1790181241272;
        Wed, 23 Sep 2026 09:34:01 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm13994895ad.19.2026.09.23.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:34:01 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 22:03:38 +0530
Subject: [PATCH v6 1/4] ASoC: qcom: q6apm: clear g_apm on driver removal
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-vmid-v4-v6-1-3d61a0319b1c@oss.qualcomm.com>
References: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
In-Reply-To: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NSBTYWx0ZWRfXzunREI5TfYn3
 s8zjWNLC87bbkvy4VlGIcIP8bNCluFzdCROpuyfpqAOGlszeGvc0XM4+F2uIvYx3MdkW7+KPjti
 sg+Aog59RCx6wYdUiyccqN6FLDWUFK0=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3ff7a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=i9zpEd1wrD5FINdKp7YA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: EbuoRfQ9aitQ0RKXr0jMexKxV2HXa1kz
X-Proofpoint-ORIG-GUID: EbuoRfQ9aitQ0RKXr0jMexKxV2HXa1kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NSBTYWx0ZWRfX867ANVS6Bkiv
 /dTYt1WUSxsltxcHxVRxUWHAZOLh+Dvu/hreK2FIJ8pDQlzeNxJuebq8ksig5DHH+UygXuwzHtP
 0b3UMOAUarZrp/+DGdH9KJnNaGqh7OaE0cgiOueRM7OSsA2NtbXczuN0o2lo3ctkR/+xW5/woOb
 5D1jOnX+55iFnWF17HO+ZELbSOSAdXsg9KdMc3upe+fxum3gyCAdiuG7GSwWq/uF8f0FZorhecq
 +3O4+KUM1TyBzpWSlR84eJYbJuRoy1GpiT4y7IiNQW2Xtx/VuxwM9S8TYG+xzcC98z4lntquzld
 P23PLAXYz7gkjil+xAtjkhuvBO1JW7/petc38SKgVSQyyB6Ep4gxTlHStj7PHtrKPutV60c3x3p
 R9dfE1R/RjJcLcq2+mqsn8i/KXlK0bYVDAUOnDueTydP5wcr2MXGrDqtkf0KzLRcBHnwjMyI1Nr
 H6J77cgINfEAr+qTPOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230065

The global g_apm pointer is set during apm_probe() but never cleared
in apm_remove(). After the driver is removed the devm-managed struct
q6apm is freed, leaving g_apm dangling. A subsequent call to
q6apm_is_adsp_ready() dereferences the freed pointer.

Clear g_apm in apm_remove() before the component is unregistered so
that q6apm_is_adsp_ready() returns false instead of triggering a
use-after-free.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index f167b9dae3fa..eef4b496d2aa 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -900,6 +900,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 static void apm_remove(gpr_device_t *gdev)
 {
+	g_apm = NULL;
 	of_platform_depopulate(&gdev->dev);
 	snd_soc_unregister_component(&gdev->dev);
 }

-- 
2.34.1

