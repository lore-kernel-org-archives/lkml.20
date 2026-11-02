Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625680;
	b=jjEwOA/lzj2uUNjR1rM9P/KQAEP14EePkGmnMxISU3rJsWkxlXXrka93luucFgyLXVUH
	 VkgmpYX09PF76yDI/9HZmP0smYF71KqyQmC2LTX9tGIffuKvEGin7+VKg/1+vNNZpwXTd
	 JyW+kCHeumkAjk/gdBtB0enCFDXw4muNtRd+yweDVmaZrdy6aFvZ65CL3HOrq6A9jZned
	 bEU5WU5YoOSDlWJA60wy95t+UP/ImjY5SRX0vifKhI+0N7rJcWrzPwBoF8DIKv7AB/VC6
	 Tg1N8qw30cb3bvtM/OMTlIx7PMu28s3hCZSrek3JcH5qOw+G9UrrNvUu15X4RUn/bNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xbx1BUgqsVB2CQb9oZczMqbiDBgubPx546cwvRO63fk=;
	b=T5Nd227CvBdMfryR6Z87OuFYizDK3yZts/XcN7nqtqyG6FrDsfejJP8tRWY+3aWLjb9D
	 sX0ILmzzzsiz+DYqXAH2xJpenlkmSSeSsCInLcUfCavaTD08wOfzvk7QD4OKvF/UAwtx/
	 H9dN42J6Haby1i2YaEelYEafnD2V3L5sn9+CKbd0bdeqMdx2j1vCmGGOZO/IKl861exKS
	 mbtYhoEZqL12F5VekkGFE5T5dDpRkbnD2yDyQUBwnF6FIzzOgBdD3qh43qjNhzOLpKcc6
	 kc0bYQDjRhNxgGrs25nWS8n2RNCudsH+QjxMOe9fZ5pnioinwFpS2SBjlue24/dxZbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3bFrcGg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e57XM+xk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871D7606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 871D7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3bFrcGg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e57XM+xk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAkk8389162
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xbx1BUgqsVB2CQb9oZczMqbiDBgubPx546cwvRO63fk=; b=N3bFrcGg79MFD7ZJ
	l89G978mD1C2ZoUWvkUTWFP7/nJzct3sr7LB5USoJJYXLZQouqSAKCQVHsB+mW+5
	sKobtD0UsgP/BRdaanP/iScNWvDBQiCtqa5IOjvfS22gOLa/9I5D4gDieDXip2p5
	0rKznQutRyRb7wHRCuBsSb3ua4PL83VOBFROiAr/+O0e0+BYvYm+NceIgqJM0X75
	1yQb5NuyFJ1h8P8W+3IYX4FVxCCptl778HPFnLur5kJ9MJlIZBb9YrPcowRrkvUm
	tkncXX2ZTWzLCZY0l/h0WQaDuqrb5vKTu+qQw3rUQbvq54gtoKP6my8Ts7wXt876
	0qmsSQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph1995m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:21:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99067ffb4a2so46556241.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625678; x=1794230478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xbx1BUgqsVB2CQb9oZczMqbiDBgubPx546cwvRO63fk=;
        b=e57XM+xkm7vUpMUpP5yTpjlqnOurMx6kd1tqtDTExJ+aAT2RGra26UTvv+S67+JRYH
         751ltjajJ+4W99rgy5wurMsvS34YfXZFDhGm8qjdUWfWka/ln0ZNcV2gHLcd61y2vxFP
         KAcXE1EGRs3ejMvohPdin1cYlahtePIX07sL7xtQNc4wTIiVFvbaoYo3y+w05yNTLlYU
         CR1Hv/e4ekmV0N1ZyMvtiYzli0urCv69G7ys8cuHWEtkuqoQOocffxceoAXdvxuoUEzf
         /HzAtsI8eq7o8C+oTr5WVlB2GN89cOEz06OWdzoCbNRMCYON0ad+gbKTIpAdHZFIs79B
         +n9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625678; x=1794230478;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xbx1BUgqsVB2CQb9oZczMqbiDBgubPx546cwvRO63fk=;
        b=01mghT9+gr7YkX4rQ5Q/6cxCPGzrCMfTI/4O5HU+68E0YSJ6o/lE8bUUM0Fsz68DJK
         Nt65y3+z/p4k2Ldp09Re0PJXJ7HevdDNLrZH18uI83AFSW8ragYkH41CeOQ84uphdGeh
         UheIcCfDpTCyyqZz+d1HAKuAkdj1lgBMiUgJW4qnA7XATHV7DbSCwP9Bmdea76AsNdJ6
         OUDzYBBoPsjx5f6i2Rb+n7faVQMyhUA8U1ynq4qvW8O0ZxwT2qBNt5faGYpc3X1BTgaR
         tsM0uKNi5mtz0qZfK9HNmmoLPQTNZ1eixVFzLAtbt8BgEqyMDjWXKlsn8h7xxEBoSZM5
         KBGA==
X-Forwarded-Encrypted: i=1; AKwUvBwNS8BakKg525l+drhGVrcPe/0tTExifs7+z9Nd5gcpjKr3ZcJKFLbel2JdWJJUbYGDFlUyzKyTdWqs5b0=@vger.kernel.org
X-Gm-Message-State: APuU4Z968s7Klhhr2sqnBlR0TiXN2Ba1bkv6aofPrQvcH+drl+WY6Qr0
	3fmnw1VhrU+hma2JIan5hEJbgnvlD4qEf2CduV8WbFCRik7hTPVAZLrDfO5af0HMSW47ABEjVjq
	0Kxkk2gfGaRqTDur83uzhPSRsaVb2C6zkfzu0jl7lX5h+oC8I5tqgM2FL2We/rp34DrM=
X-Gm-Gg: AYBFou0B+ga993AjjHuBNgDPV2jrml3fmkvG8vuaR4H9WyqY9ABrB3XOBIPXeBAr2Sy
	XI0LcOlrqPGPfdPHsS5+TaIlUSIRrwBvrA/qPY+A071Wm+OIo6J3H/IWGIpQXr+JhgDyA1DiDOf
	bA8MVGF12zXl2uX+nxjYIQ0L+PpJLov2+NTnYF2sBtxQ8G/IOkQFmeOPYMjFpOd73s4UsKB7pkO
	InO90m2f7BNvNBtYEv2Enzbm3UYCnDTwrTpYaRnNpqw+HtgwDGFkEcGtEZ/5Tk9+V53zeiyY5IA
	B7NPxzDpvwehLPG/XadfDj1nGbytBpKyKxF2DBvOBoX3lEwnlXSCOC03vglOI+9UxDtlGysS7k7
	Xn8G4eH6MrMcZuYovgmdYrq9jb7pFTJc2YZ+fd0O3kDslMVW1FWkH3Nvr5YkNEvz6chE0LhM=
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr3850556137.3.1793625677676;
        Mon, 02 Nov 2026 05:21:17 -0800 (PST)
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr3850535137.3.1793625677256;
        Mon, 02 Nov 2026 05:21:17 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcbb0sm3395230a12.19.2026.11.02.05.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:21:14 -0800 (PST)
Message-ID: <748ff335-71de-416d-b994-b97a24ef9bd7@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:21:09 +0100
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
Subject: Re: [PATCH RFC v2 5/5] arm64: dts: qcom: nord-rrd: Add sound support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021073633.2163128-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uSBxE4WCo-0NfeL2yQcGMUUJX8MZEffc
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae88e4e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-Q6HcSUBdirZEqn3JksA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: uSBxE4WCo-0NfeL2yQcGMUUJX8MZEffc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX24xj+G/8Lhp+
 p9UPnnzK8dPhZZqAQSimgwcrXvpgwowi3xZkk7dPIaTAYwbOFiLF6fNL44RYFxWIMtWUdEMaE3d
 PsmL8M8bTtG8qE5cQYkLQ+fxJp5/lB+3qkleRfbDiHTF9350VRvZqRphrmgQsbbKWyauKwKIxut
 hANvb7CGGOOYVKaNotSbT1gN4RLq7p6reOTCofg8xqTDaCEutuODdUa+rUGaEYMmhpGVyueusZ0
 IZUMg1F79RmxVzESGMBKTbdH65bFE92C5z+pQELu7vcNKwbs87MxolkuVN6k+vQQLxqF8KFNs1M
 dYwlD7niCkSgE0Xb9/mzwRZRnNIoVaaVl39nScfavttgLgm9JUAj6gxt/Lp+SpE3yZPHS3YD8G2
 /1CrslwUfo1PndQfsynJzJOSIv5369ao3cMRdiRn9Lq4OKgPFjGti7R8/t9P9kTcZ2XOlvowqGO
 LblR4KBKiFuEGTC06dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXx3V7oYRsmqwu
 RvqZL/CTZWHeplJ8mTsnzs83hZoVNYUcG8OaaCLTjagZA6PetprPzqmMZC1+A2MLUwMc2Cw1Zq1
 vBVenB5n4julOFBKXU8/7acTCU+So6g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 10/21/26 9:36 AM, Shawn Guo wrote:
> Enable audio on the nord-rrd board. Add a soundcard node using
> the qcom,nord-sndcard compatible.
> 
> Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
> clock supplied via MCLK0.
> 
> Describe DAC_ENABLE as the enable of two regulator-fixed supplies
> (3.3V and 5V load switches) feeding the PCM1681, and the two MAX9892
> click-and-pop suppressors as one simple-audio-amplifier on
> CLICK_POP_MUTE_N, routed after VOUT1..4, so DAPM controls the mute.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
