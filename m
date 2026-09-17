Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955944CDDE0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658395; cv=none; b=eZd/jf9bcKwXrnD5YTOkE0ZnmgA7Gl6Qu9Q3KCHpB+Tsl6B8ZSrUw256NDFxhJj9oirMbXHmLja+wu62xMaH31Uvr/bNLO3LS3YcYROXvH0XnZSVaKxvSAz9bH6SpkuZ9DkX5sEtepHRZCfQZM9OyFpqWvZVxsAkMwHyUwe8yvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658395; c=relaxed/simple;
	bh=zOMmC06OkIP74H7DFOabF+/thO4Pnpmshs6ryvpXMFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5zOvtBZ3zRmR8sqI0mA1zI7iIQlmbt5HbHtDZjP2uAGyU6wPURLYKgPwaw2LQg07MzSC2E3zvHHauHjy68RG5X5xVbTnASO8Lh3GwS2Hlr4KIY6u69isatp6CNtFK44Qy24sULn06iHagCpPQoMyIWl7y1WHqPZ3Njk+6p69mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nsATsM6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aY/NkdEm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nsATsM6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aY/NkdEm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiXGp2974916
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3LkA790cRq2TwLYlSBrEjEfJ
	DvHMNuVtDFarizUSwDA=; b=nsATsM6E2sw/hM9M6Uj9JQrrnA52VAs0eevnWhgw
	WOaDaaRawKAAsSSPylfA7/eKVmLlnhhWd5ONxJEQaqeAdC8H727mUIhxQbtKlg4w
	bh2cKXc4KDyWjVXmI0oVvIOsubKOyjBmEm+F7+33W0fHt7/Ghzk564Rt9Cetp0o5
	XlfkksAi6H7JFCwaABTetQbNoPYKeTPyokXuliexlnf10fPlKaPmuOY7wCcVKXU9
	4dMdybKqontNW0AQCS4Wu69XpQrQeShueRSs6HUgZfQiDzzg5hgV6tDcNoHnx/mx
	tgZbI3a7CaQod6g3QmmW4MwxbU4UDCGGk3PkvVd89PnROw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6hnf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:19:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104ba8bf51so25737176d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658386; x=1790263186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3LkA790cRq2TwLYlSBrEjEfJDvHMNuVtDFarizUSwDA=;
        b=aY/NkdEmRniAWwQT2aC0khzqxG+z2fPXjre4EzgbckTmzsPJ/2qekEQHHqtm3uybcp
         wox13xTBpyu0C3AfjlwZB2t9nghAC721M5eajUE9BNzkl1k3Pw6aq4YYDFoOQbj8bcCy
         cpL0Ji6oZc62lZuKUPXGrcytW8Bz8toxn+vpjflh9y1G2o0V4YrT76Le5xN6mLlmIOT9
         Ek8Rc3KqF63yGNkp/HprISSo+KcanjKl0v19YqXKEm+cAN1xRJxsg554U8gSQtIQz1Ae
         bGFIf8yw/DPu0dp83B82OkzsimU8QXs4oahQc5Ppsz7Q/b1t2i8MATooAwA6fe5DtLhv
         rgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658386; x=1790263186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LkA790cRq2TwLYlSBrEjEfJDvHMNuVtDFarizUSwDA=;
        b=edJ1U8RjRBCE73XbM3Qlq9+WSX75futORhj7nTAxAS1JFSptVIHlByIqNLJwPoFawi
         2xm679xU1z1XT+BhQDPodPhAIcXXeNFmUiQj1f9cC18hsukxmmhGthH5KALeDf27MpYy
         TcPocay79bsD28xxZ2zWV1gpGmuTkcqAfyFl2AYVGzMhlNegEsWUoIcnQmM9C5AC1C4B
         ljbtdBrPOC7hcDTN8mTyYL52WutT/vk9cl8rFul1j2Ul/o8KUCIgDZMSosieJq3Nqlpg
         hNA8ADwpTkWfCsqGkM4LR0mZsd761lBKmPu22puRHn/BU9mKsRqeexF7dYHSiK4wDuBD
         y5BA==
X-Forwarded-Encrypted: i=1; AKwUvByof1Uin8QdIAMB2ri4B2tDfV2w0umoq2tv2jEtEIwFGgYbhL3Ipw3IOdUemEPfcpNcM2IZTzVy8jzZSZM=@vger.kernel.org
X-Gm-Message-State: AFuF++k09w0n76ZFpDYpAC4Wzhyf9MoEogHJFkcc2XTx8Q69dDVDzrNo
	270Yuj2l8wNdnkff3K8tHtRGx9oA5DEo4L8q4tDaFkewjEbBm6EemTtHm9o4VSClE+VHJFhKuPo
	aCSlMuuPqw5V4Q7VeTU2Mvn424xUAw1rSR+bF3+UU6OOmwvPRA7q0DE+jvUD/t9dzNMo=
X-Gm-Gg: AYBFou00UeQbCZnRB9YBroJpXKpmyVUKlX5MoZBnKyzirH5LaII7p1gUfXvW7fEQrh/
	WC6bnBEALBn0jUz80lUpWzb72rFkcx8EsJsx3xSJ1CYjgMplpeYnbJI/LaAxkLQIE5mbmsEnsqu
	C8Y0tsAm6otmUXJNiPV9JTBrBYeFBxdF0zcQD3YZzcvm/GDW5ZkjRcSyiiAYN5Z7yvXV0988c04
	b3I8RgiwmH19Z9whPXZCarpZxYzammv2q2G0v4SHddIz9KmxeX5oJXJc0uY6oosNFfOpKr0hWSk
	ZCTWVs5KncFSwqjQ9DW2kfwkcJ9DvcNc8KK7iWESw0OnVn7PmTbTcYFhvLWAOTnapEUFFH/RYo1
	zUwjXLqe1CnS8SUA=
X-Received: by 2002:a05:6214:daa:b0:912:517b:84e with SMTP id 6a1803df08f44-912517b0a5amr13032186d6.50.1789658385927;
        Thu, 17 Sep 2026 08:19:45 -0700 (PDT)
X-Received: by 2002:a05:6214:daa:b0:912:517b:84e with SMTP id 6a1803df08f44-912517b0a5amr13031506d6.50.1789658385382;
        Thu, 17 Sep 2026 08:19:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm16359336f8f.35.2026.09.17.08.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:19:44 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:19:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/15] arm64: dts: qcom: sm8150: Move PCIe phy and
 GPIOs to root port node
Message-ID: <nv6q5d26sreeh5psbtvfcodqfrcdnck3ramzsum4m7x3hop6pk@eoq2cun5jhlp>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-GUID: sJe34lgJVA2ACviyT1hA4l0ALDBrz1LU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX/rcXRjZqBdqJ
 luxMlxPsZxyeUwOVT8e3z/d0YGEQ9gMv3E/Pwpj/fyQqJbCSZSdgNqz0I4EbJ7wV3Y+P3xtodLM
 BSk8QwxKUlUkQ7uSG8rm+rA65vZv/JhhGnxVwL+dW5XzgBCKGiFb8LHnCsfKcEhaA0zECDYtQb9
 j7VRyfIDAcAqYE0yudCE350YpdawD5lRi4kwWiZzuwXAksfNHTiz2QYe0ByJiaTOnc/kMS4XyB6
 9rSuSOvzoMtHKb9b30pFC1yWULnGyIzvQvP/wWn+50T3kt88gRjrO5zHFus/8U9NCG1vsZlt65x
 Aisa3EgMnhmcm6p0SSZe4UaM35c4UJN79C/2kkvMpTNyKucVYaDaAsS/piESNwF9qb7mVUwqUjs
 rZ4Rxm5yBHS3rGbtsBfJ9j0sPGLrdZKgq+ZUnMcptMwtzxtyF/mPMcD/HatwOdF8YGVyp4ZJX05
 wlGXsiJLR70e8tqi9PQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX0pOHd7YAF8F7
 mU4iA25VBckLM1RrmxacZoEob2qL5GRsC5hRWkHQUnVAiCEApp0Zvjg8URMrndr+kt3AFbJvKxt
 5JNJAyTxlCutkOtm2DuYNgBKshS5kUE=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aac0513 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: sJe34lgJVA2ACviyT1hA4l0ALDBrz1LU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170217

On 26-09-17 17:55:21, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to pcie0_port0 and pcie1_port0, adding labels to
> these nodes to allow board-level overrides, and renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
