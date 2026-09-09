Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DFF54855E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954300; cv=none; b=AN+/MCc7IxG+F9QjePGRxcCh5SDT/PSW0Q2H1l9+D9WV1yUCjd9uoi+5BEyjYA9Y/TYf13oJleNtmoviuihVmZY8Wo5WNXYLfU+XRlVfm94z//EFxTUWlgt5oaJGzjdBpQMxipOfUpBojgvyLGqgd+ZWrNtfkr8p4gEtiDYZ0pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954300; c=relaxed/simple;
	bh=fjyTOfB64lQGaBKja0eGbqH0Am4ca6YXe+AJ+f3iVuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R384hHGLpVNCFleg2BaZN1dhM2LBn0RyX4Gt6Rz/lxgmZjOJmEycBjt51mmFsdC1A30fnl8l/HdIX8HliZlN8hHv8noWsT/wKAQ76wQNhYziRxvH1MG2dcvsV75F8hEaBPr297VaiXokHXIGyztp/AnXFgN5dBSAAxuQxLAcorA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSMhLKQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OuVxmAUo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSMhLKQ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OuVxmAUo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7LN599858
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h26Vcuumsflho0hjqNnrhPlw320bUX1zGixu1CPR/fg=; b=GSMhLKQ2z+TgfBPM
	BV1SYwW/baUNi9LrgfIRcXm9xCdYWBmUGz324rl28gj/TvxhA430Qwjf/eGRdbfS
	Mmjv6d8jBDIgwDE5CrVfgmDKv08uN+aubu9X6d0GZLu8hs4XXtMepI874SnC2EAV
	ejN47m9y3RQaFKUhkn/onY1Ey13A37Wcy+Gz1QogPpInFC0sA5kSS+TO3/7uQkYi
	076TcC3rvZ/In13Y81monBKDQQIPvO8D6y/zxqSoEAEpos/oniHqXGPLtF5N6sHy
	GrfjV5CpJ3nHLG0jwEyDsrlmw7R4vpilJAjIOVIultNhkLsVYLWegejlpUBF6GIz
	vMw7CA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr1rxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:44:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso73303085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954297; x=1789559097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h26Vcuumsflho0hjqNnrhPlw320bUX1zGixu1CPR/fg=;
        b=OuVxmAUokmrCxJrmOiyezYxVtp0MM5y3gtLN37C1NtEz7P+ehlORrqfdk1v5sMsRXd
         SMYch85g6+XGmFeFTrLlwjSJRjNNaSF82isnqQ2+IL+6htvMxxab11QNMKsYloAWQuFy
         yLprwJQzE/CSR8VTEz13mRYqxwVS3CXs0cdbEcoUvBlMf5tDUOE+Uge3LPIa+cbk7MTv
         39dQLV99i4W/yb2ROcrWoVBwj65nLS7QwR4jz8Pg9hTs2rvYykc2IkkzpLMDqMG26vUb
         8cmkZEhDfkFeU+f3/Wb57GTZs8Q9hJhwgZXSTWZuDUmCeXSvHFbZy4pKJI2oQnEauJ2D
         AZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954297; x=1789559097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h26Vcuumsflho0hjqNnrhPlw320bUX1zGixu1CPR/fg=;
        b=JNqEVUghwtLR+GgiKIJM7wkqhDJS/V9ltKNXwQ5vcYx8MFjRT8OPSzmz94TpgYFVCf
         8Xg65imZQaSo7I1FnmvjiIxM/Tr9VmlF3qRuQcz44ApUQ0Hz7tLFweRIaJqr0TxsZGjU
         zWnKVtuwsSvz3o9ZJIohnz73jcnjWtB1D83TPUjf3k+Zd1fAeFk0iZosRbF/TnDGzWrv
         TTaWuywD0bLXlrIv6rg6OL3qgkIlaHw4vaHjtqWxxTPaJEsXzJEH1aoiGbo/u/Zh0DsE
         JaYWzOEfGHwdkw+jBepHlkJKSB98l6Q8rJtabvK46alZ5Uix+45QB2e5ODfVuuFCVvZH
         3wXw==
X-Forwarded-Encrypted: i=1; AKwUvBzHxu+bn2VitPKDtTPvjTD19OQBUu2KCESbKS3HPIKPLDfXQTQRgp5sehbIPfTw6pugeBYPWiS28RvcX0E=@vger.kernel.org
X-Gm-Message-State: AFuF++lItb72p2dmDWsx5/myMe3HIBdoRG8je0iyRH09LsePAsQ1RWpV
	6b1zUlZv6AYZ6UbSWAFyRpDo61r2A9u7C3zYneg/GwhJnVezkkv80d2v/2veBdbfl3irqOeENLd
	SH/WYW+qHq0MtzKmIi+sDjM2zdK/JXRygcX8UKP/7FnpEN78E5CQltknKqt/9UX3QxYw=
X-Gm-Gg: AYBFou11tvxLyQnVAAZuKArvlBOSC9A8Ea7w8VeSmSgkqfyIzbZBeOHdWyzmqYd62Q3
	4+vbcpDrUoxSKNIwm+CDw2DzWRQ6Oik75yCRTGsbp35G5ItONDm8kEkhw9Ot4VL5eNmKqyX0oKo
	6VM4Zv54M7sOgKUWVdRNl43DQmJshLRf5U2+V8fqKkexpCbRDu1w2I8eRJc9BPLAxx9rjF7eVeu
	7FkVaTSRzJcq/phxvIW7sKL5TyYlOC3fIPAssdvSjOrwelefL2DqzvXTosIebuAZjXbODkyV5Nj
	KblV7Qd00qkVowTHZ/aJcS4MJlhfGVIgxqklfuKp6Ymd3+YQbaNZtLF6nEPJkLGZ+8sOZKMVHJj
	ktDVN9F/LNacID1sWq7gYjg==
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr2556542485a.1.1788954296852;
        Wed, 09 Sep 2026 04:44:56 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr2556534085a.1.1788954295769;
        Wed, 09 Sep 2026 04:44:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a839344fe8sm2101393a12.5.2026.09.09.04.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:44:54 -0700 (PDT)
Message-ID: <80467f6f-7a0b-4ff9-998c-192c297c4b4e@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:44:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tty: serial: qcom_geni_serial: Keep console RX
 functional after deep idle
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke
 <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20260909-correct-icc-bandwidth-vote-constants-v1-0-fbebf6b3c341@oss.qualcomm.com>
 <20260909-correct-icc-bandwidth-vote-constants-v1-2-fbebf6b3c341@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909-correct-icc-bandwidth-vote-constants-v1-2-fbebf6b3c341@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa146b9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xozMsgXYk9iqUyCLfgEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXxk3pkWFKQauq
 0v0X1pA9YYWZn2QPvYkp+ZdSxxqKIelc2S4I0GTrVTEs3DJhv8DSbiqwDKCd8qoWTn2Zv1vpowK
 PQ7NwOFyNYd8Rkh2W9HXY5XTp6xCjgIcO9xVXfeU80rQ+u6QDuWcW7eUyxml+mE+gtCOfMLqB+x
 6EIvqVNN1m0AM5y01bTAUnPj+Nh40qz0QM8gItRnt2pdPcdvW4EfbaxXn5Ib4/BmYshsUf2FnCi
 Um2lJImc/5QF8bkBbLKA+/voG2RG7Yi5QMSXaC94sufnWD/JvK726Ld7VAKlG+SYZUnT1SMj20G
 IfdQcDoT9STSLY9HkGva1sYMc3tL4y0OWywK8mqFVWHGnLfLCxYA4g9MIX2DWyWH49pn02TsVX7
 Fy0F8iUId6ffYCluLXuxZHX8rB5wNNnjOp0Qhgq9vqt4rDyE1Tmv0aPNOPa5cTl7kd8StdTpvtW
 u9GH6vrG99XH/S403Sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXw8vTuZvhw+Le
 Bj5kFP2cwnulvImoyB1/Q8u37Kl6JMnJIU7Q8xNbd6b9K6nFcLNDV4Ro2PlC/daVTshd9Eplpka
 L4ErCePzq0qWh0FiHZgeSfWpIU9jgHw=
X-Proofpoint-ORIG-GUID: PILdR_whv5hjXfYeeQYDbqvxgOwjtU7g
X-Proofpoint-GUID: PILdR_whv5hjXfYeeQYDbqvxgOwjtU7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 9/8/26 9:05 PM, Viken Dadhaniya wrote:
> At baud rates up to 115200, the serial console uses only a 1 kBps keepalive
> vote for the GENI_TO_CORE ("qup-core") ICC path. This vote keeps the path
> active but does not request a QUP Core 2X clock rate.
> 
> When the CPU enters a deeper idle state, the missing Core clock vote can
> leave the console RX path unresponsive.
> 
> Use the 19.2 MHz Core 2X vote at low baud rates, while retaining the 50 MHz
> vote at higher baud rates, so that console RX remains functional after deep
> idle transitions.
> 
> Fixes: 7cf563b2c846 ("tty: serial: qcom_geni_serial: Add interconnect support")
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 3633723acef8..b4b4724f1c5b 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1482,9 +1482,8 @@ static int geni_serial_set_rate(struct geni_se *se, unsigned long baud)
>  	 * Bump up BW vote on CPU and CORE path as driver supports FIFO mode
>  	 * only.
>  	 */
> -	avg_bw_core = (baud > 115200) ? Bps_to_icc(CORE_2X_50_MHZ)
> -						: GENI_DEFAULT_BW;
> -	port->se.icc_paths[GENI_TO_CORE].avg_bw = avg_bw_core;
> +	avg_bw_core = (baud > 115200) ? CORE_2X_50_MHZ : CORE_2X_19_2_MHZ;

Downstream selects this based on whether the UART is a console, but
I believe baud rate is much more likely to be a good discriminant
here

FWIW you can remove the parentheses

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
