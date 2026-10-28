Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201895;
	b=f0m9SJeLFDlQ7LjtJlJXvFFqBa3Mv3F7ZYEhpC6k+Dt7Q2JygOPxY+pay+kymuirRM3t
	 Pi2ofeuu+xTUib9nhTJ1LC6GFWTqut7VDgC7uVuF3qT+f/Z/8MkfYTbdADVTQXhgq7I5n
	 X0+Sh6Z8dCUQ8HoiYNKO6IcFHF6ZY5ubgsHijJsYj55w4eOfPyJdovnAW/5mv0UoDlhFD
	 kKWYT9wj/xGTtNFipC0qH2sgPqYC0uZex1/hCTsDAQ7Wpr8ENbkx/qTi1mGL+xF3zJGZ3
	 5hPEO6TFXit2iPfMOswJ87UmTZiQ6DFUxu3Hx+Cx3X3aQ5uocgRc2W5hlTncpLatASg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+5H9oUNQEUrTL4nN+lCc37eHgcvSEzquzejy5qpdGCU=;
	b=4++SoOIjf7OKASQ7dQXFiulX+HfrcaIM1ThkS5maKZpNGJIGae3KnLzcqWpOAqg/lI58
	 ILECjgH0+iJM1nCC8klSc/aItFdjvQbDuxSMM5pgOu3/nWFCC4SBg87BufH4jQNkAXWGN
	 UOktqWsmeGQQ9zDoHhW8prM5CElBaJ3A7+FBQ681vouK0tF1OYiftxQWXr9cfJRtMR4KK
	 3DoB2DN6ZEdx2sEV20BK5Ja9Km9gchBNGIDlRlse1YU0Da6vHqMT6N7/zUSdiwXJihUuh
	 9+MURxL5j/aCqnqLJKgT30/JZCeITWvl3CUURS4/DAx5X8qjrv3ZF+DkkOJUtezzY4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxG9kptS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYsMWP8+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D14A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D14A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxG9kptS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYsMWP8+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA7s81471918
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+5H9oUNQEUrTL4nN+lCc37eH
	gcvSEzquzejy5qpdGCU=; b=WxG9kptSioLFMFNbB6LH41yKmTSwywiZW4lc/rct
	YUNddip+a2cyD7X3tUt6xdq6KUNTquTWiySu9km1HEcfKYarP/KAxzYhf/v9O0VI
	T0mPokBVtnG0wdDtQW8QS4sDUPBDaHEuR1hQn9rdQNRu9N3oByQ1EpPuo1cSaGTS
	rN5pO7XWhEjxQp7Yn7X3hBn3qmEzmzNfR7zRjiMJ4UB6A6uz+gW0j4/dqTV8Ibko
	BkSrQxBp/gXX9OKw0ML3usbUYOu6zA8j75Ay7Xk3Nd8p0jj30n3mgWtHgMvcqLkY
	p04cczn21Ai82PJdv/37FkxAVG4YBtXWhFY3XoW2vo5hKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehh7jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:38:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso416257685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201893; x=1793806693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5H9oUNQEUrTL4nN+lCc37eHgcvSEzquzejy5qpdGCU=;
        b=OYsMWP8+LqQ+XzYIic4TrbnKKxBSeFxP9AAQZ3pDCVSibbZoHYi84nIq0yeIC5poW2
         hAbMeCwvtKOH/440XU22duBuHHo5Hnt70AQB6k8r1HkpBm0bLjgszCUMdPqCx6LM/Gd5
         wl1uKN3xKe8WGQQVuJE6ZX9OlZvy0AzySQT/Ld3YdMt/d8xBPzu60mDyDgxW9SSx99XE
         SpBi6e+slL/LSUVkhF+HklgQtRrm9ZfNZ38ex9pPYZVSVTBKTdaBaiKkjSKjaxTNVz4Y
         nFNa8uhYx+KHRUcsvzprAhl026OKYGA6QSrJJK00B1Hf0DOwi8y466jP2hXyFHkDpQ9w
         XXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201893; x=1793806693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5H9oUNQEUrTL4nN+lCc37eHgcvSEzquzejy5qpdGCU=;
        b=KAbqdpGQ8ZXsPlGaLkpmBQoklbB2DjNDJOnnCbG3Pb5h7lvPDmHSNRsfYtMbtiCLL1
         ErLMobtLi6ZwQWso4qJQCIOOKO+W+Cvgwy7vrKeGEcA7UysK70nk5ddRkpJFYVRU6v70
         RfudHCm8LIH6/xLNu3de3q/ZclOwe6HksWx+X2yYCyRNADe431qeeWuL3Tl0H2VzdAoo
         WoRkTwbBZqMn1OVV6J7wW21qshXQc1Db8/UXng7X1YNRHyhaK74NgwiF5fBzgcXx1XoZ
         tbYyWLCX5e/lrYMcguBbtOL8NUeM0EcM2xoI2mZ/1jSumBZOYZ4ZRJP5XNSeKxFXE13i
         WSnw==
X-Forwarded-Encrypted: i=1; AKwUvByLaZFHTD+wP7nj9rAvzi1ZCnOC9d4rH5+izve4NAzLIdGOuXFnHn/gdVgNC3adpKT6VE57VXbIPvNidfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe9pfbagJPw5gqrgYlbo91rYT9rWoNkOv6t/ohEVR7lPWXFCRZ
	kcTR+5SLisPTJ9tQD9FLXmji7FZaFz/CjEJxZnNhcX5F+3RWoggvaKbmlVW9Z1u9u0XYn5LTKeZ
	O9LThBC90lDnveJg1zmuDiPJKbE7X+8hioNYU5eEnqKu37diJKhHuwA/u6QHue1dFC5E=
X-Gm-Gg: AYBFou3Qy5wa5FDPNGA2wnHxAUczrrruiV2JcFCAqmo9CT2N9eW6/NuGXjpiSFFlfl2
	/3rWK1Bb5rNJJjGQoIwctG+Nggwc2MnEIpkhnlfN/rIZJpDtJJ3zGHJXDVQ4tM7Pna0WXij/esO
	LUx33bkvesOqFRYql9S5rCPcaZEIaSYKExCyXIy1T+rv/FkKKuDmb+HNR/oAdWOkWLW8wgueKbQ
	HCgUWedUoKj2cRWy/WevDewmwfC12VaJxFyu67YnXVYqV5u2usU5ao+Gc5VbgrpjEx9ljy9+kH6
	mWyg7xu1oBmsEbM+Gbz0r5+e8IwrT2QY3wGHRKjxP9PZ8YgFhyFshSdZklXohbnJd9Vhny3lafv
	jQoRPFUXivyvBbvsKygTGxH3TldurroMO7UtKTtkKYUoo9RMZWgq1P9oWqFKx0wZ8hw==
X-Received: by 2002:a05:620a:1a24:b0:93f:231:9ff with SMTP id af79cd13be357-943f4bbcae4mr982322085a.27.1793201892885;
        Wed, 28 Oct 2026 08:38:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:93f:231:9ff with SMTP id af79cd13be357-943f4bbcae4mr982317585a.27.1793201892312;
        Wed, 28 Oct 2026 08:38:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm23540563f8f.40.2026.10.28.08.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:38:11 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:38:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-monza-som: Add ADC thermal
 channels
Message-ID: <quoe27hatyo4mgfvlxwpbzzo5r2eowt5mavnrb7kdkbxg75ea6@ubfvs2oxmz3x>
References: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
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
In-Reply-To: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX9BheH2x3OU6+
 32DVjI+cOrPqul5DiM3t/A+Urnb4/8jZ9uundVtg646534lwzNxC49ujqYeM/TjUY7lnq/liduy
 nOoGyljHvvHZdaG0EuVLX2XPS9dVEkHAE/RCU7F+lJhaxz63CbE9Lj+1nkfYXS5tdllXsd5F3rD
 CKBsQGswc3/jp76N4HlJLj7LC04BP39m3ndaIqTnCARamq4VhtMla5/ABAg9dmq3dqBX6gaLrdu
 TXFfG1dRv281p8dpjSB2Er64dHig0KOztOk5x+alOsbYVhKOtlDkeCUkPJNcF5Hu/6hSHh/EDLg
 TLdE550ds3THFxSxk0uLnnWTt1XonuvzFjN7n4RB5B7/rY7Xb6iUkh1fTI7VlT65bKlzYwkmXlz
 gJgcoMc7PpAskWPUCsCKGqIqglbPlGu0RCtjC4T58NPJbPGZVo09+d1ePtPUZWXIFBq0B+YUqbx
 5+A8CA6TH8RVufm20MA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae216e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=v5taVqJvphWDvZxw_xEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: HHGxg11mrugc8gCUQbPO_yecFyT7cfDm
X-Proofpoint-GUID: HHGxg11mrugc8gCUQbPO_yecFyT7cfDm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfXwGbAmjbyTuco
 Eq+aQWgvx+rx8ZjMg3F8IPTepAhEFlBvAD0T91SVplfwAqRVoaIk/OeoEb39AH6job50VS4EO8Y
 6kT0ur5wF5G4ow0FWV8ipKbk5tmKJc0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-28 15:17:18, Loic Poulain wrote:
> Add ADC5 GEN3 thermistor channels to pmm8620au_0 and pmm8650au_1 ADC
> nodes for thermal monitoring on the Monaco Monza SoM:
> 
> - pmm8620au_0: XO, UFS/eMMC, and SoC thermistors (AMUX1, AMUX5, AMUX6)
> - pmm8650au_1: SDRAM thermistor (AMUX6)
> 
> All channels use 100K pull-up.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
