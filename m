Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577117;
	b=blgH7uQwLUI2DZ0m+sDXrIA5VoId/+dq2d3HjaVhqjQmF+1yVaGbFWSaCGEnEiLJEMGZ
	 ncjox6iR4+bVjdglWg1hX3Xo6jwsKesSI2hBvsgI93F+SSq2/eRTjEF1JOIxFC/4UbPEj
	 utDOmmZPa92ZvrWnIv0oyAkirm0NcEOVvqBvHjDxRn+8GtBmZHJIfPl50I9J6xGdE07IN
	 pYNMk1+yLwCP9BjjavM0wCMe1Yn9FjffZ2qiJckpFx8b7JFx4VxG17gr1ZEtEXC2Oiac8
	 EyOXThFROUKKr1JHiD2y9Xe8h1uGi0jMGTfibDnI0XSza9VMqOnrS+1vmYJxzh9AqIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577117;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3k2GQpfyrf50S1Og3Onht9ZyUhGxFZcHms6etOpKY5w=;
	b=2tLwaBbbEGGa5ZxL43bOybX/cKom8zzU2UyAmmExJ5YHRNehl1qlYcqgBROvhlfC4g6+
	 kNz2o7g4XBLKyPgkgilIl1+YaQyUC6nExH/p+Q1jndcwvvTxaH3d6foYxq1yqyo1+R+yi
	 v+VjNiuM9WvPbiQKRjqSoAz0aRQ34n7Vy7/D6V2zRLLBX7KNrHBD/o7rC2KUJjasNtPkS
	 T8BVA7hsjKS+k5cZvFL3Q7D75zfrlABmUZ/JJFH8vkeP3tbU1qHMi7e5areVxY3bONm0I
	 +nlryPDyEJDygwOu8IxjFeGATqU8xlGx8kENSUy1ZP8RxIJFuV9vMydFMu0VNaoFyKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mnha30I9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JQKA542l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885E9606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mnha30I9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JQKA542l
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jOWu3573321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3k2GQpfyrf50S1Og3Onht9ZyUhGxFZcHms6etOpKY5w=; b=Mnha30I9XBjqyqwa
	VwBDAkT63M1Sh3jOTM8rJCKL3Fb8ryU1L2SsZ+sfKA1wav03soyvan2ILjpvRJbL
	smBfLJAG9M4NqKlaAXTpNUq0IYe+ZeHukXEMfTUYnx6LNxGR0AIpB547ZbuL391B
	Ae7vJrXcyP0qdePMxnUjEJV0VCbLEoP0tlG0C8h8jW4IXFTBptI2g7KbC+BA/ziE
	mDAPFllhzBn0pu69kMi/0mqnv9kPTJbvcHc/wNZSZWcK2xGNM00tPe30iAZuIKx1
	5U0/DbYfyci7jvveQ7TRcMaf57EiHmpvRMwd8r8ZrbDmPWHJisLeQX/yBOsFZLXn
	50GC7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hucgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:05:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so15723385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577114; x=1793181914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3k2GQpfyrf50S1Og3Onht9ZyUhGxFZcHms6etOpKY5w=;
        b=JQKA542lIk1uORq0LH7N+aPMRf0R9FTN/BX2xAP/PXiV/Z79LbFAtQ+iLqSpPvUJPB
         oEiK870jvr6fkEgCLlW+IItGldYNb7BMNj3gMEomA3ISnsGw0mXW5yawskYE5jq+J9FL
         lcZOLdVUoJ0WqC8TOQgBZQnKlAQIKMKvYKMsyKV52i3GSIbsLQOflE47SUId1g5beVJn
         KToNfBUo+sYWbBqMWzrNtmW0A4+ptITimGtNzsWLtyIM9besU8by7SrS++fvpxjj7ptJ
         j7cpzURJgPbhumI0/HsM1hq+inaczRtA7rx2c3Mftd9qEG1M+1UPgjAdQMhtyQ/jy7mz
         bu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577114; x=1793181914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3k2GQpfyrf50S1Og3Onht9ZyUhGxFZcHms6etOpKY5w=;
        b=hZUUSFp7yEBYWvY78iTQCMSpClxGQ/7uCko9pbn5kySOy9FeoL31jZbyMtYVtVee3S
         a/qlU9PkXs6qz1/7cVp5kI8QouNkkeRqoDUzJDAwN2jul3KyfICdGHesGxjjyW+HQoYC
         t7PPMMxipWY9ok6GdlfE5tnB1iQflqf1e8dBATGS/MMWxvjDSK1JneAri849VK/PzYr5
         m5icaG+e9LZ3h1xZjdYJw1qeU/uYnIel0WZYzjI2rHmCCSnnhlhIsRl9jk00fgqBUaSl
         r4n77ERNpuAY36jdHINrnsDODdMO/yIodrpo+Xh0zdLLEiZ5z82t1ED1zKBNDZY47g4G
         9dzA==
X-Forwarded-Encrypted: i=1; AKwUvBz54vaDCaC1eky0zJkVLaD6RDumZcKVu7fcqJY/mZK412lXyPl+hDyzJxp/9BfgNd2uUi1dpy/AdAYnLn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpgr4XfDBSg94uBetN9EPThPEEziU058Uvzlz6xWmgktm08vEm
	qIHGD0nM6c3u7ED/husUq0ZFqhStnLQPR6czUfzV7Ls9oq3gZoRHATsLk8E79rk69cAer5Q3Xnj
	OlA3TkLUEZ1SiWOQqTXLmqfMwPou5MZhl3eInXawoWp+fQPgnNrZ0NF7O01pJ5pqztME=
X-Gm-Gg: AYBFou2xnIPVjuUKUvOTbxMrCq2sy8xciNgEGxPIUXDa5oRRpRBCQ4y0gWsMnNAQ3W+
	hZkQuWlpZgX3B14wt7WZuZp3x4lHkezsR5Tbl5JE+ldRIiISleweBVmVlO/2T1enpZsRIW+2nuh
	0kb4Giy38GkhuswVe857c/XBXcFrDImL5xc/5Zeg5sWnyw7yv5luPmyYUrfF7kkI387YVDLWHeK
	keobdgS/MuDtHBkHuQx5r66fsm82gKzA4v32NRn9lWzTIPER/D1YqD+bxVBvPyJAzNtAT601D/8
	yuvsfiAjVYV+/NS1Yf4W6d1ec9tFj+4CljRy/5E++QbRdvnle4BdG1/jL1NPyID8MtZupv8iSQ8
	oC0P7g5c6bRF9JZbXQFxYfA==
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr365325685a.5.1792577114355;
        Wed, 21 Oct 2026 03:05:14 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr365320585a.5.1792577113705;
        Wed, 21 Oct 2026 03:05:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679005390sm59881666b.70.2026.10.21.03.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:05:12 -0700 (PDT)
Message-ID: <aac44711-c2b2-45d6-896a-540aba9e3500@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:05:10 +0200
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
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
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
 <20260922-edp_overlay_for-next-v3-1-2758d46ee174@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-edp_overlay_for-next-v3-1-2758d46ee174@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad88e5b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FpWcO8zvdDYuGJGNxnYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX6H4G//9sc3lU
 bmqTmQfbCqUT5VbCXNV0VsTVlWa/eOMcECGsNN22bo1p6k5K92vay2/MR8HN5C7TWivkVlPSnrS
 iaFrw9P5trProJqkq7AORnLMZz3OA7o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX8cgTj5Cnzx/8
 +77tbg7y/GVX1pKVLybjcg42omh2tmob9Nr434VpOfY/Z2yy/TvZtVmDynQGlyJ02x/zYtoPNV5
 GD6s4IyRM4Pt8bchBJ/DES1NubnckGpJLhjkaXIYxs8E9fbF6n1O2KaRLe2fExhBTLCkkfjb/Dg
 mi1WaKVlMSu1gax++uZq5oqCEeDwRUrzB7Tngz2RKgKeMIwfpT5TfhtxCBClQevOmidHAPkX4fN
 wvPH+ma9uTM8ixZsWYcAsm1cJridFxlFDQnbgArDK34Z4zAQJiP/lvfn1WXPBW460svENDCHZp2
 0y+Dn3wdAKduIjJtl2Gh6dwXj1rr/goU/rSOpzQZ7QLm0lbQBqrbZky3Eo4c8SWgN3bO/wieEwG
 eull4kGQ2TcVaKngoPNgfwmZcfrAcp+bqMMyKlxvbXK0iB/OWISyOKM/hM0C8o3Bg08jbL8FqIB
 oPvyG8CjVSxLMPeV12g==
X-Proofpoint-GUID: 8mkk688kzxidluB5NQbmN3CILeAb3U_m
X-Proofpoint-ORIG-GUID: 8mkk688kzxidluB5NQbmN3CILeAb3U_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210039

On 9/22/26 12:42 PM, Anand Tiwari wrote:
> Hamoa IoT EVK variants are available with and without an eDP panel.
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
