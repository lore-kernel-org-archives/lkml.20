Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539894F68D7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687987; cv=none; b=Ughwn+rmBCy+BXCgZOS30lvl5X7KcfwMsvhhppQhLIFyfotbqeGRm9wQNS7AMjE7KXaszK4EbpjQMTDdFGc1SVgDYDb1xw4l8l+JvKe7RSIWu/ly4OjDCF3H26U4hu2zGFiYW/PvT2R8obg6HWByeqAuZLHJ6UoezEbbTA+o8Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687987; c=relaxed/simple;
	bh=O0ihVgcmW96N31WjaekfKFoFrDNfaoWUpnrojK/kPIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gta/7sVsoFCpkrbStqEGCDZJGR5zJkrrBN7z3KWdJrSS/sN910Ko/WNLt+ruFaMXg7HhZEIbmrMZr5JHQoC8kQM+Fd+qUsp5d/yZXSV7bw3/1DnCwRwXSXqRD8Pgu6tPDUoxHmfqiEcYv1QwLKAE0L6BtBdOaGafkF4jrJV/8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlHzN4oq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayPriXCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlHzN4oq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayPriXCe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqfvW613402
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2SaWLLt3k31dyNE7WFRzNl2
	f9XMQ7VloVYpaAtanfM=; b=TlHzN4oqB/ezUHQHeXfCDFgi4nzSCw28zqyr8Qt6
	U3fYQZPuXk+FID/DS6lX0cxOVWvZneMpq3aTdYlof3Dz2EfjaPLS1KcEGderFqG0
	AXFZ71yDrrIvur7qAOKFJQIOGEleTV74HfbrxC+nKTTTmUoudDKU/HSuChUd7H+C
	8NildQB+6oDGiiPWOAt5VguE9cg2BUXlSxoU8ZIRWAF+pAAtybVDNUoHHa0iG335
	J14wx6trFoDgdCfDwXj6N4lNuLWx9e6ir34mNOOROFCN5HqUTytwb1eHD6StS3dp
	F2aTHtNwlbzeUUPQXRl5VO/9owlc3ePVoml5Pc1fUIx3OA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew2n0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:19:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b7da952536so1626322137.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687984; x=1791292784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=ayPriXCe0M+jTnOXo3hKHwTf1Dl1XzrBvcNeHyHTBiHJD7RmclbWYtWNWe4qIIBqWl
         icjD3qdfVcqMGvX14139zDYHy6/BdLVGO7LeQu57+0sG/LiWDOMIVM6LeMSm/rxC4PIn
         PVb55sxp8bDX3tnedPKNkmHh7jQKLTqRX2H/Q8XMrLxv0ViHvISnHLbE9NKUEo2vPsup
         692yKBBt+cTVPnyO5ciEz0ZGCXvL0TjFYfkVR33LBvxwug+BdCGTCPwTzHiDEKJdQFVE
         vGwdpkXLHTGrT+9PnbfEczhGGttZVZ4GKeDAdp+Bohdp/r76DtIBCzyINJPmFmNAVdyw
         s2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687984; x=1791292784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=qOSK5pTTWM0dGiwIc2mZl1rLqkWgxvaAe1z/4kPzyMkqSmLfT/wvplB2XxGiUsUaiB
         zSeOxg0OJR+6vxTsR7Os9yHae7QHB8dQ6xZNX5WkYfnR16dwLfXUqHkZyjpd8EeCF7z8
         ZHS0q68H1giKy1h+81MjslrbmGQx0ZEt3wuR7VZTS1YJ8kV38GatWi9AYufONMGTijEw
         K70ygbEcDCAh6XEcyXwKENCDVpmxZaPGe4TXqkzmc9vi/fC6aWHnOZJ01Qw+6HLdzhlQ
         8btTuiehMHwWBuEayELr+ms9Et4g16awdh/qsnLjXFc9FDxN5TH1VIlqwxLTCiXY0UBK
         UfaA==
X-Forwarded-Encrypted: i=1; AKwUvBxcUK1jtLj/rJ0+7T1rUrVX7yWVDhROJBTAfzqARaR26Q2/qqsneqwMngorQwtLkhfZYRFtNCwcDE5/aH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7UxnUPcmigTamMiRlo0Jl3VLnls1YlF9GJ8zWmRMNX1szbdhs
	CoKPXNAaesfSU4JRs1CIffrqpFQrCNXuDxU0Dcuha95z7rkBlM9KFyoghJcioeth1Jph8xdP+E6
	8mdFk9CSAsb7SrYxb1siEFABd07Z2IRXZlobfbz13HmodbHFcLT4CKojh2XR8Ilyj24g=
X-Gm-Gg: AYBFou0ucunjs0I+VKuw8gX0D16T85ISxnHWQGOPucRnjhjKYrAG0tPUrJgUGforlg3
	UbCGQPrYjBZ+4XJ6ugVbX6fYIXfPFqQl+il/miCne+HOvGIxclxUP4BDsnX5JLoid6LMcSfw0Ta
	vs1tN4PLFbs66Mgk15aKfenZDnr7JGv0brax0SIJphplDUFUq5aqva4yFgt6MZPhnDVcjJJGkJ3
	xk7dsbnZUqcxZKXocO9WKX2Tl+6YAOxgVv3v8E5Bimws2Hw25BHGYSglhHMQft5PJD9cExp8kQw
	LxTbB4ttsA4NtjB5QnDGj5jNcYSOIDCE4p8tUYYI1K4mViuiCoq2v7jZWw/BC1xqXKmUQIPlgc6
	kXkn/T92q0e89Aj0=
X-Received: by 2002:a05:6102:84d0:10b0:7b2:43df:ca51 with SMTP id ada2fe7eead31-7b243dfe78fmr2908988137.27.1790687984148;
        Tue, 29 Sep 2026 06:19:44 -0700 (PDT)
X-Received: by 2002:a05:6102:84d0:10b0:7b2:43df:ca51 with SMTP id ada2fe7eead31-7b243dfe78fmr2908970137.27.1790687983594;
        Tue, 29 Sep 2026 06:19:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfecb39sm85112185e9.7.2026.09.29.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:19:42 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:19:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor
 node
Message-ID: <x7k2cumcciponrgroymvh65r2dqgagxd3gaxgem3di4mcaeriw@njn3rc3jwbbd>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX5mlWGfh6qf8j
 TJVi6L8nVVInsOZT+1WCh/cKWtckb22cnbVHg3B/vblkONcshKCLfUiCWdKfN8kPqa0NPjETUOJ
 fLj+N1ZPPjFH2jEkqRvzl6f9YJlRtlk=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbbaf0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zUvQE7La0P2yE5F2ZKYA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX75QPvJo4CMdw
 bQtz0GirYBksR2Tjyhe2AHTfSWrnrfwv1nhM9W7So3t6NXUNeap36O/zMTKkMjKPfjrD7h92GMb
 PeA0dfiiO7lxguOlhvlasHUqrNmYXY0bEb0HDlAihKsXqgn/IUOwFX1XIgD8g78rvsZx90M16p9
 Y1xFtTTlTY8UlPp9B/3TSN8pnounvkBKuaDUiLK015KfUjyzN2XAo/hW6KazmiuUX5pZSqoDwBK
 EncAPY96Cmg9Gaf5MCuzG3J/Qu8duTwnWXMXkKTlBZsaS8Ef/5mSYLY0zM/kCkkbuNVXxaZn/GI
 jm113+agb/Wd6go8M2xOCidsT9T3tN8+sQtyI34tkFIRFVvt6thQLJLa8a3Bti2Gn6wTbzuO4pv
 /I+cLqmB9ktuwp83Ra06FmTJA2rw5oSeVsik6gtq0diWZw+lJClEvr+x/+SK2eXmsWqIUUQQUSN
 Qoa1MvSZOaXRMWIlq+g==
X-Proofpoint-GUID: pxudwe8kwdZ9d0FvWAGgCqFXCx-bEgz4
X-Proofpoint-ORIG-GUID: pxudwe8kwdZ9d0FvWAGgCqFXCx-bEgz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290053

On 26-09-29 18:39:41, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
