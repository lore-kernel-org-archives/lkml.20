Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CDC3469EE
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587150; cv=none; b=rId8cq8raOqMElANTb/Wu9wwcwSAaP3wk6avNnK2ZH0f7ZlCoi3LYKS+zaoxO7lcrnt4W375RgD+3CDrL6QWcplDDkFCm6i6dutdEkZ4TfrPLbtxPeNkHzK9GAzKu9Kn8UblguExvw2uJcOxjeKKrpdjUXrvnjwDc2RY81vEXVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587150; c=relaxed/simple;
	bh=V7DMQm1HfmyW+rSb8H7jkVdhFD+25OFon4uY7cjC+dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSAzk5ROMkMjS15avTu5lqscOjOujm2wvXBzKTpNl8vv3g8pTUJ3io6uFohikDzctmJ+cFJ67MiefxR3+6BElQEzHytyup/hY8+J51hwfmKLFKj8XOJSlmRn6gvkbQDVypSsCsE6oophoUhqO+7qEE3w7B3V8HHk4++jYglY8Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lb794P8I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dk+w25KB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lb794P8I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dk+w25KB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6854q8OW1436095
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 05:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AFrExlz4GMAX4ru7ZKdbL+nW
	MkWlCx4pgO+xZDaWALU=; b=Lb794P8IZIRKWlRjXlnBMXCbiItCuDywJfhA0Tqu
	/NG6N8VXIb1atXMzAu+qqfAiUb3Cbp9xu1TKNGu9T0/tjwc6DspQn7lOzl1M9mbq
	ucxfQ7lOMFAHvGgGdwutsPPXtF2cZ2mB1igQY/vAFCSjJ8CGiWFk8C9p97d87Lzk
	qoEr5cVrzS0AGKLiJoMhn7YN2EaBgjkzj6qTDwRrEtoEa7uU8zlAJUmUKtoLSw7D
	4nzn9g/EavPaSb77D29gyK48aNVzffCYu2JJI0Fb2nO/SBLrPUNIRSRdEoTXHOdz
	5GUa3v2yDTxY3G5zxfL9BfM7QAG7ZCNc0027KuU9bIIabQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq0qs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:45:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9103f4ddce5so19347946d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 22:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788587146; x=1789191946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AFrExlz4GMAX4ru7ZKdbL+nWMkWlCx4pgO+xZDaWALU=;
        b=dk+w25KBmLZBXzD9XJDNSEPoMjLEDC5kjgurx6yGfLFEhMLl1FAUS/7mqrJaO5S0Qa
         DiDG7ZLV2MIYtA1OUEseEucBO4/0IitLPHetcDYlP89LyRiFtQ6OQwosMUDGFVtq1jHQ
         MhiE9SFKKgcc7KTJrO1PH/Dixf9KVgwPy2RDmaoF6mG7OnlvLiqj2Ptc+G7mpidRkwvR
         8B5W23ZDaGDS/C76KNsZELQcclDb+PKyglmHiYtbcT2NcKn8P9dUGo1MeHOCp5qJ+nQd
         iOBAWft/uNi0qhZDqa8p808+eSsrLTvvkBDNDpad3OdVK+MP4lPk/5Ss10tBfE0+Dycg
         eQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788587146; x=1789191946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFrExlz4GMAX4ru7ZKdbL+nWMkWlCx4pgO+xZDaWALU=;
        b=LTcxaZRMTmGv/alnDDgHuu7+RSBaSYH5KYdAP1ZEBZc3g0r7CDCDZeKdX8ZvyfsdeA
         5eEls26uoNLPjl2BA59pzUeHbEfUVncwaBF/2pRiOHpsclHMFMPUSRarIEZmfif4T9E9
         7mA9Zun9aCnylK7EWKI2ZsZD6FrCgOEhH+0XjC8MAyuatRvZDzb0xTAORYRFAdUn9LKp
         rdw8vPxOuzELNdQS7csH9thf4iiJmAhg6WlF0eAkE6wZETJNNKN68WSJQeUeBnsp7ymP
         KbzblBIO0efGRtlrbHNC6lmkMuIim4R285Vz1c3hb2GupWUkfshqcddGGryz1MILyfl5
         23Xg==
X-Forwarded-Encrypted: i=1; AKwUvBxgQ/D1WJB+xq0bwq5cBqWyy5pCpmpWUzr+AeiBwqerWaW2bIQpUuyBU1ue1bmyWKATzK/WxmzDOduz/gg=@vger.kernel.org
X-Gm-Message-State: AFuF++k2kSf3v9JC98d6EiVdG52Xz4XZ4E4PQIzl8Etz8e7u7wPAHWoE
	7KJCxDSNLjmppxGs+ZmlhCm/ZqoBU3/BTNazU0eKMM93OMn4COsfxwsx9T4sQ+8Cqp2bIGJQV0+
	SgZCvRT0VmXkjfXvLqytHbI4gVeIj/40Ntw/LqBIWD2io/b8SDinW5sr+jEpODmYd5V8=
X-Gm-Gg: AYBFou34QaSiwBbhX5CKU83iWvGrcqNvxNAsg6ud+nD/x3toOWtfVTY3Ps7iFS21M2c
	6ZrSmLdE6/jOj1iAiCA5EuSqvny5X95xqn/2d08FdBckagfIfy5e5EqcxxdXme5E61gi4/8/DOv
	ecfxpRI6plxcFDWFTFz2csK8e+u4Yn43Vjvdi+epWgUF/x+dBVrv3W72IfV23mMy+NJr4Cgd1kS
	7m26URRNRLgnxcRn+D2QmkixttMbu/Lj2XZoQx5tXzpgzCp3TsjJGYsQ3CYQLlp722sAFLv5jF5
	xxOs9SUjfL/s694WOGimlJFjkf5fd2s+vc5Q7uNxQniENUIcbsPSMvDaIdOD2Uj8THAoLqBWGEp
	Lgban4DraHZZS
X-Received: by 2002:a05:620a:3193:b0:939:7e19:ac3 with SMTP id af79cd13be357-9398053f7c5mr1036223285a.45.1788587146188;
        Fri, 04 Sep 2026 22:45:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:939:7e19:ac3 with SMTP id af79cd13be357-9398053f7c5mr1036219985a.45.1788587145599;
        Fri, 04 Sep 2026 22:45:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm167658815e9.3.2026.09.04.22.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 22:45:44 -0700 (PDT)
Date: Sat, 5 Sep 2026 08:45:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS
 RCGs
Message-ID: <kx7uoucnsif3atqsocuavdwvsdny4snav5ncl6e2tappaxdkxe@vpaahkdzj5xf>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9bac8a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7NOcbVF-i3gUCoNk4r0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDA1NyBTYWx0ZWRfXy8LJZKybVSYj
 e/2tca4DEHNWF9toys9uYgxzLBeYRaDDYlR/lKUHZmtg94OwILqENUimDJQYETCMXwdfnGOAxJO
 sJc4Ey5fTfaOMrWOrXgT70cRTf6GhQg=
X-Proofpoint-ORIG-GUID: EKsDkTalyMHRBjtEuSYElOwOccvzqSXT
X-Proofpoint-GUID: EKsDkTalyMHRBjtEuSYElOwOccvzqSXT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDA1NyBTYWx0ZWRfX6/G2YNnrWebn
 lMG8hu/wjF4xwNsXDrQzLBX+Ir53Uiwu3G21Tear2hKLZ47RkwGGbI5R1ultVGQGsr1312WL7RP
 4YKPl/JjWSFd6Xju7v7qKM9QTSsTVy+mHNNXVo5suRWRH9uuCZ6FUNiEjPrFvkMKVGiQ/cJ8YtL
 o9ocx2Q6kdLh2roTZDAmJyC3BX7bTZ1az8E5ZPzsAYBLlavXgClDSiO9g4b67ZfjqO3cl81xIAj
 IeKkgB3iZjc1PiMbr4y1xBZtd10MrUwvySBE49JcZevqnMBFSzdtvgeLQjhyPZ3xgafyQpxGy8X
 FrktgRY/5OVG6lbcIwnqRlaEVf9QcIrnRy0kXkjH1UtsH4p4TpbVC3t6LsurogHlUykkIAIG/Qh
 +SRzjDbQGgW6EdnoQNHUw6ZutrKFBJw96uKDFLos7rTcx4b0ONXccmJCPNCv990BpW3veFQtE/V
 75kMgxuVOWsahD2fYaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050057

On 26-09-05 00:20:45, Jagadeesh Kona wrote:
> Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
> during clk registration.
> 
> This ensures the RCGs are connected to a valid running source clk before
> the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
> sequence.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
