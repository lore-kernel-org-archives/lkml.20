Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763614;
	b=qugBVxU/z/bn6X2v20ADTKgLW7XPqkesYZYUx0V5K8z5kFSfflZhGV3oTkA8wQPW3jhF
	 a0I6h78EGV9aHP3GOMzBb34apUdLrL3FbAPJ9vQwjaC8HpnmJbJiSmlbjN5ZWzwbG+oxT
	 fUE34h7uQ0w7G7x40f3DDOw4FhizIchTr0Jy0qgcw3/B8c3ey12/OJB1Ldx4XBL4iu1uV
	 mbgazbV7Hf4E0pXUPxmwhIYsVBNwI1+cIRtAhvUFwTB6zFWXDDP7eVsaZDwkXsngx5iKR
	 QT9dBqIFJ5QkRGXlmV/2tnsTOG2My30g7H1zi1Aw0GRM3JL4qeC/uMP/oqBtq4wdilg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YF52oMGRHzOis719Z3U08BM5RBvVjbos10Dfo+I2YNc=;
	b=wiT7VFslQ9MgjVGpq+UuC73pj4Pig9VLynrj6ii14r3zCd4E4boNNv9kAwAEhgh90REb
	 iKqZ9bumb+3dSR50Avof2ei+ulOYffUgG18mP5EH0jtwrvw/pUgyWHOB53TyA5aQvNpVa
	 kXYAyydmXaHGFy6W6KCmWN5nl/XVVVhQIGoAt1qbJ+5pdQMVvommxGw7UxA0zyC/IJRTV
	 vGPc2LeuK1i1fH8kWQBQEC4j4ol5ijnCMsTvQ0RQc3LQg06onyfUl3cCcvMfiudbvlDrb
	 3DUajhEHv8cE+2WMcYGkWx1TP+ortAORc8X2WWNOY9fbP1BwgXYy3Vt1S3PZks58/Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KUygXPWh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BBA8Es8m;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC8E606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC8E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KUygXPWh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BBA8Es8m
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RRKp2786526
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 03:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YF52oMGRHzOis719Z3U08BM5
	RBvVjbos10Dfo+I2YNc=; b=KUygXPWhK6QnV5ZwcUPETjrzTSjHwxoMXP9Kdqte
	Mlmr0ySPdmLTdGPAoyqtwWSI7MwlU44AxV3oLIFMipUhxjJd8sKQ3SKyZYg8dZTR
	i4gTkVJs4zrEYEnXf1kKTrKXGDnaBV+0h7LeobW3KvTkoMNKi+oBzLcVpA+xcYAA
	gerZy/mtTYSr8tARK/0YlE1HzLe3aTmKG8Nqv+oABa/cGkh0ObAASpvkE2alADOU
	8gAG7W5zAQI+MjF9uYg5nrokWN7gS2ftNz/Dj4Bx2ciXtB3OK08/yqt6mtBXoveM
	E4CmpDBCfUjVd6QZHb0wu5j923k/HFPxYwcqNgD3kiuukg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd3agp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:40:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so320378eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793763613; x=1794368413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YF52oMGRHzOis719Z3U08BM5RBvVjbos10Dfo+I2YNc=;
        b=BBA8Es8m7sI6k1d35cBI2oSsOiqWjl3i75Q+0PzhpL+X2v13m8e/vFIonGzqxPO/NY
         ZXsddf3ANB/m+o0nRhOE5RnDmd/Gvdc7C1iqxJVimhjRu4KfFZeH+a/LxEYgpMURJ6Uz
         TR1abKaTVbqDqGYx+X4lfH80fCWyAUQWKnSpeTluM/cSXX3EmBdi3yP0Kwfdd+KreNUv
         ZzBykGO7DyrnZYgfV46ZD7xdld/gxG1sDbfnMw8YU/CQQQ9UYL4PcaXENqSKGhiDLEvR
         NPbF38aHQ7A3c4LP2XLZo9lE2wXWDR8HiLcoHV9/DEX/dEW4qEtYg7aN3DmFUjMU8XDl
         5ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763613; x=1794368413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YF52oMGRHzOis719Z3U08BM5RBvVjbos10Dfo+I2YNc=;
        b=jWz1onTHLWlTBdSVoLHtzCxT/2iRNATVp3ih8ReZ5yxrOmNy9MWgJzyImydw4M3IXF
         5rdZCb9pB3J2T4b119S2oy/MfG5/zUfGlquINQIYWpYnuYK2Uxvb9y+slafj7OKo0FCI
         4ekAy6QHxuMHQ18b6/A7u41n+Ofhg9JBRXk62dxwFY7ysCAaLzdxj5WC0eCEQmdQfMDD
         vGoT2tXwEDO+57c+sxZTsLYBHfznzRIbid9IwHfSpbbjVFEg3C27eixLel65Gl/pD7rQ
         wVTovBgiwWBoguauA5hA6vegaCEOwFgVLop5Q7t/RU6gED52T0wXHiNPFYXHfSSM2bR3
         f7Tw==
X-Forwarded-Encrypted: i=1; AKwUvByVOmIzObHKMk5ZgRdKChYp3aRZQ716rKtj0ik70GA3hSKGdUKaL/MRgdAN2n6j29kpmt6EttJqBtSqAG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YW3y0/bougT7cs+V+sDIA8+o0ihuQLf95hTLXcUTA4yoVt0qW
	3HWBG7xYnJTqGWpZvCAjg+XZI8J4bRsbx9TbYAd0rKXsJoEeGwjESvcdXUee/Zu2LZ5AvgHSRat
	LnCYNcOob6+mPn45LzkdustUJvfgYzw6fyfa24tdX8VTjN+XbhGcLju0PIsc88/6W3HE=
X-Gm-Gg: AYBFou2lCiN85J29/rUdyWqK3Y2YhLVIn7ox0KxTVGbY6t7Tu5byPXIsme9tY9tNxSx
	bZJVcVjrXdfoG/KRy1HPDr0cB0i9PyliTNLJKZeUkXI4PHKnaWf0pzTPhMfYu2/nUZQEM4PptzP
	4HPBBje3wmGigtwmePca9pYDIiwxro5l90os2xNsCZoDlN6sGxw9jvog03/xHuNFwiMo8Ymyc7/
	dp9K7MaOiMZKDwENnCqcaxMG/I/dFnfaRNNbckFMYtsQoZbfwT6Sjzp6t+rI/RXL6FUVbWo0bZW
	Avru5/yfYIllegjmBeOm3D+NosTDD8VSUdBHAJAqQfc1r7Vr2nbz9eIWEvIyY2rJfxFumtdPoNf
	XxLnv0S3BlQq0b5Jcu6h+J5ZbMkaiCFTDZDdN5Sj9Fq+h7RCURRH0XN+JQGrDboONMP1lnLrpVD
	tx2y05JSZHXm6Izw==
X-Received: by 2002:a05:693c:638e:20b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36a423624c8mr22041216eec.6.1793763612408;
        Tue, 03 Nov 2026 19:40:12 -0800 (PST)
X-Received: by 2002:a05:693c:638e:20b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36a423624c8mr22041190eec.6.1793763611882;
        Tue, 03 Nov 2026 19:40:11 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a5621sm3160585eec.6.2026.11.03.19.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:11 -0800 (PST)
Date: Wed, 4 Nov 2026 11:40:05 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: qcom: audioreach: support multichannel PCM
 formats
Message-ID: <auqpFdkMkevMrAcy@QCOM-aGQu4IUr3Y>
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
 <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
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
In-Reply-To: <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aeaa91d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yYJQ81hfqoN3XqicPgYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ZTeNXu2Q-8bpnpmMgM6jhQdXMK4HYTrz
X-Proofpoint-ORIG-GUID: ZTeNXu2Q-8bpnpmMgM6jhQdXMK4HYTrz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxNCBTYWx0ZWRfXxzKg1Kja8CX6
 HadkaN3CFORHbHDvnysdIAtPR4p+70+QGOkazKKSisjwKVwBzsenBW9m4zacI1TjcH8HfDE1eSe
 P1Il8Dc2miiwjLNID5Xb1cmNR3Ppjo8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxNCBTYWx0ZWRfX1Y8cAHD6aa9v
 eUMQmxjWbUcQccvbIwrkLqa8uyuA8nP11v6MKpd/7QOs0Ayp1TuIGbu/PqZOI8j65MK6M+6Lgi5
 atVABQPij4huSzIqC6thWtag/Ql2m73Bkktgs9X2JEgoBcM223bG2LK5Ubgc5Pelv5WLyJgfQim
 i953A/KBY1owxta3wFDPA9WY7o9UvofWatXGRSCJRCnWgvj6s8xyVo4S1vu1YezTR5Se9JKqepd
 3aG2Xicfos/e+dJwIpaWBGJkCuKFWBg2WfwAweqCMrW+gJWJJ8MSh3XulLkRagYr2ara/IgLLtr
 xL0pXyc54M+k+LxR02E7rNTjg9s5oVzuXvyEneB9SYZDwYnRqVv2Cbod7Px04rVTS9dyq3uem7g
 B+yuwg5kBzrsoykad9G9sjLGj58WkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040014

On Wed, Oct 28, 2026 at 10:47:20AM +0800, Zhangfei Gao wrote:
> AudioReach currently rejects PCM streams with more than four channels in
> the PCM and shared-memory media format paths.
> 
> This prevents TDM links that expose more channels, such as the 6-channel
> playback path used on SA8797P Ride, from being configured.
> 
> Reuse q6dsp_map_channels() to support multichannel PCM formats and use
> the common PCM channel limit definition.
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

On Nord Ride board:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
