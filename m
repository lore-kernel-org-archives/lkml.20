Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498378;
	b=As2QqL01iKFVT8sFLXcSJXN2f5aIVBvixwRKmPB4q7Uf3o3MjuW4CVv+IDSj9EfJd4Cy
	 UMnQRd0KiShmdVX62B0ukVW33tF2jK7gc/SFEEVhDkfzKKgNlNpsa7aKkvhEzAVh7zuA+
	 m26tHC3dRKY1MOdCWmtjZrXK/w7p0EhTfuE0BblsAC3Z/w2t+JDl0oddRlh2/fC9XDQzt
	 9cWxfRSnOfvSAa+J0qX8MxIa8Ls7azuWRQUbN81mO+bfFlmPrLX1hT58p1biqISuBJXhE
	 GP1vCV1s70xTSOdEsgeTd8dFyDFyabzgd+UZupnvZ+8R/1m0oBEnP2CNYXZSeR5+iag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BJOjv0QJJ3XWhDU4ELZsbL/IE8xjRk1b9L5unQd/50k=;
	b=errfhyeDnzau5SnNz6Zp4IMWFlVR9WV8yaO2S+FnO22nuTLd97417Bt1LYwOQKczEu0v
	 OEoVikljJ5wH6LRF6HmZ1NWaEl8I/aA4pUHkfXDg6xuhAmcB9mTec3ol1i0dEg/d75yP4
	 BCZFhz+zbQPgQqRxFdC1je3jm9i+yZlLl8JJeBqOa/XqHqCKfq0dEDmnbbAgKp1onpnQ+
	 cj/cs+2hmHjPILoLonmwpHYoT1fJEVhw8F5ZinuY1n+oTlxR5xlOv355Hw2aVDLyOOJZ/
	 o0gnAzJnyWwEAOf2SuTKmQD7VTwm3XP2nhFyogcu1lFlqQVX12PxdK2GD6n0QIBE5lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C33PJyFX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J8yEIXMe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0867C606A329
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0867C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C33PJyFX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J8yEIXMe
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxHgu1292864
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJOjv0QJJ3XWhDU4ELZsbL/IE8xjRk1b9L5unQd/50k=; b=C33PJyFXKdK1FMZt
	cvgY4I0KNuM3qVkNNxWXg/gEEHdDO4Yr13qMn7p4LfYEQKfLQ03XqvjFnlc1htNR
	zjEbmYlK6kwlx/5nOtquzjvPtp6YR+O8ulYAB+V+UaTK0NLrQ2U3rI0wgDuls8aS
	UyFxcm8RO+hxwDy4Q4gELwfjzS6BknjAsJ+wq3KZqGwMHz1f7rpALSjoUMzbtf38
	hSO3IfWGWpqQE8rGmCev3ZeV++j5U1Ca50+wS+J5AR55FnxbAOLaw1A+29LYsNbf
	sG8wRUHs2CUe0Aj51KLhINdt+LST1sVL4gdwWeEA7Jc1VUkRg2QICEgIVuGhO55+
	yetTig==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2d0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:12:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc081f3066so89631137.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498376; x=1793103176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJOjv0QJJ3XWhDU4ELZsbL/IE8xjRk1b9L5unQd/50k=;
        b=J8yEIXMeUleKzjnM5hqbQRlXENC43WTKbwDqArQ8gs5Oya0gXcm/pXx3IpfWPuYzUX
         ULFfdTvY1b3Wa0w6H8l7jDEZJg8alrCMJCajW93sgUYjXDOcvhw+VVtJWpLdgBWPVzWT
         4jv+q8gLMuw5imjeF+7MxJpu7oTeUhQLQTBps0TPbq6UeUuQ1f/pLpAv2SL2k8XbjRuF
         zbtocQTKKCjj4WEhobd/+m74Cg6KQlhm1nuQgT/bd2xhVd1/pq0PYW6RXyB1RgYh5rG5
         l52++vFXD+rC0JUI+6ftabZahJS3wT+ybnyIJ+iOxwzEZqIjtg8kh4f6L6FsiX2I5eMX
         Tthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498376; x=1793103176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJOjv0QJJ3XWhDU4ELZsbL/IE8xjRk1b9L5unQd/50k=;
        b=a6XeTCvTPjSjRSigKTkvMBejUdikAtupkHMlveIq+H7HpF+nrIxUTLTMfk2NUbI2Wx
         mr++wHLe3Nvc/D4W9eS+GbOtLAQ8sTZ+xX5clFNqgEO1w3Kc6G78r44nP2qZ84YkkFIS
         6ZO9nvcIvyefH2Z2aRWYtHraccw6EI64gByzwGd/OglBp3ddfm3FRqC4V3JQAY7lqVQd
         PZIuKkqY51bEOkwrOmnC0H1OlNfT+dHpd+PwQoda+9dB/rnqi2itpM5J3ArAghHGFpbN
         zWd3wH+8Xv7JBWP4XS5/cQDVmROLSbvo7PfCltSltzly+joH04nZLuGZw6lPTvM/wStb
         8FtQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/D4IHY2C3l0f3ShS+ocN2yDHqRebAw98xMfaLgrzdVdAH67K2W6DwCLg+qyiIFDF5GrNSNzcba/4t+SU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbVlCrnNPta5ETAW8+5z/pPK1unmPnlrFZ7O1inQMTMZRBDUpT
	kMxZM99VggyHCnpsdCy/BJ96xlKxXC3NBItq+nqFwGv2ripEIQp6Cfx5IXhE6gJFxJZouAk2FvK
	rZA51hNkBBNic8J/2HM3Fk0qpQipA/oFSDY9hB4eOSIltTGCJU63Z/eHp35QPCmqdkPo=
X-Gm-Gg: AYBFou0vNIcSMAFxDDlDnQt5NNEKHMV3tu2mtJIVWMvOWP5WOuIDMuvY5gJLmlvF4fc
	FDMj4ElrOAqNGkNMKRgxqWlSxb2KUkTmfCu8E5vTsQThIpW+EneLxkmzxKEF5tQycpCsmyUQZ7A
	mMCFROp+xEu+wjFlqg6SGyrG+2mMDP2rCLKCoEhHKgX/2ARX5wGCcYFhj1t2l+pf9dX8LZTPalo
	yELL69V/ehazS6M9X0DCMT355tq62hgQYJ8rntEEZfGuofqP7MlOTRXj2cJDP3Fe2qnGPBUR0sg
	2zFkxEKQd5qx5ocQQMrUffvjhbnfP5ClGAEgo/4W9M8W4wupvOEV8/FgYyMJqDOyWJoAb181plI
	ArAjnYJAaCiw2LZvtxpfmjw==
X-Received: by 2002:a05:6102:50a1:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7cc369efc05mr2105927137.3.1792498376118;
        Tue, 20 Oct 2026 05:12:56 -0700 (PDT)
X-Received: by 2002:a05:6102:50a1:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7cc369efc05mr2105918137.3.1792498375619;
        Tue, 20 Oct 2026 05:12:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9db0sm5256665a12.33.2026.10.20.05.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:12:54 -0700 (PDT)
Message-ID: <c600cc5c-40cc-4640-b032-a87dcec284f1@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:12:51 +0200
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
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: lemans: Move platform resources
 into lemans-embedded.dtsi
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uU7ne2LMN1xLBou-5w4uDoygptOH8fS1
X-Proofpoint-ORIG-GUID: uU7ne2LMN1xLBou-5w4uDoygptOH8fS1
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad75ac9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bWZ10KAKr9BnBMAnnq0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfXwoqQxXSeuuT3
 S6XT3R1DVQi1t+h83PRQxRTOsXba7KoJojKP4QiMoCmOkBLxZWMbjFR7ZWmyUj0yUIvEOy37GLr
 d2fV6ya8zUDQx/XjE+7eNMNzgTJ7BwqPDmOyROYmFVmiy86V8hVTw3pYJLccYWYVIFBIHrapjl4
 DdYu7d9Wvp8/XcWooPHyfU6lSaF0i3Zw+jOL7il1GxDLT8Hmhe3jTeM8y/6cZ6hrk09EcqgVR8n
 EFwj3T+LfUJLb4+pAhz/k/r3iv2BqY/uAZfGB32ZOjzl5fhDwm3VmLwqZUaXKBkexhQ9FFbarw5
 7j1+amKpf+PGYoF6qUjFawYGuuxmoi8vDRcndACXCtOOrJ++sBZsNJKuAvyQhzOAkYO5QAb+aw1
 kicwwpaEzAWSJCq37rq1xTxROtOUTrwlpSItlROPXL3Ept7dlOOJgzQo/3foWiwmC8EHzZD49oY
 lu5XQH6rGlbDk+zPHlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX/KThNeQMgL1s
 zQKMh//TrD+E1SQpSe/yZm+x++g8De9vgRQbZBs6LHMsqc3cL8qblHH12db6CYnvlseTIetz178
 4MJQqsdmqanPnYZZTiuKF1Z1maWnVVY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200048

On 10/15/26 4:37 AM, Shawn Guo wrote:
> Devicetree lemans-embedded.dtsi was created for Lemans Embedded variant
> where platform resource like clocks, regulator, interconnects, pinctrls
> and PHYs are managed by Linux. Move them from lemans.dtsi to
> lemans-embedded.dtsi, so that lemans.dtsi could be used by GearVM
> variant.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
