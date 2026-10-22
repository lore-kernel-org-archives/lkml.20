Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661107;
	b=lAXDSSIgoAoRF2d2g49P9XODdA+lFPqwcsxoZMZ2cUcvcc2tzXdq0NB0hVvb3eRVqFr5
	 V0fM9nZ8JUqRxdkJhtz8huKo4/jWfyqNUaf9DkTWtG6ivSexD8ksnFwcGSbXR8UxN7FQY
	 e3KFZeZXryxFWCOuyANZcXIJxyQLcRo4UlthlLaqrWI2YwLBCoSWxOqFoYWVsWtm9AvB8
	 6kxbpgcWvi4BqsUA1EkuwyE7BcKfyQjc5Q4d6GPYLuEsK+fji4gZHN9dKe1el/Ygsn8rQ
	 GkPnI3wMSaOmJxixPe3+01Pod/sGKVl0NVPazIHHfgmZwpZKGh2lKJG7v+pt1eUPcrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=;
	b=SkbQy6YQ8bcm9EAUnq5maNH65LlVCscwwpCvIchhFFW2DWBiDTz8pcLGwQl3Z+6p/gv0
	 Kav39GQCXj23DioIAGcLt5pFoV/Ii0hjaOHipMLYp3OX4HePNDi/NgdHxE0ywRv+GwfE2
	 QPw648fNBlKav4zsCvu4ME40mF5bKpnZSL1muG4No3NWqicqk0IUsXlAc+0LVtM0XZ4AK
	 h+vJ9svUekvvmhw8bOqWQM0R1fEfvScdLd/6iAIttPI6TdapTtky1ZP+rzYw6f1EGk9lW
	 hkkwssscbhcg1KVl3hNd0UtH9bragDcSr2lTPfv+aHNE1o/pstkJ8lgJlnOBNwZotlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C8DjvWhK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPI5JC5s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C8E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9C8E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C8DjvWhK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPI5JC5s
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M703rw3076705
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=; b=C8DjvWhKPSwpRQ4d
	rw41rBEkaPMe6iGTZYzzOuDe6vhj3LT7InylFKVRaI69dK7LIRE7pHBSfA4cQgfm
	kIdyxUmOw2xSwKCP9qw4tGCE8zgDUhpZXlB9xaHe2CbUPL2Xkocv2gHMlth57qjm
	h7MitYMu9ftEQQbwnJHOLSbsXMnpcvDMmzxmdK4Wd8yEHjSy9BbNe0cja0QrQxW0
	Aj3FhUikXyA/L6VoZH1kJhnloIpcFJn+b2AaaKt308Wy/9C76dhE+KTn7cF/teS+
	2TWRa8v8T0bMACCYkm0ww6Hr1xr84m4EY1x33fgiIbfPYZ/WXpHrhjNyTZxBHLVL
	rgGbew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1p28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:25:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso29108785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661104; x=1793265904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=;
        b=KPI5JC5seiCV9gjNNzY2sODQ1+/DEOQFOxHxPnXwT0xdcTd+HzA7cXafvJCZ8yPubw
         vKo2tkPqAii5f6BcC6o6p8aunSVg9ERTLSiJLPuzR6Q+oMx4Gf26GXzkP++JX1v8v8rm
         Grv+xclVIC9WpwPHebMG93ACDPlmTeYlIgAmRmkz5z6tlpvqytkdZ9AY3VVnBT5CVXJ3
         SS7BxJvzZCf5tVSUWzJHYYQtQ83PI1jBEle4QLWZWa9CSAGKgUFPF4QTGN1T5xzYiziF
         6EzNqVEnzD7/47TlRH2jhG6d+/XXuRIhDpgc+TrBKah8NsgWAK92tZW3HRbD2ZYu9s2l
         93tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661104; x=1793265904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=;
        b=T+1Kw4W0Mk9Q4Xkxt3A2xpBKzK+p5TsJf5lz/O+SNxV4Pj1MZ/5FHNXRnEXyE4Fry7
         1UJxRytPRWN3yIbO9eXzHQs7fyiEVv7ZS9BJvaP0xhH1EeS4gVqvM0ir6F4yhn3DeEnd
         uY7lO7LL0/lTxQWyy7SHYEMZoYUpWsGoNaFGZcKJ0Olap/deI2zpeuws+ll1cSOKjQCL
         tP6xR9ZE3BHsOlO3PVx/LYKjEx8OfEeYZNzQBYE4Z86p06+LuSllVoJFd/Zc6sCafufK
         29zpbtJyJ9RUi2zA8AS7cn8vXZhCcTGN3iwMKrE2GC29viAA8KyrEGKC41w/Bfd5sjsb
         1LFA==
X-Forwarded-Encrypted: i=1; AKwUvByujg6C+7jzq63jjlX6qIr+GgqQ5nb+lS1MFiGIwz6WGn6Hd8N8vZl1A1nOr4GSnGxZa1cFTBafhtNG/Ko=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBtDP65TxTLDT7mZTliCpd9PL+eFMtPo25ZqclCd8GQC2MTH/z
	Z2hjmjNMoSLY3vAfF4YQjNvzWx6NDDGZuLVZfvPwAnQOk5oJTuhp8J0Y/nRa23K2gAgTgh/n1En
	sE+QiC7tC9OCx4qsoij9p4O+bT9kbrPSZaftcuVKkN70+HxCNGnlK/2ZyQyj3JRe09xc=
X-Gm-Gg: AYBFou1wMl84aCX72JOl1Qqj+3T68mRdft66ae4EL7by88doOumbW2qKcJgM+6UVgVe
	mFS7xST+CuDNJS/hXZ+ZsGQPQoo6gbfxrkLIoFvlrshvvQqSyOsm3XxXrDVN0VL/9p/TtPaUy1a
	X47dx0eMvObFpWG5yIhG0bGzg62R40+x0wyzCNLw0YRQAP9VHZvUi0FSwShIcYoKgymdwbhW/Rj
	rjzC1cDN/ECpmbeAW4PNCsIwbLGkMghQH3Pr8P7OBA4ISRcCYnhqdQNQCOBRERX1uWQCsCGV1G0
	El1SSHH6zqalFSKzI+bSeECRIVbJ3renqxWb2D5WCW2cAb5Xx74lX9YutiOwQCXfdHZPmUTch0Y
	0xD30c8srVvC6XeeLKPVrew==
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr986884385a.0.1792661104184;
        Thu, 22 Oct 2026 02:25:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr986881885a.0.1792661103736;
        Thu, 22 Oct 2026 02:25:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130703sm1601567a12.24.2026.10.22.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:25:03 -0700 (PDT)
Message-ID: <91fd4f3c-ae73-4a51-8349-6c75b99a588f@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:24:56 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
 <20261019-kebab_dts-v4-2-bb6db87ff15f@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-kebab_dts-v4-2-bb6db87ff15f@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX4Q6JYvc3ugYk
 M2WB7qcWVH+SvMlFsMDelgja59Gbir+0+5XLHWTVYeSyXuGaElTu0Fm7o6OGQc0453Ac9DXGhce
 N9CnQhsNzp7vrt0NUlOTE4Eo/uktminTt6hwj92v5+LOqIdkj5uAyfukWjDM0Nvwp4TCO2qkhIb
 myCaddQH/EVMXZDVTjNByd6k4oDJE6AHQLYBLnU+TE4mTIAlRTE+CPFv+QYMnZ9FRiC1IWQ2tPA
 vKYMPLDE9fPRBr603RR13AOtDeQHZ1U3m/FfKXiPxDIUO62xIzcjbCnMc9opq2qGdDWfHFTELxR
 p/LCf+Zrvjnsq6m25UVKk5CUBMFsoSlwB5vhMWy17Ncyd7lrZ76XQTfn3RfPFfmk4d4EoH0mwXf
 Y0C4t+c/zJw+zE5geXIrCAsP9ISipJ3HZOjFwqGcWIZLVaSWtcugSd/qJP1IpB87xXRQtDoaPDg
 MFFGFLlIq8jrEXUdbmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX/MpuzkY7oHaQ
 xX4/Yc1kAa76wj6GKLAtcjRgb+YVkq+F64Cu+Ps1psDVrWr/AidNUEGV2dBHOm+UlFvKlKqhABG
 np3E2DX6KjaM9YKumtDf11Ve6/vEJoY=
X-Proofpoint-GUID: Taj-t1XtqayRftWJ-At38TINRAqf40kT
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9d671 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=EUspDBNiAAAA:8 a=RDJzJV41rLCqGB0F5dMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=6aV5INxNnvWGCTbEtcBN:22
X-Proofpoint-ORIG-GUID: Taj-t1XtqayRftWJ-At38TINRAqf40kT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/19/26 12:18 PM, Frieder Hannenheim wrote:
> This file contains common properties shared by all OnePlus devices using
> the Qualcomm sm8250 chipset.
> 
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
