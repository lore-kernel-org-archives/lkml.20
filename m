Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481B4F68B8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894296; cv=none; b=oIo99g26yWqOwu134sxjNSXkJxZHJqDfJzVTdKj38Ct5yja5bDVDDKC1WbY9I+bFX/OOtwSoH0luGUMllJD1coMMfDawzkQkQFIM4rqXvhFm0+7p4v/OZHLOp90Yy2rYQRDPcAp4bKgccYB21AjSEKfjdL/bDBOW6C2XgWr4Q7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894296; c=relaxed/simple;
	bh=qRrGhlXukXZ5o3JIWnV04cBN5y5R/VlxhK7glLTuCTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+Rmmp3MlNQYmuKjmGISPe/z5Xy1WzYxNHt0y70AiW2JrTqH9AtZkpn81x3kJf74DO0KACTDPZA1ucvkg77WLz7dCCEnU13vX9G3DK1eu0ru22MQWA+tsXAukHob6CPCVRRQOFdFsWLv+VN9IvUdGIcDjKtJzuBlsNQMU54AFco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXh5GDVR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcAdRXnN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXh5GDVR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcAdRXnN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xvo6790919
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PAZLkQNYwSb4nLxIcNZMx93y
	6XjvRKbla5HBgOI8foI=; b=AXh5GDVRp8iSdIH8E0cDJC5O0+llcQcPjQfnNXOi
	t0JICSEbOcyfOP+q8o6SCH+2oORjQqZ95XVF1KZcr5P7cTl/VK35Ap9iTGs8YqO3
	sWFEC2pHSYLzMltn4M1toAlq3xRSvAIl+x0dd5FPOHyQ6gZMBRTJiELR6QgylcDn
	O3h9SN76VpDjVU/72kqjy36TKap5G0lOroLTnEXtzMfGrBrBsGDQzVxaV6ltCiHh
	R1bDz3PEQx+NPje9aOf2N5cAfo7Oanh6pn8yKJFvEhqBU5bQiol/wmxUbipn1FXo
	Y06p0ymDctkgmBERAJIgEVBeTttIT2amh241snSI3kshhQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrtnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:24:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso587010085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791894292; x=1792499092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAZLkQNYwSb4nLxIcNZMx93y6XjvRKbla5HBgOI8foI=;
        b=JcAdRXnNmdgjpuyQwXu1hHGYN6z6jFSlhOra8K7gvrmdbeTuKI6dEpX4REEOE6Fd4w
         NVKMypaavQiblARjS7/5Odg5/jV1Af5Aq4mQUBw2q6huJ2O9v8PZMlAiwU9F9vaOWjfE
         tVIBtwSxbpX1FsZStP/62wFaQ30U35uxU2mgrZSb8oFJPQO+UnSzRkKeNl2YcFmJKJy1
         ibkOqkQu4Aqs4NQ6gr16bFdkIfFJv2AHWU7PCuPGr4cyaXoJ3wDUGyZxdLpjI60xVlQj
         uzVZUgbif404Po19sGE226LbC2nndK9wwKgtl2xRdOT/t1fawfADCF2xF28FwHFEoTT+
         yBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894292; x=1792499092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAZLkQNYwSb4nLxIcNZMx93y6XjvRKbla5HBgOI8foI=;
        b=hOvrmsa63ro7nPKGnXDxu2XcmrUspW15AlvA8YdFsb6Ejxal/Tq1cNEhI9LOcQMbZW
         8lru/a7YBSH9jKCKPnXTs9Y86tU4UfqylqHxWJ7jCOg6WlMn21+izOAOZohvsFypovq6
         sHErdd3EHHAthbl7WtO/Y+w7wHLCvJ/vz1HAxqx+61jVRKRQfnVt+/XAxLwi+9FCNFNJ
         DlAmDjx4PvSKoFOc5SxcdI9C41naEAhFakmTRKEVuB8WQD57BI82EOciGKVaiwd6wdKN
         C1L99O97NygPslnvXIr0JTaScXaTJRKu040JedUhYQn9tX8aTEosR07uW1EDRZe0qISv
         Tu/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFvCLHMu22Qi7RIwRcWHhsVRMniqs7nIHw/wHlTJe0Hzox60h+jfdyqY/FgPBUDvAgwPD74lel6aUfmbQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpT1HyZmGTkiFZu6ZizHUjefzb+dsjBl4un4YGDIu4ctT6G66Z
	et1UbdfkcSz6LvIvszETv9mRtFqX9cYZKwRLaOp/pNU3A4yKxuL1V7qKP2LNjjAhzValLaEfVB+
	grnlbeF8PE3DA8I7qfRi54plmQxTLhkGvRhcvAB1iCVckrZaA8MdyOO78txTsiAOpml4=
X-Gm-Gg: AYBFou0aAsnKVHYEKyyCNCBTtYfvR7ZXBLoZAL5v/Spz4xEka5dGfauI42LLI18B8I9
	d31cvGYYuAfMethk3JtcuYeFGH9zEHJ1kBMrJApfzgpdWA/6st5xmXsRhsUWw7n0Ds8Dz1PBnSl
	zUQQP1OvHRWaEfmEZmiORaN/vSE+GlPI5VjQvHo87+1ZX9an6zULZNdHfBCwD/ZtCsiCwQNGetn
	V+boz/t29pSnPxNlxYy2tMPfUTzECydqkBkhQ6LhZNEVDzvsdfh4LILwdoOUMAcfPqmOLK8VcdD
	MEQmGMELCDlZntzl3srEO+U2/I0+NbvwaqJSI/C+23M/cEqBHWxd0eYIHx66bPs+kNfZAkIl5cF
	LImdjTWOx7ajC6PGfbZNswyqYjM3S+EVrpfdUhxTbg+huVIwEq4TU9fmA5fyT1qgBEBLaXpJvv/
	AyEMkToxYJjbWB
X-Received: by 2002:a05:620a:46a0:b0:93e:9292:1b9e with SMTP id af79cd13be357-93ebd0cc5ecmr2058379485a.1.1791894291942;
        Tue, 13 Oct 2026 05:24:51 -0700 (PDT)
X-Received: by 2002:a05:620a:46a0:b0:93e:9292:1b9e with SMTP id af79cd13be357-93ebd0cc5ecmr2058374085a.1.1791894291411;
        Tue, 13 Oct 2026 05:24:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf28292ccsm1659124e87.12.2026.10.13.05.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:24:50 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:24:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
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
Subject: Re: [PATCH 1/3] drm/bridge: stop mentioning deprecated
 devm_drm_of_get_bridge() in docs
Message-ID: <yvuokyvf7oibaihrijfiishlxhln2cateqd2x6derkrnss62j6@zfkekkahovzy>
References: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
 <20261012-drm-bridge-every-panel-cleanups-v1-1-0fd272f486b6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-drm-bridge-every-panel-cleanups-v1-1-0fd272f486b6@bootlin.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX+tHfoSSfY3k5
 Poo++OI3G3XlG5obHRYL7ZsvVgdSAi7LGAmT8rnb5gcaHLBcjNsRyApiWA0vtxCCgfUVJIpAQER
 gIR2c+6GowS7BdlYxZKOSZwpyuMwwa4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfXwg/OQBVfUiqw
 0xSPnpk/zIDTtLK3iLK0Iy9wpFfisBPxWviHD2XuE0fOG7eTnlKphEHXRSOQjTO2CSSajbTVTne
 k+OAvtKwNQ8IyJCliCg1pRW9aUox91LB9qSeW14gekAyi8BrtgcRm4sXUm1Z6AZxb/TgPH4+BJT
 wS2HGeq0j8Ky/HTA4B3GUDy4pcQWq0v4ynbXbiCX+Sk64nQ0bb0xvzc7YvpmI3UV83F973kwrCA
 xukmhNYBwXG65VBh2UtKRUptDX6NF6v3K08R+zm0C40oEAt7EPmxVx8OTNPss/F06ZtHFuLS3XV
 u6yEQPlTs6x+ntQUelBK/lEPaqBfPDBAiKrQ1uGz8vqfVmT5NLXqd6p37RYyPWYdwzluKCAF/iU
 yZCGtQZgdr+8Ao6VfJ+wB7CrRzSbpRhrJALqdlNjZMP7An1XjjYTmyjRlFHeIFut/Du8sN5VUEp
 vjTMK/5dzz3htdVNMXg==
X-Proofpoint-ORIG-GUID: j3hQaxDrYY1NxDge0dgeUWO-WCMuMpKr
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace2314 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=5gYlZd5X36b-6VqQ97oA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: j3hQaxDrYY1NxDge0dgeUWO-WCMuMpKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130049

On Mon, Oct 12, 2026 at 04:29:51PM +0200, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() is deprecated. Update the "display driver
> integration" docs by mentioning the currently recommended API.
> 
> Link: https://lore.kernel.org/all/c1b065c8bd926708500b7c42864279e055ed95d0.camel@iscas.ac.cn/
> Suggested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
