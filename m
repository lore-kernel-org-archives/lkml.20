Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05B033F59C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881612; cv=none; b=Wg/tuTGN4a3zLlT4KeebDOlY+L/FfnlECNaEJdV6iqO9rZyqXPTVKIqVcU/agcVBbsK6Ajq97pSezxFOZQIWXBuCPWVqYPJPLG/NHG95RiRH2mNEYlIvRZuiAIXnHSBitzFWaX7ki6TdJsT7kqyG7wRExXAm+eamAof7ERoyeuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881612; c=relaxed/simple;
	bh=bNzuXJG/ObGhI+jJpprxQn884T6DsuURzX+nVh6WQWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DK2JvHACFjhLIXx8fKIkl3EgJMkL7TxgqVGWP8wyt8ZY0Pk4lQSjcuMLDL4Upwzm8uavYuC6lEJD+y+7aiOG5N50OIpFjQ0wBcN2L/pFIxYL+9z/hgHoFtAmTmySG5eH1cES/RyB4vjH7+jlB7j0b/w6DctPjxGEC3o73w8xGSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9fjrvT8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHSsPLxq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9fjrvT8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHSsPLxq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8ODVZ3054788
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yvqAxKgwJzOB0MsEzFeNKT1R
	wFJ4QQpfU5psf5Dlwps=; b=C9fjrvT82Oek4i6GusRwzPC8QWwlTAff/vKdu0pJ
	Ss5Yw+N90OM/c3OYTJfn3vFf7DsBT9dSD1bnQCeYo4PWUBgmnQZs8lRm0xHBb3/x
	XgTXKMogKq7splJjlq9jBpI68l72Bxpa2w6JB8IOYjaetBVPVoBivoEvCjbIe46E
	vwGpVmwVxAr0r/oasdc57qIRUAxXwSP7+dk1xhOEBlET3ohUfUwaEnZ/5YvhDud2
	xgIsvLHRlr9lTq5EQ2F7wUSnDXLc3AkhzN9eFJVrahtja1fjmZpZp/xtBInI9S9X
	rYAek8w0EGDwez0NjG6KvdsDtxKa5JvtM0D+1CPCcsEo7g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeucn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:53:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-919879b09b7so65721336d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881609; x=1792486409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yvqAxKgwJzOB0MsEzFeNKT1RwFJ4QQpfU5psf5Dlwps=;
        b=jHSsPLxqGbMWlbBauS8U80xqU79r+vdjoyNW+GChlt8kk/P0QnHXGEV93JZgyU3dhb
         +Nk9fZtN35rCHuhNn0qUmXjP4cdNZZNkpyPU6aWhpjF5ymcHX5zg7E7UOvevkMRY/tbD
         SHAEGp3rhVxJOzqzZQpMOLXoc8/LyN577shvtjjFToAP6jkJhz/kOHA99rl/9MccpJBs
         dflNaDxeOOsO+8ImmaC2dlSiXIIVlSpaojnmz6c9vCOkhYnI2A0n716kUCiiLPe2R4wZ
         tlFPr9B5yxjDGkPGLpDOEg0ENO2CiKDioIdVFupeeMPT5ttQVhLt1ihcfvvPn26cD+GX
         4/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881609; x=1792486409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvqAxKgwJzOB0MsEzFeNKT1RwFJ4QQpfU5psf5Dlwps=;
        b=hThTf47/qqSPaym+t4M+epFj2Z6YP94t5fJMZb3HeBYC0+WpRNw5zZ05tzA+7mhHlu
         fpPdDAjFuQ+mHphF4QJef07jrz2qE1BQdsj/LdL42T75ZdI/mXbRe/4g7K94vB6ftWyJ
         7igDla2aMIvCeehT0/fEssg2UbeC8hO7jzFUpTB1dsrAmucJmzfhpjTWBbzhA6MJPjGP
         M5bBuWXidozZ0NTD5apwvBZ0xPBVcgaBFO0S1C5dOszSVzGz+OIGVhSpVEm+JF0f+lj6
         QT1G4hMjHikIGt4U31FXPSzWDlw4N9y1HInIHkjWV9UdhFVi61a9RwLzrNz0r9rV0jqP
         wk+Q==
X-Forwarded-Encrypted: i=1; AKwUvByMEify0NvBiT4nVhi9cZ9sTd3zjxDXO80Gsq5HXolI3i7PuW5eNkX0gqjwNQaexTWwAL/FWuIGsIMaCyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeilzzovSnUWeXLN/iAkA6QL4GcP0+/1+XaHjH9Q2UkPl3HeJp
	kWgS6yVDM6PaTbSLdnecIDzaYTWC9oPWDpufLGoaY5u+p1/pwKDc8zwQmDC3Y8KrrnKJ55nKI93
	IgFCNeLu5X8YBXwuxHIyBv7f5U4sQ/jk8cYRwl68bJCGh07SEwQ5xOcsbb+q8+vD5du0=
X-Gm-Gg: AYBFou14rLdcbmKTZ7yuWcEddghKRgFiwK0tHc0BTdDe/R20sAZkr/YlAzl45hGCEYe
	eV+/WI941iro1EAFTt0JXRVYsjuQOXQ1zMA0hqFOIpylWJoTMU9N9viyUG86mfUYknV/DYv9d6E
	XxIEOmPck6jq1kzz9/Zq82AIxPRevITr+UQc4+uU/U8EAtJ1K6EsmactI+0NJg3GS7JTB1eP5at
	KhVa83+7GdmAtEE6MAPTly98SiaHJcGxsU7uZmRNNV9ZZvcp+Nt5JidzdPGc/bgcQEoRcCM6Lhf
	6YB142safI/pkewfdT6oFNHDSazMVV5WRpwoO5tc00TMAfdVFgvI7znhQML8lYL219hVZDBdC7z
	XspsYlmqyzhv1osw=
X-Received: by 2002:a05:620a:199e:b0:93c:ca3e:7230 with SMTP id af79cd13be357-93ebd259ae7mr1798115485a.52.1791881609113;
        Tue, 13 Oct 2026 01:53:29 -0700 (PDT)
X-Received: by 2002:a05:620a:199e:b0:93c:ca3e:7230 with SMTP id af79cd13be357-93ebd259ae7mr1798113085a.52.1791881608431;
        Tue, 13 Oct 2026 01:53:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm401710915e9.12.2026.10.13.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:53:27 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:53:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: nord: Add adreno SMMU nodes
Message-ID: <oorw6v4f2pn52haoedhpwo4ihzfasknxj4pvceahgkddzuilln@awp5y6hs53gr>
References: <20261010072823.3952417-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010072823.3952417-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: tODgGXA_2djcWuAzg0G9cYLhN0GEN9pI
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdf189 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wHuZuJDevlIp4-gc4M8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX1ADVQ24fwKMI
 bJN6UIh0stIlnhSw4u7RTnILdcntZDnOeiMgEFl5tUMnRwfzuMSb1hBqp6jowaxo912oBg7NJoX
 k46SnaRbvQaHwii1Ye6gDtkuxe46TtQ=
X-Proofpoint-ORIG-GUID: tODgGXA_2djcWuAzg0G9cYLhN0GEN9pI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX1upTmj3aHpi3
 8ZHZNFIrrfCZqzB04J0WuMFwJ7GwQBv16FLQ0JgfaRJcmxZQJ5BMNMb9XWqWGABLm1scmK9CNZd
 PEsDlZquTdpt1xLGeAcByQnfCAlfSbmrSfhM55maSz+sN7/GfCk9uMTGnGBxiq9DNuF/JyEwPRG
 N/QbtC3LjlZdzuQh8deNOlgZSQjlDVAqjGU1mtACx1tcQxp2BeCvok59YZfHL/YoErULR13ukct
 2fJFIz0Qho0iE4FTOtTfzBvqs2x0rasP3RQdCIwOIca/7uIVWb92aH3fGI79/9b91V9W+gbTccQ
 9eZ4/V07TCC2uFjgX27ldLj0Nt2G5+oAG0/b5EaUk/YOwENZwvIOqj0aYZ+syO1UmZC/oUpcjrc
 fq5OC5QSS6Vt+LCtD7XqYoUb8aBEivJX7Ny4jv3omNYNI6z0FqHACfYoojgQ4TUUG451i01EHDL
 8Rxg775PuPhMH8PrDUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130035

On 26-10-10 15:28:22, Shawn Guo wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.
> 
> Wire up the gpucc clock and power domain on both adreno SMMU nodes in
> nord-embedded.dtsi for embedded Nord variants where gpucc is available.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
