Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231B430C35F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811427; cv=none; b=uVe2n05iHRYVsmoumUvpwj6zigyFyziE4kgWNtYv0IP8fL8rGpez+Nd3cOQpzEm21FGeg5ZEeSJADIEZBKrlhJkJotRvUGgz2vX6q7xQivQcuMEWfLGnAYdkUvD9EGoxx2CE2P0No4KG1xq6rZRmohPXrA8Z8dNv5E7r1IxM8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811427; c=relaxed/simple;
	bh=dZblD0hsjOmoBk2xEtv+bm7XvNn1XdNoSJT9Xdp/pBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRLgmQU06Zr1DCNsuR13tDB4webFQzMx2/ajgifd6/SC4vMOpw70fy9A5AjTNfNCdwlzehZg1rLuV1aH6kJBSX5uRWFqYt5bgBh+uQ2l7FFWEYLIsLCYwRmxS28RMMW0O57byQXiLIf+SlUBFKQ522JAR10YkjC+7hqJJh3tFk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvW195Sn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hM/ijXLR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvW195Sn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hM/ijXLR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08Sx3292295
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iENrqNPzMG3pGs3C6u5aujr8
	2Gs7PvX4x7xUK/FQCmQ=; b=pvW195SnD3mOBU6n9GQiqKAZgqtcmA86QyBfTH7P
	rYLfQl1H/7bPQUvzWzSs5NN0mHnfqx0+idE84u3xDq5ub7/3D89oNRGZWzS2HSF7
	k1k1lf0EDuTgS7iX/1VOR0zPpXEmJ2uysDs0fn3+QPjtpeQ2RHaHYxfTSwhgEHAr
	5hZwLikPh+R2I0gi1JNNgO35cwJ286jn9mHeQ6oVq2GTrN5FaOAkGjUa4uMuDs3r
	v4CUJStCmYj2wd2t5u8hrG4Tclv0OQNwqtc+Zq78E56DCGdK1A5XNlhuYGVAtXpd
	Z1GwvysWt5M8RZn1YYlTn3xQqyTmtEc6gQTmSYu79Ym0Fw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3hgj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:23:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so5632746eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811425; x=1792416225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iENrqNPzMG3pGs3C6u5aujr82Gs7PvX4x7xUK/FQCmQ=;
        b=hM/ijXLR5DzRInNoz/E25Di3PW+0a4reCJpLjNyrA3a3fFQaxu6ITHZG2/aKzpsfGd
         XRHjTJktEZ8OqdXNIiK6tEVTkY4mFflPEGT5r9qBmzjlk6xxdkrd6XC2i+5A5yEUYLIu
         d8PnKpZzgEqel4RUtdz6+SotKHtFK8ZpZm4rZxeTzFr2/c+sqbilZCLuih4zOUkib9Iw
         ObLdPb2wQvNuPyuhhknIfcV46ESv/SX8upL/k1pVGMXOhtNFVWgbd2aknWdrYvnzExZT
         ty/IUCySvd9F0HwtHemn+1jYyRqmYtkRTsC68sp51RG8H4sWdsjekyENvWz7tr0rO/xu
         0nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811425; x=1792416225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iENrqNPzMG3pGs3C6u5aujr82Gs7PvX4x7xUK/FQCmQ=;
        b=PHF6gmx6LP7SS8TqdzQNB7tDE1tr/jzykc8F8HXcxd/3QUA8bEfTN5QqjRHA3iFmJb
         I7Vxa8oCMoiqMCH3K39xW4iB9VstXN/tUfCBHaIVnQxcpcs31WUiiZrjJbWta9CG+1w2
         E+QJ0VcEBaDR+3ORY1F1A0dtx5az1ILD+Ok6bNKXBWeNX2v2Nc1t3feV9JYe5bd9VUzH
         vfQ3+NKEAnt818c2k9S3tdhJmhygr++PdPW5r/o0NTC6aWobdF2eED+zOUOu+hglhFqI
         YmSQtZ1w6hhbdS1Vp3F64hfXxkq7OiMcxpqRBUK88YDPpRk9HCFvy5QnQTq8XefZ1S1+
         nohQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9IEldU/SJ8JswImcx/PmVwJl8DYSWkMsJLZYkGqHygDafcW9N37e3i0iqR+ckqPFojuyjEUjULQUm6js=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOsDXlX8+U4Td2q5M4TVh18W1GQGTglv2kfYSsMaYAeqHiteLH
	h0tjBwpxdyjZSbOk9nZkH62zBa37d/70aZx9h5+8VU7XfkHQAsheWzVWd2OY8ANSpZlLljEVoOC
	Qm2I4H+qPz9vWo6pyujGJk0bYol344WXUct1Nthzbc1PtFp3bqMuO4jPCXSkisxvv/4A=
X-Gm-Gg: AYBFou03O94t8hVXh5A6x3Y8wWDisyJkO8lOZuMB7c4vWsqx7AFqPmEADudngnb7u5u
	ko3sPDPCYuUMiUnhQeh6CHuV1fPY+WED92iXeOI5+VzsN5yubTIVzpn1xcaD8J+hNbjQ3kEJv9Q
	0Np1zk8u7M0QrpAwKCGSn2cpsqZkKzNTMbPxF/H7S4SvTVNTYOoPJNLrZVU6XgySmpe/ewf3HeP
	ICIGsgS5bbDuoPKrICcoCT6m/by5Pc0uPdqbcOK9hb2dg/lY2C92XvT7AucNCalGTh6lHUVLs8j
	dm7jbxVqUvqRUXay3ciy1gnsemyE4PRYsRYtzM9w6AsBABuCSr8Z/bcjixMfO1l/OQaLaLul32u
	TPa45hS4WIeCv7yA9L/gE1VCtg0dk7uST+e2g1VkHmg==
X-Received: by 2002:a05:693c:60d4:b0:359:2a1f:520 with SMTP id 5a478bee46e88-3592a1f0673mr9050420eec.24.1791811424532;
        Mon, 12 Oct 2026 06:23:44 -0700 (PDT)
X-Received: by 2002:a05:693c:60d4:b0:359:2a1f:520 with SMTP id 5a478bee46e88-3592a1f0673mr9050362eec.24.1791811423763;
        Mon, 12 Oct 2026 06:23:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm22827811eec.15.2026.10.12.06.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:23:43 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:23:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Add Adreno 753 support
Message-ID: <aszfV2EYMN00RJTP@QCOM-aGQu4IUr3Y>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-1-a06a6c57bde7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-nord-gpu1-v1-1-a06a6c57bde7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXweUpoYX7C/vI
 lAdGIFmuq6/GNTWCh7fOht44XFqXXZ426xLD86D9njvfesRe2FMU6eOFHwHhJ2F22wuHVt7suzU
 b0SpD5ePICVJm3BhsUBxotkpbkFYzp6a8ijtr4TQzW36oFYcrJRhfB4MA14ExfJPoRtSe8rU9jr
 NrwKaib57kfh5E0FckRqU0bVuXRbozPiv/bB47WH6H8g8icVJVkjtK2VIrwFTDV0nAvU+wuoBaW
 7L722Eq6IjsgcVfiCuQKHye/TThiFjk9MCZ/Dr0FcAX8qt4VQpuNACVdMvv1OT6SYvpcVG8/S6J
 ie85/k73H/jIDFGaJyXQTIJc+G2gK9o4vGc3bSuO2cfD3NM2BwwUrhn9yur5HWdnz0LLqjs3AKk
 jTf0Ml6XTYzP2CfMMG35Ydtw05iRNYDG0kNIm1UCvIFFvpnkutcbflewbJXSgd8H2nNlnyKHsaa
 Y3Php6JFPWTWgFVP1Dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXyppVXZWXvCL/
 lP7MTxGPPmVqseQQbvSFSWv21BUKME4n7o1IPZlwEQwhLeztPO/hjHT4kR45iJ9vvyDHOPhVpZ+
 PfNVKwiv1EvpPnpydPpCgjMGB69D4NE=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accdf61 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zFX0IjAEx0uK6ydxyM8A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: HscW_lpYPFqYVWBiqx5vTRK1KkDOsj6u
X-Proofpoint-GUID: HscW_lpYPFqYVWBiqx5vTRK1KkDOsj6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

On Fri, Oct 09, 2026 at 02:36:35AM +0530, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
> the A7xx Gen3 family. It is derived from A750 and shares the same
> IP-level configuration: protected registers, pwrup/IFPC register lists,
> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
> record size. The differences visible to the KMD are the chip id
> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
> firmware.
> 
> The Nord primary GPU is the same as A750 but has a different chip id,
> so it needs its own catalog entry. Add a new catalog entry for this
> GPU and an adreno_is_a753() helper. HW clock gating is not working at
> the moment, so it is kept disabled for now.
> 
> Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

On Nord Ride and RRD board:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
