Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C9F47254A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583818; cv=none; b=dSyNC12Xwtb6t2G6JzeQgJJfyqMhAVNfljQR9VkzWX/mtS4bDdF5k56C/gnjb6eRzEz1UNXvmptrpN5SvIwyolBYnpabnVxQ8TwId6ibiU31WJOIasD4bg3QWYJwsXtR3Q0+R6+3wTv1i+qo/14gKdqn4hlbBxzIk88bbEiSXpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583818; c=relaxed/simple;
	bh=KEk8M3Jr9bOSMMr4JBrAPiz9BZKVvLlMeEqrlsez2Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ITx9bXljFeygHe07YP9AzSDK5ZTTuDIZ7Krp+WK5JqRm4wmc9zbea55UUE3C+C3nKuLzBHvzXvJYh3LixGtsC8oHvCjX3z3BRV0FjKpqWjeeEPp+90gcoEuTzIzYXuZn5nYSSIyj8+LanMHBc1qmTLC/9yBRTamG5V44x/1Es4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juAAtRwe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKZAqTRw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juAAtRwe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKZAqTRw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xMCc1010227
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEk8M3Jr9bOSMMr4JBrAPiz9BZKVvLlMeEqrlsez2Fg=; b=juAAtRweENLBLmQl
	+ERIaFv38jDpKH+ICBdAfD15GUU6MRom+B600xtPxx5fqSqZaWt1Uy/I0oZGBOZZ
	7wkuxzeBpNpHsvXLSvzbk14ENd+41hpnYr6llQ6RJzBZHwwWj8AktGcrPXHt8QPk
	pCWQj0h/BmA/DhKvBdvuA48aKs6BXeNNlEI5GWIkdDghbMLrPi7pxkQICDnwvPGz
	i1h31ekTTmYEkHqIwCN5y5F05IkToNx5o4D0hGF49uVgTAaaiacOi7T9Nil1LGfD
	Lsph3OvkYabzJjsNp6+48X33NzhxXjyoq847itdW6+g9C5dM7U1G9ll+kf0JFfpZ
	zDZghA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s0kuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:23:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c57e0436aso182266085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790583814; x=1791188614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEk8M3Jr9bOSMMr4JBrAPiz9BZKVvLlMeEqrlsez2Fg=;
        b=YKZAqTRwxjR8SQgz+L0gPGn3ebMErxD9xVB5mkRTk+vgDfjMRhoVmp0AZS7z5grxIC
         E/brlVP81rzUY3b0JKizWCtETM5y9yow9qIFaHeYjPNokHwZb7Txvb4rmgW9l9iP/8pY
         L3A/vhXIMf/G57Vj+QM0nIyzzgcGjEp+HNYtA22AghLBVIYZJ+1/eV4BRDw0AISRMeJP
         0lY+pA9m19vYsj20kOmu40fdXWU6e4jcr6yibNXCf/MwFF7jlYVccYQuZNHV2MusanSd
         bILdcgzOLUKwmEqoqKq5we+W6QyWrzT36BLrDZyhEZSRTRU+eHVcCm8aHFGj45OcpzXW
         znSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583814; x=1791188614;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEk8M3Jr9bOSMMr4JBrAPiz9BZKVvLlMeEqrlsez2Fg=;
        b=GRxNxZo5zRhf3T8T47/0SD9fyBO/obW5iVxC/Pf2RzRaWKwdTGmdxddmsnKGA4yrMy
         DHkF0GH4xMY0S5pVwIStnj3diKq+IknwFHTFAiY9tetVeg/F8jg/4iejpayuXAmQPCcL
         hG6ctfJmLN6FjU/rwVrKJvAIsh960JE6md8iIkaA6CKl+AfCnQjRGUpoklPgsM+5HCTn
         /pYOuDaetxNZRdHQrCJkRfhdM4gtG91Gy4qU2Z43Gbc3eI8X3E8B6tB0hQyNN5pTssQM
         x6tmZdxtSwClFztDB/YjZVN+w9bAKzFTFumSh0IJ/e24qHemfdGRGNTf8MjueDGZOol8
         yc7A==
X-Forwarded-Encrypted: i=1; AKwUvBymNF3BhPsVZWBTNKA5RwAtZGG0toyWA68u9AnqoC5+hDhljQKN9OEBdqKLyD2TDpu+v2JFnCQnbbtH8EI=@vger.kernel.org
X-Gm-Message-State: AFuF++l4rQF66/durNjPM5AgtXpeQHlmHNnmivglhzl3JN5sNSmEE/t/
	eHSUhMONsC3sLobNq0xZ5CaBF2HzuE/xiflh2/RG2AR8Oka2p9lQhSUZ/EVCFT4B98lJmm902lB
	wtlLYmfT55sur7A9aI3ATl2/tBs5K3Jo7DBj1xdhkD9YgS6qkxlU1AZPsBE14j2OzfSgY9QGUmk
	o=
X-Gm-Gg: AYBFou0bt1KG3+IajMa/M7ci4vkvzPIZM3S73u2xM46DZEY6V8KJpo4mqUaVNyYejMg
	TvPPWwDZPMw+U1RZLaGNclKSA4D5qulijpwI//yofUhJnuruoXNK55NP4CZtG5q1M1vHeoPTPJp
	v/y85O15plBUQeZSgqUNS+amjet9d5MbHVmH52PoC36EW38VwhENYQRrUZwLVyLCNtAX64Ykh8i
	iHnOXShSe/h98tha9kvbTO8NEix35zADIUA7p7ottJpu//owQm0FNhCImFQIMrK/LsSS3Ky7QQw
	tTmBKxELgPQLgdIg485IZC/5XDxqRM5L+HGjH4ofbpK8aPPiwMnsChW7JkYcmYP8YNE62GsjltN
	JzAU1feBy3bXG3nBIVizHl9Ity8eF
X-Received: by 2002:a05:620a:29c6:b0:939:ff11:5328 with SMTP id af79cd13be357-93c43bf14dfmr1902392785a.24.1790583814454;
        Mon, 28 Sep 2026 01:23:34 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:939:ff11:5328 with SMTP id af79cd13be357-93c43bf14dfmr1902389185a.24.1790583813905;
        Mon, 28 Sep 2026 01:23:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1a01sm20537165e9.0.2026.09.28.01.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:23:31 -0700 (PDT)
Message-ID: <27997939-f39a-43aa-a287-44c9f70b8a51@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:23:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
 <31a59040-bb20-4cb9-9dad-a62b90a16c6f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <31a59040-bb20-4cb9-9dad-a62b90a16c6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX5ABuYGs3bceQ
 uVAzP4VW1e4WXkarArxDuVZb9SYTQLhr/uUYjFhbbOVJQ8DlPFnXGJ4edXvDs9Dpfw0qGPwgUNo
 TamITiLauN06S3iMqCL1Qf4AfO0/O43Wf9tOK5/5Otn+Z6Xsx9k28R/Jur31uYEzinf3g4omwan
 RTK+hfgNwFONeMxo+Dti0jeb9TR2qwn7pQQd5ZXc+a76XLLACCouwauv3oKpLyChmphtXzQGxRV
 ozbrS97PHvLWShsyqMMsu1i//MjWpdzDWSrYk4Oa0e0Ag8MIl1dUskLhtVDjYezLSYxaCVeKltD
 j8vt8t1oI9QAv9h11V5sikvDEGyIQASo+1gM6z+ZP3QQjLiN/xuZFD33sAv/pDX3O0ShfMYHGxZ
 y0agd6z3JW2yhq83m0R3hM/8smc5geS9E1NWQuNRkC60b9NaudkgSlcQqcvDEzZeVCpMRVKkjgB
 e93RdC93vKlfsXSjU0A==
X-Proofpoint-ORIG-GUID: E7Epz8rktejZ1z56_fAh69TeqDNQiMHn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX4peXWnAWUcaI
 Mi91dJRtrlnqApFB2IgIMlmjf2nQSJmzMlawCtmhnRnRpFhd/emSJ+UCT/rFa0X0L+n8khdvzO9
 D6WWGGWTJtbxNQVhr+MFLVO8xPCga/s=
X-Proofpoint-GUID: E7Epz8rktejZ1z56_fAh69TeqDNQiMHn
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba2407 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eawAJn3Fff_qTO2XkYgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280033

On 28/09/2026 09:19, Jingyi Wang wrote:
> Tested-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

NAK

You cannot test it. Otherwise explain me how did you execute this code.

Best regards,
Krzysztof
