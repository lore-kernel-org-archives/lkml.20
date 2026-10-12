Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673FE49B444
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818540; cv=none; b=owMaLuoV8e9JAHLgSuicXvJYn+1jamW8JxmFMqMdeCP8ESoh0MIwBMvG5RGH9rwhQw6TD1e4c6Hebukn1IE0C7M+4Z1YVFUUfI3Jl5M4NylRttiZjtdllCxZj6XWIQzovxM2oaTfT1s2OfOm+U54OAE0oRSoo4KU6UTPELqF4pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818540; c=relaxed/simple;
	bh=qUHymudqOxW+3gFMXOSDY6oK6hbQI+WbL7Nv0bj65WE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fFAfRWqpYqGZt16K1JcFycsnVcFXMjnogWXK3etxA1eEqkQFVDaCTMkuSU6NlTDZbBnJgqsfnNQAJY1ayE65grBKvNBOKcJiB5R+OT9YaDJZ7pIFLPgNBm+iF/bxEhzXilrgH5haLs93iZouanU4gCZwEwpcInDS60GmWiQTluU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SccBIs6D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XC6bOc6S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SccBIs6D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XC6bOc6S"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0C6Z1686429
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ea55xuV3lMRyuzouV+ZXNafd1uMXXbKmpclQk9Yn2PA=; b=SccBIs6DECs4Kq2W
	oHzyREKn3F48Fg8gkF8EnueIHU9Qzvlw82xshElEdbw1kcuL+o9iSM4QyJe+6Ee0
	WGzfWSYEhTjb6Ai2kvRFtJvP1ONxcSTqURzoufPMtSl5DOuu0vjKXFNtYRXskOXQ
	V4iJKX6Iy9cfEe34Zlu5CsJ5v2gxYXofFuVu4UVM+awbPvmI48c60qtj7w0lzApJ
	xeH3S/iB80DGTfw3VkbJ7nbtv05pru1Ku/4Q0pGLm7aRyCy3Flm6PWmOk3O20zKo
	FVlzbcGUJiulq3Cn9HZEbJW4Rm2Y1AJS7KwEGtjx81QJb/U/ZJqv9bgcdnwnCLdr
	UaqvLg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1f29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:18 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5de7ad7cdbfso44095e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818538; x=1792423338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ea55xuV3lMRyuzouV+ZXNafd1uMXXbKmpclQk9Yn2PA=;
        b=XC6bOc6StbL0muNeTbzD3xIuPcE77jc1LJFmv8M1uV66JMCqYyjG86yKlITFI2XW0l
         g5ARfHxFT5CCaiXwsD3crIpc7Mc5locrELVyiWkoSFuSZ7rTfKwfo1Ps+YWY3/1h3uf9
         1vYbrFmAJz9EpAXWQ94uS9SkRzDVp3BiqCpI+tadaQCq92OmHSXsDRWUx72SuAZMZxN5
         49suDjK9sEEohxbFpEjTAgdX+PQIZEVrbSBulOz4tMokPwGwFn22S+qLQKDAJVC6TIZx
         ie2Ke6WF6d0bkx8dVsTvGYBbzaMtdPRFVT7VolS+TEl6k24vVEHsRzWkDX34as62yfcF
         q8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818538; x=1792423338;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea55xuV3lMRyuzouV+ZXNafd1uMXXbKmpclQk9Yn2PA=;
        b=I9E52KinQq7YX65IEWjvjs+dCQbuKwY3jgCQLVowXSdyC+ViCm/iJc6vMCuRyLUBfk
         nDnHvUIx3y+sCwoVPSEG079+uoZSIzPNcdqlqW/Uu4kUkcV25+wUqABtrankPaJPwt5H
         E25j3xYi7u1N7pq4J57CqpEhGreFF4wWyOEU5ehz7arkNgM3PKROcTAUkKk1Nv2KjgCC
         XS0jW59/UpEVGI2Psq3QRPk6FONeme/XpHlstLne2hu5wpuDoEhzTWFHHdrSFFNw57Ny
         4XZj+57DwS+rDjzbaEiUNKcv2ZfbrKoL780EORmF9ApTHKQg0dMR95ztLt88QJdRwkrl
         IMXQ==
X-Forwarded-Encrypted: i=1; AKwUvByXm/IQaREBEmpQMoZpnnyjX0PGgmPlixBy6x961Gf6IDLzmrTfC0tbrM4qawcqOd7y2vfCP2FRT8g8tMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYs2CI2Qnk5uBReuXMfbZE0Yu0d6FlRUVEBLhE6YhknVyWyCSx
	g3SaPQTfkRhk/Ijf3VQxxlWkV9kMuvY8Oby5lmxrV21R1O90Lkl2zuKDoukC3YAMMcYj+b0pg2e
	bG3L32PYI/Tco5hCR0pklJpMZDojfNUn6aWCTtzGQBvPBR4Odt/ozIbDpNwA456uDQIM=
X-Gm-Gg: AYBFou3tyaX2xuz69I46NLMnG8l46WEH11nyRLQNB6xJLs3Udx0Okwy3meiqCsr4Jrg
	3ZyU5Af64SC19bfytNVOXb6Wb5m5Vu3lXnYKnWJtzTJ2JXIHPwOrufyUaTlO3ojxIs6aQppAbpy
	XwOq+QHyyxTsYEjt4uOz09afNM2/ODkqwQgcgbL3+HW26qFcv5XYiOqNw8pKcP7VjaZyqkN/6fu
	FbdlJoCX/djVAckoqwdn7zI+gNqpevbj6XDPapeoySDyGLU0/VTdqsOF8G6ADf6rfBZCtX3Z9d5
	Al7qjmL5lxA2GB+KLB+Hz9bH/ZoVsWevarX9nGQ+jBI9y1DnjZrjyCy+D3ydvtKJ76EE9VgJQdu
	+q9d8fo4OxrCDmm9/cFIzUA==
X-Received: by 2002:a05:6122:8111:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5e91efb84camr1972688e0c.0.1791818537609;
        Mon, 12 Oct 2026 08:22:17 -0700 (PDT)
X-Received: by 2002:a05:6122:8111:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5e91efb84camr1972643e0c.0.1791818536862;
        Mon, 12 Oct 2026 08:22:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm478161866b.38.2026.10.12.08.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:14 -0700 (PDT)
Message-ID: <23e3afd1-2aa4-4b49-bb47-3627792a0a7b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/38] arm: dts: qcom: pm8921: Remove superfluous empty
 lines
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <3ad783a0b4f1f51e801b7c108df23f5b28893f29.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3ad783a0b4f1f51e801b7c108df23f5b28893f29.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX2xIZs1p1Z5TJ
 5UownXPEfSFGRp67g20Ed/KeC6f7WW2Z0IMGHK75mfBuJSnym9qm7APA1s/yN7py5rMeYHZnAI9
 d1uSckVulwKxP6DLmO+Q2zbturfI/uA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX2XwNv6oAUQws
 HZzeIyC1qOexDk46kCRb4T9oHnARncQ6Zz7HlbLHDNop6hJsvIZxkyrRF41zyiKP9+vAKl8+j4G
 8rAuAJdEmpR/DCLHIpZ0HAX3Xt/vxX3azcIUwj0uDIHKvPWDwOnIZdXu/fXQvgZv50or439NNUr
 eTYJOxlm36t81CjN+OirPrX9kW0UijxYl0o2w2VqfnH+s7c4OjIESyhLbKB79b8q1Hj4G8BFEMp
 yiW8WI2tblucLGnAcJddWMDddfH69Zf2VVSkv001sbl0D/Gop4wgITvNePXyUQ6UrNUEDyW7e3Q
 NDwzNiia8d7qaguEE8c4IBIF+eBqMkGZT2Qlk9hlU/yjP8ivs6uUkyJsPo7ShL7JD4rb1X+Dppc
 DO9bb1cE++LwmmboXnCsxqSM2dX6D2lJgE1zuzeYLj4X81LihaQbM5Qw4wfef714DXDFg8XwmSg
 1l17WP4wL6voVTdnmMg==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfb2a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=YXrApte7LvgGaje0e3AA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=hhpmQAJR8DioWGSBphRh:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: 6AQYwaj-zwA-fOUBDJ-e-dc5msM20H4d
X-Proofpoint-GUID: 6AQYwaj-zwA-fOUBDJ-e-dc5msM20H4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be a newline at the start or end of node definition.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
