Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016934;
	b=hx/4bWZox+gb+gtsAC3nv09f7DAr4t47ebu9SFoJYim7v83E3noG8j5YurkR31FODIEF
	 +ii1+5PlYXLPYDzYbQpeCDqXVol1jwpCsfhAD+hHCusxhFN1Zrdu9zQ4aBcnNurLuE9NA
	 gCvGP0kn7Eqat3Xspbnstm4KvXXTEch9yDdNIjtq28//MpBzhmzzXEyx0i9Y5hVhWIA9u
	 0psYfYWN775BL/qfIAFaawc/s9JsSId/UaIEeolopAxBA8/ItPhh0qLVU1iF5TzZUsANp
	 0nBhGUTJ3NTLcnlDiZIMhdesNNCcc1r63eVHDhoJlEyNiXvVD/sLLZF7jEYEBNdsTiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YmcQx9OcgaD1ZkmOw8NwOu+cadyxIp1x2breeYxHURY=;
	b=E9UC6phoasEkqB7T6ux4W3Lw5szsMQzR34b/RkdwQBE/MrKSO902Ec23rwSa11cuT2fB
	 xotiJJon794fQn4w5WLcZ2Gurr2Ap9i01mCtRM+c9kA6joT9yNljqErR40jOQtVixeYRj
	 a5upF7iYacs7ham2uo/qCicizNAku3CSUYDmsnPaUtk3k57FjF5ruF1zT1Ymw+Qn0WUGD
	 f7Du/RopK6cg30h7A2qSk9/tRPp2HEKmK2zHjaz4d0a7nTlnMGGNQ6JhDfYIn4mWXuXLO
	 abW3cyJQyf5OyhpYmn92ynoHGqpAbAUeyzOWH8zfwtUNav7JaARSzPw66IBmzOM/vJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gRo/l0Xs";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PsekKf+x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E44606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E44606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRo/l0Xs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PsekKf+x
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMF92009906
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmcQx9OcgaD1ZkmOw8NwOu+cadyxIp1x2breeYxHURY=; b=gRo/l0Xsb7hVMkRX
	1EkygAHZF0+2YgS/MpowSWWROkEhf+LNkEtrcEsDmhhQGc9ipXwOfyg33Jw4M8Q4
	pwCpwRV571v8rN0ze3xBYb8+j682Yi+SRuTfpllykIWTNWeOVzUVYLrcQgq5pOdW
	Yen1WzKtuA102L9t2pZMX1q+9vC3WOlREjDaJX9mdw4v55TwpjaBtDjSvwAmd0Wy
	tUFCnR2nq/FW4ghWfszlk67ejCrxxL00zH37LgVSnmLlAqfTTV2XVvqXIg0R70cS
	yw2KH9ZC3xEs2BrpOESlqS5KqMcTKhtcpCUOawvD1Ca003ZYh0GznlDkcg/zwVyq
	DjO11w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27xa7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:15:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so39000885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793016932; x=1793621732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmcQx9OcgaD1ZkmOw8NwOu+cadyxIp1x2breeYxHURY=;
        b=PsekKf+x4eWHyEPw/DQs478VuQdoH8mpoRUNVD35qHrlTzZEZonP/R2uWCpgAZhVoV
         fv1X4yjcWTmPMoWXGkqoJLBXQcT5wW63nIDK7qiTG20KjbnyuCabMI2zOeTHf6YfsZKM
         UTPMjUgo0FPFhwhyk7ULqOfhkaHn52E8Nyfch4tfcXJnmd61XaFiBaJk7rf3fBOpeWJA
         UUh7LEqtFTfteEHX2X8FvcmG/4zOw0SSiLMN6c8jJD46ocXIDInUXSoOhVBz42sfm99E
         DKl07WsScVD7tTs0RYZJzOpj2KykL+1+daSaOs4AJTQI+42vWmYnaVSHEFDxO+KV0xUm
         MSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016932; x=1793621732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmcQx9OcgaD1ZkmOw8NwOu+cadyxIp1x2breeYxHURY=;
        b=ZjAj+N6rG9N84yfAgeumGaQg+99Cv7PHqePIcp4YzSnAxpsSl7zuUU/VWH4BT+SMA8
         WI385Vn67kUNG0UOn7CJeEmVoMfkZT6uIFBYEY9xTvZQ9aTAKSQk75fhoRk7lW23F8Hh
         n9PAoa/YDHviy1vClpZ4+aMLb3de06V/+bsq5ovu4A+7d/aUqvuyAY/BbnBx9qU2kiLN
         8naDwIPCsbbEIl5FG30rl5YjIbULtaIVdVaFJyfwZcSqPMgNAi64jwho4Y8Fzy+6qIbo
         XQVkaQn5k/T2nq0KcclzGcx0sbxb6M8Z+j+6RXOudnPzxEGPKaPg5vU5fHze0iBTlXJ/
         +C1A==
X-Forwarded-Encrypted: i=1; AKwUvBzq3Qxmtjvv7sQNtoY8/K0hpCWCyDqe+d9gjCsTgfLSgQsX4kGdZBChrIX3AafTQoAyTMHrCiKLSbcD5No=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6euMJNgdTqRK6rzsGnZ8zrOqG55SRxkkoRfVuIZOzJ7/HdCaR
	pMaukgfe+CUzJa/Z0cFnZSegTuD+DJ1fnbd0/wCTtlAfZ7HTcvdqBLQ+5ypBCXTVO4QJrHe4n7U
	DSkBuyQmaPkXfVO3GXLP5HnpPiSrFaK0RNdg5d9DRY1sUBLK7JB8gcTM2J9CAtlO3K4QQRNwiNt
	I=
X-Gm-Gg: AYBFou3KhJNkVrNW+iyb8FJsD799yKQHfUHZjNMsD0fJXxyMJW0dAemw3oyGwJiclst
	HSyOFEORkjAE63vgiBwb+lhT3y6nBCWpAIu5KgTuwAEl2PoLQitiXZUmXzqGV7OkH5I0pBo3BdL
	cP21k9rR9AYflVLOX9gXWVrizxZvbydE6t0vbKdO/bC35Cgquch75f9/WbSF9AxoqIUNwGZlawF
	eSGFkdfv2453dR5ldr4CUboiwD4Hz2uQrTxUAvc/LeDpfxAjrFBBHPNO49mi+J33Izp9x610rS7
	44acp8/CKKIQD7d50xC+qh2AkpwUvzzRNUe0n/D1VT43vq6B4dwwVHQVh6dFQGHCQGXSaWdOVf4
	hjuLXerCgYKuF/dnYuWngHQ==
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr961458885a.5.1793016932124;
        Mon, 26 Oct 2026 05:15:32 -0700 (PDT)
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr961453885a.5.1793016931605;
        Mon, 26 Oct 2026 05:15:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a8b85fsm1495986e87.55.2026.10.26.05.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:15:30 -0700 (PDT)
Message-ID: <09a09f96-7572-4f11-924c-49f7fb21e2c2@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:15:28 +0100
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
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sdm660: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-5-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-5-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf4465 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ssGiREWd8Ca_oH2jvLkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: n6CsUCathgHKzla4-Vuql0iCfAK5qQpW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfXzYy0HzOKWmDF
 Ky2bcr9SbnvpBL3PAhAxzDzsK3tScgr39Dyo4M+MW2zIt+NQMVoVVMX3M7y3s1zciAiXus3Y0ji
 dTy5/1uWpm1EN4K7sv2HtV4hEmO+pZs=
X-Proofpoint-GUID: n6CsUCathgHKzla4-Vuql0iCfAK5qQpW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfX7bAcoxnA5b5d
 sev6cca9ndXP1+odl+HViM6zqV8xYdr6UNW8lu2RCpYy2iIMYG03Gok6YMUgH6pk+YmetNPwfqi
 DB+r265uRtgyEJgWz/Z8Zf4RolxZT9TYqGiM7QP5JKHykrfY3qvi1tmEskORu5JPhAfxKIZcSGN
 GrYzYYlYQZ+h+bw6UhCb5t25MnbmYw7557YQV62H/3NwjdiTLsyz/lQdOHVhXEKvfXZFJdFN03J
 q2UQ2albMtHTamBZwcAlHecbJOZOr6iYPE6r2LMjkYk0EpMfKOGc/MhMixqk4nhfJUQtZ21g8cY
 KnBJGz7n5DHxWTfKtYtkTnyUv2zpRVsAJTkS3oEs/wsLiXTBcKCcSue0qFtmqD6xudKOJlBoIGR
 8dmrRlCey6Koy1saxFyAAZ7LH1cis80qAc6uIW91KiNZHcc694C5WVHqXB52h3vl2ih/qMo+5m/
 hr4cYa6KiIHclcP4CrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260048

On 10/23/26 11:03 AM, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from sdm660 device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: 708ab9d3bc5b ("arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm660.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> index 0fca9662c64a..723bffc99b67 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -386,12 +386,6 @@ compute-cb@8 {
>  					iommus = <&cdsp_smmu 8>;
>  				};
>  
> -				compute-cb@9 {
> -					compatible = "qcom,fastrpc-compute-cb";
> -					reg = <9>;
> -					iommus = <&cdsp_smmu 9>;
> -				};

On this platform, it seems like the secure ones are SID 1/2

Konrad
