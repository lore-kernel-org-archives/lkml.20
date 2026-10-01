Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9A54E3229
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849623; cv=none; b=IdrAeDR0dsibVyLRKq26aKXN+StBKSUpD/hn+HPtW9kWzxh/ZLebIpM7wVqRYtrk6w+36UliZAK6YUgyrgaHm2FnasANGOI57tug1rPumVYQb3FBOLJwq6QAItVY15qmQnrckQdDKLo7qrRuRCyBGAM1lwXiL9x7VpVLFTvNmRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849623; c=relaxed/simple;
	bh=mLtX3fAnzGk7p2ckDcHug4xzNZVtvaKu+SyHnsGmiPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRWz3//3yrWQQxaZ1po/lOehGFwcUiDYkeGGBTMxVA0fc/nSIQ3gV7icqApLCnIXX17vs2IKimS5dpJs4tT//MTq8JcnFDq9MzF7Uqa2CYnEf7bKeWHPGPDSCF1ZdX8UBkROWslLrB61Y0JqvJj0ao7a1pyWEQkfMp9M6UmogXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meHhNfPX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRXfHhdu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meHhNfPX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRXfHhdu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xNfN1062189
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 10:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FUYhHl20vJ4GbrkFUA2FDZPB
	lZ3YXgo1xmjRX6hONZs=; b=meHhNfPXIWsgY+h/0aHZAF5jeB1vH+Pq5ZL26iMu
	IyX6TdsUqgi58LbwWJyqwVIL0ZTytoH8dJGe/AnM9A3VQxF4AhJi9gV8YC8UW/dj
	kjd+D3i0afCca5XS2wB1oIphS3vUgqPfXPRM/hUyhKiZnmgz9HWv3+KirxMxGsn1
	j3ZaPcFapW0hNB+YNb4M+PSQnQYnn4UXM3piENkrW3N9dkCSxn6PR4Kj8RAmApiU
	Anqsuwo9kQgSK9A+p3S2/BGKvgokQwjkK4uEsVA78N0GHPjGsXj1hxkrFbZmX7mN
	3YZx4sUmxqjveF4JVt+/F5TeKSOGYuUU7eQ2/TCoJieDMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvu9fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:13:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso1400985185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790849603; x=1791454403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FUYhHl20vJ4GbrkFUA2FDZPBlZ3YXgo1xmjRX6hONZs=;
        b=SRXfHhduY26uYbVAroQ5lc4g4l2IASiyuCO93WjkAr6CKKx5p/FOWnDxk7XUpQif6G
         kCSOA7VTVIF5mqa29wmJVZOhfWRvDA/9UnDUPYVqzvVc4JGE6EUWLOlDYLj4N4w3+PLR
         5DdxOiedjDriX42QGwkXwMzT0j921z3nM+3+dAQMy9hvC1Wui4OLXiPlAu52phW7E7QX
         XDn72RLXJrauoK/ciyB3r78fcUV9NfG/RqE6b3eQHCZ12Oj67T8dXLI1ENkU8CXqDux9
         4476WSZ7wem62EZbc0bAS1DIgwRCMg8wKBmb6DWrzV97P94fRB/7ls9BpyEzskwwE66r
         N3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849603; x=1791454403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUYhHl20vJ4GbrkFUA2FDZPBlZ3YXgo1xmjRX6hONZs=;
        b=bXOXqZRAK5vyDwURO/xGXYkBd8lHh4nNikYzGBwf0X3iice/k5vgPGyx8490/zdCld
         8RuKKoDpaix8lKcCQRto46qGD4iW9GrSiFQ7R3xzxn0LVcMOwXntY/5GbTh12o2fRRG4
         lGYk1nROwk9BtsiEygk2gVKlIgX0oupxs40bdrlQtk5b6R/YeQjVWYXt4qbxo7FAfHvf
         JmJBMUQpsIgmN28wICdjd70pi8Y4ex5cXyFkTUUCyTTtTiWFbZcwoYWGxjeIa9PtVXuX
         Z9h41UHpmuMq1vKHsW/Vey0xVtrb2Pxe8gCHTd+M5j5YVBJjuapGOd/oVv9mGnz2EcVy
         3uyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWSH2FIbICroDeTrQlzQhQWtZqpdnM4TM2/b8cltr/yQ28abFqmwBOFX7yEHMtdiecVOButf3X91HVMeM=@vger.kernel.org
X-Gm-Message-State: AFuF++kts6OJqw+6nkZcB22nqBE2z/4d8/sUtIRuYj8fcsNHgBJb+cLp
	9HmWQ69jCFCugUZfhFLLFb77xbTz2Se8waiUr7ZBJZ+ASDbVa7ba6PMXZTE3C3ySzmlA/nnUfp5
	YyTQ57Yu/9QYXRbThnQ12bY5i9rA3SlQmfrxlSnDB0Mny5H1B5cbI7HOY5mLs/1F6Guc=
X-Gm-Gg: AYBFou0++kvvCnEhFtUaW7gF59ZASCteFTSjxf7dDcZZIeAiraPvITi4NciVYPV3wiR
	0P6+xXUFPHMW1P+Zx+CWrNTWkhk9c68iYbQQNXLqjdmXSLmhbFEKKK6bTuv8If3yQzvHnmoP145
	pmkHaOb4K5d+OksyxyP8uF3n09e9p8Lx359iVcSa4uwC8PA1dLomBtVtm3xbC7eLbLYC9dIjWbr
	m48bXyVkvr3ep6+8lj7zmYW6J+2SX5+EQ3l70BF0KOvMesxJXIO+kQeEL2imdgVVn6IjsvMaaBA
	JmZnjhQKjNkwD6IGS3LGqAOieNsbJjlFynkGBDOMVEnr9l3CdIGOCATFhDKVqfLzBEFQJRIUdf7
	lm89eiLSCb/bBsyHs8rRU7CYdh9tqhsFN0ia8BBW/rCn66sqyliljMIo6/+G5IItleMoi4OC+UX
	gr0fdkWeBOPsd3
X-Received: by 2002:a05:620a:c4e:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93ca97509c3mr740544285a.54.1790849603565;
        Thu, 01 Oct 2026 03:13:23 -0700 (PDT)
X-Received: by 2002:a05:620a:c4e:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93ca97509c3mr740538685a.54.1790849602886;
        Thu, 01 Oct 2026 03:13:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42faa877sm633191e87.25.2026.10.01.03.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:13:20 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:13:18 +0300
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
Subject: Re: [PATCH v7 03/35] drm/msm/dp: drop redundant config_ctrl_link()
 from msm_dp_ctrl_on_stream()
Message-ID: <ktjqx64psvfmnfk2xnchuwfjblb6hhweoxd24najvpsohnmive@pikk7gtqp6hj>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-3-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-3-4b81473185e7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: S4Q8LoZB36PsD1A8SBz_Vl4Dsy-tIq9s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MCBTYWx0ZWRfX87gBHbBhFsd9
 IIbjoQ91Y9rG0e1pXLnEKgsjiBOJV+2VRgbd2sC9yLirs7a5G3F2lgEeRqpt4h1a0F9caa7w7DS
 T/KrRARL6xf/4EYnlRmUvKxSTyX7V43oXatLU+pWRchzEX6J7HPpgJpnaQ2jx1GneV1zZEGbWAq
 HvUQ4kr04FWv2OHiqexqGBWmiVY9SJd8lE3MauH5F1l8vFjoXwS5LE7+5JinxnbS4Ba3QtNFVCR
 9wXgo4Vq8AxsqZOxg/N8XYix/EBYC/PAJ87cGKny0QlKJ+7tpocWAl4+QF28eTLOCkk+zNjgq+V
 YGPlcSTwpILGAfbJ5VHhYTbPqmVQWUk0G8pXjP4YIheYk2ttySf4Wgs48yWNZVtt+N97G35ApXT
 4vyBoR9pSDBYfatpNGaD8sIUbXPbtLI7C3wuE+G1BwzWZbDaJwTpPYxFXqWZrrLLH8qWWbNSVvc
 aISOnFb5vJAU7qB1nSw==
X-Proofpoint-GUID: S4Q8LoZB36PsD1A8SBz_Vl4Dsy-tIq9s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MCBTYWx0ZWRfXyaVezeMVslC1
 yDMLPsWi/206fEwU3qYpAh2SGiWoT5j5Wf2GSwK1jY9YxH5jUKm3+N5yl/Xxm/LHHczDzY6E1JN
 wi9M84OLmdLhXzQ9RENGeG/cyaqfJ64=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe3244 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=xvosr8ehAfmB6sJLDpoA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010040

On Tue, Sep 29, 2026 at 12:25:27PM +0800, Yongxing Mou wrote:
> REG_DP_CONFIGURATION_CTRL contains link-wide state and is already
> programmed during link training.
> 
> Calling config_ctrl_link() from msm_dp_ctrl_on_stream() rewrites the
> same configuration and is unnecessary. Remove the redundant call.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
