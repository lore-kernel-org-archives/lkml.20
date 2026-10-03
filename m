Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61802F1FED
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988441; cv=none; b=Dtv6HAghy2KOwo4dD5qHmr5yu0kbIJSJ8bGDBc54pq+SKpkgrZejsxZ4KOcGNM7Yu24i/w1MpqVbeRNFQRPiyOnnYABLezvRJisTzVzxN1ptQBOeQa0aPjYF5WRS/zjGM7abmnrxuolhHoEhzHqMLDUt5ObRitQYFfJobd+EsmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988441; c=relaxed/simple;
	bh=6+PkwC2FjcXbduh6GZecIumJ8hk5DtjCrVXxYoowenM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CtPN3B+NFYp9BjH4/5le4q09XDv9aNcJvvHAFZwA+7hIX5XB1du/pyHpIj0gjjmej3lzoBk5vWehRfZvy+tcBokMelpY4Akb6Ohu4kOAh3Ip5h78gMeX0uyaNsTenmFt4sbOcoYnAC5drgIA/DohPJxksEN9r52TOv58IP2Sg3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtcAzMFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ci65W6Qo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtcAzMFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ci65W6Qo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeIG42928375
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	acP/SVCD5qt0mkL6J4sXpOMzffwmRvuVbat3/cHG+e8=; b=LtcAzMFgc1O9Q/VN
	e3feZBVeF/zp6DeArWUbaNRvJgM3YEsex3NWh0sNyUeTAMXxLfEjPc8Jz4eIuwrX
	5YobT13ZouVcY6vxl96Xq32nU9y8/XJj/u7l9lE3Ex0tU93HRmc+7FMeKXsm7Ncy
	PR0bti/ZzrJjIpLt7hEEyuXau5PP3uLDuiWrLL1KEgbHAud2fK9/+y82/cERPdDz
	RvUqO1DYKgufDf+2B+YNyyCP23cYDb7+OWRlDe2AGXaHIY/z9Iia83j//2WDCPi8
	1RvazIoo30yMKz46ZRlS2w2kvkA4C42phfR/dF602/dc2zewkZiDUvrjWX5sbV85
	5oXc8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfvvt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:46:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso23994485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988414; x=1791593214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=acP/SVCD5qt0mkL6J4sXpOMzffwmRvuVbat3/cHG+e8=;
        b=Ci65W6Qo+nZrITm1BEjE5x4VPWA81sbPkULfZAXW2TeMWND69PT42XQPcLOsJbT5Pi
         yf912la3qDv9FRm0PtoCGSEaYNWITV9PEE25AXOF5JF8QvX0HZtGqW+h9SiAIf2z186q
         +7JRKMRmJfWq+6O5JMaHFUQn28wVVhPieX7QdYSDOiQPr3P79jNxvgaYnvwINrYdnayS
         me1S4HpfkBgS3xtyRuyeiiravzG2LD4D5HXaB794UihLfT5ynODX6HMchw2qgJWcTGXR
         tZDD8KS6S3Blv/TuLLCkOHseiP6Jn64uW/bm/unHHLry8EHOXyFqTKvwrq/PQ7FsEQjG
         bqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988414; x=1791593214;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acP/SVCD5qt0mkL6J4sXpOMzffwmRvuVbat3/cHG+e8=;
        b=0I6fIjZKparrYIoOXCWvlzJy6CRnMCMYcJMQ7OlkVb4b0rtN/FsGl7yTy7CWyNpGBT
         Ih4FwUg1ZlWSbfxT7Lc9R1hWDiJqhsmXVSVQneI2/ZvrLTZpEUwJ/luPVoZN06w9JmPY
         YhbGTm6o4PmnruR074EIzlyR126exONVDjf/6PX+xFayaVtLIIFNAMESA+kNtqsDvedI
         3WnBmDWsLhuzDYeZPn3SyMrVD2u4qq4qnWucekYGf2gr9dQp37XRsNv5aDo+J7WtpM6g
         2fEugY18CcjjuQA13/jdJadi9FVsI+oKMLYfpS/J8YxRVmHrbsOZ9EKqp6O3O/KlD/sU
         svKw==
X-Forwarded-Encrypted: i=1; AKwUvBwZplhL1XBmQwuMH4wpPN0T72H201slBJFit8D2Aqj4Z36A0bHEo5EZeQuk67EYfvm4KN9NS5+WQo2/Lho=@vger.kernel.org
X-Gm-Message-State: AFuF++kI95GbXbGzSekrmHIWeAr8HKrHgEr/nZMBnBnuruq+0qHRFmjM
	AKN44302ypAROWQVKN/k7HmvDF/b7kab42608hwpFHoSaiEXhmLcjl5JQ6cYSQ5CAkPP8wnBK4F
	OYDnErn6W/apfvs7DySvhstUbhZVV6vrFoq5H/o2rcBscv8xMrYsD6Fvo8FwvGjvXi5k=
X-Gm-Gg: AYBFou0cS1+loLDovQ1Hmao2uiKPC8enKAUqk86523nvvVRXawYWG0Q13QnR5cal6qo
	fMjiJI9Z2uvQ6j/QyPXf0xNnB4NNDEMjKF5YhQC9L8dJF07kE4pEJuYqwbhTsE65WJPsFM8CeJ2
	uN9oK7toiYIQFlpxAF4goBTrQ9YS39OMdJM0NZTADsGmpiKuO0RAeXvEsrMtpdlIm/MRfZy3scU
	BE6SFZWWqwFBRiuOBTN0ZsdHBkBozr6duDdE7MSRiZp87Qt+W48x9cKb1BCN2u31MmeCW/JtUPv
	w5qfmlMbOVzYZY1oDBLQQGRKfkFZ3AK+crr51gXGtR2ByVbygBcsy85Wg584jr07bcOBxxT9doQ
	IIrpB6C5S8vjeTxOB41qJKXQizRrvzzS5wMh6WLvYjLvznBVuJcMFTjlZndRuVH3r4/IBhtCT6M
	ayy1JYfPMLo0p/
X-Received: by 2002:a05:620a:319d:b0:92e:76a1:96cd with SMTP id af79cd13be357-93ce94ed6camr814411785a.13.1790988414135;
        Fri, 02 Oct 2026 17:46:54 -0700 (PDT)
X-Received: by 2002:a05:620a:319d:b0:92e:76a1:96cd with SMTP id af79cd13be357-93ce94ed6camr814407185a.13.1790988413562;
        Fri, 02 Oct 2026 17:46:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:46:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/mdp5: drop cursor pipe for msm8x76
Date: Sat,  3 Oct 2026 03:46:50 +0300
Message-ID: <179098834080.3641559.9462474422543913351.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914-mdp5-fix-cursor-v1-1-9fba3ace6cb9@oss.qualcomm.com>
References: <20260914-mdp5-fix-cursor-v1-1-9fba3ace6cb9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4u1ORJIU2eKirZaCsXO63WNochU10sag
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfXwwPWgqtss9Qv
 dqk9Lw8/fnsjhRTuwz/6NoGjS9VUIHUOzNbOlthL2RHkjZBhNuSkIzmeiDZXKGmpuqI6yO39wf0
 WgCz4MM1pDRugYR9dXrEp89XprCqfxM=
X-Proofpoint-ORIG-GUID: 4u1ORJIU2eKirZaCsXO63WNochU10sag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfXwV2M4dKLytIO
 Nmp+/D1QijTMnz7idIvJyIICuQsdJf73452PMwTNnqGfEFu3jFz7coG7mBZBR/lWfQQLa34aW0G
 Ncg1Th3ZGUiNfnnnoczOswgdz6/XFJnYT4Mz0/6Ihu0wKR2p6cVPzTjFG+r0QoapZcfwGi9AsLr
 sLig0r6WTTu7ldv1LUFbJ7Haru63KjOqdvRAWXF2D84BEP3wJ04KsAC3+xFUYny56Iv855+QRoB
 3G4z/SHDYN4YqmXGqm5eBHtrus2CRdg5LfGKEfI6y1TGzx6OhVQZL/By/OfDduNzr/OUkAq8GQJ
 vofqpqQlU+1FOnIqU8jAmj2czFmAd12Bo1y64Q/RoVfOH1Zhr4KnxJHaWjxUdJifSwADVzxrdxY
 Njt3UuDJp/LU550V+WeF2nSoKgzjJ5UiwS3OPNCwq4LKTG4AHTk2N8EZ+Jbw8+4keOVidcCMsMX
 4trf1UMuwv2rj+hrUNA==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6ac0507e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=VSGBqGf-xlBxKiEaLwYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030002

On Mon, 14 Sep 2026 02:24:24 +0300, Dmitry Baryshkov wrote:
> The MSM8976/56 family of platforms doe't have a separate cursor plane.
> Instead the cursor is a part of the LM block. Drop the erroneously added
> pipe configuration, letting LM to provide a legacy cursor instead.

Applied to ttt, thanks!

[1/1] drm/msm/mdp5: drop cursor pipe for msm8x76
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c33cee4c07f1

Best regards,
-- 
With best wishes
Dmitry


