Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893296;
	b=oL8MbeCjSqN41H595UGvqCIIms/Ihld+tHgaV0utFOv6pDJpPx53BfcYMngDggveR7tv
	 5mFiXH5RXkjbaHEWPyrvFvppV3QSykE06/ahfFXyG1IEkRtQ5/HWlhhZpP1X/2YM4mqVK
	 LlP/eJrBxMXkv72grHsgRujK4+LlPogYlZnWSNSAyxb3Q6cVZPbfwsJR089vw77gb73OF
	 YezfU1uFOCKAjgDFW0/2n5J51QROrzyuwOGAEZhqE33t54yq3s78fo/mEynk5rJ7OfXIn
	 8o01PAWtotrq1ypr49YvQTYylXrTztq6vdwnKc+9sffbQLDMkQSNXIYD1YkJV+928+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=;
	b=ITBtEcfETcgiUmtpB5546RHR+9E9QYfpHLadYWfju2BsGItcG8omZeOmzJ73sFMttX8O
	 Q2MeNXpRTXS6Y5XVPOE2V2QgxrCrpKlZsjT6jZrDwEfLRKvod/xiNw0M0Eery/8TZ27id
	 zK/I2EKOYfHKTF2z8OmrVR4ec6pEJc6jo2/OHLCfHQbgXwBgTFWzXldVRVNmBdSBWrf/i
	 a4pU2kyT7qbG6iOMlMaAUnDZKbXLUdiW4monzLpNsGV0m6f8s1AheUmdTXdetTaQ1ULDz
	 AqSmX3iDTSkR3yvd6YBc72F4WZ4T5QbI0OEeKeEbafKi1dqaM5U18dgzFBz17RF/ANA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV35Qm96;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdTZoXNu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969EE606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 969EE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV35Qm96;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdTZoXNu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQGSq2004538
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=; b=jV35Qm96buL+DzqX
	hU43ReF0gjg3i97yPfe5frMW6EEnCnbpofopePaMSCOyDaiJETNBGcM/+LtODIPl
	+zqdPxnfpyq+015Sf3rcAs90YMRq7Pz97dxSfgyVNnksKC0FElyd2ZGfaCb4cJcV
	qoFXb1qTBaDHymbGe1SA/rM8m1Dc17aXNmOVZxx9HvZRr7gxiK/pJfPQMa3qM5t7
	l8ljIil5whHILqlMlWkLO+U0KkXJoHFjiR4a3YxplPv+NmOlIIE7Kg+Lrai/1Ujt
	QZ6MUkx21fpMEIhA+lHBME0b+1ZLfdLg5jobMLAs+ZXqfGSr/h4HVhYtGkfpE/HS
	Crv+rA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd1dwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:41:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso20861285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793893289; x=1794498089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=;
        b=IdTZoXNu1NdxxD4uO/gPZPpW5dNNnXrHlBhOkXkSsB7w1dE+pOaZ1HI4rRje0o7Kms
         0oBxIgGBnGExbhB1Ck9e0IRTfcyc/mHiSUhIb85mNK0c7kPC/9i3cGSoh2ToQsevTwbH
         vh6Yjg2JSJQcLOGQlrqzh2F7PUShcfkjmzru+w9qiTEJlwvrqV/lr507E1uspyrTUxJi
         l4KF+cpGIKveQww5hWQ0RmfoKEWGnD5l1CprkzruttM2SoDChBJa4FwQgLpByuwvflJO
         YmLEX9X1sirM8YiIS8dy+zLP4GDNXi39n96h9S3Ejty93Dc078Bxr6kWMlKkmd8WVYVB
         THJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893289; x=1794498089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=;
        b=ipwGbytfM8uSniJBzG7zrpMtpf20EqTNPKX+Z/mdj9fqn78HvX+cALhu6Aal6Z3ESV
         58HTb6MnXt/2tibZ8d2zofmKo2o4J1nBWN5/Y3gwn+h2hbyM63L7OsPnGrFYp/H83pT0
         rmjBATDOJmElr5RPZrswd4Ff15Zhz3FpDk4OK2Nd5OTLx+2cfz93d5J1ctSjbFvgkRez
         lbFurhyEUgUa8ltNEKF6oZQ3Tx1/KX/2synwdMVFddVUW6G4F7UsHxPWP/XM0ewWOkbr
         OybSANe2/w5hIClPy+VwEWWt2UJVxLCLhvoOabBaYHnFONusi46+7iA1UncQObfD7HeN
         Z9Sg==
X-Forwarded-Encrypted: i=1; AKwUvBzumKbDjhma8OlajnDvtDKt6HyPjNq6QdExOUBfZBGTGFzmucGr3lreUW/5DJb0Tfb83FoQpxh/JId2Bik=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PyV4Naz3yWASZsLFkDpirPWoJ4ULnoVXVK3Qk278T88spprJx
	2F9FJeLHmAKcMsgR4yql6mIVlqIIrcHJOt1thzsbVmgSuQb34kt6ALYSDcUbW2/K9nmIBJFhg7H
	G6AsxMz8W1s3Rk9GdxkUrnElqMXByAYMrAgeo4EJqF/eCeEWn5yhpTj79p4666M5AHWo=
X-Gm-Gg: AYBFou1JTWlVpGYpicqK+wzuHAOOE1CFU0IOKkJw925AlY85w2ZfZN5/S2fIYPkMrVV
	mjCpu3dm7H09roT7VZqZ+c5XWx7jyZaQKYY2YAMV8q4UWk5MSJ5pwGy9erHpIGy5LbUjjkU/5wS
	2pQiKMU+aeM1uXE9S/1ygtnxWlFS2cwpfIMtxk/EvAc0Ty3eo/Woodi96vtK/0TnpnO+UQYakqO
	6R9tObnBGUiGxvbst4B8a8q9ANXiZY0lQvzxKr217tHSgMM2xoUDDCnSZvP35EJ55jsaTWktZdn
	rc0iYY4kaFOrt4FCB7mOL+GPf3k1H5Zz40SSZXU8lrMuy4bdS6Zmv5K6Kl75ZaXaE7jVczl3G6w
	coAW4hVy/ZZusPeWXr974vFQNY8yp6S51QECHhzV4AfEl10Ky4pe/3ZWvrWk3Jxlpd6AR
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr2911443285a.4.1793893288477;
        Thu, 05 Nov 2026 07:41:28 -0800 (PST)
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr2911435285a.4.1793893287451;
        Thu, 05 Nov 2026 07:41:27 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac94e8bsm1729432a12.35.2026.11.05.07.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:41:26 -0800 (PST)
Message-ID: <e2847855-c096-4aac-bc85-386f5502131f@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:41:24 +0100
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
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfXxuICKFJwmDQF
 nf1poo1yIkU23R/pZyoxK5Pz2cDkFGCOVHfTbSzXvYl3hrACelHYn72uxzmBrh9S1mnScfDWkpn
 gVcveOKuWI32djJf951TgKDVisJstLU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfXy+x2oJ4WRdaL
 dxnNm2dbvn6eYtMvTnV1OK+W5ahGfNsD46zTiNirTUBmz0Qu+sVzrT/21VPMTNZpmXVxMnIR1WD
 B++M2eUnzLlpl+qqNZOnW21WsBeSnvsZUlD2GBDV2u0LAZe7I4cMooXmhn+EzcvYw3cnbPqVwXp
 sk3hVO5XTsbN9JPHAFCzjk5w0Fomy4thNWEGXSGURGiq7Y/kPBAI+r8y5K5BB4s7xI/1sTH/Ex/
 mJzvc7eWXSzjFfQbf6mtDCfSSTD8UQ1eFWLU19EJXBniv5FZCMTf+GtDrIWR4xgmO1q8DSI6XVh
 WjvUqN6ayrsOAiNGTTXERQJ7cJKyufiyLDNkrmEgndBABdi7lCKWjC5cjGz8b+U0pD8thKuJZnA
 6mJN/TSn51o+0/W1NCf35szxHZOpbwbyW8jez99R7wZDLdPoWJcFn8bFipnnUVPmhk0k7W3bMRn
 cOEUhk3Kf/9SRI1uaGw==
X-Proofpoint-ORIG-GUID: 8MmzENsWaE_bkU0Lc0rk-oIDxyCmdBv-
X-Proofpoint-GUID: 8MmzENsWaE_bkU0Lc0rk-oIDxyCmdBv-
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aeca3a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3XAOltBAYhvOEWtE0EsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050062

On 11/5/26 11:02 AM, Akash Kumar wrote:
> Increase the nominal max USB memory bandwidth vote to let DDR scale
> higher within its nominal corner, fixing glitches seen during
> simultaneous USB audio use cases.
> 
> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
> MB/s, ~1.8x). This ICC vote does not by itself determine DDR

Can we scale this depending of the real speed of the connected
device adjusted for the real data throughput? i.e. if we walk
the tree and min/max as appropriate, we end up with say 10G
wire speed, out of which we can shave off some static overhead

4500 MB/s is 36 Gb/s which is way beyond what USB3 can do, in
any configuration.

Konrad
