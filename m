Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ED33F4830
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427506; cv=none; b=ATVuToioVagpL9lBapQKXOuLiXXu3WK52YyfbCjz3DKKpJwfnBq1Vp7VF/TATNfBs/tdSEC6przmmOOcXBamOiHDwAAODIR3aC4oTFXmf5N4Q/tXqpiPMonDrUgkAf/lf9xUBPaGBjz8Z/Oxobv6jD5HE0kEyhBsAh8LPSGPk+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427506; c=relaxed/simple;
	bh=RiRPKZ4Osm1Mw4H8A9BJtRFmrn18N3a1wk0pyf7knds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBP9h/NLFWslozwUibgbmRbXGQ21vL1Uipen9MBhlEACdGcL7tGhKZoYS3MsyG5Qzv57cTZ0T3XdOJItuCa4bQe9tBTgZOMm96iDmJbLfiDh+RcdtJilTdFng604nC8EV4LLO06mlPAgi1bHjByCjNwORotTuEZ/yFscvrOEvjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRG+5lNP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtKS4M7w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRG+5lNP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtKS4M7w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392rJ5519654
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p2zs+3Jz7pX/zIdzWNa3k21r
	KY8zg0lGnI8endphEcg=; b=GRG+5lNPD+iaZtxwT0IRTdU6vyDjHfl3ZZ1hFL6J
	Hp8EDzcKTqVa/usHgo9Oy68mlPX4A8tuxR5JbGtIiKYU/Uz48+hj0NMEKVW1kXkj
	Z3qFbUkat0qD54DdjrAlrDUQ2kqsOpz4eoUqHdB1nQN4aExNddWZpcqIDindWlVn
	+kADSMx+myX9qdghobH7Kb401GSZnSnOejdbnX7Ln0p55M1KrASaheTj9UY9lcut
	QwLxOX7E3hCLO9/YyOOTRFxizI/zfs7oIeQ8m/YTXJfOu/hss5Ozb9mx22121kcF
	xt0LACAbXfC4Nq4mVA7XVSNoO6w6/7S7qO23G6ktewselQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4h5xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:25:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so594821885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427501; x=1789032301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2zs+3Jz7pX/zIdzWNa3k21rKY8zg0lGnI8endphEcg=;
        b=YtKS4M7wUe358OuGfBcaHqPXqKnhmEH6CodV6nfeiloAH1Ax8CYWnjG6Oq/AFoLjAw
         jNNiRhMnJ9c+S7I7BijIVHw2X8p0Mt0RrEuPzq5JCTE7Ig4gwL6Sy2uhjiJvoqgG8Ix8
         jbt04U5bs7SW6T6z46ATc6vVSja+4jbnUmdDDSAWDEMMht95R5lvC/QG3sYxvapzAaa7
         b+RmoH/G+PzuhNDWzimvJXQes+L/VeTVpE3R/mruu0a8rgtcrOYzD6ScsOpsPlyZA3y2
         DMxz43pce85UisXhQnsx4cakIijOQbSNGxDRHF4nj5hRXNE4wu+j3R2zOCgJ8kl3EK5U
         jijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427501; x=1789032301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2zs+3Jz7pX/zIdzWNa3k21rKY8zg0lGnI8endphEcg=;
        b=F0e5+7NFgYiMN+TX43INA16gZOHSstJ843qnCeO6LpYv/dH/bN8Rga+s4USqM4Vcpt
         f9/FSI7YvvSwG0PK8yB2yaNMxUJneqA6Kaxi/NEShc8Hm/r7EaEe8V4MC/DNmJ1jlnam
         P2/NzBrSGgZsaQswnZU0W4n3AecCy/bvS8g7khHeQuF/A4WL5gVm8x4qlMi2cKSxOcBw
         g7HRTOf9W/tbE1+9L7GhXR6bau5Zx4Mygm0Y5SN9XZv6PciSTpk90ioflKUZe3UdEtwU
         9lQ/UHpD/9gHW4jlV2Fyx0yzDPTlzpulOy3ZuWTgdDE/G9nSg+gakwwf5bWeIhzIKqRN
         c/Pg==
X-Forwarded-Encrypted: i=1; AKwUvByUw75aOiDu9BuLt+C8rB/CEpVvyvq+au9XPSYbojo0Q3Jr8RPWq+jxODKRshhzCN/XxnmD0EdhDyctS7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++k9U4ZLjYm5CfrKhlIsBb1KCBqLrJGnAx1eBcuJkzkiKJH4+3Jo
	b3xQD0pKR1ubG4GKVrOCl8alT6cnBobxvgWAycgCdXRyXrLfDW3iXyEiHVrNLXZvYTdw4xYkyH6
	AetobGsN2RdXyOqsRN1VrcON8rVEdG7xxo7Vm3z0sw224KA0ThiK5b671xPp/fEv+DrQ=
X-Gm-Gg: AYBFou3Ynzc56u6uxmH7/wn+D/3h1Q430fQGklTAUApeHUBPyQcDOVMw+aXkkgeDfPQ
	qs/6pp7ltOSSW89bzTBxM3Kla+MjPXb+lwO7mg5SeSFZR/+C6/Ag9VDJLTP3ylY2UuMnmIX+zgG
	dvaEmWNAg5V9SK8U37mc3W56wwZpW1Ejy1Kmidlotr3pfsqHoKD+dRUytJLlx3sOPXCRaeBPjvw
	Tp29YScpMIHf3LXMSUVQ8cM8coL/Yv2/s3Mnx6u5iFKzXAn/fwZJrTU8SJcZ/XDllDJMqFTigA0
	if/VeXp5ceS/CJl01H8Qil0Er2KhXHE7RK9RdS36zS+6kuxyg2kuazRo5FxEl4HtoMN7hRJRG4K
	smJPoY8ytj2F0HA==
X-Received: by 2002:a05:620a:172a:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93960f15d45mr1244545385a.21.1788427501229;
        Thu, 03 Sep 2026 02:25:01 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93960f15d45mr1244541785a.21.1788427500797;
        Thu, 03 Sep 2026 02:25:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80798sm11791479f8f.13.2026.09.03.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:24:59 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:24:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] remoteproc: qcom_q6v5_pas: add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <yr3a5y2m3tz65nag45fgt5urdshpxysvopp66chwcjn7l5d5tl@kmvnvtexyhvl>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902204334.2061226-4-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a993cee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=a2r7pnXXQew0X-Rri2cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 6h1wRXvpbu-jUB-9gmnY__h54RVl8WOm
X-Proofpoint-ORIG-GUID: 6h1wRXvpbu-jUB-9gmnY__h54RVl8WOm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX/iyvmmnnGiZn
 rTvYRn0eId8VqC55mxNVh+AhSvzmmDtTixJez5rbO49geVjDZfPZBJxAgaK/9fdX2M6ePj3m2ie
 F0kPAvkFdKgKm2h8skt9BL8Qv7CP+cQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX+bpGHX68p7g7
 DkP5Dgt8AgqSBoUAM/eUpftSFt43t03ehpQcO93ZZ/c23rrikZ3JI7c9O1XV00EGnLvmV6L5UAv
 /I1x6KMHkAIHXsW4RT+MOI5WnLbGNUGLm7Aq0hx31gLsdjje2XIakcMT6aBZ+vXeuTa+QO7eN31
 n3MBaL7FyaCNEoWXUTjvI9zMT4+PFCaPuNCq9N6BnB+TfvILCZvoBT5aHsT5JyDqRA9Lhvmi/wk
 YkgmkuKtbruvib1/2StUbE0Ifz+BE/ZsN/KlL07lYDxD5oThtz8o+5YymL693e9O/X25sDzX3GW
 TijdqrirSi/julEisoBmmifAcDn9l9kDPyYlthh3WWdCSFt9cEwV7pAnejspY6txB6EvH40Iqrl
 8/lZbOoM7K/eYpGYkM4r4tGN1KH9fkFyXcHaLxe9EJHcbEzOLqAoQsGMWgwSq/oyz/B/GTWd+xQ
 9qN9XVrcjiGe/HDKy0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 26-09-03 02:13:34, Mukesh Ojha wrote:
> The proxy power domain enable path requests INT_MAX performance
> state for every proxy PD. On Hawi, the NSP proxy power domain's
> RPMH power domain has no OPP at INT_MAX, while CX and MXC accept
> INT_MAX, mapping to their maximum supported level.
> 
> Introduce a proxy_pd_performance_states array in qcom_pas_data
> to allow per-PD RPMH levels to be declared explicitly. Platforms
> that omit this field retain the existing INT_MAX behaviour.
> 
> Add Hawi CDSP remoteproc support with the following proxy PD
> performance states:
> 
>   CX:  RPMH_REGULATOR_LEVEL_TURBO
>   MXC: RPMH_REGULATOR_LEVEL_TURBO
>   NSP: RPMH_REGULATOR_LEVEL_NOM
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
