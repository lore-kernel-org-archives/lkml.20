Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764122;
	b=TfzM2Tsn6WK2Pz0348mjiwy86V+yD5jYOj1Z3cedDHzS7RRpHKnCoIwyJQdFWO7WHpao
	 L/eBJY4gbuhpdlDmNrBFvK4xWgDGwDNKMcvBlawRSBk6puHP/uIjw5TUa/IDMW8P5nOdd
	 hGVpl2j9QGapOa9OuB465LXXDDlBQmDHJ9B5MjgTAq5TnTSK1xsI0+8amewq3vnLSf6ZU
	 eWlhAyGKXAa8urVbNWHBQ8xMtRIsnxhrA1oUhlHqANieGeCMRkJFEcpAYyxqOPT4gPSAO
	 EUAOBvqVmnC/J0XeT9y5pXqd5MCR9Ew7KNjkbw+rF+kkudD76VAx+RFzQgDnST2Y+1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=;
	b=D+5E8CzBtmp5pBSV+1KhmtDVm4LExvf210wdZfmw00RnWz+A/0i48T3tLCvMqk54IJMj
	 eg3N9p1m9VUBY48+SVfxGU4jI5+UOq3qQDR9pbZ0NR7eqh4AYKEd4WNWurqdjoOeOyK9M
	 d71vSa/p/3dVlIiEM4mgwbfbiCSOxhRp7ZHEMwx44O7NPpFUCzKWl94mMtsvcunbVPey1
	 5GBzYt4AMx5PYecmKbOkwhAkgoToZXslC080hiX/GUMOHaaQXpHrr7Yp8nyfGVzci7Whl
	 qPtoaHYAsMXhluWkq0VHBqnKsikmJ/75wwd/oA+084LUjmbOphxUEmctxOu8g457yTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6nvKYPh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhLjwkIF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1EE606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE1EE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6nvKYPh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhLjwkIF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAVm82164269
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=; b=V6nvKYPhgn3BRCsH
	D+C4GKviWCHFhHRvrWqZbfTSyoaccLWj0wcjxpS6eOQ12bl7O0A5goNu3khwVj+U
	lYgBlX2I2XYnRSiUAtxrh7qB35vyAKAtWAiX0BZHJMzb7fe1kCZWzzPLRJt+XQhN
	4v8CZjjjHh1R3AsC1hhI+YzGrYDtZFuUToIRyZqSpiL/6xonmm1c7K828ozce/Nc
	w1fTshVF/33gH1E9kjj6AIymOINqWv/9syM/Ss0Wy3kkH3KxYtdj0w0AKLQ0MR1N
	sHj1IVLK4RbYwa/IJrl7YkqZdaWLci4hNqJ6S35glWV2op8uiaFoI5pdVa7sq0SW
	yqEMDQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahvdvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:02:00 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f957990edaso258031b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792764120; x=1793368920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=;
        b=fhLjwkIFx861UZ6dl9umO8DVjLgZwxtS9LtftenNVsb9DkxSEskUKuqy2v4A+/WTps
         2AhQZSDaYXIODhMVc/0YcfQfWOCTHlteIFMstF+KHDeIBqYlKngb3QfvWIrwy7DTEW4M
         youil/+WGNyIO8tX5nJ08OmLedC0e6JMmjdDxDa1jNDVyDfCx5QECgdFaoZBijAkDBSq
         scdTARabAl69AqCQ4FXFEwieZKV2NdNM8mt//OdsUM6KRbgBTuHw0WR1GbZum73G+DGe
         MDQ5Pgbnms2AHuIcY0Tyzv/FdLM4m8Yhw55af7uSv0lrxd0qpW653KSzqkzMwyFaxS+3
         Dokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764120; x=1793368920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=;
        b=xUjrIFOTwYEWsHJrOXygP47WAUsjH147C6fr0oUvTRPqhzdSglKukoR+t+fgW9hp/C
         /L2k/kNQpZkohWb5XZv+zP/8vOHoQ+NgDPa381M2vNGiD+ZhT3ScJ1pQ5Kpk5WDkbLJh
         0JzNRNNMH5T9KmntSqj6o3qyb2lS7XzEOcQ4UDJpE/3/ghVZbY/LWMMuDL4KL5nGaM4D
         KHHBYihNrYPciOjtNQ2HIvOXIAKBBub8T7Ai5puXQXWQCFxdSPPY5V4OwU5x3WKT8xIS
         WntPnWvh2+LcePDz4OSOSoHMrndjUtemFvLpcM5IuJb4AWpYW36Eu1iDO4z1/XpCajPy
         tKRg==
X-Forwarded-Encrypted: i=1; AKwUvBxmrcE2gKg6uwzAbZN3n2utsg1lXnhZA588gbCrwu7A7J9Fzw0oQ2gMJLI8YWrvO6k06x3uN8KIyu5FrTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZA4egzoNlLyaeG1q4NXELVMH/gwYliu3JHpZGBEhOThewb417
	9blacm6TmBx8lMZZw+jqaw1upITI+D0tORDn87OSJCi/DHirvMYZab9gc8nZ0JKnT1wiARVg6FX
	/PosGYlslPnSEW0XOxPkCfVcu0f4Ro5VIM6+mHJmoXy67iMCxo4Y6GXikIBFDLx5lkx4=
X-Gm-Gg: AYBFou2fJpoPbbD7DmjK1vSYXLHdTZotT6BSESe/2UIhRUj7gQ78p/n+CqKynRVTk6o
	VnwtqtCoD0kt8lT73kT/iQ7X96DGIKWraV7nY43X0GRxPi3N0+w0HWOkcO3CBmeZ1qCt8kk4hE/
	hBatl4jTz3SsPTT9vsLw/jqF3tCAk1Qaf7JBR0uVZesI6GstZrL73MvZzU8pS90Q6o5st/yYfGr
	vDdozhcU3pDa0tPauEJRj/NiOCCdbP9+3D8gsx018Dq/lhSIfBpZ8o6Qx1sPzOaiwDo+6et6IF1
	TkWbhQS0zPA7uZjah0InEPMyggtx8PjYv76k23LhSkWreSURLflQbsWbDr5BIb0W/9SJmca2mMK
	kam3BMU93b4drDxvWhqW3dA==
X-Received: by 2002:a05:6808:1386:b0:4e8:b729:3ebe with SMTP id 5614622812f47-55bf88f8b08mr793506b6e.4.1792764119692;
        Fri, 23 Oct 2026 07:01:59 -0700 (PDT)
X-Received: by 2002:a05:6808:1386:b0:4e8:b729:3ebe with SMTP id 5614622812f47-55bf88f8b08mr793350b6e.4.1792764118501;
        Fri, 23 Oct 2026 07:01:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8da9019sm3783766b.78.2026.10.23.07.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:01:57 -0700 (PDT)
Message-ID: <071fef59-9131-42b8-941f-d7fbf5f57ba1@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:01:54 +0200
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
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: ipq5018: enable the PRNG by
 default
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <cover.1792761470.git.me@andrei-z.com>
 <8a595ee4a7facd53a25f51790500a642c78c2e59.1792761470.git.me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8a595ee4a7facd53a25f51790500a642c78c2e59.1792761470.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX/WmJOYOpIYZv
 cj61ZUfB1A9miNlMy6qU2ARlXpgvmAPb5B7koBKw0bFOIvuUs3WXCPM53NdXWQRBxdd9osV31x3
 +AisrXUCP5KZKeyY9F1L6ZvlbcsF7Y8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX9wNu6dVLFGKb
 6SehTfzk2/dR1rAkUBWqvAn2EuK2//Y9M3zgxN0poHW8NxF2RhDVqx5RuFIky53ZcFzTGQeLD5d
 PRaU5tQDNSHy5lirhgPp6NLjPAalr8npiG3oM+cOUe+BA+XUtGPkRuL3uGs/qEh92pWqV5fPk01
 5Qn4pb98hhPzvpScf3mnz12hXehio+U7bMtamc5zR7AZjRmpnwRUIU0ZEYIOnJsKGsSinK4c2oZ
 sauZ1aTUX56+3Ipio/tRqeBnMNrS5ul6KyZUA4xveviML5u7bY63GFfJVwGw+8zisNSFaO3Yx3n
 jd+cMgu0fd/ea60RB1ByGsuQGTq5/jQM6tH/AinoZSP6rEtNd0m1VT87Tljyc2Ja3AwGmBHlJsZ
 eqNjH3/6cq8Kpwk/SlULCmRdL6G6HwlWsPc3aAlu9W+BZhn1iwyJiefwscol7o3PcFwhZ0TSYUJ
 cdewdiCJBFIOCvgInZQ==
X-Proofpoint-GUID: fYGAba6SSjUT_W0w6nsYhi2Hvj2o2j_Q
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb68d8 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=J72pobsmAAAA:8 a=EUspDBNiAAAA:8 a=pjGKqCRHFsEXOSBd6YcA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=CEj32ImPKXYnrW9rpEIO:22
X-Proofpoint-ORIG-GUID: fYGAba6SSjUT_W0w6nsYhi2Hvj2o2j_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054

On 10/23/26 3:36 PM, Andrei-Alexandru Bleortu wrote:
> The PRNG needs nothing from the board: its only resource is a GCC clock,
> and no IPQ5018 board has a reason to switch it off. Enable it in the SoC
> dtsi, as ipq5332 and ipq9574 do, rather than in every board file.
> 
> Assisted-by: LLM
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
