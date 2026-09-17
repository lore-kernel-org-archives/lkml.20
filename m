Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE874ABBBE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660800; cv=none; b=mBVDn4KOxIfTYb2oHbbvwNd+iNEnWk8kDyin+AgK3EoOX2vfVvMCoyS34uhIjRDuE69gJervqZu/NT7cD5ejL4OExqalWUay7cbnWYcuJhi5rkGHQJPAEZU/GBUHDQ8jhwAU/9U8Gzf6LrRjkgomX4q0kem1nbmltMDpRiNSGZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660800; c=relaxed/simple;
	bh=tLgpMuWrxTdgXlfCAJ5LB4GG/gQYXb67tbrzvgKcf4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWcGXjXO4d/ej2GpOQtCp1LEaSSwOPcWLt5MUriJpcd4meExZwxRTuNThyUnS+khfGBmy2wSrlJ4MkF8UXJ3l1HMeRtFcshq+hkAIiVxCl/CrJ6SpsQc7VeG518QgHvaFtz9yDEntKRDTjAMEwVoSnvUCJhGeTtjUL0y19oUg+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSLvNvIv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Md0iuP7x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSLvNvIv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Md0iuP7x"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HFA58e2024884
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x5j5s4nhgiam0hCBqrzwVhfK
	OSCVilYXlPifgN6u1u0=; b=dSLvNvIvtkEatE5f4mYWs/QhOF7wzzHzrTMINGF+
	AVKikYcx0OD88td9JSldjKXhoW7Vs0qRPYgtxT3KquVGkZp9/gppAt3Un+7ZRGYh
	mQe7qztcQKuXS+tx4y8D7QUxmscr+TiZSTt7dArM7gZ43WZLFs2AepAPsZdlyRbJ
	eWquYluM0p9VH29lnmQzff13G0pwV0bZxskajQFoPSs8wvC1RLTcqrM9NV5xWH3l
	R09SvhvsLgvIy3qNg0NW6P6zV0r3FW2zwhpnh7pOt/irmqTW7ecvFE8KDh/auChW
	PeT/kFTisxHW/BlvwnRx6a33qBo+jtZTKqEjdi6tH7R0tQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt07bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:59:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dd53f2b27cso15707395ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789660797; x=1790265597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x5j5s4nhgiam0hCBqrzwVhfKOSCVilYXlPifgN6u1u0=;
        b=Md0iuP7xj6BLRr+Z5b8pEsoUHoZCNP0PCIAnMqSvEVSSF4ESP8gpUe0P8rQOyeZJT/
         EQaEIQB/uWDCSWP3CBGXvqPNZ8AAMpwP5HDec/R9kRwhvdnwZYfO26o/9vEh4vKmJ9i7
         h48SDrbXty2zhK6+r8cYIYo5UXGKLuwB1y7uxR6pouoYRwSDDa2bnzsl5KtYwcRgn+BN
         YCFu70MrPQYXDYqzE3Hd4Hf2P5jfeLIt797ETsxqH5jbeaexY97oHX26sYv/CDRbGc8R
         PudcHTXo4pyNRvcymOptyViO2gd5FsuSdfBpeOUtIhB0cjuJxmGWVF6yAfiL4GK5xzXY
         8+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789660797; x=1790265597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5j5s4nhgiam0hCBqrzwVhfKOSCVilYXlPifgN6u1u0=;
        b=RFiHpyI9wkoEyKfRdK8vlrQezOP6jSozv/6XMjBbBopyMNM2k6LN+Kypoatw05uAJ0
         lpmWeibtWbRaGL4zUy2JDXREjrHcIFFIH788ucbxjOBR/LMha3+rGyXbDxJV8PIxAN7F
         swCYTezdCLy96ZpEJ/nletdvnSVlTRIpqUwLr+vq1ocyDzxzAh+Xsmm8qbtEkK4I8bn3
         Hrqr7H/s5kL81xn+u7zBRO+5fjFjcpcn7qIue6yzVo8L9+NcNTSwKW6UTeKMQhgD7HPx
         15G22huf2KYvkayXQ5XF+2p7lpJJyh8uR1jdGFZO6fK+fxChgZIdg42b4v1b4qPNjglf
         8kIw==
X-Forwarded-Encrypted: i=1; AKwUvBzI8QXWOHRiGD8p5n/wU3MsQa05ePQ1ff+/0pNDsWMbiIF48m5UfWfrNMS+vTxZwoDI9q7kasZ5jAoo0Fg=@vger.kernel.org
X-Gm-Message-State: AFuF++mcYMNgfrcl3c4iDH+eXuCE4M3nacukM2sygnwE9M0H6kqCucI4
	DphUf9ik4wRxY7arDqIzRHgCPV46FTYWnX4zqDr6EScEhwt6Eh9kspx6K+pFe4xOqxUSMmfpOUW
	OKB/dOHTaxGnefx8YkKxMKWg1NRiZ73WIwUZX6aWV/R/WN08Wd+Sx5OhBs+xwmJ2vjNc=
X-Gm-Gg: AYBFou2KATZOqzolIId2h8n8fbT/P+5Rq00Rrw4VhpAOwWfJdc0ppkS0DJebHc5dnRo
	0/7XE9Sd9k/Nb2K0DizP1O1FXp0eYJCDtqRF/4qO2RsBIOAZ80PFgI0gUgHc1vTLj3dZPMhFeuc
	yJEGDgbfQ7LlpommAUkhgRPDu2rSuvPdwvwojTmZbWZk2CDKj58J3k7/z0T44MskUUN6UU1ze0p
	G+gYFT6qZ4cYcFx3zSliKHoHhttVXk2ld9MeOE/GCKIv3jE1BkAHAvls6L/tkuEHzWJvxqLLMXn
	swZkY7lFROfv47EXbP5jm2hW3bc+Wqz9+Zuq7cIfsxIAq+5iaw7j4BhrYRLegKL9zipdzjRXm+2
	U+ZUSYxqH3gQG9Q==
X-Received: by 2002:a17:902:ce81:b0:2db:479a:5127 with SMTP id d9443c01a7336-2dd8e632d7bmr152292805ad.19.1789660797180;
        Thu, 17 Sep 2026 08:59:57 -0700 (PDT)
X-Received: by 2002:a17:902:ce81:b0:2db:479a:5127 with SMTP id d9443c01a7336-2dd8e632d7bmr152292465ad.19.1789660796619;
        Thu, 17 Sep 2026 08:59:56 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f244c9sm29158325ad.76.2026.09.17.08.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:59:56 -0700 (PDT)
Date: Thu, 17 Sep 2026 21:29:49 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Thomas Karpiniec <tom.karpiniec@outlook.com>,
        Coia Prant <coiaprant@gmail.com>, netdev@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Choong Yong Liang <yong.liang.choong@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: stmmac: qcom-ethqos: advertise supported
 SerDes interfaces
Message-ID: <aqwOdSqxHDscsbIN@oss.qualcomm.com>
References: <CH3PR11MB8413FCBA598F7FABC04ADCFEE4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
 <CH3PR11MB841353E5708DDD7C5E2EA1D5E4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
 <aqqI9wOnradk9d7K@oss.qualcomm.com>
 <97924d2f-45f9-44d5-b482-97fcbb70abdc@bootlin.com>
 <CH3PR11MB8413131D50175690DF9FDAB0E4B82@CH3PR11MB8413.namprd11.prod.outlook.com>
 <3bdf2ecc-9dd1-428c-8841-36b1f19916e7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bdf2ecc-9dd1-428c-8841-36b1f19916e7@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyNyBTYWx0ZWRfX/HIzRDKpNg5d
 rikbT8KHvENH11ZUdtaKNaLZbrz6ptKBVGIsAJR8dM9AdItVkeWgeIB6K65gg39Ncy66n5+wlbr
 loJW6/Q2a7c48JWRwkuJ+8OXPIVU6jNyGuhJ04Ae3BxvqbWiW8h0i4lZmQQYD/jAEd+/t1sEZMz
 gJj75oFR3H04zljQcvWz5G6agIXa9V4rfTBlsYwCtQmLwCp3L0D7KOOCXCjfdMyqLieJ6J8DCP1
 CpdDKRFnODDSuVpTgtGuEUK0XQJKN9EWFEvUgyLqHZcKyfUKZ/CRSBph2Uc/aKpeLP7EHtTXCKd
 TDEhg2jR/yxBZsalexLMHLBRD7ttCOV0UoIrA34kiaYzbQsIMjh8PU0Z9sn8T0yNJ7wRxMDsC0D
 vHVyhY4ylCMobbrZWGvrp4Eil2vbw2MYkiFHOPqYk39ceytp7RebhK5kmBDYGWs46G2R0/P7boV
 Lmd3o1+KIFBbNQLqpbg==
X-Proofpoint-GUID: 4B3FMIGOPYvC1KTkQbtEw4eswMSzcbpJ
X-Proofpoint-ORIG-GUID: 4B3FMIGOPYvC1KTkQbtEw4eswMSzcbpJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyNyBTYWx0ZWRfXzolrxp6OJ0J7
 OmBguBKu12C6YK+Qa476Pnp99pfD9Jo+Stz+XrNP1agqGUWesJeti7WosxiCz8xNg9PKvdXjy+o
 Jv6rCDCwrqyR2X15eANqKZi7BNBJR8Y=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aac0e7e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=aHOOhSd_e6fbb9z57_EA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170227

On Thu, Sep 17, 2026 at 07:36:42AM +0200, Maxime Chevallier wrote:
> On 9/17/26 06:29, Thomas Karpiniec wrote:
> > This POC did show that STMMAC_FLAG_SERDES_SUPPORTS_2500M enabled phylink to configure the integrated PCS for 2500BASE-X and a 2.5 Gbps link came up with no apparent issues.
> 
> Maybe the blind spot is inband aneg. Mohd, you were quite involved in
> this, do you remember where we stand on that front ?
> 

That sounds about right. Let me go through the older emails and the logs
I had captured at the time to jog my memory.

Thomas, it would be useful to know if switching between 1G and 2.5G
causes any PCS instability. I remember that particular test case causing
a lot of SerDes link flapping.

Note that I was testing the QCS9100 board which has the AQR115C PHY (and
due to its rate matching capabilities, phylink presents all speeds by
default, unlike QCA8081).

In parallel, I will try to test out boards with both of these PHYs as
well.

	Ayaan
