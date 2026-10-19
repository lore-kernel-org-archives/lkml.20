Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC2D48AE1B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405557; cv=none; b=H8mjJD8/hBxkipPi37XYlItUxnjFJRFfBu/OsBs505uynREhFRVlT2ZI03NQtiUbkcbJlCOniIV4Ur2n+MN9gy7Yuq+c4eYvQeMXDRbNvQACPkGi02Grrpvr2l1dRVWwpS3Hdso0uhvUyH9vYjBmLGlBZ3tMPdNUsWxwIzqWYpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405557; c=relaxed/simple;
	bh=Vo/uF4ySZmOhhCkcQc+Kd9NjByio5FnJ+xP6tRUVNLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxTeq2m6nPwSRuPxMbC6CHT43CbItnzb7su1mOCXDZv9sHTfDwWv7JcUIOGPboQemBpBb6xCEPBPxzYMT5kk9IViyMANo8lpiRUVOOCpobagm6RE7Aoxf4r8/YyjsiypFmaZI3fWEd6AH7U5MOQyCP227E21VBAB82kv8XIyFpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njCQv5TF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDDbSqe0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njCQv5TF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDDbSqe0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P0Jw2041862
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9sY3QVPyUK7h4K2JFOaaQnKC
	YHYUA7K+D02U/VBIUsQ=; b=njCQv5TFfHF76FaNOFeqvgHmreYG1QltOpW+i2AK
	Tnv+T6DCYzrnnM1xG/sTs5sz/HnTORv/zvmVck7l9HNCJR31M267Hqeb1S2876Ot
	Y4eKWIg7aq6iHM0XxiYzDIsd8kuKerhJbMYKsJ/ar9pYlx58f3MuGggdXMfmXtG5
	kIm19rUCLP4xqBaZCm+VmyPF/WKbJQ0zJL0OTqsfCyoqrkGrnMiVKjZ4UeyzcIMt
	LjjXZLF6FQXAdUCrYr+85S3M1ikaioBmUwbceoOvq9pnQDMDsf0T36bqJ8FVbp6L
	iyMzEWg+wTeXKwizUJQ31A5vydoqHTu69L2YT+YqEMFUcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2907-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:25:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e49a1d3b1so493755585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405555; x=1793010355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9sY3QVPyUK7h4K2JFOaaQnKCYHYUA7K+D02U/VBIUsQ=;
        b=QDDbSqe0UtLBWjzn79jpneR+bwXusxq9mR5NuPV6xj9eUV4Hn9RFGyg4dROKC17Ogf
         zSBktsH1LqHLS1wXwx1dAuUzh8zvVYNnapFstCI51fMfZtk80p+bBjomDsRy52WolsU1
         wS8gd4DnIIlO/pXbkMoV0/17q3kvjSFoM1rKr1F5P7uytxR8BOpZFwlBLITyUZeLixtJ
         mA1VK+lWXvluYcs4qu/hB2pY3Net58zsmXMajxR1gvnzOZVV2+ZBZfvZnPfsV9OdlAR6
         QK8UByN8IsT0JotObCuhkTbzp5dTx3s/YAgZ9fFxBEvgJMVES08hKrb5nvXc4DVfVVxX
         r2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405555; x=1793010355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sY3QVPyUK7h4K2JFOaaQnKCYHYUA7K+D02U/VBIUsQ=;
        b=u/hPmlFkp6hH5u35KUmrNM4XuBew7y306KNx35/isZtlYlyXZVeUv8PC0dmZuPMlzH
         VbhgPlOE3SSEpjvr954aej99Vcz8EShOQPboM8xAXSlDeXnd2Z04IS3JO3TNOVwXIfxh
         YoacTqyAdL5RAtlqRF6v14T1Ha2EUMUbQjd8l/Jx1CuErfcB1D8vBU7axy0HP5jy7Y9D
         sW/ye/NQZZdjuyIdI5LyY7SmJqblSV4Q53g4PS9aXHUjpHgHfz+kK+dA6/JmtuiLW+Tq
         mpUh71aQc3peHDYJ1X5HxjUva6SCqXNBTTbUTwrO4yqX0lxrw2ilbF59PbMbyulDQLIf
         +bMw==
X-Forwarded-Encrypted: i=1; AKwUvBzU/9srZZ+F5OaV8wEn1kgSegSsr1968KCEPgcjpvCJD48SyR3AzY2O1wEf79UP6WpCBKYirC/BomYuJG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK54oY+sz7F8L2058xJVhZlYkJBKUz+kDsZij80MxLbpCJ+8qv+
	oyqVrRd5LSZQiTjhBoUa7W8zThewMqva9pqyQMYPVaWfJuZVY12loKCMxU8NaY2leDxifT7HbT5
	JlGkODIoCWBSLTy1EeACzGMf6stC83YO3RnGc7QN4QZFbwFMQ1H5ngrfjWwZaDyKwqlE=
X-Gm-Gg: AYBFou0gYSI71Gfw8bcQlw2J9D5UqxDmu2fr9oIuZic5bAyIRmmleKW2kWymE1Yk+D/
	+NZLxbcZcMIIqD57JitBa9l3u7cSnEhUtYdOtnYaxzJrCoO0s/u/NjlGbtEGCSvgAgaO3jXZkiq
	pr6/E6SWofC4KAYhGDLjTBL8G5KZ28BKSIDdwQPSyrzNcN78UgN3O7cIagm+A+1BeDfv7HkMvZN
	9EPBMiQmDCGzZyGQo6d5AByhqn941prVjbghb+rTnOl9klVsIpjBBDKMxXshdM8VeEIRafFsMXK
	e4FIUmbrEQDfGH/86GWAGIB8KIdh48pIaTfydXEVRP0hoC4y68JxcOmIxb2VKiMUyzOL9fd9Iq4
	8ULdjEY97HPWX2C44
X-Received: by 2002:a05:620a:2805:b0:93e:c12c:f142 with SMTP id af79cd13be357-93f29e10c8amr1196529285a.76.1792405554857;
        Mon, 19 Oct 2026 03:25:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2805:b0:93e:c12c:f142 with SMTP id af79cd13be357-93f29e10c8amr1196525885a.76.1792405554347;
        Mon, 19 Oct 2026 03:25:54 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm326947385e9.12.2026.10.19.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:25:53 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:25:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Switch CPU ETMs to
 MMIO-based probing
Message-ID: <4zgjkqvgyezymw7ohvcpvwaj55sgxnzq5zkgaoslvtu7ace524@6hjkym4l7bte>
References: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX9WjkaNfOiuEm
 Zhg4WTWuUvgj5BD0dMkAxrtxXgXf8MRihZmYzhWm5TH0fTxt1cq39noapHK4uwK+QQsid+1ZiNp
 tBkzbFY+LR/YBBRXcBhcPSA5iHXGRYU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX+WvOEPjUKePA
 IpPsAQ5AjTax5tFbHW2OkYtwC0Q9nbsfhhck5f1xGVH/bgrEDXuYgpl9vBlLeiPjoi7/KMaWBle
 aFzqrt7FENTP5ha1tXaB70xUVAg5TAIapIYotL2rsyT0odessxLK0fZkZayljBXnSgD8kDeOtNg
 I2IZBRBejaDG4LdkSHYfIFftq03i1lPlIcX4Dit9Ln83N+oqIrFa4H2xl+VuRFO1OBJwftwoITE
 RcXgxhnF7PqPl7poLuwFDM4d5G7nO2Lk7vtEYW9SgJYtinIw0yMYGYPTH+ZDW5IFw1L8M+n//6i
 pDhyOZqymJ32KTltPKSbnOX4yAtM8GwHGHnV96GwRqNg0uXj77plI8+sZIjt2iS0JG7R7orVNH/
 aOJejKM71piC/XO4rutDEfqkcUsnz7LaGPAEsrgCoGTGRcTXeJONRNEvnuk3tg+K7PQ94aItAUF
 oCDNlyqPbJhpl6DCoqQ==
X-Proofpoint-ORIG-GUID: DGa_QTqUHwFiQk7DA0o5TkSCphOr1i01
X-Proofpoint-GUID: DGa_QTqUHwFiQk7DA0o5TkSCphOr1i01
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5f033 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jfv2SjV0b693ZNeubh0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 26-10-19 14:58:34, Jie Gan wrote:
> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
> but do not implement self-hosted system-register trace access on
> this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
> so etm4_init_sysreg_access() correctly reports the access mechanism
> as unavailable and the ETMv4 driver fails to probe with -EINVAL.
> 
> The CPU ETMs have a memory-mapped aperture, so switch each node to
> the standard "arm,coresight-etm4x", "arm,primecell" compatible with
> its MMIO reg range.
> 
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
