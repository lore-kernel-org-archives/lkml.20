Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6894F93D6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894329; cv=none; b=moclSCVeuOKVGIGgWKExbpMzl1yz65ErC1yLNaK/7Pbic4zGOG8PeM+iJH9WiaFWABHzZrDSZZoGGVAikBzU+aZJt/qCXQcXhkv6xWh3Ls8XnIWWM8hUyvsAryPaX8jUiOfUA6gMNIz/z/qShDQHp3CQTEnl1koQWOo7Q8YyVZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894329; c=relaxed/simple;
	bh=Qn+TdJv1Of3yQXxmLacqekpuKkEbi6E7pBKkZUaVP80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+A7whMG5fbFNQfL5HrNJOL1V9OOQqJqmsPhxJ7SN4LvfptFSk99roLUSya9tozOBikrqRAXibgCTbDacIT4IeLJ51MShs8FxfkAufHhWGkDthVPDwx7BKddzj96GIbMGYP+yPp/kGaYF/c5HrJ/mPn9jgQc4zS5QDzFurCqQ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQCq8H9t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2j6UU4Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQCq8H9t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2j6UU4Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OW5d015194
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0NaLOGfX2FR30Kjmhhwie4bd
	r4Qy5ir/Fkx8U79TvF0=; b=iQCq8H9tMWMtZQBBjWDJmZqLL9S4xmpnbamlAJoS
	bcRqdLFO4iJGe+V/BaJxhwbT1J5068qD8R51nI8Y/uXLxyfy8mXORI3E7k+CTCiB
	tm3O76pCluqyX3lBcNxyApr0PgzuMMCQxPP9v6/MLO3bWQ2mivv118p8Qo5dPWGv
	oSARY+u44+90XfPTC1pBw3RyyQy0u82gQVCgQDR25ZnlPQ9+47gY961cWCfn/MJT
	Vp58deyFNeQWXvQK9bD1gqQurNep2HnhiRm5+Ty4/uhLw5BAWoCqsbE6i07DTY+T
	FBIoyzglwYHEeP9Zo6Dn0fVge8EWfJsef7H1LqvhRtux1A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uh74g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:25:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b4bf686ceso102189536d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791894326; x=1792499126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0NaLOGfX2FR30Kjmhhwie4bdr4Qy5ir/Fkx8U79TvF0=;
        b=E2j6UU4YH8z9h8fG2eyABokCxZ1t1soCFw7EKM7MKtA14/7ZW2C1xqbvWxNoRrVvXQ
         rirUDFhrlu47oE7rfJGlda3CrJAIRoKj07Z+XI2v/kmTLL5HACjkh4RmzhRf4cPWKWKN
         N9QXsXWPdiq2hl0kmrJF3aFDAEvERT5pKlPF5qzfn1pkZ/qc9+lJRRPw1+qnU7GDSRgf
         kMRWoY7hzzMUlS6Vwaa1xwLqPMRDbU65W2hcNkK4kCRzTVWj//wxVKCV93ByMR6/Kooi
         8vExmgIHFNqD0pMuKDEZo+IPrTx/lSMxcjN/Tpq9Z0UWR/Pc5AOblPoJzMzopSB8yLyJ
         74qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894326; x=1792499126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NaLOGfX2FR30Kjmhhwie4bdr4Qy5ir/Fkx8U79TvF0=;
        b=dHrtI1eFYNJp3LDSy+k+HIhbAb8v1D81oI0v0QIQoWiCPeRGr+SbbzNhos58k3A3lB
         rlpALcMowV7dA62IfQoNlk4qi1H85gN6nh4MpdCi8Cwd2sjEmguQswy9s+LVe5IHl6ug
         iheSszZOgiOAPUg+6GcVwB/VnIpSh6RfN1zdiqACIbCagSsXl4QPvAcl6z6vWMr2rPCs
         U95DCuPBhHDGrwHZ0EJHPt0yvPM8JSrjAxPF7Oj+Fu6QFfUkIhWbU2UzxdS5l5Uj4LYi
         c6THbJBqgXAotWRrCZ337pgjD8uMJFc8VaU0VGs3IMoysW1t9ODFZOx5UTc2VGs41Qg3
         f/ew==
X-Forwarded-Encrypted: i=1; AKwUvBwxg/2Ixkdhd3z7qfLkKRedWrbaNOZYImMz2i4FTlsMRG2Z/+gsFVl0O1ypdnmFEpkR66tJnSsSz7JIx5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIe7PyWOtnWC4OQ+EkggmU5kHJNk89Nm1F22CNpEM4E9HNEdNFv
	LWjKE4LlqG15LouRJ1H/KEeJUg/MpS5K1iyyQQhChowiVeP4YjDIUpdsMg9VxEXq6EiItXDBLHr
	yS4O4TYyQzMksvbhWryZYrn5dvPFL2Eojj1Z0ZJXd9x1J/RhgFWsDLBm4lxwxnsLRwT0=
X-Gm-Gg: AYBFou1Nr+rEGATgRe2mKtiQ9222MtP2Wbzqs8XSvzug/Iaf9PVvjcNvXDVrwpBqmEM
	MnY4XfcFlPGr9jb9Cgk6wxzMi1JuvpO6Bslqec9/VcFzfHPmynREAkeqbEwE/N4wD8t4xN7tugM
	AUrfgCzj/Md7LnJB1fD6EcGnyhWwemMkTEiK4TRsMaWH5KTu2MF0rgIFocf2sFDo98vZaBhztEA
	978VASgnj7raQfi0QSbMpXR9oWb4BZx0uHWqUu7GuLYGer67k4sTUVpiFGK2tM0d7d85YUvoCbM
	mk6mmHX0BIPw9pMa/UAhF3tHxho8+G2WcDqXFq+xMiEoSjBTAvQbhi+ztdsGB+OoqydS+8mh9k7
	ddk6Slg4argZW1XdlPg2tuF1KSoj/N/Gp6F4pIAxzc9VBlFFPiv2ZeZxOf/zzUg8j9wicsWGe0y
	MEMrQp9/iMEuKl
X-Received: by 2002:a05:620a:4489:b0:93c:5c60:c3a6 with SMTP id af79cd13be357-93ebd2a6dbamr2056679785a.66.1791894326322;
        Tue, 13 Oct 2026 05:25:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4489:b0:93c:5c60:c3a6 with SMTP id af79cd13be357-93ebd2a6dbamr2056675385a.66.1791894325758;
        Tue, 13 Oct 2026 05:25:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeb5826sm3556465e87.62.2026.10.13.05.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:25:24 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:25:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/drv: stop mentioning deprecated
 drm_of_find_panel_or_bridge() in docs
Message-ID: <mjsbtv4bm5hvdtmok566pqmmoveb5vqyo5cz75vqcta742xnd5@vuavhsjuoc6w>
References: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
 <20261012-drm-bridge-every-panel-cleanups-v1-3-0fd272f486b6@bootlin.com>
 <20261013121450.GL56180@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013121450.GL56180@killaraus.ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX2YhztM86WkG5
 TwwbQR79u3hqtg341pTWalhlJO2ZloFO0TceDlzkKY5j1yrK1crwGQ7FyxdmtrvI7bhlArTXA6m
 ZlEYvLEAHi1j4j/EgQETX3OYMQbENBx5az5XWQgl8uIIFQcgpPJkWIwmE2OfO5Sg0YBGgATF8Gu
 NmdwcNJQ/KE/IJ9ezRPySy9mmn3vty+jXJtXyrE9KEUYaMkv64izfshJQaj5M68Y3GIYoMyZpL+
 NyNM/1+9BPPPrST9G94iSA1atW6ec9oDZVt8Qya95uD82Z7VY0O4+tsBkKXGmFnD+S3QotFYxWV
 crNWwQEKH1e5/EhNRh7l9Wz6YxcdIi3hBduunjVNWXFvcu4Erjb/kK2rTVDtZmq5xwIyHMZwlaT
 kC12xd5fjTY5SYlXtL4k56ITM+qmexPCCjDZcX3+hsgjxyQlJtqHnYHTtnVSqyxRugmK3ziOBAa
 h4UV2VUWlqW4YjZcJYg==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace2337 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=P-IC7800AAAA:8
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=mwiDrI33pxUzkAEjcyAA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: TGOq6MA8dGbv-QjB-4TNy3QRVdlGdXNY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX3EbRccfi7ean
 ilIg2aFm3sE97GYmmaE0cFXUd4elUA5JfcH3xxsAuRkmzkSL9yfF8EDDYKlE3KAQyKWISknzFko
 FZnzTTyM4aBSzI70rN1de3A9MKV/PoI=
X-Proofpoint-GUID: TGOq6MA8dGbv-QjB-4TNy3QRVdlGdXNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130049

On Tue, Oct 13, 2026 at 02:14:50PM +0200, Laurent Pinchart wrote:
> On Mon, Oct 12, 2026 at 04:29:53PM +0200, Luca Ceresoli wrote:
> > drm_of_find_panel_or_bridge() is deprecated. Update the "component helper
> > usage recommendations" docs by mentioning the currently recommended API.
> > 
> > Also stop mentioning drm_panel because now every drm_panel embeds a
> > drm_bridge and the drm_bridge API is recommended to access panels too.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
