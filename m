Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8C53C0A04
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166330; cv=none; b=U7UxYYx+zIhip6GJbYTRVoBLf2vOGB50pJZHUF40eE8gEWNJ5zml1dNVdXlQsXUrJ16nqqvFt4GCGiCKTftTw9wsUv5rxc9ELYXrGHNSg1jfgzjOlgWla9zoYckFMqiySUgaDZbcfzMJY9+Q3QZ4dD0XIVYjqnYfY/ZnotUL0hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166330; c=relaxed/simple;
	bh=+2hOgK8tLcdWYDNwQNgvsfIaBdx8Bs2buQwhXdccyfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3UdMh7zhBsW2hcvmVuoME144QKQ3iXbg82XWFgeprVUJOye84KJd5SctuyC9cY3pYPw8dni4sj4Beghq6Uak1dXkvXcIS6TQTzZGQ6M6VkNWUZ3oMoKXUeu5UHEsM5stSBhrmusxqJ3U6B8SGZ0tWhZsEsdo1gAbRV/qGZnrLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cb9qiPO1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKr0lqgg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cb9qiPO1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKr0lqgg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xF0e2332428
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	palpmFZZO8X/xAXI6fll/8vpW1RA6tZdCLOM/AIPfzE=; b=Cb9qiPO1ic/fp51i
	A9Y2ZhtgOkhSln+gHhILBIxKRU9q+EFTQfIhJ4xKf3wSbJzN0zhWjc1wjKvCjW/J
	20tRmMpCyW+/6NVKa9ju+y4z34Z1xhpfyAlboEeTtuW95Rucj6k1F4i1tL719VRR
	H7wYpvc/yeIs2lWB1lSE8pg+CBO0IWoWkT6ey/hVX/H+KRECt+7Fqi+odS+2dl0A
	qFhZoqADFb0HvLuYkRm1kwuOOxblBsRmGTx5jITenBO5AvipKEk6e0kwpMD4rdQU
	pwUrlCvklDqEPsTAtZqr77iOoDzCBPICWFBDq/2a/PhbXYlmLsDkqzi2JheDwFRQ
	RC/M7Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq85c1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:52:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so1231929a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788166326; x=1788771126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=palpmFZZO8X/xAXI6fll/8vpW1RA6tZdCLOM/AIPfzE=;
        b=ZKr0lqggpERgyt2PwFFpwRR8N/Y327I9zHYwv6x4DsUqaHWXIVy7Mys44Brv3aA572
         ntoZQkBy14LK2sfd2PRsq+fVZpbd0Md5eIACexD6+JeeKSqPl9Wjj93X72cGHHq267CJ
         4WiOIP13ckxyKa5a/Ph7Rz1EV8dyMeNwi6tZfpkZlNK8g6hxgtCTyRmDhx2FfL16vR+8
         Bw0Hk7fu4+ZDJZclWLS9NqsLnD7fw8UqvPFwVABNIf68nsEroLoL7/mTDKftnbRfRkqA
         QdoowKGdsDlSxD5XGSD6IAlG2t4nK+C0TG11xtul8vsyRRbvfv+bAkxCx3R5WwCOHITd
         XUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166326; x=1788771126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=palpmFZZO8X/xAXI6fll/8vpW1RA6tZdCLOM/AIPfzE=;
        b=n4Kn2+5xVWnasQJTSgDVWhtkUiFQYf/7CNizwJiIshd3aDnblDuvkaJ77lk3yoCKGE
         9DIhR5KIl9PSWHHNRadjmTeYSOIcqlnZS9BwQk2AY8ZnIYYS9m9L/buw+rCzaQRCd6yy
         N5QaNyo0US6lVrj9arIuqPvBxXDcORywefaqjPL7ghiWxHh9CvK2AxW6zz61bhpLVGjv
         lTux5CjdjJB0lfOsbe85Xz6Uey7XCyAeBhMQrNZhB/5SB8LUVVXb0tIZnOV9f8GSzeFy
         JZTLH61V4mWquxjeBIU2foSyFBSoBzlJzaSNlrY5bqfTfxdEGSc5r+0CLV2Fmh7zoUkh
         fRaA==
X-Forwarded-Encrypted: i=1; AKwUvBzev/YgvelV8wD1wcGX4dUCGZ7ElxiIBTlIS2D6hoQbQ0TzIg5DvaQdDuOgjTJvthja6hBq3kXSKgki12c=@vger.kernel.org
X-Gm-Message-State: AFuF++k88gcRJj7Qxi+djdBpf/6Xw/ZXSUfRnPWUX9BHxax4WYyIppEL
	YoRx8OXzyM95QCX7jsGWNQoWGXaNfmW48V07dI1Y7yjitEWpDj+5pEsL4KSsDa6un2Rkry1HVQ3
	c/0U2fjaCD6NvXyMjSWCbNs2ICSMvRebmAulHy/rOQ3FHIhpUAHV8Jm5O5RFjwKuKr4Q=
X-Gm-Gg: AYBFou0tzfDwItRRYgwbId/Ak5NACNwkHuW5Ww/VU5YRyYDVuUGnkdNBtTZtS3s3vIR
	GEnVH/lQoy5mpnl4MmFsXFV0+oA8r9L0sB85l2hgJpP1T34456c7ZPpTSct2+xd1qykSawql771
	OO072sXXNa6VQYeLNy7l3JBjU419YvGsiRfui8TCqUu1jgWwi95TN6KFSCTdODjL9sASV1DAy0s
	wILQB/vocdPQkyvr83j5VOD9PuYOOCJY0b3KSoL4TSWCOXHkLdgGN1wYoFrhbOmKOolg9HfZbnt
	RTHBWAnQ8pEnf0mJXR30MRHRtbj+eBLQtT3MglLvIk/jlc8bY5iaBy6wPTdHJ63XjSzfgZ/Xy6f
	9dBtyHn8lW0u6T0WF5sb5TsO29UA2RiVGBw==
X-Received: by 2002:a17:90b:4c45:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-398ceed6d9dmr12393514a91.25.1788166326219;
        Mon, 31 Aug 2026 01:52:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4c45:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-398ceed6d9dmr12393440a91.25.1788166325630;
        Mon, 31 Aug 2026 01:52:05 -0700 (PDT)
Received: from [10.217.218.20] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm46282736c88.14.2026.08.31.01.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:52:05 -0700 (PDT)
Message-ID: <8ec899c7-61a9-45cc-b332-a98d2c0ac344@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:21:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: qcom-geni: release DMA channels on probe error
To: Shengzhuo Wei <me@cherr.cc>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Wolfram Sang <wsa@kernel.org>,
        Ludovic Desroches <ludovic.desroches@atmel.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Yao Yuan <yao.yuan@freescale.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
 <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lYuw5W26uHIFtzb2DGLJ7rovL0431oga
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3NSBTYWx0ZWRfX6eN7QAGb45dP
 +G/4lMebxXkSsysjgC++mUZEI1wmUL8KExKxrhwsCPCVKbjwzPVE6uT56gvx07+v235GlT3fiLs
 cGuNemW3RaqqvUSQBCbzHqPtxUy0sWg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3NSBTYWx0ZWRfX+wyj2IMjk+u6
 iaujRTlypgqR48c3Wn0DccH2qfCtwSLZAkRZYrUDZsBw7DLY51kw0YE+5H/6kk1G++iEYJRNtHZ
 TTglY687tJKZeKkB1BF4gp+BwvshZ4w6myiKThvO6/Dm12el3ZsoBK5184BBHFxcu+Y7VkmwTaT
 4nLJGkQJ675xmNZO8wy+Q6vDywjhtDPBBmfZZWjTU/0pwfT+Q30MSIL9x/gd1sLZHz6JYKO5sij
 7m0COpFY8yVoFKKkHOyR/cCv5+Bolmqeo5wPjH5Pk/jkqVdrve2GVc4mNDtWe3+Ity00ZncKjjk
 YHDmkn60laIR8LTQc3PKBERmTGPmweySpgKHpYybiXvg50jTsDnXw2Bb1AuCwv5+eyTAwzZQNch
 +XMotqXEaefQdGvQCw9aZ87vdK4HM0lFr44hKvtHEHsrucDb6p1v8kJrEL2LicVpktEtffZ6gAS
 lDxn2o7LEitg5jWqD8A==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a9540b6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FqpsaMCCsM1CaQCKzz8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: lYuw5W26uHIFtzb2DGLJ7rovL0431oga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310075



On 8/27/2026 9:13 PM, Shengzhuo Wei wrote:
> geni_i2c_init() grabs exclusive GPI tx/rx DMA channels when the serial
> engine runs in GPI mode. If i2c_add_adapter() subsequently fails, probe
> returns without releasing the channels, because the remove callback is
> not invoked after a failed probe.
> 
> The adapter-registration failure path used to release the channels via
> its err_dma label; that release was dropped when the probe tail was
> restructured into geni_i2c_init().
> 
> Release the channels on the adapter-registration failure path, mirroring
> geni_i2c_remove().
> 
> Fixes: d8d3bb127ad1 ("i2c: qcom-geni: Isolate serial engine setup")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> Assisted-by: GLM:5.3
> ---

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
