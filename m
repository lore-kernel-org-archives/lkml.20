Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349422;
	b=CaQ3RcNlvZn+61k2hXX3aELorOySk6AX20Pf1ovOnyL0wmgYiVVMg4s4cTaH5Y6qKYr4
	 AVe3xPrsDWGO2kEN1POWeTa8wDSABhAoTeOp1JSrz3s0sAG9KMunGkjvtZLcYMdA8/VJD
	 KNM3aNTvZl94LP1dMa/e3ye+/gZQ2cchpeJK5YLYdtG9I92UG2LBdLpdMQN32vfBpedGl
	 XkAmWIoh9YZ3k+5h83+A2IY0kf1Jl+A9TVSPLDpQcRmZQu+Adqn5iUiwZdT41sSCU5YQl
	 OieOoAhe9SO5/lzAacW4Lcrc7DOOqDyFRvNQvKrq1rQ6qnouOle9SnGnnw6P1Sx2z/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gmECJRdrNVk5aT8kkhxOMhS3+xVOvClk2a1Pq4OxnnM=;
	b=nx1+7Gy4uNR40D18PPxNYKoQiGZww/JsW8igLjXc0FArPVmZWYpfuTZ9ykBjyPi9jD9O
	 A6uAicqDn9vvi2r1Xg99clYkXu5VfoABruaeH5j0jFyE5hOl7lMJmVcDYDjomI/SvN8ZI
	 /PEx1Dya/lk/eBNs2oMpP/2AHouKEVGYICxCJF+bfHUUrvrdAFVLIn9DrY2n0doViytni
	 t6pdjUrbgx0sUe8XRrHnmH7leE5UVJzALgjnb65u3QWvZ/k11zjO3yccHayt+QJQYgodn
	 6kCtTmb51ICSHd/GROMyKxn8jo+3Lz0Dn22BEoNSIl/8CyV1qdAAuIIIJZ74N6XA8eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQ9pIGGL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guRcoSsl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD55606A330
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CD55606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQ9pIGGL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guRcoSsl
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9rs2374161
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gmECJRdrNVk5aT8kkhxOMhS3+xVOvClk2a1Pq4OxnnM=; b=CQ9pIGGLRtsEKglA
	dyfY+1PCcr129kLm/j4EmwwQ33yGFTIMwQkS6Z/JRu7is6X+oEImWsvDjTm8qvnZ
	BnN187k1rFL5mDeOEERloEdGDvEFqHZFnpALLy94GCaihgjcuLHZZpJuyivJT84w
	FOA6vLXYIw9cD77+uhqXqqoHBYYcBey/bwm0BBHdBzPTkRifVTohx5/ngddc8asu
	S5nXfJK/0NcQfimVLCxH7ENfmYHeO0+iAFNUi3ggZeWWLLK+kgRtVEcsaPoFfWP1
	E7/0VkZLmNj68xc974k0J8Ewn6Z1F7ULkn0bPSDhhpn0VWWDYodbKhO9ZC3t31I3
	7F4ccw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj0wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:37:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso3469985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349420; x=1793954220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmECJRdrNVk5aT8kkhxOMhS3+xVOvClk2a1Pq4OxnnM=;
        b=guRcoSsltxLg7pNV7iXFJlgO+gkzEYrFYdz/SdPQx3A5yfIIMIQFcn6Y7iJLbtoiuQ
         sQx5Ej9PRMIdlcym9AAi7R0x7CoZYmZmWA4WpfxrS41AK7v+45l+Jrkmg+r3KExiwkTX
         9jIzQf4b+m9hcAh4y4gdUIwFCggtF03JMwP2/b14/Xm8H7FRK49OEB8dKZvWs0Ui7e+E
         hTpCwSuHOrCzSklaz2kjlhSiAl3D9NgYyUq7DLi7+hE2qpVLg+vrOLeYAJMyo4bTh+sJ
         574ehhDLTcGe47jOEd9RPssxOm6nVlWc0YxvIEva7rmX+yfkhXwtmGE8mTqeLKOsjTIB
         NUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349420; x=1793954220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmECJRdrNVk5aT8kkhxOMhS3+xVOvClk2a1Pq4OxnnM=;
        b=xe52JVwoK3XTT5A1p3lFtTxGZrqfaAz2utJk2bNzIGqlJ8cHJHfS0IKipeH1mn1tJS
         +rb2hQZBuxRl016wLEs9Zlzp4mfZAsjwFEaccpafvfoP0CS/tq5oOchWHXoWwtdRl9+0
         76Zn1aA/S79KYYpzUXALNodJhW7SPnqLJZc3Dvt4/Z7yA9LOAmStsrTiCffFx+yU7Tfp
         m59C/FZqN5HkN/IPo/x9HXX3odhRdrZM+mQkTIMB7JghI9Kow7JasS8PW6DMSUAvPjXM
         51E5Tk5pfGlU1Ei2+hX3n0tilrFw8qgybs6YI9Ixf3VNNb9+dyfid06soJ6LwkzYN50V
         Do9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2PrTTED/hcytu+mNRxI4oV16Hrd2N6G1bQ2HGLZIUUNguxwcuMunEXRdjPFY4VJqlMzY3tTqRjF6Iog0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+veczEZJw+D5SZ9Efjspfgq8u73QFR5hvjgmX8/99KSgTt8/P
	4HXBmU0kP8lMosSN8Z7+DYZboFXZO2RLpl2xLcG/RaoLawAO//+/YlM99++nXXbS6C3ltsICg+T
	jtewI2SHt9QYM1H7McsUu9mTLFnoS9sjiM8cV/VjQjB45wGMfw7ysyWEfOeti9eeeXlc=
X-Gm-Gg: AYBFou3Myc1b9ShtbWrCrbL8rejAfXtPD4k4QWQ1eIKGJIi8tPfaTvqPZW45596Nxb/
	l9T3VjhCtAkkmcvJ67gnNQF4YYffqo56NRxjQQHP8pLDvznqTnPSX3j34IinHuCksrCO4BZqpxm
	wviOop9M3aLn1DZRCJPaPXtIhbsiBnaPF0VCXXVkIfDySiDYtkjYB0BCic+yvDrcWSXX1mzoukk
	k7jGth0JnpxbH+jUD8jkFz7Z/ejDNVBabBogv/unlhhIZY04kBJK+J6HmxcOsniYRTnIJSgR5C4
	xydHTGBzHIylCjCmkTkdJcBcizZqDv1HRzPBeqb6QXVxOtonAJqnFXSR/LBWCF546lGK8AuO6uA
	VA/urb4FL/HInoe5Z7Etbzmr0iKsGR1azD2niODk7lxmcIzzORI0U1Ahmfm8ZsKwuTYT4fls=
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264284785a.6.1793349419892;
        Fri, 30 Oct 2026 01:36:59 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264281485a.6.1793349419400;
        Fri, 30 Oct 2026 01:36:59 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b42653sm381344a12.34.2026.10.30.01.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:36:58 -0700 (PDT)
Message-ID: <fafb11e3-2ab2-444c-8eac-e98173db103b@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:36:56 +0100
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kodiak: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-5-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-5-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4572c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wC0WDq5Qq4zySJWTHJ8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: t3pm3Xtl59WK5I_CSY2etCI9dNMXKV_P
X-Proofpoint-GUID: t3pm3Xtl59WK5I_CSY2etCI9dNMXKV_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX58Fk6Q9yZxfK
 /8qysT/iFPHWI1GLox0iKev5xGWkLmXlGYn2QoauQgKKk6aWeFbINFlnGV/fPXhHN+wI+sQ3vDd
 0bc+V66bJMv/tKUdBHjtjxHYJ2ab0/RgUElTnsVdDdOyrMkYJOUF0CryuQ8QrT9g3ardSfepWQU
 Hx/xJ6fAPWNTMlj4OfbshrcrrdvJu+Yau/cs60AgoltDREHS6geB7F/dS3q7XJuOXqVoBQUfbAG
 52o4qGxCIzKc91PI9f41AUXHhttzh/BJLvx0ChyEtdj98vUrVoJVKwqtGgrtotsl2CyandqVGWm
 a3OQnSnsEFlc3oKjEJiGIKR+H0LRZK+2GcBRorMShhXvrmXCTM43f+PA4V+q4BQRv/0ocvl6u3o
 T4UOd1C8MUWaPfCzzWi52iPPLhQJfJW8g5wZDvWYVoYPpIwHaXbLRA2nS/AfbRgk9fWf9SsRou6
 TlG/DyJQcWulwuFcqjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX0TivMtvQImdN
 kA283Y7vpuG0ruaXGMmzbQwfYSZJUjTJuROhlxlwojqGPBCtGp81ehoduB4u+pGPurYtdCp8jGd
 QGdRfvT8yDc73JdY4fOJH3Zhy78CtOE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> Both USB controllers on Kodiak are DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
