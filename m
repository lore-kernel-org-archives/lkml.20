Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557550;
	b=rNlo3fb4TQ4m4sHQSA6U9CJ1LmOm0wl3ordrBWlRMxfIR9EnC0AsXQUVgNOvI7q8hhY6
	 MggLykM6qOrjC6Vcdbkbxub6HQbJmaLYgtZ3IUPCRshOVK7IDgYvjnoflwnCB3WfgsSz4
	 bBjnN+Vz+PrYFZdmnc1p3GSv/MPA0YFkYIcA2335hmckREYmRKob41uktiMBQ/5IQNOiK
	 j1JsffHvwqIVT/gsSsQZLHpY9uK19rvin/AXXr0rzMOscYYxGyWEKqmnpZkCegtcanktr
	 yEg+I9c8y7oJO2pq4DmVYNj0b0RF7KNnhFsoKMct8wkWNsL7sDzrGFhVmQt26XC7Zlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yZnFjQJx3sTnKbIEHL+q7YpvIjJRoUyfbTVk26tE5gM=;
	b=SocoxXdEykJYVMsbq2WOeth9G5fCDUg7j0nI3+t7v7+JZ6R0WguWl8mypsRxOBKz5CY/
	 ExEt+f557AyMy3G1Tyn3B9FhEEYaA/8hqZdNfVZp2Yud/zHtMLSeJoWnKjbmUjmzKue4R
	 c8Xo4Ve7IeEvrZ74BGN2rcQ+bL6Gw5dVsRUzHQrLSNk4MzQcVIEB5QIAAW8sS1kj5i46F
	 kz/RbkGRIJtmTZAfTqdKUb+/tJeXO0KgLsDGqx9uQLlyPtZ0mb89Q8ol3ehe/BXULrYHg
	 2yMi0W3Qs+ID49z2EFK45hE2WBnYR1G7gJm5M2DMsoyeSBPOYMyLOHMzI+EHWflpnMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ViMJ41Fe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOFzVT4+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B2C606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B2C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ViMJ41Fe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOFzVT4+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5akPm3147309
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZnFjQJx3sTnKbIEHL+q7YpvIjJRoUyfbTVk26tE5gM=; b=ViMJ41FeS78SGe/0
	E4ovvj0v/cC9Is8rJ52wY32sp7eo2LlUUKrtHm23+B1R7/0w6tdI84vAi1aBlu2D
	+AED2WpkjVZcQbWkEvlzipv/iwA7NAuZ1Sj4Tsy8suguFUrUgog8ubD3ObujsIdu
	5yLLUfl9mOZWal7m2u/760J5hO9YIkScltBg9+s3teWhbDqv7LlBIL+F/23dMqpg
	yczAG861+OpViXTpn+mMpR0YVFgNyUPtk1D14wkd/Fib6bhnYXfQokzMzjQ/QhYw
	cdu2kCZvLbV8bAsZskRQwD954jUBeyrKS66xo6IVagUwSmU0v7sMqWwFNZmzEIMF
	M2V4YA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja8g8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:12:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so19363685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794557548; x=1795162348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZnFjQJx3sTnKbIEHL+q7YpvIjJRoUyfbTVk26tE5gM=;
        b=gOFzVT4+wyHipGT85SdnE7Q5ptjGpFD+d7j/bxO9+mwDQ9OEIsQNWJrjM1QxdD+8KF
         A+og4fg7ru643Mm2SrNzvO1FQnVy54gw+1N8fJG0aX1Fa1KT/fWI8ieH9BQkkgCRKc3q
         MAurVDBxE1layqFWyAIDcDMxSnyVoLcmWedKS69CCehfGfQh0DPs/+lqhy/WnBn0etnZ
         LEKD+m16ZhZdhPXKZNuYm/OEqGaRCM3jFN8WmKTc28yLllpGo6TRlBj5QlIJ+/un2duS
         j45IyG0WsT9tSGNvCijs76cjbEiM2V9EX8FvKiyJ7/qEwHa4IihEHwbM1MG/7ophNPvr
         MGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557548; x=1795162348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZnFjQJx3sTnKbIEHL+q7YpvIjJRoUyfbTVk26tE5gM=;
        b=z4CirkjLv2lH1asOC9Pg4RW6tTnyLQnukNJkglUUhnMYg0oFg3oBiz3KwutKSFtMpJ
         oMaV2fSOZxgIdmIL3zRSJXcF7EloKJiU/Zzgri+NIHJuL495Kfnzi+CFLMwF+A4onRYB
         989Wp6mvfdwPkniIBkmK9phyvTgBquCyKlqW2YM7OUIAmJ3Op1Dd2Rf8nA1rWyG4wIoF
         ixqY0EG/N+zRe6l0FDqG5DMPPmZdOQNNkx1y6euBZeqmBwzUyhcAFiCg8/VEr/ECaIDx
         qbM24E7nibFxpiGaJWCNWQzdpeUhA0ALUaK/D2Nf9ilFaOwmBPkpOurXH5A/jfpQ1LDV
         dfgA==
X-Forwarded-Encrypted: i=1; AL+hErE6kti4rx+R52quFTRxs1Ha4HNLsdYAOM0p/5A37HZekCpVNLf0Kofn2x4NnBhZBKUVd2+7wwkKSn4nX2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bIw3hu42WYQJEAOALUvsCRLsMdANo/FsiGrabe9dsVORFsUN/
	HU0lQJ190gp12vipSZKmeRBUXEGrYbTM8DCnzBXG3463qkEM4UkDxGShfWsriT9fVBRjUYwrpTm
	C/f9K+JFi054SCGedMCuXUQ1W94xOMC13f+bowbqtwTf7V3/ezYoXnluK5s+nuZqzzqk=
X-Gm-Gg: AYBFou2wIk5rjil2fsoOJnBkRy5K3FCWayn/hRX67w7CWdgWZ+wuGUhmUxa9EAXfTkz
	0UUIN4N/9gmSM/KKaNl02h2HmbECkbKV1QfMlrapmeL3djQfPBgmWTHHEF8WUDntPKEGBbOCvD2
	AHxww48RtrMv5GfOdLqC0KfnfsjVUamhadluKU3Rs1pC7yeNPzbjWAAiS3qFrIUFeE4UgHnPXd4
	z2Ek2rRGCIY6t5P4HWxY9+CIeCqr5IWGClFcAB2uiBgeObvnndmRDV3BLzZNEso0Yd7WZDazR8s
	bYlpxpi9CkKwZ9wz4PzqDPr5cRzgJ2nc+2HHOyEOZ8O7wYiEGZYVDiClWTC6FPsmQkpTmq31PRv
	igxlo0XIAAOYCZWS0KPe+uaw49NU/kAArPH+h1ZtS9v2FhsSZ/TwRVucCRcTGUkQArj+PrUk=
X-Received: by 2002:a05:620a:818a:b0:945:ede4:d247 with SMTP id af79cd13be357-9494b9e03ecmr288682785a.1.1794557548087;
        Fri, 13 Nov 2026 00:12:28 -0800 (PST)
X-Received: by 2002:a05:620a:818a:b0:945:ede4:d247 with SMTP id af79cd13be357-9494b9e03ecmr288680685a.1.1794557547702;
        Fri, 13 Nov 2026 00:12:27 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23db711sm629005a12.24.2026.11.13.00.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:12:26 -0800 (PST)
Message-ID: <11036baa-7dee-45d8-9319-311288ca267d@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:12:24 +0100
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
Subject: Re: [PATCH 0/2] soc: qcom: Add SoC ID for SM7550
To: Aditya Choudhury <mail@inferno0230.in>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wq_dEYX-0Nx4NGJAkSzQcdUpX2gxQmND
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX2OJ4Dxp2vuCB
 dJyrBlfEhmIQ3KLVgjYeqK/zkaxsvv5MoeRQibB5EqjK3yaCzvA8sVsrK36nVDLaS7+LNAvw9MU
 NVAwAbIo+YgtGvLoy0uzyuhNzKiaDBg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX+FXQfdgWw8Ra
 cLrZMNtVREZowZxvatD7NoWqv/ZTqMSOYhFOVLINnBiNVS/jiuiBDSnWQqi3DM11mzCPoPbZ1wa
 hnMvPqmP6aHS9lCEO8/pikRiSYTNePRv885NEGQ7aHZqkVac7oS1RKg+v/i7P1eT5fNIfafbbXK
 50Ajb6nJkrTcT/7t76ukgGuoZns8VrPd+1D4iU7s65YaVUr2PJEZjG8KoR29Idbz8MbS0KyenE4
 4XIBnk/85X4SgPc3t1fzA5ENSz9T1DNza+1qQSN8TCQYg3DZKX9OiuzD3Mb3PG0QGAC4CT1NuyE
 sPZBRl47M9DXS8YTPS3MXL0frW/s/S4Y56FBoG9yOKhSkXF5Lw5Ku02d/rQOFfzTe31Z4zsAK+R
 nLHY8iutZxRohRcUTklP0QcYkEU0hhUGofp50hdc0I7UeV/bNtWY0asUk7c/S+WVsSZGahIB1dZ
 W/uSU+z1wwPRxo4sq2A==
X-Proofpoint-ORIG-GUID: wq_dEYX-0Nx4NGJAkSzQcdUpX2gxQmND
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6c66d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=E87KaQfuVDw1DwplJSQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130032

On 11/12/26 11:30 AM, Aditya Choudhury wrote:
> Add the SoC ID for the Qualcomm SM7550 (codename "crow" in downstream) to the
> dt-bindings header and the socinfo table.

Please use the real codename of Camano for the following
submissions

Konrad
