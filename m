Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577190;
	b=yLXDyfHQ6OPIpe+pW1DdpRtpGH8JbbEtuOEUcoBNn4iKU6CEvFSxWs14T785/wwd6num
	 23NV39siA0qcAUrULhJfiGeW+JArhJTXzuuvcCYEOFE0RJsD+mPNHEv2EM0Xg8DqY2Xbe
	 Xkc4qI+ltv+dEOQIPrP8fTOxEOQiiCAbFxaCJTYXo0H2PziGiZQh13iTgwAMDwFY2dDPL
	 mOOVgmfo2oXJvG5F7xednGHqRazVPxVv7MxqIu8iFdIM6TfGoRT0nSiOXdTervAYQaQW1
	 ZTgNNHb00EfWjJegUa2B3u1fm25ObO8u+U38fvCngoytMs2zP8asg26j3iLxNLJv3MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7L7auJZ784UGFaVop3WOyp9HDXHbqOIgfmUYN5iyHAY=;
	b=fhr7pz1PGYMzCddZfvZfQAgbxI6ShvdmcPiiRogoq9byN18XbSWryxwDav+0kw2UFBbQ
	 +Fh5pSerpAplkUgMcEzvGve1aR5JVFXCtEG1V7esGz6TBvqWy0AgbtrqJsYI453HwcRRR
	 jeI4xaJytbgI6fb8RDBv2AR4wjGpZBJUnjtMgsGxPg4nLYFlAZ74z93Kc/6qI37QZQeXz
	 FjJ/JOlUXFeyDb43gzRWOBFdm9wBB6HB9zEhvmwxwKhOqoFKKxhDmLkNHnwycme0CEl3w
	 pKu1cBRBvWLCed3Fu8DJFsqe1nGh+clVHSgxTGlTy6l5AdI1AcGsGu9qT6P2bDmvGaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aF9HjXVd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HllQlJEE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DAC606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52DAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aF9HjXVd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HllQlJEE
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA63Cf768661
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7L7auJZ784UGFaVop3WOyp9HDXHbqOIgfmUYN5iyHAY=; b=aF9HjXVdVXRObLw0
	WVXnKJimB7hnAxD5r4fKqgXYO2WWVp2aTEziVkE3lkCzdXPUEgE5FvlCgn063/QE
	A90+SCuU+PWIrl9x1nRHh6tDuA7OHgcrvnh0prwFpo+pQgFvuiVfgR6tdZA8fw6V
	yYN8c6hSXHsFo4r18387JA4r4BpAkwKZalZVydNFDH59Arb9z8aBSOsMRwvw3TgW
	utr5OmxzYqCARN5j4zG5GX+jiwPqUNU7NsX9V1H5/FpCMavOGQdvT1BLLHQiKcYg
	Co9pkU6K3Sww8JATdou5694XVHRQ86q33zcpH1+8bXxqri4B5QC3fgWV8Ev8MhnF
	08/VBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02m6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:06:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso8402785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577188; x=1793181988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7L7auJZ784UGFaVop3WOyp9HDXHbqOIgfmUYN5iyHAY=;
        b=HllQlJEEGBXNv4i94MKHJq6UGTfIEW0H8kYbcm6/92LkqFCk6ALqDdfl1keHWTwDqT
         N3oQY/2w4OK3NhMm+Ii5lqp9nq6Lr5PrZKqXdQBkL1ihFy+ZhUolw1QAuWfc6I9fM0qT
         /b2QTfB6JuS3eDQJhUCLnXYRckLMgR3s86KDUNKN74+BFpdBsRxuPzozjJrk9iAym3zy
         dAnTMUcQXG5H1VxjDXxHkrCsQSvCT7snTKks/toXcg+t4+aOBK1B+Os8CaswWBSbxWIa
         fxdeTXQ9W4gvzJg84E3qk4/lRnWc3VUZcs5NLtc7Ln8Z24dOAa00MnFUFYOcN+VACO7+
         JnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577188; x=1793181988;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7L7auJZ784UGFaVop3WOyp9HDXHbqOIgfmUYN5iyHAY=;
        b=UkEEhvWeYeKnEX3lncoSZkXuSVho26p5RpteplSjMqSIZYqdB6pURlbBXyF5s3Woqa
         LyMRq/T94Qf2m+Q9gK9sh+g6jFC+1d3K+2yURm0jwQ/APuD+6voCO/OCfYfQesh1doAq
         TOrzhnNPvoh9o+K3lzb0D6v3Y5vLQ7yG9bkarDl/2VwFEsjFxasZ+59sklpA1zppBzKc
         PWpGdV1FS5pr/70eWc1LmUQAw1mgESbpEj3h5ULHFFC+PICc+vlY468n5mdRMcAnt34j
         dP5AMYHVh5STeJB6F314QSYKUME6jrim+w5O6o3o27YZA6cwxiq+41yFJJ/9pxtgCXID
         cX4g==
X-Forwarded-Encrypted: i=1; AKwUvBxohK31kU8vzOHr4X3OSa3HKVwYRZqvb7hbI68djcFXYkMYzRHFGOv2e5NCgEbxDYYBrGEv6iw6fy56KEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWg+Gw8C0stUq5l2LdMgAuJm3NvYf/kiV0YWx0q2zsobwKA0t0
	mMFCJ2qK4yWBaWfcrW9Z4hUzphpMCE3SRF/mhmwKkv3WZhJVR6vQndW1F6vRS7MKXb8MPciF89c
	5FTHNQy3ILTREkqWdnKZMcQHF/rXBRYaL+AJjlkdXyzrFHqWlpkfM0v92mBZw8mK6q08=
X-Gm-Gg: AYBFou0W1D2L9t50AuOh6IqU8ZHAUEzeP6/zrzVxM2v14DqQMue0X11t4d9fZHJICno
	odwfoBlTNTl0rIniweQfsSpBAJxlyHqjvUVmRV0AyZP33KTTsT0M+vJVPQBO5jfsw7mIhROg6wr
	v2jRKaHVLfimJHmXiEfjmyDWrl3t37sbMATxHja+u0iNOacWl68G1u6xUiedB0EAYuCUqgexNL8
	gqweVu6lw4PTpMHLestMEz0sStYYGYysrmb5A5qdhzpoHk6dwbITo6y+/+Exc7oZMftoB4XBbqN
	qqWLjd8wbQkQwtRpNySghhONJa+JR8Po0xOAk5R/SaJNC2YfBnIFqrrogsiql6t5MGKNlcZ/0qL
	Up8uIJI9Y4ytjZheD7iliew==
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr354620185a.6.1792577188377;
        Wed, 21 Oct 2026 03:06:28 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr354616485a.6.1792577187926;
        Wed, 21 Oct 2026 03:06:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313258dsm679293a12.28.2026.10.21.03.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:06:25 -0700 (PDT)
Message-ID: <2196fe69-b520-4d1f-b04f-e32808b689f5@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:06:22 +0200
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vishnu.saini@oss.qualcomm.com
References: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
 <20260922-edp_overlay_for-next-v3-2-2758d46ee174@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-edp_overlay_for-next-v3-2-2758d46ee174@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad88ea4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aQ57efiQKxvF-d_-SPoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX9OXEtYUatK/E
 Xg1bGlsTV+nDbK9kHrCZZqIeSDFxxjiFBJpgeX562Aeax9XkEFmdgW8a4M75FD3EXWBAwFiare/
 5GhUwQrltENP4Aj1n6ZHuW5SJeOvE1+zDScliuqcjI10unTvbPyKadeVt3vC/kfwAA/vQNX32S+
 BJG2MI83VCW97fy/921EmtJ5BWZkK5PpY1fosuysZ84SX06LMRBwt2qw90a63OIH3IFyYzMsBGr
 bMK8d/OcL410LQAbzg4EJOVdOCGNirzeioiUVn7HzzqOFYUY6zMuczYqV59YUDYqA74lPcKh3Po
 fEBgxRoxEqr+Wqqj1J7dfIRt/aw0lcdIa6bP6ENdV98ONPc0g7ZpMCAKUjShLuOsO2UVu1KNitK
 J+b4yadZrG6NC7ftggbbJWruVtgKMvZmEq+VkCi2moYQ9iNwuBNEdEQfyj8/dwQHVztwObFEGKN
 kHOIEBBG099Codt68LQ==
X-Proofpoint-ORIG-GUID: hk4vGhMwVhvHE-a1ufjZNM4RoDPWNT1x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfXwVSCSr+yRk/S
 2kURHMrfZO4l/r066yxNVa9gPtodQcP4d6xnmHq9/YxPomjMqDiLWpvY47uqtBCOi/1kleD0q+h
 OG/X6v8a/cVyATZDYZjbIthwP9EAy1U=
X-Proofpoint-GUID: hk4vGhMwVhvHE-a1ufjZNM4RoDPWNT1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 9/22/26 12:42 PM, Anand Tiwari wrote:
> Purwa IoT EVK variants are available with and without an eDP panel.
> When the panel is not connected, DP3 is unused, but the base
> DTS still describes the eDP panel and display path.
> 
> This causes the eDP-panel driver to probe an unavailable panel, resulting
> in AUX probe timeouts and missing display modes. Userspace then attempts
> display commits through the eDP connector, causing repeated DPU vblank,
> frame-done, and IRQ timeout errors.
> 
> Move the DP3 and eDP panel specific nodes into an overlay so the base
> DTB describes the configuration without the panel, while the overlay
> enables eDP panel for boards with the panel connected.
> 
> DT overlays cannot remove properties from a node defined in the base
> DTB, so keeping the /delete-property/ of #sound-dai-cells in base DTS
> where it takes effect.
> 
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
