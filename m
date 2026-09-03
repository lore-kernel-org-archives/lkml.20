Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC1248D874
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432547; cv=none; b=sTxbX9RIYZLvLNAaOrB0Qfe0IBtSZrSmqbSw1V6icqkLyblZBnxQRB/EEJRkIRQNNzGKku0rH2qoUTTKPlm2QeBouC8HMKLi8uVUPNeBYHw4/lXAWE8ZquxAhOwntZJ4RAGXRvtvU/bUpeui1lBKQDolIA79Lggoi/sG+rhWOqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432547; c=relaxed/simple;
	bh=V7R2HXMAXtnXdXbsrItTEEjblLgRYDlhM4guOgcUeSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPM+KguTBDNpU6H50W7bDZzQZkZBX7q61gcqKU12YYco1tkny9UlwHEEEFcja9Aot7DXo6nXnlOBBgttoKHTlSCsW47F0IE3r0WqrvKt1AhPoVWB9kplXpwagrR9yCrPK9TQPdHt0M7x3RTL6D87iddAcCJm64wCmfG+rD4wIG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpgeDPV2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/W2Bltt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpgeDPV2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/W2Bltt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHKlw162985
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 10:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bj77K4p6UpDEEg0r6KB3ffanZ5d4kl8IphnCYqVqFCM=; b=FpgeDPV2TI+lgBUq
	C5W5hyhCqz/4QFsOiT/VfgvEOJOSiVdDeY7p623/nksy7hE2gOHtaGz5cTizWF3/
	zMkHULQvR9j/aS65brIlBeIb/r61zkPPQzOb3lsnranMbulpN1Osvpv+8xe2dDZV
	uD/2fD6UU7kRW5wwY9hd4XUiZ2T1QshqmAsE2XwnKe7EwV/SfDRfGKV0lGhIP32a
	uuwuPPk0I9QRK0xWGXAL39XhMBu3j+FElDHt1BOb/VbZynRCR6Bi4dmdveR+x0v0
	07ut90elCu4qXE3zJmrvwlPqRkxv6Nj6G/FBDS9jaPm48oaGimM/RUDIqgcKyIRq
	98QH1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx05e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:49:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a312222dso38747285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788432544; x=1789037344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bj77K4p6UpDEEg0r6KB3ffanZ5d4kl8IphnCYqVqFCM=;
        b=i/W2BlttVFEglFY2xSV3WlB2b9GNVgj5yOJ+ML52NlK7Z1ZgjzfGgcsUl8Gzs4VCB1
         o7yGtpnOuQ4hHsHHKrEnkihYpCKzfomzf1vYWiME/cctuZN5DEtIRWphWgWs/E1ENI9b
         V2gVo3gVPUHUoq/krhfXmj3UYWHJ3To01+30pWqexBxqzktMELmw2Q1LCi5MFjtPpeNh
         A854dIuzIVfRuUNniblC/Sug5trO8jX6waxob4LHnWvboJ0xjScS9ftvom/FWHn1J4dO
         AUn0KguW0nwVT3eyD4Rxb7httVVyzE3I2542sthBnBKNZN3KqyuT2y8sId/RdjVdzHpa
         7h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432544; x=1789037344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bj77K4p6UpDEEg0r6KB3ffanZ5d4kl8IphnCYqVqFCM=;
        b=WBQXpzPA9XGX4P/VoxfaknAk0YlP8tor13vLAshuzRQQDcynamryHHZEHl2MIf4Qe1
         DGmgNQ8+Adfqi4e6+B66zuT5FE4nXkVHnL0M+Tl6qdTObcDMYFwfvF+rXB3TFcz++7G1
         bPU4RKIKK4eeMCv8NCiDBrjhoTKCOLoZCrW2P2bEI+HFdo80icfoPata/lBGYVXAPNwI
         C4jKypIBEaPfNFUKz/gU+Zgat0fI8tNOwV02VexmUGbTlNjMVd1f1s5/uYfpZ9ixAdpT
         1mVI7B5ffhnyek7a2AquD0Thpl1I/kW8QF080mbAsDfX/vd2aEueZr4t28QwAXnqoEGn
         jHKg==
X-Forwarded-Encrypted: i=1; AKwUvBwlEOqs3hijjrcdSgrIZzl8LcDJsSSo9YYZPHydVOQfmR0qkWWOmMH54mtnkwUGxhP9b/vtgC9hnwFWv8s=@vger.kernel.org
X-Gm-Message-State: AFuF++k4tJ040qss3QP/8X8EBuzq1Xsv88fL69ft6SFpp37jfLcoBDri
	1Yh4NogLG4v9NhUz7KBrgQPu5k4gM2BA6jm/Gxnb+xSls4TN5Poohh5t38EFcyN3onZUtU9rS2T
	EgHmvXFabvchpaZSaEnFetavzGpsGHIH8uZrVRBhGk/QI67kpLpnM4yvzsQdkz7e6HvA=
X-Gm-Gg: AYBFou0nHxvrRLVE5D5LJD9qoEbMJbKi29gEodsH9ktXfNmfmv/dgPNFbKfXiQIOSXl
	nZV0QKlX/WWH4mW7VanNX7UANbqitj/mTpHBcMlZRex48WIxSPsW4CjrnccZat0nTPEtpdzYq9h
	queWcArnNtHgjg6OllWHM2nb5w4Q/9MBcpDd3SV8qzMH9nVA+2yAhjwiqzXvNsrzi7353TZ5qdc
	DFjsrljDniM7kayF+9w5cdHSYqFYKllECS2w5A8nXesC0F5x8ghXTqSTygIL+lOz2hVQ8ARdrZq
	aBcyYmjxUvxegBQ+Ks2EI4MkBp4r0I7qE5wltkcxMauoX+iCr+BaQhbQ5thR1DBo5x04Lemd9a7
	rLvpwLOiyFvG1v+47Ya+iAQ==
X-Received: by 2002:a05:620a:6013:b0:939:47f4:935a with SMTP id af79cd13be357-9396108a4eemr834208985a.5.1788432544242;
        Thu, 03 Sep 2026 03:49:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6013:b0:939:47f4:935a with SMTP id af79cd13be357-9396108a4eemr834207885a.5.1788432543857;
        Thu, 03 Sep 2026 03:49:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41a028dsm81640866b.27.2026.09.03.03.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:49:03 -0700 (PDT)
Message-ID: <e637fadc-7107-4d00-b763-fb9f0839d8b9@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 12:49:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] rpmsg: glink: Split protocol start out of
 native_probe
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com
References: <20260824-rpmsg-glink-split-protocol-start-v2-0-362d7c233f66@oss.qualcomm.com>
 <20260824-rpmsg-glink-split-protocol-start-v2-1-362d7c233f66@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-rpmsg-glink-split-protocol-start-v2-1-362d7c233f66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: laROiVFIg6Zw4T_mUe9b3xSXJoAzqWAA
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a9950a0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BjwrqDpGRvodBn1_W7QA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: laROiVFIg6Zw4T_mUe9b3xSXJoAzqWAA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MyBTYWx0ZWRfX1wk/EyOBJfrS
 TSGKdnYqNNZkJ4dNgRBYKe9qSb8T4LhmiEPzfdsEW0WEx9vL4soedf6xF1UpY7PbJpdjKVo0l0d
 roCLXKaL2A0IVWTsMAD5yI9DbEzKS4bwk8L0ECH8ipoV82LAsREjLQ1+yZ0zrm+xaPJG5N9hDcL
 4GKxJVoJFE5jrs4au88twShDexvRKo4Gg/AaABT73eseeSTtCGhaGzulcbIQOqkS5w81hL+NHQP
 WKJFIntELeJEjUbhuhVJfX29uBynOW5vChQnNFfHtgUiUN0qGINiN6hRzJiqs4A7hL+9IkV0tX/
 LczDWXcwkcNXTnwYs9ebVhFX1BJiBCmyd3NGT26u+FwuMvp+teXYPzae820DC1uLl+YbUjUv6Kx
 J6W8m0w/MlwRFVUnVpgbOpAjARbK+4RGdH96715sLRlTwuUx9kRrVmOp9LiLb18rN61rpJmkwo8
 h1QpTT7KKC0JzIaQJPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MyBTYWx0ZWRfX/3ovfqsq5nwG
 4xIU64eeZWqSZ16UYyOmpWcHPUHJU7Krr9H/CoKiqsVoTJBazqGpzVxd6cDCHK4rxeQELqHP12p
 sGbbqvpkaog1xnTpzP2cOWUKAsBmF4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030093

On 8/24/26 9:05 AM, Chunkai Deng wrote:
> The SMEM and RPM transports request their receive interrupt with
> IRQF_NO_AUTOEN and enable it only once qcom_glink_native_probe() has
> returned. But native_probe() sends the version command, so on a fast
> remote the version ACK can land while the interrupt is still masked. The
> ACK is dropped and the handshake never completes.
> 
> Move the version command and the chrdev registration into a new
> qcom_glink_native_start(), leaving native_probe() to set up the glink
> instance. Both transports enable their interrupt before calling
> native_start().
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-5
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
