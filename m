Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705E3E6DE7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888158; cv=none; b=VymgYeCXGQj9SqjPVFHOOUOCn8+CfXlczkSRGijAQKzigSsE/eOKeEFMe7k8kZugTqSJ9LsGbwWEXLzAnODsJWVbiT8QL39XhW5s7gx7K37yvairv1UGYl2RDqVNGOE5iJoeIesqGlFdA4CeGI1zuYnp2zbwGM7W+1ArFdBXtmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888158; c=relaxed/simple;
	bh=IU2l499EXoAxlldXkE2GeCQ4P9czIcPp7g5HYeYvGxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvp1istpPQWWN43vQ1RZZgx0k0NsVbyqBahHSyC2VWZaVKGsB+clLacrbMMlIqsvghmIUBYNxfRwHYr7ZOlPFPhc5Ru8E6fXeyajfGT99iLo//c/eDju4yOQ1alDaowCSX7GyvUDCmjPtRfQEKFquG6H+uvku41rHV18UEe8L7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bots7mYe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JupnWjqo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bots7mYe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JupnWjqo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9WSZP174136
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G4NTUShIkOCxd31gjVb0qpdQwxTtDCadlKBFzz8HyE4=; b=bots7mYeXySrmqK9
	+MtxRaKtc49fFiQ5eGaIDol7mfJVOxkbrzj+KWg9hzLidGDKKaqW1ksxExHl/W3Q
	ozaTk8nAkzf/dzifYNwZetj2FN8IicwYA0Z/LTKPMrFYurSefghBy21s8tPV8R+q
	o5L//j9iaQO2MJx0NI7T04XBfboFmE207PvHpQtmHYKMMGS14GthAX1d8EoWwKC2
	JuyM2KN0Fk5IdfioJryBiYDIYNyraySu3tabzWBGtJdeT8PI+z/66W+C3W8xps34
	7DRDTFyUeew1NTGVOie40RO2QhIOx6LHaNH1duppw8WvM7MNv6ZQVAxTH5x0eFwO
	tNgVpQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqsjcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:42:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bf3eeb42cso19192485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888155; x=1792492955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4NTUShIkOCxd31gjVb0qpdQwxTtDCadlKBFzz8HyE4=;
        b=JupnWjqoZ3YO99dwzQT1vjNKEtQEiMbj2VubTzZK1iLvBABOPB07lMJgXAwjlnbcA9
         7MyrJZoLHcvDEEoF7bi7prIb+XglyU8lSWHcX3oujl0AcdLX1DkzpfJwTXSKeCuzsnMF
         YL67iqoRHM2scLfOaoUUnAaMT1A+alvSh+uPts3Lype0o2oehun85rprw586TeUu6qOl
         eMGKrRs6EAfokbPZY3GlLpLyvMlDDVmnV9zgb43gCHLwM2CFIzeZ6Drdd4qT2i9xSdLf
         2eio6SagYx71bJWjcWULzkZs7hGPDiIm5WJjHR48EkhVwMwKTpumFbPUPTRWfRNHwWQh
         lHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888155; x=1792492955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4NTUShIkOCxd31gjVb0qpdQwxTtDCadlKBFzz8HyE4=;
        b=Oxb+N1x78WasSnkwJq6HkLkJ7cg567RiD951WY+Rgoiy7CZ2fysgVUoWiUoed5z2EB
         OHOw0yu7t/D30tYXst4UcjPhe/gN70S0QZU6Mn0eD3UHh8vj0ljghmWcCgWfSg50W11L
         B0tOxL9DZt9tlVEtUCEkW8E0AXjWSDG933MvlhmsDUqaJq9/Kg2mBDnlwkWSYGidewCI
         /+3aWlsr9MRJsNBPW1MCdBpKifhvLAtq08/ybkICQOSGoMOntsQOgtiIygN4w49a08dV
         aMyHP4M7YG2im/esbtrmz7RP5YAWaldR3AMfRYXVzNpeE1X8vsQfA7VwO+/MGEyC/isx
         h6dg==
X-Forwarded-Encrypted: i=1; AKwUvBz7vQENMvuO4zILZqq5gNZ0IjlRfKb698dvYkCvBRoECfZvTtAysu9botci87cUsUaMum9vxCs5iUFWwDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmcPshjLNRHsa/nmNlhbRP6OY6hU7AHHZTHN1tsj2IbveokaM0
	J+xvIvUvu7mgNEDqnmH+4jgVlmbjVpGeBMPzy1/drk0T2Y8S3MbYMZY9XIwAM0UHcaMwKWFJBTI
	VjCMKKcH6hTPIkcBa2CwN3VDMcin8FQ11yTG6nxe9QPsJh6f593LygP/qguCgyzG8eFw=
X-Gm-Gg: AYBFou18y8uhf+CK1ITyXkFma3aP+JpQbnFEbRW9Jlt85Sc3SqvT6P2MznY9cEh6tZQ
	Io1b2Zl5G0IcxUnfUg9yBeOI60BsMW3sHY+4cyPAy5Wwezpppfrr+15x6gCKUsx5mfcHs3OtjCJ
	jthmb3lRT3+muGTGc1uAi4iOLH+1C55R/byeQXRBIca1UZb2vvBQKEjU77AqvD0jCBoD7TvjoJS
	6E5vTzZZPsBMGuISi97J/X07Pim+p62apCA+n6NtYYnuJb1jdOWFj1TWv7T120H+/ecY5AumXAF
	+8L2XHjkVbfSosX0bPavKxIh6z825xN7n+4DD6P0AJw6OsD0qSaiQL+PDpVKblj8Rsr3ubeJSQc
	fRgVfckADQSdx06ut/PrMtg==
X-Received: by 2002:a05:620a:254a:b0:93e:5ee9:ca87 with SMTP id af79cd13be357-93ebd29bf3bmr2255082585a.6.1791888155035;
        Tue, 13 Oct 2026 03:42:35 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:93e:5ee9:ca87 with SMTP id af79cd13be357-93ebd29bf3bmr2255079985a.6.1791888154559;
        Tue, 13 Oct 2026 03:42:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c36fe6dbc61sm63300166b.30.2026.10.13.03.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:42:33 -0700 (PDT)
Message-ID: <8a5e7e29-4c15-4547-a6b2-c6ed529b13f6@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:42:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Make the ADSP remote heap
 no-map
To: Benjamin Kelenyi <benjamin@wendy.sh>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261001085247.1897991-1-benjamin@wendy.sh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001085247.1897991-1-benjamin@wendy.sh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: svjs9IZKXuUvIw42qP_lllxmTh-8k-iG
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace0b1c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9KSy6GpRFk5DsmjdiqEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX81E7seACT2RX
 hUoKiEQgFFHk8/ppIJZ2PJCy+rP0g4nSiQysAJUf1mt7cuI1qEGbzobWiS27kHoXVGIJ0YL/lon
 px4ir7lyRqW42wq0TcNhvl4HAmYh09c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX1E7Hs86nJrne
 AqZ+BKVZSiHSjQxdDUiuqFvmeTEbNn9Tn67FEgaaXbK6lV/9vgk2V2KQ2isXoXJGVF4nabQrJk5
 Vd2YfcZNsZAUTBS2HBAXd+YirERYcWfp+mjdoa+BqigZI9SKfl9vI0xKYzsb5G7vpgltESGKEsv
 5sVrfOVx3FRH++OhWDmVAi5ggSLpITVzdLdNn2fv0Krt8Z3dHFv820lbbsOCvbthq4NsnzPbW2C
 45S4t/53g6F2l1wlekeBk2Rvw7CfoRtF4gU5tgSu1XxqhTNike1kXfSE8i1mUiKgfYUHN0Q+bmZ
 DwlbyfjZmdPbF9ly4nTCU4zDq5hjCCqHkRj0WvqjmJiQkcOay409iuijBukFwwXgWmBppT2SLUn
 z2J6TSE6Dd2MiFXD9PuoQHFpedQB7Js7XaV9dc1pvmaLgGv40ojyCTXW8R6e6ZlzzS2lbcqT8jo
 /kxGbbIzcIJ5hrjivhA==
X-Proofpoint-ORIG-GUID: svjs9IZKXuUvIw42qP_lllxmTh-8k-iG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130042

On 10/1/26 10:52 AM, Benjamin Kelenyi wrote:
> The ADSP remote heap is declared as a reusable CMA pool. The ADSP has no
> IOMMU, so fastrpc hands the whole region to the DSP with
> qcom_scm_assign_mem() when it probes, while CMA keeps lending the pool's
> pages to movable allocations. Once memory runs low the kernel touches a
> page the DSP now owns, and the board resets without an oops.
> 
> On an Arduino UNO Q (QRB2210, 4 GB), writing and reading back 3.5 GB
> through the page cache resets the board within seconds. With fastrpc
> blacklisted, or with the heap declared no-map, the same test passes
> repeatedly.
> 
> Declare the heap no-map, so the kernel never uses it, as the other
> platforms' remote heaps are.
> 
> Fixes: 3fbf3b85bf86 ("arm64: dts: qcom: agatti: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260908070331.2189A1F00A3A@smtp.kernel.org/
> Signed-off-by: Benjamin Kelenyi <benjamin@wendy.sh>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
