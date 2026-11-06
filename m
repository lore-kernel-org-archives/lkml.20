Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942885;
	b=Q2huQxwYZT5BF89XWz9qdVpxx/+rXQTpgwaLcXziTZMz+JepmcyLjZkF6LbZik5Uu1gh
	 Yx0WSvRDlKJjZ5Q6fiSFqCit40ZIgLribmcuexsIC/OMNQr9TSdh2vzHLg8cTZfb9jGDK
	 BhK2m7q+JQS2LLEEP/EGza5XVE8zNS98OECfsUf+c79z8hZTcoXpXCBt8j0CfXz2qhZQL
	 xthxlEA0wGHXlDeuagTC+hguN+ois4KjPRE8Ns1MpGLZs4UDDWuExHM1hfnxj0ZmgArsH
	 qTBVAFWjXxmhH1oRJtKVtyVWiRYtnrvbMHRc0Oc+JRvgKG23+EmOCQmG4tIxn+HukKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+goE9BwFUZa7uYLf5Tmor+xQ5OSwB+02l5X4V78/PXg=;
	b=1o2qERzI8UPSHsDnomYIEhaOVIvtrXB1+lWIO742jYmBaKVwd9I/ecCUYll5jQE6GIxZ
	 hbxl6Wn8VByk/lsV6SgeaRhcIJ3v0tBWYai0MdYQ5ketQBj7DpAgXZlLCNOFdy8auDved
	 6b/wksXG7BXGRb53y+s+T6P6XDOwbZ+FFDLX60+OeJBrom2K8UWOuicRjDT8YJsOWckSr
	 ysrC4OyOuAmBcUwNPjJLkv7+h7ukGAhoZwlkVIEXPmR6eAN+IazVF+JX0fSdjEbPzFbYl
	 tdrL7arBTTU38kNj3yb68jkitDdx0mdXCZYx9KAQjmMem7XsNxgtDJ7z2TNvBBReQfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIA+eDm8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0mLUH75;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233C2606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 233C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIA+eDm8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0mLUH75
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6402Qh1867046
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 05:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+goE9BwFUZa7uYLf5Tmor+xQ5OSwB+02l5X4V78/PXg=; b=kIA+eDm8KW9BlQvN
	8vQyfqRho8W6GrSKF7Xw3Qj02ALGg5ijeJ97h9ekrug5qtYUZWq2G/MYaQqT8ICX
	GZBxHPJAsKwsjpDKLWKibO/VXCrebVqyoia+7u+8rmC9Tk4IbqVbC/KYk7gXwstx
	v0U6EZM7F7NOfawfV1WWxR0kTvjjj9cBtkzczzxXqSKjvYzK8oxgazMKsh3DkeQE
	/Q5DZcvjDPDacrQQC3Rx+vP5bUU+IZe5LgUxmnICm4NLPBf3v/F/vl6MY9YA80bx
	tIz4qkHUPbNzQN3KkQAF+I9KghTTBbJlAjmgQQ8JRZMpaqTePJZXsyAQm0yAMDPx
	0xFFfg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p992s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:28:04 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so418338c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793942883; x=1794547683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+goE9BwFUZa7uYLf5Tmor+xQ5OSwB+02l5X4V78/PXg=;
        b=H0mLUH75hntJqHi8hrfs/Hk5xj2u9azNcCU4kbQ5He2SWpONxh/hX0NZPOV+RyreUU
         Zd3i/tAiUmjtTotHanhaVcuqr1Zv2t28X1LNB3sTbYbJXwv4AkKNRsHRpj7smz3q9Xny
         EZ7cspTX/zpCxk1YNIg715Dg/HjDVgif8rhbCKaCzRd3jfPfz4qSkfUjEcl5MLoUWyS1
         4BFKrOhvNWMI4nJoP6+7lZWLj0KyC7mks4rqy300J8YIrB/uGl2RYJO1hGP6m8Mrxmm4
         DskKCfF6+SVyRtsMl4/46kX6zIjwueg6oej2CgOkl92kg+J4JspkGVm2RAkdL0zM7ZQr
         CELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942883; x=1794547683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+goE9BwFUZa7uYLf5Tmor+xQ5OSwB+02l5X4V78/PXg=;
        b=Oo8vJ42q6HVfFwvIMVaAxTqU5jhvvq+wqBFhbxzJ3eNThnv6Okk5Oq4ydvo/nsN9fS
         hFH7w491nrQ81seeeCTd2cxEBpdgs25OIdPJXyN/7MByr3SJg02NLtvbof2J4r71M+bj
         MMo8E3+wm8qi2JF6j0zs6WFh8jneaGHMiP4cD1AbDcxkREjdgSoIEBsOGwb7Vg6ajsMb
         0adcOvilyLn7kxNR86NzZwLjkgGlzEnVmNbNlQJcw/kIq6b2D79aYpgf9QNjL7tbMVoG
         WNdCVI71jrq4VbYQavXs2VuwIhthZn6kpyYiYjnpTyBCVYgNa4c+ig/fiuyrI2Xxl5N0
         rmqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmu630KrE+JeKDCYzVnTq0oAyNLkmQZnuqeapVAwfrgsaTfTmmZnzb2c32jxmKUBV4VBNJIKabpbmchNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rx+QkdtDlHmIsykM137XcPFYytjN46kPUatU9gt0ECTy8KKxR
	Ir8jqP2WjUuWeFjv1sJsp2lXWI9cOnmJsfYnxpSIjrKJwUX8V1XEhBhZZmcxqTiCKxM246HGLwY
	V9OG0O4fox100oFfhvqI85QKifpxO6cEDT+QkVXFcnQlzcI6QvGVC5p9nIYgX/J4LXxM=
X-Gm-Gg: AYBFou0DZld45G2Njf8+Mkqi3b5zOA74nO/V4JQGRfWU5wuMboxIIxNw08wFouUiufh
	9VZQ3T/R0heRMxG7fxaHW9uSkcl8t0DohwJ9ukh//QE4d6QMdyKgDJhGOt8HVf67wfa2KZjwvWg
	bdJHgrRUIyImEOCXemKxP2pPol8U0KzhJ3i6c8nPNMuNozVZNoBi/ejuZN2ZXZj4N4k9ZN7Yu4H
	uqBAwyuB+anzirx0sgusvPxq331up1An88emlvL3IWrhsRt7xK90rYLLgqTW93RGrIiJrl9RlIi
	/kH8LPvjJum9iVTY5gqZNxCF++as9wnvRTl+l0egF8pYbGkN0KAEL2XjfKVcFB0hrN8NxJZW9pW
	nNpqFn32yaJY8IS3Got9LneyccEL8zc89QBROY0frpkKI9A3HyKk0z2yHLpjJRo+beQ5upISq+x
	U8I6bEnyJquHeozGcsWNM=
X-Received: by 2002:a05:701a:c907:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b25d2fe798mr1617897c88.8.1793942883451;
        Thu, 05 Nov 2026 21:28:03 -0800 (PST)
X-Received: by 2002:a05:701a:c907:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b25d2fe798mr1617875c88.8.1793942882928;
        Thu, 05 Nov 2026 21:28:02 -0800 (PST)
Received: from [10.152.221.90] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8c4f28dsm2578008eec.9.2026.11.05.21.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 21:28:02 -0800 (PST)
Message-ID: <47b4d020-35e3-449e-a097-ff8e41f4a8a4@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:57:58 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Fix HE BA mode and extend
 buffer size for EHT
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paulson Raja L <lraja@qti.qualcomm.com>
References: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x6zKvw96QXY1t-u7rZcNLnSdPXa8OyCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMSBTYWx0ZWRfXwXIc0ApqIsF6
 nup1R2Hk0FDk+85UNX17Ssuff8bAvnD76hibEuDhshOhvFYCoHUV/yj6E/z0NClTyAJooC+J5lc
 SVJJC5XqVuHWewXStlMwswaLuAy5jUHh/472AZwXmJlP/EG6nJNnnUSGzqwr8W9POGgDdyDCjFS
 W1PnkhMPOQL0Ixfqgh1z84yQGm9EIpNoX/b3+bWHTqUKhELt4iTzxhkU3cEfzVWsuuXTzLutUvg
 G96xXMPe4Zm3TOAB8hMcOuG3WvoIlI3KgDLLMWtDx9fThoMdV7Sj14thl9shr4us33hNSHQmzt/
 T7R7go4i2P/A2i86LYJkPxlM8oeXkuWABjSYRybUc4Lz6IQZPOorYwUbES2Jo7SbWfdf7IWM+tw
 ODO8TjrqK7Q1IXYxDTXgVHu5EQwFOPOil5Zs2+rRejmzyP90SlD0WthcQvb8SNbQAG/M0/mz4Da
 iLi1SaU1Eyv7Zf01vYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMSBTYWx0ZWRfX5v7B6dGnnrbU
 yKhD3BCWoL0KOVNxOLIrqi6ZGnc4tzyb24Aq3FuGH5HoDZPl7bFhEiL2BIJI9RXNhP8RGIymrXQ
 YG9CGpbBYOxHd6NMxl310Dlurf3lGac=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed6564 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qSRq8I4OGtnwRW6ma38A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: x6zKvw96QXY1t-u7rZcNLnSdPXa8OyCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060021



On 06-11-2026 10:27, Rameshkumar Sundaram wrote:
> This series addresses two related issues with Block Acknowledgement (BA)
> configuration for HE and EHT capable links.
> 
> Patch 1 fixes a bug where WMI_VDEV_PARAM_BA_MODE was never configured
> for HE in AP mode. The existing code placed the BA mode configuration
> inside the he_oper.params check, but mac80211 does not populate
> he_oper.params for AP mode, so HE AP links never had BA mode set.
> 
> Patch 2 builds on the fix by enabling 1024-entry BA buffers for EHT
> capable links. IEEE 802.11be extends the maximum BA buffer size from 256
> (HE) to 1024 MPDUs; without this patch, EHT-capable links were limited
> to 256.
> 
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> ---
> Paulson Raja L (1):
>        wifi: ath12k: Extend BA buffer size to 1024 for EHT capable links
> 
> Rameshkumar Sundaram (1):
>        wifi: ath12k: Fix HE BA mode configuration for AP mode
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 41 ++++++++++++++++++++---------------
>   drivers/net/wireless/ath/ath12k/wmi.h |  1 +
>   2 files changed, 25 insertions(+), 17 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
