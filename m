Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663988;
	b=q4l8d6g6daol4P/6joSMutKxvHfb0gV6MrFnu0sY7incEiUKsZPd9XUk1I7ljLDfAK/s
	 /ZYrm1Yv3nvKYUHL1FnXNIaL46Cd5eUTwvs4BCXk2I/NiSxCbDvOF3YK5lF4bFDnGbKxq
	 5V5rgjhfbPGBmlVVVLjOc9/Xibo1JI3E9KQ5ypxqIOYggrsVrr+GJ5cu37i/cNsirOZVd
	 n0dxd7Gw9C3WPgF0zMjngcu7bci6Y2YL265sN0Kd9UUcrEvU4EDEkT9wf+mT3lblzfOGH
	 he6zGIozaBCcHoanZOoDWLRF6FZINtINLVFtXVJlIgvg2De4ZIbbis3Y0HeoZQl5zOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lc4RpHjBbggsGE6BQ9ENCcFMCUrX4E7aPdKaqKzrj3A=;
	b=VdvEMOeZSHp0SzRTENUZw+w+JnoqBer7AdgASh0rWVzAOhg4ykUhhPERRMrQErwnj5PZ
	 6FT8rQbqOZqsgHb1j2PKVKkObwBzCZeLOjwsqgsW6wbQq4hpWzOwTJioXhwMkYbDnt7BB
	 9YslyukKSSKoT2NfXGfctBLxNFGxTJ3K8beTm6JKQ8mKpD1PzXApvZ1s2t9fc606CxbCR
	 38/Yl6ji24vEs6bzIlnPNRGO+WMbTqOZnOG9dkj7DiwFBrUxcpHbBCWdyD/6Hg6Mama4I
	 qWnmflUVh3YLgDcfrcdnexvk1qhU7xUtU1xdcKji0pTrMfb/VG1HdEsCxcyLnTPfCGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jmp1SGKl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WShl/Em3";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF146606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF146606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jmp1SGKl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WShl/Em3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0YS23923257
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lc4RpHjBbggsGE6BQ9ENCcFM
	CUrX4E7aPdKaqKzrj3A=; b=Jmp1SGKlOyA6TeaW1G7X84+B4fb+5UsDjsPVJZVT
	lJJD6oPavf8hKUrCcJoZHe0oQm++IhutkQKSiCtOhNsGfvvGVpIrtVdDdNJO0OlR
	V8CQPhumSfEZZpB8br0wViembKYiLk4ChVZQJuv6lSCP4rej79AuYy1dfBfU/Qla
	T+6W/ZBEgNFTDlQ+CwK+DcalLqKEVbGCZtK9kC2zGrarqeCN52QR3gOMzoLPOTkh
	ihPg/9hDf0O25Z5wqj5RbvkCehd+gtRIZGnC3iNs1DZiL3fYbwpWOEkN1KE9jSc3
	tl2C7LJeUUxjjxIfIvVYz7PKPhLtShQTG6Qr+PsF35NgnQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhuph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:13:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337b591609so24992511cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792663986; x=1793268786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lc4RpHjBbggsGE6BQ9ENCcFMCUrX4E7aPdKaqKzrj3A=;
        b=WShl/Em3RcLXVj8SbGJmsMEzlUFzXKH09Vo1iGc9mXjNDiM09wZ3wTizWQ/7vd9Ctv
         oUzoNB1Fbt4ul5OU8Dx097br2fqA3+SCdWq2kM2Kzwr5ddP5D1VAQiyVxxJTRHcwW2mB
         orflBSg7WfeTcYnIF2hu3Ky/d3+BADrqrwkgUQmxMPJVaXracn0lhjw7y4sq4SaaffjU
         Qpuw9cBvFqdg7psWv2HG2VD1TGQYhVomBQFC2VKphsBz94TBtLklMJyoiLsTVxwVQCvO
         tfsBKq4sRweKsz6O9YCMyCan49MsCfGRCMnwNVTDmXK4CdceQoTAbkP/XviULV1gTPfk
         RzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663986; x=1793268786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lc4RpHjBbggsGE6BQ9ENCcFMCUrX4E7aPdKaqKzrj3A=;
        b=zJyI6eVwHhxwsnU6kmVfpj7yN8plon4S0DT/+WJDkLvqx2mWe+HJSZvKpF+kTA1lM1
         wbhx+zIaBo78IvkWau2/OIX6GIctUiJyJOrJz0FfEZHPZP2RfI+ctNeIJwP2IZvEF4he
         8K9sU4aUh6nyVAG3LHm949TvVSxJK249T5S4v+keixh6IMsCIhO4E6/VtmUaFj7CYZeg
         kzIjnrBiS7OcLjoG9gtdBML8shkTCdM930J0AJ2z8QE+Cz2LR0GiIuD21/1g7C/wX6E5
         q64PlrI2pdQrN7RVnZQYkQfGZo/JZYjClXIyeOdWJplmUspTzXuInc3OXjxwdizH+j4D
         05SQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5/m394tAwN19KW1RxHNJvDD8M6rq2THXl4yS0hYUYJnl41AlxXKT96s+QG5Kkv6A/wpTj46YSLV3cWUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqN0z6tTDQb/Hmlfhd69oakxnAHsK3MVrsXpQB+mR9CMcoDH93
	81uxWARLCVJfA2Mpf7bkTVkCvhy0VPyu3N1h39LyemjqJWJZnis8IbX95nIpQ48XmFtRzfinD5h
	N+vTfP6zPuDZcJt82JWBQSnEKhRk3AxM5C0e909B0Qajte3XdhfBicbNFvI1zyP6J3Bo=
X-Gm-Gg: AYBFou3gLt2VynsHqx0wW7KbJHshAF3T+n+7WHQFdfmQAcxapvwm4HN2v0H7j1dm/ya
	tKXxeDdUH3g9QxxZB7PrQ+B6mD4CgrmjX1YFvzfgEbZKN4e9Pjnt9gdJsXzZ6dqmvNCOrMLEZ9u
	YuJ/NnZbKx8ebcATcShLROZHgZmGT3RJI/wEE72V9Cyuh5Wv0tLeBDxM0T/OgifW+tn7bxipxWD
	IF2qCrtp9LCx0SE8N+nkg6W2TxU4Cw6xn6yjdtbJCqREMfLPidwpc2lMV1HWyDlKOdProskmEYR
	yz0Enp1V13qU7kHjXu9mX8ymraTvFlSDKskbjAy4rdjnTfCgA+sSSnoYRtTVCJDHmstJGVTfOfD
	VCpo1I2kF+3vU068rL4CgQftbrzGkH/HAX+R2AGytcBe2egEcog1SobZM9VkxtQ+KRgtqemEmyi
	7enn+YcmNsyieq
X-Received: by 2002:a05:620a:6087:b0:93c:c08f:ecf with SMTP id af79cd13be357-93f57f93b69mr825264485a.53.1792663985799;
        Thu, 22 Oct 2026 03:13:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:93c:c08f:ecf with SMTP id af79cd13be357-93f57f93b69mr825259185a.53.1792663985280;
        Thu, 22 Oct 2026 03:13:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa4b90999sm562304e87.68.2026.10.22.03.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:13:04 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:13:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
Message-ID: <d5whwqc45gtqwmb26mh3wi4xdls7fm3wxdszo43qb3z6rhnj4o@22ghfqzuryur>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX1AdYH9cjXGib
 XXxK3id4rjiuuA4VqcK/Jp++V8hoytH4bgCQFHJCK0MF/X2F0MIId8aq0mhtf7LdRiF0cjgVv/H
 ovey9vI46+c6C1Al6QjOYSCPFMIYqSEl7RVpYCAVOVf500ytRBhPLNetvMJAwCGATmASn2d9iDb
 rMMmBaWJEKCOGDoJgOml6jxjUJsRsfgyhUgQzLtzhEmlDKv7CxNXS7ar+adKuScK4wNvQ9yLZKF
 Rc22PBuqqMpgBvN5o/r+vnhTeeleFUB9fZpx4CvAch69IFaO74ac7bjA6i85bJUwMETPL2E+MXi
 rGXjH+Dda4Ol0bNhfOHCRuSJ/5A2xI8DqWtDW0OC7bLGwx4znXCVQPDzy5Z8/YjpkVFXC2i8xP6
 E1lq62bopxzW22/uJpkspHdtsPOhsHKzgL5mO8pdjqhnAxcGwhki8QuAqrZG4m6unRXiLNioWVZ
 +78rwiMgEE+PuqcHL5w==
X-Proofpoint-GUID: atYvGaI3fRkpnX8tCR7aglVOT12JCMey
X-Proofpoint-ORIG-GUID: atYvGaI3fRkpnX8tCR7aglVOT12JCMey
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9e1b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=S65zN7q3fX_PurGuIfIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX+PWuQO0zDCuQ
 4WcS1xtQwb2nKZvbA3lNjzrGbyxY0rE87cmEptyTEf8YSsmKZeA6CqV67OlgqR6oU5448ZSyIlv
 w+FTsbD4vKHb6k2OcMK9hroc5lyDkJc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040

On Thu, Oct 22, 2026 at 03:19:44PM +0530, Balaji Kalkonda wrote:
> Add the DisplayPort controller node, including its OPP table,
> controller clocks and power domain.
> 
> Connect the controller to the DPU and USB/DP QMP PHY, and enable
> mode switching on the PHY for DisplayPort altmode.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 90 ++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
