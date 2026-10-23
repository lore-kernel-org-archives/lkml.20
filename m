Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738838;
	b=CPOyOBKtzo6wU1ngx9+GWNbGDWLS7DzdahS7hJXYNDHOu8dOqfhb7DsJIj9Q0LazL5tl
	 42zd5mrd1tsGYmMaMsohfWs9JxhTuMBcDyyU7kwBuhFdzZwputvy2b7FCh0c8vBsmDS2i
	 noAIsDyyjcwNdw0wijY+SH0JF2P21+eXS11DEn2hNisVel8GRv1VCq7JQonVKgPw2R/vV
	 EJroxZ5Sg/5WGCYcb0pA4BAvSTaU7tWOeyP+S9S66dADRbrldotWrqJsoaIYv1xrrTqrD
	 iNq8bBFr+8MImfmG4aH1YrhYdmNXV+Uf+bV1ynXtmv/8ik8ZrPRrAFx04VoB4lTop3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Li6ecssWAKTyIqGTgzg996bMuxChvYuVzdJanfbIoyg=;
	b=WvnLblmbCsxJWB07kte/VZdtj1AiKiG8uPqm0ukvJPVeyuJzcdTnUxV5d4Bclmceohlv
	 HdFENp7yoNDJ5hk+8ZC+8DMbUcYa4FWsqnyp4z94bEpcB9zPeMFPnHb1z0MnU/eLQhciR
	 CLESquuD5d1R6PznIOVWndFuAQBCFflrYEGXfIs6HMbeqhHrmCEik/5pkYj9ysXrKRotL
	 FVDOGcQ2wTrUEJVgyTrXkrkbfMyB03BflIiX+39bwHqeWIoquNA2Uy4GS4O0Encs0LrC5
	 zr2ivc0Z96rgFNUM7mka0CMOVkDNkOyrru+HI8CjTPVnmHEaUF897kDrGVmeolxvwnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IUSmHvAs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NYJV1nS/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C310606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C310606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IUSmHvAs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NYJV1nS/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Esoe2376075
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Li6ecssWAKTyIqGTgzg996bM
	uxChvYuVzdJanfbIoyg=; b=IUSmHvAsgjbRvDHLbpw4xaj5zBPceQmfN3MLm7ZP
	mnLR1VvyQ2kZWRjklFKANC990rumGPWaIPxhGNHbhtdExLqBDW3WNJ2tsA6umb8o
	1dUshLtrNa/dSh3gUBmI5WQxtzjzGEPeidxX4So+81Yn+p8iQN2s5sgPkz9/F9mf
	9AGoFD9p4bHS0yBRwvq4WtAyIRv35LbK2ukBHwgk8IT1tR56zS4Ssdiez8cJV5rz
	Uo+ctmaH7uzwBS1OXopAZAT3nD8u7lNi57ihjHzvcqUwynpEYKSjsO2tCMKSik7L
	ZKCms9yi4lzAtnLSO10oXjFmINAxk46Nuq/RxmtwUBcWdw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrabh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:00:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e94a7893e7so1011175ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738831; x=1793343631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Li6ecssWAKTyIqGTgzg996bMuxChvYuVzdJanfbIoyg=;
        b=NYJV1nS/xhKwj/O96Fsh5VvCEwW2ttOfwNdkFQctxPrLlpEPV6XHFGRUXiyTUEfmHz
         Gks9vQjbevYihc9WoKJKyMTjr1ISkTZOcZhg8pzEVVs97L+P+RgmH047kgQAPG+ejmOP
         rpOXAeL2VqK10+ZFQjXrY97WJ+ZTiDSDKcGLFt7dsNhEf2AkVFLOOhiWVa00IGZZW0Zo
         MN/6+z+k2uk1/md+7/Dy/2fuw82shV32Ux2miiItesRTYNsQXWouj5weHXwatMcMT7yo
         NcHggEpJApEhbAZYPnOBpQ8nd0eR9iDmclg9/s7O4OFVVNgFkc/20UpYClVHGF+yZzBT
         +76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738831; x=1793343631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Li6ecssWAKTyIqGTgzg996bMuxChvYuVzdJanfbIoyg=;
        b=X9Fbx6ovm14v/GJnKARAXmtLP/X7EA6IlgPqTudMSLqSAXUl0kTlDIz7AXXU3Hq93y
         1F7wKN1oUKonlF8/JEnSqttb4pv6siPFCYQFKCjrH9KSw/v9k+5impizfukX8xTbryLL
         rD3If/yAt/dTTpwWgprLi6ZzZBSie7k6xgKktWcrN0pwufdE8HkaICHzyImh5HUTgvGy
         HUhw4XDvRP5ENlHRZpiuQO10CTuc5Cf/R1/YDJfE1aUYYCIe8jy8OTCwmFf2fO7iYOlb
         ozMEI6SsbCxE/KNfKdEzhLK9QDgNtMimewwc0ZS16RK7nUxFHB1K8eHjqvZA10EBqIL7
         1Qwg==
X-Forwarded-Encrypted: i=1; AKwUvBxDACGhsQdvM4Al84+zL5NzhZNwxHOBjiYewj3hB+7Y6f9qUZYnJgy3eHnszkuntMoMqt/2FBDL+iWu0wY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS0DeqpXnAGWkNQXtqmCTrn2lgtKu2Vnj5GtkRbZBdlJ6pL0qK
	CpWw5TnwElHpRzGV6Z/yRJ7fYXTwZLVBnGn2ztZeHtsYabyHA0eP5V8zjLfhRlfzABhYYgdo842
	UxdklL5pesMbXBFbLivnODsiVL2/n31eKTllNHCS/yAyiZkX8G8/+f8RzqbKydM+oq5U=
X-Gm-Gg: AYBFou2QNANX4hwxVY2POEez5yK/QVsJ8FQdV+jD9VNcsLIYBEi5v+NCaSNmF3Ha9Bm
	AjFhZCNUgBGTYk1qn6Amm9bSkxHspNia73nDX72P+HtkHgvr9sw3g7zZHiFeD1vsKLBGWjoShHU
	33J1kNN48iyc5rx4tnYnul4j1Ae7EZSuULxh82Ch7OJiUFMFdt/hSQmYnFnbpwV0fLj5Iqwiqlx
	AQHQpjHjclztZSV7fTUeCKtcBar1izlUaUdjFZfSw/qV5ytveMu4UGKPbhZQxhqg/4fTioO/a2t
	OxyFEIWlYZuYEeNrWrIFH4yT33/tcQFwILCF58PYuGYNlWiW2yzOSJOyKISLQDd8tFKtNoKO7GO
	TtWxbg8SgkqcIW2rBf61OT94/pLr93m2xargfEP0yhKsxqF+K9sLVLSxSA3kAuMz53pAdWxgJo3
	Gaz0h108p/9NPz9OI9PI/Q77yV3tCyMPqRXECTqaxFdH60nzJ/rdU=
X-Received: by 2002:a17:903:32cb:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea7d0c87acmr20794005ad.3.1792738831186;
        Fri, 23 Oct 2026 00:00:31 -0700 (PDT)
X-Received: by 2002:a17:903:32cb:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea7d0c87acmr20793695ad.3.1792738830688;
        Fri, 23 Oct 2026 00:00:30 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3bc54fsm6202865ad.47.2026.10.23.00.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:00:29 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:30:22 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 4/7] arm64: defconfig: Enable RPi touchscreen V2
 regulator and ILI9881C panel
Message-ID: <atsGBkugguCQmOo4@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-4-adaea735999f@oss.qualcomm.com>
 <4b05475b-443e-49d0-9bfd-d78388246706@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b05475b-443e-49d0-9bfd-d78388246706@kernel.org>
X-Proofpoint-GUID: ZhbozLP89Wu0hKNACGhV8WlNkzKxSmWe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX94LEy9OfgALn
 bHOlz8MGrRKA/DawrmtV+EIw/ByN8VlTeheoPHwqB7jxKtNGlLpSW1G9ltsOC2Wt9JE7f0xjb1O
 HobGflKAse3zXWgAueFjuX1SMlOF2SU=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb060f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=nis2Za4te4CX2erPvBIA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX10t6hd5UfqkG
 Lb/mvft90WtgfZaT0OxO/ZCYgraUnZq+ohJFu4TDPggtop+WtDGS7+F1fEKxbp53e8hZBtaKAa0
 DCB3VaOcFaL90fpCvp34+HEOI4RG88I4d234n2REnJsIoiD8+LlVbEasgz2Lfud2iG2JE+91+wd
 qHVdtCCf1rS7bEIXgLb3cI8DP6Vithy+4DQ/sfJf/gUQGI3OMF9tQ09ekKH05yIFZQpzhJjypDj
 oWMl2xW8Xa6H72ema75Twb7LYt8jDkPmpBD4zvRv0ybG1M9ItQbDXZ+1XRmsagN9rriWg6ZVan3
 /UjcAkrA6fOl0hRzudrNiRhG4UoM+gDHsynYoBlIE56tdUHvrATvMVROXqCS3/PtOc2zdEe1rfj
 2nl0tRA6CFtBMVSJ2dS7fTjNxAzL5HUfbkRmA5ASdQz2NmGd+WRX/sJqSrS4I338YWXwZH6PAZY
 x19MpDlLAmklTsCAyeg==
X-Proofpoint-ORIG-GUID: ZhbozLP89Wu0hKNACGhV8WlNkzKxSmWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

On Thu, Oct 22, 2026 at 12:45:50PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 16:21, Vishnu Saini wrote:
> > Enable the regulator driver for the Raspberry Pi touchscreen V2 power
> > and backlight controller, and the Ilitek ILI9881C DSI panel driver, as
> > modules, for the Raspberry Pi 7 inch DSI panel on the 22-pin JDISP1 DSI0
> > connector on Qualcomm Shikra EVK, Talos Lyra EVK boards.
> 
> I don't understand - next commit is saying that it is enabling this for
> "Qualcomm Shikra EVK, Talos Lyra EVK boards."
> 
> so why same work is visible twice?

These defconfig changes are required for the RPi panel, while the ones in the next commit are required for the Waveshare panel.

I kept them separate per panel, but I can combine all the defconfig changes into a single commit if preferred.

> Best regards,
> Krzysztof
