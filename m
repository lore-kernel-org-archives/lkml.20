Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52574A485B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820271; cv=none; b=lVNXYFJi7n5kV2/mEiUd0Rb+NcAQCl0NWTov0vKfUCtSDCWm+I4TYNc144Jqh5oFnEQ4YyVZEcBWZ1qf6YYOr4KItVoCcU/1iQWNIdFo46fpb866NxcCQ/yxPFxpHhQx+6y3tT65P8jKrKGIpAXOxKdetkf7NiKDpyWc3TqJNUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820271; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQWZZ5KuPYU7ddwNS3lkL1ijzbUO0CnrFqEm28KGE4a43klTQ32cFwFO9Bn50ZGcBv9wAFby/jZ9ZEFNZAEgi02osIbWiirXE3zMPfLueSucvaE9hP1pOdods7tUmJlbNDyEOEXVwnchQCB7QA6UPZsMT6pUM3ZPeIA1bqjBasQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkcLK1F0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8B/KrnB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkcLK1F0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8B/KrnB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFetjb1721967
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=XkcLK1F0i/Myekyd
	nGFhkk8BmO1bbcY80BKEqctlWEV7QfwzKS1a2AnxQK7bgC0Q/0LbSLGy9mgwhZgN
	1OcnssFKD7l/i+9hCrqF5ZXM1/S8u/KiCufxmh+SDFtkUxijGINZSZLDzzq1mmrg
	fBfGSP/t8awp+teyHKZyQ/x0QOnfuzIfPTEevCuZjRVQOCHl0dXgT0OTiO3dZlwc
	bT2x7GzwMAbF8gQApTPqQwwOEGXvC0TrIXouFtyjnHdrXKfbCOpDivYIjJu2bJiU
	hZe6/sukuUGdWFYJEOJ8CyS+ej9a5aqdluDH8/hRsktlXhUFXVb+d70zkB1tiE07
	u3HilA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dksyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:51:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530cd3dff25so4238311cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820268; x=1792425068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=d8B/KrnByBVn5yV1zSTqIQ7p8amONCliF9kuGDVDNdAVsO+1+P1xXCGw8Ipr2CYXb9
         SdfQ7U4kK+zOmfkj7bGu2fvlKZFNbJG6DFFnyfBb6q0YnOur1nq6726Q99iiVaMI2/2u
         6cTMLdQiszUVlAFuqWqbWQG7lqh68RQauNbwu2oeAByMuD56GNx7RayzMkb7Rk0UbV2w
         a1lsjp0ldaIcv/Ql6A9AOcXOdHHaD3PeBCoNcvU8jrAp72j3kyaZ2aptjMmw5l9JgKaM
         /gH3JVH9M8Flg15epi6qvL/1nelBHtmz7L36mx1cd9t4WqpsJr/QiAm3CrZEQaoNTVbR
         fVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820268; x=1792425068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=PkZtU7WhyuSMHz7fPVay3tvcH8feM2at3rj8DkyanZu/IhKc4ZX2WTSpGowwgcthyc
         9ca0f7/ikZ34nSKJrewg4S5m/tHSu8xENlZd4L4Bzl3Q9bdX3Valmsy0JQYNfHZtPdoD
         PbgDry/tEBByGxwBfJO9l+J6KTNMBdSKVci/8PLZ68s7TGqk/DwDwrV2dSz9yVfxx2/E
         S6xUaBEeEjzbjar22LY7mbWFtKc2hBgMwOPDn5Idm5e4VPnfBzJ9U2uv+Jc6CJk24mwq
         LEvzF+F8nl3gnzAMrJHfEgCYfofcTjL45s2N6xSqI4umGx417Io7jKotO6ZMedX2myyr
         oh/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwOwP0vhzQ2eN2SOSZLEzz6TG1kHa5+ZlDx8CoOqciihqHerNvHQRzp+vLgWmMlbEGL9M5obpfHAsL3pHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNpPCV8b/T6XXDWvFVU7nTWrek8X2T7bKwFJOXhiGt+2z3XnKv
	hSPObwypIcmTTYKosKczDIDqKpo1kCwvCJybu2A9yahavHsVEkkSLB9SKchxT1cX17rd80CJfpM
	Yj7rmii/kPAcH3+7syFVdga2kRgon+iI0eJvMjJVTXbjQnFmEMI5+TigA3IB8PgE+TVs=
X-Gm-Gg: AYBFou2ipll05zzJ12KclIEp4nBdq3Ul9LqC3n3UxQYuf9OlSqfHk3PD23i8b13ZmSo
	gh9UmfifJYddI0eX3c+98gBguB4XfDB2im37BO9mGm6dMFRCA4ogOAKc8L+ov5ZnpZiYsAcRRdN
	9oCLq2e8UyV4lubR8e+Sx1wy/KA4Drx+i/T7XOkZ4jogd5O/xgsN5kYf4tAg0RKPEudfm3cwFS5
	+OpJwgC/gw4U50Ft8mcjAVj/RHydbEEoLCMVejCxXUPrKlKCVmcqubbMh47tvbAMPc80JP2dXQ7
	h/zQvtjK5syE+icG/UYLE+LJ6z7A89tKWwP05K8sA3SIQRHGYhkanrp2YeWxTblGXheM3kDC/0Y
	aLjaw5BEc1VfRdFKP8wsGMw==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1901853385a.5.1791820268053;
        Mon, 12 Oct 2026 08:51:08 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1901846685a.5.1791820267608;
        Mon, 12 Oct 2026 08:51:07 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm2043906a12.12.2026.10.12.08.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:51:06 -0700 (PDT)
Message-ID: <5f30e6bd-3547-44d9-96d4-80acd65d5e7d@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:51:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/38] arm: dts: qcom: msm8974: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <ecfee840a4884f277a73924d9da6831b85269e26.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ecfee840a4884f277a73924d9da6831b85269e26.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX2L85kD+c00eI
 7y/AfLT85mg/brShF9W2gaOh52kzBF7QH+oR1RvApAZGjMKOT4tFZ1bH7HETPSHzGDHpH/JbvsB
 KarExlMFq2wSNouQtI7uaJlLhFsbneVQbHer5u0L9AFA+O8ECoxI/vYMUP4qasY2if/BdaZsxyh
 3RRTinYxy73Mvs6h/FCCZDr9wMDR0UsWGKEzge6zI9aGUXOwM51BOWAXNe7tRNgQNmXoeUX6Cjb
 uD0ssoMumsFtZl8q2r9AD9N8BeFoeVWjDdtv7v3th4F0XBdXSW0TWbdekXX84KCO2TfYBRSaa8e
 Lz1wo2Ufu/B4DH3HKg37jnQ8VHWR2qwfba3MOGoXqFI7XKZeVyXuqN/5nEaqo1L/+jCe5hZu+XJ
 bQ+l2/LDpFO8+lxjX19rKXBVWeuPwQrj4ieiV0YIFz7qguaPkKDq4QAwlEv/G1w9iatsYaOxfkV
 WFml83amJO4vg92QW4w==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acd01ec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: NqHoCmJ54IqGirZQv7f-D4pYNwF2AjWU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX8viKebwySS3q
 VmCOYdolnmwo9TpQyRZy629HBrrZd4DUSYFnUzDCDfHA4yQqDaAoC0Tb6HZQjH6thEJGyrjekj+
 AbfbUQZY4k2VmHMGWw7yAkPeVJkG4xA=
X-Proofpoint-ORIG-GUID: NqHoCmJ54IqGirZQv7f-D4pYNwF2AjWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
