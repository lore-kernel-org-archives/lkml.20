Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D1650C291
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555240; cv=none; b=fvGR4SbwFDXckX1sNVl0VqgGSSIEvJtD9jZZqEFJq5HlN2F3kz3dpLgaWFFS/E0VMeNZpQkG/iK3yUy0zGVMpfHtLT6A6w87dZh83t1fjtmUTj8pb6xraEJeznf8VKf6xy0da+MXfz3y4S07mdGBmZQbyX74nJMqVJuTGjlG+DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555240; c=relaxed/simple;
	bh=yGnIUjthxb6U3IZAyKNaNb2TbGvUsCcXifAWxRFjyK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkJ7t3LqGNRcpr6mBOKIcrHeLG1oLxAibSQxNpr2doG7ojmxSSrVEXc04tyQKsoOS20z53G+mNi3jnhgO+HRhuooE3wJZYSTvormAgp9d8c2+Tc0+f+SIdo7+PHiuR+AFpwJmIy1cW7AbZ+1SN9taroKM1IyNm5V6S5l6emOszE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKqWlXSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVj213Dp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKqWlXSL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVj213Dp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92f8N2477683
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sPwZD0T5gkXfc4kxDoR6r3lP
	6oUeHG9ZuOKOLS9rEHk=; b=AKqWlXSLblazvsrBHvnilIv0zLqZiWAVMpl1wuOy
	2Q9dCtzFaZb8mjem70clV6IkpzAWwAXiYa2mB9ZaJkviMmM92XM4lSfyaA78LGS1
	8dof28FPQGOAN08LnTtGplxaEb4bcNjsw2wPNwGcKcAJn1phjjq7JFVAoR1IgL7X
	C7rF5ETKGiY2ZUs9mZZ7PIDbIl5V4tjdrJ2NQxxbYcM2fkZ8J+aqhiyyxzHpTKLF
	L1WlBhR/1vZXg1tkI/91bNFqVrYUIuQsOhjo25lyhDucO9vHj6V0X4SASth4F+H5
	hH0AFCtS+0/sykHUij4VtxPKK3P8+xKtXSG8zooCSdE5KQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjckswmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:40:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a07b5b5efso364127485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789555233; x=1790160033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPwZD0T5gkXfc4kxDoR6r3lP6oUeHG9ZuOKOLS9rEHk=;
        b=AVj213Dpx7pJMJXmXWEYu30Yk7d+K0gU+GwGE4VI+86PxxsfroYH0ksCnufepBnrCv
         d3BnkG6clev85CfL4vMoXprD8sOfJYicAq66ylolkW7e+nXvbI43WRWSq75yRb0QlpWX
         vv8RzGG3taHjyqSsKI7djtfeBwaYF5yRzPYIItZr6fZ0TKruOxuWrw3CEFLti9tXmhWf
         eY3AFQMibaF7kQbyCpjWWK8mYnxMVbV3X99a8MpGu0ztMY/R8jsXF0O+v9uSQeSwqIZ2
         DksqxH30gSIEkr1xQxlGrI9smRRJRk7d2fgaE1NeqgdJV7eHs4ck0a6Bmky0Ib+seXDT
         4emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555233; x=1790160033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPwZD0T5gkXfc4kxDoR6r3lP6oUeHG9ZuOKOLS9rEHk=;
        b=hJeo8g8e9u49UKDL7w0fyKXjLHFPCcQXOsfqYlOmKvgNBKwLS/8BUmr1t4nM/ynTSU
         HqShdOX2uKburDljFdnmwyGTQ1VrV0pJlfFkxsTP5o2N/p5UD2217rn6mD5gjQygkCZG
         CIJn/H6sy8MMWR6PeCA/a2KebxpQHfaDcaoUTR5tdj+OF+6NN5bm9UGKUgdjDQ/WneyP
         gSrYk/YYOUQbt/GjG+e1CO/qE4xeRGlVhDQipgDibBbSClpTnLkqBOOVnq1gFI0Pcfb/
         BFS4dVK+XtpTTHlsPG7u1yEayHlY7/HZA/OwCaNW4F/HzuZT8ey6ecVdeBKbHRGC+UU2
         rZeQ==
X-Forwarded-Encrypted: i=1; AKwUvBys50H7LfeNzygKBnA2D4JPFGCIXnMmubFk5DPgDeWoXK0qBWHwJu3FZoalb+tI2SMdFH/mY1yMGibRzxU=@vger.kernel.org
X-Gm-Message-State: AFuF++k2ZNcAa8epEVHGTW4me3a6yPgYFaiodKrMub6BeqhkMz2RfnDF
	snWCfVdgQp872xOscCmPJQaEeM9XTC3BKtSvVivjrPUUqrDwUK67FpWfxCaHHJWGTqx1FZioKu2
	sm0Epz6xfu3DxgsiF+nZWIUSmmTCQd/bmP2SI5xTYd5LBt2U5HCn26gUgdXRsumjbyQc=
X-Gm-Gg: AYBFou1+jN2xAZQlUZeAAUk5/YhrroPCY7PgodMSeIlIv7QCNKP+7LQFhnXySicMCg4
	iaK2GgnmikHgW5SH/4Aa+XZUaE62jiNA61CchtJCEAP8n7m+99IX/VWpR+ZKIHudfvgSkFB5Zur
	2vhCQBM27q0J1fcNiePs4neK1+KYth1TRamiShM9cI8jY4DA1ioOfspkS1TOFBizaah/vF+PEZv
	6PLB/HU5CSoMID2uq5MoQt9IYZhNjjeg6mrfoj2B6xKCjraHyN8THGyrC/1eL7ranPFQU3HvTxu
	m7rJOLvhMwE9uGH2lzSmnCDY0csj579OsIehKDn7LVDLpMrYbgCt7JcYoo4yYWX8pZENDYWhOSD
	7fgz9PfjOsYKjtA==
X-Received: by 2002:a05:620a:1b9a:b0:939:8d3e:2979 with SMTP id af79cd13be357-93a34749cf1mr939027585a.39.1789555233118;
        Wed, 16 Sep 2026 03:40:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:939:8d3e:2979 with SMTP id af79cd13be357-93a34749cf1mr939024085a.39.1789555232607;
        Wed, 16 Sep 2026 03:40:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27a36sm5963586f8f.17.2026.09.16.03.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:40:31 -0700 (PDT)
Date: Wed, 16 Sep 2026 13:40:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicko van Someren <nicko@nicko.org>, Chris Pouliot <chris@pouliot.me>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on Asus
 Zenbook A14 (UX3407NA)
Message-ID: <ai665my4qklqqceqnnniawxaua6w33onyytmsjjp2dx734lkfg@ggpfcz6iv77p>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
 <20260915-zenbook-dts-v2-3-41de8669a7a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-zenbook-dts-v2-3-41de8669a7a8@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfX0ZUh2s203u3J
 lHZXz+UlQMwCVV2uvGP1sVTYFjgQL4Rn98EpIZawpAAyyxwAwGVlG067kWRuVLfP+DBuLWN9oLF
 IjpA5rHh6QugkwEzRxSAl7vUGNCJOAY=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa7221 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=djCmDME5OWOriDNImSAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: HITWyt8MbpGkp5XM6kdWrhhz6whedxj2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfX4lASvRZJLmWf
 mnGKDb0VFwEv8OC9445tdREJMHoVRsAjR4errj9J09WFSp2uUJLfiQsc4pkCyA/RjH/9sslYWea
 dQHS6woKHX4MCyjiTC5Ub1FqK0aFNwv/0cmwPCJDPTattm34W2DAXHWIrXf/jEJzccnUZhR2u0m
 7mHOzX8ddHF+d7iAEkpzSquW6FG0O0Eudguf8WdDQBj9cWOAtKd0jLL39Fi1AucV4XsAZY0xq22
 lDixkkEDE4VvlKZUo/NWjyV2OrQRXW36m2OTpTQxDZvmgyIZl9/C8XKpec9PrEmiIH9AdRVlzO2
 JW6ipDJqaCa/FdVivEuhtlHWUibaRCAjAIb4/VdJ3nWyb7z99a7J4FZreQB/VUnGSTNTMbSGNZP
 XO7FzdW/S8c0jG67NL4Vt6XpZ6mqAUH7JcDDDAXu5Ge+l7OecUm74lw9eu5X5+P0EHyddqhBS7w
 xl3n3tFMSMZNKV6YSOw==
X-Proofpoint-GUID: HITWyt8MbpGkp5XM6kdWrhhz6whedxj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160140

On 26-09-15 20:54:24, Bjorn Andersson wrote:
> In line with other Glymur-based machines, the Asus Zenbook A14
> (UX3407NA) exposes EFI variables through the "uefisecapp". Add it to the
> QSEECOM allowlist to enable this access.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
