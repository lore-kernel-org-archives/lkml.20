Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578391;
	b=Aya71pmdrbjvOf6tiAHaHcoPB3rU3IJyzgYMQpvAjtH1r3qyMBuSeHcP/V4y43YZyfyI
	 NztGJWHE0FBRP6DQlXInU94B8rgWbmhDSriVIa1IFyRIkxhuRrOyTFRDU6QrguU7J/6q/
	 X834gpJOPV3n2ZoJZ6+gMI80z0jv8uJieuFoQe5FIKKHdnDl8QpFkOoo+cZMd2XEsUlMN
	 SLWaIarte+/0lDgNEnywWLYaZGDYTIWOocf1dEYLUotXffZyfa8VIp9w29X1YpRbNEhoT
	 DAWmMftAPGfeCNuCcWDgw7R9yCVuzm/gXwPCWpOIEu3US+nYuoD4PintVsGTfjV7V/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wWzAUjZknh4jZl3NcGcDKL8d9zuu/SZC4rP1w2kOxz4=;
	b=JnIdIyRQAaXW47zvRjLQWUW4I33watO4qzMvJdYXZnMSU5/G+V4+ophmv69YWTagmVI1
	 BsE2UceIIYizQ4ymSB/KWqe6P1XocBsvvbQ69EzHidzEIMs7ZUZB4tQbvH0v+xywBhSHp
	 6XjBHG1NgW710AeoYkqMlqwHka0m4W04pZYP5U+h4sCwcjgoMnLHZQDMahjsJZLd0KyGk
	 zMR5pht4PwsrOSgqvcVMrsrbcV89N8L8cWyJlKSiZk7w6FtMRFtKhwlIVypn45LgBXLqu
	 Fe8YlAJbWaw4p3rmRL+yzlxEhDgDBTZcmPhs1SC4aGWm50IES7ZR2+IZdYHN6V0RJzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BHGYa9dw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AUfiTykE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F481606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F481606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BHGYa9dw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AUfiTykE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJVYT1525920
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWzAUjZknh4jZl3NcGcDKL8d9zuu/SZC4rP1w2kOxz4=; b=BHGYa9dwBFVPl3bH
	262z7vPEMx6Ep/+o9Zt/ee7SXdvIkpmkK7lS0UL3XibqX3ypzttHtwtcJL8z9YPE
	XyHL4t7/YWiiXzNU2XTmdN7ZqgT4s3PumGhG/9ksPU6sBn0cSbJLDCzIxJ7X9YP4
	B3K8MWkecn0doWzpI8EyFsotiYTeqhb6ZsyBBD1U4u8IPbWPVtps4QFEU3ZBIH8q
	MUsLx1CrsH/4D3zhYiHfI28X5PUR1k0mrMa4XgHcjeXuJR6+TvpbGhvni/g+R0s9
	Wgb3yBNkrfZjYv1bx+u7rvsr4Cju5hGf2NHvPFyaYSIQpCoqgePyuJg+z9jVLgID
	fWcpdw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g20s28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:59:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91bf35c4c78so513056d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794578389; x=1795183189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWzAUjZknh4jZl3NcGcDKL8d9zuu/SZC4rP1w2kOxz4=;
        b=AUfiTykE1LQCJ8DmFcDd1zFIHb5SCiK9MiHiKLv/Mv9tj8rqyfxAJLyiqo4JUf3j1S
         mv7JwR0EP+7UBVBJ8x8P2h/rrYCKUigHMVKdRljNFVavARqO6/M4XhRyjj5dV36B55Iu
         rw/T6yPqgw8zY7mlOPNGr/czymAn9aZ+6+0TzigTr1pHSqZsEZySDenmaSmO/mUudglh
         KUwHicYd9udcVVK6FyO/yZHzASRmEF30TmlFNl3qpsdzUpYf9xBSvnbqJkh9Vt3hTI1C
         Dc7B+EetOilA82ZYCu9b0UfEV8jV1TwotTtOF0TNHLR1aaXOEufqQ8FNeiL+DQdFix0a
         0ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578389; x=1795183189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWzAUjZknh4jZl3NcGcDKL8d9zuu/SZC4rP1w2kOxz4=;
        b=vxiUMM7O7OEHlewAT7A7HKmpEjstsZETo44r10WQ8/IHZfcxg/Qxl+GvZlTuI/yk4X
         Wo6D7oLtWVBwefhMBg39y58PXx4daxO1fxfUGHyco7b/cLSsdkVH+f5rAaOyz9T956Uy
         cKwMdxr6FR7BJCWNWMwCqMpDNN2Mai8Up/O8aeYrqELRAwvikL7FdyUwApSLsLir646s
         HNA2GqsF5JahaO84xNT1GrvIFbg22+DnsxW38aAJLQ7+/Ms/JWStrey6saTiIph6rk1l
         1aJwC2ZtoPF7WMZsYo0zcMeoqfFdS8PXzuGwnhM7l6bSkQw0NsJq0hDmG3mJan4/+tiw
         iVjA==
X-Forwarded-Encrypted: i=1; AL+hErELM9Vh55kcFxQyBILm+U5DvvdgrGEkVGcE+xwG+xbtHvnPrny5M3DkvSNpeyQO/tim5SDcv3R3DpbkjS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ge5t9nR51U5mU3RMfWctwGqtdel4a82ZxUyTXQ2wGbYq9H0wE
	zao8hrMHWM+UQ69PDkPzWoa6iADXWcyUWfBVXVjY6rPQfhZJJ6NXuFtwgnJOqissQbGOACh/z1S
	78QhsmRXmmfgsQGhncdPL12U3YBEL8h3vcHw2CIzdSLuF15k7Otv3++Xp8nUy3hsYRzI=
X-Gm-Gg: AYBFou0tbZ+Looe9Wj304Z4PSJ+8HPs1R63TttjOiYW1OFg1gy5AYkvpEBpxvTC96lX
	n81YCnAHDlfJS0Lj2uVpqx+kqRc8ZhQsfj7bN9z645UFmJ0/QVspQSsj9xsy6p/PNqAnjFSl8Uw
	qTETaPBN+rVEK0ihgYXjCvUYlGojiSeJaSkew+1mwiS0loCg6ADVXA9ijfNM1XCl8n7+j2zc1r/
	GAE4C70xrktP1yt5mmovNe2WwMlH9kYpcwP+PnTQRdIteVk29mzk8oFYIDBpM3h3HSuqyS/Pd42
	GZcQNBwtsgHOiuCG5NdZduSKwSYxpDAkhVDX7PN5yALykxfDGQRLloQirovMPV96uKTx0bVpIfg
	/pHGepAUWiwhqeZtm5dyQgk17OTGiZSWlQtosQsPoXRY4boV8SY5v1VIFZaQ9KmK3kwwjvQ0=
X-Received: by 2002:a05:6214:3103:b0:914:521e:7da5 with SMTP id 6a1803df08f44-91f2405e286mr55051016d6.1.1794578388475;
        Fri, 13 Nov 2026 05:59:48 -0800 (PST)
X-Received: by 2002:a05:6214:3103:b0:914:521e:7da5 with SMTP id 6a1803df08f44-91f2405e286mr55050386d6.1.1794578387916;
        Fri, 13 Nov 2026 05:59:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b76b6b1sm8150891fa.6.2026.11.13.05.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:59:47 -0800 (PST)
Message-ID: <182a6790-90ec-4083-8da2-14be30803740@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:59:44 +0100
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
Subject: Re: [PATCH 2/3] Input: synaptics-rmi4: Support drm_panel_follower
To: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260911-topic-rmi4_panel_follower-v1-0-c1b2cf1cdb62@oss.qualcomm.com>
 <20260911-topic-rmi4_panel_follower-v1-2-c1b2cf1cdb62@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-topic-rmi4_panel_follower-v1-2-c1b2cf1cdb62@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX01gcR0OQyYk4
 mQquHCbF9M/vzQ2lVr7N+h8ihqQzsxJ5rXPuM1qmDzh3hY8HrvH1anIYzq1qLINiL5kTlW0MX3A
 lrkB6aljTpPYMeT8BwSW3bCUoplS2Z2JzWXAiIhzIKm2YvAfNeJT1HbJaWkePXOo7ciG+9y5rL8
 wCzORH/v4HyoVHmF+/DZRzvnvnVOy1fTLUeo9+M2zzVhaL+IgrTSEcH/ALRzxx4ir4hK2zPpXEr
 p3ql8MdyTbvPiYyLWX8FnFfPHEjoBK7dtVGASXf+2VTgqdNuzKV0VY1hwriMaqje4KstxN1lMHc
 En3KFcvjDHFA/dfmIkpyiqHSSgP1YRcEkU6m6VXd3RgS1tc6DH+uGp5Mp1BImDG8UBXwRaX5VGM
 m++QGP6BpnqbJTn+96j3OcYZ9feKqzi6T6C8OEnM2FK5WbI52/8nffEer+e7L0yv8m35NApXyeT
 HaN2EgOxmMtk0RybDZQ==
X-Proofpoint-ORIG-GUID: RCsLice1mK7bqE01-Ln3gHDDzVnJzrYi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX5Pw7oKP39Ll3
 UYKdvy3G6EDJn5sLNtI+Dk5TGl1/+bQ1slt/buisE67spwf5mIqF7vtuZzFExWNGeQWma/7CfWG
 s97AqCrvPylanyrHQucICAB9oO7RMrI=
X-Proofpoint-GUID: RCsLice1mK7bqE01-Ln3gHDDzVnJzrYi
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af717d5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hBt2bvH4Q003rsbsdR0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130055

On 9/11/26 3:18 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Many RMI4 implementations are present on in-cell panels with very
> tight power sequencing requirements, normally handled by the DRM panel
> driver in Linux.
> 
> If that doesn't take place first, the integrated touchscreen IC refuses
> to work properly.
> 
> Add support for drm_panel_follower to take care of that dependency.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

It's been a while, since there has been no objections, can we go
forward with this patch? It would help us remove a DT bindings
violation in the qcom tree.

Konrad
