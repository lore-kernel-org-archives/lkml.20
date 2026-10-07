Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE0648F84F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379425; cv=none; b=QNuN6279V5A48uqawUAXgdu/L+6/VO6mxJpN/VqVfbIXMecmesj7kKE5RLrifus2/xQab0A3NU46PfwcI7nOkcrHoUHtW4hPf688sH0du9iamocLg5aQujcrJSo2n17tMk5+eomxJM3B+kNWmSBIRTdoCxF8Z2/J0jNXOOaUf0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379425; c=relaxed/simple;
	bh=mQsliMn1SLv97iUfP+osd1J6vLUHUvKgPR541ZNY6lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngNvOyv7BiWCHzEscDmafiba4t/2Cq6lRSXpth5FUxKVnYtFom0UlZB0w7bAKty5pzEb8iL9V2taI4wjUhYM5IZ90ff0nMECaBuUC+skXAwfNHojoEr+7nugA4tA5e90qJcgr4HXGerYeVudKzjgHTTwKlB5rqYBABb8MsjbkCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyN6id0g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvL4SPIE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyN6id0g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvL4SPIE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVLT23787054
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 13:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=od/ltRzE348gH+PAnRq5JK25
	RMcjNc/ilrPe7ahtxwU=; b=jyN6id0gSsAnxV6VXP5219pJfa0SnX9aV4tRRPrS
	wLSN9cfqHQS+uSh6c1HCJYp7Swy6KjdA7sFRQVDHnuL48ZS/5q/jeLk3G17mYJqt
	VEJTwcUQLYDrj36WugDVjVkE6hDTq04bBsU0jlzAoko9Fhv4PLWolNo92ljYjVoe
	HWX+ngyykneVl52olGUhIf8AjicMlqHwRERG+c6r2aNKkrjabMu84yizbMLurIIB
	1wSwLFydOCEYyfpgvU0+k4JyMBz03KhSsSHGnjyIsi1Mn3Ba3KfCwmVcYa9L3gF9
	U48zluwhnddUC4j/S5WEcfwHWXoWJ+4eR/E66a3LS7OZ6w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcs8ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:23:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c1216e7d2dso3564798137.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791379407; x=1791984207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=od/ltRzE348gH+PAnRq5JK25RMcjNc/ilrPe7ahtxwU=;
        b=kvL4SPIEueft8aug5RxfbV3PAkFLkKFTHZAWuuvVt+UxcSSxLMHBPgmvWHh+FF19G1
         m/C/abKsqE5AvH0yec+bR7tBX4uoD9LArBUwU5iAww9Rla1sAaERMLrbpLDxD0wVgyPa
         uK8iTP9aMW+tdYYz0K7eL0P/sQHsQFMdTFt0FWH3RenJvjMm0uMPDGya5nPsMBcsY/1M
         qJnbsxbEAPgIp0zS7AFHu/Bqp3mJ7TOIWvtWWI+2EKEIjMzu7P3dx2LtId3yT0Ym6kaX
         S5LUkuGz+889OrqzpHPU7h85yFoCyCr5tSaKlOXqJUvipREUt40LOXb1VWC4QIzSiUY0
         4bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791379407; x=1791984207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=od/ltRzE348gH+PAnRq5JK25RMcjNc/ilrPe7ahtxwU=;
        b=sG9OBKuSm97BH8qu6t+GhE4dPKfX14g+hfjIUabwQwd/7ZEhr6Uqu08KRX7r4VmKLK
         SpTmbbeH9grHhyNVuJSBToJHAMyqtPklwVSA4kAjzA0LoAf8hp0aZ+Pj9nmQs/N3tbcp
         bER5BOoAbHALo6IGJg/A+b62zNUfvt9WMsbls2e58DUXC5Rqd7ZNyFzlp35cBhqjX9Pv
         Tb4ik4f1fEXZ45fxJv3Nob8PHhkJMNw7jQvfsqeBwASxdJfcIACWsZx1G/VPBNI1FCOz
         oEM1l6r1ahcfaTBJ6BidBtFSJAZviJ/AHVXhb3xoNalKt94Loy+5HEsrlM0i5+0T7Cpx
         ohUw==
X-Forwarded-Encrypted: i=1; AKwUvByvIe6/Uitv67iaJqxlTOY/FImk3kcdrCyCVx/8VErgl9faRletVRATq2YjytTLUZlNl9knAcpo5Z1+7p0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJSVsus6AGYo5ierAKaXpbhzCUMhIG7dDkFGg3C7mH5dF/C7TK
	BTyq11awm7zTNtfqOvHPfqccNgYKcmo/VHb6j6jPL0+wO9006sQdBzPISkWeDpdq4rRH1nFwpCi
	H3ah4xgOsrv13rKgl+kxHxj2avUzcdIoj37EQUBhy1G8HpVnnd3nLCBX5B7jfhas0n1U=
X-Gm-Gg: AYBFou01jAr2aST6J5VmBU5TVKRwRUHzjW7wy1L3ThopgzEqqJbBGitQbZAk2vYXHO8
	3Jx6KaSRg+mYbLoKsw7Pc/4mLad/3Bsk35o4ZjF4sjE7qDlSdnSwRyDNmdS+JI+xgdDDvxTQ8hY
	Cp7ESpnHgU7T8WnEZJwvH2hybicdBZPjX2d8jMnhlur7ikpZ7I089tZ0kq+10mAP3OPA/tt89hL
	YcZJbYLA0zcXydLlbvKiYDggLyFVc+tu5uB+vIolYGOxakKH8Gz6JJhfN9yWW/YsjWKRTt0sXlW
	R+20rw9SvHZCQk37elRbGzpmtmeCBNFh6CAffAuA29bD1vB4OM8CiTnNygavfVPXLbRRUGQd+0u
	jEylZV2doXHfaLMhsmvghEaXv2ZPtlDbruhSeHTW9AQGpWYJ/01V7oxMASBNKZnMJ6fB9f8UvYb
	6k3Xyv9RnAhUi7
X-Received: by 2002:a05:6102:5088:b0:7c3:1898:e8e2 with SMTP id ada2fe7eead31-7ca3890b52cmr688214137.13.1791379406697;
        Wed, 07 Oct 2026 06:23:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5088:b0:7c3:1898:e8e2 with SMTP id ada2fe7eead31-7ca3890b52cmr688194137.13.1791379406242;
        Wed, 07 Oct 2026 06:23:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd308255dsm29300e87.35.2026.10.07.06.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:23:24 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:23:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] platform/surface: aggregator_registry: Add Surface
 Laptop 8th Edition
Message-ID: <zgg4st367m4s7gfttvmt7hi4khx5haw4436hmde72mu56xyft3@t4fxnw6c7jlm>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-3-406fc042162a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-mahua-surface-laptop-v1-3-406fc042162a@oss.qualcomm.com>
X-Proofpoint-GUID: X6Er-_cztPkJaYzmvYrsAC8mKv9fP2wK
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac647cf cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lafGyRzbQaP5-a-rDggA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MyBTYWx0ZWRfX7xeWCqQ8t08W
 cxEz/NzZgOugssUtF9NBl9+VUy6SBYmZlKpzU2hi0WWLAAQs1UUjQK2zB6scz+u5Nh2uvc9+6e+
 2sZHb0vun2lPXmj+o524DLHqDq5RJSU=
X-Proofpoint-ORIG-GUID: X6Er-_cztPkJaYzmvYrsAC8mKv9fP2wK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MyBTYWx0ZWRfX7x+1ZddfnlV6
 j65GTZk1dw2IHJcWtKmsNmqpCrwy/rFDKtCnDkWaEKE1/io7q6asPy+q/dnY4nTE/AoHtoJ/BNR
 3ROyE+OdWQhDtaiZPLGJHnV7H4xEsp7FVQup/qPWyy6EVlA4NBf9nXiZ5Cne7EouHXJPjXRsYc0
 X4KyWNpIOi7LtR1vm+7n+JNY9DztMQ1i6lQadpG5yOewRlVLFf1AJtgMWeS1f+6TpPHvhqoUHUf
 CpYdhBdYcm0aBm0Guw9YUIW8pqbmW5tWdDO4qfXGmwOv4BUzJj8QS9ag+8Sm29/+KeIC5N5btdV
 xWktjF59tP/L4Mo8udqKA29BgdmcGwGDOh8fQOWPSpBLMCSVjeV3sardlCMgdHHp7+sH/SV047h
 ssw+GRG07hzfyIU9g7CFiIBdCoOLlZjgmECA2YohDD84dyAmP38/cf3W0csq3Vmaj/KGmLGQCDF
 GFURr9iU/43723wgA+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070053

On Tue, Oct 06, 2026 at 02:50:29AM -0700, Gopikrishna Garmidi wrote:
> The Mahua-based Surface Laptop 13.8" 8th Edition exposes the same SAM
> client devices as the Surface Laptop 7: keyboard, fan and platform
> profile. Battery and AC status come from pmic-glink here as well, so
> the Surface Laptop 7 node group can be reused as is.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
