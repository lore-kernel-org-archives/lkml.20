Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23F9288B9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849593; cv=none; b=jfGc2FOvY9YuZKRIQYNxPhxVSs0SknJxuXV7CH/lSCt5g+j46zil/Fg2CNFqAFLm+osjqDE4cdGSm1nga/sKPiEA3tGExrvPBhKhpjWzh5/tFnk86S7KTbpvx5H7lR0+JEQT3nFZPioU9aSpqh3sp8by9tt8P9D4lVvZh/umNZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849593; c=relaxed/simple;
	bh=Ni8mGAMCiJVRaf4HcuQoQwnIBpWX2iUMvv56feaCAAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3XExNk/xPPfwY766Y24IJmqHfmqVEY0w8w/hj/n6gJwkyQUT2a4Z3x6wKYdaYDe1/pNo9zzOy83zf/7Uc2JuauEIDK0ivZaWkriM57HF2AuUwo1Ce5qdI0mpmC6TaqQ+4btyaBaN0/3eWqwV4f8szHjRK0ScHO0nc2ET43zH5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GlEvhpvb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9l7aF2W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GlEvhpvb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9l7aF2W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xLoL1932287
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 10:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bWmNAyB9T4vvPsM8pT9vVAZU
	F0SnZIMbHucMu/isPPM=; b=GlEvhpvbD9d6wnf4sJxOj+NvdvoGuEvrwsy6HTjQ
	yKdJRuJoO2eS4JeFVxNJCHtIn5igd54m98UfTe+9uu4K4fKDI+fDT8CcCn+Pau+C
	1ANtMa7YGZaEcgFBnG6gy1CVUmFnCbPMRnSMZwUllj1bT5/Un70FNzxSqSbOSasN
	UO6hAEzMmzQIJCb7JOLxCpfCIhNgjW5lUMFyaaTNKZRlRECvzdkOPWB9BudF+Vz/
	5jIXz0jbxyLExl7uYsg82SwBvCbLbkmOV4Y4S4rJ9QrjEnnoltoblTNKnJ7cFz1J
	I+IVu+l67g1/+sHgThxoCPnkgYb0xPZXwv28TpIto4jnKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5abvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:13:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so1295412085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790849584; x=1791454384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWmNAyB9T4vvPsM8pT9vVAZUF0SnZIMbHucMu/isPPM=;
        b=R9l7aF2W3KdKvHxgc8bHsqozCkAC/3ZDrbRiufohbgg4K8dsIEbNxCU+WfzIqIJO4+
         cDiJ6AUwbPFb2P/c1UtMf1GhCuPHV7g2gPhEH+NuPX0HFY8Ii01kMhaqC5Psof6Jke8d
         cVFr7Mblr5CEPph2rWpNCQCqIw9KvOETIPStTMJFDSKIfq/VqjK0K7uopLT2/kofxg/a
         9H6XFwGX8YXxK1rYc6eUAfK/rNId9DrsXV6Yzg4ltMx14qdSbs/AqZmBUHoQXygqhGJD
         r4RW/B0BluR3hxnZgzwX2dFbmw7S7ppQQ1qyPf3X9GejKN48po7O4lnTCdSx6YvPsF4L
         HI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849584; x=1791454384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWmNAyB9T4vvPsM8pT9vVAZUF0SnZIMbHucMu/isPPM=;
        b=WIscKYW+GBcqJnYi4CHERhCEjb3CMmcljFMj9bfcoDyskQOnVFF/cuyKQa214EVWH1
         7zODn76SuukAix7zmtcbCpRrFkHLCvMyy/3EOeV8DP0XUlkkAD+JFWPPihZrh6fJjvZZ
         MtAsCLkMBMax5zhLW/6HLUcalGpz+Y6lErisqaVDJ1Cy/aNdvnFK56oAgVn2dEzJ29Ep
         4VfM9iKwZAdky5eR2FyNdf4N0iqoA379AZa9n9hBGaDdJRGtxUEjx2qmjEBtVIhoCMDk
         a9HUmwilVRon53/4YPq7i1d85kkHydkvR6P218gR47noRis+9ZtdqPb5FlPMnt7y6WnF
         PGYw==
X-Forwarded-Encrypted: i=1; AKwUvBzI0150rA+fpD5Qba8suU6sPGVNtbEQu8/hxbASkLAEFtjbBDITYwtEn1BUONd+f4cq/M17fk6/jOLuuIU=@vger.kernel.org
X-Gm-Message-State: AFuF++mjwhdr+jrkNChiLXPt+jHoDhNe6I39L8xZGA8gnEgjvkCFVLq3
	mcSSMYEWWA8kuS+YYI28jZXUNWA3jaqg5Js3mFOkt84WpGgeb+qcIGpRZKtytQ1Uz3eZ72E4Pw6
	4gfj/FHADM5vdUopCuXR0j2/FP0B/CMC/67YRQTVZCxR46I4hwlZXfxzlHGCy1hsVlF4=
X-Gm-Gg: AYBFou2oRrQTB9la6KfMn8ErCDODq1lDHLhKHgAwRI1dJcbWQOKLKAR0Dr0ifsa0/KW
	c3iTWZbbxLpA8A8Ar2II0TWpXrxJC/8gr+/OD8s4BJDtifMyD14aNaua4j48EC9esr+9dPpouiD
	p49UctHbCO537EkEjjX9fE06esf2k0t2vC2Hhga+U3UWoERwF1CMc74OiUJoDQ5t3M/J78Wsf7X
	4sIBQaDaODz0TUjIwrdvYjMDIcANnevPTpH+tGCEmZC6nowQx50qmfumNIYtCHVv2TQ1IEuh6Qa
	2LXub9oCkxf4n0uCazEHzbMSC9+brBXy2UXaRam/v7S3ohBDGOE5ie9H+XRO4JjL8/BzywgdlPP
	u4sEL7FjkfY8QvFo5KD5F5Kqxk4Sp27QRWmvyRpvm52RDE1E9QcB5KnEh1bi3p+YCFZc4AoXGHD
	cqXtm/at5zhqI4
X-Received: by 2002:a05:620a:400a:b0:93c:c162:125b with SMTP id af79cd13be357-93cc16213c8mr80111185a.39.1790849583969;
        Thu, 01 Oct 2026 03:13:03 -0700 (PDT)
X-Received: by 2002:a05:620a:400a:b0:93c:c162:125b with SMTP id af79cd13be357-93cc16213c8mr80106085a.39.1790849583434;
        Thu, 01 Oct 2026 03:13:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a8793a25b1sm895251fa.25.2026.10.01.03.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:13:01 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:13:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/35] drm/msm/dp: Pass panel to
 msm_dp_ctrl_config_msa()
Message-ID: <fczwdw4dwd6tkzaznbvnt3yw52ldeuacvye5v76rom64xhh5hj@pg6civv5gtvk>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-2-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-2-4b81473185e7@oss.qualcomm.com>
X-Proofpoint-GUID: v1_Cj7qcLPLlIGrEpL4p_H7b_VDgyZ6o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MCBTYWx0ZWRfX7IuVvqESPJed
 icCzP8xRzbcP3qLudIT3oxu5B0oH0wRSFHUOUlkCn8vpSg6Tcsu5u6JuaO7I64sa3PnF83Pi01u
 BWILNuNNHdKTZd9JLV20IRsvn+Dwd1E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MCBTYWx0ZWRfXwV2cmUFAfF3p
 RX5JTM7bGIuO+9GyTqvGC+hN5/ohBHROwtjguG3+bJ8GV3AoK1VN088R5j/daWKJPvLFO12vSHQ
 8QPZE5xEUDvPGjFYh8dDJgmv+sAbnk19/xPcWdazB2SmQTxUKSmQBvtWQ/J9vnaOy1lrGiszyZF
 5rrc4pakl8w2Zd7Pa87D8BIdNtkhHd50uGpVSFTW/n8q03BtwVfH92UOLATXafYXrTVtrvl+5pl
 Ddm67LeIHkpMGTAHvCldnS4EQYfjzdfFBBBj9D6WgXB/q3rF2MbJgEznri4OndTXh/bMXqyLDgL
 O7QhTqgUqVi9l7qiQ3CtbaNytzK1ljFCjiRZo/RvTjJKU3XuWfOEWLf05jOXboVLGF884PMMfVc
 uTxL4O4n5MEg2cLosjX6JL+BNIg0ZCANXfaUiiU86nIVUwS8NnFVQedyDLtzUNm2X1cVZjQnzX9
 02jn+nSQIMwXXcf6qPA==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe3231 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=tDZS55ivhwD-za0uAH0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: v1_Cj7qcLPLlIGrEpL4p_H7b_VDgyZ6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010040

On Tue, Sep 29, 2026 at 12:25:26PM +0800, Yongxing Mou wrote:
> MST requires the stream ID to select the SOFTWARE_MVID/NVID registers,
> but msm_dp_ctrl_config_msa() currently has no access to it.
> 
> Pass panel to the function and derive the pixel clock and pixel format
> from panel->msm_dp_mode, preparing for MST register programming.
> 
> No functional change.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
