Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835455;
	b=XbbfSjdRVcRus/FkH3u0CN3aB6afGVqsWCXJtF0il7SXV6jRerfmeMbAdQ+1FfbZqTOH
	 wdBGohPWxQKaU+DxVaWn5a+RfVj1Cbq5qt4LWe456A5aNkJm4NbKgtsuiSjyk3bosZSKn
	 tN2Xdplyl2voF64qvsutcMlsF/0qOIcnyCxhaSsA6yy1kVuci4S4oHi2EFEraF2F9CJr2
	 Um1qKb9Cx+7Cin/88ec0Eew3550e0cO3TuC5HwGZ+oreTlgIuPehi0cJKU6yBZFA5N9y4
	 ufvCD6Si30D4VBWBun91PcXu6K8sVED5aPNJYeW3LdHS3hkZBqBf1pyrsdA2LUM57bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6GT+ctwQTYDljqzVdZFgORZTpXEykaknfRW43itVU2g=;
	b=ns0EiA644+2uKwp5qXeErSi5H5rnFxb/dlzZhaTG4ODT0bt3/66HkjHVBl4A3EuYiJV3
	 PXoY+JFPjpzVCH4nSf4hXz/XH72OWjkZyv6rdUxt3x5NKoHuN9y4suqElXoYooDSThxx3
	 wd7UyFXO3zTWZX8Ey4StWPRKf5FhcwoWaGqkKYSoGsoQ7StdroJmg+ISHHB7MmQsoUjYv
	 HXUqybkm8pRwqIGYZnojr3iU/fXALSbBfgDAYgiAT6+QBWz9qIgUqz4P1VD+qt0l6uweB
	 TtKY34MR36dbhPksJ5roy7OAq1ZFNsRRpuZUQioWS7tsPxpGJIXCJGDWWN3HlL5VGcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUmLm6w0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFdBtd+7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AFD606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1AFD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUmLm6w0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFdBtd+7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0oFf3770443
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GT+ctwQTYDljqzVdZFgORZTpXEykaknfRW43itVU2g=; b=mUmLm6w0uxqesYPS
	Ycl28Zbno1cCOzo8OGx4VA4nr5um2NcJiafzvsEP3xlK7/YjonvbDzhOo9OyM0eX
	4KyKj98LuzTNgkadTttSMN8laKVHt15hb2coRwewEluUR+nyAsiekLT9bdaVZGkC
	K5972To9wkAUEynnRlGBguxMNDBWsY9l2ceSt22+9Y5CbLtViVxibGMNHC/nS9Ru
	yjowr4U6qkXQE2bTOUeTf8MmLeHTWHjFHA8qasMqevDJ17WsD7pAgYT37K7yad8W
	XoqO21cVjsoscDSx9VPP52ONW1JsmirPbG4pdXw5bHKAZvcOr8qdqPgSb6J6zamY
	yuK9Og==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ggtjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:24:13 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-862bdb93612so1441236a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835453; x=1795440253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GT+ctwQTYDljqzVdZFgORZTpXEykaknfRW43itVU2g=;
        b=hFdBtd+7kwjToKw0YZdJCP+sQULKvCtS9lqPoKCD15cKtWsymynBbCl2v+/ZtEvyVf
         qNaKKXCh64Xqm9YtCeKR/q9dsrJlbUUJ+K/apcnJppXF7LpL+O0SuspRc3GaiPOUj2Iz
         HdXOg0tIWqmroFQWKtIT3uoN3XAWHT/PDx8Y3/MhJtVwTN4lH6FX+aIHg6NPfPgEjLqL
         qX6fEkEl2QdI2zyNJbvlXJ0++qNdGSoVZqegje1XD9MDtWV2Ao89R4rnUJUUe2a8St8X
         saYV3YMRZ6Ozrb1H2ly/CT8wgedNOs2caMjtKgqJOSc+H14izLMny0lhyKYSfzxuo9dW
         qsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835453; x=1795440253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GT+ctwQTYDljqzVdZFgORZTpXEykaknfRW43itVU2g=;
        b=ZS1Fd4L26J0WQ4y2/rMrohF3leXz7azRSomiPaOtdoN4JlF8FvfesxgEGTrCvOFcCZ
         xowf8Nz1ahoMLbDeuPG2JcwhGxDbdf+PtUxH2q4pfj/gwOKrcrjzHddZGM+t76sw+MsR
         ndyRVl8oZ7Uca3NEzPQ2qg2INFxfGgtwksHib1kfkjoP8NDR9QG7rs2PY6+ACdPi2UV3
         nco4abYkIgdS+X+5EM5PDFsd+4kpmZczmo+vFBiqiEBcCEDZwoU8VzjyUY3c8QAXSEZO
         /eeUGtBgYbUiSL/3SF2KGTlla7zYOueM3loBawf1djtAB/i7EEavyO2DC975HIi23EEJ
         VYEg==
X-Forwarded-Encrypted: i=1; AL+hErFBtbMNgLoTHS316HaTd0CBSc79jIKNiQSJT9XbD1ISEYV9P+3AbKhaIF3Zw/fiB1tF9JIUEXvQ9rZQPhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+COCwOweBSnXe5w+jniailO5ElnGqK8TuRSww2q6j76Ox0EO+q
	vI79wsMnL5nSPR6+UYtoarBUrcv9uf3dxdn/O2r00UqRqJ2GjOONmfda8U4t5mIhci+hJWc6XN/
	bYCDqekVKGUjLumTWGlZFMTjE7+DGi50NXq2UbJbYehr7EjUTVa3LrbG/wfl1aIoTY+Y=
X-Gm-Gg: AYBFou0OAzeX89MTyDl+A+zWoVV4RUD3fdME5vUMoxHqfO9+CTqMMcyGZqiRRygywWy
	6wc1wkdoMJv8/akwf1ywCmtY3GplXMJiCRd5m4d8eO/A29tKTdGdZxSYvfgLRZlK+J/+ed60S9/
	fQ7nAMf8lf7WNCXXhdls8wGgc+vg2ukTB3Z5xJ/kynmAZ5EZeYDFz7b2CPM6iOYiz2gB7JCHURl
	SmoXWBPLiFMwEp6KOyvGpOqO4yTsn7j8Q4RfJdHvoM29YfUKnumN30Sz6y9JYPfIwYI8d+YdTSx
	npZRRpO89WIhY7+df7CcMHlazYaGSg47uDV91eWi5JhBlU55ol9eRe1WueuPergU6J0iMGmk1+S
	+cSFEGT4yRI7AakbxZxWZn5igD/jaRUXyh9WbL5PIjTy3AVhNTxN3Y1PBngVqj2GCYsbOxJe8mV
	2pQrsKjA==
X-Received: by 2002:a05:6830:4ac2:b0:839:c62a:1661 with SMTP id 46e09a7af769-861526771ecmr12512628a34.7.1794835453181;
        Mon, 16 Nov 2026 05:24:13 -0800 (PST)
X-Received: by 2002:a05:6830:4ac2:b0:839:c62a:1661 with SMTP id 46e09a7af769-861526771ecmr12512599a34.7.1794835452702;
        Mon, 16 Nov 2026 05:24:12 -0800 (PST)
Received: from [10.219.50.182] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm3095156a34.13.2026.11.16.05.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 05:24:12 -0800 (PST)
Message-ID: <52890e46-95e8-4bc4-b2f2-03aa059b59a2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:54:06 +0530
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
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio
 DAI link
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
 <e24d7d8c-ee7a-4a83-8daa-4805a7920f44@oss.qualcomm.com>
Content-Language: en-US
From: Rohith Chiluka <rohith.chiluka@oss.qualcomm.com>
In-Reply-To: <e24d7d8c-ee7a-4a83-8daa-4805a7920f44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MyBTYWx0ZWRfXxaRs+nftXcZ+
 b8TZuFa8DjDkwLs6adMbejc/wd/5HDR4cC/MDXLq1ThAjL1zlp7QGGEtvP6kY9v0V4IVJ13DlMF
 acYx01TOelrCCKMkSKrnxqqOmTOrO769mvhDyyeIV/eYctYr65r5ZqQITyl0OEBQwOuXlnL5QKR
 cxYW7xYx8PO86djgJawp9IPLFwcCSi7MpNGVWBXVrGH9c1xhfNUT6y1RJ83LyDg6NQO8o3B0dbK
 u4NMlfTh34aoX9lF9xboW7xMpKVe/0Qahrkm+C2vRZZgYMpy/HyOtnkwT7EAmZIx0iujj3aAlgg
 wIndMgL3/4UBBrxhQdZqRYAhffrB8hHECNxYO8VknSvP3uwN3NqgLTKS/tl47O2tvRzzSM6VLYr
 xSj+I3T+akTu+rUYuyfD0WkWV1YWQIxUfY8+QHd8aDUHuUdk8JqhaOAqAFPqnRInjTb9gOhP5NW
 zA4g3oeFc5Vf1levSqw==
X-Proofpoint-GUID: G-W6KiKN5AGUEpejUieG2ADMnRCCy1vQ
X-Proofpoint-ORIG-GUID: G-W6KiKN5AGUEpejUieG2ADMnRCCy1vQ
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afb03fd cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QTr3mE0PPTBUZRDae74A:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MyBTYWx0ZWRfXy0dOqupr6p6j
 9qwXH4DR0mBSJrSmafkZHAd/88HdBaOgou4tRpj4+1+97COFZD0X96GgkFjkd53iIyAp1wVIwmP
 GJTFkwEP5Dv6diAosf4JPX1dCXR3Cvs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160053


On 11/5/2026 5:37 PM, Konrad Dybcio wrote:
>> Add a DAI link for the DisplayPort RX path so that audio can be
>> routed over DisplayPort on glymur-crd. The link wires up the
>> DISPLAY_PORT_RX_1 backend of the q6apm ADSP to the mdss_dp1
>> controller, with q6apm providing the platform (DMA) component.
> Why do you think we should only have audio on dp1?

This patch series targets |mdss_dp1| exclusively, so |DISPLAY_PORT_RX_1| 
is used here. Support for |mdss_dp0| (and consequently 
|DISPLAY_PORT_RX_0|) is planned as a separate patch series to keep the 
changes scoped and easier to review.

Regards
Rohith Chiluka

