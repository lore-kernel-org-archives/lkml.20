Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699836;
	b=zEXTuS/h5uYSHhkfCwPQY4QEi+afFE4w4JxWIZfH7/x8VJ89ESPWKWhPY0mDJ2ePDs4p
	 ofdJEO74rMTOo9CN3OJsQcLOB392owrEMGecDN7A6u3Mq/sY/iJQXxygHmZAA8C6bRO6W
	 j9ZTzQ7IhgrNO4ft8v6LgHnO3HqQsYN3ylC/Po2QmkHA+ZGcMJ0v23RTyxh+hUi7/yT4W
	 IDm+16tEulYwpUXLC2kqZVKWFPplHQkGgGfCSeD11VNDe1xqfHVsEgR7Rns1ZrEFpAreS
	 kFk2OmZmnPI9sJASv+D/uY4wm4QIlRiRV7TYXVvrAhp6/iMA6hFGNjQCK1Bfb4NQOQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RUu4adMy/np/5W9QC2VHk8T5G7ZIH4XszZOFCwv2tCg=;
	b=0tRVgx9Q3Hh8we9wU1KSGYkq/hD+yGeQxaVB4EMsqZ7+lEtBUgNVs4Jq4LtFiK94rG2m
	 3OSNRMyeh5AJDdnRgPKhDPu5nTJKKKJzpdSXX9970RSlFeCe07S/d4BeXiihlcn02ySJU
	 UIAtfstiMPkeNnteRNLGemY4/2/oLnrrpvghmwsnW+8kDTxxbDM2ARFGIbQQXrgzO0yHi
	 +KtDdMRtITiiF7mEEM8kimVitKZJoKzrSeCVCze9ZsWlEomgtGFjXqltkYKvAhmfyhDsx
	 NWy2BZ1RZ3Q/BxcJJt4nty6FdDmkUht0nWTQ9/hbfZEuqN4LhDRZpLFhgEixo1o5efw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QF6KM6m3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WbrnAYnD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255FF606C521
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 255FF606C521
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QF6KM6m3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WbrnAYnD
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A389a8p4002666
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RUu4adMy/np/5W9QC2VHk8T5
	G7ZIH4XszZOFCwv2tCg=; b=QF6KM6m3+774BxDUU1jqCPSbTY70tkIHZvdkUNu9
	JG0vw7oMLFZ0DA28G2LztQv+fViXH+2dY1brB/OagRW9DdYdLrdcvXYJjliOm0/T
	mx2pp0WTsCkNq0BT0L5HJu7efdMalYzwuixTQEo0ST9CzeHYnoO14PIuRczJ/u1h
	/lJoKvYPtu8dfTbqMQUAMrgzuGCECGN7dGHvLhmA3vxzwHR9sfKaREQilEY31MUX
	iByGJmPnsVQtcD20HhIplv4VHM0iyOZia316DFArPPftA51BOY3hzdJR+OY4bg7l
	8k+rVvKRMLkasUdRyfYleTyxZb7onEhI3G7Z8R2RDBbLNQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ek4kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:57:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c75523074so80982796d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699834; x=1794304634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUu4adMy/np/5W9QC2VHk8T5G7ZIH4XszZOFCwv2tCg=;
        b=WbrnAYnDYD7k8rJ9j9fJATDeorkOKe+Ep98pedrwYMiB4+9X4wZDdGS1iMYRw84imS
         fk93CgbAyhSkV3kTl/8ZUYwSMjlw3b7dj5/7mhMdzTso7/S8PI1ClomUIZTIbc7C7UXr
         FwY9H9gc2jwF+kzjCn+G0Dli4+JV8CWl0vv9UueLuRUqzfnDNHoKyLw4cKCZBB+HO16Y
         GjAILUTGnCAdRZOSJEobxXWdsdoUYL2in5jlohz4pc3p9pb8czEQLUgoMUOC2iRPEAFX
         38AaXY/dIU9AKETHp6N4ArxZtO9vFGm4xpKHuoePTeIXd/IbvrOhR5ICfKQfP+b/8Ssi
         J02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699834; x=1794304634;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUu4adMy/np/5W9QC2VHk8T5G7ZIH4XszZOFCwv2tCg=;
        b=NeJ8Q/lIBDUKxqTZn8xbDMiFcMSQYIZSmLi8OfGtFvKY/QCh4lTi3dpYlXCKGduvuv
         M5eFGE5HN0tLvcQo/J7Qym956nCOqyRNyFj6itqjtDtWhSzGZXc1SlLBpeVJpXc0cVNJ
         Oka2PKmkl3SKBtwZyVIrJiq1JQF4yFKQWyZZEvJ5O6q9PJnn1KnX79JuIKk5XieL5iMX
         lLenE9loe5IjkR/Fi8CcMBD/v1nCn2Mw8Glc6z01dC5ZW52/GQQFG/oimuQQdYOFuG8w
         TwVHtRElRwu9ZpWEMZFf5/lOvHanOVwDoDdeqFxMoZIh++OLVkzUOI4PQLsHKZSf6xck
         UbOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4M/sKOYBOvcQY1fSSdwI1h8YKPjvYXj2V44HExkmfdIzcYqAfhdyFUORVr/Gc2Br7VuFuWoPT7LXYdiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GZ4XgVLroUbzVVSBe52MlztvYwqsAdawRHWjQpy16k9uvPaJp
	yRpbkpuHXPxMOzdPhfo7FVxdnQAA9eQgRoolafMTH1h76JT3G/DgYAObWKswr1Hq5qXgmW/PHVn
	vCMyBTwe0QpqG8Z5cUiQBUiyhwmy4TFzDYewro/MEBQ5aSdWycVzEBctYzDlz2KQgXiU=
X-Gm-Gg: AYBFou06kDS2iLe8Cip8dFRmPmG25prBZNKT6Ni3Ie8G+OoCnD0aYhdDh75VWN5aY8G
	LLeSS1bvvtXkp4FLGGRG8DFip9XEW7snkSn5tGbHFqsnqxxJ5tSOu/KYCOTJ5oClRzsGHJzW3qy
	+GmLwKR/SZs+T5+oSH/YARKE1JgL5dykE1tIKzTDfjC3/gKT++1JMKylioFtl3nEVJRkuYs684C
	xNSJFnTZaHzWXfBDrHqXrhyNZzYduZNdZRQ/X8kF6IZ9qutKu8QkNFh2eSdV5JvYxKLhH885MRU
	V7fXP2vLY94WeKA9pb9nQgjudapbUb2sMwco/WPgiwIeSfg3P8HIMUX7OgJ67Dh2vMHeKjt1wly
	ZtiEGP0lP+X9dcGeg1cY5o6L5UGdrpRnWcopC3yhQOKnC058EufPVJLCmkpvUoSA=
X-Received: by 2002:a05:620a:bd3:b0:93e:f9ba:690e with SMTP id af79cd13be357-944215817e4mr1946738385a.3.1793699834185;
        Tue, 03 Nov 2026 01:57:14 -0800 (PST)
X-Received: by 2002:a05:620a:bd3:b0:93e:f9ba:690e with SMTP id af79cd13be357-944215817e4mr1946735185a.3.1793699833543;
        Tue, 03 Nov 2026 01:57:13 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a96fc933sm48333425e9.11.2026.11.03.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:57:12 -0800 (PST)
Date: Tue, 3 Nov 2026 11:57:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] phy: qcom: qmp-combo: Make v4/v5 targets use the
 right clamp
Message-ID: <ekgjrfx5d2omjboiqkougpyox2vpgj7ybssjxirwrdicnpjxpu@fzwtmff544rq>
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
 <20261102-topic-qmp_aon_clamp-v1-2-141c2cb6cdf6@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-topic-qmp_aon_clamp-v1-2-141c2cb6cdf6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX0ffnwCUjstTB
 nqWX2AhFoclyW2zVCW7rNF2Qx2v/QDW+J4cIh0n3LnCul/P0b1/gFO3Nh1zJ5MHfPhZp8g/xjGj
 23XEyl4ivLloy/QC3A+oE0aDNMvlDJeDHszsh6gorUohuUQI1RmsXc96nnUae49efaChFlbv0XH
 ENm5B7+l1+PoR8gUl9xiPmzLzw33U8WdHAW6zkvdlsPBAiEYVF23yHUuoL0lFMQxHCuwl1zioOR
 tCfZEBJIIZYKMVU2PjijbdSIYOTyD4PRAg+0G8YHYJCcInoRw71b7uYCw4ke/ZKtyP9hrbW4cEZ
 gsajUo12srVA8dKMM9PbCx20urG+TsfGsc2Z9y/abJrS3sM+HEd3DBRJcWeR6yx6lRdjJVrI3h8
 gTOgIoCU5GhiSEztbng3rUfhrNY11zu2+31eiXUo1waSINrOeXEHWgQO5rdbofMA/A4aYglnkj+
 D+/D4oJMVegQs4DpZfA==
X-Proofpoint-ORIG-GUID: UqilVDJBlPFYQIGpPgUVASdDmzmLAO8c
X-Proofpoint-GUID: UqilVDJBlPFYQIGpPgUVASdDmzmLAO8c
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9affb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uguNxjVQdpYhtvE0XFsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX3xOcS0v2+Mb6
 ZkkfPP+hRw99K1kEm5K7MwmXTq394YNVkW2MnvDkWuVnQV3da++oS1iZUaNVoA73Fqpo2UkTJmb
 SvGGzXOntnEtEUZ0Mz55eULOjzmKwJ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-02 14:59:33, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clamp in PCS_MISC may or may not exist on some of these targets,
> but in any case it's not the right one to assert. Switch over to the
> one the hardware programming guide calls for.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
