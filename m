Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656398;
	b=lvQwnVRPLRlUb+5CO5yRZWuYyeL6Z7EMlUd/XfD80UayZ7zqFUu6QrhSTKeEUx6cZJ/o
	 sqjDQSJmtMxa3XW4kDeISO8vg99jMs8BmZ5b6WRyL6upQFWPbeHVzqelqxxJfe8U2r6LG
	 zYqFUmb0aJ+Lvrp4eFoGE66DjV/rXpauqPi+zsg/Y6fE1nZjXGV8eHmH54BuMESMMe47w
	 IP2EGle2iHafX8TWJZdhYY7QkQUbCJQ4pYsSYhn8IXQiSuVgjGaqf4dpd/6VPlTh+m1lS
	 e0XWaz4oW0JC+5bkxhiDneJYrJgAiq/7VlWpnXhTv6vUvMj/zPUnkVeivVpe8CdG04w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=;
	b=QKPpVlTRI1nGtt6sxrbuFcpzl5Q5/cRdxoIAwR7fPdUyCDS7YBwmatl4fmL53LxD4yPr
	 aB+IvCiLPOzWcHcIhtEBr16usGA3VVHqUjwpU/Gjf+oVDkxrqYUBpWBwXSz4vRHQiQx8/
	 PmOhzYNcy6drbihfEwiatouGxv5rCpvlLIBCvPWE00pJj+nNrcM4MugFHp4Uhxkgln6GL
	 AkMPgglmQQOMhMQGV77om3OAh56Qd4HP6CZIvcXwj9ZC6ZnIw403CHwKLyl13TOg5rvlH
	 uDUAQXI0JHrUjWMBUUb4EyRtQHfpDVNURAKl6hNAwLiNDUa7WpkIoAFTGS7Th362x6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gJsLT3/1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNtjyoqG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F28F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F28F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gJsLT3/1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNtjyoqG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70ECW2516167
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=; b=gJsLT3/1t+6P8kg8
	WjfolO8NkEf9NuXXYOYi/ibaJQElqu7U7xuhvvhb0WI3Cx/pmRSSv1uR6GPPuHdc
	joWkaieN1xjaB7mX73lFUgFKjFUoDDjLCTsB9bFLFD72UHXJn/HdGw5VYTSi5xB2
	xyFxvyzZY5HpUPPVZJtZ91Xcq08qIayFgb2pGYz2tI+Z9WpEVvenyJ93oxz0X2R5
	XnGOUQlUFwb3rxBpLrEhC6LVdW4N74wTeSGgTbw4Qk7UuQAoOFWfChEjaN7HOn21
	d0ZOm7W53FjEfZFaKs0KI7qLzcI93PYZ2jGJUjOAYoupiwDSOhFmZMi+gkwvgsRR
	Q4kr6w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9cud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:06:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53389750985so2849791cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656396; x=1793261196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=;
        b=FNtjyoqGlagUNO72W55xLr0C/c2PTcndQotxRgkLLqVUifEFO1hzAeMrmkFa2o79cM
         YozQPNWbnl3cjCWggWgQIDB1JtnWTYCyi4kRMeExy94QSKWHWAAV4vuj7qnySdMpxTfJ
         t+PvSo7S1gSN7axdfm+4Wl+e4GGbUuoOJBJZRKpCuWPlyYHdo7aH7JRfRoanvZHtdyOn
         xLb0/us976aAwI4PcEPSgjRW+ZaGdNOLYuPIYVfI6A8ju2I504uCZ5o+KKCrEx/OW9z1
         Q+DlfvZ/XhM3oKeMW3piUoGtt4J2KldnPAk5qtOQUf2ym9dBjXUJNbP0AXebo/AuWlAQ
         K7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656396; x=1793261196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=;
        b=O2TOZDXLnSMk/G7AjNA29camuG5gw2JClz3Nc48e8MinVuYMO36V1EQSIN6IInbWZB
         +kyfNcuEwHAZoqYb9vLExbqwwhqZZ4+Egl9/R+AV/ObHAgsArXx33LCU+0y61Gi/3m+q
         +64sKa02ucuyrjT0gI10NX92b2/NuARbPsmwATHZyLO0yxNYqHSenD6HhZUeGFZUSjvQ
         n75dfbdv2mwKegsjpqsXI7x5XDRhF98afOggpJNI9/NVAe1hHaedoRN3EiUCwKzR0gZp
         aiQkGtecgLCbaWzZDwQ2ecwGnc/lLIgOdRM0aIEwe+GU6SNuKUx4l3ErerFhtitRgm7B
         vngw==
X-Forwarded-Encrypted: i=1; AKwUvBy9auFEllcDsZUFGzpFhQrM68y7Byvb/vzeA+o0lRySkXfbyMewlvBq9txNKx10R2kSLack5tZnPdiF+Dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdSTtzGNKeDRCk7TysDgSAimad2WcTuft6l6+FphnBL/xHX2YY
	3zCzB5DpBlkiTA4Pg9DwNuCX2Gjkn1HUfT5/1WVwMkJmYAf2uhhBv34R0aXR0HJbYIbGq9p5otQ
	VlGQL/dwUll4K8ngBBGxlFK2rLGiPRRbsB7ooG350NvRjVhdIas1HFjy5h/NlhB+Kt6M=
X-Gm-Gg: AYBFou3uBXArmbGVs1n4KASb0yYd/op5wnK6Y6/wShG5Zk2Mg+LkV3DyG35Zz9ce2w4
	Ep2RNCUuPsEWeP4s4FtICHi7on1X2YpFL/YfKnQMtP6lipkmFyjtLMAzE9qEzGT20hmhcLmQVCF
	Sns77bmlugvae9lb4TNiXNDsn/up5d60Y4NhhV+tIne5HfPAsXvEozlKicim1aj8h9ExpYhHST8
	DO/97zM8xSANnN0r0e8pSQEo/6SlQDFZLjO5GSqAJ9IJbcJ0j9vAE3QrPs2lJsf96HgkiGuiu9U
	Zg+bwmcMdEpXJTEvO4RSmyfte6wgG6xtxlQkV6Z5egKmUN2+RWqtPk2U/uWKb1cWi4Pz09i4SpP
	1nnd4gWKdwz5QQr8148G94g==
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr79438571cf.5.1792656396246;
        Thu, 22 Oct 2026 01:06:36 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr79438221cf.5.1792656395805;
        Thu, 22 Oct 2026 01:06:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59d641sm79781066b.60.2026.10.22.01.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:06:34 -0700 (PDT)
Message-ID: <d1e5541d-3bbc-4079-82a7-b0b4d1604048@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:32 +0200
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
Subject: Re: [PATCH 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI
 panel overlay
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-3-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-3-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9c40d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=y-N8J18KE2yr1oCy9oYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: dYLmXwe3gGYjekhGjslB-oEDaLOT_UwE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXyrAg8UuAV36N
 ofYbDN5Jh4ew/3O4xedwYt51gNkW5pGntJiRFJPC/m0AjPdIKMKjPfi+z/I8Mg9oqUH2DMk//wy
 pOtNHslpIQDMeiCRNKWJDQq31GWHHMI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXyaVgAYY/+Fe9
 JC9ysescAdSfRmBDsfa5ZacH5Xqlt4TeVZVzHH2FyZit4y2RqMYhS4Fq4MKy5lJ+6bDJtGDUKg8
 JZPRurUvBtvUQm5K5PtMBi7Q0QLr/6EOapWbw/c7mQPdep1dtZFJYDfAGoQaNpRYPnTiaQsBAqS
 Oqe+7gcbQPLT656qMBvEysDAPayF9FFkch3tk+Hea/YO48L89E/TSrrh4f6a8UwJlyZfrrQsa/H
 8vACVOyQPMNfUWZcEdcaMHX2GWtCcuRZqgz5hHg81qMA5hnYh/Ey7OxpR4+B4sPgtzGZM68Nlgo
 7JrNP9/EMmtAwwsVRuqIrD5buX6VSanB/lo9b/iUi1dnSX5u2QcixRMZoSq3K+qvLyPEePozl9+
 yY/wGBjWuIoVrenRTzArTx9NDChkSArcm7UrhFpvje69OjxGX54D6rwxz8GTljcs+Rtb3cfT1BE
 gRQiqBIXCasWw8BPAwA==
X-Proofpoint-GUID: dYLmXwe3gGYjekhGjslB-oEDaLOT_UwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220032

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected
> to DSI 22pin on the carrier card.
> 
> DSI0 from SOC is routed through MUX which can be selected by DIP
> switch S1016.5 ON for enabling this 22pin connector.
> 
> Add the regulator and backlight controller at I2C2 address 0x45,
> Goodix GT911 touch controller, panel power and reset control, and
> a 2-lane DSI connection.
> 
> Disable the default HDMI bridge and connector in favour of the RPi
> DSI panel.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
