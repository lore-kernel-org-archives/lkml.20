Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0529D48FF81
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331816; cv=none; b=e22P9yC1p2DJ5dFcjTL8MyndAqVY/ZCik0Ze1hBoOY0AKUrhgbNM6xHsPCClWoZ6hGGPQMJun8kHfmapZ1aO+Ef+dveVjLBobku+zgr2Q1FxcghfJJuBME3ewpSo8YXHmYawI52Qky/JjcUfX44hm5wmqHU19a2FR5c4+l4FhWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331816; c=relaxed/simple;
	bh=zkw9Oy7OVJ3/+Ko/xqQatvs6D7hDS7htSf/ch08AmTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DAlUPyIv5Ene7UoL2zS5POpQcAA7kkqmvraBqWfhhmN2Nay1agEKiwUL7TArWXxiUIM5jn3fQGviItzk2/LGEY3q0fPaDHS5tAxLiahN8rZZwYXZ4eG6SHAcZGn42zvE1enQHtqRz4RRZptcctwEnbTbU8NUUys86Be5RkFDljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUdAgpas; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvX/0/1n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUdAgpas";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvX/0/1n"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YXcH208403
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRIuXhUt+6lCT0sXfT+fb9ye3Qdl9AA2OjOOHlqa1BI=; b=bUdAgpasPYQZvDcu
	ZCHKa0MXc28TOOGVymqJ29bxKleFzaiQ81G0vxCFlC4/8CLQ5c+6AgwJ0CGVFV0v
	cPLA0N4TQb9MqADLQiPgBpEPL4wJtHx09xI1CCTtwPgM13INaernryPLDUD9x8zS
	CPz33lBdkH4YeFI5FQ65tTdRnKpJFKxB5FRxR92mMj2BRRvRD/Z22nfUhnMr7PqO
	1T3zqc6clGRDciSeAj4i0HnJdVzacy/4lDTuCTDz8KX/g3MfRprl0J/sPaPJ9zYj
	Gu0MVjoiYVeCk9aQhcfGUPvCv3PY/KXmoKWKCIyosD6UaxLXF8msa4XKVGY4wEif
	wYGzUw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898u346-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-914324f9c0aso1617106d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331813; x=1790936613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRIuXhUt+6lCT0sXfT+fb9ye3Qdl9AA2OjOOHlqa1BI=;
        b=YvX/0/1n8O/TjIghI23eUo6jP7zGxyHydJUdH1wb7/zT5Sj+cBNBQUBldS+I8HF8FT
         mMzK6MsCr13WqcQP76u72vdTqVGh5FZmxJG5TdGEG3c14GnOIRBbqDiHPIPnEKG+rahw
         HuRH14qVEGHC4VUvS08L+y7oWc9sImrbil8h5tX23aWp7cQ02zywo8g9YPQmXe4yrHab
         mU777+1Q/MkVLOu5538r3geWgZ+m0AlX1a048oDNrF8j+H8D9xhOyG5lsgXHnf7BYFkT
         alqERz87c60ph3Nt+j7OyXPZPtMBMgKTI7SoOf4y4uDvMdqfxA9b12A0C/cp01WpVO90
         /ZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331813; x=1790936613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRIuXhUt+6lCT0sXfT+fb9ye3Qdl9AA2OjOOHlqa1BI=;
        b=M0rpFnbxvZZ+6OUE3lt2X77bsN+x95JIsc6LrNL0hYi0mCd7El/JafQpGD5bGvE25x
         3hEP9x1OFret3xTipvQ1NyE1PQHwY30gwC7/6eyX/K3TD1AWEZS8+XJAhii7CICbCNpL
         mZDg3mpw9eN1JyLmgsAT4vIEbZZ/MPyi9iR2w0feOVzJuV7OZ7LuDT5TZH9WSX2XdinG
         cAp54m2hgWjbi4RXwheFW2X2xTyOs8dpd0HSmu2SSjh+DTfxlptYCKI4tgRoxiT+v+Jm
         nxe34hvJ7EANufMjx+4/RN+7eeybnfTNk+9CjE2xXvNyGpL1REDRs5O3O1dkPRhJpoqy
         2F+A==
X-Forwarded-Encrypted: i=1; AKwUvBxETm09BMu5bPjrdAkShvk0VncgsTmmx+42b5vzcsBCnlTQ4smKKiulzoQnpkTWeaFl+Xc3ftgH+L5TeXU=@vger.kernel.org
X-Gm-Message-State: AFuF++lbQBJdQgbaztjJPTurHRcqfaPvFNrgQWjSZV+ZCWe+pPpOD+NA
	UcsoZ5h376fnc5FFKxl6vPYA9DwkrxSAL6mQsIx1MVTpAFcUcQAOTtscFFzHnhgm8Vvo6VuEQvq
	0r32Ri3xcAns8CkoXFK4W/o5Kv2xggE2Twl4fkqBjXpKJ1R4VCEY/40JJgSrKElgesqc=
X-Gm-Gg: AYBFou1AuWJvyDhmR05lAa5uSrifeoldegeepNXJFfu9mjf+AbzaplryML/ezsWSUkc
	ahVQWcRueCGIW17QqEdPVPzwlWoTSqznioOwRAXO2gL0zTczSi92/35V+O7RNxWH6FJLFQjGBzD
	LgrZI9UAuyvKQvy4LLZahvaxbVCOGrP7BXvko/eDQCinEcXILg7LWRttKjDSwOpk8Wt+7dxhOJo
	VYoQYXJGL7T61wgqhVX07hrfLyzW0kxTt+73qtFSsQKs6gvMh9Ttn7RbpcgSLdjVO9UnlxX+0s0
	CYnUySvzwfG/86diHadeOkdf2J+sJzuL4JgyvjT2d49EncyJEXI3Y0yikBP0F0dOzV8EubG0jUs
	3hTULzt3seYrElqp5Qiph6Q==
X-Received: by 2002:a05:6214:5199:b0:912:6000:e8da with SMTP id 6a1803df08f44-9142f6ac41fmr31577926d6.2.1790331812998;
        Fri, 25 Sep 2026 03:23:32 -0700 (PDT)
X-Received: by 2002:a05:6214:5199:b0:912:6000:e8da with SMTP id 6a1803df08f44-9142f6ac41fmr31577576d6.2.1790331812553;
        Fri, 25 Sep 2026 03:23:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5e09985sm852677a12.28.2026.09.25.03.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:23:31 -0700 (PDT)
Message-ID: <86891d60-4a30-4b01-a025-14afd40fb9d8@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:23:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: hawi: Fix PCIe IOMMU maps
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
 <20260925101309.3826038-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925101309.3826038-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX6PmdG1CwI1Tt
 y5puh3uaqB7kmx90Sq2aF8BNUGxMcxC3S4srhi0cImBSgo058/OMFlAnrp2VulbCYLO+XgulMO2
 +0kHjosI+1mk8PPAjpuhSDc0woGA63byE8DZTKQPt96M4lYvHslsAIuXuK5d3ozUCUSIdVnpnLH
 Y1AQ9KAFnmPAYPGawP+WT08MkA4i7K0iR6CYISZOaWlWtaKGPN43KX2DG/dXGOaLoedFgQjy2Ey
 rgzHB3KhhKPeKS5SPBkszc5qHe2qDeQ7gtRj1YgZ3DCwAPCpd/kDvGH3myrv+vzd5QmBFmVS7eA
 N12GBC3EXF/AR89OzcKgdomYagrgvWvdg5hK7hHdu7ZaMXPUZPngbULzm87SfPjw738AaavMHsi
 Wvl+o+UGyRLbwSas4H3GewvIksSoSLx6ODtgBw1hVdhxfP8pwQ1nrHd6hG9mrTXwcLDVk1I48eX
 /sEMktRuauCUnE9f+jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX5hoCdt2PW4Xx
 g+dga7FZPFApnD5siWJV3kJoJydmlOSD/b8TqFB/DH6579q6+U4d5Ob2SPmKrPDXKfGGaF1Y4bl
 uBTCzYLqVCus0tzn06T4Ap+sw0OWSIc=
X-Proofpoint-GUID: KL0ot8i2z7o_ZIppRIwjBgC5j3vMwlHX
X-Proofpoint-ORIG-GUID: KL0ot8i2z7o_ZIppRIwjBgC5j3vMwlHX
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab64ba6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3CKlJ7abimYK_f3-Io8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250041

On 9/25/26 12:13 PM, Mukesh Ojha wrote:
> apps_smmu defines #iommu-cells = <2>, requiring five cells per
> iommu-map tuple: rid-base, phandle, sid-base, sid-mask, and length.
> The pcie0 and pcie1 nodes specify only four cells and were omitting
> the mask field.
> 
> Add the missing 0x0 mask cell to both tuples in each PCIe node.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
