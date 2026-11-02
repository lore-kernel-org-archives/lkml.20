Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618197;
	b=m/3KHMUccVMhod+eMXKthDwBBle/JHuwsDXT+8bhjW1Dm+36TeTidU8TYlmsmdZOcJ4y
	 clUsK1YPzV9CmIm8atZ+MEhTd8aY5bYUQL16cNOWmRQ8zJwgWj4fZuCc03aTiojvXvwIl
	 B7P2OQumMYrH/INaz1roRUFWKDRi5B0ZbS60gDKZQdOx+RH8zUyH6/lsU76IYlSPbA5hS
	 oLcs1v6tPEKYyQCZTyGLYErWlnyZorsv/yzmCvSZ2XliRu7cPJuxA0/zd69rh7BGF8fIg
	 S9LvMfhxiVIVKqUsuuqRlq5UUsMxyzK4LUGb5yHIVkIsByZRQ51zATcRN2ZhpWxxrkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M8NNYeoqY3f0iLF0uVCsWM1ZsSvLIKqA637hrJnqz3I=;
	b=oiT3wjiUv++lZu2kVBh9YDhPeggE1E57tJDu1P8Ay9YHh4fFW4f6uZ2b1Cy/pBXvF2CV
	 pkE16oklqd8sQ5MPDyYNJ0IvIRG8eBV0ezhAAYWavwjmUZsAEKa7bs4Y6TKMW+tPhUmdH
	 CjtCa0pOQfb92tsg3/iztSMhK6sEu6JnBwzAddwQXj1P+P8eA9A0xVswYlddPLcGAEv2r
	 L7rbd0pJZ5oCIfO2yet8q56d81ZtKZgna2dz+2uDyMgfyoLFC+7oGNFjXu9RmHpwUVeri
	 0SGsrpTCbz+UZqGCPjzxWLvQhslcSZh3f7sGrycpWCRX+Oy/9YoG634KV6PAWzlOcXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VfB6cH48;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j0VeBNiH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4242D606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4242D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VfB6cH48;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j0VeBNiH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2sn2076854
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8NNYeoqY3f0iLF0uVCsWM1ZsSvLIKqA637hrJnqz3I=; b=VfB6cH48K3B5IvTq
	+XRFUyPBDigK0aptjzC3ndp5eKTujZRVXxpHBmzVdXDV7iV3w3p6US018rzwyx6m
	YPMF5XfXSWyvTn26lz3MhKKomDUJDxNF7Q2cu+Neu5+EozAaf+xLzi9cj7k62/GQ
	78uGHXGcWEEH1K+mlWPMipRHFLPjKxJt0UqAPSoJzAXCnCdQy4ugBT6xVcHi6vll
	rafoBkIWq+Qjt6hkYiGCW1C/kXzuuhPHXNqguuW0/IvhrDybSFQSS3LsYWOaclOT
	JubDL+JqFisvDri7ANHRxq6EJjrcxzDD7LyDEqZAR/1YnMBg3FaSNJyHO+baHirT
	bxWG6g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6r1qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:16:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ca23ede8fso7049156d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618195; x=1794222995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8NNYeoqY3f0iLF0uVCsWM1ZsSvLIKqA637hrJnqz3I=;
        b=j0VeBNiH0+AQD1RUHDfeSsckPeIOwoNCKhBPhFBngy5h8emBy2h6g4PW8CdWIV0L0L
         b2NW30oC6JoLDCZa75dDD/iSkRtWa1C3BT4i3STAJ+6+ZZv6Sw3R72Nkss9LpiYThrGu
         NjY1k5NoGfXJAMovCuwcUdjhqGfYNIzt0QMBJVPsybjF3joFps1jVRmASRgsGnVrbCyZ
         YbEcosGdiZzOeaTqdgs8pueAWCZoX9NU4h1hujmirS5xAz7skgnuocS3ZAbQcaoMldPQ
         t/pmWJh9xYcUua+AqUX+fwobckMCWNOTrPONUlD31czdFt+JNGuakHCvXFi4xaChriuW
         x5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618195; x=1794222995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8NNYeoqY3f0iLF0uVCsWM1ZsSvLIKqA637hrJnqz3I=;
        b=SOJKMYIsqzg5pNgiGoSrJ9HeiRADiccRjMHznGxiVphrfmV4p77koX9auVTcYYbow0
         HiVXndBcRK7MNejsIVS4p9IGQwx0g1UmIriMKlPLByUJ+CaIIRD4X2u5zyRKVmL/LBO8
         e2AfQb6qEQB7u1NktRncJ3JTUsgidI+3UodFqueR6hxY0eU/Da73/yKNnILQITnRDMmf
         Lj1v+DIvOKkj1f3dXg8DjI6oP6YVVM6HfyQhyNgdf2vppFkRCTNHNng9iP/JMIoSJtjd
         DBd6v3yd1g0AZmDvNmyz+t/XC+o+tM39F5PxI6TMiO16qjX1RIkut1tUesybcMUr8rWl
         tIFw==
X-Forwarded-Encrypted: i=1; AKwUvBzbjRa7sz9q9piKzPnCj4vsi6x5TYTPQRwMplImFqAqWBzq3eZRO/ltR6slhs03CcDuUPETpqDEne3Bg6o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJL7RMlIeC9O1othlr2RQZeTMd4cXghWi/WCzeJksfgzZKfbSVd
	7OngGcakvVVjBz3kWrg9OqqzWP9NMevUVYNy9c2C4Eat5WIUjkRdBLTshb4jzg6nRiLA2wVEMuq
	N3sL6wuClJGqWWaNkhnujvFCIss7Y4/QTKOgnSFxnkITrl1NsEXdWOCqPsjKsDSeCSJs=
X-Gm-Gg: AYBFou3RT/Ql9mlGW1TMr73KxxEmX6jiP83053FMR6W0w+Uoz+iM5RYBOdyUm1yLR8r
	O2waRNJxaMDI15GLBOl3q5u3K0LYE7aUWyrvSxdOvdgjh/DRacEusNxIFlA2XXkT7+qbfahN44+
	45t5RQgGEu5QIc5TYwkqozCrxbIdwm71ykz9cvWCsrvj7nbqsx5PvzHR4FEhKPoSWpWbQ9UIXjX
	DVlTh2XL1ZEMBhcPvNUWc56VJxojSF9CfKXhpvMDeENAtYVu9FBBY9W/8if5pcN7ZPr8kXER4Ft
	KmFsSWm3Yjz9cKRf7Htwpn6RFlrHc+5oR4efsSjyugR99TOcPHeZ2scW6EJhbmWT4Sd8y6KwCIe
	0X02nv+NIUR/amn0XVeYBhYuwSOa8fFo8Dy/bKcjU0SPac473ci//m/dzDRvMpE2fX+h8Zxg=
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr1581226785a.2.1793618194560;
        Mon, 02 Nov 2026 03:16:34 -0800 (PST)
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr1581221885a.2.1793618194032;
        Mon, 02 Nov 2026 03:16:34 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9a8908sm3146238a12.1.2026.11.02.03.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:16:33 -0800 (PST)
Message-ID: <b6c9ec8b-6169-4080-ab50-8c3a2e81b98b@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:16:30 +0100
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
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: milos: consolidate IPA
 properties
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfXyfqC4II0lbik
 BkVjxmvwero1kaOcUzVnPIdwTThN0I0m7q6/jLXtKf7Ea5jzhW0bVt/8A89m2FHC9FJhFfpMM2J
 n65puMtFdXCQZVc4GDCbtZIT/S8jHY6m40iSLTw+MT5nG5KaioCCVhFGl8vU4G/QNNlMvZKNr0E
 riREElxC2fTkWSzywpwr/ZEF8/WMAndOH6aMKpoQkhwqL20g4POi7jGJNIsHRhOfP/d85xA52cx
 i0T7XDIvtfTR0zUJaVvw4WJAtwHFWjG72jdsqkjL4v9CGKkVa9zpJP9ZP+nmizvd20xuoy9AJuO
 9KBuTrivPbSzYLqIUGslFOEop/eMAGgqn5HTNd8xZmhAGKMGiuYVEBK0o6ESlLHNbiHn56E+DYG
 Bl54MW5HzXENdCLWP3WMXuyd4pco/E9GwQ0E8F8/LL3yDHaPluObFMMpiWO49SaFHThZEHGr3FG
 OLQCgs5L5M2g3rGR9mQ==
X-Proofpoint-GUID: UoQes-J8b2Bzld2HUFpX0UzEDa0b5JvE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX4mZlBYQZw4aj
 kFcpUjm5bHYmXUNXptWQeIj3h5aSnRiffMfpFVh2eNVM5+Uu58ZEyrURUvhZ0W/MfjyooB4yGtR
 8z8d0h5jyE6eusg3kNsRaEKCX6o3PDA=
X-Proofpoint-ORIG-GUID: UoQes-J8b2Bzld2HUFpX0UzEDa0b5JvE
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae87113 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4a6cFKT3k8WqcdDSgRAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020043

On 10/30/26 11:41 PM, Alexander Koskovich wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
