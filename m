Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620678;
	b=KC8atzVklsIVFJNshBwD8FmviQLi4sPyCjdem5Jk1cXaLywcjuXSvh7c02ZPAVR0Z8B5
	 k1gLJw5Le5UTDMzcWk1XNHyRPZXKtJ3S/VoPUBZZ4K812zVykYOOQadOeAD/YZAKi2wOt
	 xSVSqcCLs6PMovIRkauf0N78pZwfmpICCFpExLdeO89HenR/tMokUT+wBJnwpfihIOheG
	 w0m0KEMwxAvdejdRUb0/XmxnsJ2/NIoNiFS3+oeAGnkMBLFCbpeu8DstEKm5QLYJnGwiH
	 VV4Al55pwJbscHVWZG9J8ZURvP5oOOKD7onuU82Hkk3qTAWqtggYA/Yb4rkwcYpHW6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XNKwtLEPoAerLUKfTmxvN50PoLCkeJCmqkuTSnSA9VA=;
	b=2K/8FuGWV51Ah1CkzFEpPtpFq8xa0WN+00fsR00m+PelrKtHg/U/w9lvMT26csdLqwKz
	 edptFLO0kAJahk5TaEpRieyN0++ENzUYioLs06xg0LiULs2Zj3eSwpM9YQZ1d/X3YwFBr
	 cUwfciWfqa1spW5uwR60bkYTenLxQInRqsZhUPTviP3nwXebuPjVUbeAyANm5B9LRrNPH
	 Pg5VB9+hRskmiWFuocE6ejXKBoy0h5zutaMN5rCw8kxcdY2Y8FyJD4zCH8tnCslQ537MA
	 RqyZiXkp8Pf37jm/pwIR5uS5tp8+PVYNcQ1w97L0MIRV2D19Sn44THc5s3zVG0F9pCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxZGtLJP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgcyOFPO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63E3606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63E3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxZGtLJP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgcyOFPO
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2sSB076868
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNKwtLEPoAerLUKfTmxvN50PoLCkeJCmqkuTSnSA9VA=; b=PxZGtLJPRS29HD5g
	tHiiDT7NNNUhHpl19C8IpEfL04YWROryX+LiXAbzSklVMNmiKA7WmeBxF0mwaiz3
	yLmeds68Ki/2bl7MXu7CB0ufsF+BCAhHYFXwzGpauL9QpjFhwWwKs3CalDaBPGP9
	HRfVOIEjyIelDGcGkTKHNKa0RQr5PnRjIVFpAsV7VdmMJcihhlC9gL/xLNm7Ax/D
	pynLKrb0zNUyGET23tDaXogLz99WpdjJVOpuMEHy738NO4BUmsEbeUaoGkqReCKh
	ToCWHO9Dmrk2q5/2TFNh2p0e8EZ7SVmjyomWstG2PZ5LeZ+6dN6U/esbHycSVA7V
	AefRAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6r5m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:57:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso49144685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620676; x=1794225476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNKwtLEPoAerLUKfTmxvN50PoLCkeJCmqkuTSnSA9VA=;
        b=WgcyOFPOzp9ejCC8snroS6beael6hMxQwTOUWv18WPqeHBaQAQXbQdyQmCcP9YlRIu
         +oueAGSbDn8fTM7BtiN6uoLlRymWvrxLsl6vrJL+lXpCJHO36nssn8w68XE5dljmyZ1s
         J3MNLrax2kkrT89FJZO78h3GALIz9jyk+9Ir9aCuxRpGpPZV9nPLVfPszNyhzp4N9JAm
         ccOjcJw2Cgl/RNblH6N5IhpsJhCyr5E5DKheShHbQMKZSSn6Uf7t99P7qe0uAFCpmN6S
         A/MLHUdhtiUlucZPid1wKCQz2YdDJECttlPR0dkMyAB2XHGL+xfC/vjvneb4AAxQrTGp
         F85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620676; x=1794225476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNKwtLEPoAerLUKfTmxvN50PoLCkeJCmqkuTSnSA9VA=;
        b=Uuql/vizILwHfBmDZxlhz2x1flbcPKm63NlMtbFy65lmDZhbLeDxPnsCFVfuXxVZVM
         87f1xoIoBsM06w+WZAFyXRcn+Y5xk1ENeRWx5RQ4+P9Ncxyhp8bIUYcmvx5/LZ6XvhCN
         HHkojk8hNY+r5DRrW9c+hKRkY6+Adg52xEvX0M+p1NcaqvgscWActpK1pvKCQDuTfx6T
         Y6XNxiVtl+SSHO0bmNXQlOLjG6teyPqcdfAOWJYzgyBV2Dpwz1x+mDN8TEOyjYow/UiI
         6g3Dh6blUroKAce/5Hr514mY5ieTGzJIjiqRfYcoHVyR775rf8IWpGXaHq7BY5uI0jaV
         0u8A==
X-Gm-Message-State: AFq9FYKhKVh+JmJcRzgh9eJR0pmeEWITOCEfa/Z2j4wmJ0zwWcBQZ1lb
	+1PsgzvhfkeXbhgviJ35B1j57XjqZEIMyC0dzQK4OnEYk3eyLEt6ruQ783MNV8vv+p1GG80qS+0
	kW/MkoGKOfWFHkTq+WW9yZ5T1CugutA58f+cb6UGjqiB51Mui04mU3lBkpvRR9vMKaiE=
X-Gm-Gg: AYBFou0wKwRj6/HPtf+QEORnbeN1wH5G4wjOZwEzBSxw5IoCw3qC2agnUcI2flEZfMN
	2mI44J+Bmaayv7oS7BMFROmSo8rmZMFNNg/bK7iMBnQt8FsIpFwn+3LOpieQ/sFE4hRGaYOuHVL
	JyoRXH//IgzW536tWtsORYIVE66LHqrS4XoKddQVPajF1X69as8hfPx2K9KUBvxZPYxWbMmjLhf
	wBnoTsYF+k1gKXsNvRDQW8mFeK+d6RJO69RdJ9dFao8+FcjGjFja2XTPdI0F6QodnQ6U757AtwR
	TcLUtqlVkq7yAVz0yF1npR60e9mZgjVIkrEZLtcaJf+AqUcHQf2xI0fPZSOR3hAibinm79wo9ar
	PuOFnEz9TLOgjeyTOZrRhwyg5Yl6/JDt4cVVXP93Ts9qZMOWFYozO307/xWXUzPHt03OSShk=
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr1761511285a.3.1793620676108;
        Mon, 02 Nov 2026 03:57:56 -0800 (PST)
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr1761506985a.3.1793620675652;
        Mon, 02 Nov 2026 03:57:55 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18e78sm387008666b.9.2026.11.02.03.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:57:54 -0800 (PST)
Message-ID: <2392949c-85f4-4cf7-aece-df3b9dc86cb4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:57:53 +0100
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
Subject: Re: [PATCH v3 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-2-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-2-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX7j0XcZ/I03MT
 VcdC5kAm5IW8glXGPqYkjTZAL96rSTArW0L9KzJCqQLr1uYVUsmjNqLGFMOb1fevxORf8xeacJK
 Hw1X2LEOkk6kuNX/i5uYVSKD84kFA8j5m3XugKv74mWX1nt3tPqWgne74V6v7uVl0onDRvF59W6
 p+9NZxpn8kwiI5pw39EuSVZQLaIEpb92SCGise+tfpKUmMCQh03JOp7YpYPFJFscJ6lGpmFNcTd
 T3yWmuJ9eQWIZJmVoASb/MOAJf/WrnZhGwivfkrPPzDj2Jiyer1DFF5RBmvv9D3uSI5z95rgXNV
 f5M08uAhY4Dff6Zz8k4MpHB3qbu6cynD/roTguGjdmSCJ7CARRyGBTuAGz0tiWdXerbE1IR+h/T
 yUVhVTVkZsQMN8Mc4x9Y+FThbtNuYU84cjm2NMhavUIOhoW2wG6IGHhACUnIyf7ccdPuCo5lkwz
 Y6fZq2dtLhHMQ4griLQ==
X-Proofpoint-GUID: d7Yl_HCf3Br0z6Dh2-rPfq5--y3z9RK_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXyDGCsCAQlSns
 oozSetM+w7IZn0JGvOcEOEUf8yxk7CvnZOJzTg6q45TUvs/0CqNdtEmLRLuRE6BdGn30HBQxT0j
 5M8Ln4DNv5KVEE7LkypHufLxpCoX3kI=
X-Proofpoint-ORIG-GUID: d7Yl_HCf3Br0z6Dh2-rPfq5--y3z9RK_
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae87ac4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=RC7kgf61jvLRIQ5xqpwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> rename touch-en-regulator -> regulator-touch-en, to
> keep any future fixed-regulator sorted together
> 
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
