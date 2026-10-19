Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C984B8273
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405925; cv=none; b=S0db0Rw+Q7j+8QoigW0xQl6Sil+rGw5O6wtpp32aDgi4ZPypIwYDO0OGRydrJcZh1mDGedwJd40cJ4N+xzPP89U3oKouJ8U6k4VI/Aeh0A4h4Q+hIDR0MmriD2QHvowlYrPowSMTp7ZkTck6MW1WwlATt9REhbK67M/J4lZSTt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405925; c=relaxed/simple;
	bh=4trbUtUGxdoEwUCtKJvBBNIQl3//HqfI14DxYCxZ1JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUfL97srDQPFpBsVOrXhYcDLmqubMFMj6w/8aHVjTUdcoWzp5yqZ0IZ2o03nxN/+g2yVNKG47mNNLTwL8n225a7uAJ6hfcuN/wVccc1D6t3EiwIgYgQZD3TyH95fYFfyR7TfiY6wunmeTD9ZsX3VLbkeHxs8xt1xB/X+kvXmftQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERcGbE9C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A64ug3e+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERcGbE9C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A64ug3e+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8YmGo2688810
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5EmfudG/tQAKyrwRj4Laa20s
	3oN5QSBgeQVVbHVa7ls=; b=ERcGbE9CK/4fSPW/p7zn8UToX/Yi7ehIEyomS+Zg
	NTYqDCss3W9PfGf3Wgjcj6FLyfNMSq9FbZ8yTXUTnJMSxzRUwHA3EKzfriI26Jkq
	Uqx3J1pJa0ApiZLnyshJVRADpidW9+fO2dnxtaIdutAvycUdnR24TfJ5jBSNxdxr
	fFr+xuJW0wragQO1/aoqlIZBO24XeophYnUHOlaY71Q4h3k+SPniY8uiSH8lyF6n
	YrsqzhFxZLnIcxoeKGE2+t/+9OB718Ake761gYAH+2SIJ6l3jKsrUjmaaCe+gtdr
	+CKj3zZqYZX7ArQlF6D7Z0t1ujI9bZ5CazrfZjLrTfvBZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn0er3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:32:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1e62510cso477917485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405923; x=1793010723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5EmfudG/tQAKyrwRj4Laa20s3oN5QSBgeQVVbHVa7ls=;
        b=A64ug3e+eIXPqL/u1M86fEwgQJmgjdDTiSS0CusmvhvGpz4MpjeLSO8QDqhdf9LYrc
         FeI0+8ydiDPSe56K5y74QaDNwehJ7DijnzS/XnQMD8j/XvT3zZstoQ9cZrZY3vfkhGge
         CUcgbspS/QoE6y18unVG7b68+x9sY+7VCFzOH0lInLlsx1gc9ZakHKaIVXWTHKX+6iJf
         3i77bzrdidD3Z7z2CUSsB2YaJlZr16iydi8QJluIPqo8TmU2FwUOprkf0azAcDBjH39h
         ehXMcODrgKyrD5tUGfqZjgkrVrFWGSHCDYe3JLi8rXf9uk+C+lIuHvPTTHJzln5yM2cx
         uEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405923; x=1793010723;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5EmfudG/tQAKyrwRj4Laa20s3oN5QSBgeQVVbHVa7ls=;
        b=0jZKhNXB7MVraTqF3KLcq6vj2XH7IAWE1GDVPkj2hvHy6hSOOy8qujoOMUSQKaw4DY
         STB6LgV2nUVlFMMJN2Xx8hUsdJ6kD/MYJEt2MXlicG1XHEgMdF0fhuDfmfjG7M/fZ8fy
         NOxevxQI2nNAZeOVGqvK5dr88tokPTTQIxJhhRTS0ILJ3Iy6Xoz7H+3JsGprw9Kj6n60
         6de/RGgC0xpGbLHR8JA/JoCG5ibeQGwiBJmg1jlLnb3065aD6wi58xyedglCAehupK/M
         EvkmVX5oGivL0PAv6i1AGoPO3aP8tr5W7YtOHuTU1r/fO+rNGa8BLT751B6xxEf4feRk
         SFJw==
X-Forwarded-Encrypted: i=1; AKwUvBygIyUq0Wj1AobgSnDnLI9ZfRvkAdaUAm188fhB9juqYmRdwHwIzhgZjMqgUWlhV2XmC2EfojO35VhxOoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNPbPfv0wGbtlT6Wuhf/Maj6SApBze8g/Wm1uLw1DM3Cf8A1YQ
	0hyx6qPmtmRPRGhMP387tFhIRWhfEYOiWtpoCpf4DiOqGXlKd5UdyRPI3oShEwFR3dDGRmLnnC0
	9ZuVlgqmwou6YCwDSBV4/B4b0fKYHjKaJLAh2+TQA09RfcrCftqe0W65N1P06AC7gI8U=
X-Gm-Gg: AYBFou3qUT0/QVlNv3HzuEVzPTNK1VymqTOpfTZbmjD0gBuAngpkotz/gJ+vLw1JqCe
	ApWjWAMbLSjw+0ex5FHOb+f9Ktss9YpyU2+7Eb444HxD3SDM3Zure8w5jks/gRFrtJczo8pbKfl
	Jv9KOS0wTBbslcboA1CR2I38zIrbeBy51xjAHMR7ZtZFHvmZGjPsYy+rWIWz2iNJzvNuLF0yVTe
	3o8JqGk8d9aj1Y2NVbs7e7qzKM/hII/avD40nTjVEj8l12KbBcze5aj+CFPIBpONLI+v0wXb14f
	dZmICG529kBVLcqxkCri0n1E2dMTtkQbNDvEOLrMeOeWYdw5mXKzMdtGXEngQqsDPF22bOJ4yFX
	8MS3wf+pB+7rSlUk+
X-Received: by 2002:a05:620a:29d2:b0:93e:910c:5fbd with SMTP id af79cd13be357-93f29db8a92mr1174460185a.63.1792405922718;
        Mon, 19 Oct 2026 03:32:02 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:93e:910c:5fbd with SMTP id af79cd13be357-93f29db8a92mr1174454785a.63.1792405921989;
        Mon, 19 Oct 2026 03:32:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm22322630f8f.29.2026.10.19.03.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:32:01 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:31:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add memory-region for audio
 PD
Message-ID: <yjsxmoecw6o2guifj2kprmb3l5x4rqduo6hnvkzzz4bp6efghk@zssuwn6d36eu>
References: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXzdFIpA2ECIrH
 o5nrUJq358UAcaSGd0TBHrpW8PCcPXSnjCq24UdA8NfG70hQFxFosybHRwcW1CJ2inivIiPUQHE
 Yo8j9FONlt6taP7CnIPA6rawjalHRTU=
X-Proofpoint-GUID: D_NwcgoVeTW1xrG6kXgGdDEVQaUXxl0N
X-Proofpoint-ORIG-GUID: D_NwcgoVeTW1xrG6kXgGdDEVQaUXxl0N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX3iD8joGa7Dll
 3UojLDTS2TF3Iyw3lcR+ZQrjOpf3q4TM3rZKf8p5LI/psVqxuqUjj1PVvjHje9uKeL1oKYk83MC
 Rvl77DNwoPpm0sy/wZIpBg031MQ7vshIwXroBwuR1wq1myC/EH5CBiSh55hyYs1/V5CqlpYWpyX
 ZHbWcNLy1O8QSmAQztnRXys3h/rLioARqIwAK+veoayuvGwck4AjpdmkF5ipGPMvoWpSVO6TLuM
 Mp/jwldx7IJrtSqmu356WkinFew5OZbw0/s24uvrZPia3Z36Eg6NONq83stqXCRWO3JkjB0oOCj
 pErYQ9r0qQH/kwHtjAoaODT0dJLJ8SeTW0oNscfuYq8Q0po8Fev9nFmeFXytkG+hNK0Y4PQsZ54
 cY6D7N1yJ7Z5WmOB/DfTBnCK7IohwCbPxEvzhzBBnEpqriN+b8Bh+uSWqYWloHQ5wYLfYKfMrpS
 vKkiq5Omd8NJOFEnLhg==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad5f1a3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uWrXBvF99A4s_EMQbgoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

On 26-09-22 12:57:36, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

With Konrad's comment addressed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
