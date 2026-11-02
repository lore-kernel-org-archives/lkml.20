Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626469;
	b=2N0X8+WdWAgKRA94AHaCGHxr9WLdpMwGG8nPyy9Uo3Yh0Lyejpl7JpVS3MVUEACE+DCL
	 6umIp46/JPOqw91UN2JFUix39YCNzxrVkWEAPJIGo/Nx5D64W1s9oAYJIQ/MDf+Mdh2CI
	 VLKy9SYYYUQWAC3pq7g4m67EJG2BZTnEOHj8JKvrMNYkQSiszPuE/QgHwLwIzKNnORKYJ
	 3Cza88wZKmneYZ1dxD3RTEmifO2yLEbuQtbdpNLapg4Q7fVnq/3YsmmSjQpcuVJnxOs+H
	 lbe8psd8RzZOofGwNKgsn6dgVv2ljHm7TZHOi5szsLY+6N7KdGghJFRtl9kyTQEOSGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MB707T6hLoLZTLTI1Pwt9CEHJrH1f9G0GJj9GnzQPec=;
	b=zX3M103AqL+8AQZ85MYoZpZQw/XaNtkb718Sa4RGJ3Hhk7aGY4DYXhNYZu40p5pPpq29
	 ulpfh6eQKRAZPLci1dQMG/GjrxCBLCjnMarJB9v3rDZJAHN1aS5xbS7+wW+s6h+khhSAw
	 XPRhQmeJMBfx47ZBpqMugKDSkZiYCiEj/dEejGkac6XE4jfG++0nVJyQA/EjyQu8P2hpQ
	 14h/88/3juB1fuVKq7fRTtlF2sHrA9xJjTm8MJJmWBNSkaBtsAR/lptetFqyKQxlaxGe8
	 uHTMkBztoBxvhn1wYEoPChJLuJi8GajXkCYyWDRI1euCK0Pp3xkobqc/BX0NaN/XHKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QbhJ8zdz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cF/SacPg";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0B460A2623
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0B460A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QbhJ8zdz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cF/SacPg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAL7v388215
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MB707T6hLoLZTLTI1Pwt9CEHJrH1f9G0GJj9GnzQPec=; b=QbhJ8zdzy6f33Sn0
	3+O2p8WWJKxzMRVwYycuUnhUdMHdh/MFByYWGx9/h2ycw9X2QmOkkhaMG5JZ/4K4
	H/A/XYGkbwj1oFL6PX3r0Zn33Y4l4f8zdBFEuQBU29vZ1VrjzO2XR8YTsKnZxNFW
	3ok+D8kwTW6PZCj1/ydDYDilvSsAOxjAbL3oc1u1q7fnkTwI0z24f364GxQEIQiy
	CkraZRSECqqw5p9RIm6625lW43d04XAjdXU+16DGcDHMirYT3kSOMPFGU2JJZryO
	iX9QnAD24wq/wVIe6ZeW8p4+DKN0baBLo/MNcUIlsojlcAEUpDlfNjh2fzPTUsv5
	rPDhvQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19ajj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:34:22 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9909853d264so107038241.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626462; x=1794231262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MB707T6hLoLZTLTI1Pwt9CEHJrH1f9G0GJj9GnzQPec=;
        b=cF/SacPg4RWTJi+MxbzHBslMKeoyzoWmsx/SfJqJyym5879Pl5poJyJxIhVXS/AXTw
         KPNTl50e66hxG+qFaFXHp0ZEIYqlL4potjD9GcOxx0ABy+reYkgIi+m7KaLLGCnTz6bD
         dHkCp+ptRz6Us/J0qLen6wx+6PITU7ND498sVd351Jsmxaqt3SvAgSaSmV94CMxG/I2O
         bBj1T4PQGg7Ne3mefERtxoroXFouJyYUrouoxRV78/xPgaNPMd63GlQ6f7JOukrg0Fyt
         UZw1cNzzDGAI62ndhDLa+KETaZfw72yERsy6BqqjOAess5QCkJMfM39gj6WWij3cqlHl
         7DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626462; x=1794231262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MB707T6hLoLZTLTI1Pwt9CEHJrH1f9G0GJj9GnzQPec=;
        b=fl0GOvy85bFCfC9K2X8tni4/RyOSOSbTMGB45gbgn0UuOsXQ0PDwBG5SZF45o2bTWg
         Y23GQPkEyAHLlh9UhZjQgqEyX5bs/Kr1NLXR8F7esjoNE7zMM5roo5fNOi/BWH75bmIL
         BfKv3qz2oLaCesjicrbq2WlQfumbVitDqvSYYQC5WjotrwaNxRZdolQpjBT0aaR7GMgD
         gmeIy8NaQwgI5/+hBLs9XQOqJYDRX5Bb9gIegQQ37bgabqNei9TT/K1CaprMLMN1OMPR
         IJbsWhr6QUkLUpOgT2sng3w3Ms/kOLutrZQ72Bx7S+HlwnzkkR2bbDwIFyc/zWzKFudG
         UNlA==
X-Forwarded-Encrypted: i=1; AKwUvBxYJ1ievj0qG4UWIsOoh1Kxj5/9BRTRkc9JoN54LMijRt60tI5fXTmCt1aGZKLa7GXNgyvhxj8797EydjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KYMXgm1nL2R7xWF5DGwX58TfwA5yEdNmW3wJJdTK6OfGnz6rW
	V0SxDETUsPnHqniD8X8B1647zaH1QW3IKlsd12muPOBVToCRcW+XDZbrMqmFEMN5hTEXEjNvqxC
	JC+yGJZS9mUP/WeMFedaVLNZ47TOIIRFisSlS+O+7EpaMVWrh2NA97X6x3G7uWaLHbBE=
X-Gm-Gg: AYBFou36lFYdIwN1IiLBFULRH6QC94ekQZTLxCo9HXhTHUhfIcTkjoZoFO7PbrYZtIA
	XZeUdTu37zQS6sbQSHqy4/sBrKx23WSk6LM4UBvxIdZ62A7ZQoHmManEK6rY/w8uqRal2vKqlF4
	TIY/EIDq8vIQxVtjez01WzqL4OXD6FrDRWo1BSAdY5LFZcV272Vz8g/gXi2XHfWi6qZEve/OgyN
	u/4JWABkNjOm8w9UPU6dzuSaIfov5QFzSWyGQGf19WS7D24dOZFtEx7cQmiRtYx9l+YfTa+K234
	y6T6nP+ia+yNxFkRWfwjnvi6pTLLKPgh7wsyBXGlm9PDm2smOa11ok7qKRPaUF3KIXHxyq3GuNm
	K/7KaF6O5o23vSXgs5JGoPHJYMLf01rp41RTPDUNgxVRSCmjlFRKS0FHMLweU9d2VdVVZak4=
X-Received: by 2002:a05:6102:2004:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d07255715emr3358557137.2.1793626461707;
        Mon, 02 Nov 2026 05:34:21 -0800 (PST)
X-Received: by 2002:a05:6102:2004:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d07255715emr3358539137.2.1793626461135;
        Mon, 02 Nov 2026 05:34:21 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca214fdsm3219168a12.36.2026.11.02.05.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:34:20 -0800 (PST)
Message-ID: <6cd9240d-5628-4c35-b7ca-bbbae7f62fe9@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:34:18 +0100
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
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Leave the USB PCS alone in
 DP-only mode
To: Joonhoe Kim <26rote@gmail.com>, vkoul@kernel.org
Cc: neil.armstrong@linaro.org, mani@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, val@packett.cool,
        wesley.cheng@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261023123512.1912-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023123512.1912-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _t5OcxUCXUZk_qUuhWcwbs2-8-qsqRYY
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8915e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=u3WzlVLRiEZ43SCRuFYA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: _t5OcxUCXUZk_qUuhWcwbs2-8-qsqRYY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX5GL7yyn1xHh4
 Kjvg5gB5JfuJMJpV/rlAczCLRyLeSx/qKnWJBUQJjTTW6lweSJwarnbYRJ1uIYNOzjOiiOlR/CA
 w6jzCoHySASRVGLcnvPvqD2K73f81EhajjKRByjbkSwMdLN7byZGVfxgd2Rh2gFXyEqOaY76Hdj
 gPQz1wQGO0AfGGNsWQFVgcrFxJ+XwMETJNocJ+g6w+y6zmZXj+8isbG8I65IwVQj8gfWoQfg5Vh
 Tisk63Dr6aY8BWAwtdxKoYQI7LUw9MEJuNwL0kMF8cl7npss3r3PeucYx7//mU7XKofeHVQqdmL
 zb6t2Xqh/fZ0AthNCDH5NkJmqCmYYdC6teXWWNlfAXXfAWgt00XwX+99xijIEs2eZ88aB683h/d
 QSaS7gyYj3nugR+rZkhiMpx/vHvga7Db72BTn0FC4aj0gPblUESndOqel9AZRp5oMFONCxl0u3A
 AR1zxQcuv8u90E98M5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX7eCtOV1qXgQq
 H3/6D3lCG9/OkVxhmn+7/iLhbYICf/2KML9et4b1UaYFtlsea/Wdg1g2Sd3CWk0y8oMZtkiPNkN
 urijWfWkeiuAQv+h87aYXmE71nNFZpY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 10/23/26 2:35 PM, Joonhoe Kim wrote:
> In DP-only mode (DisplayPort pin assignments C and E) all four lanes
> belong to the DisplayPort PHY and the USB PCS stays powered down.
> Three paths still touch the USB PCS in this state:
> 
> - The USB controller can exit and re-init its PHY in DP-only mode, e.g.
>   across a system suspend that loses power. qmp_combo_usb_init() then
>   programs the USB serdes, lane and PCS tables over the DisplayPort
>   configuration and times out waiting for PHYSTATUS, and
>   qmp_combo_usb_exit() resets and powers down a PCS that is not in use.
> - qmp_combo_typec_switch_set() powers the USB PCS off and on when the
>   orientation changes in DP-only mode, e.g. when a DP-only sink is
>   plugged in the other way round while the mux is still in DP-only
>   mode.
> - qmp_combo_reconfigure_phy() powers the USB PCS off again when the
>   port leaves DP-only mode.
> 
> Skip the USB PCS in these paths in DP-only mode. Keep the
> qmp_combo_com_init()/qmp_combo_com_exit() reference and usb_init_count,
> so that qmp_combo_reconfigure_phy() powers the USB PCS up when the port
> leaves DP-only mode.
> 
> On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
> in pin assignment C, resume from s2idle fails with "phy initialization
> timed-out", the dwc3 resume returns -110 and the following xHCI resume
> hangs the system.

This sounds like a gap in the DWC3 driver, we should bail out of r/w
any registers if resume failed

Konrad
