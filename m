Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4B54AA1F6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366420; cv=none; b=pJYB/sZX9IT/cJa9d3lt06iX8jwOf9+8haNElI60e6EryRV4SOCzwNhaoN1ZcpFMs+4igXWcyRoARFNhdbYb9krgglb1KkQncNIV+vC0IALrgMHNx9V/CB9Xr6IGmjaXsG2bwFEludYBXkUuXmRwE89ep8FXP3jQdr9AVlyNZwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366420; c=relaxed/simple;
	bh=4V75VXPdJsV3etEtmOB92/leTElAobw81eFBDOD25Qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ih9EnoOFhneC4QV2bWDL+PVYcxFdeMPlMPXnPg3XWSbURxSvUfD6Xcw+mNfNqDKQzVF92xR64BLfsW9BdWqmq3XJIXEIefXV1w7MiNt4VCQp12Qx3vAK75boQMz56MT6Z5JeM1M8Ll8Ha3KcmjkixDAih4d8VjHoTd01wXgdc5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgsmkQRr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CixwYZLR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgsmkQRr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CixwYZLR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZYxS770198
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 16:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d8GmeZDaBEbzaZ8I2SDdKZrPLXHH/1Qk7o9QmMFbE1o=; b=DgsmkQRrhtcjid92
	Znhb87lnm8+WWhMHrKl4p0WyNyWqrewdrlmVza5UDPrH3MYl7DzjF0C5lZw/PaTl
	7uPGMMKDlh4SX7v7smfmyUSh5QKzh1vMweZWqXs96TeLjLkMTScAcpGCMWdxACeG
	wTE2fEdTBY+znffYJ9zbVlrpQifwrWgPgPjLhcf/xlw2SMnCoOPAfk2J6ZCsvpNO
	tStY44Kh7xJWgj6Ee+rMgVHoMBKusCib/w1SGWRASmLXsqkTxc1lpg5BzIPY+TGl
	znGPSYtEAWTCtaenIXJnlJ5vp3swrQrhKAkZE5H6ZeeIgCK62gjPvfUZZwnWIbz+
	DomOCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja0qtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:26:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494b1e35cso27930285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366417; x=1788971217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8GmeZDaBEbzaZ8I2SDdKZrPLXHH/1Qk7o9QmMFbE1o=;
        b=CixwYZLR9k6smMlHWjCX/ZevKjROHm5IN3GUmqU5xeWTkiPcKkBFQvfsq4nIVqfWdq
         771AZYmZopyf+D9ExsNCwDeJ174aQBxqQW0Z7xpVoe1xeoP52gXz3lstMlwp3bJX9oVx
         pM3wOXKH8T3BrN0B79ZhA4jyiS7Y2YAIUVadn4UkfMTegYL0sycqyYKEl3abBF6TXsl1
         tGEqdEb37xbPTeADROkccGDryB6AxbItn8g0qEl7H3j3O7msePmnRW7cekVXRy0ZfQKN
         /cHOApfZUbtC8Mu1iQfjAmJVXiYH2NdvJzrylu+ShIUjdtv6/fnFFH5nMik3MCyyuJ3B
         RJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366417; x=1788971217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8GmeZDaBEbzaZ8I2SDdKZrPLXHH/1Qk7o9QmMFbE1o=;
        b=eJ2xLFO80jn23iO7313d22DXYzgR9ml1Km1SsnCZpMw4dralcfsBGkLQM9Xfod8oSR
         rQEZ2zp5lH2hrQTO322izzvI1yyOC4u24SKgyKjj6n4ytJHZLkRmqaF8HtA9HgLne/S1
         iZWX/SLfiWMz1wx0SUTz8NRPalcNFKOKKsR7q9sllyAXLBgf5LI/7QZPQ+VsTO3xcsls
         rgqoUQXTndOjSFBpQLDa5GWRVZc6nKJq2vNI74M0KbohoHFSv+Kos4oEqkFRLLdC0lIQ
         YY13eLiCW6PJ92iq3LfDC3NOfZNtGqX1RGycRUYeu/h7I7VNAdXssmX7rlMFFWCVPTFe
         IrmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3Y0ReoI0DfB+qCeamUTrbR0DfgbaHKIt/uIZDcFYHH68XN6lz0qO8E8TisSSUtCrkIXO4Vp5Vt0GeMhc=@vger.kernel.org
X-Gm-Message-State: AFuF++lfTuJrRpaAcRzzq0ebKh9sC4Gc93S936F9/jjL4dC/m4fs53dr
	NixzafW7dypJ2Pr7GRuVWrGG0G94js8jfjBy2zriV0K713N1ZQ43OYS0pWDden8r329XirAc3tD
	QWqTB46Qz+iTqqZz10yhs51PRklWTYwSjbKSbVDFWOdaniFVLNDed4t+2Fm+lVYwxztI=
X-Gm-Gg: AR+sD121vBiKytkPpuJgiNCETPfHRVrbqgJlQQ+e8kWFjAp/uI0Fv/Fqnh6+JKVFcpd
	In6RnB4Qz/RBvtPjzKEbpbuBknRd12kRAQLGJ8SpFJsgRM/RX8jCedK4eKn+1wVgeN8J2i4w2Ng
	t5YkUFwaQbKQ5NitygLG0RWuBVPnh6DXCdu8vBK0rHMxfCMkz+D+2IX1zqABqMm35qlg2F+LS0C
	x+qBuQnKQvdWNVGezIG0fc09wLiFHVTsFjY3UoIzSNN+VbL24ydqjlepe09ZpdsH/lyt5yGKjFG
	ds730195A2wNLh/8yYvZPdOAzdK/OEZ9gUE1gxRAzRtTVTno4uHGbPz04xHABmLrZiXC6fFsGAj
	t8afzcz1enEt1WNT2BC2WhQ==
X-Received: by 2002:a05:620a:236:b0:939:6c5f:9a8e with SMTP id af79cd13be357-9396c5f9b56mr101499685a.0.1788366417449;
        Wed, 02 Sep 2026 09:26:57 -0700 (PDT)
X-Received: by 2002:a05:620a:236:b0:939:6c5f:9a8e with SMTP id af79cd13be357-9396c5f9b56mr101466285a.0.1788366412214;
        Wed, 02 Sep 2026 09:26:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc70fdsm163297566b.4.2026.09.02.09.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:26:51 -0700 (PDT)
Message-ID: <11ddf6dc-f943-4070-882a-f60733dc4f71@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:26:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support
 for eMMC via overlay
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
 <20260826112456.482982-4-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826112456.482982-4-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z-9Uvzatg8oxfKbQUf6yDPQmJZFXwX6i
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a984e52 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sfNJ4pVXpVnTwTOAvM0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX2wAFObBTW/W/
 wKEtUgticPmZbxOutPQadKOvWB45msoX2rQDCExLdtzk0E6g/Vea3B3ZlL/sVvHEX1rMdOqGEDh
 cT52noJi0dfCmDCtzd2kZbd2kphQbwg=
X-Proofpoint-ORIG-GUID: Z-9Uvzatg8oxfKbQUf6yDPQmJZFXwX6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX1dBFyhILDelD
 2Pqw7N4QnJuSGqcPDHtVn5P1mkRKYa68RypmPAejBW1IBDP2lRFfB34GAMwumnUAJc0zQI2+m0f
 94xmUfwtOc5Oqi/8bUy0kEMViIVM/CkZSPBFcEQI3ae99byxXfSUSACJhBavu2YCd4dbslLTHTm
 YeVstc2EJ8SaaZcalhOXvd/Xjw2fm74wHz+4NwjDwv3lLhYBLlgbUAYk2mPTgwV1XCYwJ86cv4D
 1gOi+m9WVZ70im59EtFWMo6ena+/7wEH1xLDsQqR8NbBAS4lVNFg8A75HUJrl6+aiKvQI+jpkYf
 Eq5uFwtV9MSrHL3nrqoznKQxUDVHJ0nOd4Qi27g+MKoUQzqaDMQ0tezfOMqK2HMiwpDMzb8iVsb
 SViEDekl5Sqo6q7Vjfb/aE1S30SmBbmvyJDIruENsndX/+Wa3seJyaJjerXEUNPGCDt1/MBRQrO
 M/fW4awW7EdV5yqHLYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020145

On 8/26/26 1:24 PM, Monish Chunara wrote:
> Enable the SDHCI controller for eMMC functionality on the Monaco EVK
> using a device tree overlay.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
