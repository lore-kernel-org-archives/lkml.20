Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665290;
	b=nCJfW2txzBi9dWp4QW8RuM1SM6XyOc/nHb+juHCbFunuO961XEafVaQVGv3BnaHf2EkH
	 1Z2MwUXIQKoM/jdBc+FP+4URpQK4eLAkXEe82k4ju/h00E6Zm6G54O/MiA7j4gF0/Xl8Q
	 jyVNY0poLXyLEB8n5uAUM6dlzNIotrW3g6nBWAW/ccR7KkesbVtZNqMW8TEZjKyTAMVoi
	 NFZMhjbasvArBtiQ9cpRI5DGm9BL7HVD2wxxQksmecxbS2ae4zDsWS/rRtoAwev2k1phU
	 Z+fKrsbFOAV83O96M9CrFUp2NHMpJzsNAkk5sqOWfmF9pvZCmgUg6KPoWONJchfB/oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xUL97CU/jgcRIW7BbMZRfUUfm2sRjdBbtEqx9vbcTFs=;
	b=45colL0eC20xyXeZwxZHyWn69tmr8aNwnpNnYAKmaEBVmQnuOAUBazX/963gfjzwx7ZK
	 aa2oYBy+4aLneukqJfYUmHdcYsk14QqGDt1CPVQNjpRbHMh35I2b2JxH/RhmFot2goGgg
	 tWnc6924S0n5t3////TRGMdtPz73NZFJDCZevDd+n1KFwco8MbG4ltG3sn0Drd9pLtfbI
	 cvB3Tor8z6YnkJvVpE1i8DLIMx9piK/ZDI/QtVJbqqqjWNOO6VZA5dJsIidw/gAHwCrzR
	 g5MLfA9zJrjNMImWf3neuERo9s/RCLrdxfJiwl3ugCzCs8fQdRKn3hA/GpHdqwb5Dhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W90rFzBb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRM6CzOG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CBE606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39CBE606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W90rFzBb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRM6CzOG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA025M1962798
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xUL97CU/jgcRIW7BbMZRfUUf
	m2sRjdBbtEqx9vbcTFs=; b=W90rFzBb77CYwJoHUhSocLtUCZkGxMkQMwzCRdsj
	YTgZFmEuESmUhYNib+M2Fe5hWUssF2bN1u4YHPYh5/RgDYMb783yCC/dHvpPb6nd
	sd0WL5MW1iIEqqQTPl2v9783tWyLE0UGo01WQtgrY0ITKhLqnwDqDHcEroSpC7Ev
	iQ7kz8RVzoyYLbhyVo8eX6CwLk1IA/TKoFOug1lRaw7K6E3+Ut6JNmhw3d3C6wiZ
	Rw3noy/m0QZ83cJ4yFxsQZrghqEGXgfclWGmALBSEV1BZSkg0mQgCpYNAdjdQRtm
	CHXwcqQ/BAkZ3/97OUNNs/yQxM6QGZP2kc6nHxzjIDfNFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aj3yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dd3c3badbso382141585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665288; x=1793270088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xUL97CU/jgcRIW7BbMZRfUUfm2sRjdBbtEqx9vbcTFs=;
        b=VRM6CzOGPDzN8mStW8JANjU8TeBRryMCuBBtOKaVmphBoM61nJcfkwFZ8XFZh+qtpm
         fjmGaBtjGdGd/hEzifuZ5xXzxzFGMLe9pGcIPA/tMpQOBYiyFBWPLz6TmRjDkqSIjnqQ
         Qvz6vGUN3dfnlu4VqVBXI0rKWr+vnHj6198KAQHeS0Wfp7S7X8RQpZbkZLT/zyLSz8Ih
         sc1UgPEKOrBuXPqBMTrGJI+EWHyM98pWaJK3VPeHE9UhtElmE8/WkQ6RG4ixs4jNE4ZQ
         FFhtKoWyi6gjB8V3zkUC/9w8ypkGz4FlqK0j5ohgO1wyBakCHOWFD12TvO4OSZmZgYLL
         ctTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665288; x=1793270088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUL97CU/jgcRIW7BbMZRfUUfm2sRjdBbtEqx9vbcTFs=;
        b=AxZ/xqdhEdikRZEqvZPyopH5rSnf1865RTqYHnedvdwjPxN6A/w/E0uo7XOGPfjBCQ
         IuU7NKp1hKpOceIJVFQCL9QtYAKHvcBRRorgQsqm5kkJZq44xkrVhQbki4y3nIB7YDmz
         D1iyp+b4Wyk1b7a5PXKKPLP+AU8Sv72Lv2EYV7mwKjRQRIhDNzusH/kwUuIHcUDnQoSd
         t7L6oWv/fSusueGXqrC35TjdCbPqtQ+lYHLeDUlVsQ+kwIVbWBOV27j5qDW4eD5sBbQk
         fj5IxYITMNTu0+823ITMdxZ4nxSN9cY8xplwsc+UBpikKAlCrQVTj2dG/rM2O/xflKxx
         tg5A==
X-Forwarded-Encrypted: i=1; AKwUvBynNAfGrA3qLPkryeRfqWSnJ23u/4u7Juv7hA8eeUxzUpfRQzgTTRh0WnkK1bMzp8ZrBfAP9lq0is1QFhQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6MUWEF59Fiv44manTVGzzI+j4ckjZ/ts8KTgSFtkSoXRxeDgv
	S8XiluYX44ms36A+g0hB/jGiTjDmM+ZxbH+WY9NngEJi6JhhYERN3w73/8TU3S0/bsLQ0Ir95P3
	QdVL+DChIgzy2TeJ1ws7lKm9OOMEoPkWBH2hSjts7F7a35wdqwE00M0NUEzQpFb2pkzM=
X-Gm-Gg: AYBFou2IdV0MOly370/NdnhDedxShGjyq85JnwocJ9TfBoXC7QJ7lv+SokJJzF4aZUy
	OC/qIo+IDFmVX+G5CzHhe9+lXeAFrORICOeHOJ9vRHzXs6ijn1xl88J4svPKEI6R5Dj9jZDP3F7
	YjZA1zpOIsFd7+bRvOJKFGFinnXmiu/qdE7dFtiSWlGHrgt52c+vvGC4YlJOOqzWhwp0oSRhY0x
	bA1vPN0iXg754GvLhj1LiUJMTrapOa4CTU5JzdbpUJ5SVxq6tbSszUPMM7A1csfmAH9XeAh9oMo
	VHI6ohHU8RyCx/nL0XrgRmroemt7aaAwLM7jUtOYXk+ToZPNYCMGug5lwMK905gNpBlfYhHvd+5
	vQthQWWXuU7nw/QF+w271FHSMfXmyO3GB3lqVRwO6qJXquxiCGMFaW1tlk3g1Up6W4IqYbndvu6
	sje3hLao4z4Xhp
X-Received: by 2002:a05:620a:7014:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f57f53ebdmr837298185a.39.1792665288503;
        Thu, 22 Oct 2026 03:34:48 -0700 (PDT)
X-Received: by 2002:a05:620a:7014:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f57f53ebdmr837296085a.39.1792665288050;
        Thu, 22 Oct 2026 03:34:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa28347b8sm865280e87.9.2026.10.22.03.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:34:46 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:34:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: add DisplayPort audio
 playback support
Message-ID: <bwcdzlbrpc5jylbujixkl7vgnt7vqf6seohzeaeznunirqcokj@i5ocfl2odomd>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfXzUC9+Mp10fxR
 KEh5k4sVwP9yl39T7INS/qPUwcD8aPnHU4j+Za5nMxp1Ow/TE/DTYFAGAPKHbcy0/TKrqOXQn7V
 KEpQq9apO4+9k/TAHEH8etd/NYdKSQtaE/m5duYTogooEI8MM4jrhzCiFQu90aHEJwnERMQOWmt
 zodSusybgCJnrqpIExEDgcvwZjlD4fFxaS3wIWo0FlSnXgnbqQxTSS0HA0uTQs6wB9dDcRHDuwI
 20X0uQs1zqZBJEVVX3w7cpjyH53WVpL2wsZYZkBwF3sauKmMDZiP0GWJ2LI2Ay8udlQsrF7F4HZ
 H68TWKhKOQjSNfVV6OLa1fuke/6LLGee3J+1Kv/pEBLnWNfB+8kiTAw2EwzFRmsUGiJGl3w5NGJ
 uruSSpg9fskGuDn2ZoXzfoDqWTWAF728jfo3+B1T271H5wD9oPPOHCMad+ZC1FZqk5cG9H/3AGr
 7MM1f7nhE3+tAyKUbxw==
X-Proofpoint-GUID: BA2KQlt4CF3kyvyn0cj6gJndH_h0FH4y
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9e6c9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=hwhmpsCkSw5bT3se9GYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BA2KQlt4CF3kyvyn0cj6gJndH_h0FH4y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX/VDwlRa5rP6L
 uREQbcsr9tB9jUdjgQx1gRoeq5txElRsbktYYPMfBCVLlNJWlnN68vZ32ca/CzKujHpqezN0wpb
 LOqlifqoOP+4eCa6lervVd58w02CGN4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:22AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
