Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631448;
	b=32GUyAdp9UYz3pLtGBVLAaC+sCo4mJcfzfVomcZ4XooSD/xjGexrbY1wzzMr+rVUB2dI
	 I2RjCt3sq4d3al8dJnDETcgAiBSjZcMmpXwWE+OnxnhE+Z0ABqlem7TKLLHH7xGZOPeO7
	 F/PfBfaOl4AxdPeuYq+A/ZhKqVT+mYHocRFtt1M+6L7KUiu8N/bpEERpW7tqRJ+j2cdSX
	 ZMK5++kWOC0mTaQ4BkhHZEOXMEnQb1D7dLSu7H0pf2ShzsuZwBNv1Jb4MgyAcmcUK6ugL
	 ESI1BvJJFxMX6Duns+L3b+cbvy9JIAs1sTG2zV7ApfoVax4BSe7l9wjVB3DRbo+sa4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JXR36f4oB+4j0+bk1Hu9kxNOzkpgp6U0kS7jZZ2UGrk=;
	b=ZKi3cDaBC22yNB6ZF/DPy/EuplxrAGCvKssYfOvx6fxvHfAQbX7Hdu/e5YPWkmXiEzaP
	 gq54Bzfp/IFPFyiix27IXAnYCAxhoMg5e3x48nOMlUdLMRS9Udj3H4KJfMgDuo2GQn9HO
	 ie9ZSAxFUN0UzDVH7rzwlFzDF0oQYMNlknkNHPDXSd7A9iOz1PX0EBcbTGuNn386HWE9K
	 U4aE13yU+yfiAicwUf7OM5AXOOQKXyv0H6ZgCNuaX2O60GmU05+UkcxLSYO6YLVrL+Y7M
	 dFKhl0zM4ewD/Ayj/s0laQbwhJ3GJavED5n9N9fID/ubZMsmwdP7w8w6mSmFn9Jflkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfEndfI5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PFn22shS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED46606A5AD
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED46606A5AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfEndfI5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PFn22shS
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpPPw2449037
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXR36f4oB+4j0+bk1Hu9kxNOzkpgp6U0kS7jZZ2UGrk=; b=BfEndfI5s7N7Rjhl
	j2Fr/oOFAWDZ9Jx/C08rPHE1OZ/BmyZR5fEGzhxB1/uqA3ZbSS5Uz07mg0C+WARn
	pjTVEFL8kBQsuColh2trHt4TMn7G4onxO8TjiY9mCpXHZoijzRNC24kwfq0IPC01
	CbTkdW+RLXEkgeijXRNPYCiXHllsY3k8eeO9EPghueJKExI2hhIbAXPgoWKXhrum
	jg6r6JWXb4W7uqP2YnK2QD71LqSRjJ95OsktLOJ6qwbLci1TBBlXsRgG5qnNUkUh
	N9nCkKQyw5qPF3qXZCClq6YGef8Kgc3HqS1ZpkJRaU+PxZcyvK8Jv0nlVw0178Uy
	DLbv7A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4j7ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:57:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cba2460f8fso109010137.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631447; x=1794236247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXR36f4oB+4j0+bk1Hu9kxNOzkpgp6U0kS7jZZ2UGrk=;
        b=PFn22shScAkEWkTyecd96WL6oKAfoTF3/koFnFMB4IsmJJ4NXOsFVOu+6Rp94liBcP
         Z382GclK+fSt1A9kfMDlVdFYQbDxG3tkEXPbFBc/oIgryGF/VPYEFt3aY4nrQa99wnVP
         fgMvn8jZq2tJwhm4VLJ5jV99smhlXI6M2k6WfSKZiRzZKwvUZCdnvx8yq5kh5wYKetDH
         Lwwt12G3kUhhw49RqBfecok/UgLTMAzVDObgdC4tv60oy8K1KZJnlRnv09DTj6cm0PO9
         E6AfLhELMU84l9IzDpNSnRtfazs2ujjVAzT2rPUbOhfbqSes3tByDxZRD2yqyYG2mKN2
         5nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631447; x=1794236247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXR36f4oB+4j0+bk1Hu9kxNOzkpgp6U0kS7jZZ2UGrk=;
        b=f6HvDcmUAjO5tiIxistFoEWihm6GB/QDyfLvctktg60JGaLO43dOMQyQbAlcUaROKU
         Bh5Hz+mhvpkGFeMHKxlG1g4seqjrBN+KfEWYpEewoCH9TBIiLQcZKMjAI6tz3QazeUIj
         rxQmvl1/c71/fPuxbGBvxxcBXhPs5QA3ElD30+B/0j0kx+qUuUAiIJZw8T4Uod19m92V
         6wnU7aqRRlXRhJdDLCg44jciNxNapnUmGArNS1kiS+LRp5VKYUQjTWnJ0GLoS996h/B5
         6th24Pgf3Ix58qrgkxQLzNufttZuxRmoegOeXnL4jt1KAseZbAvCs9rd85R36cYtm3oK
         1ExQ==
X-Forwarded-Encrypted: i=1; AKwUvBz48c2nCiSzDdu3bvgNYbQL5AvOELafoYF8iUsPh3fl8tMiausaaOmVg2XofrxEsSJIKVtJiih1g/D5ZsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BS5lpKSkOWgBa4G4mGQFj+EuV+CBg8wzBbDj1rMBQDubTz9Im
	qo92+SZd9hfvqUeE7OOTXg1S/xSSXrxbWjZ36wNohBpcSrPwU31J+PGrIMMbCD/uu7hhABftkdl
	EsflihLUgjuALqeF4H0zNKtmM1ExpUuzkavF7TjogJw7VluGdkjJTU5jh+I7PqZicor4=
X-Gm-Gg: AYBFou37xMqp3r4gLnV/TVjsHwKtq6Pax2sirR+a/poTC42cc3t3iJ2NjjcZhqby/2i
	BURYF7uS8MgohteX0kWatK1m2p0ABohBUCMY/exV5aTr+jzcMfcTJf6oJSoiecj8A9aHH7hdk6S
	eCxrOGq8jYHByNkhPLd4ce2aJxCnLNI6bXxU9075UdGm1hpoFc94If3yA/fo+et0atxkj6CiOiO
	Jk2iO7vujRB8qJnlQtJrf1dLTkDR4KS3W6rhyjqmHhpHrn7W7VA10J0Cf2j0d+ayZm855Z+dPnW
	x4kw1TnNA2k/dQQEyeJFlLJBYXeRJzjXAIVqgO2q/HBDH0cUeTlVrHfN8SsPar9UxN9pl7qAVAa
	7GNKHF0QxI3BbLTD4j1JYmazU+/1SA3fNR2KxgUJJu+zXPSKSQhRbQQtm5P5vZRkA59KvLg==
X-Received: by 2002:a05:6102:a193:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d0724f26f2mr3612428137.0.1793631446593;
        Mon, 02 Nov 2026 06:57:26 -0800 (PST)
X-Received: by 2002:a05:6102:a193:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d0724f26f2mr3612414137.0.1793631446121;
        Mon, 02 Nov 2026 06:57:26 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec91e2f2sm3411988a12.0.2026.11.02.06.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:57:24 -0800 (PST)
Message-ID: <e1657c34-201e-45f9-909e-29e536c4f616@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:57:21 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add EL2 overlay for
 hamoa-advantech-som-db5830
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
References: <20261029-come_kvm-v1-1-576afbde32c4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-come_kvm-v1-1-576afbde32c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9pLgagSpuDEai1Jtz-CmbjHaSz_prc_A
X-Proofpoint-GUID: 9pLgagSpuDEai1Jtz-CmbjHaSz_prc_A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfXz3AkREHn9QUE
 MsvqFz+6IfA0d/w8U7AU+5HnabL/rrkuJRHg9DEOR5lsz8qiYNbOqX2CdDZzR+CT4WMfYdpFfMO
 m4ninOIUgECemMXQvrHON6EBxRweaKs=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8a4d7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FdHCPVNKWVIqwBdtxFIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX7NdOyVCMopWL
 7n505l80JziChXCKwY/vqJVdncpTkn7dRnMdq1ToK1HPDI1F114l53wF1wSNwoB+LZmBZO+n2zF
 rOZQlvYEyk4D8zGzGpic362MQNlBictt7PNrSP9Kf4NmbPK06WtD8bc4c/iyNOE2vPhXhFiA+9q
 nzwwrzNPr+VCvSOwFv6bzM0HTWhq8Hdv7mAn7ipWFXhYCvTdQ8eWXXoALuBaKDhch9Jl8sN/DRW
 R453Rc+ZWclhULWbD/MJ+dswRvbsUXHzKlns0+I9WOmJ3v2du7vjmC7V5utrYKB2/x/Mlinwv8Q
 Ii2n2i+o3+61FWtT3BooOi1OPJg1HVKPZUJwohDNcNzNWK2HCstTqrTmZoB5T2HDViPsAvfLuJ6
 duLeDeO41p2OvoecHtPyDumBKUqMt4W2ZOV9dnBQuIW+8nYvDXdEECz3d3AWj3pjFY3R+RPZ3uM
 RbhWw1f/oEX0bo+JT1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On 10/29/26 8:55 AM, Yuanjie Yang wrote:
> Add support for building an EL2 combined DTB for the
> hamoa-advantech-som-db5830 in the Qualcomm DTS Makefile.
> 
> The new hamoa-advantech-som-db5830-el2.dtb is generated by combining
> the base hamoa-advantech-som-db5830.dtb with the x1-el2.dtbo overlay,
> enabling EL2-specific configurations required by the platform.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
