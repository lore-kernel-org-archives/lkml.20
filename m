Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698109;
	b=v07cq2XUdBa13tE5RrCWcr8bsR33fxl6HZ4Tv4F7SQvYFXHdbUhve7KaqeG6fHRvQixl
	 J1jTPobpMJs02MvWC8Do/bcIgvm6rWSdgBI1PS46j6uchVvyCkx9dyjKBZTaFbVYAudlp
	 V8B8srjSMLThf1VLBk+aXGdjOvDkkEti+VOcSBTnIblR6M7fbtM1gl+5XVE8HTvdBNZeD
	 HQBG+cuXzNPBFjAYbFZUGv0VrkjqjL9zfaxadKLW+LqvQ/JhmfyAa+dAii3ya0d4u59xP
	 pUl7g4WrXVS+KJQH4bsFbcCC9btnPLPWIdkVc9K8VyZzj8bR0905tlGq8mZ6OJahuIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CnLwxnc87zGnVss348UPyqqWPDveLZQZgSaACTND7ko=;
	b=RopaoCXNeVq2KCuF9u9I+E2oUfX4ABjgsmwVj36VjD8tjLQ2wLsuT94VzQIv6B5pxH7z
	 GKa/eHB8Lb+d+WmKvQ3/xhn+o4CRP4JAJgfLuIT5ubpVscwTtU6Q5DVWSOlSFiWyW7Yyk
	 U7JSeiFxtBCgvfXzGfSWIh71U7MmyutXP8ziJsDhXr+RMjalnf0a3kScbAoeEsJLHccus
	 UkDCLrbVuaEiRdVZ/Zj4tesC/C8QoA2/lxnOzbCJsTJeZg3ziFmtz2/cictfJdbGTqej9
	 gpypN2a9BdIgbINP2CMdDIdvsBuSk6E6vjAyxrO2USWMuBlgVOWSLPzEgCaBISuZ66w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Paa42qr0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eBhqwYFU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FBA606EE80
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8FBA606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Paa42qr0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eBhqwYFU
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37ruRw1432133
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CnLwxnc87zGnVss348UPyqqWPDveLZQZgSaACTND7ko=; b=Paa42qr0P3PMZZsA
	wtsXsKohzQTuOaxCDEXPIGYM6fW1SkLcgzIq7hKWBuS6MoMyNShKdUPLDrA3TEEp
	KoRIgJBT8DAfFUMnHjnisOfOi0Fvir/XxD5wIoZg5ypvD8CIuVFYpslhT0+dvFMs
	6/DdSspeX03xqt+MU4QcpXnQm9bX6QQXmiYbQxG6qefx2ydzcBydxHzRq68YJoXU
	HUK66gttema0l/K8eEbRQU1N1GByO2Hoo+nay9uF7evyK+OPm7VX3kRRcANMlO/Z
	XTkcQRAHiBFtGsj3E+zBBFT2vD+Pwf9gIG7bFlco2+AoC1wEgstTWv+3CP9Vnhrb
	UC6MWQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq08730nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:28:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so72793885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793698107; x=1794302907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnLwxnc87zGnVss348UPyqqWPDveLZQZgSaACTND7ko=;
        b=eBhqwYFUvxATaGyFuaRS1uETmO5kKJZXU2uYgrSZ6N+W4Q2UYiutAfMPDoa+M7y23h
         Toy49Yb5FS5rgnrmx2N8e3TEwS9tmrLkWny82YlvNb1gfjHNQesyCfOz5K1b6yf2MicI
         yGHrnks7DMuUdy03UZgL5s0yK6sCtsKT6CgC1BJ2yzzblxb8SxRctef+J2eiNYBQFr/F
         oFy021sYhZb7RN53NjINtuqFACYSVKIyENLjyi/pFuN3646BtaKN1qc9BwyQL3oFsJqz
         zsu2ZHZ6rjmYbu9c5FxQF3TkGqV/ljCXRz+RiQ33DFUjJTDuKAgB9LYlD4mSMD674NGH
         xdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698107; x=1794302907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnLwxnc87zGnVss348UPyqqWPDveLZQZgSaACTND7ko=;
        b=qhW0zkuEuQ6k0YElD7N4Iz6sHZw9BjzB+xnn98hixTakREcFLBZnquAeDz0V/7kCvQ
         LVPHOPJSmhDyUkOpEiyAaqN1XcyWZXY2YYShA63utJNSUeoh0t1t3CZY4mZm5a38MpVb
         cErWF33IxFKlmFaxUp74Bs0pVFrkGm7shNQ5yKbm6fMA7XtQlPDGIn6ydj8mVT/iV+NC
         9ateiEcc+ZfL9E7u+NWsSjWWndfM0EmzG7WF6qgE+iS/WZ++l/TUY+CG/XeVXk8VZfBL
         vNuxdwu0eE4JcrF02M7pT4QK86V9V7E7XdY+Y1QwLtj9yKcJVpvNqZLSVP4XO+JSGEfW
         EaPA==
X-Forwarded-Encrypted: i=1; AKwUvBzZzvVPwxw8Bej+rrlnxmOBtvSUDZX9ulH73Mz9GuAK8oYG4WcPcFk4qHHqviUSuOQMUcD5QsEwARBlmMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/muvrpg0wedLjV3piF+YUWRSE/CNH+rdreYeKYug56vcNPiVBv
	tPK4/fN7gZe4h1kMvz8YVKMjv+HD0h3tatWkzxkTB57Pw8u3QxrlyWuB0kEVmZLFLC/dt9L6rYy
	++wfA2KBNFt17rcGe7kEXa/E21ykdG8m8/nBT1e6I4Khlr1n3F6y50czo24Ff1rDFAgM=
X-Gm-Gg: AYBFou3X9A93ejDfBeOwVit3ZIaDKMqp710dvMO8Duo19moNcpwU5E9hMgLyWR7jlFh
	0HjU8q+DuaUKg79Wdqsmu+3T2wxcWugT/jpjie0IzluGHkJPjzB7fn0WUHTk4K3rp6hOqH1NyGQ
	oW7Frf6Y6k+l8qVr9YkCVEupeekso1/5RZuiM1cn0r7s//xuEZjhqwN5u++VTYeYtkQopxMPTCs
	gV72n6FsOCz/OSDCOW7FN0gbCGElIQ0nbysoQV7+5Pp7eYxMYeUBHcmJzzX1aSnrR/q08DSyAJl
	aaAn4pXr+EKbSnRBDySES9XU8v04P94XMRqjCq22c297aEJkKB/xVSPI4BTZM6SLAnD/HH5WMiZ
	pVGkFEjFOP8bfv0uumrzNiPAZ1t2y0vPc5m3QEhMoTZH1Tn03opRONREf8YUZduP44qzUTQ==
X-Received: by 2002:a05:620a:4d0e:b0:939:8148:1e3d with SMTP id af79cd13be357-944215b76dbmr2356107185a.2.1793698106276;
        Tue, 03 Nov 2026 01:28:26 -0800 (PST)
X-Received: by 2002:a05:620a:4d0e:b0:939:8148:1e3d with SMTP id af79cd13be357-944215b76dbmr2356104885a.2.1793698105836;
        Tue, 03 Nov 2026 01:28:25 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0fbd6sm4065994a12.24.2026.11.03.01.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:28:24 -0800 (PST)
Message-ID: <9f6029c0-5dcb-4835-998f-03b1b30edaa6@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:28:21 +0100
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
Subject: Re: [PATCH] spmi: pmic-arb: Fix the driver data used by non-data
 commands
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dan Carpenter <error27@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261102-spmi-pmic-arb-cmd-drvdata-v1-1-2e5ec8035b85@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-spmi-pmic-arb-cmd-drvdata-v1-1-2e5ec8035b85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfX00V2XoWUlEXM
 ZGm38Ya4y0pG7gaTgK9B2xnlgPddKuCX53zYfpd9bqrpt50gG29IawSMkot9S+WfFDdAr4YwwJC
 cH0IVCUNEC19qpwW3yn85+0Cu8pEmMg=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9a93b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yHj-swwPdn-rtVx7EIEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfX/XX9QUlZcnqC
 6CAJlLPGS1GyXUwec6nXbp4xTPrgwkCQe4/BWSC/LaHejfQAP8r5cgID50+s43HuzAQYzLY14rq
 suS3U0J81TArggKxYthdHp9O1tXz+yYZ5qpyHyL29bjo/odGQ2MQ0Jfulm2sf6ykyRfFB6PlvcV
 SqDIOdsWumgU9wgCyrj407TOdWX1FTADt0xeUkC0Q83Iw153erB8wiqS+Rb/j0qu8PJRLHH+U3S
 IxN/lLVt1VhiUxeYf9AzvlrThFUYvtHcYaCqyAMvIJzPweNvv98+8aJKjwIenLHudRUGDZyTxhE
 eJF/VADuEgDrf66D/ZKIt+0emDgw8x7p2U8EMIpNVz4AuGk+nlQAoJIW2Ui7GxQH6k0DsgxIunQ
 uZI+enjRbtgg7EMQ6t8EEg8FIsa+FrV9CEWQxAwZRvJNJB8GV9JKOww68ajrAZsyxadwBw4Sjzm
 Q/vn2dsG5I6DsQ+V1nQ==
X-Proofpoint-ORIG-GUID: 49shm6WKXGGG9jt8Q2MH5aHpVwM1RP9Y
X-Proofpoint-GUID: 49shm6WKXGGG9jt8Q2MH5aHpVwM1RP9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030037

On 11/2/26 4:46 PM, Abel Vesa wrote:
> Since commit 02922ccbb330 ("spmi: pmic-arb: Register controller for bus
> instead of arbiter"), the driver data of each SPMI controller is a
> struct spmi_pmic_arb_bus, which points to the arbiter. pmic_arb_cmd()
> was not converted along with the other controller callbacks and still
> takes the driver data for the arbiter itself, so a non-data command
> reads ver_ops from the wrong structure and calls through a bogus
> pointer.
> 
> No in-tree driver sends non-data commands at the moment, which is why
> this has gone unnoticed, but spmi_command_reset() and friends are
> exported for any SPMI client to use.
> 
> Get the arbiter through the bus, like the other callbacks do.
> 
> Fixes: 02922ccbb330 ("spmi: pmic-arb: Register controller for bus instead of arbiter")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-29e1d31a-8d20-42c9-a5b3-41a90553d799
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
