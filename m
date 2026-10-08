Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C4048CD55
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460533; cv=none; b=kl0hkU4ehjTuDHFOw0dHoQ4Nryxf8m5viywClDE5b7pU3VkHoei087RftuoxCs5d2+ps7u1O+bCjAkUpB53trow9um+J4x7hWtG8zThqSzuUATtIhSo1mhWLYzK/RI7vITkDoHuMqaeR7xQhNyC+HGx8E5LauWsZPVcYyEpUGW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460533; c=relaxed/simple;
	bh=ceEvOrf5v3Z9+vRptPfuj9AfIT5gVhdIWPHKmGd2hmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONoNk6SmZuYtCql24CF1Wlv86ZR5MuuqcUjdDIPKA2jJQIUmREafFuGrljr4I8RJdHtpS5RLmwmEYJclhf0sDr4x3JeQuYakiNz36rw8MPxKZthcrewbptSnPtUdsx1Dic7sSEnLz3+/YLkdHBKtqkdKk0qQDsJnC5sL8xowyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7LLuuPM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHClCc6z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7LLuuPM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHClCc6z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK8YB2116437
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VyzGRMQD1q6z78jn5p1fT5AtGynvPGdQHGPlwJqf9I=; b=h7LLuuPMpWc4vT5r
	iZvWVyFc8SQvml9jkwS10kJDnysIPHx1LisUt/rTKwksSija5xYzyFsJu2ap1My9
	KCkSeNxi4gNWU4zbt0UhJQdA5EHwSjeoCrhHJSvMns4wfsEBoj4WuA9zMnvlMixw
	oO84yDKT/WuDjxtYi4J843ysL3G+8M3mG92nt0V1M4zejd1jM39vEn4sDjOYmHLP
	tU09D6kb9gbRsiFItvFjJGG9YWB+b0vUMLm+e5/8gmAmm/ISVhNeRbLjrjZgtlIT
	xl6c2OjSYCJLgNVIk1oLjSd2I5NrTvQixVTC3j/zwZy/Ze3ud+Xg2iaVYo7rxEs3
	47ZBXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe52rs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:55:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso664451385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460531; x=1792065331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VyzGRMQD1q6z78jn5p1fT5AtGynvPGdQHGPlwJqf9I=;
        b=FHClCc6zH88Hoj+EyvA8lL96qBnMHMoKpc1nwjTWoLKslD/u2kzkZgF4Nv88V6fd+8
         7FVJFaxyXs/jGMvdQRk2m32PSxpcdGj38owRKAl3s9doSdNSIQhZ5VJxjBtoFd9pTTRv
         bKZepQ+y1zizpECzxqB10TtBTt++1SZ4LgjFmPVwQNo7mye4uXSktUi9lSxn9ksWZCUS
         q+lGWIuscJpkJFcwi8ebciLrMS1tEwSlXFX0/Zk7ix6h/1KIZithpEvb0Awx4wkGekAm
         Cub1Qav8LDUNSMIP5suRCGd7fK+0gYMh+Ja93Jq9ZB+2PicXdg0gInrcmQS81CG/+DpK
         Oj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460531; x=1792065331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VyzGRMQD1q6z78jn5p1fT5AtGynvPGdQHGPlwJqf9I=;
        b=E4Z53ekgVQnlIcQeFhxlbDCsgvAqTovVBpbl4IoaMhwR3O+XVPWdcipVguQH7YcasP
         zj1WNLaS/PlA7JEFzhURhY/hBG64xKHMq5WMNvLJL9ZLAUG7aKd+h+QMmJhhmXDSOpt/
         7J68du8YYpvJW0iJVkf50QlBJEocVE9GINEkYy8l4KqBPxYwug1+StI58rAN0GYsZWn7
         WEZKta/IHejXmwm8u70ZSsEhxlMa4lW3uHJ8C8fnvJkZNp3wfVUK0sggV09sgErQtNbB
         FMB7skdDNsop3npMwThZ60CiT27vPa+5ahMp7+bEGbdIrHYrY0xUhOkuyhPTLtpYnw1Q
         RUkA==
X-Forwarded-Encrypted: i=1; AKwUvByv2F9vPGhKOwBeOo2Ze+mrep2wnj0InKbt4Ipg11cEzqNrzhhDaV0eWKUCGqlhvM/ZIXen5ykx65ZSjfI=@vger.kernel.org
X-Gm-Message-State: AFuF++mvoDBkVvrRoHiFotsSs47MveA5kXQoWWZMHT87oX36h3Zujo7O
	Aldr3EXaROIXIk9Ov9WF9tZa1sR0ClA/nIB6voSUoFORGpKD4yhNln6Jy3zKsHd6AkWB0WLufcN
	Ytpod5CdkznipI9qtdvBwR1H8fxr3IdfLrT95qqbl8x6AjFiwTjECFHpbWci/SxLlCgw=
X-Gm-Gg: AYBFou2Oyb6jLsXLPNDYwgLR+DhSeXXy5VgUeMP/2b+of2T3qs9LA3zch+N1hd6BPhE
	q3LmmDDf9a2Gkn3m3MBoCxXUKzD8I8UK/bjpX+e6PmT1tnAc6vXwM7iQL5im7Q3Fch97lKV1e6X
	47SOJagDopl5vTn1KapQ/yjjZJlSaPVYcRnczzq/tiXsqHtmDyIX83K7Z2uPVzGty5b4oCcILGm
	Xi2WDjOo9HpiuQZT+jYSejm+1yWy1ABANdqV40jKXHMq7XzT2O/0VchTGPUlVY60GSyYbHU7SzD
	/GDntq+JFexVJAcM/96fjqAHT2Gtgd65zoTkbQFZ6r6/RaTXEven8GhCi9OJ38kwkU8fz0gS49U
	geTMsKbr9p0+uzi80AtJjInVdOrEL1w/x3zxWBfv3tjYCdDA/
X-Received: by 2002:a05:620a:8807:b0:93e:9808:b9df with SMTP id af79cd13be357-93e9b83bab9mr959307085a.68.1791460530600;
        Thu, 08 Oct 2026 04:55:30 -0700 (PDT)
X-Received: by 2002:a05:620a:8807:b0:93e:9808:b9df with SMTP id af79cd13be357-93e9b83bab9mr959301685a.68.1791460529986;
        Thu, 08 Oct 2026 04:55:29 -0700 (PDT)
Received: from [192.168.137.143] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48c7af26edasm5607062f8f.1.2026.10.08.04.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:55:29 -0700 (PDT)
Message-ID: <59bde1c1-ec5c-4ae3-b3c8-61739f280ce4@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 12:55:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: Add LPASSCC reset controller
 for Glymur
To: Rob Herring <robh@kernel.org>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261002194436.1275056-3-srinivas.kandagatla@oss.qualcomm.com>
 <20261007211148.GA312846-robh@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261007211148.GA312846-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0d-gmHaNcA9jI1Bg_EzugDQEon2PKBxl
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac784b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=V9EgoYKVrGpsH2p6L30A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX29cBXING28W8
 LCvam1izQ6pGgMnx1oLxAV5TCcctZ/FJmkPyBrozt+lvgvSmmRChFhosWvIJsyMgV3Vo0qzpusK
 9em1tI5H7nNhKwUS4R+EF/wDZ/VOJtU=
X-Proofpoint-GUID: 0d-gmHaNcA9jI1Bg_EzugDQEon2PKBxl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX8vuCUNo4bkoC
 2k7RQgQbYzf4ivQtVyJi3YACiDX2xwVNWLFmWuG1Jev4hU9UpH+Mm5EyeJcEEof3IWEOaMROvrV
 OrwRv/3JMPkX8pirPBN3wCCoin/H8uotjY7aYkfZ6IbamLtDl/GG2lxVzgMDNs4k1GUfcMm9zi8
 vQ/TP1/ar91PdvVM/Yb7QvAfmueDryW3JC6tg87AVCj+w3b2eNEPdM27nLaB6nCRGBznjORlTvA
 ZvL8qvlBM5FKOZ9m3vVx5iOBAgjy7yCa8uNyAjB99H2SpugbGV92hf8mFrRQGj+3pgQhYfiqPDq
 cPMiEm4cL2uL4RhupXvkk3ge8Xtt4raHE1hewX7IemeD/ya+gWSl7/2sFvKKSAH8rKyqVhhsUiL
 yOnbzE7PiQDbEEuBhuT7QE6mhttPWq6h/i4QH/xUBgEv6v/BlWSzsroBSqof0u8II/yLlk1Li6E
 fbpjoXkX2bomalRN5FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047

On 10/7/26 10:11 PM, Rob Herring wrote:
> On Fri, Oct 02, 2026 at 08:44:33PM +0100, Srinivas Kandagatla wrote:
>> The LPASS (Low Power Audio Subsystem) clock controller on Glymur
>> provides reset support for the SoundWire TX master when LPASS is under
>> the control of Q6DSP.
> 
> The subject on these should probably have "QCom" in it somewhere...
Ack, Will change this in v4,
--Srini

