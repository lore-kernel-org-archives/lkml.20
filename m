Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9983503BD2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861801; cv=none; b=F9+JyU2eu2x21Y3es9p35XA1/gMY2lqyB2Vo261ZOGd6ibSaYm4jSEasezFcoNeRRwk26nP7nLtYs9zaZGgAk/KhxZ66GjymUqKl2lKdw4LD3oH1hAFXAAwJ3RO2ttLfx7llbuhnjtDXKnqEGQBa+jMEamQ+R7FCuu1pbcMbBG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861801; c=relaxed/simple;
	bh=gU3el5vBaKIowxWErPSf+Ml57LVgUfxjbCElgrhuRcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHyssHz8Dx0ihJt83JdN7OaavWGJAURHAvGMj8EuO6nJ825tui2fdoCdRPVblz281cuDdjD2Di5bhk6R+yJoF1Vmd4V9UkkKc5b9i3+vHpuw4MZzNgyTxZA2YwyrxVhjEF0I6ecGfIc68+du3Su/ibnFUH6hSXWzf/Ld4v1KAJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0tFBxn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGXnK+Xa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0tFBxn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGXnK+Xa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6888cQeX2380979
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 10:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rfmoRRos15ggGyuCj+3H9fL/
	SgvX7ZnyDI13Z33CBSw=; b=D0tFBxn8ZVxw/JXA7I6wUpKQXpfGKOM3vRPs3IK8
	5CL6MVDqRo1W1YViRBo6aRyRH2jaf+JTkAmAxuVvA683Bs/Tk84laBk7+BAVR9Jj
	XoavlV7SedRkB6iU57sWromNNQkz/BA6uHlE1C56bSCnQqnoBXOGmDobLyoEQejp
	OmSDyPOZNDKgqqHXrz1WKUYW+MIWh9XyIK3RfiUkDW6BrIRskJWU0zDjKMIQarYf
	opqatafYdUE9ZvG4nuyUPIUqWvMavlLiqkTYHtLGG6ta5Hk/PQUnHIZYa9ol/cH7
	fikja42WTLvPLzz+wNBQO946IB/BC3xU2Ci+SPNmEPessA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1cgbj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:03:18 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b34ad165e3so2409707eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788861798; x=1789466598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rfmoRRos15ggGyuCj+3H9fL/SgvX7ZnyDI13Z33CBSw=;
        b=TGXnK+XanRawCsS5ibCnTKGsGyCpp5XZoiXvnVH60ljhQ7yB+TMP1I0kks9oN8nT5i
         U79GjPgg9cHayVshD/ienKCNfclCypCoiM6l0IzbAvYKDqtXDatG7RAowBLUxKBZsjdA
         Uvb7nIFmYcOidRxv7vpgjfgSlF/r85Emb4MkISp+6lord4K6YXmyRECRifFEZoGTp/f6
         /DtvHxI/E+eHkCtYfx5qcLtHIoKMoGWiLMipgORqY+a00+Y8TyHLS3oK+/nZMyJqgRHk
         s4a9Z7gifatE7GVC5VAJPuRMMFytRV5g/szotSUTjD4GiHdrKQgk9SFaNwJ/fqqIiuUj
         0qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861798; x=1789466598;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfmoRRos15ggGyuCj+3H9fL/SgvX7ZnyDI13Z33CBSw=;
        b=a8IgkOzz1k3z/DL2jRsRi+RCknIWazlzIaTXfVdutzkEFGX/CEtBbAJtxCoHK7GuT0
         IuEbOeCciE/ShUzjLRxkWRI/pQZZzoChL343ZLUMtBfn5DLAg9YykU9CeBPpZhpavsgR
         YmtNFI0S7poCm3twdBurrEuuZgfddLWfSGRTQjS0CDu1+6fDr+PxZJZvRoAxGW3lZ2VT
         G/f4mHSWtbckvUg/NwIDBV9/w1WAmhaYwLPXULas5DXnCcTGrXOq+SJ3tHySI95Gcs26
         uKNw0/trkl2S5RQEdEKHpoH/90SWAf5u+Kgg/DDdfP8zDhZGXwoloFuVN5kKcvfoSAqX
         KStA==
X-Gm-Message-State: AFuF++mVDTvFfSOYN+laVjEvqXpxwfGZAAwckxVM2reaoeExomF6rDsW
	N+z+80Xvaloj8SeWxKkNpSsp1YaTN+WP7Y7dYUNN5njegvtgNVVCnNz2y/k2SEDPf4MDmACHRlL
	E0VJ7VLYYhgwSwurv7qarHO94sKuDqh4l41mSvJEemeDIxVf+Ic3opVHJ7dT+M1YJVmU=
X-Gm-Gg: AYBFou1zaiyKVzG9pMcWpNV7stGbJ10KKhWAiIeipK/1AALPjIPja6sXkLyT2GzqVta
	TIA8Wdi7om6MwHBOxz2CEr/l3jg9huCUejLLn5CqahzzOyvm0sJxMDH5FYonvaA0Erw8sV+odMO
	E1Gp+WBD4WTz+2ZXuocHfoDmj7Zh8rnrO3TRTzsLCsespnJ+0AwqHFXzkqdXGMWP16Z5I8EzJo2
	WBz5VBiceW4Wn7shcR/yWwp3embDqSEQXUDj3iEHrFM0bS9Ui9dW8ZtAZ+N5JtSzB+vnnND7Osg
	3kNX6J3W/rlnAkK22VtgZqUjIsdEH3IEsxaNu/oNgrz864ppYF6FffqyH0KrXxr+9nqLI6umdEP
	mXTjEisH0gwLCPbrxjcMtlc1k59JS+QfR2ExZ3vawY5X4ebUoL0vzlw43VavadXXi86/p+2qp6t
	HGCZaoN5jNHiV+Fm8=
X-Received: by 2002:a05:6820:988:b0:6b0:19bc:fd14 with SMTP id 006d021491bc7-6b6fe59c264mr15048385eaf.32.1788861798138;
        Tue, 08 Sep 2026 03:03:18 -0700 (PDT)
X-Received: by 2002:a05:6820:988:b0:6b0:19bc:fd14 with SMTP id 006d021491bc7-6b6fe59c264mr15048341eaf.32.1788861797698;
        Tue, 08 Sep 2026 03:03:17 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm31124434c88.0.2026.09.08.03.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:03:17 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:33:12 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sched/cpufreq: fix schedutil's boost frequency
 handling
Message-ID: <ap_a2uVHgjiNtL3I@hu-anancv-blr.qualcomm.com>
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6a9fdd66 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=fTh2YsA6urFVvDZ4lSoA:9 a=CjuIK1q_8ugA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: fXGe2v0eDIqXegIONmUJ2dj5GgQOp7OS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEwNiBTYWx0ZWRfXzKVB+r+jcXCw
 3U/N13NK4zN+SPPI1Vy4PkPLEFPNO4hUL4/vURKggJ8oo0NWdbWvK2r3WajNZOMRJpgVImQNm6P
 i2g4qDmT8HSUwbH/759Nzp7f/4xaQEg=
X-Proofpoint-GUID: fXGe2v0eDIqXegIONmUJ2dj5GgQOp7OS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEwNiBTYWx0ZWRfX1FEeQd1+pwPZ
 fRDxK25mF49MXqKfeFdWvlfvb9hHZGLEbhL0HYxsQgvG5mBjgZSnp65UvhXK8s1kvKJjXwX14bL
 mmSbhkvpVKDm++Pbzc0eCi4pV3FDgPoBgzNhQCD6k6g4gmGYN3uIrXeb26Y7x0806dvjsnma2/j
 AqdZwy1cf/5L3HrAOssRZ17rdRE93NrEdUsrOJxgg2rDc8mt29xpaktznSoEkKMob1IHCnDg58u
 AO2XZXYFZzp+YX99aVq14+WGkxi1W8AWrOgsjnNjERZ6puf9Etjs8u4rGApgDYPiRMgsI0TLirz
 /YsGsOjxV1ozyelQWs+uN4tYxTRD/xcBlkrhQY9LfAMz85VigwVMZhCKMFRJBi/1iQgoZop8gIN
 UBXkLZbv2UBtUK6ACPJWThSONOkK3+Y8FUzYjj5TyAyJ9ZfRAEjaclqCM8qoGAX+U+AtdSxV4op
 dNP1SSJZlRjeBBI4glA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080106

It seems some mangling was done and all lines starting with hashes
were considered comments and ignored, malforming the logs. Apologies
for that, this is how it's supposed to look :)

Before fix
----------
# cd /sys/devices/system/cpu/cpufreq/
# ls
boost  policy0  policy12  policy6
# cat boost
0
# cat policy6/scaling_max_freq
4454400
# echo 1 > boost
# cat policy6/scaling_max_freq
4723200
# echo 0 > boost
# cat policy6/scaling_max_freq
4723200
4723200

# echo 1 > boost
# cat policy6/stats/time_in_state
355200 36958
4454400 650
4588800 0
4723200 0

After fix
---------
# cd /sys/devices/system/cpu/cpufreq/
# ls
boost  policy0  policy12  policy6
# cat boost
0
# cat policy6/scaling_max_freq
4454400
# echo 1 > boost
# cat policy6/scaling_max_freq
4723200
# echo 0 > policy6/boost
# cat policy6/scaling_max_freq
4454400

# cat policy6/boost
0
# cat policy6/stats/time_in_state
355200 40147
4454400 79
4588800 0
4723200 0
# echo 1 > policy6/boost
# cat policy6/stats/time_in_state
355200 44834
4454400 93
4588800 25
4723200 569

Best,
Ananthu
