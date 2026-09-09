Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651A6229B12
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980408; cv=none; b=gwygyCKH1MRax0zY0l+U+VLRUcchUEPG2m9/TDXBT+wZUduXajGJls9djKhKn8+i5mdF1y0eljGaQbfbm5NAXWaD+Q/ZNn35m/fEJCvOpEWYWgTG5DuWc3hQBTW0u/kwlaq8By2IFS06K8U6rVzhaDJvcUycnotIX4JPDicKT54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980408; c=relaxed/simple;
	bh=W+Y4C7lHQn13v7O++mmrTUHwaeZ7ipXp12hzVPadans=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gr+Tacavg+VOqcc7ZT7Xdl7/LLN4Kn4aWuPTGTp9ZZzrDWg6d2YRIQUBd1oIDccXutd001fogoci3zfJTV991zkQwh3xkaoogIYE34wqxhE44mcF5yFCF2O8fspT3FFaWG768Nh/06TTHLjD7ShYQHyaI4t9WHw26x9bEZL0ZNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIh9tdfg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9bP8HEF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIh9tdfg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9bP8HEF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Igo9N1608465
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 19:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=88vmkQNz1OKcT0Fc3h/2B8Pl
	KW5uTuDj9Fb2OV0HY+0=; b=TIh9tdfgYQaKCg37idhlMd4IQXtIOer9SilaggD7
	vZFqsrelQJs4U0bfP0oykbnqysIa5OBHvnSneIgZZ6j8ZpuO0cSYA0rBPniSWTzP
	XcTqkzZ/5n37u6za5sPrmonoLgwIrf7k9WUmIvL88YrgUNQLvf0ZFwO76fjgwRaK
	X/D38tJlxn92tojuQ/bnmkHkFxxRqaw6zWN7X9LrdMmqdXEQB5Ll2aGcGD5ab98v
	IjszW3NLoOfVffhfulYDKZgXVJ7N1+/7tPEcu0rmJmLGMGBPY3eeoHWSeZBJO/iz
	XxV1W4oB1Jv3WJzU3GCoiGH6aTh+44+fze0AcCUANY7cbg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg02sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:00:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78fb9f59781so1007517137.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788980405; x=1789585205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=88vmkQNz1OKcT0Fc3h/2B8PlKW5uTuDj9Fb2OV0HY+0=;
        b=c9bP8HEFL86vzkh1TtDlP6Jo1qyH0jSidrMeuJKMt5KNaPJftqvjOeqXzZSBmCMAYt
         ygj9wPo/A59pIVSV28Dy4fALwcww1BrBaE4cJiF346CuCxjVtLWdWOgdGzC92ngaG6DU
         1lu1gOMsoHYpmXppKk+/HZsa7pvJhq6hvNf8AOpNspFCgdlqFcVJshl/BQTZPGaF+1hO
         Uaj6B1O9zCH8SS8w6V+nY9HVVx+U1YpgWOgCLUpgE9L+ZX/MBkcMTaZgArQvy/L/1Pc8
         +FcXSjGL3bmQqjPdwVWmkjaWAdi8cpxJvRQwl6qByBJ45TM/jGXqvXAmhbS4xTNkxEDV
         QFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980405; x=1789585205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88vmkQNz1OKcT0Fc3h/2B8PlKW5uTuDj9Fb2OV0HY+0=;
        b=SuYrG/k1j38Rjmr1Bhx5LlyCXwiN1GXBVjJMgPalxBJYyLR+fLhvb8XWOtfJvjaoiK
         u6I9ngq7dziysfQT4q3U9d/A1OGYqVUGGpRxuy70xz86ZaDvjXBebuB0wXHNBkRqsHHP
         Q4JLyx5mscy7J0nB66sXC4r8g0iimmS62Qjscib3wgFqI0hgaaemHVW5jPfw8YuLgQ4l
         GOd4OgQ8YackPXVYYpQKxduZNPxcK2Z5T3EXtv8EZ+JQH0VWyvCodt50CMo+uhwUFQXQ
         H2zsf2MMxNIyNM3EBiov08jR7GDgQtrES0V3mT+rIajIbsIIMYd3u1s1rVeGRX1zmzbD
         kcZA==
X-Forwarded-Encrypted: i=1; AKwUvBzAwKkd2LSuJnIznntOJHOYeTm4T/Zo+XCY4Dlsbjpmt0TVHnKZfKDpa40sMMmz9mdQQoLliMlg2xz+s+M=@vger.kernel.org
X-Gm-Message-State: AFuF++nhVFIBbhMQ6BVv8nVhMJdh1qRPKKq0jiXTOcuRUro+9LG0RSg0
	LjYfwOAT4L7Klk4F8EFz8OPoWq3dKmFQ2Q+EtmZJyR8kg9GG1mcOg1Pg/hDkgvoeaR2qrI2cmjf
	WH972mBhMNDy01u0waZDixs7HWb7m/r+nma31c2haAjf7x7Cqw6kgoPwN4Shr9HFJc8Q=
X-Gm-Gg: AYBFou0TAEJnZEozEqHNX8hBiOOASXjKj7ERnFjXxOiEw7xf0LAOUnZ4/gE0IX3fqrV
	VHlR558CZS1ilnqmtmtQEZX+jkVDZKom7m+r3IKrJoENVLRN0DdYbF9VsA+CfjAaDReBzTDsIFB
	2I6dHtnCEnsWolyzbC7A2zb6s8Ud2p5FSu1HZWAZbOzx2CKcaGLOBGKME/Cyfe8FkiIVeoLgXtQ
	QUSUqbdTSyqGJwZl4eT2mniPbUZXmFQLe/Y2t7VGUvLBFSNpj87ceJ82YqqtLDpdyMvlBe09U/x
	62aiMDu58joe9g57Zg1MGX5YrHLPooP9eo9C7Na0vkE+zTqYnrff4cZdRX6HbfjRfCMmOoLUjHg
	4epTGALski+9DafWXE83uCB2iU8ySwTkX2zhB77uilVD3LUu+bTD7O/UdJV2s/S0ywV6XoNSGkd
	ssaeZ7nOh1xxVF
X-Received: by 2002:a05:6102:54a3:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-7907882b3b5mr1538089137.11.1788980404729;
        Wed, 09 Sep 2026 12:00:04 -0700 (PDT)
X-Received: by 2002:a05:6102:54a3:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-7907882b3b5mr1538055137.11.1788980404290;
        Wed, 09 Sep 2026 12:00:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b899b012a1sm157308e87.53.2026.09.09.12.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:00:03 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:00:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] interconnect: qcom: msm8976: Configure auxiliary GPU
 QoS port
Message-ID: <fzowmjp5r4cry3wdlxejdsm24jdh4j4gzbbndbdf7ydqq2vk5p@lx3eb3q7o75c>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-6-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-6-6dc5b5e97626@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bMqDs/+Z c=1 sm=1 tr=0 ts=6aa1acb6
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=FHrIvcMS070A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jW8lGn9s46bW74Nh9CgA:9 a=CjuIK1q_8ugA:10
 a=PkAOt9_mmfBkvtOLxIEI:22 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: qeLEy8nXFNJVEk037drk6aA0RtHcSYEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMiBTYWx0ZWRfX6R4CCpWeXuSy
 zaiUAcVAMh5eZrh7kOgT/4MWtWZZf66OD7yoGDGehp8UonYEZoMw+cccSBd+OtcPelI4Lseb/Cx
 skA7cGiVCclpprNi5QiHmIwWOL7g/3N+Per71HcPDm3JiragaW/XRuiuVkU2hpZ1a/YTSRDfjzD
 prveQSl3phNREQqiIFDPCjcrwa0mWe2fVQohP8s9Udo3XW8mNaMa8ZiWOvpyItvogz67Mp9wdEZ
 7HCS8PDMjG/Y2ALsHo+6iY4VmZmF/Bo/wtFJvyCFkLi1UUCYkjFfAxzyzn4srGu3Te+mkC0o2vO
 9ScJNLclLotdb4YGpuuopHn5fuksTGv3GOndcNS9cnwVUMQh0ngngAi2dYHz4ciSVDarmJFRanS
 dMWOU6Duzqr4ja2Q/A2kEIQM1BeR4hc2kB1YDEpR9GgnW/BVLiw9kFaaIKbhUlqucBcQJQ1TDFS
 epygN4MucDXrPMyWSUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMiBTYWx0ZWRfX7ZXz5hNDsF4e
 nFlTqhUB5VLwFQNzswqy7duAXrTWuaaZ24erPBRlY+wYVDE05GPzEgTHRvmlIUyFkw1aE8iVZHG
 AK7Tvel4Z2v+Zg67U0BW231wpE7H7xw=
X-Proofpoint-ORIG-GUID: qeLEy8nXFNJVEk037drk6aA0RtHcSYEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090212

On Wed, Sep 09, 2026 at 06:41:59PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Enable the secondary QoS port used by the MSM8976 GPU node.
> 
> Assisted-by: LLM
> Fixes: 6e3ea1f36b10 ("interconnect: qcom: Add MSM8976 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/msm8976.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
