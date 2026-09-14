Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0083EDE57
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371690; cv=none; b=Aapt2dS27ls0T31CnY/Sz7zZ/hLWthkfyja/XrcLt03IFW/Q4300YcluT1PlyfD74bHmPPnOXOnt8PY+yTw1K6X/msibVzRyxmtJYogsXauDCEpGlAUYW17kpr8nbyEozQdvaIYVyghffslU7FD4MGsnvfRovyL08UwR+h2Q9FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371690; c=relaxed/simple;
	bh=M0xL8A1MLG14YYpIHMTe9AZyHw3LRq7oQAFVYejE5Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYFCpzGfWs1o4oWwHqwJehQ1YXVgJDFURNsXWIPYMsjkd59VZOt0Mx9PV5Cb6jDBsE4XQZHhHA100D2a1DibGBxOrD04+yaJ4ElZQZssAiGfd9DyaVzn8NcqmXM9tIkSxqAj/kosyIHXgkFMA4bXCIDJJyzzPRdBUa8fPpDSzVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9lLhaIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnWGFtcp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9lLhaIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnWGFtcp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikWO3196153
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UOzHFgngzR2fvDrsDDS/Q47T
	gX3el0oe162wnyjcEuE=; b=T9lLhaIADCRRJeOMV7cbh+wUYOJB5ABiTEUyL6+5
	N5yKi9f9Gxqxd2Q+dC3VypeiCFpVhyWDVlYcKlMFHkc4w17czdnaiQX6iP/kWRJC
	bIKnZzvYu5EV209Pf4FhWC17FOHOpMy3wNEDFLIlrjMIKeHuziyR4k0VonE26Em7
	q+cj6Lwo8Jdb0iE189bAKb9eXUpIiorKNp8Zd5abTNUgPPXLdX8+CajYl+0H1AAX
	oce/DYPxMb4xKnarG8gES5LiGYAqRANAi/fZxq3M0sTu55JjMqBnI4jpDW92RreO
	Fc0LK9JYEaMJjx9kd1C8c9iTgE+y3yhidj+cXwcv7kMQPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdhvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:41:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939665a1ae6so784533285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371687; x=1789976487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UOzHFgngzR2fvDrsDDS/Q47TgX3el0oe162wnyjcEuE=;
        b=VnWGFtcpZc7pWEJk6lUyryrrcegSLo7QJZ7kGRcMUdfNiiSvdX8pBHaxidVNu8Kx9u
         zLRG20gR2ZSjj4Y/DkYsXAT78hsFtWCkSkFnJUNvsQ+dl+pZW3CzHLU3CnnnFG0RxtkN
         hT1Ndw5UwqRN6idYTtkhsvyB3G2X3wgLUEM0IEjPVdFzW2ytlQI9cpZsDDkg1hdnv/sm
         t7CoddoqRmoyPuUAOE72XHeaAH9hcO4S8wZpPxyEHa5e2wi+RIJGse98m8phrqozW+PT
         xdaBAo8Gh2tzFaNFD2KdFGktd079eodY3h6uP1RtV/D1MtezsQfXji/8+oERLkO7IhRe
         NZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371687; x=1789976487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOzHFgngzR2fvDrsDDS/Q47TgX3el0oe162wnyjcEuE=;
        b=EpfeQyMajjIVVOuVfed0Hq2cMol5rvf12oYpi+fn7T2Vi/S27H4IyWP0FyGnKEg2vQ
         tuVYwgaFVByOxdgpgrBIITh6UM2B1D5cxN27IBW03BgkK0N0cke0ny0XeLJzJDl71o8v
         /2LnQ5JzQe+jrtPOTWaqj1f4F5CuPhfNlI6FcFv9obflWnKnRLMQGdmPgNAPPyo2zIc/
         F7h/1NmAVU5M/1aRK+Fv5mB+dZk/mKC5cwUzbJv0ICO7ikOo2KiB+4pew9EQ//kwLzKM
         Gb2ArFoXkcHyGSlMEj0WMoIdahr5sEr9u8EqPTdFeubI+EK8ILIKQvBLiOeo/ZcQPhy7
         /kHg==
X-Forwarded-Encrypted: i=1; AKwUvBxIZfvwMkDcHyw0DpbRfssM9uzmAtuWhx1f/la0SZNyR0rCp5XcsAdDA8jUkfHgA8i+uumxkIcVEYCKIn8=@vger.kernel.org
X-Gm-Message-State: AFuF++lZTyM2dxQO62SCyp/Ptt6kbD91e3i8tFOZHVQMTuxbVbfOMpQR
	zskjoZVUEaYNysMuO/SOtojJzV6gduOC0V8Sh0zdu7QTI8Ytpa5anmEsqmi4hYn8agLTzkFINr9
	PAATbYB+vR1XX6yQ0SIAK9dCYoqGSycH1RnJ6k3EWxZ5KDGVwgLwJG/XC7vV4ytaCPGQ=
X-Gm-Gg: AYBFou0vMCSfJOWtGEw370ZObfQeY1PKKytGo56ayv007kqMiNjpCdlIKBo24SJy5WE
	lmhW8ESWtV2wVJxXT0YFKVuBc2GvEV+RPstGRkxgtncVrPK3uVXWtEsO+amb4TIhmvlX0paYgU/
	ZjPHZU88CofvRG/MImQ8Og5BqWiOePtMBgN0+vZO0JoxOSVm+bF6odE37YJMefuFocjG5HiVyah
	JTZmW3J89cZAqs01QQ9uCmAnnvhQLhmoyr7vrXysqHLrP8QFvU3KQ/GCFFglhwRgZhy/pDB75U+
	AdGG0cZ8/tUsq3XqgJAUNUBgL3Hd4pC0tXRuWbFk3nIYxzVMRPvTO78dqNjPSg3OU3UJ9qPDipu
	3IP6ITFV0c1+UGQ==
X-Received: by 2002:a05:620a:6f01:b0:937:65d:d89e with SMTP id af79cd13be357-93a297e8fefmr202428385a.3.1789371687199;
        Mon, 14 Sep 2026 00:41:27 -0700 (PDT)
X-Received: by 2002:a05:620a:6f01:b0:937:65d:d89e with SMTP id af79cd13be357-93a297e8fefmr202423585a.3.1789371686637;
        Mon, 14 Sep 2026 00:41:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm26403471f8f.37.2026.09.14.00.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:41:25 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:41:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 21/31] arm64: dts: qcom: lemans: Add domain idle state
 names
Message-ID: <gpfab6uc7gp2nxp73d26zd5iuewtxwoahmjv5dny7xrw2erblj@dpwmpdepgcyp>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-21-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-21-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: tkHBHdPyQCLUDgmqcddPc2jiehLPlV53
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7a527 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VzlDMD57B-Cyvd2ajsMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX/oSf94RMvDy1
 xHgoYhq4LAk5O+uF6RxhYF7MtyksS9loQeeJFnmSB4z1MwsJPvLoZhyHftaSYNs0RqEl087LFHo
 JlAdMvS/72EogkSqjwUZbLeZc1XEQ0w=
X-Proofpoint-ORIG-GUID: tkHBHdPyQCLUDgmqcddPc2jiehLPlV53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX0/EaDN63cziu
 +Yz38C6ir0jEj45bQ4QSY7pPSE8VP7PO8cRQeJTrOhCYey4KlRILomX1QFFGtSSL5Ed4vmsbRYI
 8JuI28nN8Ke8Zmob2lAY1xbC0jp84P6biJAi30HVE/Ngt+qizkUMFlg72C/3LES05wGqk8b0l/q
 ep55qgmy3wUqimcET7iDNdPhs36lF0UPuhZes+jdxVvZ9+AvSDr1DcsqX37mnZW+3n/1boPsRhE
 RjXJiZA1AXoLne8VCTxqK3S+V/UitAV4S3y/zAM5i+2qm02Zrtavirs34NthNLfNsnHZs7LwiB7
 lRFuT7uPD2pb0OCJ3ZRW+CUANrLr5/dPPZN8sHhKLpdL/wXhJWue7UF3B6S4zbdKIarrXPxyWpF
 TGUSYeZ9Iq5uqPWigmzzlsFi6i6O0VNpFjWVc8JseMcKqihuhVVPv8fQbDWYXNUoxU53Me4dUOA
 cBkqesbaK7l45rgYlQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:53, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle states so low power
> modes are described consistently and their names are printed in pmdomain
> debugfs.
> 
> While at it, update the CPU idle state name to match the low power mode
> it describes.
> 
> Use a big CPU idle state label for the shared CPU idle state, since all
> eight CPUs use it.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
