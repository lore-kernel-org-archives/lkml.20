Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E653C3F56
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160828; cv=none; b=QOmFkV9ztkNeJ+N0XS0thEpPBb8zUQyEuzNsZcKS/iU9RvBgHrsVqgebJpmFrypHxzV0llK4wkjQprOnQFo9eUq48m9XsJg5i/dqtQ6EUNGd5tMhxWiBqzddvEUSyq3EwDuFUu+YMSHeOCm8qLm3TiMSSEhmG5UIyhSRjy6y2qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160828; c=relaxed/simple;
	bh=h8J2NrchB0Z1iFN/dkUbMfkCPgIc00ZPMgcFXxFod04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9ueuxh4z2MX17al8OpP/5fey2P297ubi3t8B57HfGzzuL5LZ40lH0uskao25K8EjXIu18swCfah8806VT9rHnrQA274R1bqeM+HD7MZAizvzw2I3FMj+QWrRUipA6monfe5OcNWTTWlNy4R4OGtGM8wh/g3fBFpWKGU7Ejvb7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+KK612L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJ4PD64M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+KK612L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJ4PD64M"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52hSr2764751
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jp+hqQqMNpfps3DxX8HzIVZ5L4ni0RL7VXbNl/0NSJ8=; b=T+KK612LWjZUANeB
	VkFdsMWkr9eyhS/Q15o16qwql0zjmx3zVqavLU23rgjw75IUZUoeAw5IHkblRKn+
	7YzUSSJgv8+lF+kOZ2W6XWW5bum1I9EQ+RpOKDfct9vO11Ph6msTMLpc/ic9AYgw
	9O8Aw8paGd/LlJnIuE4ETOoGVuwYXXhZ+vb77bRI3rZ8QAVyFbCKjs8vRFOOVwqN
	jYcwONoZ8zLm1TjLaKsiTZz3e2FqBM4bH5hcaHomWo0mCaNv/8Iyq9WKBXXmSWeT
	sCT2wFUOep/7F5Lk8R53LQ532oQlxD+K1hDs2Mlg9Gl+3TG7dDe49k7ZK1lSrFtj
	9mSIhA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgyn66h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:20:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e7d3aa5edso1555896d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160822; x=1788765622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jp+hqQqMNpfps3DxX8HzIVZ5L4ni0RL7VXbNl/0NSJ8=;
        b=LJ4PD64MOjmIEBA3fr50V0IqgyoR6uLn2ocu1W9O/3M1Iodo6bwa3hm6UXpsA7gsyi
         S2zXqygAYdWRbpJtEuo0U2J6ZK9qMwIRzsdNQCQk9AMhxB78DrE8a2lFx8idGT2XTK+w
         LuidQwE4w7TaTd4MZdCbO6yX72KR7kyrs3xZgH3DHDGlZmD+NV3HnzeQ7qO4ISajqaBc
         3B8u/zFpFBju7sX4Z0+yOOtXlqISofBouNbLQy3LOq550AzmketCWlH8puDokj5BuLzI
         XZtv+n+8fRqv3aq2i/1Z20gQTFBoNVrHeKyoyV43pewPgcmKhhA3dLEuvXK3pmiXm5Ev
         i0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160822; x=1788765622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jp+hqQqMNpfps3DxX8HzIVZ5L4ni0RL7VXbNl/0NSJ8=;
        b=ccFUj3TLOwaGPJH6KDVZzplrvCU+ehdvXPetnkoWOjq3D3jIEE35pGXBG5Iggo/3ey
         vI9gOlXzIeom4Mc2UJn4W/EkxftGKd1oq+AqsR6BKbOazAEqEZ0t0uy3MNnxgq7UG7DU
         iVSCzA9v4AglFN6lSVdgndrBGhak/qg1qw5EX6tbTLRzrmE39afQj5lcCGZlTkEFfOHa
         Lep3LRnVV2algHOZgkLtxEaZ8czhsDX9v9fSKLCDE9zIpqcEGPH1YUEqYdYmuK8UcAg6
         JLs+EtzHXMe+grOHDMIjTB5pbGHv+sFPpcP21r2F7Syg23Epg9ID5+0Mc8bEn7zVSJlI
         0aDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMPhGc1dHb/C3fxkhhepNiaPlL/AzZlsQQvC1iq1SRej6rufa3+ViuRjrsusvWSUNQ1dv0WpTJsm3OHyE=@vger.kernel.org
X-Gm-Message-State: AFuF++lF4aIbTh8B3TjM/8i9u+l2qxygi3PpofGLmWVvFsYA8PfvBkK3
	WvejemdHKMCdQzk+4pz9cBp1tJOy6Wyro8b737qcldwMJHf1BP2VimigY3oyOd/t1CgosKPulRU
	grxwd9nRvRbuPEXm053GPFUVDED2lnl8jVkBjPjqQ/ENuXbL6xIWH7rpFKNAw0ZsTnJI=
X-Gm-Gg: AR+sD12N02/Q7KDWUxmqt0ZQs5u2E8eLfoSQbvBONgl27Z6M/OcOCcwsFVeGxvxcwNJ
	QLBj5FIXdaVbQ2tL1YD5CwGybDU80LRcIAqdn8wh7vrdD/TsIS9gajM0Huo4Ll7aOYos1GKcDgL
	BUfJ3qr97+jaI2RnwxYJBuXwTLgnQEmhGx0nSj87eIxhcOWiYIsXDvUVoAanqfj9dSBMzWVSU8e
	J5aot1zi1GBpEqyBYriEeIOhfEcF4c4OM34odm6M57cxnStgEDrMesu1W1/N5AfdG1UUUX3LwxM
	W+5TH/uQQ48kx4jUbQeKaYi+uYfq32MlNXMZY3T7Hc4mIAJGJGKq4XPFRkqIgmpR6W+d1+skvcA
	e5x4B4rBZaA27w1H54+b11A==
X-Received: by 2002:a05:620a:1b9a:b0:92b:7420:bd58 with SMTP id af79cd13be357-939285432f8mr771691585a.0.1788160822450;
        Mon, 31 Aug 2026 00:20:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:92b:7420:bd58 with SMTP id af79cd13be357-939285432f8mr771687685a.0.1788160821970;
        Mon, 31 Aug 2026 00:20:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b2049sm405315466b.36.2026.08.31.00.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:20:21 -0700 (PDT)
Message-ID: <655e39a2-88d7-4522-a27d-767dc9578aa2@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:20:17 +0200
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
 <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MSBTYWx0ZWRfXw8yFlLURvBFK
 Rj347ASv97fvPpfbhXD+7SeFc8fwREH/4PfnSXL4e4cJVTxHMIZb62jLvMWjV3fe/ES0OhukEev
 zv+9C6zAkVohgr/u2qxHv4gejW/ScyA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MSBTYWx0ZWRfXwWXbEA9c5lcV
 QfdtutdwMkCVNr8PWZqlVWP9nRtTV2El9fKN8lnXlO7HV9h+V5r6zY9njmtTphhTRUqUbZbj+SQ
 Ywg7QO8fNZq7fCUoy4A3/4838AjsqNZX376anelz/MaFs521mMoCpQFy8CU5I1jdVxonjaPicGe
 qkyCMqRbzhLFjqeaGzc6ZzirTOt/E0OITCoU6qmi+smvf6fAc6pkRq3jB6CwyoCnhMF8rG89ZRk
 OW8LaxJ4+6FBL1t3HNK5UamR2yUDTVI+W259+03pJ22/t+uKHofwQGhO4iRJJIh7nUs3oKh+Fvk
 RC+Y4a6QNXBr/odWJULwU2GujxXuv1aruWR0VCR/Q2js4CiwyIPPE4VPpteKxyrnFlaYe/+ziVN
 rrkEmWiPZKoJLIu70wuxeGDfQBnvyldl7iFEp7LOJk7mLNQ/7g5XTE7Jb7ovhjeGvGJz9UnfxhE
 6sCBrsHZSGZICBtDjmQ==
X-Proofpoint-ORIG-GUID: pFW1iEJFIm-H29feL2cjnDBDIUB22klM
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a952b37 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FqpsaMCCsM1CaQCKzz8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: pFW1iEJFIm-H29feL2cjnDBDIUB22klM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310061

On 8/27/26 5:43 PM, Shengzhuo Wei wrote:
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
