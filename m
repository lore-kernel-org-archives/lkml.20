Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094377;
	b=b9oMqT2iQNYHaP70UKjEx645ww65TwFTt7zoCZkimZVVAzocnVp6NnQozCBymvAW+xTk
	 XmaX3FQn65mGF71jMJXsfpak1Qw6o4KijZYmkUBQ9z1oVnPjnGKLIAZqIeH4uyxl7LeOp
	 Se7+bbV1fdYKcuBHMq51+lKXD79U8qB8S3CH6uvC9qdlNbOa9ErR/N+Pd9eu8j9dfjXEn
	 FYiTrP88Rc95msSn5sJNZ2P42EjoRCrhEXaA12KWzmSDDyh9jPKzpp1nf2Xb40qJtwZ8H
	 xKPHlJTJrgrzB85qZwhlgp4GHsFAN8NhOCnRWA6N8M/CvRHsA5IaspY0NFemOnkXl6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094377;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=;
	b=T3DDIew32NJ2QDomErQENKiJKFBxoRctZ/hbb1b8G0YeBRimohcM+vbHtPyjF67U7523
	 JbgzkGF6/wX93IylcupoTglq6M7ioXMiUpHvDNh1wQ85ExFSTFnHVkFeXYoumqjqp6fTu
	 pFI7J7//ZVVeeP75q1B1IS/1k+BwSaQ5qP0QFBQ0wDcDBlhTUfghknTkwW3ax1xyzRWHd
	 3wOcQRMwsylTKkpTx6kAUtIlnwUTPQ64WQESshwGrryP3+XzEqEo2G3Vpvu+LW51V3xTq
	 HRE78zIro2CHQf3cC2Ep2QQADHfituKfSTbEgyWRV+yOIS/zAnH9UvD6OoMLO1at5RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FUfhFgJa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gaGdsCAM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B95606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B95606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FUfhFgJa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gaGdsCAM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gSMH168841
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=; b=FUfhFgJaeOwflecF
	mPAjGpqS0USAJTcMefy5ALM9V499+JdRLqUgkit7wkQZWff+DXndWkf2rzm+JtKH
	gQSNqxtbKK/FkT3VWddvEqNFxEy8cMs0QqMbDqmEISzUh6FuodDooTSNBKwtp2pr
	3iZMR9Xg1KbAx27Vt6jAqLgs9gPYPjTH/zOLlClohrOrCL+Qn/ncRMcD7nYbEhYS
	e0EHwniNIzN2DR5aHoxMYqV2sXebXfxVDa2TtAr/khvozT6w6uWN3a6FJELfad9K
	ftpoEVgeYCgsqX21AFJ2+negwqmySiSD5nm7i5oCVjo3UnNtXMzqNczwH/2uPwWl
	faz6TA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54k5cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:46:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9821ca96fso49096655ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793094376; x=1793699176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=;
        b=gaGdsCAMCRzsE5o5YfxLvJf0uHO4wkfu+A3eneRZqwe1AxV1w4Iat8OsnocqFCLzWg
         T8ogK4aEbkQZvp2Tz2xZQQEZGy4E+V0Kh2e3P6vElCixpiMstcKs1CZGfSlzs8GxKiXE
         KW2DPYT6Sz0OrmXOyzKG6H5NgoGNVeSEyvsXwpngXxZJPL7rmAVc57ZqFbFBfBJaAbqP
         ZdTC9g+xpVT6LqPPd21CW55szCR7lphcFr8ASZGjXATX+/SIPOwACP5Dg3A5OilSO/th
         P19rNVYXPS2t7Xd8rlBD6nVUFQ0VJqkDYylVRZOfK4LLUA3qIwLGrsipMVx6oMR1e8/Q
         +Tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094376; x=1793699176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=;
        b=rKydKsh2iuCm8bosK0a9NjPnvf9Ox199bts8pCYEnQmRnuqSTu0wRQtGFTt0BKbdrj
         QsX4lRy0ZOJHWEttl0NEXQYJU1zEudR9pwB45Ea2Uj//++uNhFGwNPCNkqc8NMv4MpYV
         M6FJzRckMOVwZLnau9WcDEBjyVJJG5TmAEyv5vChtflE/Z+uKf9MbD9Fy5zm/fkY25xx
         6tmCR78/iY6uy37fOipluLehx3v32iInfuP3TxTCJIlmeQ/wdCBvFuAYCmOk56B0ZIMs
         uC1T58untdI+vzBvGidyx4Tair/w6y3X+nA1yWf1aKCIyUgshb6z2LeIenzP8H5so/KE
         Yhgg==
X-Forwarded-Encrypted: i=1; AKwUvBx8tt/DDQwPcg+iq7Fg37+2tCtIEucP1j9OfkM9+Yd5EVY+mTMaMOfIK5kontYbrOu014krFYJwLLOxnfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYINT8fUz48HAK1kj2DEtKC2QfT/Qpoxr+KfQe1wu3q8UlnLxsp/
	7sHnMqlRFD3DWxlxr5vkUH2m5FGzvYFm4UByQMu3NzT4UGOCVnZsMhUOZNT3ADy8XZkPsNUUEce
	4C4kGiBIl5hCFvyLMLNzfgSl7lTRV8/BACRqMazNXX4OzyRuqRkX5r/tOovT+wLDJ9LM=
X-Gm-Gg: AYBFou2SfOAFzAZfbraR8Yys7sv4bokDZDbcV7j+xdR8QIm17LhAdky1hVSt9h23v3N
	XOrIrrW0hyEQdqiPfpSZ8V1dBcEX3JwVnyzHg6ZETVSrM6ed1mR38ynFFyJnqRnSajtnymfbDtp
	pZUqLjSc2izuKODlCrpR5Jpr5Zyu5bVxELgmStqH0UD5SdsP7O8kyr67qhHd19KP6M56LXUcKmL
	ovhbhr0mKgqxLM9ynBRxlne9nNuIOvnELM2PBVAR+K+zcR4Wjlam7L5pr2pSvlO70RfRB+IIC8k
	RED9XypdPY+r/xmIVmejqEHZ8gNxKHYnGkMN9xXxVd1wT7428Dtn9GsUMLZuEmMZmXA9AAmEiBo
	88sLYJ8hWHfhgGduW1pq9+Q3LXw==
X-Received: by 2002:a17:90b:4488:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3adead4c649mr7498329a91.44.1793094375499;
        Tue, 27 Oct 2026 02:46:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4488:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3adead4c649mr7498293a91.44.1793094375038;
        Tue, 27 Oct 2026 02:46:15 -0700 (PDT)
Received: from [10.217.216.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm6585735a91.4.2026.10.27.02.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:46:14 -0700 (PDT)
Message-ID: <79f0f94c-e474-4343-bcd7-a50ac858097f@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:16:07 +0530
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
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
 <9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX0Q9DZYpR65yf
 Az8Jt6vsyDL98V+jovpWJHTeGnmbyPUR6FtEIVz8f298ROTE5vq/VmwqaSAi5hMRk0bdNsBakPt
 dPgedFfZiAIJY5IyDuZkKkiKDahHDH4=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae072e8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UHJlGdhkk8AUXz-q67kA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: uWBXN7M62EfLD-zIuFlI5h6VJTWqilWw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfXyxeDqWWD5xPs
 RYSGxLNLcZMr85EU2mjdKjPqDKEJdKKogLUdgs/9tHEmljy3XUQJNp4c4PPD+jePF/Yu0D66mTf
 jcJJO8UsJuK6wDSDpWztqdFdNd4NWnnKI7pMMb1DFlK181JzXb7v1zKLwF4G+aJRsVIXn0bryuX
 QuKQ37yTEsmJo4OSUcMiJdLTUTXe+/FTU2hWlu7b1tR1DJvhep8/++h9OvBeqfDEXyBDuEKoo2k
 4ACA87bAh54rMj7/bJC6IM2wPLRUT2TBWlWKi1GfMFwtRPQffrsEkgJyLOUvgqaEae+ZZTUaRJ4
 J1468fhAk1xBnVgXnhzyvx9QgAOc/4r0/ovd2IZmVAeLxTwz88CukaV1pUGtjPLtoVUVpTMr7xh
 ThfxTgP4xy81oZfmViEBGZJwPnLxC8KJuwnpN8mv442t0Nwbp//LC24HiplRXJeqreZg6b9J49m
 gxcPNfDEfMESOLNqT1w==
X-Proofpoint-GUID: uWBXN7M62EfLD-zIuFlI5h6VJTWqilWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270038



On 10/1/2026 8:47 PM, Konrad Dybcio wrote:
> Suggested fix:
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2271,7 +2271,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32 *l)
>  	quotient = rate;
>  	remainder = do_div(quotient, prate);
>  
> -	*l = rate + (u32)(remainder * 2 >= prate);
> +	*l = quotient + (u32)(remainder * 2 >= prate);


Thanks Konrad, will push this fix.

-- 
Thanks,
Taniya Das

