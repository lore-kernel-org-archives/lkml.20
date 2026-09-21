Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988D1459AF2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980828; cv=none; b=t1N0oAK1Go1891JGnmhHN+y9g+boqmoWV8sBUTayF6ML6U+MyDhyg+ncCVOxEOMm088djzvGP1YHR9Fysykop+NUPckxhT1sSTnm0SriwTarTzJqIQw1mBfxGiiWh9WRiJhvEAe9xVw3ukDPR2SHNt7XGbdO5dfJCOP8oHBPDHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980828; c=relaxed/simple;
	bh=kQaNTO6q9D0rnp6b6zlcR8Zeqr4VYQb7j1q3YRsx9Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lVkG6Q98ZvfsXv9fmDEDw0Wv0VBt8u69r9xxDiBkMoUouYiKZFpOiLSH15JXq8DeXYZZaMGv1CvgN68NGBuoSY2Fjbt2IjeRw+mB9tLNxXUGIFLBzWFt+fkLRPgL2Rs6DsLHxZP64YwIHQontrfbi+GlrR97tfEsTlfCNsD2T+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhX9bn+X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F3kKMXbs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhX9bn+X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F3kKMXbs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79vJ5467198
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MrXsJNxfj8OvVzXFKHuOrWtZ0APERwm/HJ3f2UHdxPk=; b=GhX9bn+XQgLCh3c3
	skoycZyef7kZTejkMUep28fyxxH0myHpkCJuHTdNP+aAFEe9heTJZEkqQ8zpTx35
	oeQ0d2rEUeylefDYds7s9ftPefFUwzZZGzi35w+yOm9gcffykoi1ExhGX48N0ON1
	4wplN13LoLGKsSN7SSMc18mTDlDeSc3b9qDQzsIxijokJ/vZkY0na2UjiZxzjW24
	rP0h/J9mTuqdJPZ98x11z3bHKUazciIIfV/z4tcARIoGRu28euFJ6pYw42DtExkJ
	PuPH0nmvehR90rHPWmiLXsZUWN2OC9LAWJM5qYeRbD5a9cpf23kpPPfYMZpqmkmU
	GmZUJw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b9s38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:53:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso53250185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789980825; x=1790585625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrXsJNxfj8OvVzXFKHuOrWtZ0APERwm/HJ3f2UHdxPk=;
        b=F3kKMXbsyE6XDz/yCRiqdDVwZzePZ+XNiv/PIxm/XEY7dpQtFAXKK/prYL0uMBKb3W
         UT4Rr/uKWnl0Ex+ziQsFQE5egZp1I+TiuFGwy/Qs4BIFK2a4XGSazYtQ1aZiGJFvC+xs
         5aPJoqiAZZWOZzpECga8chesqAjl+VQ3inLpOhoZ+LllYswcUt15aerOZ9z7y1rF6by9
         fFBO8f857Fk8Z57i5q9SjkvTBc4iiH01wnvHzRpd51HDJrDJQxK5PcyLmCLZEx4xf5ni
         Pkw51/2/29IFVzvHIP7M3dxB9BfGN5b/63QGkrICNY7OqEAaTS/+DaRR/cnAFQaWYTla
         Q39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980825; x=1790585625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MrXsJNxfj8OvVzXFKHuOrWtZ0APERwm/HJ3f2UHdxPk=;
        b=0/F8swhwb3z6wPitTgiPCstOQRbFDIAescq5JDIxw3F0VEjFkCFcEFFo8eprHM5Xwc
         TxhqnmcnuP//Vl0G+e/zHDiRHEiYBPT9mHQWSFrM1DbVnNneMFj4lrEEVcc1jfedI9hL
         45EFQAli0ZZ0NWD0Ghv37e5v15LhL6cdy7jqOC/Uoke5b/J4uUWBZp1FO5ssQElZrBaB
         qBAV7QxSs8b2koMPNpbcdlbx8pep9+YBAQuSrRxtkbSw+5QfoEthunWhG0lq8kb7ltQ9
         p7HWB8B7VDWs+3S4x/vz6atF5MhAW44U2NbKX0JA2omYvmZMMy3G7mMhwSxQYNsZ5KNm
         s3Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxHAXEatjIfbea6HLm2yHgj4/DGkiCwdAGIZmHvK7VECpceqg1lg3X2YtiVyZnxGUPCdpT0Z/sEV+ogJuk=@vger.kernel.org
X-Gm-Message-State: AFuF++mcoEnSx5P2H0D9v5LANLD5ygCz/RgBS4aop4vyCX+FCVIu8zUg
	Wq+OBdvy62VwsAp6QFnGF14fmIW1fGMzEOJfvwH/a4dgpXdE3L5cRlCGDA4t7MdJ9rldENqRQRx
	GnN1bO89iYx7jMATQK5aXRczjGVtoF31XujvBRNy0MmX4xvvEjtG6q0XyjRPulE07VEQ=
X-Gm-Gg: AYBFou0Xw50fA81r790zcfnrpvRyK98yC9OlhTFCi/YZKxfQviJyfr1C8tbkV+vW7nH
	ogyAxPMgOqmDuou16jylQrbXD5s16LhnMAPfFLBHtkUGHiBhyi6gOzIOlA93cd3IirQ5YvAsPDp
	m3HOaAImDLM5M+NQhjku57aLOiFLw9394mALAd0N1CFXp2su0EFJh5ecBaf4UU0/MrcFrLUjmFS
	rsu7emws3FEJOraVdCNsoHxredpbLmCndHOQnU9sqZsT7VUcrffrZlX/yfU8wptGAfY37ZqUY4e
	cMcOaBQuSGn4iDQ7WM2QyTZqUbE/4PuBS2Sk1A5Z3ZQRQezIyeUCxrHqemVLipuXrpPZKr/LJkN
	KrzF60dcXoMcbuT/yc45DIA==
X-Received: by 2002:a05:620a:4803:b0:939:b8da:1242 with SMTP id af79cd13be357-93bf518f649mr925794085a.0.1789980824775;
        Mon, 21 Sep 2026 01:53:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4803:b0:939:b8da:1242 with SMTP id af79cd13be357-93bf518f649mr925792185a.0.1789980824404;
        Mon, 21 Sep 2026 01:53:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a640f9ef5sm174089266b.25.2026.09.21.01.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:53:43 -0700 (PDT)
Message-ID: <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:53:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
 <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
 <ad4aff4f-2d66-425a-a358-6cefaaa1319e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ad4aff4f-2d66-425a-a358-6cefaaa1319e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyNiBTYWx0ZWRfX1Ppp2qlxORHq
 /JkxE/rT50QZgnepUZvZb88lapiIGcrvkzLuTSS3tB7L9pBl2t6lir+dkt4LAQXERl52rGGpnQa
 krorhW2sSqkf/UoZ/UKIzleDrqcVevAoo/NWfl5Vc+yPMbneIz94c/TvMm17wTxrbscVRGW6ZEA
 KXFe/1lKLQlN2zu4CUOWg6XL1VSnFJs/WjNOC/nt9J5EeL5gqbkRl9H5kfZANsIVWU0N395bxu9
 pTV9g5Ny19Pkzvq5aUVnWCnmIln7yQMCiqdHUQhD+vmd9awxj/JdxdRFVE6H83o6glk7CuLwlKC
 kTdaELRgQukXkYYYxgZ93QzFKsuxmd9KCrc2yh669kWE7MlSQKetJpQ/LgpvxDSEP1Mndx9bMay
 CHF0cpsoYQcrVTYV3MaBzg/blFJAk89CcbArnDJ6B/cHqrPPRYpepfTGascZsO8BF1rAd8yVzVo
 gk9WPHjKhbQEYHyZTQQ==
X-Proofpoint-GUID: sctlpaKwG5D_tG0ngNMT_ay1L3GqMjtN
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0f099 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YoD9nDvxzIzkCcflfdEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sctlpaKwG5D_tG0ngNMT_ay1L3GqMjtN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyNiBTYWx0ZWRfXweTpkasrQG7V
 Z1cgfp1igWIQ76WQlY/yQQeZCO6/7m3y76O8YaXFzXmJ+BMSblTEB6NKJZBg0//BBbSTvbEgH3K
 CfLrzhV8cgTTqZd3RQEd8Gl3TCteznI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210126

On 9/16/26 1:05 PM, Imran Shaik wrote:
> 
> 
> On 11-09-2026 02:36 pm, Konrad Dybcio wrote:
>> On 9/10/26 3:44 PM, Imran Shaik wrote:
>>> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
>>> every clock, keeping them non-zero until a consumer takes over. If there
>>> is no consumer, those clocks will remain active in the idle scenario as
>>> well, and the sleep vote is never cleared, blocking XO shutdown.
>>>
>>> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
>>> keeping other targets unaffected.
>>>
>>> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---
>>
>> Are you booting with clk_ignore_unused?
>>
> 
> No Konrad, clk_ignore_unused is not present.
> 
> Irrespective of clk_ignore_unused, the proxy votes are placed to RPM
> during handoff. If no consumer takes over, those votes remain active,
> keeping the resource ON in idle and preventing XO shutdown.

I re-read this and yeah you're right

Is the handoff functionality necessary at all for non-icc clocks?
I'm suspecting that this was just a port of the ancient msm-3.10
logic where the (modified) clock framework had a handoff mechanism
similar to today's sync_state, except the toning-down of these
clocks was never added

Konrad
