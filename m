Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849953A453F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374397; cv=none; b=bclOnEP4GLmmzT+3b+glo1ezBsQAmztLZaWzNTMsVlbCagRrqCyugq4TiDml3oy8VT0VXBzbzEWr1nTsG2BGaiYpxFYgPKsHuzDEvkUJydcPN1B8lc3QMaN4yWmuDjOtdN3Y5IMieBVDI0/XNj2uiaGlULU19gY5jx/xu1tz5Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374397; c=relaxed/simple;
	bh=AdtMOxjzaLIOo6KsD9vD4jUxBYk+vDmSNeDVBbDLj2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtftnfCEc1//eyVBmobMqmpUr/x1VkfN6LeSBiXMLecA4mNyUqmzVLSdiZM56u6RIB+Kq9Ck/nv4lnZ2Gn8Gv0IIIr3wozdO2Brm6takySkrnaTY7plYxNjogNDmdBWnIUPi0y6JGSdzkN6UammeP975ltfpbNupIc352jbfCPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iw3mNtH/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2DSfK8d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iw3mNtH/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2DSfK8d"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j2nR3902171
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yE9cXux7SWfKuln0nFstBwjBhpnZF2+pJbTjpUIW9l4=; b=Iw3mNtH/LZvPcp1N
	7NtBivXRcplxBJtpSppKCICl25OVBfWPBufO+qcNz5WdruToiZfMDTLJ07TjiVrF
	Acpz+yKPki4BJSU9gNHTDnfBtM6NEgizbjg9qHb0KR6OH5XvX/pQxHMqUlBfFr14
	vsjqQmjOhuacMhZF2a+q8wZvJzyv65mdIGo1E4T+e/UywarYNJM3pft00wZ8McV9
	pKc1Ks/12L4Iq0+6/u2oCW9BDD0csszYUfJcfh+vD4DwoU2K9+7nEbbFNxt7awMs
	akhnR0sEpUzTCSMfOS9/e8r4BkiJx5sYec0OxAYwids/0SUN0UeN1ZNeHy8bqObS
	LCMHsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5q4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:26:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso31143585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789374393; x=1789979193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yE9cXux7SWfKuln0nFstBwjBhpnZF2+pJbTjpUIW9l4=;
        b=a2DSfK8drzYSFskcY31Ch9PzwUv0tComl6DeTIKFYeYFUMGOZEtObsNDoqJxkjgonM
         8MCKVlG0rtmAugFoWemz6hKVFqeeNYt2Jcg55Vs+wHSRYJJkfL/yZdKHWipmacN/LfBz
         nkXFjs8uS+FU/DuU2kguvBjJI9R1XwKWqgWBBvxGw9L7OdcsKD2FFiBuBQ8Njyb73EG7
         ov5beoMmb6mMoz6fx6otZ97TT/OAJfUav7SKTDQzjMG3AN+IHXuWjmzbNrXGSjkDF9UB
         kIjurM25gwicTa7wJmMzoNAd58JpPHVLv3d2D52XZWqm7OYp7qnrqw++yqWzK1SQToPh
         TkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374393; x=1789979193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yE9cXux7SWfKuln0nFstBwjBhpnZF2+pJbTjpUIW9l4=;
        b=sksTYKGpMc/Ev0SLbkLNsFBnuYIsW6FSlO6cA+VcFKHnUXOGwRJABpdkDfGfQwDq80
         HpFZbffvYIl8llx1E9X27oGeF8yGozAfPcLP087iQE3a6fqBAF/Aae2GZMEtOG6cxooE
         y69Z/sItQK14nd5n6JKvY2gg0AKxEVxIFLTng90GF8QQPjOiYC2dEqovlWGdcA5rhbfV
         OnMcLs+ELCAVwL+0eNQgnc6Q7YNuTwlnVXPj6Nmsx/ZRuXE7CCR2XJZQBI0DVZhBaaSu
         qbOdPN5hRSPMxGIjt5xHCz1UA3n+uFPnHVVHE2I8adMfuWCL4FZqcyPxVyu7t0nyJ3F5
         bjfg==
X-Forwarded-Encrypted: i=1; AKwUvBzrNui96IxK7MGwhdg/Q8gxO6CDzt0mCrq8K/9LkQFQCVaGBT+vJlbnTV5+wwuK/ALeGbIO0jUmw9PtEQk=@vger.kernel.org
X-Gm-Message-State: AFuF++nwRC1opIxZf5uF7deT8eFnePIckLWTPS+QFxO96U7GYq+hc+yY
	hfELIRXQjlTxJZAduR0I+Gn+9xiMwgJyK/vOStepzwid5rfkhrdkynNFdxmWDYlR6vTGHKUmaa7
	bpGQLpwsh7zkOHIl+tQ0KyutLWwDewoHxg/zk3S3Zkpy4kabSIRXBK2xi56U8lLmOMbI=
X-Gm-Gg: AYBFou1Ka2IOmBAkXY3QGe67GOtGNOKQ4vEFjz1aZIbVmoZyxYMlJ9idL1QXDK2AO6t
	Fs1oBtKJoUAQFlTkxTijO1xdtlwP0niYogbOyqhRRODVupA4K3IvOKSXDu+T8PrKgpaWqThw1Kr
	xDMN+Imc0LO+H6RegGwY4RvrwIzGo97+DHDXef1BJkAvX5d0+BzCQcIpiC91KrLsf/DOoJcNRav
	zKDG3c+rKRM6GSriwTJc6gCsUD9XCm/Vy5XFS0f0iFWqDUMIg7brzuC/CYj4jfcbKD9hpkC9z2i
	+kruEezURbHnX3FarHgKuf9NaaVf14nO+AaA7dN/x1I39Onx0OmZwpGaTqu/nZFvLzwLv4gt2Cx
	F9hMkieOqMBFJyQ+mRRekLg==
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr150436585a.5.1789374392803;
        Mon, 14 Sep 2026 01:26:32 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr150434085a.5.1789374392239;
        Mon, 14 Sep 2026 01:26:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ba623sm400996666b.45.2026.09.14.01.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:26:31 -0700 (PDT)
Message-ID: <ad4496c9-e438-4c4d-8089-0342251902df@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:26:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: pmic_pdcharger_ulog: prevent work requeue
 during remove
To: Yibo Tan <lhfff@tju.edu.cn>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260912161210.1683266-1-lhfff@tju.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912161210.1683266-1-lhfff@tju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExOSBTYWx0ZWRfXwGiyGphDanoz
 fw68UVrDhBOdCKeo4Ihuauid23Fk7ZuWX3KN0/+2IawZM60/O5ZDDadvJBGdBtweXxsDoNDOJfi
 6naX5pwYRizgwPQ78yPY6FuTvdXxCCU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExOSBTYWx0ZWRfX78+ynLMWKzbL
 cslVN9vcgg3rbA3os1/tbhCa4j+o/o6TJG7kkgjTLGFM/i7hL5v1sK6AaWhby+neH9L+dTYyyZ/
 57lyOrpA2AAKNnes5fVLbgPzkVF7FypwpdIq3QCaNS1xIO2DfbysWdhF2n36RTla0WqeKSXRuI9
 Z5faTlCT4A5RqbqM2FrEVVMesW5U6GX46vEXFH6GbCinTnxoL6jXgjYz0UgpYRGPY2v7VUWg7Cq
 1gjiWADF0RDnByNmGpTs+2nb1G7JyR97ZJfWs1DTrdB98h3SRLNIipjtsyHK4UyO45cCYZysoVv
 UkMdOMyTsT7ehBToxY8IeKHYMn2zdgWJxXjU0fVGF4Roity395zzZZU0YjIyWHZxYmxnI9M5KB6
 UeVpnYTSWRxT1YXC3p6xregy8deW8vKqDpKdzJsQAcjpmXextN0zYaFNiFysu3uCLnJZeEA7TEl
 Z2AcKuyXmU33SnCE+Dg==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7afb9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yWPM8P6GVKE6enYag9kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tWczcOvtqBveiUxbtlgX2UIjjNbW6aud
X-Proofpoint-GUID: tWczcOvtqBveiUxbtlgX2UIjjNbW6aud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140119

On 9/12/26 6:12 PM, Yibo Tan wrote:
> pmic_pdcharger_ulog_rpmsg_remove() cancels the delayed worker while the
> RPMsg endpoint can still deliver callbacks. The RPMsg core invokes the
> driver remove callback before destroying the endpoint, so a response
> callback can run after cancel_delayed_work_sync() returns and queue the
> worker again.
> 
> Device cleanup then frees the devm-allocated pmic_pdcharger_ulog while the
> requeued delayed work still embeds and dereferences that object. KASAN
> reports a slab-use-after-free in pmic_pdcharger_ulog_work().
> 
> Use disable_delayed_work_sync() to drain the worker and reject queue
> attempts that race with removal.
> 
> The issue was reproduced in four of four runs with the real target driver,
> RPMsg bus removal, endpoint teardown, workqueue code and devres cleanup.
> The test provider delivered a valid response in the window between the
> driver remove callback and endpoint destruction. With this change, the
> same late callback occurred in four of four runs without a KASAN report,
> warning, Oops or panic.
> 
> The reproducer uses a test RPMsg provider to control the teardown timing.
> No unprivileged trigger or physical Qualcomm-device result is claimed.
> 
> Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
> Assisted-by: Codex:GPT-5
> Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
