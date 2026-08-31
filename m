Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECF6449992
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788201578; cv=none; b=svONf/pBZmlbUfb15TaH/mCgLZUD03a3VyKhK5c1U5XqXDjpZ+Y+VRB+YQtevygitYhXYhMHJvKy9mjNnT9Rqnpl6/LjhKTYFa2INPNmPviRNuMef457fqL8NJMs0H1iQ/63S8BXQIodyrxnAA3qOB0l+ngjBU28CninxcSzEGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788201578; c=relaxed/simple;
	bh=vSWGgy7165n5HscQuY4VoJZwjj7zMUN2+1Bm5U0tmng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BK1Pf4U+OXMNmGaZB+D1dOWlfQEqKjJPcyRX1Cb9S+oM5Xb6KBtKoefQzNnyxxyg0HPsg9COha/mv4z2suv7LdDTB8W8xR6FSDn5XMia79j0zOwZ6rObt8+gu246AFZpCZk6hLnX8W7fLfb2M7UCmDW+89nYvfxdKrkIHKjmqDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUwlRdwb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lp21MCXI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUwlRdwb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lp21MCXI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIYTAX3897911
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QxMgKDaOstJSBOtr31wH2Ju7
	pPTVHzgnyzroxjk5cwQ=; b=BUwlRdwbqPFH9U8TJUQ8Lxi54h6uiWVZfIhEt1Pz
	fpUKCy9WUIbLxL30OgDarf7W0vW6P5vZqFKpX8b1yCPfhNCroNF35AminW+q+ZMV
	oGLc5JLaJgG8Xr7/qDfOV8dq0zaJdlMiP7XLl6D++oPXOj7+zWl/EHz8FFRA+30z
	SRoz2FMYrXvv0pYaqv95ZkK0iN05JQvZtqbuR4KL6BRAqwrHjuz+A3QL6VjiWgvo
	2nDjq2zm6RWnpn9Ncib/2pW3aCpkcMV+23asLcdR+d93vRn93Dnzs5ZMEiz8lq9n
	eUD1EcMHC/OlaVcm08nh7Y7f0ZSTK9DFGSrraO9IknmhbQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556u0sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:39:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so910589a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788201575; x=1788806375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QxMgKDaOstJSBOtr31wH2Ju7pPTVHzgnyzroxjk5cwQ=;
        b=Lp21MCXIyIdEupxGHQxmDXWNFWV5U5Pg/Q6dVtqq9A3HSjKKa1DcFgNWNoSY1H4Z2X
         1AMP4cugmBoNaTBB+hntK8hrIOsVDpiz2D6NThA9QmzXWMkxxM5gxmf1zpaf/4eLD7/H
         XwHcFrUtkbK0bNXabHlstgPdcCWZ8WvcbcM1ekt6OxYicef/UPWcYPwR5RLpBVXwPyVh
         4d/vU3mej2QgR2OYIUd2QhMTGln6JgjZIBczp7n9FvrlsC5cn9Vm//E66OC47HfY5YYf
         RIjj3cogHjtTP8F/C3YpVD6ILiCeQVch+pqpiz3USwWdxVYwQBSGvR4CbSG9FZ08ZXXR
         dcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788201575; x=1788806375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxMgKDaOstJSBOtr31wH2Ju7pPTVHzgnyzroxjk5cwQ=;
        b=bgHg4frEDOywD85JFek1S84dfygb9kxzCcROldRvvxEoWkOlCj298g6N3SNIK2mDMx
         TzPoCFwA3Y3+1KATGPQevSzbFiznRd4xT7yBmHRvUebJ9/sHz6U0uOejrStX1wYAiCNA
         ucafgwx5gsCjIkuoIOiMoUo2xYazOPm24EuPPSLGHrYxMm3CG935PDOCKP0oEjdpXSHD
         U5PFOhxxJMUDUuo0sCjA1v5p27o+G33K5zALAb+ZpyNTtV40qFeTLO55qJbW8dSV5u3G
         8okFTp4SFCrZ0AA13juVCrc+PcbnTDt+fkKTVGOZCTpArix03q5z2JN2mGPHS5xfEei/
         DkFA==
X-Forwarded-Encrypted: i=1; AKwUvByS74h+CVg9EQCZlJdO+fxMuiaCqT+a1L6uHJMJ5db8W5ATtku73KTh0ixUEArEg0KGKI/t3qcjMzMQwro=@vger.kernel.org
X-Gm-Message-State: AFuF++lznekv0GOcOBrxx6bzfgXCMUKUrLpIJcnSDvS7bovJBFD8NxyZ
	Kiss3Erq9cZIDS5xJ5F5cnQmkg62AqLO9vIsFmknQ8ACcauRWxlr8VoACaMtvhh1BPSbUGCJ5DG
	1IjjbMGOP5r82LbC08s+9jPdzFySor4YPpQjC7X0nocy/dRJIQfAHRryX7D0Ko9ES/04=
X-Gm-Gg: AYBFou3kIV0yqN9BtRxLs7pBDtRaQFYIjVG8csPwmhvPf+hieEZeK5DF7o8RFDKazxK
	xdB/1XHiLjzvDAnF3pO8jOwS2TdNWE0uNAu8Sw94TEBH2D3d3Jg30dq05pR6dNINNKx5N8goT/F
	L0C+uFnUcTJY+JIMkflpYSkL1EvogEEYR8D/4HsmRV3WCnEWtjcDiDaThLjDLT/7rtyErPV/dkg
	0t4zRZCdonMn2bHEINOmK6f2XCX0i3psx0qxwAWgv/I4cdWirgbZEXo+Ucj5m+pAQYkmUCIYDt1
	3ns2ktBq3XUkP9KWH1kFUyEyxwM9EyZ89hEMmwpjzrphI/YqNKBJ2LPYbPIJ6klftAwCOvTFAeb
	zy1TeWG/fFeKzP09ejojYzoXPfA==
X-Received: by 2002:a17:90b:4ac9:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39907aff7acmr2952476a91.2.1788201574749;
        Mon, 31 Aug 2026 11:39:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac9:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39907aff7acmr2952407a91.2.1788201574207;
        Mon, 31 Aug 2026 11:39:34 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm28349715eec.20.2026.08.31.11.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:39:33 -0700 (PDT)
Date: Tue, 1 Sep 2026 00:09:24 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sunyun Yang <syyang@lontium.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v11 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <apXKXNBPA1slpAXi@hu-mdsor-hyd.qualcomm.com>
References: <20260824-lt9611c-v7-v11-0-eb4a79cb597c@oss.qualcomm.com>
 <20260824-lt9611c-v7-v11-2-eb4a79cb597c@oss.qualcomm.com>
 <178766696083.117435.16339828039068931624.b4-review@b4>
 <ea3accea-4c20-488a-97a2-7675f54fe401@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea3accea-4c20-488a-97a2-7675f54fe401@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE1OSBTYWx0ZWRfX4w8rQPVkcXb2
 7lXhlxXW9phk6Ig4d4TdGp/SFwakeVnIhtV7pGBGH66Pvcwfwk98mPuGrkot0kX/nASJC+BLJ46
 bx2VBVaqX+3m9eemZ2xLE4Cg8y5QSGg=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a95ca67 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=BWdvLCTEkTRRry6nPpcA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: O7gFgUX2bP7LGPKPpLloFmguIJ_YwlOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE1OSBTYWx0ZWRfX3/yDVx4DteZy
 IBI31dasYb7E0KPm6TnGA0hamFn5lKHV91noDnnCWKR3e9EwvXd6T9OZMVCGc5oHfwU8iQ4f6v2
 KZ0e8Hkt5LAhhQ9Ns9g/ccKajf7WFj7Ws09xdWXE4vkA0L136+SUAto83LIO7DOVLMDoVgmnsAK
 KAHK8d+ljjAOw3KNWpqnM+ZTfKBgvrS9XT46qxBkzfQHZBzt3Tr1GAuJo4MCIdJO1s50EbgSdD8
 yGeF1/5YQDIn+TJiTsPrSWXwnOcVWX1dmRqkXQq1+k7zMmggayCd4H0IYirYraeADmaJiPHgZ6m
 nlq6GCis1UkiwjwAwohnhmM40uSs/rJqLLRRag0jh9BDzRhnxPeoJ7BDb9L/e5oFWzn/mzFfOty
 SZaDgNeIugIPZTcB+NkxRKR3P0Fl1lfXacPWCmM3jdWgdoKW4MT5RGlvk+7gnnz6immIdbbFbXC
 MyGOYzbysT7LV+OwFUg==
X-Proofpoint-GUID: O7gFgUX2bP7LGPKPpLloFmguIJ_YwlOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310159

On Tue, Aug 25, 2026 at 04:29:32PM +0200, Krzysztof Kozlowski wrote:
> On 25/08/2026 16:09, Luca Ceresoli wrote:
> > 
> >> +static struct i2c_device_id lt9611c_id[] = {
> >> +	{ "lontium,lt9611c",   (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611C]   },
> >> +	{ "lontium,lt9611ex",  (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611EX]  },
> >> +	{ "lontium,lt9611uxd", (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611UXD] },
> > 
> > AFAIK there should be no vendor prefix for the i2c_device_id. Have a look
> > at the docs and other drivers for the best practice.
> 
> This is because of bugs in the driver, which I reported at v6. Code had
> NULL ptr and to solve it, instead of fixing it, Lontium added such prefixes.
> 
> Obviously this is a no-go and they MUST fix the null pointer in the
> first place.
Will remove the prefix in v12.
> 
> Best regards,
> Krzysztof
