Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307152;
	b=v6wRRgBwyfBQNvvZKyP7rqP5v5AZUimQnsZ8WrubJb5nGOlGJr6IhPqDooToRQcliF8K
	 /Ce0CQiTaQ/A+uLzgtWtG3Rr3/csZ7wbOhW4TML5xQd81glPWRdtVo630dD+FaMf2Mutx
	 VbMyzxy8vFpKLjik2voW9GkxPzpRYxSMH8FwhEkOlongeJ2q4UKRhKgokpqsTQkwgT7Gw
	 2isNp24WnKH2afmTB1PAAjK88lndrUg3dZx8K9QPaxXe+A4R9A7nwHIlyG9IEj1F7T246
	 aCyy0+8ZyjudyeKhQ6C3R/3BHbLlr7z9ImJeX7E3/LCAOC/kh5J3KEJsMNu4XsW+WcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=;
	b=a25q5Ab0q+KoOHZ/ahkZTJqFO0vCMZiMo1+Vqk8ol+JLnDS6evQyi99XtVDSbb2Mxekq
	 YaZDH2GmT8cx50lZ79UrvVKDFfFa0nvXgdkpIwCLKgcoi0nGP0Tqwccif6fShPduabrf+
	 tSEnqUvj69/jI9OOJIwi7Nhi5WWHnszixotBiabMQ8QGyJhlY2+Ae6b6Y4nB+XhMDVPek
	 fjvC5Xs0OhbA6Krrm3r3w0wlNNYm4Z/B3/kd2DWkgwFpDX4zUd/J+sfp5kuEAy+fNBTGY
	 32wpQTv3PIO8EJp+rD5fjoGnQCdH1UkTBOKlDZxj3rGyTnEKhl1eqLQfbe2MDAIoPxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="WsYM/0i0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8Avzhk8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D190560A2638
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D190560A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsYM/0i0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8Avzhk8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7kpOe2779864
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=; b=WsYM/0i0nj6QVCNB
	LD+5ZXziGhs5DAXhRYtHyjhlhZn8/Gn2PQVVq6e6pDhepOv/Grzj/YaGYZZgzzYQ
	lsVoEtwjT8+/asdkQZ9DH+hD2KbDaXtyIIhFnQnhEMIdm8RVqSvh9CYYDKF9MoAB
	hGA2a0ugeA+7XaweJmxcumOyUKupX6b8wh5dKzKUCGhAgeQPhjDutaBaAUz9IoZK
	2zqxKbdlGREPrWUhXrIeLYCrAvSkpBFrMh8vlJXA/Zy6G1j0CqpNOlMCZN6y4oG+
	9hBEnroL8BeKOstRhhBrnVqxbrthJ3Oxs2uOfI39c3DWq2l5r67Oiyw8hoatb8pN
	dO17iA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d8n7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:39:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3389942eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794307150; x=1794911950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=;
        b=S8Avzhk8BQhS4V86f2YKIuF0MCy4TSBwVJHNILESf7NgW0w4h8hLRk2/UvhjKCoL6w
         wdC4NFyI5Sl5F4FCO1zZt1JK+9ccKNiXDmDcEWTQ2xAcUAgqbH8WyVJx07s6mZhIgv/e
         CR35LwYczwc8MXQtswGy7WwSHeEfF5tWP3B8djCC05wWsdgrK1rckmW68kTjABDW9W/q
         mc6nAl39IoXEd7Bzk1Y7A80MDNk3FPHL8ihMvh+NVOWntzu4XZzj/RfDorhLKS6eX+4J
         cSHQR+tEbfg4165AtzxspCll20XlQMYoEKilvNgfduaqpwmfltGjqZ7N5CYnUbra3sGw
         IkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307150; x=1794911950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZG386YuIEJ6iBTpDnR8DFXW4CBJWh4A+gyfmdTuSbgg=;
        b=l6NvbLpwazVbAygfMY8dr0WmhGdpZjJbDPNQ7zTPyuZsT4frW6R/4F/tjk+PFud7ts
         n89rTGgGrLirYxyWyudTeOYGfUtI+IiEmkRHdD5DswHTpIBGEQgy9Zyrbmc9sDZsaB7O
         BOD8qS1jZTA0n91SITbN95ODL10RhCZU4K5bBtYRan3JmNQHD0ZKlvs1cO1vIfq8WxAM
         95EWHbAn4jUr4PS4/cRxDKNxxFeDGjl3bN6v9zHfvVKRx1T61226WbkJuHoWnLaXPRnH
         jLVa/9OsClQ62oCDmWufg59ts7RuGG5bVHJfFdoYGOSnbvqwk1ZZAqN+HUf+obxTM+Yu
         uJ3g==
X-Forwarded-Encrypted: i=1; AL+hErE/mq6nDrr1DfgKETZWFUAsFZze8FplxgGn5/pqXSfrDydq0RI+uVdeJMgV5eZyJwxeUKo0lZqq88lJ62Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HKcqpRGUwSkHJR5Ovg5v1L6An7mh06bqYsGHeRlZv4nlzeqa0
	vScPgqWgR9XXYvdXmJUWwY9/YhIhaLik46LeANnJ0dPJZmPSUUDLKQHWg76XvyvrJETHmaYQmkp
	V+EzKM61b1Gp+2rH+i7dTwulNQMCqR8OEaeqfwZFlnWfXw0uqoQcHsKMpLmaoSIoxLr8=
X-Gm-Gg: AYBFou0Zb1lhUa1b3GkT4jQjoGXPQFZbci9O5fVqhsXLUhW50FaloYsiQxeRIMrX4q6
	ghP1lsNGfgxzHJ1kD5XY1ITYwKbs3MTJet32NIzAcy2tAdSDAFkWciC5PvFxoUD+ZiXevodtRrS
	YYEDygxtiTQuUvU1KqNcjEKdBgUnCAxCeQscs41rTd2cyg9rIfzTXMNJnk0518EJDoIjsGjCevv
	WZH4MjjgjE/Kd0P3IgwhQ2kHmYgzuSy1T1HfsAnUMKXdlXcMVFp3yfMh4yuu16wb2GrDzxZzKRO
	57uFGwDCvmkNMEi+es9+MZfkFEATFEHIUtSrLqcaKFTWWjMvT0P9O+3yK4RaRCCIIaIrZVmzr6L
	LcSczOJFtpBhu76SYZLEKLbvcarOg5aouY6BwEr6izxCHMUqw3IGnciWdyq/79zfD4zI6Jy4Wy3
	bInQT8gA==
X-Received: by 2002:a05:7301:4d05:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-3751e6ae405mr2608460eec.9.1794307150141;
        Tue, 10 Nov 2026 02:39:10 -0800 (PST)
X-Received: by 2002:a05:7301:4d05:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-3751e6ae405mr2608420eec.9.1794307149455;
        Tue, 10 Nov 2026 02:39:09 -0800 (PST)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm6411676eec.25.2026.11.10.02.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 02:39:08 -0800 (PST)
Message-ID: <69573381-2c8e-4744-bcad-0165de4b1406@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:09:03 +0530
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
Subject: Re: [PATCH v13 0/2] Add LPASS VA CSR HeartBeat pulse clock support
To: sarath.ganapathiraju@oss.qualcomm.com, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V9y6KoUYL_ecuRxuMMWW-zuyRcOnzHIr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MiBTYWx0ZWRfX5PHQFXLYu2bU
 75RvKUMKs329liFKLW4yWy5GJbkb4PI/+lJiKBYE/cYgbR0C13t/pIbf/htC3XbW8Li/A2EPLd3
 REkXvM6xSihBdviKuge7ccdXPTkrwYU=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af2f44f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4tIis3KsY0wH9TNJrrgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: V9y6KoUYL_ecuRxuMMWW-zuyRcOnzHIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MiBTYWx0ZWRfX41c+FnXo1xnR
 hiKBwt7LtrVbHpV0AV6KHk8UjLCXfbMD+efl89+ykiDkYeflOpfsgNR12rISQWOdKepnpv4VQPP
 XOINE7+fP/YjcvcUUHOfuj8OjWebYl3cY005iF+KuTEdeSPn6YBHBMSaw0AEWQWyAOxT/VTEmoz
 0bakrexDT2yHNdISo3ntR+xGARDvcb14cHDK5vtJ2kAUB8nayVTctBQuUfYdxxXC5NBtAhVI83P
 qvSbYs1a4cKR0f8DQbXUsWsopjX7K+dHmxL3GL4aBgcr4/zQea5DekOWiv0PM/exxYjCn8chA05
 lRSZx7leorlYuKvGJOlWtgXPrpWD1o8Z5sGpF7iqLBD3/FBpEhtoz93bg4pQR2GgiOIhSoqSUII
 0yRJz0ZqLPN5a+/HiPVLuoiUi3bOo8msB7baXoMXow5xVkvLe2hrsQzvNh/XIfM8nYScGruW6XO
 wG41nIZeHuLubmIIuAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100042

> - Split the qcom,lpass-va-csr and qcom,lpass-va-macro bindings into
>    separate patches.
>
> Changes in v1:
> - Initial version
>
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
> Sarath Ganapathiraju (2):
>        dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
>        clk: qcom: Add LPASS VA CSR heartbeat pulse clock
>
>   .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     |  62 ++++++
>   drivers/clk/qcom/Kconfig                           |  15 ++
>   drivers/clk/qcom/Makefile                          |   1 +
>   drivers/clk/qcom/lpass-va-csr.c                    | 210 +++++++++++++++++++++
>   4 files changed, 288 insertions(+)
> ---
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> change-id: 20260917-master-6c2778f57a9a
>
> Best regards,
> --
> Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>


Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

