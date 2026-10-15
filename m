Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A359149E14F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048511; cv=none; b=RXHV3VWlilS879/TTnA+tBiNs+JKqncpr9+vneP5LHeomgE98oTtcb+FEZYa/Se8kwTVPiZk/Urfd0FQdJGzh2VQSpHEhX7hlwv4N1Luh1FWopjfng0ivE9AJXxJNI88hSqx1jQ+FfYr6DZcRS5LU9XN/4lC8ccaI6L225vAySE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048511; c=relaxed/simple;
	bh=NTYhrykTWtTBp9V+M4bLcII7SFmdACoA2QijUmOeDlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=spEilMH+Npm1uv0vVYRfWamTLuLIGYCQPOIqzJwccgkxitEdCAgUY5IsNWaIGIUracOyqUsOYyFAtUOP4OUBXV9DZgGlVcYIkisJnQDwK6rbSw5XLzurujKvJaN9vlqdErxN32G6kuoXrd5potgGhqwY4lAE3ydjb/+xn1/EodA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbLa2p3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/ZL9B5J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbLa2p3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/ZL9B5J"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2K6RM841683
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KeOD1A+VdtDO2QTZ6vSzekuRwWPEc6a77wmmq752bMs=; b=gbLa2p3tR0PkBx/H
	h0yrYWNT3kkBE2J1Db23/igRBTZRVn8k8s8scP5bWJ4KFX2qQz2TIsLbkSy98P2C
	MA8hCDJoXvjVMDD4Ckclhpx5DzerpfbX0mON+G2e25VUqZhLYLv7XlPLlHBOBUG/
	sjj+VKXVO1cE2kYPwzFvsBLO7IP21fbqLVKize0hRzRYmShSCvw8M++35dVUqG1d
	CjgJrpgLN9mb/UiB6A5/l1th91bu0mGLSfp1JRUvNUJCku3K+YkvEpuPIndYS5QQ
	JUanF3gBIOemujcUaYikbY1U1fB5uDr95rhGpga933xtkxJglHCSQ1znePghb2Rv
	FZ/MIg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wtpa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:14:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso1125606a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048496; x=1792653296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeOD1A+VdtDO2QTZ6vSzekuRwWPEc6a77wmmq752bMs=;
        b=W/ZL9B5Jkq8NgR4DKf0L+EO/6R4rISpCbM1tP/1y8gMYVkGk00DiT1f9Sty4K4KVeb
         NSOemtwuOy3d94EY9KTFGb7xSG4eIGRZshOX/x2ZRbWyvWunxH3nQ7XDg6Sg0pr/AKRQ
         JKa113pSRer7ipc0Rz4aGOFunk8xbhqwxCw6ii1fAr8YCXGWSzo51L6EDMfSSNc+FPs7
         vIOuZRUNkqnrj8MgQMBmLqsc4vJlxRpZr8x97jyoQwGmBlCqfheXDfBQadLiGmPx/zva
         ucQDhmRNprxjjMgzW3v/6TdcAusJuAHRYc2+lutit/fbca3wiv3n7LF6DcFagkWrYmCU
         qESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048496; x=1792653296;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KeOD1A+VdtDO2QTZ6vSzekuRwWPEc6a77wmmq752bMs=;
        b=hrPr1TXwzB76/AyaRell25MZRbRQR477Fn0Hd3ohYPHeCN62QBjuAIDmycccttt9O5
         PUah8xsBBGBtWzMITY6sm4Zr1fxHvrpCsCdT3GU2qHZn6x8o4wZK4i2h4fdA/bVvYUoL
         /HTy/gm+PiJLGoTkM59+YiD5/4USEfacTeFrizv0P41d9mymcxQFnNt9vUDIpZLkUuUy
         FPuFwJdeE/zwWhIE7UjKCzMfO5dMxiC1QwaecYjJhB8nNdFtWD5c4aO4kmqSAC8geTAw
         CJ50YfUzQlCp5KO/mfpkK/m51lb1Wteb27IvRUiXl4X98MPOkJemHJUAOoHMwsAbfopI
         cjAg==
X-Forwarded-Encrypted: i=1; AKwUvBwoYzwVAKQDe1f+bOmmVIQr3qXOOZAtpNM0J5+kUcqadRh5TxxPI/h9UX6uK0Ul5bNldxUguUhR7tZ8vWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmV0VM+W3W9UjUiwo4qU6V4x9oWIxMflgvtutSmRoMUkefdyqt
	BviCLN09QK34XFWqDifwW2to3v7t3VO8mbvL3Mk3h/setmxzdlwaD+SYTe4cKkjW20p68+KXuZR
	wh5W87UTfrVPJWVDHTnN+GFaFSRqnVoUX4ZTUw4ipsdUILEr0JL1ucx+2MppZ6O4cRI0=
X-Gm-Gg: AYBFou0/yteTfzKNN4zqevH+btyxLnYfUITSZ/HOKXhzraXOTdOMnRUCOTsOt1CrTft
	mPL0caAyOspOrWWc0TmmMfiW398TJvO8ANGP9XRTb0oIniaaE5Hm2p0E5TpTZdTSS3J42BmBJER
	2rIGJpgMJbCnRFc2o1X5ILK8OBmmvrxfO2+ZkLS40AsFNBH/qjPpg43acFDbjke7c6c92K/+IjN
	5Ygi1fgFMnpN5LievFvEMjkPoLdcdMfNyKr6CXIYdBEvMtChNuw5Hq3V7gfHywzZ0jx+cY/fGSr
	yNHXIx5yysmectrTub/zs5UuM+afjRBNztQds0PJ/AcpAli5ZB9Bg7ogTDmniYpNqK68AUaFFKc
	TMf9sQgzpBkTRCB1KnRrqtQ01YKM=
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15605987a91.14.1792048495556;
        Thu, 15 Oct 2026 00:14:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15605924a91.14.1792048494262;
        Thu, 15 Oct 2026 00:14:54 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3221300a91.10.2026.10.15.00.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:14:53 -0700 (PDT)
Message-ID: <84c2e489-05d0-4acd-a88c-ffbdcd111f67@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:44:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
 <a516c0e2-0ac4-44fc-99f1-ef8dd051fc18@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <a516c0e2-0ac4-44fc-99f1-ef8dd051fc18@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXy9uaWddxjvaq
 CZseeFnWGmmP08cDtVVaPHLC8l9oE2SBoHLGZmHzRL1bhMmzJh5RopuPZlyzJAPl0xLoQz8fH61
 1l4bAZ2poJ956kh4/uPgW+rHXj4fqqo=
X-Proofpoint-ORIG-GUID: J8Fzv1eTruRII8ZZIPItjmtGxyL4j4qP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXw6YHQ6jF6P96
 uf11pdbZJDTOQgHnZ6gOPsaVYU3OeJ1S+/fqTS6M8NE37aPFPTMYRYxvlSRAmbiFYnamBrqXBLS
 SKgu0o7W0gCKfp61c8hMMvY0/N58NdHNOKVJW9Hj2tHLOLdWpvmr636lpCkoO1h+6HFsnWjo8xG
 0TfV4W4YtoLzThABzjETtQzrl2iGpC21oAtHc6B85lK6UJUzsFWlEDbb8z0v2Sn7wOMPcOepOoF
 e51vsBMod0ziDbEjxODSw0sxdoX0jGM7VWlza8COaVxX5DBwDsIH2CzSjDHSgttqPdDBfLWRFeR
 q6SdC0lwFroqaO8dnM/73JzOTXrw5kgdFazeVDc7pAofXrqGNiiTVw8VJqXW6tlKAw9BnCuGgmX
 /ikPmV8hoq+wlXRuY6mwIcAaPUyxG7E1oYMjMewzwQEUOrShnejVeVDV+ZpwUc1Y9dwSyRjycxU
 5aR87ygDSodehwkFw5Q==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad07d70 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xfIMX-YVTLGOWNOYmacA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: J8Fzv1eTruRII8ZZIPItjmtGxyL4j4qP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028



On 6/9/2026 6:57 PM, Konrad Dybcio wrote:
> On 6/2/26 5:21 PM, Taniya Das wrote:
>> Add the gp_mn pin mux function to the TLMM pin controllers for the
>> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
>> divider clock output on a dedicated GPIO pin, allowing the clock signal
>> to be routed externally.
>>
>> - QCS8300: gpio32
>> - SA8775P: gpio35
>> - SC7280:  gpio60
> 
> With the changes split into separate commits for each platform:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


Sure, will take care.

-- 
Thanks,
Taniya Das

