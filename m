Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4E04DF4D5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410482; cv=none; b=HIuhNSy437W8xecTl6yNHSO5NTvogcdm0rsjxnszMvmbM6B22inVyPYcatIa2ZQurzDmjstxeAU3Z6YrHWaF/Ix9VlNnbOBwJ3FK9vaEpyPqj3mR345sM7Or3zYIHP0nw3xVSt6T3Z6rQetXjGHwD2/XEAy2kjqie/hw0C8boX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410482; c=relaxed/simple;
	bh=ms7BSnd3FiMoukV9tW0CfbTy8rz5XbhFMM302rjGkho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmPrccP90RSyH2PPzPyj7n8EbnWkqH6DJCd94+dPtWxqGsmqGGMtTnuolyuF4QAzatyYvk8ydWcHLOFE4dEdJoZnC07wpX+eOIM9jO+o+P0h4O//ufElTo/qeZXeUZeMEnquMXBVJ5ypUH+Kuy7JodorRDMI4zHsy92o1N4sCLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W37H1eAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCkwKrzp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W37H1eAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCkwKrzp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P1p82042040
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6Fg2JmWjJmbabOk9C0BRHqS/
	QtSPnqgEVZrkMmJYDlQ=; b=W37H1eAGqJuNpHajgHfNvWiBmHRMonKvZ+Har/aL
	XREv3Dz90mOkK1LB21+Y21PbRwkrbIiHlz0a3I9YLhfyQqi4h/kVNGpM1OBy5FCZ
	02jz5GxndLoxSOTs7grLBVrxe746oBd3PdDnFwK4lNWWCT4kyE0h+yU5U/SF6oXD
	bsh5rq5UjRZ+DNPyvD5qCkx8wok7FQRh8jGsvxlXwipCBTHN+HjupqQZw0ulTZXL
	Z5FjKZ+85zw4OEGDe4R4AVZe7AqSofxRgsx/5rStd4/OyGF9y2NHGjtz2EybqEd5
	qU8k7Qzuzzb4lvS5cwzU9ppIsV8g8XPxkeemXUCdjyyiMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2hu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:47:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so461532085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410478; x=1793015278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Fg2JmWjJmbabOk9C0BRHqS/QtSPnqgEVZrkMmJYDlQ=;
        b=FCkwKrzpYhq96bfdDT3S0ICpH37bpWZgeeU70y0F2fzV+SCL2P+PpmnCLqMTEp1xiG
         owzud6rPjwKycY3vb2vYTXdPt5Jycqr4OUEGGKbL+MRLMC2VEHiCl63vvgOWu/6lH2xo
         ffLGRJEE8FdRRpJ466qM9kV+nlOjmYK2Ac/4HITUCaKGSj0sb+yNJ91+gEOykauY5Myk
         ARuQTjnQCwNLiGYMW81l8SO251Ex5VzYxap7kPzVVIy0T4f0WgblXg3lX3Md11MJFnPB
         uxb3mJkrmDnDjo+nXURw6zuEmezz9frIeOqmd2QzTDmlCFOb4kkNgf1ISa7NWcDlnX8H
         np2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410478; x=1793015278;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Fg2JmWjJmbabOk9C0BRHqS/QtSPnqgEVZrkMmJYDlQ=;
        b=VhBMvbdFHznLRWmQs++SHMZY3HJATAWKPtqIe/2JD8PK+8Wj3h64FDOcacvrt1OQ3Q
         obP2AJQPI4U/y/HHy7BH60U97suT4km29bu3Z1boetVOPmhgcD3nsUDIA3BY1n+Jgu1F
         Iom0SylIbsJl2xaTw1VfYXoOBLSitilKXDbXTA3J2qLRQ6+zHdpf7lyNd/EaU4BksaLi
         uJUobB+ydXTn4vflDh6Kbt333Zhf1B42WOW/sZ7INxRSeOj7yCCVSg8+ZJwLu3z9p4m/
         ujP+oh58GERR3BFbqVPMnJGtNBYRq3OljmY3tNuRvAawdvFSMhxDm7q0dwqw4v+jFYZS
         Hb6w==
X-Forwarded-Encrypted: i=1; AKwUvBwKqeHyY9+tP9qDq9n75yM8IrJlD/uVLWk+Gp6Nh/y4fm639GucAudBAzTtILgjJNnn50BMzsF6W7eqCu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYItW63QBOs5TnqlCg+2Hnxn+TrHLfHSNyolqcVBv2CpiVfr2n3g
	L0pm0XYZMVkTjFLP5ooW77W4GBPm8/RaYSI8utWiug7fJ11bMBOvO0TKXufGL0rzPPdfMj3IYPY
	I3iU3u+a6CuMHshUi2B4srwcKqZjbI0eOsC8O7Fa52CA4sYguDY3uFcDgVhor95G7sbI=
X-Gm-Gg: AYBFou3BuqBal472yF5X2Ox8xYSPtxgrOrvPhgzwr8Zhwf4TpmbueRQ54nX2Vm2nGni
	W+hKotms0vQeGfbYwl5/TJX5gUnX4qQJUWgidLzH3I7WHfNIinMZz1aOQc2vXN6BLRVoehQqchG
	9iN1/8EewbdWEDa0mVZgRBHl9Qr7LdPbxyLPhks5dVm5murOn22rRSJoOrI+1C4QRMt3cBl57Lw
	EgdOR4129Mn4ZuBr+9BBOzZ0eFxlKVqwrjXaAjbKKsYQBzY3Qe6Yr7Qbs2JPSuygPQIPodBfIu9
	Q2IMpJ2lwCDFNtypil9n2nBOJcopMxUM5xJ+3cQHVOQMRnx/den7Q2LkCcXaUzUT6JfXfR4E5Ht
	7Z9aVDqAmgK9vklZS
X-Received: by 2002:a05:620a:6f87:20b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f2d10f8a8mr730719685a.45.1792410477652;
        Mon, 19 Oct 2026 04:47:57 -0700 (PDT)
X-Received: by 2002:a05:620a:6f87:20b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f2d10f8a8mr730716685a.45.1792410476993;
        Mon, 19 Oct 2026 04:47:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5ad06bsm23495798f8f.14.2026.10.19.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:47:56 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:47:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8150-hdk: add display card
 overlay
Message-ID: <zeuvurtobviw33jykidak63yf5kyo4y6api3bnctlvmxzgkfhq@bkxxhscma4st>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-8-86c05068efc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-sm8150-display-card-v2-8-86c05068efc5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXzAfNlP/aMnbK
 mgCi8RKMnkz7M6pDvxfLQGyDBQ4Qj5ZbztPVQuukmksBqmyVLONl2u93qIBEGs6UJp4LcYbKRt5
 voWvcSZnu3nVcvSZ2Y0Js17yiwq6iT8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX4O+pz3mT3U44
 QqEYo+NFUnFvt8lIXAssMhEY2hhAnE6otwrgIr6EOHHM02wEtolYFGr17AC45k60kspqCm0bwOK
 ZgpglxJhPPaiXuadMCn2iPT6IYpjQRH0ECLcSyZ9QfMPfoNBwAhDrw9A7zdSFGE1//1lSV0sVVJ
 W284hXOOKZh6P9/8l3kMzOKLpIsBq2n6KiwdnS9i1fdDfCQgJOE11Lk9xCkZxrB9tt5d7WtXnGq
 pLfOmJalg4AceEE008F+SU/Ls23VI1jMiI9GP+w4wk2LMb5XnlqQj1QHLEHTaCkGvpoe/q0EqyO
 hEoMl5uZdSd4aIKRETuYZzYj7Xgqdjp1iMF13nBM9TUR5m+dn2Uzy07PZzvv55v6gJQx/mKL8d2
 7FAN9M841xTJry5BP9lhE2B6DvamuGMBTnSHxBYDYYq1GzUeFvVEr2+hNabE/3eYgtmnt59e1ZB
 c2pS6lTl1BMtzuqrpnQ==
X-Proofpoint-ORIG-GUID: AlVmaF-nvz1GnfyKDYJMNT3mps59t4Dm
X-Proofpoint-GUID: AlVmaF-nvz1GnfyKDYJMNT3mps59t4Dm
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad6036e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4ZraDTF-A1gCCZ4hMMYA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-19 14:25:44, Dmitry Baryshkov wrote:
> The SM8150 HDK can be fitted with a display card carrying a Truly
> NT36850 WQHD dual-DSI panel. It uses the PM8150L WLED for the backlight
> and LCDB for the bias rails, and it is mutually exclusive with the
> on-board LT9611 HDMI bridge.
> 
> Only two of the three WLED strings are connected on the card: the
> backlight stays dark and the boost runs into the overvoltage limit if
> only the third string is driven.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
