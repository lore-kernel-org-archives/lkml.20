Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C965472798
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369878; cv=none; b=rKtLlhzb7hjhmmseU7s4o8UHIJRywS53MEnNLJCRfK0ADTqrZoHNJw0FdWHgtS39YM79AB1twh1q5p4Z6VXEhEC3J3S7E0JUEXdLMT1XqA8UioA5wrroJgyZPbTo1T2giAdqzM0a2leJy2Jladfvz/sm+3RJZNj9HUxApDTc8aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369878; c=relaxed/simple;
	bh=eKox8evQuuqmlMoftMlCpCcWaOJ7gtEXdoiFAv7AlSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFcczBZazZsnF3Fd/tuKM5E1Gj1Y1L7cn00qOUBiUEpoHi7AL6bOMN1fa6ZDC5Lu+a998gHXUo1+5wK2PvljrT/nD85fODYmsSrZkRzYHt7L00KW4xDspzyTHQtQ9tYrdUamFl4WRnImcV4kaibsUsf5Chp7L24z4xMgqsfnhA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MF6cfFdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dC+5n22S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MF6cfFdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dC+5n22S"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977kNLZ3812847
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 10:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37Vc/NsNY9W2/CoPj7zYbbW2QO5iD2sTtuJnT5u5AiU=; b=MF6cfFdEdHHNKFgD
	ZgKaNuOLVTAYvrGxYag1R+N6qQLqVl9tIVLAL62OKRzZihLVXllR5K6S/sihyMDR
	eY9fq5KrM/7BA2RqFV+rs+8IMVnR2sl5q0MBNNGohRJOaJgQoFZU/MzHMRvr/b/Q
	Sli05XiINqSaMVynwvdzNNRMLfdD70wXxTI7u1YI2r2itP4bz88onwKVQ5SCdci1
	SAJRko4zuupUdd7mRRUFGJpcVuym/rld1Kb27MFnNZHEh5d5cgxLfSPPhaMGDFrq
	e3pLIgzobxuk1jVhQcjvExPbp5i0uVLNW+suDrKTLPF2bhTmieGNYdUILbQ7jM+3
	Th7VPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrru3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:44:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a6d95d6e08so3055264a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791369846; x=1791974646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37Vc/NsNY9W2/CoPj7zYbbW2QO5iD2sTtuJnT5u5AiU=;
        b=dC+5n22Ski5TTlqbqhbZiriDgyBW5fLaHzqQ8FXUxmdxxuCs9PUTBKf+SIp0/MoTQa
         SuRpeqX029v0y2RW+ONO/136BOOtWyGvPCTVua1EZ3TlH5QYZizp248A5S7AKPCqJ9ni
         VrwCZ10nkfrTnLlSSD4Qlucyleq5pE8fiEK1b6iBdo/vKFXc84TN5nNa7gJiHw/twjYO
         QGmz2gp3jz7nvx5XOPPXhys5ZpECCf29dPvdnLtRiDVuNi5L1kr8CjpFDk1yALUYf5oG
         9Df2OdfX4WnAYjRtXWkj2FX5cdIk/nPy5ZVpOIFkuNtmOggKmmXid6cFnBy+8ocu2OPM
         76Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369846; x=1791974646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Vc/NsNY9W2/CoPj7zYbbW2QO5iD2sTtuJnT5u5AiU=;
        b=h4VnP/j4tIkuJ2hVuuQU6cO+wwaeDsmAtE8RDK9KCUeoKNhybcZu4fjn3Fx/UovhNK
         IBhpsrYtrtAurFp29wcJj60coG31w1zFRqrkJtu9RPfVgRzose7Dp+yu4gziUx0ZMnO4
         +pL2QjlndXxfumax39uJudzRvm3ty7SXtv3cDHCczFFxNv9kZfOEM3owljKK2PGGbfix
         v7XClwQGE28mnho65JGcGSFLZ6XUSVBXfyVXnvMelVIL2P0Dm6nTy/BksPq65BSgSa8g
         k5SKsnOBanz2U1V+xV9UdfDcbDAjM3R8jyty9A2VyuK2D9AvnCsymwDXgr76GAWIaqyk
         kwlw==
X-Forwarded-Encrypted: i=1; AKwUvBwBxvecYUBBRf/NE3NLfxwc7k0FaOSmWQbzny7sD7nHyAhbOth2TdVZW9+H2SZvVeMo//RSvFyYIrcWmSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiiXLm2bV01EBJlDt/E9fxyqhaDRjkOdSpUGXxwfgP9+Lkn9Ls
	J9s6Iuqw1c1yXdmyDoCSc/SwtYFBHBu5UDeQovZii0xlIi/iM1PLMJtqbRNrjTEDkXpL/CGFcZG
	1OHNDOGNPCjFN8P0/vWPx7Svkqs9T0qYzKvup8P9XN98ieaL1W/a9WQCssebKgQ2bUyY=
X-Gm-Gg: AYBFou276dlDzOBzolx4HTmmfK399uMTrHWFHjZXfiPRPBFlAp3tl7RHDZU8tC5+q3v
	ZjMvbZOwgems92URBMI7Icw9oceFYT9fZuz9jHzBXtJm8MoYUxM5/7gDlpan5AWsCy87Ap7sbQh
	8wzHFrrBKbrK60f3Ci44mf1ZQDj8ymqoyQBsKFJvvC/J6rrud8bUjX2gmDn9IB8EJ4umPkCFGUb
	HHUOWe5sq4lL5XfFypchKfOGeJ+IXtbwKi9D8c68N+BK1FUvH9eWOkh36LSB8wP4E0Xz73+2roI
	nIts1jwRtuOQeNpmRwtsi6PNtV108LBKhjXxNhs924VbB9QRC+Bt7vztr/F6AfOkWNg3DTY88IK
	WA43ipR6bSG9v8hragHy35HD/fvvvcYkJgvkxAzMOswDtjatzsrB6cu/wvyI9idqlqrXjbuBEWm
	ApaJc/gbaSpLWdmq+WxNTyxneQZqI=
X-Received: by 2002:a17:90b:4b08:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3a8a19b1e33mr1567179a91.27.1791369846068;
        Wed, 07 Oct 2026 03:44:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4b08:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3a8a19b1e33mr1567149a91.27.1791369845562;
        Wed, 07 Oct 2026 03:44:05 -0700 (PDT)
Received: from [10.79.117.106] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66560sm9393796a91.6.2026.10.07.03.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:44:05 -0700 (PDT)
Message-ID: <4318b36a-8fee-4207-a232-0581e2b2c69b@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 16:14:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] Improve Qualcomm EUD driver and platform support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac62277 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IB2eJBZJimwe791p62gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: jpg5iHEXZ1Wplx-OvgmxGURYm8hJ6wxI
X-Proofpoint-GUID: jpg5iHEXZ1Wplx-OvgmxGURYm8hJ6wxI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX7ivaOZ/swYmO
 icUwtL0Oo2Rmb/PxqPXjo67rNMYKPvaerCaJnjeSMlZO1ktvQJGLd56qXJaLCI0EsEB8bXqrU2V
 /WIda0CJ/qLD4jEx0Bpqj4XDpI11Mthkxa4x2BF3/nhWADr4lvr9ycK5gp31hafQzqPydxiJ3du
 HiOXT679RYRgF+7sJzfbnE+cIVO5ztZ9odlDZRL9sYnWZAbiAgV/8EMcgJ7m2CV9T9GGLmmmgDf
 IwHtDDxRc5Wrk52j/bYcYEQqShVQ3X08hwE80LV1A6KrRhTynVa1G2IgxSCGQh+TPbul8v1a+kF
 midJMTNxCx8yC6NhSSmYUWVlpVt0m+5JGOOVI6jtxEYPRIuSFt6ycyTix04GVA840io/Zrafqfb
 7d3/RHKMqy92f0eUhzLo8QjTxs10KM7GP4yHTBLF7NX4tkb/aefoI5u76ItOyyq4V2v4EJ/HbRA
 bIlbRpKZTwmkcUue77w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX+XxQTF2IOlpq
 LWLyIeYq0qFGlocDgJzdH488YA2ZSCdkM8v7z79owXUWeptUDnGQ4uUW9lUkDXGFpV6XO83k5VI
 iiU/W7rJ+Hrs/OzfWWQKan4AQ2xEx/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070042



On 9/30/2026 3:05 AM, Elson Serrao wrote:
> The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
> provides debug and trace capabilities on Qualcomm platforms. The current
> EUD driver, however, lacks essential hardware resources such as PHY
> references and support for multi-port configurations. This series
> addresses those gaps and introduces the necessary device tree updates
> to enable testing and validation of the enhanced functionality.
> 
> Below is a high-level block diagram showing the EUD and its connections.
> 
> 
> 			              EUD Block
>   	                   +------------------------------+
> 			   |                              |
> [Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
> 			   |                              |
> [Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
> 			   |                              |
> 			   |      +------------------+    |
> 			   |      |  EUD Debug Hub   |    |
> 			   |      +------------------+    |
> 			   +------------------------------+
> 
> The series has been validated on the Qualcomm Dragonwing Q6 platform
> (RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
> interface. For detailed usage instructions, refer to Qualcomm’s Linux
> kernel debugging guide:
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd
> 
> 
Tested patches 2-7 on Glymur-CRD, EUD port selection and role switching
work as expected. Patch 8 (Kodiak DT) not tested.

Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

