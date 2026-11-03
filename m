Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665291;
	b=ytXy/ZUhJsTAMMV37fzaBpRtysUGT1i/eHzpVI1T0IIjNTLd0VASia4uHOxMDfxlmyJ7
	 AkldnQzMYCivdaCOSc+hYy7PHhTEm1vgTGozb4eQ7gYgiEajzolxfNBP4pX/f+7HfKSw9
	 JjYGhpe3OZQYwmje70+kxn6GKrJYouK57mCFGv484L1F7f3h/PKmwac9zrCv35YEqnxjY
	 y0Ai4OHZDytW1ZIH7tr8o8iujw3poGLOdrbDSvZJAziPSVEYIW2iLtddD/1s+2nnHryle
	 qauvY/9LImqOTFFFvjJAnpmVyWVVG4E/RjqT361PIJophQKHWVBmqYTbA5C4uFGjpeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665291;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m1CYVddtSAfgtkCDt6VccjVuQkJ2y3YjAFo+UlGYC+M=;
	b=HSkOuebotsiTu2mfdEUNKjBYi7q+JxcxyPWHYt2Iuti0ITGClmuVcaH3TN9SGGBkIczq
	 2NwJNg8loTXypG/RYYUTzU/Vp5HtgSAqF62XUvaZ3/FIBM8reocLruj4SjAhOmR+sykFq
	 Re9j8KjGpK+Uu3e5uWdfYfk3ibiGHEQKQAylfxgvEVX8IFBCL3mNQ1YQRNc++ntBIYfPA
	 lpNA5TG1WGOPSolEOmXgIG/oL9TXWCtLHuHHOeysAN1ICznf/jy2uhUFpX+RXGtm2eKJE
	 9zd27NZW3ZLeC5oVR59TPtqQVdqQbjtjc+5FO19D1S7DxCqZL+Njv/p4PanEXizpd0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AAiMmWvz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A29RzVuY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD837606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD837606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AAiMmWvz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A29RzVuY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2N3S7r2074040
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 00:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1CYVddtSAfgtkCDt6VccjVuQkJ2y3YjAFo+UlGYC+M=; b=AAiMmWvzUkKHut6Q
	ulNXTMSVgicCv1fNnSxRvXiJ6t+aFn74HFgqhOfd7c0gYb8q5CYSFoxDogS7yQlZ
	dCnx7bq8U1H+Xf14+rKXEq6YZvw+5wgB+DWiVMNe7QJEhCPhDoHZLDHB/rlmDsEo
	RbJZAxp0WaOXPCXdx8RrtTpaPrvDRwIhDrK1Kf9BDxkRiW5WQQlyPWw2gIHl9qLD
	jdsxwWmMTA6am3+D6xjIr8JO8y9ycMeSJOSCW7MvcnXumccJvw8lMQ4vRxd/hHHz
	ikGuDdxT9WaqTK7a54Hd+BP0oZ1J3TniDgWpHHSYOlrwrrw/hts31hri9KFLEu0U
	Mvhu7w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy07tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:21:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-15c16792146so2067393c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793665289; x=1794270089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1CYVddtSAfgtkCDt6VccjVuQkJ2y3YjAFo+UlGYC+M=;
        b=A29RzVuYqO1WenXIJEkRiE/kDgO20z32vjxdpmfcI4o/MZPWVDnhH9dG4ScsafzguC
         XY8pyY6R0J4V4dhG3eAsMvCsDRFJCkXz1yXtdpLFzh8lqzgXzwd0Z/dbqe+kf1G32g5w
         T8yTOvgs05BeV1beBPkhcaCwhXXi71sZ9Y5Z1Ghy4tqrG1g97DuyviDaY2Qcz3KNcIeM
         4dOkw3VfyIyjwoPYYgQ3aTYaJGglxidwO2ncPoHsw/5tgW1Q4Jf+zTAg2Q9WJ1SyestV
         7XM166VNpXyrd2d+OTN3qyiSvaX2DRiLmEKPID8G8C9FkM0XkD1W2C/6b3fdhxKSr+Ho
         Pohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793665289; x=1794270089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1CYVddtSAfgtkCDt6VccjVuQkJ2y3YjAFo+UlGYC+M=;
        b=oBMD4oX14DpurHX28thyE40Kh5xaDvZ9WIX2+QMXRgJOeSZ4VJN2ZkT15roRWcn6rd
         Qax677b8/UYgKeW5/zN4wVX3CV0cIdNU8LyBdINk9595LUKgBc16Avhl8EWG9c0FrPho
         x0lBNH6BV/D4W06NJmZg2iF2ZZNUbCdLHUwJzLh+GusEGN8oTaBPdLTHCptXce8RLwxh
         alQSwMkRi+kVXX+78gpv486lnfjUjfYhzY/T89lqhYUNa70Hq1yGnpEbdghp03O3is3e
         B7iw2/WykomeEVPiUwKFyGUQDqXPipDG+92NmO2rSOj3I0xw2Meo1GH8GANOGUKFPHt0
         gT+g==
X-Forwarded-Encrypted: i=1; AKwUvBx4Ghzh1812GQO2uwKYtu5kswvg3fni4XkC/07Q1WsMzkNL4M7n6XGrKPNj1mR2ZJfSTjPAVX4W6We7y7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsgiQDy0K0eEi/q3FsJ9P3AhdAH4Q4Mh7P4VkfhZXcNJSBN4Dq
	UxK2v1QQkYXUeQK1TBoukqp47S+vh6Gj8P5KVx5IqWROjRBMKjqQAVrVIG/sc+8wHOFDKhjWqFr
	F6aaJZh2ijPIoNnvjaaNLKCYjPzvBL4WWRi+cphEODOeUGgRsxd6OJOvWp418OWm/cr4=
X-Gm-Gg: AYBFou3jq/G34cRX8Xj5NEiCn15OQuAZ8mjauyCWxkY9hzHTvqACSBzuOrcJsxTGE8X
	er9plasbjSAQgTh2dfJkO3YUqDsRFyPlPBfQf5j6qWl7Z1NGM3lCAFA/ehghOv1L45bwNhi77DO
	4AJfV+1sRNF18wrlUXh2mTTZt6Ttg55UiCqW0D8wydjqWHVMDzS0b1OKssmIEPiQKbtRtTbl5fj
	6fp0IOg9M8p7gEqL6mq7yDfbYdgs1ivm6+pk1yqIO2JCJSZhuBj1tRJOeCQCnwnGYzxS2W6j3td
	KhxS6XP2zRe+h4ma4mki/N6gucSR3nosQFeEI0Gi8VS1pIVbhuobNzP+G7i8gal+yT4xK/0AxNr
	U7llisHOwtpuQqSpFdDf/ljrSI724cwVwKkgZoWsdBJsmIPaByvWMFtVK6LoU6g2sAQOKcn8rQP
	+aA0/0tlPgtAE=
X-Received: by 2002:a05:7022:ed09:b0:159:aa67:28c1 with SMTP id a92af1059eb24-1ac5c92da58mr16984819c88.20.1793665288355;
        Mon, 02 Nov 2026 16:21:28 -0800 (PST)
X-Received: by 2002:a05:7022:ed09:b0:159:aa67:28c1 with SMTP id a92af1059eb24-1ac5c92da58mr16984780c88.20.1793665287605;
        Mon, 02 Nov 2026 16:21:27 -0800 (PST)
Received: from [192.168.1.148] ([68.248.129.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm40121421eec.6.2026.11.02.16.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 16:21:27 -0800 (PST)
Message-ID: <7005e138-6d5a-4c39-aef0-7200cf3bf911@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:21:26 -0800
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
Subject: Re: [PATCH net-next] net/stmmac/dwxgmac: Extend MTL/DMA support to 16
 queues
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, k.domagalski@samsung.com,
        k.tegowski@samsung.com, cs0617.lee@samsung.com,
        abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com
References: <CGME20261016193835eucas1p128cb1712afce0314b1ecb65b0c0fc841@eucas1p1.samsung.com>
 <20261016193823.2711773-1-sagar.cheluvegowda@oss.qualcomm.com>
 <atXhR0sgdW84YxcQ@AMDC4622.eu.corp.samsungelectronics.net>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <atXhR0sgdW84YxcQ@AMDC4622.eu.corp.samsungelectronics.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CdXCSddxgxV_24-LOdH84gbRkpHIi3kn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfX8XgHMyfvE/jF
 hrc7xAt6Iib6y+SEydnTnk/Lh/KpmwejYR/jZjkZsdTVRwilBGCq1ZpXp/QGsfRSyBvlP/Z4Lpk
 +ks0UA7+NRbg1e0iC7+ZhdYmV10iHds+NIxQBqU+1KZFf6b/QzsxsXPfPzquXEcageMg/jWzVhk
 /hj1g4v09LnuNgT0yyoUMpQzBIeWsikmNgzHin+ejEqIX0kC7+gIe1YNgdAEKs2pi+I0NIwk94O
 WPfW1I7oOoVAyfoJtGX5mU8OI2JEdygiUNuirOf6LC/dHo0slYWMnsk2FBtInykSvIzIx+5wx/y
 ebK4oWtsPiHVuldRdIgqIngpDyHdmFqaHPtv7YaOMsVqqaMrdauy+vPsAV8LF53mFo8GN22N04D
 8s5ZwzSuj6HyMfpP62pp1Qp8xQfxy3rWHRRd3BtLZXorSay9fztQragF9ExcEVED32q+b8DbVsf
 M4fRj3pKj9CZGhs2huA==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae92909 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=djYDpCgIitZxdph7ACYjJA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=XF986EujfQmVbk2RL3gA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: CdXCSddxgxV_24-LOdH84gbRkpHIi3kn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfX3I7AC/Ir9+QJ
 DAUO5BMmiBnKZ7UDHMv51OqYW2759feB2CYFpbgnGYOd1UjggNDNFPiPgANPjh/uOg82rzfwZVt
 6Z1th5bhQgzN8//yn+a9DMonJzkVlOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030001

Hi Jakub,

Apologies for the late reply, and thanks for the review.

> - Does it work if macro MTL_MAX_{TX/RX}_QUEUES is not increased?

No. With the macros at 8, the DT parser clamps snps,{rx,tx}-queues-to-use
to 8 and ignores the extra queue nodes, so queues 8-11 are never set up or
mapped. The patch has no effect until the macros are raised. Our 12-queue
testing was on a tree that also raises them, and my note under the "---"
should have said so. You are right that it should not go out on its own.

>   How does it look like in your hardware? 12 DMA and (8 or 12) TC's?

The Nord hardware supports 16 queues, but only 12 are enabled in our SoC.
It has 8 TCs, so DMA != TC here too.

>
>   I agree with comment by Jakub Kicinski on my patchset 1/3 that I should have
>   implemented it better, but never finally did. Issue is, stmmac driver
>   assumes number of DMA = TC and uses {tx/rx}_queues_to_use everywhere.
>   So proper implementation would be spliting DMA count and TC count,
>   where both can be verified by stmmac_get_hw_features().

Agreed. I went through your 1/3 against the databook. One point on flow
control: XGMAC_Qx_TX_FLOW_CTRL(i) and the PSRQ(i) fields exist only for
i = 0..7, since PFC is per 802.1Q priority, and 0x90..0x98 is RX_FLOW_CTRL /
MAC_RxQ_Ctrl4/5. Bounding dwxgmac2_flow_ctrl() by numtc is therefore not the
right limit: it happens to be correct for 8 TCs, but wrong where numtc < 8,
and it should be a fixed 8 (the PSRQ window; MAC_RxQ_Ctrl5.PRQSO can shift
that window).
I will review the whole series thoroughly and pick it up after testing it
internally on Nord. I will keep your authorship and sign-offs on the parts
that come from your patches.

Thanks,
Sagar

