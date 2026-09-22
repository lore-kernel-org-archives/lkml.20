Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AC262FD0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073818; cv=none; b=dybEjnwx96+4xmPS61jCjgAAW3XRTid5XMx3T9Po3I7Y3oMxQ1a2ARAWdNIVhPUMG1kcrrNHcyrdjRNH0kHrSwNC2VuvzYLUCgySjmGHUOGZ3eABabg7ZRMJ/t0i5LXA9zNKxrO7HiSoyjNkMPU7Gksfy3+aPgShDH8/VDGRRAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073818; c=relaxed/simple;
	bh=y8nslDYrRo3CXZeMaOPNKVY0V4Lhmd2yLhB+5Zia2pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/86tB3gS8qmDKSSnW/bydrcayGO1ES469JKIOACvcLz3aCbfjVdNaij0H9BeibgyFQJZCZ6GwitWjc4RyFfqJJ//pu3KH6NDH7zxCul2b3L1CJHAzKRXUETkXNtSkfhvUlRhTE+vomTH3yylCNJe+8q0OJCuNMuMrAbHNb/oM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcYIwcuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEz4i0pq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcYIwcuR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEz4i0pq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6tgbR1978713
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f7qSnPy7/N066FUknIaVgEtHr4e96rD9fDVuZ4ulx2g=; b=KcYIwcuRTtAheeB8
	AdvQnGuCoB+RJ+vEGWJNWFyjl25wKQKXesSkZ77L3WsKQH/C96V9sr1ujsMoq1K3
	AOYJc9vKaOaZBrH/tqUdY7377XMvEVFXiaaGVpOgHOwghRlRvgElxkLj1J5LOTTE
	Na4DuVEJ/7uFeuxiFzbHZ86S7fTz7xxwldg8qL8x7+aDk2mBgAjSQhoVEXkxQswa
	uuc0/CEElgVoQ+2sFi0kCvF+M43S2iEukop38XwkXVBLckN29BZpQnVR/MR6PzP8
	zgVUKU7t8mfAiTnWRb8/zFLbCYAkRTSQHw+ID14eKyE9fyyjoZ9gSZZIT0f/MnYp
	3RfXIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0jec7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bfab40895so50639385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073815; x=1790678615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7qSnPy7/N066FUknIaVgEtHr4e96rD9fDVuZ4ulx2g=;
        b=KEz4i0pqpNSgCddSVOqOtYt4xFFuG3HGcAPrQ14nMkzkRAKtKzqGS27Fev8y+Kigie
         2CDKf00GAy62dc2neuXbrdBAL7/SxW1HbP+Cb2OHGyNLtOnsRlpU9/0N4HBUGvyUP6nV
         sa2M/MGdS4bjPeqX+naUdzzNjBN705AUsGz30sDY9D6bM1mNX8QAfnxcSJ++Zdh6ArCJ
         1MCmD6THlmeIdg5dAzD9ZoXuGvPQL1AErpSISrWLysACNkOZMvAnFdokg1Tk6EQaXQP6
         duBjuhhBRhHoTLwJN775hfPVDYSirheujTE/HH0aMGM/J8ngW5sSlMhFsy/kHy7Aue/q
         uxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073815; x=1790678615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7qSnPy7/N066FUknIaVgEtHr4e96rD9fDVuZ4ulx2g=;
        b=AycsT0mtphkajWcO41o64qSYkkD+rb7jJjbCmVruZoJpPCNaB0TncTu3QD8uoAlaYK
         9MncV0FFjCi6C0IZsNXiFuwLeIkvJ07PUvCtWh4UBAYkMXl27yqH4KSoXkxSoLbP9IiZ
         h9EJXwQwDfD5HW0YROaClcPH0qpuyuoX2jUnrlbXisyyiPeogVrCBsDAc2EUMv4T7alu
         1SIlWdc3NANnQbqzarBAfA+F2+WjDBCH1Qmev4Cc4HQhyB1g8sjO3piY7XENlBgQOeoC
         +Z4i9qBoOgEgDUEt5JIFt55dCVdJymI4vlbR9MwjkArf3/h3DMKCfu0T6d0sbW1T+BtS
         9mqw==
X-Forwarded-Encrypted: i=1; AKwUvByv2fz95GYgw3Vxz9yVATeB/xLcpNULMeP0rVYuPMz6WYZ+xax8Qeibko/ezf+g+U+EXFWxE9uGKIQm1uk=@vger.kernel.org
X-Gm-Message-State: AFuF++lp8kLUA0BQV3hBgkB2YMCcZZI5ztNpSR25cP6N+hpWswrZ3POY
	7K+PocqaQZ95mDXxiYrUP6A9hdfldvU/DseG8zonpm5gYiypHOBQC+R8IsFRHjgdiH/XtEy3QQj
	rC3RH1fOCfthxVXUjwqV4i5RkOXmcYAjV28/8t0qdE0XF/JLAiPW8SZmseZsfrgBwVEw=
X-Gm-Gg: AYBFou0e+9Q3ZaIz1nFdc08ZDR5/jDS7RLZK2sBtaEMcGDkI2QGYR/5UWoREt9qD/tA
	X0VMr2h7P/q5rhkOuG9yG40jazhDcQb+UlnVkZE0+pJ2Bldifee1P34/uTJOIZzCPdpYSoGSNtq
	I6LBEhOQI+KctDotKfPEaUSXjF2fv7YC1GvnfCS+s3PRgXekzdrDy89bXtgoGHRqzH5L6mzkFLk
	T4TbuGfajKNzowLo06Jl1EzEkhJd43ef7xWCOS/1n0nlT2eLPc3uYnB+CzSyBqbr7d9R5o+tbox
	vhaqR2P7cOzhA13bxIbRsolVta9d3C3r21fdD/xa02FpJDan7bj3Kc8stGlZWdiQNTfUNhSTHW9
	o697aTgWVdRC4oGh2XIcXUg==
X-Received: by 2002:a05:620a:8014:b0:939:8148:1e3d with SMTP id af79cd13be357-93c15e33943mr466928385a.2.1790073815592;
        Tue, 22 Sep 2026 03:43:35 -0700 (PDT)
X-Received: by 2002:a05:620a:8014:b0:939:8148:1e3d with SMTP id af79cd13be357-93c15e33943mr466926285a.2.1790073815216;
        Tue, 22 Sep 2026 03:43:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5e6dbcsm64722266b.41.2026.09.22.03.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:43:34 -0700 (PDT)
Message-ID: <5e34e8e7-a049-431c-b5a4-1a2560e051ff@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:43:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] firmware: qcom_scm: align PAS resource table retry
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
 <20260921195636.1925869-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921195636.1925869-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZMhKS8U91CBB7CeSlKCDHzk9zq-5vTfB
X-Proofpoint-GUID: ZMhKS8U91CBB7CeSlKCDHzk9zq-5vTfB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX/jbqv24PXOoM
 nDR/I+czaeJu/Y/p+uuQPcz3XbtoZD47Ym/KTe6mgL6VS0FpWRsdpJZPr0rycS4L9ui0wPA/3Px
 W2MLIWvqE2MW77O8lCX2Kt+hWGBL2YNWXxpAuttjP1FgBM6cJ916DTQDhgeXGvZknY561A/mOpq
 FIatPRdiuO6/hC3Dv7kneucbH4Xc1n0ZHbNv1m94cQCIOlRJUK6lODPasIIfUIQ2RvDk1GIY4jR
 fghFGDL7AzfS4cTA3jxRN7y5d1eQ/7lRNIuK3D1NIm4RJV2Zn0IGLG87B5lIFcHYdi6pdAcRWz+
 UhLEIyN7T7hlg+Ap//XaAW7w5A2DF4z+MoIxZSlPkKtnsCO+8yoT0Kkt9CMJ/2UY+kmDTXM6A5B
 hqEI50KrU3/0eKeGwwhiOSK7QI2oPR74RKbiKCwTSIjU8CG01M1/zLQFdDUzxHqzg6n2tlrACcq
 AI+Aj9O9FZZ4TxI778Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfXzy5TLC1cVIY8
 ysJ503pmBq/Dn/iFcfq/lGEdLkoon4UBHNG3tawriPN2HtyK1iKMhTA/iNuEw+8dIE/qWju/+Th
 NawoKn92M+AW9y7dISM7ciUvg2byqIM=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab25bd8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iW2TxwROTFnyptqOjDMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220154

On 9/21/26 9:56 PM, Mukesh Ojha wrote:
> The initial PAS resource-table buffer can be too small. TrustZone
> returns the required size and the wrapper retries the SCM call.
> Although qcom_tzmem_alloc() aligns the allocated buffer,
> the size passed to TrustZone remained unaligned.
> 
> Align the retry size to a page boundary so that both the buffer
> and its advertised size satisfy the PAS/TrustZone contract.
> 
> Fixes: 8b9d2050cfa0 ("firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
