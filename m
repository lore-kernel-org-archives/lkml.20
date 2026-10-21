Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570028;
	b=anx+OGMHcccil3fHLn0iXp71FCs1RaBSid+OWKIIKaVog2C2ViJ3ClVEIzSqgur1B1P6
	 0u6oB2J0/nQ8P3PD0nB6iZc25IFX2s+GabtFE/thciG8oMJhWoxfxiDHCVlaCAtQref1v
	 IHxN/9We1ZbReKjUj1v/srN1JLIrhiLCwg5AJrI0i1h1RRkubh27LFiIXjXfFyMXi09yX
	 Iv/Pa3giOXNdJb6ZEG3+f+ZFMQ88tw0z7vRhfd2Nz3CPGsCZHasRihMq8O+RcQehFLHDc
	 n9Qysy4YqF4VQarblLqdeig33wjHn6JJrxFpXeshQyM6S8NIN6S9duBgKhvCVmBPGYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
	b=g5w3kY/Wez65Gf+0kz38hD4c1+nun7+EG0fAiTVfxOqtSRyskfgZ3M+CF95JdkIi9Civ
	 SRbQaTnqE0QDdGC2AAuz/cm/vjndsod9ud4NKRbbSvo6/Q3zbT8MsDsue7GsjukiW00dK
	 VOAloyiH3zUD+4oY08ydO3csImTxgkWQL7MAIFVPNKaUGsSy/H/tauUztgoC6B++nycvZ
	 0Bt+24E1eheQemdTzkn8Cmuk8ERWh7FrMIe8+UNRXNfLglPVBYZAv2AdK0LWmHqCVQ4rj
	 XZSQkzC7NbIXep5fu3Q/SAQdNH3IVqiB6kG1CZWD1Z0jQDLdycTKnmOuvqrUgBRmkfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D469CcCT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dbed3YSU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE979606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE979606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D469CcCT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dbed3YSU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j69h793360
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=; b=D469CcCTYrCmjf5e
	kTVMVJaULrG6V/52/UBW+zUCeEHYMCS23FR61DZ96Zi+KVMtk4LceZ29x6hhnSYO
	u7g7S4mWz+7AVzr8ffWfGlLqmwwSbZjyHQuosD5fgfEGn+bTD11d7E8QQ/o3KI5n
	NB3ZJebwsi7GSYNA0aRGmSuR0emoZ4GXTvB3lahe9bJ192bC75gKLtpFK68ivodd
	o++Qs+GexfZMcacEu3JnMV4CIebit1pYaui0judywSnMRu6DYSJv9n3vY8tg2Sae
	byiXnqXIR2QcYJVZurzj8a/kHE0l8Ug8hpryf4l2a71O7fCPKEn1WDrxWUqc883T
	As38xQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabjrxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:07:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so967866d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792570026; x=1793174826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
        b=Dbed3YSUsOsde+b26ZkuvlXrUqVe9wqvw/2pafB51IGGl/JxdXiH9qSBP73EFYRGNs
         NbOOsbGJcNB9wUqBNThytp0xJJOLJLtHVzf3iBK9gAZJSgI3/oDLtsK/nby3/7FJlS9v
         hffhn4GspvtC185St2XQyvTwkiDnXepoEomueOjqc8xd1GiMc24Agzz3atjARzsBsQJg
         Zmuzsv5ih46LCe5UYCPdsmrynID+Ey24t8q9xuFQta8h44Pa0xG3j968trSHcINBQxuc
         5bt0L5OMDAD0DoHgb5x2PPouBPnkix+WbL2x+u4IqOKPPImmiq4rOfkUcRVrs/wAwUwM
         elog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792570026; x=1793174826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
        b=y/RxHeXuNZZChG7T501Q0rO4bOvY6r85BgQbVGKs6S7Z+9eywhxrx4J9zApXeEJV/L
         hwQG59bWzRlYyjmYVPYvMjRQC27lndFaOZZHJYu4oIzU1vdENKK8bbFih3tfBTsIJqID
         DwZCGQMeVI8S4sM6X56MtIEfxUaZMq9coN1QkYXIiymNxFWXOgRluNyvK5mjeML9kWai
         Eh0F48BTU5UIu+qhYco6L+XrR3zTItQFPnLth/MiprttumTxe2XJgOmn3uVjzZwEfELV
         UBWCzv+QESCd9c5N2DeIPpqnIyrBV9OwMZztHTDdzwBZDLCW0aAEKDJIjEE/roid5TR4
         rKZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwICIZJtHG0MD7mmqgeH3A2D5BewLlo0fNvMLliGq0atCE3Vh2ZjKZVSFWxoz3KnRl7Xiddfe5COVg5LkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKXwPETusbhuMnm3AZF5A+8TKzEx8HUuEx6uH4mFReD8SPgkM+
	53Upvg4hHND4U3mH9m/7Lgb3CUoYyIwzaZF5XIOMqW2li+poWZ9TSKGyO9UpwJ3aArrZi7F9hoY
	lhRMfVFDAWaCIMWbLBT3G1sY7ZjCeTDqKLZWIo/3sxKj3O78eskWeE0cmBAVH5iEzvgg=
X-Gm-Gg: AYBFou2TpNOq9SS3uQ8QY2POmSIPNHqOPie0mqoODNY9K2Qm3Ybvv7BMlXX1qvwhXWE
	PE3Mt8CG8g+89COH31Tic4GxkBqjy2KsLDLItXSDcOCTbYffOAdBkgKcx6XyCQvoTTp3zgYtKj3
	IfW2RLuDaAp/eUECGchdU5JFzU53I3rUtXJ7LEgSr1tis33QdlaQvYaD7TEWyRir+utGo2URGEJ
	ErG+IeoQSJpA5oQNg4NnUJz5JkTW+VCTfdkL2qSyYwOZRMERYygk6Hxr50g+0cFjVq7vxQCqqXG
	s0rJ+QakHb8/Xz46s4y+w8YFUjjsyugDGVzxlVqkF34C/VRYQFFhF/JHlqKyV/6dRrX0WNMkbsF
	GSFFj+7iTGRqQ67ar4erL7w==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr360714885a.1.1792570025866;
        Wed, 21 Oct 2026 01:07:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr360710785a.1.1792570025342;
        Wed, 21 Oct 2026 01:07:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fd5edbsm48905266b.56.2026.10.21.01.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:07:04 -0700 (PDT)
Message-ID: <c5901e68-67c7-4118-8d24-91e6881cb0fb@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:07:02 +0200
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: ipq5332: add support to get
 watchdog bootstatus from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
 <20261019-imem_restart_reason-v3-3-e6b1ff5de841@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-imem_restart_reason-v3-3-e6b1ff5de841@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX9PMGn6G3SXjf
 Q5D95aGN/WRIFw48O6leiFnPt+yUsJev97tMdiYWwOXDV6NkttO1Jb+sjUQY0ochAZvHbQa7iTZ
 cnLjgCKn5eCUcok7qnTYug6hX5Xb/KU=
X-Proofpoint-ORIG-GUID: _b4lrY0iQ_drOxNPMdka0HRlrEqttEcD
X-Proofpoint-GUID: _b4lrY0iQ_drOxNPMdka0HRlrEqttEcD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX5sWEZaCe18Mo
 /u53lOP+rDloATurdIPlOSHEiKTSeNNNQui4iEnTDU7E2HMn147Q0pDg487wEHekDXOSbAfpcNF
 DUtm+ofvdlBbzZN+BzMpKzMNdMaay+5/HaMeTq4AAQ7E7swaAWhVe7cAakaXjByhpvpFqiYiZOK
 0q8UM9R3AMsC7K9A74S1xioN60uI83NzALEEU2CoZAJWmXHAyx1h8bt/rMY2rQSwagnGs9vPl6i
 /Ydj1tgHSNCgJThOnDw5sdrrjbl1LAEPn6dJFkE8c6OiMZKQvMxji473vjv1agsTRNBwuBaDmi2
 g2yhvxm6u42vKhFOCvDkutdwuypcuNI8g73NcLpNTywo7bJIJVqDPN6mw7EHPZdw4pFHZYW0oEa
 xm50jgkYSLZgLLG3PSZNCtTEAUF+Wui6+szXLcjTvgsBjb5DKzV/eFeyZi/uFbcN5QcGsyArCzb
 Nv7j0dL/0IIcw/LM5OQ==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad872aa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=V2dyZ2dXe6VeIo8NBxQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210032

On 10/19/26 6:46 PM, Kathiravan Thirumoorthy wrote:
> Add the "sram" property to the watchdog device node to enable
> retrieval of the system restart reason from IMEM, populated by XBL.
> Parse this information in the watchdog driver and update the bootstatus
> sysFS if the restart was triggered by a watchdog timeout.
> 
> To achieve this, add the IMEM node. The overall IMEM region is 32KB but
> only initial 4KB is accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
