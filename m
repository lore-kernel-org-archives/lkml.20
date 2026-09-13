Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686BD27AC31
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789335380; cv=none; b=HHWnf0p3CyQ7TaqK0AvWjLZOxFGSGjDKZUrypFZEEgo4p0Q7cg1tB24lUAQe/cNTx/5qEtxS/fnKeKFAOj1EEKX0l7hXe+z51b9DG0KA5WOfwUp/7+PWnu/qCkKCfJGaW2XNzXKGt0ECxjkYkLAQ6a5CnEeHDXF4Xpm/AsLzwuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789335380; c=relaxed/simple;
	bh=a0iGJSK9mgn+bGsChaolXbquJeOhk/lpTbEWj5fzdyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHxIoOV25P6yVe1V2h3xNEw3FeK50xSqiMouMA/H7FnyLVzFBf48Jn9ArAkzAfRkf8J2czzTJPOs95jl9Lc0pgglsEhMb6FAwxdHHXqa2epaA23G8k7Zk68kgjEnFAM43/hTEb2sKkoI59OG6qbaqvlu+m3i9oszbWKWmv6fYlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSUM0FhH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ieuJEgqA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSUM0FhH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ieuJEgqA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DLF4WY3672586
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9NG7m+b/WWrUHSwlQRSzFSoC
	lkdz/Noo7KR5PJVocI4=; b=QSUM0FhHkfoqqdMnY5xBavLUZPk3Qo9KSi7TSrkr
	Xta+weX9GGY2ETDqc/xbTVhwC99LoLS1f5UJsuj/WO3/q1C24LACOSV+uC/OPZ55
	p849UZPa85VwwQw1zvrFCzq8dgAGHFbyfJd3NMEPQm7kEe/yhqlieYcdKc8pihtz
	yALsgRouBTSWUsATaEqySYFRtnGvjzNavsVHsEUhwPKe90AJzSs6L1ElnZoThTle
	KacV0ja7EKeRcf2bS6gdYGwSM3p5wg1LyNxuaVxinBYO6Zd6Ujb/vkHDv/LTh7AV
	zaQyWNF5OQAG/AM2JHCdizdBGIQVO24mo3G6lbiXlF46Dw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0816g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:36:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cb32961e3so1930628241.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789335376; x=1789940176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9NG7m+b/WWrUHSwlQRSzFSoClkdz/Noo7KR5PJVocI4=;
        b=ieuJEgqAPqSzR7A83hbgXtwSKB1ltTO+fiG6fg0ewMPX+8JXvWnvH/0sFTofXLuCOW
         N96+RiurGf5KA2yZtnfWwp9RGeDF0wAyr05dedttZ3SCNmNnKR5uCA1lR/NwiCCPgSRs
         RCTf2ymM/+4YNFkV1s8jT/SEdNBsSjhwAOAvilFwsw2noGtZC/1M4b1KkIPmnuaKEjgn
         wsU9A4OlF57hp4mV1Spqt/gNepQ9v4nhjRM57M+NmgKQ9HI2M0hDEZbdEmcKOedPF8qP
         XomWftwBV0v7QjKdJ0Mw3N3sOsbya/McvsyCBGZYEgSEsjuMbK/tMdTbPkbjlXngbGun
         jkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789335376; x=1789940176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NG7m+b/WWrUHSwlQRSzFSoClkdz/Noo7KR5PJVocI4=;
        b=PGj4zMG6+rSEP1/69tctTTC0LqrqAnj3xv936IhpHj6Uiwo+C3LnIFO0fwmc9kbmYH
         Wf2XhsRpHRtbJKaYNIVnbmXJkIoLmZ0CKP6ZmLWZ6cpaBjsQWXM+T/wV6zGnIufxXQAm
         dfBZ4Qh5nQ9x9zhr5rVvbW8xbvKjFduve2L3rW3HMsc+b9xs0AxAe/odRbHH7to9gdzI
         QB4DwWS6rHYTuV2s3SCd1lszwQELOKbLgZJFxcLnv4XvMTpeG9zBgWvuJb6m0qqb5/eN
         iIhAM9+NKutPijOY3vR3ijmoDiiP2kqVfRZpUBSbEuJTKvroyvpToLCuNkdXWiWxnx4H
         7VKA==
X-Forwarded-Encrypted: i=1; AKwUvBz6JMg+lCyUUf9Dan35Z4t3ksDvTJl3/Y0/DOf3V5Cfh7556K9KQUCJLbXxQ3/7OUV5fJDToB7QhMfs6E4=@vger.kernel.org
X-Gm-Message-State: AFuF++lRq2sqmD99nLHeoRlJ5dzL0BBcwgXYcL3Bgk+LzUZZrm0gc9xB
	IRgKFN9sYNVZdYbRmPvmhZdZ0dlSNjoL0HLV/IwjJVxXlmJGzMcYVHdnm60aiUZYNizB2qAt6TF
	XUlAhuRBaaPv/edXZUhgYEhGIPh1HVTs5Dj+Fgp+q1gOF2Ue3sjhpZQCTkqypbcx0tYo=
X-Gm-Gg: AYBFou3gIfPi7rJfzqbTlZlllTmp07oYcdwvmjxlk0rlWUkELhhuGvUGPAluXf39isE
	oCwOJZW8uZEq0EKILR0owcRNkWygcAJ5Bfh4mftGlp3R9I9tUWDzcrxenVhcRJEa+iM7MYkqA0z
	8C2BURsXcoB8d6noUCnUoc6iyyYCIa5XVX9UkSdghNrM9b9ujy/tiuxtRDCkP0mga1xDQtWCnV+
	F3eZG3nvN5vBA9YJY1JFmh+SlQrHxVQwnSpyjiYzQc9RsWkUlf0DZ/DAi545DsFdpvF26u3qJtg
	ZH9RIY6obGNzCT3H7/+0IbhYJvM6hhM948kbx2K/s619WvQp4zGKBydN1Z/tePT/T6o3p6qBDG+
	xiVODrE9ywYZkhYxcQIyp9/osrdo6lNtWAU1TXpiCzu3rMgZzJndSms9tzUQxxjd2EQCP7dSPN3
	8CROhb/wnac80f
X-Received: by 2002:a05:6102:8309:b0:785:c960:ff85 with SMTP id ada2fe7eead31-792a96ab51cmr10976032137.7.1789335376489;
        Sun, 13 Sep 2026 14:36:16 -0700 (PDT)
X-Received: by 2002:a05:6102:8309:b0:785:c960:ff85 with SMTP id ada2fe7eead31-792a96ab51cmr10976019137.7.1789335376094;
        Sun, 13 Sep 2026 14:36:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a88a5sm1937493e87.8.2026.09.13.14.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:36:13 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:36:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] phy: qcom: qmp-combo: delay Type-C mux switch while
 DP PHY is initializing
Message-ID: <glm3mcwzq3uawbexxaggbqwkatudk3jrunnz5rwbp6gg5kcvm5@xbpqetiznnk5>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
 <20260824-qcom-dp-typec-reconnect-fixes-v1-1-2825e5bf8a96@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-qcom-dp-typec-reconnect-fixes-v1-1-2825e5bf8a96@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwOCBTYWx0ZWRfX61yAhUNAfsxS
 4h5LOhHeg01mJgH0QjN3J8ScALJFqUTbpYWjL8/riR0c29PQwdZMOYxMu+hVy9g+q36dg6GI8J8
 Vr3DRYCFgrBZdqaNWFbAETUpjETIK54=
X-Proofpoint-GUID: ai1ppzwdzamqCXNoAbM5uqt1nZiKq-PE
X-Proofpoint-ORIG-GUID: ai1ppzwdzamqCXNoAbM5uqt1nZiKq-PE
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa71751 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=nEuW5l_y3reV5ifXg-kA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwOCBTYWx0ZWRfX8S8a73WDelGX
 xJK2TW3ANPGSJPCoq3V584iP5JEetChEsRSpnT0YR8Cxox2bqlcfPw+4Se78WrwY8bjOHqymuzL
 /glvwpLtox+bCovb6WqLcCVxx7Is+bH4dxJg74UJnzNxa06jdFgNs9jkVZLJY28ICl+S1VHJ1Ns
 QzoalACQy2kozh4+RjviQFBsYuMgdOZcNyPPJMOKgXd2XU2YEknaM2HbMfVhmNYpmv+Zi86bgYq
 CKXERPvJdZ0XqQg8VXFMwsYp/3MnXyYciVlH4JJSRD4YgyveRK5WVAuQqv6iQSMm3kdQrVtGJ/3
 oYjoWc6YvgoaC7h0Bpkom+4dCz/ZKbjdM5PParBBwQ3ZZAyUQ52FmGVxi7JF5zJua21tpbzixx4
 I6dFRByINSYdhUFAWjnP0X8QrIvA1A9Aaz1LTLXMVAP2bOB6XyJNvweJt5HC6o12OQvWciL1XBP
 E59dOuEo8ze8zGICeKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130308

On Mon, Aug 24, 2026 at 04:58:04PM +0530, Saurabh Anand wrote:
> The Type-C mux switch guard only checked dp_powered_on, which is set in
> qmp_combo_dp_power_on(). However there is a race window between
> qmp_combo_dp_init() and qmp_combo_dp_power_on() during which dp_init_count
> is non-zero but dp_powered_on is still false. A Type-C orientation change
> arriving in this window would proceed with the mux switch while the DP PHY
> is mid-initialization, corrupting the PHY state.
> 
> Extend the guard to also block the mux switch when dp_init_count is
> non-zero, covering the full period from dp_init through dp_power_on.
> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

If it's a race, it usually means you need a lock. Otherwise you can
still read the incorrect value of the variable.

-- 
With best wishes
Dmitry
