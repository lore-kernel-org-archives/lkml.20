Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590298;
	b=JD72CI3XdsJ/n3/mAb+SLtnVEccNlHF6HC5p3+3TWJBga3hOPUlVWm+DqqB4ZMrTPy+R
	 lJge0B45IR9PUVwqm/xiDz6eq6R+Zzd/IRVRvZ2Z2E9W4UM5KRNy0zPaSupsZBCH0SpMw
	 lqMAg6E2vNVTWfDSoXlVSkvOVSVaPLxcTjLOaeG3FnV3yHfh2cKYfezlCBRWTjnwaWWZ7
	 C7xEegRiBtbKUpylU+SmegVnTQ1zfrrPY1HCB96NGv+dxLPLCsH0RuqdPh00Vk5AJCusO
	 GIjrT3ueQwTgt6drwLnu9pzdSBKXTJEfcS8L0MH/Wk1hzbEGxx/egusbLR1R7Hq4cpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590298;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4HFJLn83kygPNb4chE01mOHDBkV5We/MxsvCuFn6o6U=;
	b=au9Sm2ODLUSc5TFW40QAmhU4ZcUAFnoLTxtIV0rUVTrNiuV6ENog0ZWyuZe0JXPlY+et
	 LKQgQVRjg7MGTVU3uo0rM0tROeOWMHNViV/cbrCtw18yULcfbvzYJXalMM3yOgZj15wwy
	 wYEaEhqEiVj+ct3Tl3ojCPH2ZWwkOGrMFtamESDeUvssLFBDosxbJHoxehwd9dgVFwvHy
	 I1enwc/ygWVnNU/GLEETVfqtM6GOX4mCX9bjWDAXa9xfkzQgQyXWbbuAC1bOrMjgF1cUv
	 ot3fcQ1sSH6XhAj2o6jaoqAavcfu1/HUjWaknjGGA7mGvuQB6AqhNyE2FSM2Jp07v8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUxQwyQc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hIQPDwi4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE7E606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE7E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUxQwyQc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hIQPDwi4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfx3C1568124
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HFJLn83kygPNb4chE01mOHDBkV5We/MxsvCuFn6o6U=; b=fUxQwyQcb1/73HkE
	hHGrufBLfRzLHURFpHedf2eLTNvdvRIEdUh26bdpVFAnaRqfFFuVyKAo2adWD80N
	JDkdtOtajuJYoeYPZjpUZtIEONH4emz+p1UZ/dygS2NMJi7GRC8OV8RXeggGUHWj
	9z8H09Sefd/RRvLUJgui1wN8hrP82AnWjrBlzS/HJmGXqoruEqrRTuXvQm6nSM/v
	ChRw0TNb/w49QEWr327yWiXq21MtWkZ3BlNDza/lzCBT724oMZDJesmjjQlBUkl1
	aMZh5rxyFNXqsbhoJJLsGY6JbGrIY91CZJpoI6OdONcKFM5QHDVNlDBkNfuqhIX8
	eXMNcg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4v6ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:44:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so17630885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590296; x=1793195096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HFJLn83kygPNb4chE01mOHDBkV5We/MxsvCuFn6o6U=;
        b=hIQPDwi4OS6dLClXV33BIspcr4sidgyFCKs4COUUsc8aCkVg7ep8HxVKna94TNiLOW
         qiC3sHxsSASByLIgmD4BeIHSuePvop87TnZWXZtXaQlbTATfuMGYYyQxyf2MZ3BX5lZs
         lfTw8CduIUQ0DnCcx3rpHG1CeZZuKCtxzByWTfhJKkEgcElM36WvZVjGIm7hTrAYyrdZ
         wWnkbTmOYSCwkBr4wKZtvo7Uwzhzb6CQ2MltjdEJLReDtRgsTuv33crPldVNfthoxg3v
         WiFzZmKd+dKzwCFAzWziPUe8cpjKNl/trVXPiGEjvur87XTPU/qkLt0FkAk4/AmvDdtA
         I8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590296; x=1793195096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4HFJLn83kygPNb4chE01mOHDBkV5We/MxsvCuFn6o6U=;
        b=YhnkN/zs9xrUiGX/JgTH80ThqSJIz8IbScaaYWMflF2lddmLbEbEWu81UC0GXMdYPj
         GCvGp6cmbiW3O1qqKjeo49PIqKAapmB4hP5tNN3fwfd2AqZ3DZaBcC21dMT0DzpeQoZA
         9auRsp4eAPLX5HbJrk89ASU7yO1pAT6jqCPBK62TBTRFRrOFrbyRNlG4dkmxptQr1o9j
         zuURZ23V/mx/dhiWruRuFeEKYCxLV0YmHDps1NXRNgKjQ/XCGIiADvM0yQu2yUZRAdzl
         KkfE8Vbc58tq8yDTcTuSoE19p+f+7WExkpR25gbgWHwSv9jJ8S/b06qlhMCfYXxq09YF
         Y8HQ==
X-Forwarded-Encrypted: i=1; AKwUvByPzad85wBqyDQhtAJNovlvRqNbGcZUY5KNVybb1oAToxt0qfO8jZ821wTZe5Xe+R7zo8tbLXspQI2RlFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/s/JRZ0861cMgwcT59Ku8DhPnnGLWenVLLsPdvjRkYN4dR8Ll
	qutO0/icgCaYoa1h5pTQfa07h7aoCuFH1cvlAZJYm/p21Uikck7Tl4NtoM0W7agivlw+/RB+uGg
	U0MOLD6X1VL4oifFFKCMEI8VeoQtG2Axqh1v48UlVdhdH2eM0vyK/9NFoexoWZ/1RxvU=
X-Gm-Gg: AYBFou32gxDz/CjcJWUPSRMiMNAR9uSMiXTYTWrThq697yvURCHCfj8U14y7gF8Plk9
	IBQkF6ukCqnPunRG46EgcEG7/Mg/legWszPZRIE+2kvvJXvO2BLrajo5LC/x6uNLgWfP9170j7D
	/1uus0k6ODkz+BY89bEc78EXMEUHmng0Z57YPILJjrdNnjF78vBpie+vg/BQpM4dYbPFzsqk7Zo
	5pBjpPqrcOTTUg8BJ1Z9KLxEghbhQnbd5HcsFct635CciOHG9sclRb8hj4/cE99B7Fz1LJ2VkW6
	fggBSUkBZlPQecenaXivPaQJGLhOeIYfsSzq0yGohcfjEwHPcoX4BW26BeeWe7dq4tKkzuCbMdM
	3v5fBiz4o3I4mVXEHEbZTpA==
X-Received: by 2002:a05:620a:2a08:b0:92e:6485:f640 with SMTP id af79cd13be357-93f57fa2115mr496122085a.4.1792590295722;
        Wed, 21 Oct 2026 06:44:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:92e:6485:f640 with SMTP id af79cd13be357-93f57fa2115mr496114885a.4.1792590295090;
        Wed, 21 Oct 2026 06:44:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59d61esm6097366b.56.2026.10.21.06.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:44:54 -0700 (PDT)
Message-ID: <7eb8f0f7-9e5b-44e9-971c-54bfdab23c30@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:44:52 +0200
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
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a host
 with wakeup
To: fabricioakio@gmail.com, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 76Tyqkphi45WSnKxHd9e89w5-ui2-yrT
X-Proofpoint-GUID: 76Tyqkphi45WSnKxHd9e89w5-ui2-yrT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX2qTzEWo+9o3H
 YQeYKjMawETEYUSpUyE8n1r0B57EPhvc181SXRT9sHCyzRhKY/WRdH+o8lcHsXenEe6V0rga1+I
 yvzHHJWZLW4ysjepJvRBMwMk14z4AZA=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8c1d8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=QFNGBFAix9GFkXGs:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=0a4RfB2vrMYbvN3io2kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfXyoHKVp96T6Ho
 Fki3vEdYkGWG3PZ1RDdd41YLc5l/fooQ3mTM88LKtvxqGgEmLf1ngbN2fIqGJA9ydrMXxcQT4J2
 twyPxKKbWlSEg/2fGYTfwuKr35tW3HRwKjhx70L9iUrz+cKn10KVUj+l0Qfd/F1KHUU4+W8hPdh
 hKZVbUTXDJgQtbttjV94zkb0X4N3GpNYjkUeMAIxo4JWxnAzF5fXyVppYpisJAGn34a55bvdHp9
 IHYb1DLFfTraxQkMZekGHAYJErFLzTez20sc77pL1J/hwZeLIXvuAnu7o79jdm2fUWpV41xInKP
 N3Hdc9CxiFlSp5VtjLpatqZcQsKfVAYxKtz1KLWdPzHZiCkS79C6x0ETaQanSNxdNGjL775JNvt
 Kp2KYegosJp+T3Jh+QVLc10SrTMZA2mgBhYpJbx9z5RLTxtw3ycL5nWnxaffdQ6EGZfe4qQL7nV
 FRJOK4CLTSeXcHX0rAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210054

On 9/28/26 8:16 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> In peripheral mode the core disconnects and powers the PHY off before
> the glue suspends, so the link never enters L2 and every system
> suspend logs "HS-PHY not in L2". Check only for a host with wakeup,
> the one case that parks the PHY in L2.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

I think we should be able to retain the link in L2 in device
mode too upon suspend, but that needs more plumbing on the
clock/gdsc side? (+Cc)

Konrad
