Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DAE3368B0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025573; cv=none; b=NdBCEYYoNu8MWbgo0C7FeEiPvhH1VyMvl2hC6PMrBGEIpxgCBXPbv62m3Gdru9816Kr3fHaBLDVv+xYQ14NhT701Dih2F8ttl3aPXDtTA4HvAZ/a+FibWkEHOjp9/y+O3Hu2Si0dsI03rbA3pMPQ+g+tlk9Ew12Qfg0olrSHTuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025573; c=relaxed/simple;
	bh=EIZwHMOV70u5kU21l9SyY+RZx0yD1wH92QfFQM+jLd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzaOQitjSns0ENjz7zWnIfzpoI1S/fkBbzuj4w6X68pfuW9H6AZiIYS4CbSX2t4FWSN8/3Mane4rxJ4KvuGRFmsL5ke4cV9kl6bMBuI5pDQF4w11vamYsbUqko6OhdD8/XD67eMg43lY2OjzPU5W7l4Z7twvWA7opufbyOawV9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4RxeKsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eerSxhZz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4RxeKsT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eerSxhZz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GZXF4187833
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p1biPjXoqkcIS9AjryIVISjx
	YjXFGn5GSiR/aDLhs2c=; b=X4RxeKsTtvdvWjwnPseUOUknA4eUzGeTrQN24zGB
	d9V6DmD/bvTLsUV7IDlENkG1mgmmN1FIFNIyelmU9lHGsZOsOjvdu/ZCKOz+VXgX
	ZGCKpOv4srTOEB/ohJ0fIsTT4GJkj6VeQTGB5brhKXyVOHE/MyY2jX+oJU2KGqS7
	xdf5SyUyKn2UW7p/PKT0nANuwnLknD+spwa/st+XG/m11ANdcQAcLlknNtOyv6U7
	etc7rm4CrtSri+ylO+dbFg4sQup8LJPIccN7+Qly9sWX5hNMa0njoDkjjfRe5rMO
	Lo++hAhQz5c/S9jrFT6lDDCAbbS1lvd6Q8EVDwpU449eVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygtndd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:32:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93917f4ccb4so828338685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025571; x=1789630371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p1biPjXoqkcIS9AjryIVISjxYjXFGn5GSiR/aDLhs2c=;
        b=eerSxhZzgYVoxKnSSu6cNpkh5TEV6wldEIwx1MKN2Zc77HMxzN2np5625eeJDQ4Pre
         p9uNHRwBSIxg4YMuOyNipvQAswL7vH5uSYEVXLpNYxMQcjB8sHCpQxmuPzzIJR9AVFNB
         +6bDl+QiwzVxOQQY588D4opBMfSzRHUHpcDC85kYDyDBqC3y20hLuPPKnBuPJNFZ7zpF
         e5UsSmhilueEwrIbYUmkmnz5HRsXErnWULLxhzdWgZekfLzhtRYfBfXbS5e7kHp2y6EN
         h/xrLba5TD1bQaF7DhdQlDPNzinEB2a1/ENQY5+r0ctl4HSmxKITYy9mQIxsysUlKfpk
         WErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025571; x=1789630371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1biPjXoqkcIS9AjryIVISjxYjXFGn5GSiR/aDLhs2c=;
        b=HeJbHAlbVCd2XMbnV628E4eCYVi5AT5hiFNLob4kLWmRzxKtnJTOwAwGxdBGPu5Xct
         /0OAoTG7IuN7m4lgXi3jPaXBabFKvQWGTXYUrHBT4Tlm13mVV/MYYgv2E5uHM2GAE+GP
         /pifnGfbHKuEQp28kXyvfN+Pb3ysBvbGyHP7+aNwv8DwoXp2Dg3gaTmxz5kKNS1S3eCe
         XLZ2HZ8uCl5zPWPSSzGsseoUJdgCuUQo6w5Zcff8kihVGGENrgt+V5aNq89yS3li+Bp9
         ZPcKJ35emMfvmxm2+oHTHrGrBNSG60nmz/Jmem6ZQFe9qRT+dR6i30uL1D8CIpaIPWBc
         D5sA==
X-Forwarded-Encrypted: i=1; AKwUvByrisDUN/4Gtgo/MUfDDdYgU1SUiEoVZh/3I4HAS2zlUdpr1grWZsC0uALDPOVmDDu5tTiUlIkhR2ZrJtY=@vger.kernel.org
X-Gm-Message-State: AFuF++nKp/WV8hH9E9+9DzgtMEV6QdB7cU8TndVHIfAnYq5zY65CFenz
	OJ3jOzghCHDv2RPewhxJAVP7uX5leCUbi4PcbIY5nZWViy1gsUEtCrLDXcPSPNbaMVP9/xsm0cu
	UGhktZpsOk1lcRITSptprH1CyvfIaLs1D3sjqF5vlQE5ihjVu1pwXiBeu2r56Y3IjUc4zRm2yiy
	I=
X-Gm-Gg: AYBFou0ADaZWhPuwenevSqAvQqbQukdQ60XY+7Vwk5tcfcK6JY43lcvH6oT1WEmp4d0
	27bo8xIesqYoknOMKLTl1L1CXy/ei73WLrXNG1zyjUcgWs9ZiJQ8R9lI0M59pk5jyoF/NaInqSC
	6tEzTiB6xDjw3SN1HTSEQIIQi9i8wsqcV6VSIn6q4QY3Sj/SV1RsDFpZ0AAtccHDVx0R2TG8xdf
	v1R+gv3VUN9fGpSqYR+yG7AS4vGw8zlfKzXlW52vfbZ2DejBY008ONZVKYSi0+g6tsyg9r6vkOQ
	krCWieCOpdoO79IlWRLTTmjFsCgvXOEWopkfOdtg4/6mNMiI8E3zUpSNiLAfQffqlsWpuaHY/oh
	nfEYsjP9MMXhE
X-Received: by 2002:a05:620a:aa15:b0:92e:603f:1f20 with SMTP id af79cd13be357-939802fa527mr3757207085a.2.1789025570601;
        Thu, 10 Sep 2026 00:32:50 -0700 (PDT)
X-Received: by 2002:a05:620a:aa15:b0:92e:603f:1f20 with SMTP id af79cd13be357-939802fa527mr3757203185a.2.1789025570073;
        Thu, 10 Sep 2026 00:32:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc23fcsm100492075e9.3.2026.09.10.00.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:32:48 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:32:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] interconnect: qcom: implement get_bw with rpmh_read
Message-ID: <3sbvyjkqpczwnte2nbu7aop6xzjg7mzakdrwtpdkb7zeuy5mp2@np7plcce2wu4>
References: <20260909-topic-sm8x50-icc-read-rpmh-v3-1-2bc65d7b25e5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-sm8x50-icc-read-rpmh-v3-1-2bc65d7b25e5@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX9KuIag84UPU8
 blIm1GkFzYQwvgC3jq4QOC0/PJL08U4JJWcaHZjP2acBPPkLMyQNuqLqOHQIc18x3/jEGPt0qoh
 zQoV3r2XQqaIAlqL1BEY7Nn/vDEKspvNP6qnQ5VwjjBVsFWr1z3h0m3E5M5k2HDDH/y2iUD0SOI
 uFkND3m23eU2idpLtE01Ho+brgoz+gn/T4Gaao97/mnwAn/0ZgfFWB1/xoR6QpiEXqOmPu46432
 2skps9123BDkE1U6hijHicZE6tKsmobxyVEtezdw+pfRLErqb3TiaSuK9TPLDZk1Z45R1P9hQsa
 FhGt5MPDZsyXFrkuh5o3JYvdQvAwSNGorOeZA9zyTjoVptj1oE0x5wVwFI0gOo5xnGkXR92mulh
 qxzQpZgtMcj3i7jYFJyuO73d3PwKyN0lISsu3z0aMgnN0f5N8UTbi5VAjBNnTNFxZ7/iIlRXHcr
 2asK0PHB0wCSTzaB1GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX7nZTMtoPDjiS
 wqUJfDn87+iW/kilxzC2jZIFxPb3zk1l/BLa8AtFHvVPoGKyhFE8MPmVEg6b/IxV9R719uxeIR0
 WNAwl6W6rIAv9b03miOoPy7Kwx/fwII=
X-Proofpoint-ORIG-GUID: lPlAidSYl3cYTzUNA7s7IFl-UO8FuACK
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa25d23 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7y3l6_YF2eMltEOdZhUA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lPlAidSYl3cYTzUNA7s7IFl-UO8FuACK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100080

On 26-09-09 17:26:29, Neil Armstrong wrote:
> Since we can actually read back the APPS rpmh interconnect
> BCM votes we can actually implement the get_bw() callback
> and provide a coherent average and peak bandwidth at probe time.
> 
> The benefits of that are:
> - keep disabled BCMs disabled
> - avoid voting unused BCMs to INT_MAX
> 
> If the interconnects are correctly described for a platform,
> all the required BCMs would be voted to the maximum bandwidth
> until sync_state is reached.
> 
> Since we only get the BCM vote, we need to redistribute
> the vote values to the associated nodes. The initial BCM
> votes are read back at probe time in order to be ready when
> the get_bw() is called when a node is added.
> 
> Tested-by: Georgi Djakov <djakov@kernel.org> #db845c
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
