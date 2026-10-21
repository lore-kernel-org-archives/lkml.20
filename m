Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576705;
	b=eXF4an1UCpv9sEa6h/YSSxF6p5FraxmVI3TZjgZ9tdKAtNRqBEsLioZyzwoLCq+Jz904
	 RbIC01epOAByTs1JzlxdZBt+6+tjgFqfBH5zOFOfFWr5HeWnJrZZl6Fr2Pa6Dsy8Bx0TK
	 cASQFLvJZ4OipiP5dI1q+c5lBiRsArdVrLEUGJjBHPBEaiafxjYc42xiUnJAlmMK2TnvT
	 xSlkf4wx+jc46qlJwF5nIA/gxCvApaiqqiNbO19bALOI2WS2ndi0wfZSzVS5oQDYEw7BE
	 j/0d+8Bth8Zo4wOqTIuukngv6OmCITs/RCnbS1+Yn3kgOnrSHXOFMLZRfpzseyTRdVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/ubkfmXIxB950gCeTdHVEMg4HSbfsabXa8swan3tUsw=;
	b=MCcxIEuoXxiePQoGRlEVYOgEjrRZl1s9hMG1JtM/omoZyYCLoAXz2mTPB4lNUBDw+IH3
	 zDu5bCTWL84QHVQf2YeWsN8EX9RH38WBDYsYqJ6rgWKhsbUdIWkLMOROPFHAiywsQtFVM
	 9wao+Jisk4rqr/FUGRG3MQ8637B3fqm27FQuSOwFJO3XevljeVgw20srWA+Fj95c9EtGs
	 TbRKEo7fDpZ8JvsPBX6WgmJ8Nm599sHUaKjdmlqFDMHTzXkrQNf9w/QI1h74gJo1PzNcb
	 AGDPH4yQaO542tyRHrZpDkofqNe4YOO+0H6atOmguiJAXNAu41riueT2PWLykW40iZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qngahx5p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ATxLwt/G";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C8D606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78C8D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qngahx5p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ATxLwt/G
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j9NY3711583
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ubkfmXIxB950gCeTdHVEMg4HSbfsabXa8swan3tUsw=; b=Qngahx5pOCG+dLa4
	bcvXWYxXpFEwiR3NldD97e5gsW9PhD5dA2oAugLcc4902BDv4ddgLIshLcYA9H1P
	yCuP3MCMqoKOT5ehqYwiph0qW9NRZk4YqAEhiP7Nf95Y0yeIiWLoamD0ArxsoAxP
	E2T0O7ukTops5IbswaPbmj0pbNkGIH4t+oW3XLUhMGVHtZNkrggmYZq6g+qCE/0l
	MSF0H/1LNgSiy2gQbaPrJngQG+AMAv0xWn4hhNF+wxu6rjBfW9hAJXtwPlZG64E7
	mQHlz/YO54dJOiemhz5MRe4qE7V8l5xme7umViZ0mA0yN77+izclG2k2tiF/wT6Y
	U1axKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3dkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:58:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533962f6bc9so1505931cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576702; x=1793181502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ubkfmXIxB950gCeTdHVEMg4HSbfsabXa8swan3tUsw=;
        b=ATxLwt/GLyy1n6MkFbI/UeEtfWEn0bNWjbrlVsEezOBV1N67N3XaJbiWS93+9ar4P1
         tsQT+rKwSOrhIMSV+pg7noQZICpvnrGn09qLQRU5kxnWAUzcO3wgsudL2nZ+1wRdLepp
         4LvipbWDpRUey0ArI7zTS5rR/SQTRJe5RZCjyalb4IGLt/HnISzLzAFPwjvbBlvkh4Wl
         D/cOK0wR8CtCRa71O8W/X8A9HdQSQ412k6+L3YDzqVA9qJWewI3ePazZkFIqKbRcP2Ys
         2HquQ8qSrEKDnipOV/gLk0BVIex1X/c2JAbNEJHewSrIJpYQYZeR5go4oOmgNZipbVJZ
         8T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576702; x=1793181502;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ubkfmXIxB950gCeTdHVEMg4HSbfsabXa8swan3tUsw=;
        b=lYKpAyNTNFGODCgbcvBEmsS4UaWN2T+yCRVoodlYwQPKGh1Imruc8KU+ZXNWF9JHFm
         nTNCzlU1gWYKGnEW17nFOFjdaeZVe2qukHbaHjRHf+6H6tfS23+Jd1paRVnVShNqbxLw
         YZiItbQoz/6IBOoTQVLTTb9yQSa1tqlze7/Ia7pfIbv3qFb5Vuy9LyMbrIPQoZHWz+KE
         /CG5YWRr9rFQhrzfhtwNtfQ8LxYMnwOMZUBPpPc4gRHlCx8gO72Rd6ZKWiGlEl64PE2L
         GRF4R8v/hYKt87UjNNww8NLp9Hq6qDPT9eFHiNgYpzZFL7jCDx+7jAeSV4lw6KE61N8s
         nOHw==
X-Forwarded-Encrypted: i=1; AKwUvBywZGhsWkcF46PBNvWNqNCwqmnbL3lC+SMEVyeBEsrJsrY1jndWKKg1nEPOhiQBzTg15eny0yfLrci09Gw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaJ4NMzzPdvACw85P1YPg3sxgzs2s30ESySGDXCqUdRLxEpSgn
	1rUkpf3186Q5uvGhhBBTtXTd1mbecXF13kaO3/XEEcXyD5YE2NzRlBsBDVblseNFyTThEZaM5Sa
	k0J8D0g5Bmzn5Vr4KDxl8gjNLL6iDYTY25mqRvbwdjX5yNKZLq35puSpUBvp1LSyOiqI=
X-Gm-Gg: AYBFou2NJPa7wr2uqG2y7YD6+6nQuUobo5hEr1e85e3GVo37scdWTdw35WlY6Yr0jMd
	DOQZL/mtLnRN+IMm4Y2ksQhNTWIgr5N7TLmI6BJiE7dYAHqNQP71GhiMg1mJMPDeUBiMHXt+NEC
	Om8O1qc2onvpBXVeGtlCuLaOs1vt3/QjTPMsEF9ela+Xm9jTSGUaYJn9lDMqaxE0pYB0WxZKTGW
	aQfzwCJ9WgKbOoLkDLMTFJhHCQvwv52E5Vy/yP6uzptMwOorHlVNg/9iEwCd2l7bN1qlvg2HmwZ
	R8UQABzkSg1X/bU4Ws9wqF+cPJxKCvn9Mi9lbsZhjBu1oqzzFKXER2PsuL6fHN+CBgdyOKNkycR
	UVKJgVezJMrsV7lZeG4fidQ==
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr30062841cf.0.1792576702580;
        Wed, 21 Oct 2026 02:58:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr30062041cf.0.1792576701609;
        Wed, 21 Oct 2026 02:58:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678faa02dsm60710266b.40.2026.10.21.02.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:58:20 -0700 (PDT)
Message-ID: <90e14985-be2c-41cb-be74-60ca1829322e@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:58:18 +0200
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
Subject: Re: [PATCH v3 2/2] phy: qcom: qmp-combo: check qmp_combo_com_init()
 in the typec callbacks
To: Oleg Keri <okerixx@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260916133814.3977-1-okerixx@gmail.com>
 <20260916133814.3977-3-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916133814.3977-3-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX0t6Hlc1Bkvuv
 ZNd0hDqXuAazSYth7CnYmT+XjWXiM81s6u+aBXTaD+xOUjXiBvcn+CYB6IrI5SrLokxyeXaXqoS
 lDaqs445DdUHaThs8JLCm3NAb5Gs++U=
X-Proofpoint-ORIG-GUID: 3Jf2aWaJQ4-ONP3cRbGrnhV6vB7G5bdr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX7iHv/yixvs5l
 0JwOWC6maCD8nUVht7E5uQmwxHqVYHAPtEx5dqJy9v0E2elCNW1tkpCAxERQD1mJOciMa1yEg8q
 I+pvXmw6YW51Lq0EnfvqQ8+jV5KIQUljaZ+csKHGpz4iCl5lEAUS6tizKqAei6HWAvSiEXHWz9e
 Wpr63sD3JUeyfNxmqESH4hGwYNYXYFcLvAGi7klh2kfr+c7z0aUdgqdA2sRHAutfB3motSbR/AC
 yWJldczJ8fkYDYAij8krCZtEoHK/R0x8uzUT+QvOj59gPXZruvnJafDv+D4OyIM2hTUk4AfaQK6
 XmRH35UxFkdyNq/wF6CktS5VGAPd3xbIlpsirSJNqh/RZGHoiJ+gOcPQ49ZW/6w42XCUDDb7PR9
 L9eamV3FkuUS4dCCr9krRZTFhW/l9vB40tqxUaWHBrEMxsVhp0w485ugyPwggFzRIgQ/QnaurSe
 ZAUtZ91cNGYmAGiPIWw==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad88cbf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=jGh8KTe8EfAoFKc4BLQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 3Jf2aWaJQ4-ONP3cRbGrnhV6vB7G5bdr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210039

On 9/16/26 3:38 PM, Oleg Keri wrote:
> qmp_combo_typec_switch_set() and qmp_combo_reconfigure_phy(), which the
> typec mux callback and the USB4 init path use, tear the common block down
> and bring it straight back up on an orientation or altmode change, but
> they discard the result of the bringup:
> 
> 	qmp_combo_com_exit(qmp, true);
> 
> 	qmp->qmpphy_mode = new_mode;
> 
> 	/* Now everything's powered down, power up the right PHYs */
> 	qmp_combo_com_init(qmp, true);
> 
> 	if ((qmp->usb_init_count || qmp->usb4_init_count) &&
> 	    new_mode != QMPPHY_MODE_DP_ONLY)
> 		qmp_combo_usb_power_on(qmp->usb_phy);

Sashiko has some comments which seem valid

Is this something you hit in real life, or is that a static finding?

Konrad
