Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100203;
	b=re0l96o5eRKu4TeDYkht/djlYiQx6QRTDdRH5MunwpoW6hNnCtsv6pegI/5lfby5qYFQ
	 kXvAm20HcS+9uNJNKYOZ4Zn0/oti5SIBEzvPQZ7wt+M4QUs+rDftdKyQehwdxVPEajv/U
	 /8BqrNd29piSIk7IPy8R36PShby20ZUIZe6O3xaU0uXZE2Ysl7NNR2+nhqKPNIoCRuDns
	 wckWPeK5r7TEmAUPPKUqLMMA2W4+0bsv75B6IvqzVXPfLcj4Qgmvqsfz6PPZ6Xj8swI+J
	 4cHqNsaqfWSUkUSqRvhLqi+PitbQNIdL85lz0VUhIJofIEZsfCQG2Wfo7D8uwBviLtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LCLGT3dGFbYN1moOX5comzCHld4bgy4ncy8r17Egy90=;
	b=TXXUR5GeKnav5BpuBIvZ/Raxu7bNv11gSSgkaP8Ao9um5b7m2jQWZyVl/XsxhZgDHRBd
	 VGWlR5fS70Z5+7R6SYGcdJ5s8pYmb50SS/r4dsMBl+bmj1q3DkaZInNApLV0CX6Fs2sGo
	 52TSpHz9W9yjeTAlNNRdejLJ1fQDXvmm1f2Yz0ENl/TTvxSuwGVfEi0KLWNW2aaKLieUs
	 pSLAcS1tAO8mOqv8vBLPUVNeYICDsfBQHhuLM36KLj4meIIRwe2rzZeySgkMbToFZADbw
	 sXmvBkzhWotsaFDsfl97CUTwYj00A3jBcbxzAyUmXI409cl7B5DPdSCRYQa+5RbS+4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0SkzBCp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKM+lQbB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A033D606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A033D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0SkzBCp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKM+lQbB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeApW2524940
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LCLGT3dGFbYN1moOX5comzCH
	ld4bgy4ncy8r17Egy90=; b=D0SkzBCpnj/p7gIAvgZJWNa4gx96i7m/IaIl34+6
	nDvIVb8O3g28rqcitQCqrjNmvK59YLW3XT+Ivs5gdufNBdyPjIY5MabwR0Aq6PD6
	holb2bkwxif4Dd9qfkphphkYORji9BV0SqQtgsHLXMWe4Phrva4ojg/8F3ID5ix/
	cBm/7O3asPnPiSK8qlzi8ieX40a8E3hbbePq2dmSqKipyetD626oUAQVZlkDSSqh
	JHTwN/1R5LsSS+KViD//rA4rNxhY2QkuUlVlPiysTD23Ht8X5nGRuXJMXvV684aR
	LsM0yBjh5rQvV8LJCMTky6aUAwMuFiLr07/1CARLgyfXww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20tfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:23:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f13c143c8so741558185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100201; x=1793705001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LCLGT3dGFbYN1moOX5comzCHld4bgy4ncy8r17Egy90=;
        b=JKM+lQbBCMimTyITmAUUODC+CuPTHnQv4ze7SP1UbEt0dzJHp6UquHwCaxDeAuI8TE
         VMiIxphUvpTsbfQBXrh4I+xFpKwxgOl4ZniJ4hYQt6AaTqijDIsp142mjbVtwZSYTnEP
         AZyDtDg5Z4YWuhpbnGpxB5okhnoVqvUs/DlQhL8iD1qmJZ+ka5VoJzOUQ1eNEA4b5SMK
         t3sfownP24/dID9mOn73avgDWSsKhMS3aJATmb1vycdO5QCC4/ZMwK29b/BlgOmCbKas
         lmnOdbR1O4rUJsbOSedQSRlnn+0upLOHMzl1tqV8A6tL1+lcfqH/4/6xLGqN5KSuPHX3
         SSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100201; x=1793705001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCLGT3dGFbYN1moOX5comzCHld4bgy4ncy8r17Egy90=;
        b=hMtd1GOU6xghBi9xS7ylzghrdd8RPQpiBMCZcD2LrHzb0Fgyf5ZY8zH1ZPBbYUD1XG
         /rF0fxUXampwM+Uq6VOPrprwJRFoWgjITxQUVOGHZN9+D5jmiDIAiJ1uyUPl+q3BUqE1
         sBYGwajB5M9FWZJvuKqm1YUMKAH6upuscKiEDrT7OLnFVOg/muwz92/ALrxCl0Hxd8Tp
         LdzCNLU75vH/+D7w1GWXFTIwvs0G463kIjW7h3PZZzxRXPP2ev3bl/PkCAfbCPcyTSXS
         r+tx+VR3mIOuXQq09EGOH8+Abve0LX42vcEpEXAyh4IT0tT9XhTFjUnxA4+DCz2Oq83e
         Cz8g==
X-Forwarded-Encrypted: i=1; AKwUvByS5aQR0YBr2nDdVD4mA9rsmv5ZbsJnIlIkOfy+JfZA4EVoAWR7zThhG3ml7USdhbsh2/gFRRhd8PeuSiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt81vYkuR0YvjYxyVkIFPJqmU/cpFlqgLdGhNpbohl0gs4OwU3
	wg07R0efwKau6aPRYOfjnLabDqDl0EljvJ96zFrdQ0HZncna/U7CxkwxxT9UvDA5xbSz9//TVze
	tMmh6XQ6/K2Z5O7a3KL8YYZCVSMTI7L/Sg0UBmD2Rm2JxGKww/AgQKcn4BtMsf+1CR0E=
X-Gm-Gg: AYBFou0/F1XmL/BEZOraM1t/2WVx/KtUZ4B+DXZoPQaboeMWM+lVe+xQoowsVsOWn5D
	fRDjG3hiqWMrdet3SYrHYwS9m8xS3KH0itka79XaNWS3p6ADEQ/8e/+DOrF8f42XVKv2RPBIpD1
	NKCHPbdxeadI45sqKrDWM5k7VhuBdGkdyiAM1JeJWunWK0Jm21qyfZuweXYVorSNJS9f7k7jgxP
	A4k8m+K5VxZKDsVgxUGpk/NFwUtrfWV41XsGxnYlreMNktQ3d8jb6qomX0kO7kBgAXW5a4wc8KM
	lD4M/tM6baqY0n848XT8EgVQmiaJQ1q8xeP1X7V3bCcUIP5oyJMnL2lUJrUr5Vt/DKU6uucaunE
	MDc1wDzdFd7xUul12SnkHQalp+wpIlN+1KddeiIPuLXpE+Y39HektabpWBRjg8ku5wA==
X-Received: by 2002:a05:620a:198b:b0:914:afc1:c66d with SMTP id af79cd13be357-940ef7b5363mr1437220585a.11.1793100200675;
        Tue, 27 Oct 2026 04:23:20 -0700 (PDT)
X-Received: by 2002:a05:620a:198b:b0:914:afc1:c66d with SMTP id af79cd13be357-940ef7b5363mr1437216385a.11.1793100200094;
        Tue, 27 Oct 2026 04:23:20 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm175048735e9.0.2026.10.27.04.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:23:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:23:16 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
Message-ID: <xzlcs4jdxvndta2lmbnofb4dvekkbea3gaodqxjomn6o7ibjif@lakwxrxx2is7>
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-4-robimarko@gmail.com>
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
In-Reply-To: <20261026120920.1667982-4-robimarko@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX9AqC/GFnOlZT
 gdLA53wxXsG9HJGQ8Er5V07/mKdQRctNJHwxLMmqvvk0lmIo1OJQAbV/mylDRjoAo25Mfhd73q7
 OJwwYKn/F5+aO0Gq3EXAGBAsuOJehec3R9iHpN+pM3TdF96wl+4sgA8375PJIggr7sc2IX4ZrG4
 xz2HBxSuejQcux7YDh2HmN1y6LKMfwz+V0k4Pr2tZmgwq8x8TBv/VdUKh/rDsSEjech/zhYyikF
 204ldOV+ROAE6ZFcgKHHteHG33Y4C0BhqLJ6Ryu9rhsb+H5Dw2Vob3PxY9QrTQfm9D3FLLXJSye
 o4S7Qb91TBhToc6QgwzE+13bJtL4DXym/NMfU7x2vMq8L+pElIR4X0blGv0YUHabwDHjMVAIJ6k
 ZBvNpk/m7E/gkW1yLF6DbuGsnRIdgNgUQpFqZ7XQow6macPu1UiHAkcXWYHV3YvxHTk7dEPohQK
 nZBttgtQ6LzmNfzpsoQ==
X-Proofpoint-GUID: FHij58k8CEGgsmlrSWyOgoNldTKKGVho
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX3pwzucfTuj5M
 pW+8UF+4urv5Ll8QUyPn5CJo5C219ynTrmr0dGUaj8B+bbbkGVw86T2i0CC3afkVdSTLr6D1a3Y
 WypNAcJixD9/boX4HlzjTa7KXZ2PH2Q=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae089a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=w-uRcYzalQcvdjeGYpgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: FHij58k8CEGgsmlrSWyOgoNldTKKGVho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 26-10-26 13:08:15, Robert Marko wrote:
> Add the CMN PLL node, it will be used to feed the required fixed clocks
> to networking subsystem.
> 
> CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
