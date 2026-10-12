Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6264A013A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819106; cv=none; b=tbysie+72Lcz/Uhzpt5sgMZH5B5toNh8X3T6FXJ2LYVylQup1Tu4nQruuk8Wa+CCCNnr3oKpQt3mXGSk8JEi8gYX0/Io2QcNBSxMlNqOeLpuZe7ScC2P8kiYDiH9OU+3Kokwvcp1BcJgRNxSzR/tHllGMsWl/FeDUMLN/gLGvX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819106; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evKAECqKr5AzfB5EW7lMQVQMp2SRzUb4NLOqHQYiaqJuyRTnwQVlgEOMKnSpWbeFZ7MgLD7dY7M4Rl3Ymo8zqGV6bBP/8zctKe/kYB8ohA2fjV3CIW21AvOpYAKiGce/6b1Vrf8HnHkWKgiVTAUdn4b0AWExotahvHJCRecE35I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxHYWyqN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPuRFudy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxHYWyqN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPuRFudy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC03Gk801966
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=cxHYWyqNTwYYIUkf
	WRf4h1ZIxDqQQb2DVmesjtxdwNPtDPf0lu/IZj1ScO0cxsEAyxTIUAQbgP5+CfTd
	M78cjQIf/mlfgXsky9Gc0RzZsl1XM9fAswa0i/jowYRimUrzs9dh+qqB8g5VUxi4
	zClzx55R3XtQZqMF0sCyGS5ay8AV1KcybFo621dZtHMXgXk6OkmSXdweUbS9Jrpn
	I3ZVK3TAqytFB5mXft2o3sZ1/F+jBMcrCg4YzxRQIK0s9WEwfVotDj6GBQAlKGAM
	19LBZiKXE96Yzo8/D6+jgpzAvu1fvBcccXkuxEI05pnGVHSAz1ByQRiBHa+ZOtXn
	tNSC7w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcse3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:31:45 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cba2460f8fso30596137.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819104; x=1792423904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=fPuRFudy4l6K7WxwDBgnIGgbc1Pmimv3yq+qhNnuq3Rm5G6old2C+j1gznMxfAPzub
         hofkh2lrZQEZXOIM9RX6oBm+vlAqdacau/pBz5mongtl3pBOGpqONOlpNYLYasLC9HJY
         ZcHz7fnltmuDWoYWZ4OgQPElHUk2lFdwyu/H9LtQazzLoeMURk/RoCIKvg/ZUVKAJqIW
         /TImz0Now505DNrXIIE3pNVUNLLo+yeKxdBm6P9nP5LkexaXgBAkc/ViWLks+Bs1i6Xv
         kPJKAv99dReoA3uqInm6KLXOz9JFJtRmY27rr9NexEUKJhC6V35Dus57fd/fkzlDDY2b
         upNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819104; x=1792423904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=g7Up5EbDjSntXuVdz8nRmjoK1W42c5G2eezEnH1fjGhdmU39hBX5fj8GZohVlhD+tK
         +/T7Vh+Bks15UTWvc+xE748W7PTaxQ7cFYH6mt3Mm65x46H8HtdMQaW2/UOQviDrjepP
         8FG5lyvVZrj/pt8j8txhp6Oex9rxYe+oDaZBBea/hSo3RSfd9Y07AAWDDD6XikD/5asB
         BHgQRPj0+8/yDpD26xQghrmBN96ejMcRmztxNx5o+qIVA9eLuxFyjoZkOS2ICgJDKqFP
         LO8EqGru4Uxw7dvfrqnyb72IglQsI7X2J9ld/yaOryEWAbqq95q7WiPIjZN1dTub9vb1
         wHoA==
X-Forwarded-Encrypted: i=1; AKwUvBxeLrsxs8BeUpKBNg3w4RYmQLt+SgQAm52OlVePOQaMJk4kDYW2NNDukZDBtB712PszH0ldeWUgiRWrZoU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFNY66qFaci9XPJLeeznjknYSXNm1xutZ3mQDmdKv9uDR9NPKj
	rGp7MDV0ZurRbIAKZiMjeZBXqCaiJYqoSHHaTw72SBUKiYFDE17cHmAm7bd+x6h69RGdufLVuT0
	Vw74ukO6EX+sNv3Aoj7B8XSZY594tOKd0xBh9PlPLNILmBcRXgAX8iZ8bIwfd42/uG0+85nRPz8
	4=
X-Gm-Gg: AYBFou1WuyoUq3rL0baoLTN9Gb35xnD/tOuGpk/GxD3LOb0fnvMCSe+EgZ7Ch4YEqA8
	9AZu4+EGRTqyKr4F3lMfCQ6TPEWHSfGsLh1sTKQgFVn4/hLymPH2i5Iww2NzTo4OhbVCs5ivSSA
	9mSOeGL1r2ZQ94zeP99j/7qK5Au5cWRwGeSJRBN8lW6XdTytIk2U0nUWnWunmu+KagRJAtD1shP
	+dhZXzq+NZjLibf44BycsaQny6ayS79ocWRWm3BpIcAPcqxE89SzANtQ3reOpSz9OFJ9mI+tWTO
	H7uBnuxIhNNoEop61yM+QISBIy8Mxfh0uZIlOb9KtlyGYeW3lLQ1Y0ClCvClISczEqep5P/OstJ
	xoEhYdvNYZaHWyT1SXfiDdA==
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr1958796e0c.5.1791819104023;
        Mon, 12 Oct 2026 08:31:44 -0700 (PDT)
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr1958654e0c.5.1791819102293;
        Mon, 12 Oct 2026 08:31:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34001fbda1sm203669366b.66.2026.10.12.08.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:41 -0700 (PDT)
Message-ID: <8635eeb4-037c-4ae2-828b-4587edb88896@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/38] arm: dts: qcom: msm8916: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <e869c2bb5005830c9ac1d4bf998696ffc4eed335.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e869c2bb5005830c9ac1d4bf998696ffc4eed335.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MeGRn7np5yHe7WsHmytnXyrOapsoXJaA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX15P1ZnIZzH99
 xjKxYVnyQWH795KL3Ko8M3HrtmiAvuYcgHj/Ded7so+MWdof2WXAFqev05eMrSKRdSUT/rtrnio
 SdDT99QHoSLdTRek/XDg77EH1pxJ2Sc=
X-Proofpoint-ORIG-GUID: MeGRn7np5yHe7WsHmytnXyrOapsoXJaA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1PxzkfpY3+UG
 vuhFXg1Fi3pd7HnzyTw10s30tdam1Kzu8vrnAgbBcIR+dXPZ0L3+ggmqmcZObr4epcPHD0uyNYt
 5u9OMVjdEumamoozJIgMJXx5KkUp4YtcoIjazODmeRzd+FJa+tZeTG2O/4Pd619SKzDYZHaehS2
 Swbkc3SyZAcHzvk50wiD4J9IFjK4CgYhlASYKEL3f3TX5cdDXmsSAUu3cuJKLlMOkwk7fTjbOed
 46QheS+V7DTeukvYhYh3175diLn8f80q3r6kokJAZPfr9T3g9LthFXezYqSaz108ko2lnqb08sl
 VrngWIDavDmf2LG98gFqB/MgL8yRexLG5cnSSQolfHm8zu4nkVbDPsl7CwSDqMfGzES1XRVUWjO
 AYj38eNCNiaKNwT7gcjAHmiB8kT2+KRrV+Hii5N7f0mwZKsbzC6tihg0G9yhNjhybJhGXE0xWmk
 VschbUNoVKxznx3WcWw==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accfd61 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
