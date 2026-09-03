Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDED415F22
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431125; cv=none; b=RfoBlSh+KlNgB3WrvgFjabZEwlAcyJaewM31yRhDs/Z5E9FPzMkGYnwg2uYXz3c9U5zHaEFXI4D/b/mVD3o64AcxVCDjkjRLB3fTh/mO8kgTuIDm3Wb7F5aQ0i4J+a8Px+JhQvSw/AH/u4faWVt9a+IEtV9YSk0ZUBWvr4HK4VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431125; c=relaxed/simple;
	bh=j8cTvjNnfSZmwz0eJZZJYxv6DG8sXpYymw5e7ysyM4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ky+0uO+ctvNPCnofYNGFw7qjo6YkdpgrJ0gPjoITsDgJtg9QjeCuu8527ZrdnFmhftrpG70ZtiyVAOWkuQjctDkkR9Qh/PtLFgOFUaVgYu7zdCk0vpTf8xMWPKEZCQEiGnVo2EiqUK6HYYKgdbBHkowGG2zjZ98ZljblLiW+f00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m94rEqGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXz9rqb1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m94rEqGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXz9rqb1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHMZh327263
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 10:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fr5ctLjXEDfEj66Ws0nGVXPs
	zhPrUrJDK2Jw66ZrASw=; b=m94rEqGGOwB0RGzLiPKJPGkleFcP8qvazkiyG5m0
	fhXBEBLYRCXdWiK2VCQcRfk3/16X78TkpCX58tRVeGgPzp02cfHx2AYHqUd55vSr
	Sg9wlO2lV7NR7GTM0tO3PfgoeCdKjWi1bk3zXOn8AXDZQxUH8Nl6Q4/gMp6+nM/p
	NgXwuow0NlfS6du0A+qXVff/MfS7fIpeVoDZxVZPiY2j9SmtWfq0Zne6Hk4cm6Z9
	jzkMPek1S+FH+YS9cvjF0uvNgt4GZVwPo7iVsL2DxqyUdh0Rf1XJSSYyrycY5iCq
	IU3VKZgXT40uM6Mj4QX/EztWJekbBl/lnoJ6MM6wZ3hgcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekgrdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:25:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so416765185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788431120; x=1789035920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fr5ctLjXEDfEj66Ws0nGVXPszhPrUrJDK2Jw66ZrASw=;
        b=PXz9rqb1pOgEUphFGylKjexrD4ewNpFbVwISWiR5UC1hl4jYzH1zAhMeI2t+jhQ6Vy
         ZsD5xPDqde9aWh7LBzgqp+1xq95NYIz8zci3gfel6bjd5GcTgyxI7dsyP7OShJPomSwV
         AgnU8GEZ0oG4+8ROpNTRMPOQFaiex395z8BAOVAktOtXOF9TbTex3gA47Sqsl6bLvn3V
         w6zQyBujwvVwAGeHV2FkALbiFuF8uTzwXtjr5o1gbyrxo5MmJr1KXQ4B4AMAfbwgyTcS
         afehhacgDLfzBBkoZ1OwtEOfGbf8T+0KcAv3gAlNKX9s2S0YmqCprOSpCSU9nVmAieCk
         Ip/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788431120; x=1789035920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr5ctLjXEDfEj66Ws0nGVXPszhPrUrJDK2Jw66ZrASw=;
        b=grrrrxJrBdWJVAGlT/ObZ4kBRmStm0fTL13vJIzL+NtZdVcS5x4gVN/F9M8oGvr7MW
         D055oTB7Ut6IjFI3MEhicx6JEQEvxrynw0jX34Zc00PFFXI97SGqJ196/bBXM4cgYlNQ
         iMqSBgThcVRL6sY8otuAfLEB2OU5VC2roE3iFOJd97vB7UNECn/QA555ACfKlOQXYye7
         lGWCrr/ZJaG3GMem+ZQfjPqyxPRfWdaCx7wkv8uLuGRJ/YAdDf86/qRSPRZSNIGgEXZD
         +tlQX9gDwG/7w46koN672drS3FShNK9wAFqDR2q1x364WOU5LS6bCVcVvJe4BdYqdlAj
         P39w==
X-Forwarded-Encrypted: i=1; AKwUvBy0iGdZAJDDyaAFAgrMFxcIS4shteQ63ieXLZk84fd0C7XED34LUi8ZHJhz0at5IdyvSE45nehlSTHd/S8=@vger.kernel.org
X-Gm-Message-State: AFuF++m0Y6JCN55d1OKSmV86RuO6pFfa0q32EP0NW+mpwgi88KOwLaZX
	jXQ1BEsTcM7pTEpSIdRGvyquVWFtypbcGeDXW28edSzB8i6a6geHhsnw5tHjwxigPQSPYIyx1Rx
	kGuXuz8PfaH+L3eA8wm+fFqkt3te6POI7q/xsNr+rWdm8R14vR5UggppoufOV0Yx293w=
X-Gm-Gg: AYBFou1Fu/OcUpxuf/UC3e8s0NFM5v7D8g2whCoxUTmMRbE1In6WwgcpATXl/GteWWy
	GSOMpWu53p+LRUbrGL+ht5v3zQvSj4DJp/0yWRyogYcVafoErekA2pITiUknB7WC9ClwywA7Pio
	K7xbYAKR3TjswzBflhZz2yfkiWC6LB0riufBVMHO2zfG0z2Sky+vr9YUHbO1IgqEGDI+W3H8RY+
	2C+cDzY4svaBvbCM5ngFtBMfyiw8GVK8A/x/N4nhi9Yc5SlFvR/Qiz7nvnqzYOlGNjJRlAhrEn3
	KI9sylgCOmCOkOUNDssoEqnCzz42XbE/S+kvmGed8Fcbkz4Od3IoPfwnjrIE87BFej+Rnl8YwXC
	rjZBs12Am8eXZTA==
X-Received: by 2002:a05:620a:84ca:b0:938:39e7:725 with SMTP id af79cd13be357-93960f52971mr1372663385a.32.1788431119585;
        Thu, 03 Sep 2026 03:25:19 -0700 (PDT)
X-Received: by 2002:a05:620a:84ca:b0:938:39e7:725 with SMTP id af79cd13be357-93960f52971mr1372657085a.32.1788431118976;
        Thu, 03 Sep 2026 03:25:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cf550sm12963975f8f.37.2026.09.03.03.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:25:17 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:25:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY
 configuration
Message-ID: <z5rdzvlvzwteyh63k4mpkwyryug73vj7trjc5lbzutg3qznrzm@6zbklcre3jup>
References: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
 <20260901-phy-v2-3-cc93d2f3b1bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-phy-v2-3-cc93d2f3b1bf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: B8nepBai-TI8vpQIYrLSdg-2Idy5sFR9
X-Proofpoint-GUID: B8nepBai-TI8vpQIYrLSdg-2Idy5sFR9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfXxWyqhAYutkvK
 3OZQrtdrKm8FZbsSmXH0L8pzoD4eInpM7jcFYp5sY3fS7xySJjV6piEF+MlHvP2b/Eqlfigrx7O
 ffYq+E5QPYBpY3VnmyqKBSTweKWQy5V3N/bfXVcXpM0WwNS6/OpNOSzi7OzMryeR5lk8hwUHRrv
 HZ9yrWOWlMULlk8u6JlL/nfrJl3/wmx78q66C7QRDlFh+eR38jNAdBtY3+73H2TDnCHdXlwmxCk
 cyB+I5Ln35WX4F8IjY+s+u7ihgTnSdmY5Xv/kRvLGfRu5JyVNCbe+3FN87rtDDC57xud2isrCyk
 LY3FiXkLG4q+ubVZd/Uoryu25Qwu19Ll0GyNLP7HunsuDaRarHuNXyHJ9xDIXKoiFR5Pb/exBMd
 PSB/plgGSaHHI9zH7trvJpHlxT1JUsygVo8qQEkymEn5m4hN7a7bTbdVdvc9bOhK9CaozDhFdAF
 JO7wcRsa7I93v2QS6hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfXyOo1xEVCqLSd
 CwyPabf7MXKUuFpbVcgqjQGfne1aOpUqCOldQzGtZ5aJyOhN9YtCH48WoVyeBNQ3G6CzALrffrf
 YayCTYYIbznuO7B058ph1yTsCrVECTs=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a994b10 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7dPHXdr4Qe62-7ilc7QA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030089

On 26-09-01 11:34:21, Varadarajan Narayanan wrote:
> Add the USB3 QMP PHY configuration for IPQ9650, including the SoC-specific
> init tables and compatible data.
> 
> IPQ9650 uses settings that do not match any existing supported SoC, so add
> a dedicated configuration to allow the driver to support it.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
