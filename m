Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612663;
	b=z/dYG8hF1I8uzdQETil38JPCntkQqaeU3n973eWmFwvCimGoIZBPj67DYKjZ+6yZd2ET
	 XOG/8ZL2Okt+igmUsU/b6H8a1ZpUwTmJlKcBT6J4IfSYqzr65DBClLlVQn2hs//pPqyg7
	 dfxP1JmnsfeXBNs4w1zt/qJcch1Jpfh9ZXmLNcJjSmaHYK9mkN4PC9RvcQdtvkamVHH0K
	 PXD7RxPjJOcvGlpA07y57cPdQDMTL18F4NQqiaAUCXKMj5BNcCMiwh/A10V06MXuJ/iRR
	 XTJ8DF5SCgaqB2I5UOhYl+IvLYioM9hZzldv2MlL+hSX3WVCpiOdWPbtg1T2d7olb7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZCa/YPK9ZlF3OQw519mYhFypdJ6PeksxTIjOEMw7euE=;
	b=ptg0RnbnFfXDRwC4W7N9gKMXnIk3AE+61IT8W0+hcf1z7LVZYUtBH+LOAMt/sAOVpI67
	 quQdJI/8kdHuILmxQMS0QFiniXPUcVvLU7Xr1zbiP/2reI7fWA4WQRA/rgA0da8ko8i42
	 PsZco1LsHhLtkIMwKpfRJzuFrgNuf0vc/HAb7jV2Eq7VKsinftUukF0LzlGDQ2poF3RXY
	 cC6cTYz1Z4uEfYkaXU2yEmU3TMZZ6YhsgU/SX3HeMUP8ehEBLfWcy6bgcisJbOwSu3o9G
	 81FeQ6mOS8TNKdey7jO7rc3qlq2MOOUWU5SY/ZyXh8cMhUB1ggCW2k0U5fbRg//1QEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRREO1QA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KQgAlhh4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF58E606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF58E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRREO1QA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KQgAlhh4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AP0i3086563
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCa/YPK9ZlF3OQw519mYhFypdJ6PeksxTIjOEMw7euE=; b=ZRREO1QAjeVOSxCH
	lv9RJxZx6z6iWF9jL2zBA7cxtzVayVF4tRsCazMYPa+gDalzYovZbrHVdgmEDcMQ
	4OPdDGklBAzv/3CWt69NSeI9TW2snsq7uT3+LzIMxkol2Ny9jnw4bGF5Q0Z2lujf
	rP0ICGltYROVYVALb4AbHFg2/9QX2K95et3GiThuGdJe4Ykt0ZBq3O4W8czAYtXE
	/XUX5lgx16wyZZDLPxuxB2TQCP01X3NAN5WrZQ2CDuHQBWKKZiVYUFudXd5wN0uM
	gGW1IEm8rGkc1hoTCpv9OKLNKx26fqRID1BlAhS/zB+XknvZ7WociAJwoa26gSej
	mwAL8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61612-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:44:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so48467485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612661; x=1794217461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCa/YPK9ZlF3OQw519mYhFypdJ6PeksxTIjOEMw7euE=;
        b=KQgAlhh4nDDk0Lp9lFowBkfeocguj0TGQNNC91USFy3a5dR83dKMZf1Tf/HNvN34VD
         xM24O0lT/Cj0lGrC5pC5Q8E2imL3oIAyVDgXy85tyZUz7iB22QEFFZIFEGUxi0QA9v3/
         losG2+PrzELumYHu3J7DmA4pbabtmSngki1QWJjVgU9kK6X0ysJavagNbo9NghYuysWG
         QkZEVuxq2HtuooIG/dFAMa5lxasDhXeTdtCRm46FFVzVG1IxqEGgI8Q3x6a+YNq/9dEF
         43CALuJXOGlLNM4dJFvyumUgvGs75kIel5WXiUMY8l4h7BNYZzYGk9kp2aur1iJ/SxEO
         C5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612661; x=1794217461;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCa/YPK9ZlF3OQw519mYhFypdJ6PeksxTIjOEMw7euE=;
        b=W+UaKdy0hLdccRbV3glq0e8mg1KE1hsF8iP1QiwJboClPf9/poSl4SviNFOBmq2Pdk
         gJl0C6MlhFjo2OOTs5Lpo7WnWyADGMKeXLaruT2HmZFSleP3E5B6j8TbxmZmoStp043/
         COuDCOPLLNmbu72zFrMRWRVY/bU9P5sKT6BzgjeayIXMoDJETdjSgpA52gOoDKRf/k2A
         Lr3UtrivJ0VeCNrABLlPEQxy2E1v1+tcTuzjOk+DQSM5SnUVLZ4t3X97xH/mj3SyqjEq
         L6Um/IU6CQ9Aux0+/GmvZi721UDVwW9yayJTnPk7+GeoCsFWdAJYtWrsy/iJ5jBzAsXZ
         zQ7w==
X-Forwarded-Encrypted: i=1; AKwUvBwnHnzl82YM+hHtO9AFKNhUzRSfnxOL6kTxa+kPfBfBTiFRuYxiui64ZzgAoybU0QCxVT5wHLIBVf0hCoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+4TuOEMbXreiNmMWkHRyOPhOcK1OE3K1RkdmBJX1fhLpo8J4y
	12S+u+XkIzthYoAUwydWrkPHgl455/di24k5mLqUXHNOsy3CrAHbn2C/MwsI1QOYw8kXhUmYSDi
	W4HwVGa8Uc8cRcgpTkanOKpjaNTytpq8rA/FE3A7ghKu0OwKDWFUL8BmfyCgMKfwycV8=
X-Gm-Gg: AYBFou2yc9tE0Vxs5xLiZkNmG6Cjh2/gkEBn4CW0+2BBf6kByLIXWCg9DeQScyhN+NF
	z/yktO+S4YQEXRDbyZRwDam1mQK1F+uKa5mJjG+Vh2qzs//O28hkhbyXtliREWrQH5Sk17zq0wY
	0MmJiKNWdNHPOWycDMmupAKlIQIccIeEIHm+ESfZZz1nvk18qAt3wytD74tqme7da9B5D5StgY5
	ItPGMJl2MiCQ2no8EsHc3y/Refb9T1GVq2NsTQPpp0Y9CU6jNUwRnyX6UdWCxgesKpMJ7/bopc3
	515q0whYvuzOJouXeyF3zVmg1rxPr/qkVR1aMzAEtM8bde5sX6L5zsyU5bG5Mzvt2EAgHFLKo3f
	5Zy8JOyymvOk/0eilJzKdDTX8uaW2yV7WvYJV8K2jT2VeXFezo8opG2cvxAt9UPY0pXRDNDQ=
X-Received: by 2002:a05:620a:4d0e:b0:939:8148:1e3d with SMTP id af79cd13be357-944215b76dbmr1780538985a.2.1793612660988;
        Mon, 02 Nov 2026 01:44:20 -0800 (PST)
X-Received: by 2002:a05:620a:4d0e:b0:939:8148:1e3d with SMTP id af79cd13be357-944215b76dbmr1780536485a.2.1793612660576;
        Mon, 02 Nov 2026 01:44:20 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9a767esm3081382a12.5.2026.11.02.01.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:44:18 -0800 (PST)
Message-ID: <6f842ef2-91d3-40b9-b22b-365be4c0c6ed@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:44:15 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/msm: Decouple IFPC disable and sysprof
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
References: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DhP7EPU2FGh_RZkYVcI8ynu7U07h_mUr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX2WnaQXk5FwfN
 O0QCiyET7Kncg1dCr7alVgwoRs1ofMfm8KwVIk+7Y9YRjXAalv0JuF7aYJ+LJngjY8gx+Afzh6e
 04l3rkcA6iv91EAUzqEBB3rMSNMQo6k=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae85b75 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=D_WMUv83azVPUa-0ShAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX1OWRnIUTSaH+
 EbRJZauwunSg1cpeWIKgkpfl/166qHNbu4hGhkMOIIbfFCBfDLJx1O9zA/gmdjxk4kbE8D45yAV
 NjdHHUt5euFMb/eUR5kI4o9YOVjgropn5FuHjSSPriC5BQit6CK0ljl4podw/w7F34VevPK/XBo
 TaSGJ0SmmdY7MI79MEe+lPeul1eg7dYCZZ214cvcd6ZznNOMI8dGSScIMbWrF19oN2w54oXCuMy
 Z0oyOw6LZPqiAtVunEiffGZekrc1X5ZVHHSZK3gfPhXr5l4vdnp1HYJv2rQ/L9EaIHzj0srO75e
 QGxJYuw3jMHqBVFjBjft70DAd5D0+7GIYr05gs4t7h95ykRmo6qg5fLYHEPyIbJDOo7YOKtWGY0
 FWhaeVjVPAAQyhCXYiNuYXxsJh21xBGEePOMi7M688haCOelVXPvd/6Vx+ne9owYPu3NKDH8MQC
 HAHLmGOnz7Ovv2PpI7A==
X-Proofpoint-GUID: DhP7EPU2FGh_RZkYVcI8ynu7U07h_mUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020038

On 11/1/26 6:46 PM, Rob Clark wrote:
> Convert IFPC-disable into it's own refcnt so that multiple threads can
> request IFPC to be disabled without stomping on each other.
> 
> Extracted out of gen8 GPU state capture series[1], as other than fixing
> a missing IFPC disable in debugfs state capture path, it is unrelated.
> 
> [1] https://patchwork.freedesktop.org/series/176505/
> 
> Rob Clark (4):
>   drm/msm: Rework IFPC disable
>   drm/msm: Add cleanup help for disabling IFPC
>   drm/msm/debugfs: Use cleanup.h for gpu state dump
>   drm/msm: Inhibit IFPC for state snapshot

Sashiko has seemingly valid high-prio comments

Konrad
