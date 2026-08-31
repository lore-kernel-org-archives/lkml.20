Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8C63624C9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166013; cv=none; b=UNUwie/QAYnnBD/g56trGe4dmX0x4jj8cRSvVhCiySDTXX/0/94VbGdli27gsDthb+LiJecvPPbCo89pMVae8l+aMy20d5NkGyL5U5dlriYgRoRygNXf7ZupU+d9GNh5XIAa9OKJ9b+bVrcE+IwfZWRhv2LAXx1SxCHx1L2qMew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166013; c=relaxed/simple;
	bh=hExccF+WH6nQV0fUgGSfQ2Rtf00rZIwOMaCH/wzTNVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMlHcTQejsDv7BDJTn0qXxvTT2Iwq5EJtQhai2pUKxCQs8m/Oc0vBwNoLeyyY1jMnHOo2tIFDokOyPuAjd3n00dHbyPKC8nqFFxmvpx9mwlsDUHTAe+Nn/l2J3V5xvkwlzBRCDlLim5KHVkB02Ju9hRTuk0QjBiE5eqmUxmwo2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBduephy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYPnnOgQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBduephy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYPnnOgQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V806gY3085898
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q34EOEOHDqhYS8JW/JGnDxv8
	icYMu4ByEPIuxJYSlZM=; b=RBduephyQ1PxH45U3cscOkY9uFLPUW8h2eMzJdQH
	KgWxAUMamlu0dNLe+QMCWBCmm9vhtuKURc7eONgltJgc+Ad2ueprNwxnco6vO1Wr
	jau0rmlQ/ksBHmoVlf+kauRipWoXb7d0a/8KLA9TReMVOv/wKuwbEexv5bo+Y7H4
	Cxy5rX1XZEhcO61l+/0DOqxpxT3yM58tBxGrTeXOiXnWe3pJkv5thkOeZZoTwrg0
	vymKxpQBZn4zKS3GZ/wcxff7rhTOK/haJQFrWAZmdGlDmanQ5uqha3Yv7MBLL0ku
	g0dpiAvLE8mL3B4s8jNzM8PlnekKD7MVosfUO4BbEXnhZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwdjvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:46:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ef13b61bcso659450985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788166011; x=1788770811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q34EOEOHDqhYS8JW/JGnDxv8icYMu4ByEPIuxJYSlZM=;
        b=GYPnnOgQ8ZzEPwOzr4kXJuxbd5N7TFBi1I4EzSQOgyGuyMl0IZUTP6xWPZNqXcsGot
         K4JX0dYl+xrYn9YCiz5t1IqNMp7Mv7c3DWE+8n6yROoRlMYghX3WprfOD/fZ1iSc1Wr+
         ePm/REUqqKTbskn/6D+pWtPBjgdaYu6PwcNf4tqXS3D11wuKt6NoWgLC+WdbgJQAMpDz
         okSL4VFGoA2jxKWdg3eaRtFuXGxbvgJXPa9ohVzTfuuu/0L+RqbgKphozNXY52qk6Uyw
         k98Z7F2jlK+l6wmqhyfejul1kW1VtZqy1go+q+Ea0FE5neSBuEohT2CcVY+ZsWEKkPZK
         KW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166011; x=1788770811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q34EOEOHDqhYS8JW/JGnDxv8icYMu4ByEPIuxJYSlZM=;
        b=AsKS8gU+w+nB1pHMbRBtqrkM0EUHxQaSLARQjhsx8gkH8gJLlaJ0SOiL18YgNz78uY
         G92n1vidjYPmflePVK8xK1x8YkD+xdAAaEE7+ek7OZBojcKPe6e6L8Oj/g/igJ+rQ6n8
         he8eVkTjNNVE5iYbNbgAcyHG52qvAQGXO6si5uxTb5+7yS0x5rXbe0D3isb3GEKm9Zmf
         Zl5QgS+4UnX3z1HLWosKZpImMcugFjW9W9YZghCO0sY0tFWwoJlQmk7wmsZpXxm5yWqf
         EY2m6WavYp92UMufaZYmWiSWiPTgdyygKRmuuMatf2Jnfn6Hr8HZTMJ3G+rW06w7ZHns
         tOmQ==
X-Forwarded-Encrypted: i=1; AHgh+RozgVhqK2noI8Y6MLKn/E55P2PQuK0OFw4xKyciT5JhSJ23F0Lj3bKCHHBCPEnA7Gxad+xpkSJ1qDoLQlE=@vger.kernel.org
X-Gm-Message-State: AFuF++kJjhbOiwYG18GolcOPSOuHy2YI9HTrXa1Jf/aGhYwHF7G/MU8C
	neJutpFQiHPZypsrsP6XbkNCR9riOSefUZIZsVbqWRVb1yI8mB9sGgYytY5epEtl/5Ra1XQB6Vr
	wtdGox/LqV+7Z08WVdZvu7GPwRFop7A6R7zS0MiDqxsClVfMv9NMFaXFNS0Je6cNq2oA=
X-Gm-Gg: AR+sD11GP8F4IRxUhrhUjKcIoPKFGQJP+Ulc6P9xXi5ToSo1DqlMMysXyZY0KiELZMj
	cgKvlNvxEZY5d6d6ENKyI3Yfu5TWnhnmpUESsTUEW9x8aI0jM5GBkcf0WFrUhSR/yUSDQd1mabY
	agXamXr90cediSs4zmq1QjM4TXAsZZgqnjT21/+Zp/Uy7HNCBP8eHLNsqFfT0nZvqa3QxqD/ouM
	mOM3U1epYg7Yor2w3ksYwNQ/PH/3r5WRiA64scYwtHUsIChvUP09TiugTUh7wQaoGSZrbdWOdoP
	7VzlXq33RmEenQ2ySWPTsY1mwPs3QNRIO/eo/rXrAfVmf1vRkuX4NTPm9Hs+YpmR5Wrdsgz3bGd
	UtZPpmazAhFf1Nw==
X-Received: by 2002:a05:620a:1b93:b0:939:e76:cba5 with SMTP id af79cd13be357-93913924eacmr2720200285a.32.1788166010771;
        Mon, 31 Aug 2026 01:46:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:939:e76:cba5 with SMTP id af79cd13be357-93913924eacmr2720197885a.32.1788166010299;
        Mon, 31 Aug 2026 01:46:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm160390655e9.2.2026.08.31.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:46:48 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:46:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] firmware: qcom: scm: add HP OmniBook Ultra 14-kg0xxx
 to QSEECOM allowlist
Message-ID: <yig7camoooy2pcvhuqlmwbbyxx3qbxyvr52jqeem7nbwoo6npf@nv2n3imnjaqb>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
 <20260830-x2-hp-omnibook-ship-v1-3-9feada71dc79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-x2-hp-omnibook-ship-v1-3-9feada71dc79@oss.qualcomm.com>
X-Proofpoint-GUID: azs3W-HPqVzhWIi2x0PeDrh8UjAn79EF
X-Proofpoint-ORIG-GUID: azs3W-HPqVzhWIi2x0PeDrh8UjAn79EF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3NSBTYWx0ZWRfX930oAK6lnI7+
 LyMudGNP5+0ghKYEytz8D4Y8Y2y8ZN6df2+zeSZWEUx6SQSEjihBWJ4JLgGLQlYAh324zSIPUAB
 kQUcY/UYL/or77ghsWFxlu5GLkbNJ9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3NSBTYWx0ZWRfX+TsQuS8xZtvw
 Wvf38W5fZjYiHHHdoStdk9zk3AwgvSy+6dahXqLBuMU2BL/4bNzBy0XZauwjqJz3unIVCOigyFZ
 zYRgEUnJa4tzs4rKpH4wWokS3pU7PxUIvkXAGFnhV2K5F4lnkL2ED0QCVil8pqdR5V/YRHyXUfe
 VXo2b2caA2Ltb92aWq0qSlVSN1OxHfqmBiGBTmd5rYrUMq2GysW8jLNa1DP07G5dgI7EskzSZey
 FDARnBU28Z1Sz5YQQSm5To5ZCP6WMUwsurq+ENElkxseW3dAlZngRvjifiIq7XNmV25mX4Sz7G/
 H32Uvv1s15h+Kh24XNshMDbWvFHTMT5UFVKac1fd0P2/V79VcxfBNQmOcbnhfYTC8tlAOTPuZmX
 jXR/hnc2TT23QchYl8N63ltqYvYAdeG32Ka2/p4kABmgmfqJXrJaK/hrLjXHyMLlR7+/aSTkjKK
 teXoofeX8+//q2KZPng==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a953f7b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zrKGh6FZpyt9dfM6tdkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310075

On 26-08-30 14:56:16, Jason Pettit wrote:
> The HP OmniBook Ultra Laptop 14-kg0xxx is a Snapdragon X2 Elite
> (Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
> Add its board compatible to the QSEECOM allowlist so that EFI variable
> access (efivarfs) works on this machine.
> 
> Without it the kernel reports "qseecom: untested machine, skipping" and
> efivarfs is empty.

This statement is kind of obvious, so maybe just drop it.

> 
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
