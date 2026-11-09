Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216399;
	b=ySzdrDunlQwjgEuOB0MQv0Rf1FvdA7rte8XHLbEAmsQ2dbl5C2j03Uq557rlb/p96vVZ
	 BeKg4X/nCdCUKo55W1k6W+4lEZrwZ/O6R7Q/GghRBosrwCTLhELMw+QlnAbS4rI+wvM06
	 q4IsvN2BXzPZ2uuEPWlFAoBlnau5C9JH5A+H7QMElEjLkpboBlywX/Pb1vlM+EqtF+oKD
	 qA++AAtMPEbB87PbFOEDiphPTTxUWmcutzBdG8gX2DwcBDhEszPhvb1wfI5zH32LjVM9/
	 297NffEr35D0zLCAVUFefPDCbFbSt+TMyoKu2ZWgXBil1WgQn9/iOQ+2cj+ArguQEhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CU19/uceQg+oPr853pViYrNcsskRDc482nGLsBh3btA=;
	b=BDx5axnhcvcFWVFnvAmqdpRrUNtLmJCB47CqIzNFYuV2raFe6PeWUqbc9WeDSBp5Hh0s
	 4161yY5RAdij2eqkmuGCVcKWZvyi52h2lvndruqzxUhDrd2/6XL0NTWGJnfQ/4NDWSh+l
	 uwiSqBWmvhrwNZNSukFplCp3vkE2kpAFeFL0KrNoP/OQ1Csk6tc276uXdncBU8dYidNvZ
	 s7FmEFNLBiwVctAB5TDUmVQsSTs7x9WIz+IEuaGUmsW6u5cAySUj3mTgBNoQluww3I2G1
	 FUcCjD1DmeDQRmC447+eOVqJ7xrxF0UEw1U9rtVAkyyMozgG9VJ+cU1VgPfyJysh4iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3c9yBTX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NS6/n01m";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75C7606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D75C7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3c9yBTX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NS6/n01m
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969wA53611029
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CU19/uceQg+oPr853pViYrNcsskRDc482nGLsBh3btA=; b=U3c9yBTX4AZuU3Ua
	syCbEkae6OEU9JjKr7jcgceea19Mz4+tCOb5Ff3iu8u+gsXsWepkqy4EEgZcQcqE
	DyUQb4EqCJt8cw876gL1PZNwz8HrZFvoU22Wo7LKGg0l4YgRU4sPCOV/c61D3B4P
	W7lKPDrA24T2ZahBzsRQ3etV2x75ADbYLVRtbrV4glMnAmx5OadfiaH3xtpIhDvE
	S8Rf5cP8x+8JMr6pu6FpF/mwRid3FUJmuC21PSeyB4bESiAM/0xXC5GAvclzVbRX
	PXXgejkQKuvsOrHWk52C/gMym3CQnYfMzYCZuGtNMCl77cIhm0Ql7zLAK81A7jsL
	/XkRLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx2qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:26:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5476f5bd009so2831541cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216397; x=1794821197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CU19/uceQg+oPr853pViYrNcsskRDc482nGLsBh3btA=;
        b=NS6/n01mYXh6SSY3uDFwNW/dUTr62iqH2SEFfE2gEqpwn+2y7NMO+DtmzmzxVHDHUN
         7Gj//F4UYkc+1VvY+mCnnld5HIsVBCUbhJgmXI/uvpN29Kk/rb+oCTNtkTtBSePqn7Ee
         io/8+EglZsBHE7rE52wCPvO1VR+RuNj4awrDv1ODe49TFNG1AyvMGYEMQHuSfQOyFYWx
         C4kCQLfpE8JT4o5015NxHbvbbnJIfREecRYBN/77TYXb0h8HgOXP1lVX/E8tpdwbFMnf
         +QgI4gHV52PqJO5IejsUqC51bjWGUFmILQP/08kZeYS0SNdsnqDA37w2PZgX+tWpvF25
         eR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216397; x=1794821197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CU19/uceQg+oPr853pViYrNcsskRDc482nGLsBh3btA=;
        b=a8Sq2tF6TXVy7zcF78dKqmKGRUIsKbOkNPz8LZk5wt5LnY35yjZQ2PkKLp9y/QD0QA
         R2f4PE/l9pch6nuwpgC8wCVR2IYvuVaKNM1D/tiN4vykpiP/Vet+JVF3laY8U8iXUXzN
         xDVO71MLVmFmXTb+rZftEdOZkLeycuOQrwQMJ9+QdYvZFCitQFNLHRobBxNl9WVZxR2c
         LcPLuruE2MIqU94Pqhfabi0+6sqMo2Sg/11stpXCXoGy4aGZ1IO0uX3jcPCa98pvpO63
         aXWSBmT+w1ziud29eiMtJXnezWTT3mIlOqY7NWLmSMRYLfdBLjRs5zFcMaUf99lRKAKg
         7wbA==
X-Forwarded-Encrypted: i=1; AL+hErHqWUrA5DQZY8grrCAln/OD4lOiKuY3W8j1OJRHRgjKGFuAbIP9FeBsai6p9ibQ0dl0aDfuuXG0PR2h6c0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sWhXY6sZfmLN6XmQ/vFMpKarnLV9+5OT2ukqFx6T2rwZnK16H
	gH9ULoXKe3yjiH7/jpXuTyw2CThmGxtmLX4tANfiD/4X0EteNCYeFI9cN7cUGDLXThWaYYeqT3f
	pzEJWh7CPNGza9tJz2cU3PxgDz2IplqWBdgHHzK7ub/rOgxgyuorg1OVI5XtryfhVbI8=
X-Gm-Gg: AYBFou0uYbDwW108FR6ayFbKINwNQrp7wycv6YFUiJUr+6u/9iXx/No/miMP46oXmyC
	65otDuBx3BdA0jAcNqkcohu7UFl3wT3aT/WMVxBNC2+6yEauy/s+1br0l5vvjVJWHcyUCg4vNlR
	TjGQhNz8uBxsdmz8HVCVFWqHwmcUSJ712+LSezh46lLRzb7jvfLGdVhiSpVIj/e9/2Q0E3pGucf
	nox177CpQM5ek2fOs5OD9i9CCgIb3D03svvGbUSVpN7tbcH3FfFeXF1cUeSWdr5KK+bWPeASigh
	+qoIIPxcJaF5NuWAeosFLIXyqfZIRa04uupHLCIakd8UqcQg4gz2oE9dFAJizC/BbUa3qKCTSBA
	ERwXTXVWuXtiMoOXqQLbTXDcVWPslNwklxVx+NlXAvzF1Ku5nVSoWgQ22WzD30kx5MKjDLA==
X-Received: by 2002:a05:622a:5c09:b0:538:40e2:ba55 with SMTP id d75a77b69052e-5529f4260a7mr79989991cf.0.1794216396975;
        Mon, 09 Nov 2026 01:26:36 -0800 (PST)
X-Received: by 2002:a05:622a:5c09:b0:538:40e2:ba55 with SMTP id d75a77b69052e-5529f4260a7mr79989701cf.0.1794216396483;
        Mon, 09 Nov 2026 01:26:36 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea4134sm1200061a12.9.2026.11.09.01.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:26:35 -0800 (PST)
Message-ID: <90abad23-519a-44e3-b268-e010ae330286@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:26:33 +0100
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
Subject: Re: [PATCH 3/4] phy: qcom-qmp-pcie-msm8996: Do not request reset by
 index
To: Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
 <20261106-reset-deindex-phy-v1-3-6a9c9f428be8@pengutronix.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-reset-deindex-phy-v1-3-6a9c9f428be8@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o-x1GAgI4eVYnDskekwvYgZYxHb6Qvxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX0wZYXbmYPEyX
 FDbybANHu+gnL7CJJdXpXY/Jn0abZ465PKpn4dSC+4dkwhzceJdEvc+qtfyIZaqZ70XFRES8zy4
 VhFcnuEBD/OqTj6KfxRR4AhLnCId21h4suGC9DJi6vT25xbuOvSIjy0fvPwixbBQiOt7oBSylYl
 20h5YAte9UHewLciHaaQfQ+CYeKVAWl2loUlXxoLwBVa1QHkk1mO0kuahC5W9WfaiULE6J3QjlG
 8AabA2332iPqb7OoIECir0BKzO0pnEdqbzJHKu4lRJoxMUB3QJLbg/768mcQyu91QtBkLFIFB9W
 Tc2PzsgOG+4tidJaeC0y8pHTuzpeg0EBHtLN5//OrLq5bzj9eIEDgXQZmuid5RDS+3zx51pEnfS
 QDeRgq7LwgSONy2ic72QU0ihB1cmIxpbZdqXgvVOPz5YuDuhse9nI/MyKYbJ/ChZLIDiP0QsAJv
 VcH4O/u+GWNlN2wBP+w==
X-Proofpoint-ORIG-GUID: o-x1GAgI4eVYnDskekwvYgZYxHb6Qvxx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX8NcRUswgbZMR
 Ffsml/7EZS3jFYDbh3yBcViELvqmWxpdmRQiK1kEcp2xFS8jGNYt2UbNJhPBDMmxdiVeIrgRBHK
 T3uh2ON/4pFOl0wZCFK/oiOGEkjwN00=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af191cd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Nus541BASMCDIAVa8f8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 11/6/26 4:01 PM, Philipp Zabel wrote:
> There is no need to request a single reset by index.
> Use of_reset_control_get_exclusive() to request the first and only
> reset.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
