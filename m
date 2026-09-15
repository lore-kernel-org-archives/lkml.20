Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B2E3C279B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476588; cv=none; b=QWoOWSfCVCPvUMUPIt2+6HQCsGQoPND30nocFTd60f4U04qgX6muxLRl3NVgon86I4esNYHCEfHW9JJrKek0mxiSdF0PCCyOAHgoZQ3jqf6Q9AYu0Im2rMkFK0nCHU5fIyYhK2PctSSyZuriLVmxqTvcj46Nto47QhuWNYKl9UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476588; c=relaxed/simple;
	bh=g1AzAZkdPDHguXpNufhDaBNRT4BPES3gacsBP8AdF+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6nJyIKOcyXBU4efjAY/fnAs4P1VE9PDI7lDNiUl74sHurQxzoMA8Brx+pKcw/L0Jmie1sNuZb+rFJ7fwNxQZ/861KgDV5Zh/MnD+8OQFeERjDzG2v9+VV5UU6UOyQ22/2AS9Lm2YXlFNB6OfY1bwg02S4XF9wikBl7TcTqyHnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PF0Vhe9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aw2RCEN9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PF0Vhe9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aw2RCEN9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hGVI3912042
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ZiviBOWkE44Z/tDslnfzRoB
	pPcgt0qgNQY/77lDuyY=; b=PF0Vhe9B7CcCSegaFI0zub0e6Zim6M8zHBdQ50s7
	+LBWG9FIqN0STxGdr2QyiRfiZvdojh1vYRP8Df1SVpXuIlPGTffvivhuWqaL5w79
	BnatGRwi3hUaIjvm+8ru1hmXiXq253TTeab0P3e0dkuLCdafYPJjjvAQC51SMfIa
	bElGvMJf7Vz12tsh2v4VPUcaTQYJrwo1s8y2GHHFMj1kf+upc0tMryCCMEj1bIx0
	HO6xjOFvRto6b4HClx1icpwOaoegx4VOhgFeemxlFqXyNZyuJqkzy/0fPdMQc6MR
	6zN9hhZ6cUown0ZQu8Yge620j/hLzmc2/GK18bHd3ABsBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jesktb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:49:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so920614385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476586; x=1790081386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ZiviBOWkE44Z/tDslnfzRoBpPcgt0qgNQY/77lDuyY=;
        b=aw2RCEN9553TY2ybPQgJ4MLo2DuwX39QH49pxGLBB2/3fsItlmA8CGgTQC3y6mIIsE
         WrcCztxTWVpbAS1SPex2Kp8jNad/FU3pvPySREHz1ZWch7O0RUmpLa4rmzp38Qhefm2p
         KLMuVi+WPRugHl594JV7CqgWvJnxTPziJrEYCOabaKM8xf1YSeOpn050aEr4PG7YM92g
         VWeVQiqcmcj/G8rLeAzEOsMzMBvN2e5qLf/KJA5sMCdGBmi55dSGBqUG/dqSAJ9acUy7
         PRcRA/QHL04OkRADzWquZN5kZAYaP2pihlepBbUc6NkkgPi0Syg7sTlpuSruXxA20UWJ
         sUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476586; x=1790081386;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZiviBOWkE44Z/tDslnfzRoBpPcgt0qgNQY/77lDuyY=;
        b=TovsixzjAv3T0TbR6U1woEmbT641rv3igoRHljQU7897/9FQQtMo+4M/XITB1ShVP9
         KfBfxvE1fRCR9E6IXbofjTALYVOpaPxYDRrga2ZsV6BbDwFkV4/jPAGGjG6EweYD8Yja
         CXzgRl2Q3GejeIS04QMJyen/PYVw0te1iWYnicJG80/EP7u/6bYXkTyM/2Bf46Xbdhxo
         TPdfu+RWXkvRQ3XWEC0lcl96CgSJYBkZPWaYKUF/wYFdRvEc/s2tSuYaQgyqtRZXASjI
         HKLptLj/pqmDOV5x5hYAzQGWsaf+bAUINgOYTnYm/9UgGwhCSmia7puwB+RUn7FVfXqC
         yqLg==
X-Forwarded-Encrypted: i=1; AKwUvByXWpOrnxMqmMhOw7qUQ/PFyYtnyzd/QIs7w8pMl6FFRrBHmHkT8GECvXI0EDyF/NpRgpRa2DAOJGJUOM0=@vger.kernel.org
X-Gm-Message-State: AFuF++ndWaSbLfYI8btO2bN0kjWmjOzCzfaYn8tLNXnICTjGqOTe4IDR
	KN3aUaMbWMVeKqGd3jrmwIcM0RozvYr6z+CkqRPWKn0qZb50FWyxLzAL6BPcd5/VLd6RsSj11RC
	bi08g0PpRpRpFmsB24L079sVWjRXXymkNpmbm4EMMyOtU1ELX7OEJ67dxubkeNj11/fA=
X-Gm-Gg: AYBFou0EvJuNr1VFuJCma6awVMxmEtDao9D7zvNElQ7X/RGRHVYOHI5L04ee8d6yRsX
	x1jMkE3Ftavn2K7ArOOWZAQJ6iV1MSlkThSiiUihZZAZfFhKjh5KlwIZb5SkRMQ+c0q+itxCCZU
	IYoDjkL5S72/onUG40yLzxp8uT+bnmT/LjlWcZdf4yJXmnh3AP0z6mi88v6je9cqsm/+Sb953w3
	YaEhbbYpKtwUinzomNprmLW4IGPA8M50UXiLKGCD/jMHo4cgKb2j5wSYHg6bPljLcJJJaHT3E0u
	N3v0w1ONpQZ0VdSIO5pDCS8JIf4X0le6o4x+XHufmlTJO9pnjDssFL+Q6jwUr7U6SSTlgsBiyiI
	u+TUY3oOKPJDvLA==
X-Received: by 2002:a05:620a:890e:b0:939:2c5c:7977 with SMTP id af79cd13be357-93a29855523mr1208755485a.20.1789476585393;
        Tue, 15 Sep 2026 05:49:45 -0700 (PDT)
X-Received: by 2002:a05:620a:890e:b0:939:2c5c:7977 with SMTP id af79cd13be357-93a29855523mr1208747885a.20.1789476584805;
        Tue, 15 Sep 2026 05:49:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487072a93f6sm4893480f8f.15.2026.09.15.05.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:49:43 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:49:41 +0300
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
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: qcom: rpmhcc: Add LNBB clocks support for
 Glymur
Message-ID: <kmfzk4n6xm6bat2clr2ahka557d67vqqgkdvhbcj3lx64bfsyh@isumhqdfhwnj>
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
 <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX2V/LPmjKAz12
 +cvsBhpXTv+5y/4IJMQOULrEuAqWBbaga4mmmyEQMGa6EWfUNfKOPtCa8BRoz1mF0JJ4XeOZIax
 kZY/MclxiLbs5z8wtjy5NpsLQUTA/Hc=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa93eea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dHuaQup7kaPGrqMl_VAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 1quWTsBiYhuAHr6Q8QQ1WMKVMQ3yHnan
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX6RCv0y5zT6+y
 QBYr0mjAfFHgBH6veSsG3b5CVZ5t0c+Ey9//ZU81beMaw03QqA0oumq382F2EXmo+FWyDtWsmVF
 3hr4QMakMsprqfbHajCJ3vgFCL8L2ttjM0ys+sw7fzqJ2iwXlUeoEf7qcp/t6Hj5fyq0i9No9cl
 eupUv6TV2IaKB8ILjlfJ2yjLvmL5Kh0mA1WZrAVbgwo1rRvbhoxMjlp44aYR6Y/ViW8xWLNK8CO
 rvA4Pkvn6Cf1HGwaANEGd43eOfUHiKozDXSQagK3C85mMBiPMAdvyBhzX/OJviXNzHYjRtoUYus
 Rt32kwxDIQQOUfojD9oXgMyHlH8cAAiEGfksp+zfz04cWANnTiNfskb5+9S7S3vv63MwibjkCHa
 GW9li5JJM8F8bnffrW/CQSvfjeT2F/7nNW/UV0PO6xfzGFOSHgSSirzgtpaG3DGjwf2kjHXAK/Q
 LPnWWAGlKQ4TcXm9mOQ==
X-Proofpoint-ORIG-GUID: 1quWTsBiYhuAHr6Q8QQ1WMKVMQ3yHnan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150186

On 26-09-15 17:37:31, Jagadeesh Kona wrote:
> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
> platform.
> 
> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
