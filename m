Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574120;
	b=Y+ujwBgf79ncjofVDh+o0JPcXZprN/qfzNq6ligomP86fCb62pdJi1t6j8/apvWipCOG
	 uMrWXRMzTGMRYyesFMmc8NKt1n9p08wM41KjQjjuaqiqQyg7AZwdf31oJaK4dZutxz2Qv
	 UAvyCNQryEnmaF8YaYK81P0RTAIFCpcWG7ECuCMGA068dlgqUpWYdY/a0I9CTHssRjm4t
	 f+oeBidhgcwIU+DiT/veUUaaYT4Je1OJE+u7ZHG5vnVtpwoPHA4nOMiORqkjwlqTbiaEC
	 Yg4yq91wvAgyy6BHDApJ/jlM3exO/JIMjJ/sYgNH70wOyaQEaUsS/+/2RxsdbiA8kSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574120;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gnqxoqdPzbmnA6z7Madnb8lLgkBAcqXse1zxHCEfMLM=;
	b=pFiLpNHdRr3Ua2OyvNvfs9jqUZce4uLLlhfEjQCkedSCmWe4mVRIZkZ+7UOeLnhPgNiX
	 v/rxILDqx9dCngpUHrolmV4lcQIrvoZHW4lB4rqTKJHAGByeAbFxTnMhXXXafRT6Phhz7
	 1RtAzGFmCUYPf+XhPh3JRIBjEegJFzFiE3c2YwTmyWzvgKnxgbrNKXaa3rwjEf3ExByew
	 BjYRdfbAKgaZnrGqLsewbCPkOWieE2sh83E0t4FvBJVP408ulnWbd8zdA3KsDdq0cTKJb
	 t+v5hAleOC7kuSvHmC1OZK1VNbPFX6oKwXXZ6h7/Km1luGtHRdnJTEvDzqyjd7QrZmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b12SUz/x";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COWiapsq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD33606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD33606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b12SUz/x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COWiapsq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L9BlFh213252
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnqxoqdPzbmnA6z7Madnb8lLgkBAcqXse1zxHCEfMLM=; b=b12SUz/xLhut5xmq
	2IjoHS0WxqtZODDh7nb7E8B6e4EmviGp76fFCN2nzgqmIHyqE339I0khvz6Z9iTp
	uUR3GXs65UxoBg7E8EapYGbTO09B8z/c5D9D2I3vvah1IBx/nYpPJPBUj0tWSQUj
	lzu0jmwLK750MI/AkGmskLGHSpwPmk0/Fpc/mo51MsA458n9dkY/BdtQ0f/HGBmw
	vroFdkh8lMaZYuJvD32n8RnwfFPCqUoQF1/Sk1+jewoTkaYpXBE7H8FoBGlvJ8WB
	f4lbkDjkczn3mhZsQ/SvdVxTYS70Z19U1PCkSWk3VdQduTq+sVP341/G2I4xrKCZ
	Gj66Rw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj480eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:15:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb1091fffso8524185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574114; x=1793178914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnqxoqdPzbmnA6z7Madnb8lLgkBAcqXse1zxHCEfMLM=;
        b=COWiapsqdI2v0Zk/zmindGgnzLqxPTYopeXoZCtWYlMViS3BscnT9v7frzrf88wFPG
         AovbheOnW4Gjy8DUABwOu6x+DamxZq9OMKkFD/RlXKZznBVaXSoxAtyD8e6dwVO1zkUr
         mozju25nfRI0B8wVgRV1840+IcZliyDrpyFmg/fOf16ewcBJqAxYQj+C4EjPNEo1B8FN
         5i83yEHbdYy/E/1bEDajTDAGHXcpYGqNpycD+WppLyjgmA1M1Z1h2PrmuMnpLy6OgZkG
         8kSm+WTYy97x7trwqVN74NoVdljxflG8m97/XwldR0IJyShRQwSrvH8MnY9xaXBXETnT
         +L8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574114; x=1793178914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnqxoqdPzbmnA6z7Madnb8lLgkBAcqXse1zxHCEfMLM=;
        b=2YJQJSYBqU4UhXlVo4d5Z5iWta7Qwc7+IxvlqkyvBsfSNXtlDnW530Najfu0fKUIlR
         oDFlpkr3A2V95l2+T1+33zCxDA0f5Txq3s2RVtYdjCOWEck4jZrENPWvkxNEI/Zvsu3K
         NKIrsM0IY8+uvfgWHeQCRWORLuKzm53EZLXcy/qFjcdjYLLhmKKtHNzmHmgiKA/rI1KJ
         KYprRiOVpsEcaAcJjXjdcGpJRlbj2t8JNCb+HxkmyZoxmr5lzFzz5yNF77Yc7W3MgK1c
         VssJ0azFIKQO26XLbBvA7cOTG9+8WjfiudCAzTxnhmUXlLmLcXjPIUlnFRUds7klTi9D
         OCHA==
X-Forwarded-Encrypted: i=1; AKwUvBwIF6YboyAsh+TTN66/18H29rXGNw9V951Jl2XABgGLklBbdqTClmIyvCwJXRJ5qniPz39l2Yq7cB/r0/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTVvmO9755SNiCiHpt5x5FwuW2Eo0mbdUDfY23V7Fsbg0UO4zb
	7baGe4Fb4mzUa00F288TTZ/foIBpih8ryqtOt9NGqwzwYA9yPRXI8gLpq05z6IVko1HQNbbEQB3
	p73MJxHTXxJ9+NRfbRjD/hzcxPVOQYxmuOlKRqFzkPw9H5ExGeeSmgKGprG8vGiWGEEQ=
X-Gm-Gg: AYBFou0rLvB6XogyetVbhkUcXBw7JVrW5DUqS5za6UZZa4qE6hrrCCFgHgTHpOsh5PC
	MuqjCAfJdFlUtt6wFEfvvVCB903BwkI3PFBZXpNNtkGuCgf0Gsr5puzngDI2ydGfkR1kje776+H
	cfEVIMZwYB40TkOKIFZ88zRs3kpmy21zfgnOHafPkaXTtx1K6mgl+mZ9Jjp346o3yXTKL2HDahQ
	/SEarIcMH7Ab+ZgBRRvzohXvJ35DxZwUiDAOp7/wL/drGN+cWgoJZuY5MJHvkDNbQ124mAx6xe6
	hA8VcaKwehSv3DpfxfqijknVG7jJnqPy+vdyz50oJ4Nh2iF+8Rl46qtpBe5k/ZZa+Tie1o8JDEE
	erccygdfF2hcejRhBJFnpag==
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr367645985a.0.1792574113566;
        Wed, 21 Oct 2026 02:15:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr367643185a.0.1792574113116;
        Wed, 21 Oct 2026 02:15:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030db3e8sm620229a12.8.2026.10.21.02.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:15:12 -0700 (PDT)
Message-ID: <3530adcb-a7ce-46c9-95b7-28aa544e8fef@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:15:09 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to
 wcn3988-pmu nodes
To: Cheng Jiang <cheng.jiang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
 <f3240952-f28c-4c2a-a4a8-4492aef3a88a@oss.qualcomm.com>
 <CAOK0kb90wYEQU8e9wfQ8g_KfkfqwiQ9_ideg2=mSrU8OuTLxRQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAOK0kb90wYEQU8e9wfQ8g_KfkfqwiQ9_ideg2=mSrU8OuTLxRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bWSQ_pzSZq_ZUUhLxRRIJaveMZUZOYmS
X-Proofpoint-GUID: bWSQ_pzSZq_ZUUhLxRRIJaveMZUZOYmS
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad882a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=s_4eQB3tgPlORBrTjR8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXxI7Qi2faybVV
 TX2+NH1ufaTloXgCg2F+j/vDii6CXO7DiQ3ZJ1ohAQSE6ExNLzoxWCvGDUET4shBXoXZ2tchFUR
 cXmgs8cyaRrzqXPp5Gy3WvPyFL57vBG66cb+9IHCFPfhTAhQZyIjm7vPLlvBO0B0AABMR3cqb1D
 Jm1Y+au9ij/m+RiVUHvGL2PNtOJS7KbpL8v9CAW4iibYmGGm2JS9vmyVnSn3G3uNBpjXVI1c25y
 klP+ibhHOTRnAzAaf0LbBTfjlv044R5kXXopshicQkkFMISGjXpPznp9HfAomIEFTgd+/8WMf6C
 UjxdcQU/SOlR/HI9gy6zP88BkuOj3WkrU+poDVUW9Cte9kiikVpMc1AIPrfStHrBh0ZkCgzhlRI
 wpFrXDY9st1iY50+HYZchzQRlxoH3mp/MyUm7PVDdFDtGj3xVoQ7i1JWG/atmQ1oyLTovJsuTzi
 b9Px+nU1I4y6RGGXaBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX0tZgCeux+CR9
 ff5thUgILPSKtm4EyBW1Afr5MhTDJyy3OSUf3u8JLUvLb5r3h+dYT+KCpmmb5e8HapWTMu2gLLC
 wiH5sP+lGHqqRlZi8tA2jhZkqq12Sc8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

On 10/21/26 11:05 AM, Cheng Jiang wrote:
> Hi Bjorn, Abel, Konrad,
> 
> Please drop this patch.
> 
> I re-tested on Shikra EVK with and without the RF_CLK2 clock described on
> the wcn3988-pmu nodes, and Bluetooth comes up in both cases. The
> commit message claim that Bluetooth fails to come up without the clock
> does not hold, so the patch is not needed for Bluetooth. Thanks to
> Abel and Konrad for the reviews.

It may be that you're lucky on the timing (or that clk-smd-rpm keeps
all clocks online). Please verify the schematic / clock map. If that
clock signal is connected to WCN, please go ahead with this patch.

Konrad
