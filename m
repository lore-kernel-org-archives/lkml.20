Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8667C4825AB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401163; cv=none; b=KFkclrXdtUhGyVGeTHPzSKY6nHaMbg4S6mqBR/5tksqVGKSdtiD1350vW0sk+uzV7kQn30u7R+ULmrgV2tf0H+O5eZX/p/17u4BzX7FOhWbszo0jIgV7Q7UWfn4LHTUO5qcRIHIjrBn2TWV76MVs1gdVzWDYXtwBDWObzsbJYsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401163; c=relaxed/simple;
	bh=HIk1IpHMIoS0JC9EwLMBzSzfIUXCdtc0LgtWZRJBnoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxzp/LhHvNrnulb/bM8uCofcwA+BFwwVi1rHRwZ84HK3YbdeokFALEPRCMrBL1loQId52hRwDVz+MqwZ6kdpuFamKSpvEhKXlIYuXKZ/wxJ19KpDYlC92oMp7s6c0L+LR6F/V4OOFsJtjonazN/pz9r4/a3cgFyoTPCy/PjxKvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpKZIH2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXpoo65f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpKZIH2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXpoo65f"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0YPd830679
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=; b=JpKZIH2f9DAXQmXH
	2iSP1VdlpJ0jceUw4F13wvvmhwgtDHYwagzFi0IhLy8fWf1EZBTsFWgxC2NtF+td
	1WB37/06bpqcAzlBAvfooguEFqC49IGSvPVLEjjDniBT5Wk0wufQgO3pvEHhA6DR
	vzmq7nW95tq33wdbJ61049JaWHRe3zZQo9rYHgZSTB3t9nBRWzVB7ZtP/fofSiWi
	e7XA9fOcoKAvtOLodW3OMJ5HOzHr8EhHdSiHkovtecswNEkJ/z+6GaUfDWFH6tn1
	lLDJrJtF4D74EaNcKXw610/z4fDiD6TCkV8IMdJyApCyirO2+QUisvflLq/wqhrD
	t9dkSg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsu8dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:52:40 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c833d4bd04so1167643e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789401160; x=1790005960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=;
        b=BXpoo65fycPbNdNe3FLAjfX1dzcYEzO3xRoSnQIm+Cj2pa7L5NrNv2WijhIkFfGNXi
         Q2QJBOCclSlsR5J+vIbT4QGgVkOvuSF4XxlzZcZkYE/vdjAmtZgaVPRKJD6Aiqbk7E6Z
         iYedvPzxWuRLL4SONWEp5cRQDm/4ChT0lExJVcwI9cha+zrGIVnS2M/0RxZBLpWvDfPZ
         47QIIPmv9RuGxJadHfnedvaItZzCqxYb4AksZDv9FWW3edRitvSo1gQ32UlCq2zi9mWZ
         egfZ8DsVXoQ6+f70pSYD0pQH5FHuZy1oBzDzIzORVc3QLsTHTiQ0a5gpztzV/s+83oZI
         Xi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401160; x=1790005960;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=;
        b=H3DwMb06ugscWiEezSO0gy5YfEkOudR7bSD3/SoUi36S95W7Mc7y3/v7vmbEl9O8ms
         h11DlCMRtljmAAK7Ig83kinuWIw65jMYaEAh+Cc0Y9Zst80UhW6MYNpQkzYV2NSK8PRj
         LB3faHHJeu1p55Q0livaxlPO6+FB+avJAb3of4Xv31qrDt9i9AWu0AvV0GhZIBX8jK+F
         39fm5fg4wGud+CX0RDLTAlwffORe/tK2zNpqRr2dnCuZ734CMj+9v+xqw8mDGnUTxhEF
         cD6vp6TTOKG2KiGh+/FwSwHuCKAceLdDfYR5t7uTyGiH6vpL2xlX7FQBidblwQZTyTeK
         v23w==
X-Forwarded-Encrypted: i=1; AKwUvBzBuSB7xAUft8H8GZ9Cxl2mH5SrSz6csOn5hQI29U92NnbLUU0KvmFRpydlla10t0Lt4PZ6M7WYdIvEzXE=@vger.kernel.org
X-Gm-Message-State: AFuF++lR6Bt6BPbTmmzhR1aTT2J5RFY6+icAEwn8reWTTdZTl+Cz6Rnu
	1e5Aw28x/03Z3YleTIQaN4drM6f5g+QsK71CDQOwAkfhr5o7VQwNzHGAhwuN0BrFdb4M4itnKQd
	sNF9nFCOsRWf4YUyL+GIqsrZoSETBE9FRfLd7ddPWAAijQRMJUelgcIJb68+KGX3nVso=
X-Gm-Gg: AYBFou008axALgjauHF4DZLnO+oGV8wZFcBJ5EXGg4pb6Nu/n98/hF6/XhWC6Aq7C/k
	OZVfflidSO5hgHHKw4Sjx8sh/cdf1ksePUigLuspyOvvMkrqn5aEGYuHwWwqd8ep0xYM3Trp15i
	zoLCUON0VK6acSn9+/RPbtfT/Oi2X5QHWUYBhsM1pGhLUR/kc57CQ4bTkSH5lKi2j3gVNDUCZi8
	GWOxlfhQqGaRb3l6OSemyRPh5RX/67+4hJI84IgWFbD+Pn77ZoVtRZzLNyEpvUVWvu3nSLyuRLp
	1zVyJQ27DlCMtqN0T+wR6b8q6jo/yKg3rbkGKd6j7dqCLD9HzphyyPKNaABiybv2scN9tV5FHtn
	C6nqSuokfqTtaeh6ZutWbtPn30bqF
X-Received: by 2002:a05:6122:32d0:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c981d701dbmr3781385e0c.6.1789401157365;
        Mon, 14 Sep 2026 08:52:37 -0700 (PDT)
X-Received: by 2002:a05:6122:32d0:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c981d701dbmr3780433e0c.6.1789401153186;
        Mon, 14 Sep 2026 08:52:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm22926613f8f.0.2026.09.14.08.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:52:31 -0700 (PDT)
Message-ID: <3bda35ea-1f45-4cc1-af1e-7f1513651b60@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] dt-bindings: net: Use consistent indentation in
 the example
To: netdev-bot+sashiko@kernel.org
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, justin.chen@broadcom.com,
        florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, ulli.kroll@googlemail.com, linusw@kernel.org,
        clement.leger@bootlin.com, olteanv@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, hayashi.kunihiko@socionext.com,
        mhiramat@kernel.org, nbd@nbd.name, lorenzo@kernel.org,
        ryder.lee@mediatek.com, shayne.chen@mediatek.com,
        sean.wang@mediatek.com, johannes@sipsolutions.net,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        jjohnson@kernel.org, richardcochran@gmail.com, geert+renesas@glider.be,
        magnus.damm@gmail.com, yongxing.mou@oss.qualcomm.com, rfoss@kernel.org,
        abelvesa@kernel.org, vineetha.g.jaya.kumaran@intel.com,
        claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com,
        elder@kernel.org, s-vadapalli@ti.com, rogerq@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-mediatek@lists.infradead.org, ath10k@lists.infradead.org
References: <20260913122910.99457-3-krzysztof.kozlowski@oss.qualcomm.com>
 <178939022208.22033.14553895731937911806@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <178939022208.22033.14553895731937911806@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX8a6LOjn9KWxQ
 DGjFzrsWi4lTdiScm48WX3z7Nzk+7pGjq2W6LfGx8+ySg7b7EwG7UfsvsmjZvs60DNgbwxDobTQ
 5U8RwCG85bvnpSIyBkogu7yJeLD5BGJsN0onWYQRHX1e/h90Q71+yHMGIBVOtDYKg7d+CaDui1/
 xboKex3SxIjd/cq/+1GjRMednhCo+VWE+07hbNcK8n0Tvlv3FGDXrsK7ErprbFSxcjayM8zUQbN
 a9PIewi+9RpeDiaShXo2/t8wOUIQx5ABKWHUEH2QIhT+kqtOQ2+Sx8MJwJN3oAde3/tsZI83PoA
 9GNI5Z3gZg+fkdwUg9ZII+f49oUZfZXCBvwI0gpGhNbQs2h6LxoNRWQbhQizZjd9furJkw2kCg1
 f7YnR0tKqsuGIEz0BgIlsmMaKOl5A++5M/Vl5aUwS0F7mGhXA97P0LneCTCWuLVWYeZffgwfwZq
 ziMhaQxY4O3A/nPmxdg==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa81848 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=JYzT5DUXXbXYkYiThRIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: jkTNvBgjbOXA7IHPjZLr8HU3apZNCGw0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX9O6sARVDZEZt
 CgPCUQ5yScNUuJiARvTfxOtIIlYZ8L71Jf31SwuAslg/IeybOjfleIad981HtYasQFdStt7bjxb
 coebeBm7hq6Q7lU+IJIdHvyxRLRg8uk=
X-Proofpoint-ORIG-GUID: jkTNvBgjbOXA7IHPjZLr8HU3apZNCGw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140226

On 14/09/2026 14:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] In Documentation/devicetree/bindings/net/cortina,gemini-
>   ethernet.yaml the patch does more than re-indent: it deletes the whole…

Overly long, it's like use the most words to explain something to waste
other people time... I really dislike this approach but did complain and
people disagreed.

Best regards,
Krzysztof
