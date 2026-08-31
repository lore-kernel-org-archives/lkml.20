Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A74C77B9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185437; cv=none; b=UfC5McLI2AcGuxLx6W0+G3CUvv9NyYo9DQNWHqbhVnjQFYA4CsyKLF4XHVpEPZB12+9zFMdu9JepQj8VNWUZFJ+iVkxM53IGzJwUQwRH0hxndkNqrzYZbsqa+sj9lUPtNM80mDiiv/vI2lVQNl+U200U9WTjYmuMYjuhYC7uD6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185437; c=relaxed/simple;
	bh=s/eJq3AC+D6A4TkhQtv3jZ3s2XvL1jfXt0xs+Kf1ZfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLjPSWvmVk4qdmTZhxRq0pWHLCkzS89HnoiDJfdEC/jrsZGok6lWG/K5O7tcPVTvaMlh1JCrF2lS/WHxZToeSj6t4Q1EJjIBMU5XG2k9we7+OIbBu+OFV8UGTNswLPEROrx1WkOevDGsD3G/vXkhjwpWpEqJafvOkIp0V+nLBxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kp/3d/hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qd0JqUZx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kp/3d/hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qd0JqUZx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBAEEJ2891620
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iVFh2LW5L1fu6esOaKgWGlZN
	A5ALr/AG5W+DG3xXBV4=; b=kp/3d/hyBVmPOO7zUXu6ZMkJIT2fQxXY6ESAiLYm
	n+bu2h3deIJLw258/8JFru5bAgTCUq75+k7SuGnDt/bvpJ+QD3Q4NAk7jvbGDwh8
	9Hwd18OLIp4lzkQz3/Kfe/RDfnS60OEYlSkZA8AJy0XVV9rHRNN/bCTzlgjdTblI
	8FPFyh5MiRhd4o7RostPozRjSJYlf+8h2dg42L/hJ9ywAkSC862Gv4HEovoQoNN2
	mMxHBBeUzVRlDoybh/fC+uMTHU/K78FFf8WkPL4SpA5p8RlInqyPEymN9pSRV3QF
	I40H+3YY0odD/+C086Q4pN1lVEvyi82uAGLn1GI4VIVO8Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556snpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:10:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so886917085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788185434; x=1788790234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iVFh2LW5L1fu6esOaKgWGlZNA5ALr/AG5W+DG3xXBV4=;
        b=Qd0JqUZxB4E78ebuY+xaQZGEar0z2RqStcf8Whu9KIrPLW+kP3Nt3njosFqhOltXiS
         howk3jHeLuI1tsSnd6IbGP3Yd/7GtGzyKJ2YzaxCNck2L4JyiCoO9RvVQJvatGfqzbO9
         UZzw00ia5u8ktA/cr0ZolASJtblzuQ4sc0RxiRCpET/4iZSVEvm8LMp/hkDN8eQlbTH4
         kHKAehfBpruEWqaEdaE1B9v5FUDqT6ZGQbZyl7fHxMwiGfDykvkg1LcyDhs3nKt1VAu4
         VPyMFGq2xZSnry3H0IIukxFee+WOY6AOyX/wCp8+2S35uYQRWHuNcz9/acE+PJg88pxO
         ONAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185434; x=1788790234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVFh2LW5L1fu6esOaKgWGlZNA5ALr/AG5W+DG3xXBV4=;
        b=cYBVPi+l8qZZljZRexR1CJQclZx7v2ICcP+LockcJFIeOPxz5VweWdJqxa9SRM+ZQS
         98BjwrobpTnDVN/z94OifTcQVSAVfz5beb3FTzwgWDMRTQCdv2mVnAn9dxh2rWw4bzYc
         5+2EMOBq7/Fedo3rvj4PxkvN3T9u+TvO/l5IJyIXi9hLJ9m2pvrLg31RDlpAjFF9fLTt
         fe9O4UloOXhMbNZeF5SyynvupT6rOG03Vy5oz46e+WOY10dH/VvTGBpJT0LjDp4EmEoJ
         aUyzw/Ok/hP6hBh5QSHl1tYjVF6EIG97KVN6SwlXf6DoxeSISFxWzg2s2zagobstnrZG
         K97w==
X-Forwarded-Encrypted: i=1; AHgh+RoV/iVdQlSWlxk2qcLXUqTXQa5ikz6TqdYBdyl1/kpNqsl/6tXV8buN1mZfk4OtBtnQpWGPfmW9eLql5ms=@vger.kernel.org
X-Gm-Message-State: AFuF++lUQToMk9GdCoafRiYFOZKVqMpyPoHzJ5YcoT2Y19LRrKK6SxOX
	/ohoj6xBao9E/w4oFyAfD+lRAa8D1x4+iNg5nX5TyCu1jYcYBzi6ejGK5XJxbhiaa4shNkOHN9M
	5oqFJwY0LbNyPuANI0CoV/Kb2D6RjX9F2XGf2vOq/BNck9OkBrgUZY7gGRLs814WkUu8=
X-Gm-Gg: AR+sD11yQ3kEiiPXzuI0ZabmQxja977kK8a+UNrEb8PZRKynOdqHFAOT11kYWVS5539
	PGjia6so4zGUqdn1zd2OutKQYHlVMLSg2wb6E05SvJ4SA9qCQmRGSjsu4y7G6MrmVGArKOUrlN2
	9Yr2NSITRZGqoXSOINzq2BtjT6DfN70dCCDp79bar1doU0BRWB3ZnQizfSE+Ckjzp3nH7ata0+4
	iIH0AzhwV7D5z7s6kY26FI+H8rThuXq42qS0UU05n9shEOSSSyEvkcPvcFRSSt8IWgAFT5zkikE
	WumaSNEWyftjiWiJUhV0o89GwS5G9frssYXKyvYWENKUHiKN3eM3PvQ/bKgZ8zE64PvN5CH3dg=
	=
X-Received: by 2002:a05:620a:710e:b0:92e:ef09:f8f3 with SMTP id af79cd13be357-93913783b9fmr3153280285a.2.1788185432614;
        Mon, 31 Aug 2026 07:10:32 -0700 (PDT)
X-Received: by 2002:a05:620a:710e:b0:92e:ef09:f8f3 with SMTP id af79cd13be357-93913783b9fmr3153210285a.2.1788185429688;
        Mon, 31 Aug 2026 07:10:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4942298fsm388336305e9.1.2026.08.31.07.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:10:28 -0700 (PDT)
Date: Mon, 31 Aug 2026 17:10:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Sort Nord clock driver entries in Kconfig
Message-ID: <xsjednoivela3axky2rnblvumqbp5x2p7szfrh7km5iq4mysup@mslleonjlyzt>
References: <20260831134717.510383-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831134717.510383-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX+9sLO5yFbF3j
 wE0ybSKWDDsApiuMmMVEL69eKc6fFLmh2K65qt66nQpF94y1Tykj7o3kP3e3+v13lyiad10pYOL
 GY8jyPqOm1VcSbUkXj3OINhMH3d3xco=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a958b5a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GoVAX4XHNZ9XBqBwuDoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: O7dngS-iSm8g86g_qVkFEkOscWXmcdjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX1rMOKwCOk5xa
 PgKw30o7Z76LhW5GXaDKxuUR2BTCERXV/D1SWIA9LyhsM47Fg2U6mv65do4U58uTIjsNuld1GtN
 ONmrDT/J4w7NNWvkB0FYig4mmn3YjuzQuVorf/ZS/q+tlE1NWZ4hO1rOaFCQcyI9BsA9mh00Lj+
 5V71aQ8YuRo5hzniW/GwD98V/PVNyoPx53sn0X8Wd3MauQMlNj9Xl8WkpKCrmmcJ6Hy9CftcZNg
 eSHQkuaxbJ9r+AxtTKD830CbJyzNtVMj9HVF0GL4MHhHleqCdy3599Gfb28BtIoetq7FF2tcaYI
 7W5OUcP+8Un/3+1VW2a0YRXsdnlS7zbeVAZkqCwa34rMf5QywqG7hpsmR/su7BZCESC6E3eXZvv
 un5qGCEv8ZB7yzAp04PCLmj19KmzviFRqD93CTYKCAyMQrb/zkOqdg/5toqhM1LBN5dvlrnAWMD
 5iC5XXqZEXhozfkv/Ow==
X-Proofpoint-GUID: O7dngS-iSm8g86g_qVkFEkOscWXmcdjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310122

On 26-08-31 21:47:17, Shawn Guo wrote:
> The Nord clock driver entries in Kconfig were out of alphabetical order.
> Reorder these symbols so Kconfig follows the same order as Makefile,
> making it easier to locate and add entries consistently.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
