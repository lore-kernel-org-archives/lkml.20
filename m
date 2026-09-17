Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DF74DC557
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657896; cv=none; b=Q+7i366ZWx5CgthQyXwRB2BDbwNaxA3uWntItFZ8CKnFsphmP2GCnEQqluy4Bpo8eOH/wQR9E2N4qau71uw7zx5hoZbgc0o1tFOsd17OBaM+L885Ll9RGdwIJ8lqTIHj59ND1XBpnb27TpsTpq2kY8s5quNEd+gRWBMMFmiLti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657896; c=relaxed/simple;
	bh=BkBRbohW+ge2Ns1SXXgK6pQXi2hgI7Du/+1p/j7cAWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bj9sgkaPCUxpDti4wpxKPLlJwDzacs9McnbHRdCWyglHdRHr1I007dtTDCdFOQBQZXQKDwkz/pbk+FYgy2aWrHYjmX8kcD3vjSjFl7yhhCX59806fWrucUcAbO/S2sPerNGHZ9ZVMnotgY3Ec+Jmy+Y/BLjly0zjbZIcSK3ev9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWwKACoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfIbAFGp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UWwKACoA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfIbAFGp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiQNw2086472
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TODua4nGQ3TmNmyodhx+/f7Y
	LgdfUdTpQGaVzKED2rg=; b=UWwKACoADMpRyDhH5JVYwFpNGOr/geBuU78UJG4x
	uOyqMlxRJlxLjs8k5usiRb8qmYPn4GhTEtXF4HJIOVKXKprpqQEhO07YadkRwc7g
	o75wqi0qHR5PRB0sKtTWNjOlM8stSzUusb8qktmp13QKpgpjYDRfGBQo/OC84fkk
	akIZiiPz/SH7rmCI087V2GBdG/jcTcrQOjKnwiAscDlsg89sxrDNpOK9NzBOtkEl
	ZL0FMDrZctqxyxrInO1NKEyYXqJ+NIIZjSeW2hNS9qvV4MuO7cSB8VRC9idcul//
	6K5s+lEm9KaUnmCYNtBfuYDywSS2PHUTQT3ORJzrc6yzjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu40x9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:11:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a07b5b5efso184074085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657880; x=1790262680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TODua4nGQ3TmNmyodhx+/f7YLgdfUdTpQGaVzKED2rg=;
        b=gfIbAFGpqSjQOF+2H8KR0buBbuGsH0+j2DBGoOZDbFtJcODhcGluuY3kclnNDqWGf4
         N8qxZGuXb7qHeiElwzARzDYDzZLqSCWgn1PnIbYIaTFQL9G+6oX1ypUkho9GBsr2Rr93
         vmJA6yQMitLidlMywZffVFY6TDdJNF15IRi1l6qNse3HidkPHAm5LkfVTP5UowxQhuCU
         B5WDyqRucKyCxm6HUs27wIAf2145mm7N8wjqDHrlDgq4URT5oyZdnLnWfPpzBuuMPasS
         KNvZp79hBv9CJxVpS/Tjd5ZcnXfxIVcoRRuqjJ1Qfnnf7rvAsLwRkA8o1HEBHi67O38M
         lnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657880; x=1790262680;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TODua4nGQ3TmNmyodhx+/f7YLgdfUdTpQGaVzKED2rg=;
        b=E5HdXkOQBhiXEEePXLsmOaPOCep6h1K76a7aHi7kPdx6c6llKNGGxAZWR3E2R2XTIF
         Hr3EGFZNgwEwpa+JuXW6WaBXJjPDluHT4IB9gj2hv+aUjzH0GbhYy/8GzDVWJiVjK9Zw
         EA6alHANs8uYfFIJNbs+Kc0mGfLg0XkQImKxpxsGydwjXqAsJFgHH0t40bjrJr3Pkihh
         nB7djdVyisT7O2KbQqo17OCeQlWIVDbp9tIChJpYPGb7ybWK9sLM8/s6UCNqCsJ7k7Kg
         EvwM3guD5G/hYdJT7OCbioqQeZpjAyJNoApmMXlGNOfAG2oQQhSfIewPJXxPQJHmUp4G
         IWMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVq3EXd+wK7FAqvWRLfHbgwfiabgiwpFiHP8O4enV7x11Bx6WSPGM+kjfTLHYjefQcdHNqh0kw4SuiCbs=@vger.kernel.org
X-Gm-Message-State: AFuF++lqlHdEtwOda1YFnC8qCT8kbGod8nZrmGG5+B3wphV4jxPBJmOQ
	SKaMDELRdEGzUpP9XKY1+FJjVVtpQ866zagii2pyD16EptNkmHSy4VdTvvM0zPZMd0DRZnZ1ha4
	DZUuH/9S0ohae3+1gR5ibW3t4oy4UMoy+AFjTvHNMku80Qw+ZFrShYXuEVfrrQIBXqhk=
X-Gm-Gg: AYBFou2RhtLaxm2gNp6PsAbwQ22qlqVNKiUaqJD91QRB2Z7HzwC4NBmEZjg+S+kElQa
	0nFmcp85xpP3M+MjM3L9Pzh4L1v+SknBrxFEz0Fzf5iyajoDqGTxPi4iIgCrpMIsPJ7UWE+YZ9o
	eXAoTeKcBn8PcYbmaBcVaNLkr8w1QsixyBpQBBpRGz0UyEuAxCbkOmNwOg/Vpgyno9O9d2PHtX+
	27RdyuU+X1Vi0mIQsWg9X+UGnzeFrl5zApqKkzcFEoSaGSVkL8XYn1UM3LPpoFF6kwwAhSPDOsq
	Xtd+Z1TkdW+huNP5LO61jp1yg1fIR8zoPa2TvdvaXHcYsBOT9AEFnvLC7vUXCTHWjUHyliCw0bv
	PaMSSP9a89dtPV8I=
X-Received: by 2002:a05:620a:440e:b0:93a:1773:a16 with SMTP id af79cd13be357-93bc603458fmr555163885a.0.1789657879870;
        Thu, 17 Sep 2026 08:11:19 -0700 (PDT)
X-Received: by 2002:a05:620a:440e:b0:93a:1773:a16 with SMTP id af79cd13be357-93bc603458fmr555158785a.0.1789657879323;
        Thu, 17 Sep 2026 08:11:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847eab65sm99562625e9.2.2026.09.17.08.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:11:18 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:11:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 01/15] arm64: dts: qcom: qcs6490-vicharak-axon-mini:
 Move PCIe phy and GPIOs to root port node
Message-ID: <mwo5ahkfkf5qawcyfgvcitjrqvbugp6pd2bp43njgzppsvabrr@bb2fjq2oqhei>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-1-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-1-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-GUID: CXjNfDXT5bIFAINJMSLS9DPFWp9LsRcP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX+qjWJ5J/+I7X
 Xq+AyIJHd6QBJtefw6W5Q7tMp1doo3wtbepFzUAelSTSmT1+aHv8wfwWIdfHNon1EBTfV4qnhqk
 kfbYBOQv+u0/gekAGAIVGIBpsgOMhzs=
X-Proofpoint-ORIG-GUID: CXjNfDXT5bIFAINJMSLS9DPFWp9LsRcP
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aac0318 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX5AX8mLqu/mzq
 8iZuDsNPy4bqUiTgINnUg2y9wG0qO781LkDN+6LjnadAM6yeESDczHVcVRXXeUoMr7OikLegMMB
 Q+IGayiHU7TQHtYd/rWALxJKCCKe8Jl1Xt3On3yvrS7SGozQ3MPQVfnlR8XdedonC9A+mNb7FKi
 AnmvqwZQd5ctTTXSJ0zCnEOK27oEkMmSd6DGZqPu8C6U9Kn5wO/XkI/GzHWG1XHOxtv/O+nzx9z
 lKn4EzRAoUVSqx+fe3M/2CPov4ffOOi9ozT8MZTmO/RGy2hr8HA837r+v4oa800GVKz18aJOI2j
 Ts+nNBb3MkPCNSGX8BBPW0+sSA9AkcujViWS1dlZvpycRv40R6OuVRdq/EvHpMJlZSLKu9ZtMnV
 Nq2WGIWAtZvYArHIf0EI3Z46lrfquwYrzYy42G6+owEyZYUyjIoZjJtdaehx9JNkO8XU/N3mj4e
 n8bHB4T38JIPrqWPlrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170214

On 26-09-17 17:55:15, Krishna Chaitanya Chundru wrote:
> The perst/wake GPIO properties are per root port and belong in the
> root port node, not in the RC controller node. Move perst-gpios/
> wake-gpios from the &pcie0/&pcie1 controller overrides to the
> respective &pcie0_port/&pcie1_port0 nodes, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
