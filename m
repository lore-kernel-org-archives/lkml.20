Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420866;
	b=WjJmRnzUAEwTX07difLpRAWwiSebLYcHqpgv/1zXapk0S6xb5IMzIQOwk6t/8Q8uysmO
	 VwwqwoAPZ0mekYSGM5QeJOKQ3I/+ID4zGrXMkLBoI5OKhknoDwvNOS0ho5bkytDhOvaWS
	 IkntGuVBtybw4tCCAf5ewCGtKC/3mfuKJllus9g8sbK/cR8QKlZRH7Q/ctcN1qwONSMTg
	 w6ztyz4xDvcg6DPz/fj7wyzwZN2IK72i1Fh6bn4te7aL7N6CPDCvda/FfgQnZabaAWW4C
	 7upyL7tZIv1zryzhuGITqNe49PBmaK69nl1BsCgEXIIVzAPD5CCLfyoqxfEUACdY1Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EVDD0ZIf0hmd9TQw5ueEix5rvkoEax8Jzcz8T9iUU8o=;
	b=2jMT1VIUjuXsgg62zNJmJD9BOKRYUkJwdybyBDbpDQy8KQag/vKE77av2M7/15vM8QbA
	 o1x+YA5Rp8De0ltZLPODtzll5PHQwgFV/v6H5QiqaP4ZN9kptI2ejM3107k4SoJ8W+gqn
	 BR4pP5DqEGT0bVFrmKM6+DC+rEiXvBRvlqKdVrQPNPovORTvPvXVYlmkdynyOkZwrYDrE
	 jTiaHSX3tklQ9kwopgdnSrJkCsxL6mpPl2sLEXHx0hHqomzM9TkBAFoEmMtR8i67MZ62b
	 Rfh1RBHs0oaCsrrfgL+IIKd5kCrQEkKUUXDObKcfivvKJv5I6FjN/vecyBsOUDknTAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuONsJl1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHLpRWXg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C126606D720
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C126606D720
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuONsJl1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHLpRWXg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtFnn2498822
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EVDD0ZIf0hmd9TQw5ueEix5r
	vkoEax8Jzcz8T9iUU8o=; b=NuONsJl14mEotLSRpoxfRhUuboX5vi8srBBzXDdz
	n26rpdrbVtVMOGXsT4z7KXPpMSu4bvOmar6YXOj/HAnpI9UumXpWDjlX9gy/CIGs
	qw0lgkC0KCTfsI4n1PsoxSEuPXjaZT01c4ecsmjM8kXPyEBR4t41ECPZ8rmlFNgN
	W4IRTefM3QCwYD3jzXhCanx14hrAePIZLqO1vBsz5kdsBex9bXEAtC7osJojjaLJ
	QUsX0PmNR9ashmm++NT7CSGGyFmOWGi4vssF/Nr7y5RgSOd+uRULSaWwQivpC8kn
	I573ti4CU+RX5egjnmUJEqvA6Wds/iJO2qfVzM2DdjIZeA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawkg2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:14:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94607500fb0so568598085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420863; x=1795025663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVDD0ZIf0hmd9TQw5ueEix5rvkoEax8Jzcz8T9iUU8o=;
        b=jHLpRWXgKJbBr0KI40phKI3MHFfnG8u9YbIoQ5VHrek5V/k54VZJsaziDl/3czMIC+
         BPNWyWC504TwpMi86dRADRWMwAqps3lrb6aWvM2T5jFOjle4Cn79Xk+c71puhvtsDadN
         wy9j8LJ7fCIfCMJhd41fOiaN12NjwJ6ScXWSdv/4m/Gm8Bzi2xJbtpQfrrm67wwvMz/h
         JY4w5g89bAZX3lo45gQJynExe6YUKCVxSHfTYs3zepQa+U4hz8kfX9eBl/LemX30//Ra
         KYNkEHqsVCTuTDe76snTNLJtAxlf2tyySDd9PDHRzgvpD0mBPpC8yc6nMSCiR+IL8REs
         hl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420863; x=1795025663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVDD0ZIf0hmd9TQw5ueEix5rvkoEax8Jzcz8T9iUU8o=;
        b=zAUrZ+wLsmhvfIBMwgiYBiNBQ6Y4BMD7d2dLWrbelMrMzofw6D4Z5o4Hmx4vDdff+E
         8y7+waEbhp4L/FlRtzQTqIO8RtwyYqZZxr/0rWVt6LSWsZ1FTR7eUcfEehRJdD5Tlq4K
         j3zM64LrEkN87ytxE1uOIkd8+V34omxrcIskarkw/a5TTZm/q2h60R2bP3jWELSQt42S
         XEhp/WgClBLymu3XMJnCdEi4dBXe90sM88t/BDJOLZVrBUmXIblDUy0pL/HRHwGTE60R
         3wDEQKuo0NKI4es0lDi4+BF5TbiqAQvDb6pjG37vj/gPGZiG9IOgrQtiWIxRFYe2ErnZ
         xlbg==
X-Forwarded-Encrypted: i=1; AL+hErHuh+gX0yWI3v8xrV+4rCr/djx82Kok2sauqAH/9tqJ6FmF0nyTSBOLNREJRrN0wXiQuuUyl5PMZn6zyW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MdXrNEYSSb+1P39VvW4XzWjJcSJ8x/US3MRk8vgyZBWVstiuC
	quCXveXXzSwnhDMynxzF1+5I5l2vqgZEBh/ny9v2Ir/HT1wPr3x0d5jtxH8WBneZV2ZvaDOINr8
	NzvkwfLccIK4/W1TUyTqY+8qG5dacvicMcRVRJH3jvCYRvM0xeWUWr21mU/GD8yf+oyw=
X-Gm-Gg: AYBFou1XyM18nUxYD4Pc1hBuZhJtjIr/YX0EHm1Uu+IZsamdeaKL5JJYA+wMZvro/PO
	6B+cFgeHy03gn4YnMpvda012xCgelQaDEllYce9JXnBqRn/h/FXsEuaZlMFKmQTnaNAhmKP2o+4
	1lW9tZpC4J0oEV7u53XboEUQqOJALE0xO6ZBv2/+t6KLJhS55WmCdTSYsWkEO/cycPKaiT4gZZ2
	PuWdZDpCPrt8zpAGJE7UFsFs4FHg+2k0jB7k0imiUrxvg3MHGp+pIjMEEnNSGYAflpcgu3ybrkF
	lrD/0G49DdIYpGG8OKzsP+y1514IpugjvwWWNdYF/nAVuQv8vjcZtQ935QmKwQLre1cW9RNjl4Q
	L7TzbFhWt5nlj+RVRIba3IIkGEzvkfKC1JJbInSvS4PSIRSTNJfUF/EEBp51mSEqXrcA/qsudDQ
	vImHYrzcU91GbFiMArCfTFm+nMhe1iYobrHSMyUHcbDRaaJ2/LeplNxzCwtIS6pg==
X-Received: by 2002:a05:620a:6cc1:b0:93f:334e:df21 with SMTP id af79cd13be357-947b007b8c2mr552405585a.62.1794420863183;
        Wed, 11 Nov 2026 10:14:23 -0800 (PST)
X-Received: by 2002:a05:620a:6cc1:b0:93f:334e:df21 with SMTP id af79cd13be357-947b007b8c2mr552371285a.62.1794420860004;
        Wed, 11 Nov 2026 10:14:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae115a2e05sm6552871fa.19.2026.11.11.10.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:14:19 -0800 (PST)
Date: Wed, 11 Nov 2026 20:14:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
Message-ID: <dkplnfllwn2zlx36yh43lynz6qwcnzp4af7l5d6yph32shcy7g@cup3aqkgevw4>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
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
In-Reply-To: <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX/icsxeqxrrNH
 t4ADpsSJu4OTMAXE/pzDKewogJcunAPI3QCHJNLoms3HGJNJUY0cdFRkunfW0d28+DID3FnNbXn
 JRjtTFvWmlavT53LTVJ8YGnj9cymZlo=
X-Proofpoint-ORIG-GUID: twSM_RFbDiXpnSgxnI3J7j_LodJCCi4g
X-Proofpoint-GUID: twSM_RFbDiXpnSgxnI3J7j_LodJCCi4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX8yZuVq4BOagm
 yZaNw1R1kysobOcXuwMLowetN+vpjfdW+7erNvjngl7YAq61kyW9B3CCgugv0ovFFvvd4TKJEkt
 3HFEeSMv97SEe4ZM1If1lW7R4u6y+bj3JQUsS+4iFGyF7AqLpPGaVUcxH0pZpTHcIy+Jf5cF7c0
 aLH2FOr4Dfh72g22kWXcn6CmbERFkJTMPHhyir5QzAQGfc5e2UqGoQD0RVG3beZSA5sUTSrS0A7
 9Uh+oVpKMDVFmg1Hm2kK37N8HlliKStejVStzQNsf+Q1giDeipkW84EYAuKU4H7G2l1GpmDdNoO
 AJDjHFG8teukjkIdDPv7P2cpQwc7HBkFSZm3eLJNJ8LPJ3P2TEXXzdyQ5SmVbeLy+OjfIEKLxzN
 z7NYs4hKWqoZBJBrJVOBtDaZhV80Sa3qVw+bnr9/aeZUIPlZg0zwjEhoLosQ7db52LDJDoFBDeW
 J5YK8a+MnJfI6/QZ2aw==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af4b081 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=FelehbBqFq-cYOsUXMkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Wed, Nov 11, 2026 at 06:45:01PM +0100, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
