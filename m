Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354878;
	b=N/2BDcyCfCWNfVP9R7BgnFdtVPseL9s53VMKxtaDxGJLBBjGdS5gfCj6LQFrSCdsqOA6
	 xAmKhoHfQZ0BRNp62FE3zsUfY8pDKNi8sraTjnuffiF9DCqhQrsU6kBMpoMApVCE1ijBZ
	 SVH0vpRzCqM2qPaVodVNQedizAE0QxIJsAZi5g0j/OOxa15zVZ2yx1CBczBI0hwXhMm9x
	 BiJ+3mbc1GjdShh5DwLWb/LNIxB+487AKqgf/oWTqPWr0WGF2ZiKzVwK1MygwHxJ8ZcjJ
	 PNWGe1+FmL3TXDcJOMEz9PxCvEOsJ0FymRQwv+yVEG185FiG/sproOcGINzuqx/Av7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fFw2JY7XwMZ2sA+DZUQAT8/gG6Jx9PI14r6vhW0USDk=;
	b=Eup+atAaJBmnKM4/Q3vFMbog43Ika3vPx0pxQ2Q/i4C+3ZoY8wEW+hEcPJwP4EddnNUs
	 zSBR9Sn3JiY3A/GUbjZ5P4J91NJO6N65vI5aBFXo1Q8rKJcElLtBI7eesc0xO9cZJN8At
	 qroUS4PvbcO9p6vfglU3KOrAcPaS3NMMdKUUV3H9Fz0jXB5JexZIz+T7pVt07I72uRkMc
	 LZRIFI22+knnmcd6dYFNPFLIvthXCLbINnlpLS8krukFhrj3+vcBUMJvhSmAFe+BpoP46
	 Kj1FN+iiFS76+yau9wPAK7g8spP+8cgp1fbEEbSYZ9sXPOsqhE9zu44tlahWWcBYumg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SfeuELYB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i9WqrQXB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743E9606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743E9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SfeuELYB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i9WqrQXB
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKf3B3061008
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fFw2JY7XwMZ2sA+DZUQAT8/gG6Jx9PI14r6vhW0USDk=; b=SfeuELYBGwCg4e/u
	hONBbZpGln3Lm7YpbbUq+pAOeKUz6OG/FcCeuL+UZmAE900vVqtBOO47wOq/rqBP
	KkBEg+ivEr1EsFmCaVWklVYl3ssu95uQKTlNP2kdPz7AKTrBQ26HFQJS/TvhRQ05
	V4ubZ/NN5jbl2O4h+A+1wqCnJK4QUwSUJFZKyeQhhcTccT8sjjm4bfOD1WP5Pz2c
	cwy6y9Mlv+FHBa+9miqyYryG6iPViVrdrV5CKlaawMbzg4OoX2Er6UjL0EjTMMAl
	2/3wizyOCrZdkGlH2+I5U6ZYD5rbWmvtuCf2QR/1lcmd5EUnht/h0LTwHLwyrfSN
	LtCiCg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b30x05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:54:36 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b5b49cabso2253974c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794354876; x=1794959676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFw2JY7XwMZ2sA+DZUQAT8/gG6Jx9PI14r6vhW0USDk=;
        b=i9WqrQXBVOK/RxX/NXThbfvT6SyXXtyZYjWuIcOYGn07KKLd0eH7daIPPlZXopI8Fj
         W6dwuE7ss6mWG+qIgaRGgvT6yJGWg09oGcKGh4P0wJ+UVHxm6N7Ze8XLg98T5jOX0u/o
         hXKo5XZ9Gbzp4ETpQ5lObAPv6eNg8TYBb1HbuGjFgqwE5pf/YmxUyJ9xxEJYwwvEjLry
         ffv5hB7Ksq4X0GvWIuvjuiR9lGm6ttmqe2jtRBmkkCYiEbSw2uyZoed6nT9j9DUtxvo0
         Igc0Zn+aS/q1MnKmMADQSC0Gl9IAamYXJxBB5aX/RN5Uk8Ogd94Lca011/cEWY4Kxd2w
         6quQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354876; x=1794959676;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFw2JY7XwMZ2sA+DZUQAT8/gG6Jx9PI14r6vhW0USDk=;
        b=a6jSOyFKTcspxFE2Ck3zSfwO0ZsKLqwwTe26671aTBMYwgaRyIv09WpXKoLL1JQX8P
         cjeJoKuGpuXiqjsFpezfDgwe26MdwOupYph/2bLyozsS/pdkjvNJv+tbO2b2IzL/NClm
         9TQVEx2R8Szikz3uhL+/r9C5yWlZvGQDdmmJFZuHwmpV/As5E9iEqXWvKODH34w6HRzs
         jaErMqqJs7196Mrpz0F3gmooKAalwwhAdapiYk5FWsKaQILj0GYyCvGUMXVwWyryt0Zn
         spLJznIVg5KqKGOAmSiT5TzEF16yJTQdOoiJWkA9cdrMFLwCSMkK4Eb3ruF4Gg9J3hxb
         kLBw==
X-Forwarded-Encrypted: i=1; AL+hErE5RpR7jvi8msMYt1kh9fcq4lqjEKbXEXifpUt58VHl2r0Sbegq15hOykRjWYsJWOw68Pc29T9u4xEwBzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z928NIJq5Y0rLKRCHm0UQfTy7rEf5PvQNwrHWXG6JirYnpdVGom
	g3JW0I8j2u0IV/uh5uwXHsEPlUyyWAadjMPgLw/xlgLyxSe+vcOydwv3hlL9rq2CAXlx1+qJSow
	uOhgRlkC5zZIB2kmRHwBAkEVO87Mai2TL/0Nh2q7FGRKRy2FRlSZ9nWgIk7y/TBHtYD8=
X-Gm-Gg: AYBFou1FNPJJFjntG+EV6eSwo5DM7v4dD/sdJwnaDvGXBTAQUXKikytHeOnvuQEUGpS
	rG7s1FnNizKFB6cVnv7MUwpIduFVKoGFGGYBlwYmgKQShegTMwhQ48EeO3g9y1h3622CrF/EtCH
	5k2ncYNcYapPvdgwAjRT8dNrPK5YUINqUZyGM1IL24hO/gEInS6DqpPmTB/1lYnK5x9gxTVOwbA
	5aBCKl8b+ZwXtwBRwakK3bdLVBO6pTraw+TKFKvXC+G5HL/s3rNZ+lsJmQrrqAZf1pDdAZjdkFA
	yXhaSyOZT+O7qswnFAKuFOCI3NY/ei+drCIuTSEJfz+jAsDIeoYgQyJE6GLvNsNy9Qd/2vzDQju
	kUJRtT/32ZjhZ3ULNRkzSS0lMKcgZLFQsHm7lXGj5GBnz/0zPld4Cg8SWwFApDYTPS8AzOyK1Rv
	GRXkivK1goYMVgNFWXdFVV53E24ZpioA==
X-Received: by 2002:a05:7022:b058:10b0:185:33ab:4d55 with SMTP id a92af1059eb24-1b3c137c87emr119577c88.29.1794354875713;
        Tue, 10 Nov 2026 15:54:35 -0800 (PST)
X-Received: by 2002:a05:7022:b058:10b0:185:33ab:4d55 with SMTP id a92af1059eb24-1b3c137c87emr119546c88.29.1794354875021;
        Tue, 10 Nov 2026 15:54:35 -0800 (PST)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4efc2sm8844926c88.15.2026.11.10.15.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:54:34 -0800 (PST)
Message-ID: <d5b379a7-5796-4231-90d8-e33e24c55886@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:54:33 -0800
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
Subject: Re: [PATCH v3 0/4] phy: qcom-mipi-csi2: Add D-PHY support for
 sa8775p, qcs8300 and sc7280
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af3aebc cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M1MyrToEFICnjbQwadIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5NSBTYWx0ZWRfX9SrfMONamOBr
 XLPqTZQf2nKm4ZhIN+Fcxx9fzLJ/kD7fSaDro1Tm+LKRa8LZo/XyNiqXeAvrLPC94GbKV+Tg5zT
 UQ3DGcD1t2jrI4fJXseuzMeRcwSTIBXHv9p6qTCDPP8jAsWWSZPGa/XcJP0/ni1EMflY5Oru+nA
 vdo9UOCrHbQFU1+2rx0cglaFr+H5xRIcUGstnJlLXEvAwKFLrC0LRzSk9RwCrxab3JVkv7nX0qy
 6VL36gGX5CKF2llt9X52GCPYfqsRXs2viqhyrFjiIH3TPYkbmPScDnZCijTb8XPXOQd+gmBmk+d
 6di8zfs0CTvWF4peBZKY00sI55jgMkSjFygJV3HPi7BTnW/lynJ++Eo1RA42X1uCg9bcSlShAJh
 x3WqKRKn4BjbcGWmEvD3S5kpdvrX+sE+cja77126UDwlES7HjvDhyQWbtNFQegSUtiMZS0cjgMb
 jUWMKs4R8zDNpS7XYVw==
X-Proofpoint-GUID: hR3cOQQp8mzDj4XcSnczZH-qR9K-m-Tx
X-Proofpoint-ORIG-GUID: hR3cOQQp8mzDj4XcSnczZH-qR9K-m-Tx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5NSBTYWx0ZWRfX0uXC75gVlZg6
 md0Z4fm9TKroytmPjEjPWJzg5Kwe2NgA+axzpdmf9cTsOrMPCYnoJYWmDaXylzRfyA0eapEMEUO
 +XQiHQPUDMX0z5KtRMYsZGM7fW2gIsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100095

Hi Krzysztof,

Sorry for missing the answers in v2. Here are the answers to questions
in v2.
1. Q:
https://lore.kernel.org/all/f319ba87-5569-4323-ae4c-3f9f34a9a3c1@kernel.org/#t
       v1 link is -
https://lore.kernel.org/all/20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com/
      v2 link is -
https://lore.kernel.org/all/20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com/
      In this v3. these comments have been addressed and updated
accordingly.

2. Q:
https://lore.kernel.org/all/a103b49e-e13f-4c70-b9a0-261534cfef79@kernel.org/
   That Reviewed-by was given in an internal review, not on a public
list thread.

3. Q:
https://lore.kernel.org/all/fe8bfa99-3fbb-4634-b99b-a36c2f8b35e5@kernel.org/
   Agreed on both points. Why it existed: it wasn't added on a guess
that some SoCs would need a different names. In v1
(https://lore.kernel.org/all/20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com/),
timer_clk_name/opp_clk_name were added inline as part of the sa8775p
patch itself. Bryan asked only that it be split into its own standalone
patch ahead of the SoC
work(https://lore.kernel.org/all/392642ad-3bac-48bc-9199-8c3923c588c2@kernel.org/),
not that the configurability be justified or kept. I did the split for
v2 to verify whether the original premise still made sense. This driver
does not support platforms such as x1e80100, sa8775p, or sc7280, nor do
any of them ever declare a different clock name.
  Dropping the patch entirely in v3 rather than reworking it.
"timer"/"core" go back to being hardcoded literals, same as before v1
introduced the configurable fields.

4. Q:
https://lore.kernel.org/all/8942bbed-cd53-44a4-8559-c18fb2073bb2@kernel.org/
    Reviewed-by: given in an internal review, not on a public thread, no
lore link exists.
    On sc7280_clks[] and "what is the point of patch #2", the array
itself has a point: each SoC's soc_cfg needs its own two-entry clk_names
array matching its DT clock-names, same as x1e80100's and sa8775p's.
What had no point was patch #2 (dropped in v3) adding a second,
overridable name on top of that array, timer_clk_name/opp_clk_name, when
every one of those arrays already says, "core"/"timer" and nothing ever
varies it. In v3, sc7280_clks[] = {"core", "timer"} stands on its own,
unconditionally used, no override field anywhere.

Best regards,
Anusha
On 11/5/2026 3:51 PM, Anusha Arun Nandi wrote:
> This series extends the generic Qualcomm MIPI CSI2 PHY driver
> (drivers/phy/qualcomm/phy-qcom-mipi-csi2-*) with three additional
> CSIPHY variants: SA8775P, QCS8300 and SC7280. The driver currently
> only supports x1e80100; these SoCs let CAMSS consume the CSIPHY through
> the common PHY framework instead of the CSIPHY logic embedded in the
> legacy in-tree CAMSS driver.
> 
> QCS8300 shares the same CSIPHY D-PHY hardware as SA8775P, so it does
> not need its own of_device_id entry: the qcom,csi2-phy.yaml binding
> declares "qcom,sa8775p-csi2-phy" as QCS8300's fallback compatible, and
> QCS8300 CSIPHY nodes bind through patch 3's existing
> "qcom,sa8775p-csi2-phy" match entry.
> 
> Tested on sa8775p, qcs8300 and sc7280.
> 
> Changes in v3:
> - Patch 1 (binding): renamed vdda-phy-supply/vdda-pll-supply to
>   vdda-hs-supply/vdda-lp-supply, and restored the DPHY split-mode
>   port@0 definition (two endpoints, lane-count constraint) that was
>   dropped from the combined schema, cloning it from
>   qcom,x1e80100-csi2-phy.yaml instead.
> - Dropped "phy: qcom-mipi-csi2: Make timer and OPP clock names
>   configurable": no SoC this driver supports actually needs different
>   clock names, so the patch had no real effect.
> - Patch 2 ("Make OPP table optional") no longer depends on the
>   dropped patch's configurable opp_clk_name field; it now adds a
>   plain no_opp bool instead, with "timer"/"core" kept as hardcoded
>   literals.
> - Patches 3 and 4 (sa8775p, sc7280) dropped their now-unnecessary
>   timer_clk_name/opp_clk_name overrides, and renamed their
>   vdda-phy/vdda-pll supplies to vdda-hs/vdda-lp to match patch 1.
> 
> Link to v2: https://lore.kernel.org/all/20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com/
> 
> Changes in v2:
> - Dropped "phy: qcom-mipi-csi2: fix -EEXIST probe failure on single
>   power-domain SoCs" from this series; posted standalone instead,
>   renamed to "Add support for single power-domain SoCs" since it adds
>   a case rather than fixing a bug.
> - Squashed the standalone qcom,sa8775p-csi2-phy.yaml/qcom,qcs8300 enum
>   addition/qcom,sc7280-csi2-phy.yaml schemas into one shared
>   qcom,csi2-phy.yaml, modelled as a oneOf compatible list instead of
>   one file per SoC.
> - Dropped the standalone "qcom,qcs8300-csi2-phy" of_device_id entry;
>   QCS8300 now binds through the sa8775p match entry via the binding's
>   fallback compatible instead, since the two SoCs are fully hardware
>   compatible.
> - Squashed the separate "Add qcs8300 CSI2 PHY support" patch into
>   "Add sa8775p D-PHY support" to match.
> 
> Link to v1: https://lore.kernel.org/all/20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com/
> 
> Anusha Arun Nandi (4):
>   dt-bindings: phy: qcom: Add common qcom,csi2-phy
>   phy: qcom-mipi-csi2: Make OPP table optional
>   phy: qcom-mipi-csi2: Add sa8775p D-PHY support
>   phy: qcom-mipi-csi2: Add sc7280 D-PHY provider
> 
>  .../bindings/phy/qcom,csi2-phy.yaml           | 201 +++++++++++++++
>  .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 228 +++++++++++++++++-
>  .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |  74 +++---
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   5 +
>  4 files changed, 474 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
>  
> Best regards,

