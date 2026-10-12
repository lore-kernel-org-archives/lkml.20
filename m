Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74049496D3D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820264; cv=none; b=rZQ431GeCc96LnKJTGtNM7KeOBtDjIcI0/2bUZD4KAiNvi5DsHXADe/YUBVTsEqKkfLwPwGEYJGzJPiibyx04hPfo+RvOvgOCYFDzN45KTwQhjpFXcPFjodeXxyi0KDaT+GXNpMtEX7iQ3ETdzWGjSfGVPVCsMF4e3eQeHzcSOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820264; c=relaxed/simple;
	bh=b4y/kM9nQQeiicS4RTPuO/cyCI6SZtxImdln7AP0eZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQOppp/wRIeWE2hy7V2v9B+LFHU3xXg2pVj3RQhR9hmuaL0KeZTTgM6rIQsMW8Fg9mcy0T2h/5ZHlRQDVEnxfYDN23AB/djJ28Z0qpjslTFaWgAGvkz832UcxuJ4PW23DGFCzqUVNs7eTRJX1WMF0NNO8ZZOrkcCAcJ3xErOP8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgnKMsfR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDdIE5Bw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgnKMsfR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDdIE5Bw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFev3p1895521
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=; b=LgnKMsfRmMGGmS8G
	ROI0RLnP4v8Z8mPlbD1mgqYJewbFWdzNTuPkCXc16FYH2HH7LBLrJ8ygTVE38SPS
	9wp+tfTiGrZAURct1c/AJmPl1j9LPova8wtloEdj71qJV7kGpD1Gc8XdA9IcVkl1
	/kvxltAGkD3oPMXmqP8RCVPaKtiexVrFvy+QqvC6cm1kMQm3B/LrG/lpgyjVMMV4
	2iOK6R3jDXW5iI3TUxcRhrOOlVqWw/fPDM42PS6azVoXCakAA9+1JA1Tt107ngR/
	8nLVsNqbMuHSXjlM28sZR6W6njyAGW+Y5yJCCn3UWtHNrxl41MzzGgLN7Qi2oiCI
	m9oc1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kswfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:51:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso28070285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820261; x=1792425061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=;
        b=dDdIE5Bw5KCYNCII2fqcPoiD2m9yHgRgmMzLijVd3fWPDE5gCWwWy6L1VJwFJ9GnoT
         2lzosVxG0hRzK8SGFvl6uPRvncrE7wwSf676LEk+Op3utkmTYMtEMwMan/ndqDVk2J75
         2iBHIPsUpTGD45c020BabrH1J9lnQXOKguy/ijs8qv3DTBxSSD1V+uuR+T3p/z1F1Yi0
         nyiz+ggjy9SExQC3cnHxueMF5DP4vgs2jCd6T5RFT4ngfvbm4Xsi+LyTphzqSWWtEAXS
         4Ke9rogvn3DMUGEUBu6UwVG4QAzNPEHxHAB55a5ygEiqkuMG/cMGAg1ayH0xEXrAkqLw
         y3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820261; x=1792425061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=;
        b=xTQwRhQuVy5O3PBh+1S7KivNV0iQtBn8nWXPgFtzvuSI2XehtwhXKmQYLJ00TlGkUR
         Dq9v1MrivltvYTvJFplv8J1q2tcOwPOJxSUKbdtEmsxocc1nOm/+DjEZxZM0JznvL6gO
         twT30b3oIoFSXX3G/4bdhoGiJdNwOTyl+BTlGqSZrKAVc8zoUT/ZGXJmjwmxNZkYP4rW
         6rSb33Knx12lE56uBPeMngZJLk/5DQy7PoXJuxAgkKwz82hu27nFdZKQJUBsutg64ofp
         ANKxDnKvlQMJbXy5BJkaEOjZuTWVlIc5vZYM+RMk+ocnPxdo0CPeW0pwBml53izMAAQp
         8DpQ==
X-Forwarded-Encrypted: i=1; AKwUvBykO8Dg3YhDxT9CZR5IKZZKiY4SKAyyQHojJ89p/5Si3ObT8ZXxwYDYcbuSrpKMuw5lCOUQRaqlseIhooM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAqMZk/syW3qW2DXKv/6j3ghTqGk47GuydJFv+zuoYxqaDPynF
	c7LX5ZID8UHU0/IZcGs3xle/8KW93FKd8PVVw1eVL3JjUDszKYeZLuz9/u/oDMY8BhgQOuu5/9y
	LGRVHrqTpDY4wrppprnK92i3Z2/o1CBFSFSi+G7TzXDzADllRjudE7O6TxPYIoKCBLfI=
X-Gm-Gg: AYBFou2uMwXd76kw1JTzYohxDQMwQLngAqnQIJ5Q4wERngIIbb5mPHG17WBn3b1Jin8
	EeSKR/8/RMnB/svdedA/A8JOQ4oRwynfRgCUfnAe4llOOjB6oT2DWDKartljXQJ5PJlROD7j4n7
	KEz2w+HXP5SN8MdrbXe91/BYJ8fA8CYw1j9PCoeFEzyGLZ01GvddfTBj53wxm7JeiO0FeEiuoK7
	9pK/DOg3JkuwFk6BirCPsDR9MVn4wWBvS4OnpXeTzavK4GkSimONJlJPcDH2lK9eCcXXwlDYkA3
	QEs/nXemKXiMzKubjeWZ43P4oR6DASU65qhwOU960zA3TjoLnX+mhZQScCyk46oBNlm8drzuTMr
	Dtx2ejsHprTSUk7x8rf2X5w==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr1783961785a.6.1791820260788;
        Mon, 12 Oct 2026 08:51:00 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr1783956085a.6.1791820260306;
        Mon, 12 Oct 2026 08:51:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm2043906a12.12.2026.10.12.08.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:50:59 -0700 (PDT)
Message-ID: <92707388-73e5-4843-bf7d-b43fa5a59bba@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:50:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/38] arm: dts: qcom: msm8660: Align closing array
 bracket
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <8604486885d7462b7a5113fa89573726a0fcfb7c.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8604486885d7462b7a5113fa89573726a0fcfb7c.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX1Ixmy800WdU0
 OFP/Wye4aX5rq2SJppF/JH+i2eiqRu0xE35wRjPVcvHXUWGEv8we71GpXuBxRU0AUNqJyQEEUjJ
 7IR+O6JV8NDx+y8qhSK+wSzER6C2kgNWxiAsgSLlzDQr6stwZkHygDbe76p5962IKFk68Z3gQH/
 8GtHuzrZdIjSxU7QmtsHYeJ2v6/9O2z2m7QhQeRevoo3Pc/sHcHO5BZ5FAyDf6u9B8GTWgGyAtE
 7sb+j3+29J1CMzvNr2cR1LsJBd2J+UUngWT/PIbUPKjXWWImN9nzkVlfXba4dpil9urcVtKMfZI
 a+O+gsKNTJVolPPF8jEn3yuAS30PXv7p+pUuk8J8gq2czpeRfdwOOx2V8WVZA/rXhTwgZssexlJ
 kPYUM4tndQ2B5yHjyHBpWJEhsvRnOevCfW1E8zi4NYEeelJGcjLwxxaAdQs0OCnObLeMW97AyE6
 db2OXXiqPgwjGY5uXOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX+c1lo8fjAROL
 T7LTNvAJlWQ/4FJ2QvB5VgikMEb3lnI8ne8YXT/V20s1hlNE8jZdZmo0B6Lu04hBIALe1TUedxK
 QLgqDqg2cMFTxxvfJA4WWl2Fi1NYBno=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acd01e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=C61bhbeWJC_1YFl37gcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: zMCXqwfjU4_LfHcMHhrJ2P-IfW3zk0of
X-Proofpoint-ORIG-GUID: zMCXqwfjU4_LfHcMHhrJ2P-IfW3zk0of
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Closing angle bracket of an array should be indented like property name.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
