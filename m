Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352CB4B7A4D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657909; cv=none; b=co5acDaVYoEfB8lbyeWUxxjORQ3byqKiMc8Wdbc7zi93gyAQBda1JGyqa6RDyypYafhBsfSlKt59cBPjmf0tg0W/RuOwECOQk375wJP67oZ5fsYPuP6w2e8d41UbTUG4i+egKIVlkwpc3CHoA9WtjPYccWzLI6oE3u+7O/jcNIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657909; c=relaxed/simple;
	bh=oHhMGJ97KbFYv0KPwuP3HgdQt2KJw4wSr7XuHN0THlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INU0HX+erfphj+TnFY6aTEzx6e7NBRymMMtf0l4PDy1DthP0GE9xnBQhT1rWC3Ijk1SNHx3GBMygIhnMYzrv7doyDSZ07SHSAIE4Cyd7oopf7/Fqm8MbNnIXstcbCSAd+sfSV20uMrXuHTu0OY6/0zf736idefi7DnhnZKH6qWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7zTwMCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJivzEmR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7zTwMCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJivzEmR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDk5tG1955214
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sB34Y5YewUpC7AQCZUi/yvB6
	QiCcoBSlNdVX+1eleX4=; b=Q7zTwMCvGFtHwpwWJsJJH0ZAYIvh0Vq+53BrYkGO
	ZnBLtV73WffQCUUlkVvpXg/EKubS5LY+GET3+2OYeuXHgyKkLWAOA8ycKuqEstby
	3ngRELnJsZSVlh9MnWsncEKVTVzVtfPvkDn97qhWGkdDsTfwoIoZaw5m8iEx/tXN
	0fDi1RCIT12z/pwW/Z8SbDd1UwgyJRtlC4X45WH5Hm1fmCJlGXzmDfBEhHXSUI3D
	kMTi0Fk4h5XtH5IOt0TWenK3ATDvHndeK0ZkAkrT9//3P5063N4Qdo2yQL8M8vog
	nsnsxjQaXHae6QO8Na9MAWxegukzU5k3v02ytjXy4sDNcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grgu5gn37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:11:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so181909285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657894; x=1790262694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sB34Y5YewUpC7AQCZUi/yvB6QiCcoBSlNdVX+1eleX4=;
        b=EJivzEmRZKiFyFmuCQFD3lYCzfxliWdFU5Tld305KDQFKu54kmKJ2lBHhP/EJXDGpk
         9cIZ3zxR2WphfDzPmZxMeyKOD0a++tGSDEOvHX5hhmXlRPlS7RW9Doj2MjXpSyqCrVQC
         PyY/dAhWjTCZmGf7ZAKyUMNAAn0Sh2yyxzplXdh19KhxFGDZGq8I5G4AuSKLTn/H1Nfd
         BITGPD02ozggEXzSwNxtkp5YxtsEsI4VclbwphTY7U0FFL46nG9eyV8NH/eI+obPt6ZM
         pEY5+gCHkzMkbg3mHvTcYEC83fonSErOs+xphJMnYNjvmFBYnJiwEoEikXYJWJqrjE5o
         5Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657894; x=1790262694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sB34Y5YewUpC7AQCZUi/yvB6QiCcoBSlNdVX+1eleX4=;
        b=W7kFN3hNJfTHc6lweTHv/aQBgV+YK4H/ewn82+ecUxRYRgB+GLtrimd/bzdMLZG49w
         gGhZtlf3eLawOKUgH0FkP6E8hYnU4h4jaue0aso5jqX9f0GX00PDJExdlcr4xCE6aSKn
         ISTmoQ+bs7HJ49n9C/liivL/mid3INN5aHTs4UKswKTz/8dybyJChCESaJZs1Ki1VLUe
         9DQbJCLn3Et74jZmt344FOcCriF3bqygQyCHE/Dz4mvXWufSJhUq7HR8/pAPOw9/JEyY
         zIa9UobvUUbGmdNc9mcyN5obtt9r4fFH4fA+AY0MbAd327q6SoXanA7460vx58rSK3w9
         Ld9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwUpWqke9SW5yd0GyMYMs3k/YvNsq9EekMmv3ySAvxLCvj4YesC31+5Y4NGXsRchldKI3ike0RtAJFuc20=@vger.kernel.org
X-Gm-Message-State: AFuF++n6jUlYmwo5kMQm4GcDIb+R4XJbiVPi4EDd6KEroJnqDfMDrfGM
	/uYRLtFmhlgcjDnr/W1OK0hNutTR4bwjisll75FvbcaFH8EkR6mUjcywjOMnZZ1FNn2NmVDo6Uf
	GnWl4amncSz8Tiey9QDL32YIsmjzkfadWr+9GY7UGKzz9y/AzXW0Ic0yTUGoonsPKxIE=
X-Gm-Gg: AYBFou1Kw0Ee5Nihc6KPKpgabJ8HFOENhPqQnJLYOU3Fe7xRPAWZE1F9SHemPXcrVeH
	xIX1STJK7wuHuGaCGuyy5V5LO7xBg6Ujnl+IunHBel7Ji5BvTE2FXOvdU3R6E69NJpI0JvwMZr6
	+8Ls1mxLBGp/u3RzNGPoo+icKlmKBRaBhLofG0KtMufqoRSj7ck18daKT2AWkXHOGgk9Ek4lnl9
	gNLkQsBBlSVYMgVbdZCrFGS/2nzcyP6hWIAgYFFITVGOsSnlsDQVq+zktmmIj8tdy5fKb6EtkyT
	U434O+6yzupj8uIVaASWGO5N8XUv7AIkHtrwIS/qBMYLeeUPi8SVsiH19VPUKQVoaxRMdjHoveh
	X75ASJmOhsX38DQ==
X-Received: by 2002:a05:620a:2687:b0:939:e7d8:9c04 with SMTP id af79cd13be357-93bc62e126fmr583774285a.21.1789657894162;
        Thu, 17 Sep 2026 08:11:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2687:b0:939:e7d8:9c04 with SMTP id af79cd13be357-93bc62e126fmr583768985a.21.1789657893513;
        Thu, 17 Sep 2026 08:11:33 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa70sm16097557f8f.9.2026.09.17.08.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:11:32 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:11:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/15] arm64: dts: qcom: msm8998: Move PCIe phy and
 GPIOs to root port node
Message-ID: <osbej5tk46rjvbppcosn7332tmw2qnzvt35ctcukd7gcg345gs@tcu3zi6t5bo2>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-2-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-2-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX0kxU/29oQ4mx
 tUt/48Zl+wKAqilZvPeV6vaOJgcKJ/U7dcF+PBnp7Y9+HxPpWQVUy0du2QTVcDPOzrtP34qG6s6
 0RrNv96pLJ9jPlmeBakktacE4ZvcHcA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX3OMUqfVv2B7Y
 DEmsEcEjtpTXOn+i5zKPqaz/dO/D2xMSfqgMrY+fU9ETSSKHvzES9oZrlhPIQVgkwp1J7gbP/hr
 zeVtg6MAFHL0wkJl9Vgl227nLcLo6btnl3vaptPVruxpZdHljdBh2wAkLDzxoapavOCIg8cFy1j
 +Q9jdXsN37JMzXl+rkhU0tWTNeIngUNIG0bEM6iQydUnfdmgf9qplk7FjXGr5i8LwG20gu/HBS5
 ls8TOE9y0UIaOoIs/No44WVyo3vY4U0xbeOEJx9KqA7ojnMJKeugdsMt2Sg1A4lfUpOMgsHFx6b
 0s7II/oWwinvAcliktQlUht6tiAcaDcCSCwc3Z4y4ZmXzTGOSYRuI/hDwNEqsI5UHN/2CvQvvX3
 CCW5ENpIbLt78adlUZod7+7MK6uJiO3YGGnPUkzoSu/hScCULotE1FPP/FdKlivPvoKN0EQv4kc
 ayQk5zTWwlVuNRFYdCg==
X-Proofpoint-GUID: wBAZnE7jvlEuzDzpAISSBEz1FhiTZ3VU
X-Authority-Analysis: v=2.4 cv=GvbXaU1C c=1 sm=1 tr=0 ts=6aac0327 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wBAZnE7jvlEuzDzpAISSBEz1FhiTZ3VU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170214

On 26-09-17 17:55:16, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst GPIO property are per root port
> and belong in the root port node (pcie@0), not in the RC controller
> node. Move phys, phy-names, and perst-gpios from the controller to
> pcie0_port0, adding a label to this node to allow board-level
> overrides, and renaming perst-gpios to reset-gpios to match the
> binding used in the root port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
