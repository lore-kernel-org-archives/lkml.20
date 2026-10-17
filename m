Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB9A3A5430
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259457; cv=none; b=aKO7C4mOsLK8MYA7yTH/nBRuA3xpr6P7jaJxyJLQmGsEXyI5URbkRzBU0/RpdMpv9mvjD+201QtUIe8UI37cw68IAWJZ8cMIUFDcZiPolJ/hjH2BYjI6557IXIf80fCd9Fk27UCuMpACKbtdVjbLIYlfICexxIpVnRqPuBtWwC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259457; c=relaxed/simple;
	bh=wr9UM0ewitf25gcnH66bfGnQjMCTzyZV8lf5R7ZwR74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5ocKoWLdwCSgSr0YDZTy28GcFJKXWMswLl1U+2XUw7F9/DfN2zeQ3zAkINiXLaNAGe1ejPAYulP9dYVhJu4+df+1uhPf+DRfo4DMQd1c+tX42hgoR+jE82I8asgGhdBY9mdXIIQFQOwlBnWVp7xxLP9NTdb/tJbtCCaZoWme3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BnBup60N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LHq+vM7m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BnBup60N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHq+vM7m"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGxYpR1620195
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACHN3RVNB/V2HynRAJQrVH6G6KIDRcWy3aGbMNcijHM=; b=BnBup60NVLrhzo4G
	X5EbGbPiVFHxVlcqfh0Y36TbGoQdG8k5DgKRSXO9vY2zzDuTbpwQUg4SXSsn+FFy
	c9l805J/WCwtL/EDDxXLJuFEPKd5HuYnHWK/13ESltSjTswrmS/gOcISCbxkO489
	z/OII2T6oft0Qjf7YqkyaDrfL7HukZhVu8pZu2X98wLAf/+fv/YNPU85TZPnBCT7
	ii43ThQ/JFQx5IPaimodpJ1etgjh9ZEB740kNA9oFoJptOUXhAmFsxpBDdx+ezl3
	/z8KuYjndVBIBe+IqlCvIGcCsuQ2BDPS+H67sI6ctaiiS4ZHg9ssezlB86cuaQBc
	yeAexA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1839fdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:50:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1635473eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792259455; x=1792864255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACHN3RVNB/V2HynRAJQrVH6G6KIDRcWy3aGbMNcijHM=;
        b=LHq+vM7mdtTdgnbpXdo6BFUK4enwizKTfboqRth+ZCxaGhq61x2xLo3bpkqzocuhEu
         U02hJTNxNSBC9DNWvCQYC7apvBqJTVcZtYN1G7vEgJrpBIk4735K/p/uUzrnig8LYYdi
         n/RIPPfbLcCWCPKyGIjRptlrReLUVvt+pUXfiszZG5yZRSN93Yrq/K48zGb1Q4SPDoCY
         DAcw5d/yplZT2VLsvDK+kK6JLvDftn/p8LghWBG4GMu0jlGWFNVUEDICA6wWXNUs7eU4
         D6LamtSsx6BAsDiu+FxfWnEmj353CC11UGnj36aaHP5uLIy+f4+qVsYisu3QBErjE2DP
         cd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259455; x=1792864255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACHN3RVNB/V2HynRAJQrVH6G6KIDRcWy3aGbMNcijHM=;
        b=hlPHynqcXpMJbBxp5sMLp1pef2yLH9uJ4lrG7txg3Q/29rkSf86n/W+GPeDB872+sC
         BD/Whlc5cWTGUF52Cfp2Oo0enHYVpHRlfSetqs1qcriAujy1E0s6o2k7pYYWFdNzk39p
         QxMNFbW1YP9EAaNJI7ynCAvkZ4owu9e5Vw7qGC8/wBND9qnproxcDefBrboferoFomZQ
         T16e3MmX6jH/u0BVDWgV5IHzcg9VFil/E1Zv+hXovUQObdtSJUENhsb/EdT132NuzY2z
         M87joDzoKXreTJTeRYYqziQhGjFqvdkCefRHr3eKKPNhc/25y1v31WhOwy3UFbBbZBYt
         izfA==
X-Forwarded-Encrypted: i=1; AKwUvBwEiVlqprljixL4LWb0jtpaBo0b5gnmvo19sgOQqeipQ/pHRbFwGpXrhYns1KOhiEJKhLIt2W/mfF1Dp90=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeEMHu73ORtr8AMNUTeGqvXZdhvbm7bLINQvMT7v5mml77a5cq
	n602U8hmALYUZMh+EhTUXAv+nYDtdiUe6Yw7/xKCOoNUkHRe4yg64TlyYieSAQXNsoxRoSkGLWy
	U74u3YCYe6otz0fags2pQvBvMhedE1cE9AW1LBCEg8dlBlPfCVGJZyjk+M/7J00C9NJw=
X-Gm-Gg: AYBFou1+HofNgXJ/H6LON0LcY+jOaleZmg6VN+TSsv1iHFR72h3DEc4N41KyCXdZgTG
	HXI6twDdELOI9MIBpfElgjwtSaT4+SgUwItLS9QvWdcKQ6SF5O4E23CHwX8vRezvq9kWywPFbmU
	p1pXUQRy9VCTL5rt5c4ToR/RrlW+kYP3GeTqyhZsrAA5RwTL6Qcd8Zd8i3rOCfMlry1OxRXw5sJ
	OcJtSlUKR6YpEdCVMRhMJCBtt6igHSueGpfsRq4HCdC5LdzIQheTD+oCYJuIeQuZzlpmi1TJSTx
	RrDf5fDp4ugit6xeSDBoLWLMolBirs/FSqyGPpr8NWH2HdiT5jqiQb0dp4+ztTq6OSVh/vipLGY
	Lbye58V7b6qN2YRZek3A4vhxTzA==
X-Received: by 2002:a05:7301:6497:b0:353:5d9a:9971 with SMTP id 5a478bee46e88-361a136a528mr4797496eec.18.1792259455269;
        Sat, 17 Oct 2026 10:50:55 -0700 (PDT)
X-Received: by 2002:a05:7301:6497:b0:353:5d9a:9971 with SMTP id 5a478bee46e88-361a136a528mr4797459eec.18.1792259454684;
        Sat, 17 Oct 2026 10:50:54 -0700 (PDT)
Received: from [192.168.1.8] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm16608752eec.29.2026.10.17.10.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 10:50:54 -0700 (PDT)
Message-ID: <70ddb147-cf99-44fa-b6b3-0f15e6b60473@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 23:20:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] phy: qcom-mipi-csi2: Add D-PHY support for sa8775p,
 qcs8300 and sc7280
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, bod@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA3MSBTYWx0ZWRfX0UacypAu9xAx
 DeVvKHuAACRTH6GCQkhETwMPhHt8JPME7Z1IFR+WJPimD83u+ohHkPhiEunezvo15ktkF1mkNPN
 p9r5OF89gtfNkHo3ZNplyoajIkeZ8SA=
X-Proofpoint-GUID: bh96v3tRjRimYpvyvZsTFu3XPc0uhAPr
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad3b580 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=G37XgvaxAN74JWTdFfQA:9 a=QEXdDO2ut3YA:10
 a=h3fZFQXOHLIA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA3MSBTYWx0ZWRfX5ftKdtNoU3le
 YIPuFlTTnS0kZmPBBYVaJd9BN+cw92Soy7LFidgeW+PBi0Ww6GiEnpRiVJ2UQ457fQ2e/UxASLE
 bSJUcZdux28PX4K4ljj6HghZGickNqgKC7W/GDd8ZRulA7RmpmBlhId5Ch8Kh9ksKJGHcMcdK2Z
 ovggUFUbizLzlhgqnuV72jt3jGBbsGyhQkB2E/UXpmzTEw9bQLskBi304Sc/GnKYWi9rsecn22h
 N0DRO00ixyxu6qxADazaZPSgdi6i9+ds8dyN4iHWoZUazs7z+/ffh0iHvwzkmQpB4IEzuV7ERZ8
 KQqUsm9MSGjaQk17DJQA9yEqHHqedIpmidaa2AlsAS+3126Sy4IVLVGmtFZ5UV/g5wJczZxuWkD
 5gLJ340GBHA4umddEFz9+KmoJbDbugTIbRLh6MVO4CawMTE6E7S2G3zT8IoDKfhF4U+W2Xbxu7s
 P6c8pVbKcT0bYRIZP3Q==
X-Proofpoint-ORIG-GUID: bh96v3tRjRimYpvyvZsTFu3XPc0uhAPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170071



On 17-10-2026 05:24, Anusha Arun Nandi wrote:
> Depends-on: https://lore.kernel.org/all/20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org/
This series already merged to linux-next.

Please rebase your series.
-- 
Regards,
Nihal Kumar Gupta

