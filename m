Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D42497392
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657974; cv=none; b=I/Y1BBmh09trbhprRdJhomW9afbAyZWcLBKBbDC+6ea7k+14KL+JrBg4yK0ve68BBDmm8PlAB0ZNMBlfx1xwEwofGRJDx77ZHd03P614juFm1AyjIzOjOZsLFzoqDgF+SjOasBHX8A6NawscnIe/XmGGv7i3glvLpkbMKq9kGss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657974; c=relaxed/simple;
	bh=SPc69jFFjRMj/dR/GiE/fnvPzv7uPyk/XhoC23aa3Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JB0amjF3SEKzIXpZwR3TFedri2AO5SSpXyMRmfnm7miMAsBgc7D5ciacXQQeeuNbul6D5KvifNyYESNvPCnFoEF7+PoM679HBUoR+EcRdoqFcIqM+KHrCG55C0bTT2faPAMPQ9ga7R0YQpOBaSilJ9HrYOjllix5hzTLnHIV0rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4jqkcwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hl/JRdnb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4jqkcwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hl/JRdnb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDkH1x1714776
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NDh7P9dtNVKF6HTzLbhB6G7p
	UWmFKx46sTTj1U4KSZc=; b=D4jqkcwn61SbG2mM0Oj1IAlXtBs60vWRXHfCnvrv
	umtanNrHpUhV+K3jno8y7HIZiEafeKDhWhyU43enNuOtv+nUA3/J7gZMzLuterYE
	g5MxFLixnxQUSSQr4MBvKoZF5NEGZuN5/K6QlSsYgPZ8UgQwpx7LPktrsAzwyYv/
	0RXAIq/ddCKOJnoXe7pfKn/kBcuSnDAqLxbpKQ2oPpJijI6OVC1Kppb7vRoY5Kpi
	Mj+Bc92Px14YpPU6KtBNUwT6LoyOj5CZeZCXGN+EvI92fARXj4JgPfAIPA38JHaz
	LcoyBqdcgAUxoCd3iRrk6LigLwbFZ4qcIFO/bxZXyChv0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w9uar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:12:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so182110485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657958; x=1790262758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDh7P9dtNVKF6HTzLbhB6G7pUWmFKx46sTTj1U4KSZc=;
        b=hl/JRdnb8YmkLCqJ5oEplD/K3PLPY7ZzscqJaxGtDyA5QzunjVA7u2apJ0I376alRd
         NNIGrq2zfSOQ8WyOtthpvohmcy77H0cZfT4REpkYxfFBaUD6utFAUyiZ3skxlXWib40r
         C5PwAySSGSgXZ7omWsqJdCQj6FbmChMwO+k+cpKduXokTKOtWHMDHLGRJMqMv3jWuCLQ
         ELSRsnCeTkzVXBoxoow+A2p9RIyVamw6nNmGpHBooa7pRcDXHa6JvnmQY0NqKi4ZCgln
         PjMbXH6T++dYdkJxYhyNohZInIqLQ+l50Tju0pSUfKDp+SYMol+MZNme8Tg2u3y80b+f
         SMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657958; x=1790262758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDh7P9dtNVKF6HTzLbhB6G7pUWmFKx46sTTj1U4KSZc=;
        b=BMm6CN9r4dvX12caVbAuhs2N8Wgp7VvIUXqQmKF/25YlCiFaNhVGeiTvjMVgRqRyLq
         LJ5Z9yCw9VqAFaWDtwwbijNiqe8MkoS2+1cs8ovsH3CxH1mFOthNBFBL/ReDY6TNMKWV
         mhJ2/t0jJSRtgdA/IWnWyHlWJufB9o4si7cXF0D6DHQmsYn+04fL8qg9sj6Qt4w4iD9w
         tRwa8mmFZ2GUGmIHsD/Voy+niodWbKn/F3du/Mt48mHGWmqLnoUvsh/9P1GOBfkOHLoJ
         rTCEkKeoVe6qdKHMxS2Uul9TRCG+PXWh14F42fuDeeoOWVjuxqoRcC7FadhMGgOEluap
         +yCQ==
X-Forwarded-Encrypted: i=1; AKwUvByloHGUhcOHApiU8TaMU3R98zGJg4w+7fHd0hfHHTRJvI21tlD+MQhvgRFbM9SCOiZBoEIxW4Bx1nUEJp0=@vger.kernel.org
X-Gm-Message-State: AFuF++masscK0Y/T7/JiW+nfOG2EwCDg8eRmnxMw2jw4jnxmSIjSoSkJ
	mVqG/mskImEC3rdrt3sF2pqOJrtb9H3hn02aLiXyT9ggIIS2MlulnHS+f8ii9jYH4RYAGSQQo1M
	g5yFq90ShbWA55KHhcMgXN6J+/sxPsHveqbmFahqgNyjG01yL0McyNAQtExLmlF98p2Mz8d+Kp1
	I=
X-Gm-Gg: AYBFou2jezAd7ZE9E3nL2ApLWUiPAr+rPXTRJJvgDJWqQDZTYp+UBt/Rf2Qrzk33jyX
	oZQsCJqqV0YbZHzATUrEGlSwCM/7ZUo81FJ9mAq/k4OVoWOCd8+6Z3u3iFUufP4WoLWR+feLjcz
	ZGRFIW7Axj6EY7z8wCFavMbFy86oKglPeVDbiDr1GBuC9yotEQA7/OdMUpc3X+4QTvNpyT+OUmq
	jm/vpXAJNjTVvOIlffZxM26G7LvBZyeC7X3hy78Cr7q+WMSiMuCwumKt8LysIhX3iy0oRDgrvJa
	tzkb53A/2yVeLRKmGKwYTGL6uHDEL3tbyPbtHCJA+DxiYdENgtNHMYt4Tve3QRVrOJkdB8wIDEA
	m2DPTZbYx0nGsAA==
X-Received: by 2002:a05:620a:1789:b0:937:6f98:c68f with SMTP id af79cd13be357-93bc62405afmr515977985a.1.1789657957521;
        Thu, 17 Sep 2026 08:12:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1789:b0:937:6f98:c68f with SMTP id af79cd13be357-93bc62405afmr515971985a.1.1789657956678;
        Thu, 17 Sep 2026 08:12:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24774esm131474435e9.10.2026.09.17.08.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:12:35 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:12:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 04/15] arm64: dts: qcom: sar2130p: Move PCIe phy and
 GPIOs to root port node
Message-ID: <kfyihddprwum6q727hvpyzg636erz4cd4t5hn7ubqwr63ffl74@iaui2pgf7wae>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-4-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-4-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX1a0AWAHDn7A0
 6w7Atl+r70ETEn4owpcO/UUj9Xu1RvARwlniGq7VnvqiWaH2tRlKLGvzHsPQUgSadYSKzyphwlf
 WMqxOrbBmbif92oSCloxYarwMAss5sFNQQCYWBmLO30VCMwnfv5XglH0Om7DxDsat9yV0Xh7XPl
 /8EF5cQvkI0J6ixMZ8FySD6iUg/rsFw+Av/dyf1cO6VVPtSvit84u8uqJo6ooRanM9o+qJvNioT
 Y/bEAyklaDTICZCcZrPEr3HTjG+Ly8riVD46geEnJxd1yZALMsQ5O4fTJsSsGONzm+oQt8xAPO+
 7gpz4579rJgYWFM4ITqMyZ+/sxChJGhzf8Eb1uyb6VveqNTXHK9CdNaHrGjp+Jwf7kf+60UkMlc
 QNrds0AI51Tx5qC+YfVegNtmX5f1tT3xewRVw89MMo4zPpvbQ9xc9ctvnqLjXhN3rHvLYX1TzIC
 exhC24i20Pz1xCnj1EA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfXwaaz+UGnO9QA
 UgdxWSqPsrM0GGvzhuvpp/2Zt0zk8Ttw6T4Rvz5WqJs2zyPzlzClyyr53s30SAdJzlLPjQVqG/Y
 6xwVlbRagS4HHQcvj/X4UCN4cvQEFDA=
X-Proofpoint-GUID: -Xd5zQAtzP650QnBGQHMxcX1QTnforsM
X-Proofpoint-ORIG-GUID: -Xd5zQAtzP650QnBGQHMxcX1QTnforsM
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aac0366 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170214

On 26-09-17 17:55:18, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the &pcie0
> controller override to &pcieport0 in the board file, renaming
> perst-gpios to reset-gpios to match the binding used in the root
> port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
