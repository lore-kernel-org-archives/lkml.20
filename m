Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626396;
	b=d9MeUJagGSkamcQ3an1D5BMemJuUNHM7Q2OM3RhPeU7+u8URAEtBXBt0ZX6Zj3HgoWqo
	 31NBG2yx4MhUZojq+CCj1vcFTp0elMwS+h208t01XnKx4/I2Ef1yNhXoQJiioQJJnwicj
	 pXJs7XdhpS7t/qvdZHkOvwN/DkWwLhZ92IN9sqRP7VT1KLccS2X48c98kMRORObSLdvlR
	 m8VEjFsij1YpqEhWyvQE5E6dXZkYyuMdUt2zh0CpLQOh1WCmbZ68rL+4+/IyRZWPArZmj
	 YF9ce0ToM7hErmYY4vpMADsh4sCiKWrgfNqmivmSoYAQrmPW636ZQX78n8RJEB3cygA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626396;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aowsUPHoeJ6TRxLopFtshuzGGcc2yKO7O61+U0ZSsuE=;
	b=HN+Hr2o5Q0g7WCU0hiPJovpexP5K1BFPh0deSUJbstRf3k8u86CTa+Aky60Pf65tIIOF
	 v09S3ZwEo+dV2bG81p4V0OUAzqYSEfM0PSmunpkPHskFial6mh4nKyT0GarTnoDAgwW9i
	 reiMGK8rt7+OzwEp0KskJcq7rKJj4HTX/W0Ik3sDbvjfZzNY/nyiaHGU1/6zZdW6p+yDP
	 PBUxTXniHQF4D3c60V0ShLKdOtHLRaASD2SXeAPOedRW+Y0M3pFm//uKxY2S2iOOQp5Nx
	 vttHXZM8tRZtBHkZtaiOrLBZzJoMKh03KPU21nrw/F+j7Ahy68y7OL2sIxW1uLFf9rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJRgvgs2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e04Nl3DS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EFA606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36EFA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJRgvgs2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e04Nl3DS
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAeYo2360160
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aowsUPHoeJ6TRxLopFtshuzGGcc2yKO7O61+U0ZSsuE=; b=XJRgvgs2K7pC/6Lm
	SZ36PdLYrisZ/czYvLmC49YHwxRf3wrSKeKQUihz6zD6Y4jk4LAwWrl43n9hbmfW
	J8IlAHd4S6kt23FwWReAxVDGrPgYUZE0J8CO0Ynu3f9DC2W7a/Ofedb+oyGWTq70
	N/BRV7TK/dQ/IjNVHYNZ6TS1o2b8/MLcyCFI49j1uc3U9PyT2utnUbzjo6PeyRL7
	wx4x8WZaSLbiSltuVYTkL2Hn1P+63eMdd4J8HUUIIRIcwf6ujBrZc4PA4a8W9bup
	n4EBZnh6gQ6fHQ7mVUqrfRrdqswuYLqKVdcT25N60JmpWU1zDATE/el/LTBpARhB
	DBv5Xw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hvbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:33:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso3703687eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626395; x=1794231195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aowsUPHoeJ6TRxLopFtshuzGGcc2yKO7O61+U0ZSsuE=;
        b=e04Nl3DSbYAKPrkhaZFZF0oWYiClkp0edkG14YOd+lizqibM1IrcsNbdKfXtSARDe5
         PxVbUbnAoCR8FBe58g3qFfpOGUPcdal+XJXT/OnR5B8TzuzHmpsh0guSs95ZDZRS8ykt
         EGDwRglr6F7JIm9hmntaNExOo0AblRVkzBeO5ewRhdlw+rPOUVp5iiiB6TPojFCsDwQq
         OGbHqE+x+wl6Pd+fp03W0f1jugvO4LzterwgW8HNeH7DziWY+0ugff3Vcin7L5oZv/3p
         OxbNFj0xCkRXfHyBf3R4ltplemQrJmz7uT3tx4kE3/7mGM9AHj4pTTa3DqXGuTlQ5648
         9l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626395; x=1794231195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aowsUPHoeJ6TRxLopFtshuzGGcc2yKO7O61+U0ZSsuE=;
        b=KrIfFZNQSNy2ilEt7HIDNJkBEg4uep6ctnan16KRTJbGLLMKrd+KEn6/ry4Sogc5zu
         zkT4c8Rarq2AdlYIAask1le504ezW7xK2XIbAycuKaaOlvBtO8El7pkIi9IvLHgrMDPJ
         hD/tLy3wmNRwm1Lt7gs8/oRkXX+5BbU/aMN/yV55ZpNW+/HGQcjS+xLnML2H6j9z7iav
         bi/z7EyPkBwXasr1IEfjP+ZwLtvKCO+C0en1EPv38/BtQ1Tj++KD6Kn9bOGD4sHkhMlW
         u7zeaycPKrX0GI4nOoNINEeK3AZq0LccXyqWiCVRI5YxcnJ8NKjjIpSxp+j+z/dEVxET
         RlTA==
X-Forwarded-Encrypted: i=1; AKwUvByx2ronb5gWQq69+BgUbfhBPqbI++m8tFwEaD7h6WCM5vxmRvG0LjAZNwdLri98BoGM/9lSNqBvtl3XpfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPnVvqX/GaRn4H9rJm2xZAxv2C4UFh8tQXVYxzflGCI9dC4MIu
	R34rfHn4r1tw+i9DfIARgKyFYWWCVY4PkKPuerw3JirJ3rLU6MfOx1/JCv/c5k+e1M6we3AQvL4
	3piXWWri52/8uDGgbzsWSzGihslL3Qa+xjv+fLQxKIxw9SE7bFtNilyz1sO2k0RwGTYQvNNTKYw
	c=
X-Gm-Gg: AYBFou0TsM+rT6MQOOSHUx3QL+4+9L4OCHHFQuErinNo1x/I7XSCZ8Mb9FCe8BytS8V
	12YvDATWO3uleg8Fd9XwR/cZF8Sa3onsuqezQo0BC5RIT8LlW1JoNnBCuWkykbJPViB96JhLy9y
	VI9vaE+lRj1FK2tSLkWkbq/y+4dSBkUkagbfhyaBv8YOHqynfsM5FG5CU8APDd0PmKgiNa7clnZ
	3a3WrXYySOXL11NODPHdSn6xPstXNVnsgd4mxp+IdIEpfUAUfTIc2y6Ey7+a707OTsz4f1jNUVI
	zkgf4OIV8nC6SR1lCinMBjWxer9wxZH3cgOUIinI8dMcHe00+XzUlRwKdRJ2vQ+OVVV8qd5d9Wh
	UE52xwco7pahHcCEGtaC+Xe4kPIyOQERZZv4+Iw3Fv1HfTgNhMZlByIqq9vSp3ZDa5VVjoXJ2O8
	385NNLkQ==
X-Received: by 2002:a05:7301:6787:b0:361:306f:c32a with SMTP id 5a478bee46e88-36a42345b05mr20153309eec.11.1793626394644;
        Mon, 02 Nov 2026 05:33:14 -0800 (PST)
X-Received: by 2002:a05:7301:6787:b0:361:306f:c32a with SMTP id 5a478bee46e88-36a42345b05mr20153258eec.11.1793626394081;
        Mon, 02 Nov 2026 05:33:14 -0800 (PST)
Received: from [10.204.101.201] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm36639936eec.6.2026.11.02.05.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:33:13 -0800 (PST)
Message-ID: <cc56469f-8f9a-4f89-85a9-d6f396ccd3c2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:03:07 +0530
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
Subject: Re: [PATCH 2/3] media: iris: Disable the system error work on removal
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
 <20261017-iris-handle-unbind-v1-2-7809148eb90f@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261017-iris-handle-unbind-v1-2-7809148eb90f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oX2S_mHrQSf5Nrx4eLRrlKoIXTlLzvPU
X-Proofpoint-GUID: oX2S_mHrQSf5Nrx4eLRrlKoIXTlLzvPU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX1da/z/6UbKEB
 KLEw3QHmaL+W8uuTfHAVUO7iNpxU7WuwGRDUaRdZdou6RNSguXeBD8zfuWEZO6/xoDsSLTk4fcx
 b0yPoBiL6fC443qmg4+m/6F4VA0/OcI=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8911b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OnH3Zg2X3O9LORF0kDoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX0OJ+Wn6Hlacn
 +uSCscVJ7Kvgbualr2bgMJ9kk25572oTlJlzUqndVdy3u/mOwtX7W2qlNC1S0BL93uzXMbrERP5
 cExx1OuUdmyRWdyxDkibwuuN9Qs22ggEoUOSGwhkBOGGduJB/+IjZrAZN1EHq7OJpUdqqn9Gd/S
 MU0QQzdLlMyPVJnK7sxbfIaa1eM9xywopXASsC2PSgQJQVDJZxIIQD9AcFMqyq26e7uWhlsB41P
 YQSwFa+vNvxDvvsq67oOal/U5VZ2A6C3mLMrq/PesXMG+a0PaTiskyHeBEegWF5pJXAbaKhW71z
 wTixNAcDrM4GSl4+E8RaYsU7HQCDEmonjJ4IHgUbDqsyL284WI2alZ9z9qO5uQ0o/rmjfYRRKSX
 cTdU9BzRn0lXRK/rVoajQGEDRWhzkF7aUhPsJTxxl7ZyIEMbZjzl27op2U/O6nJZHKLhw0ZWT+0
 y0fcNl/Q/kkO0oTxFdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053



On 10/17/2026 8:46 AM, Vishnu Reddy wrote:
> iris_remove() calls cancel_delayed_work_sync() to stop the system error
> work. This cancels a pending work and waits for a running one. It does
> not stop the work from being queued again afterwards.
> 
> A system error interrupt can still arrive after that call. The
> interrupt handler queues the work again. The work then runs after the
> removal and uses resources that are already freed.
> 
> Use disable_delayed_work_sync() instead. Once it returns no new work
> can be queued. The work cannot run again during or after the removal.
> 
> Fixes: 452480931648 ("media: iris: cancel sys error work on driver removal")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_probe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
