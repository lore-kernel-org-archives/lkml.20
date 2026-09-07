Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22D347728A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788073; cv=none; b=kG/1RJe1pyRXburegPHGr7efzzjFY9juGVxSfcoBLflM97GmNBA7z/lK7GVvNy4b5TcQTzdTGpWH5Mm1bMIJ1V6FuzVuVzUe0Hhj2wXEdxTYd89s+W+RHJ7Z/D4j3rQduHIQHA9pgIvw5Vqzb4R/389NXYD0KM93TZCRYVQYjBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788073; c=relaxed/simple;
	bh=oRUD0n8TDjAUwxbhtvsIcjMFzxikBabyo9HhFVuIleo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjIeNZCwLrUqhNJX3AyikMG/TsUSpdF63lOdUAXQmiDILBi9EUIWfmZ42XNu+Bdetd0dcFJV3aQrIuYVJbcC+BlXvBi9gpwLKjc0tnu4C/ABk4bzzApVX422l5A0NNrpd10iKldYN4gvGmAM4cKyXTf/fzNGICwF4rM9YFno9LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2iA3b2Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdN5uCSl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2iA3b2Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdN5uCSl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Anb4l3777980
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IkfSStE7YmCOzRx8ifIvDbY4
	gsqbXj9bbz6lxb4vGBc=; b=g2iA3b2ZxpC4RsHCVH8Z2cCYug6+/eXJ4dIZ61sH
	LAmpkq0ffkmOEsxf+NVd0Q68p1zYAblZqCLuMrgzpnwRnS3snpiDuj0nv4Gq2LHr
	905vq9B3Lm1yQwbrsqaUgXaYie/2REKTzCjcrL6aMx08JTSOZf3/WMdMSuwM5OtZ
	lJJGEIGJy2rKhu37auef+Uv4WjFXlc9AgWWf4cG1yQwNyxFLRUmRa8uTS7Q+nUh6
	0mW1V2YNRnePtTIRc90avANmvRTWpk3med34z0CcCxHBJDpFV6NEsZxAx245rAk/
	pwDZEdkIEbgHjdxX7KkroC8JMGGdnT7qoF/S6fvLBqNZBQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyh9mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:34:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744e80385dbso740954137.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788070; x=1789392870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IkfSStE7YmCOzRx8ifIvDbY4gsqbXj9bbz6lxb4vGBc=;
        b=XdN5uCSlazdBqjKSehBogX8xITx754fgLpOhzndfPjCDOSVEP92a52+kGFqoL4wkHH
         SunNZEycDPtNQ1XvJ2I0UUzQiHs5G0a1hUS8Uv7xroa5obcEnxcJrSLf5zZB3lUnQbTe
         B5DZOSxbHNS1cacAH7+xwsgmBJ3OmObg7s2QcdJdraX+ZTvpudih4St1gvBSWlaW/AFo
         YDPdNw27x1n1Ng/hYrflf7vLU6hYENkPxnDma3PKFfavOGcAM4zkzP57Or9y+4wRXEMC
         QslOpnPNpWNz8Yg55Ox/5k/sUI8A3i95hRuKl2SDQzXP5d1LnBA39qyh97AavJe+M4B8
         dXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788070; x=1789392870;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkfSStE7YmCOzRx8ifIvDbY4gsqbXj9bbz6lxb4vGBc=;
        b=bvMBfRk7wYiPs4RMbJOJpzZx28t2kwV28S96H3j9v0Qfima/NNSGFKcwZo/MwhL57O
         mxiyFnpn+PwT680JGCgtoSg6JIsKETMIZQN7SRCdQaNviu2fcOT9zaEOtfRgKAD7Khu1
         DOWrKasyv6Xs+5fehYyJW8iObW71pNeyNkZL0wP+Xyy0L0rYnJxYyol01Ed8ix8X0FpT
         qMnlKC98mKEJpT+PQ1BfRyaU/BWgSYwqBvfkdNrEiK9xCcLgRXgQ6oAQintG8rDLaRva
         3N06k0EcjkB2t3WUGN/EnzYR3ZB6Jj3Xq0lMxDExcGZt8PThWkNxFYueuhuDm18m76+y
         d8FQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2RgXwQKt5PFWbfcvhcu+FsYIHRSNscJHY8uy2WFf4Ot+7bU7zodjHm+a2eWlJxLQh2eWEv5m3HnJGrl4=@vger.kernel.org
X-Gm-Message-State: AFuF++lg4iUUG7Wc1bH0XGcPBg37JQXYmYGIGeXIC4eCRF0Q9M4V+uNU
	MWyDY+4nr3JHZhzjqE4Vp1BapvBWl8vrQv/wT2nHr51R9QrQtV01yCkAMWu1Oy/lg4lfmEei1IQ
	RwKXhS3p08j1xK/9BIMOPjaxW/8Q+epEMoF44PfEysiMZwqM4sGCpkFbBP1QUjKpk/tY=
X-Gm-Gg: AYBFou1fybrJWavOS/n6fT2EXy1Wv87bGw4ZemFi7bSptRkaX5WZb6BDBoldGv1orf2
	aIUW74KvwUXTqsqlFA7ov8H3Ja4wrzRjZgJmUkhyKAn4XjTZ052zRXMP49oujlEK8l7Tb47rDC7
	MSNa4aX4nvhDmTEDnCQbKe46abkDlaAxxHo106W6IWiTGf7uj7dN2grr+q26AD722ZoAfGQcRwl
	OuswLCpgoVGP5LRdlw/u3VuRsiD3iyWlgVzVlxiwJ3sXqlz2j0vthYOzbzmEPBiZh/W+Vujp+F7
	xPafgfbIjQ0DPWbLwiXBbeR5DG1hj0Jvd4hIplkepagH93DzVAjqxFz7C3fdY50Ymj0v+K90tOm
	nRLo3zXn5X7cQ
X-Received: by 2002:a05:6102:943:b0:782:de7b:eead with SMTP id ada2fe7eead31-78a4a68089bmr7492051137.1.1788788069860;
        Mon, 07 Sep 2026 06:34:29 -0700 (PDT)
X-Received: by 2002:a05:6102:943:b0:782:de7b:eead with SMTP id ada2fe7eead31-78a4a68089bmr7492035137.1.1788788069225;
        Mon, 07 Sep 2026 06:34:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07a23e85sm193290965e9.5.2026.09.07.06.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:34:28 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:34:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: ipq9574: Flatten usb
 controller node
Message-ID: <hyerrktnh36crgapyim654dedsbhlu2k3tz7ff7dn4qybbijrb@tgrhu7mjcpth>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
X-Proofpoint-ORIG-GUID: QrQp12Rxo3OyMkz6yKeejL9WTpu4DBvu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfX1/LHXJmhmZwC
 mdenw8sjDJzR6hvnvPEzFoMvhIibr/HMJpFEzGPjnaAwNi8a/YZkuZZCkArY6CDQinUygvZ+vQY
 61dMsVVWlce8X6PX7hizhcB9EjqC6dTekmWuzVyuMaTPhDyPZaXG3AOIcKXsoY+Sz3GrIkUXO4U
 cyRNHSo1VczsYihlxE/xEdRacOy3joItbFOd0UZg21aBYZNsKiS4NyayodcCu4HRoS36LjkXQUc
 sQUuTfUlv7cZq3pd1c/1jIWFvnX52a6eXi/Ce9X+dyZIvl2yOBEH13CFLXkdNyBtBUOqUHuzWw9
 r0cvHb5Dp5iSWSQpGWYYtiTjhKe8i+PXZAol59QuULnJ3e587zEMnu6R96pN3zfafSmCNDLWJag
 +xI0cku1Vrf5/8xb/Ka6e/BDh5A+RR2NuS67/e1OOVK/8JgVqchZo249El3Il2eOJ0POyv9UB4N
 wMmamaWdIgnEp0SNHlQ==
X-Proofpoint-GUID: QrQp12Rxo3OyMkz6yKeejL9WTpu4DBvu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfXw6X6w1ivTLXb
 KpzdJb4r50gLGZ6HmOyrq4pSRK/u31MBJ3NVPrRgYY8DqEM/ZQH4Ahe0AWuTT036JN5BtXMzPkI
 nN9DS9wUDo5AyE7GlP5Kp0X5r0K7SH0=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9ebd66 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=YHxE36J0psKEVs_6LRoA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070150

On 26-09-06 08:46:49, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> In addition, swap interrupts for dp_hs_phy_irq and dm_hs_phy_irq as
> per order in updated binding.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
