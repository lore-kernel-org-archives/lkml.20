Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650827;
	b=evC+xTDr6prYz3Mic3AwDpiVj5GOj3/NbC+CQ8BrCUCix7DRyEttdJonicNrTW8fQj7/
	 T9P8zWmFt3sf++mrPWO6uHrQ1pN8mdk2zJYZY1Ix9L1ODIavJGlM8GfhGNOqC7NkQRaEu
	 Ab2IW7XLcwfk3n3yC+uvX09quN+A8pb/lser+RxuTpmSz8aDuIszq/MPpP+uERg50Zj2L
	 F5TfT6E611ooGpkrhxGjhoLkuNR5JA8uRXWWQ1spnTb9GQTDLHJhGV8QgfM/gFmMcUIAX
	 kMAFZ4qdrAq6rIROFwLJzND/CKthO4X5sX0rU02yhdSU5+BybXyi0Lh+lJ/8Oh3drrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iucO72ygHraKKoulvOM5elo/8xXNl6l7Hm5EVeQw/hM=;
	b=Ea/6haczBWLwv8SG5vBb+dkx+lEY6PYbafJhNCeMTSoeOcEZKUgvkn8uLjBJGcOs6g5P
	 3MNH79d8km4d+vmD7YX6H9hRkc8bhPItDoOPWIkCMUAiJ2BUs6SbY/CoZdD34S6eW50jv
	 3A9qXPhBOgVaCSDrLcebqpGAmbxwnkKiaWH8/v8h9R4pCzfy4ZbI3Eq6qiGStdrZjsXoG
	 Gh2hrQzuUy5pJEhppc5OHBm16PQsQcPkoapgoY3BXRNF/itITEJDSIIek4a+knKUXU3xl
	 Z7iAe81XpLzdG9e3uEJ+/YSbV7jaxQ1d+990RHZZupDkYF58loPSIaEU611SvFzuuUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwFxCH7d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SvEWdN84;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CEB606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1CEB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwFxCH7d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SvEWdN84
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6Hnk726468
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 20:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iucO72ygHraKKoulvOM5elo/8xXNl6l7Hm5EVeQw/hM=; b=UwFxCH7dmNX43b7C
	Eao5uTE2EudGxgy8mshrWaf5p8bP9WiZg+Yrb2pnPRfW0ViC8O9dfn7rzwtm//Em
	2LYnz/Li27+yEceOczlZkDQTFb+i2xPnBU0SPsiqsvUTgm92tQYJP7on5Qeoe+qu
	bCAB6JoR0d2B5IW51NFJmJOuz1GbKbYP3+OWop12ApvAb3/eqBPQ7NxERERYrwqz
	rWWmM5iKRcnWImpBDFj+I6PIVSSSvMajTPrVtGPq0Val7ztS5l5OWrf+/8OVDHjH
	20t89mgGFucjHZrmZy74QTyHTdqKnTnEv8WJll5JClTL1zNPtcC3m92f+XlGjYPh
	Yax9Wg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5j7p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:20:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso4796525c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793650825; x=1794255625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iucO72ygHraKKoulvOM5elo/8xXNl6l7Hm5EVeQw/hM=;
        b=SvEWdN840DN/16TMoT3M0b00oTKdQgQCTpT31QsWsI99AwANppEp0ehiEQSl1sudlP
         DhvXweWPj4Sx1XzkI1GlUM5+yQzHJAFMxYXjZZyoPXInxqjS1EAozqBbayFC05iq1o5u
         OhFQb6ixtcPzXNe1qX8UqRRyeQKpWQI05DQIXqfI9WM96uJjRGFeSWaSEWySenVRc5pF
         rk1VNqdw/fBRg4HBpVR4XBahaZhHq2AkZThHZS0vO2+duc6U/ehkY94F5q02EqReXSU0
         4ZjpirNUEukKMItdYWlrNVpjGDbE6Cf8dUCx2XRfIcdEDS1LTtngfZSqnc7LtodclkvI
         /+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650825; x=1794255625;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iucO72ygHraKKoulvOM5elo/8xXNl6l7Hm5EVeQw/hM=;
        b=uTHnyJrB+P65/kH0NSlyDfUK+S9kit+Y/Lhur83Vd8AVqj2XamlPBZle2kaxFeTUUS
         87wlyK6JepKocGGaCYW0hg7ynXtRvwJ3P3BxwN2j8y/kuxho75TlojGdFN3wo+KO1N5E
         iRKlipYuv9AwfNm7OlKJ6y6W4lxCOHoi/w4xAtgS4O/ZfJiiNhZfwxRqSaMS9f8o/vHy
         I/RkQH50woJZKCi02TMk2FQWkkpcwr6EOYzkalMVnGFb82I5DINe9DfdtbETm8c6XEAk
         yS0CkwULo39xohid3XRTdRZwITyOj028xcKeVKWnmhPKhIXezgONIq8LHTl1Z0B4vwvq
         D0ng==
X-Forwarded-Encrypted: i=1; AKwUvBwWLvK9fwAIs37b3yEGEd0XvsEAnx+gkTwOFJA1/9/U8Bh0/6hmyho16V3fWC6ounvRtU/q4MESC6A5CeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsaScNx5w8J5/jvaqdqli3DQ/WgbOpvGni73fcM1GimMaYQRKH
	6TB8UIDqZBkKbeJADwCzPCGVJSYqLtlIfQ5yrZPJc0fZDGFbkjRmbh/odUEr2wZhWEK+LEMWvgX
	JIuCTHPn/57O1yqsTU3H/tvE40MDYi8uMTACNxDicPi55z4X90jn1CFVQm5T/ULT6fAA=
X-Gm-Gg: AYBFou3exZ1iDT88NGSa0sqYnmUd/trL+pDO2eMhFgZ49n9HeItPl70jIkpIavvz80Y
	w++H27WSLsENd7zD+NIaui5xKltFxUt3YbpcgXIh+SWFelcVJolpPUhfLgE51Ae2y388l+at3OQ
	8UMbz8HroV8RhIEoPq1BhrV2jx68CqumoZ48zD8X7+nKwsJTZc7DZxCNy6O3Eie/1RGcYhhOdKe
	Ng3g1Mplt4IgzAkeryEzfjs7w9x6pdc37cEcdvLvBa6F5GXJrcWW91a3YhoDV5SM/d1jtvdE2Yk
	7IRHJx3JnNjeFAHu4Al7fhy1q/YQG5iUHLJglplJ8bKJ3LtJmIlzK7haUXBBrHJWyFr4isnZHZy
	iglbPrpJexs7UHAbqxjV2R9uUKSuu3B4DvSLz9FOJT5/kVKaM2TipFchGrKRVrltre36MHv9Zru
	cfispUYmrB9a49jiXTCKjTn5zIb2Q=
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr20350141c88.19.1793650824392;
        Mon, 02 Nov 2026 12:20:24 -0800 (PST)
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr20350072c88.19.1793650823637;
        Mon, 02 Nov 2026 12:20:23 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm36146267c88.2.2026.11.02.12.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:20:23 -0800 (PST)
Date: Mon, 2 Nov 2026 12:20:19 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "santino.wang" <santino.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
        <arnab.layek@mediatek.com>
Subject: Re: [RFC PATCH 09/11] soc: mediatek: dram-ecc: add a generic
 netlink event interface
Message-ID: <20261102122019.000021ad@oss.qualcomm.com>
In-Reply-To: <20261102092334.138759-10-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102092334.138759-10-santino.wang@mediatek.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8f089 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=mpaa-ttXAAAA:8 a=9CeU9Xj6n_7RUCDYDCEA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: vlNwW1ZauXkwCLxpQXNogPKLgrUdLoRd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MSBTYWx0ZWRfX1zjjoVigttT3
 GFOdL1C4PCMWUWKBplAiOLVZEbpJxtiiQqBQWnxpePiX8+h4z/WUCNsbewgOoTkQebxP1BpjZUl
 B7CRujiW/f1sAU7eiSaQDsmR4lBjeitkg8N7Z+9OhDcRBM2cUlZDOhrkK89EKSGUun58c4ayL0d
 z5wqrBoMYkeuIwzNzxMCgqqS3mmhDbYImjAZFoCUUGpTuefJz+gE2TWPe/mdjWbqsxeYveUanmE
 SCXUwPIlz1QRmlLMOOtAZm4mkU+iP7ZE/14KkE+UFjic8UsMJOawX0CJy2IIcwGjp/9sfNshRmH
 fenXzAUxfNwwaSuQ0W0+fV3AHLkjj/+qLhiJut+F/23bqoUa69vcGgSc1HbdH7RbNobkZD/8Q90
 rhE4/Fe+TRwxSQCN9YxFTMtjdXp94Oi3u2xtt1zYpAXWtmJfUIugt2C7m7Yj/MEdyvWnHAtDkRZ
 v7NAxLG/7BWoaRe7yIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MSBTYWx0ZWRfX6ftq2vRWK1qA
 oh1P//B8PRLNfyshOC5eJtEy99Ie285Z0IvzM4DCMOHuACSN0igGEZX3+SEnjOUEsrzMtqlb39u
 8oFbhuSL9eTycoVU/6upDPTbL4I2KoA=
X-Proofpoint-GUID: vlNwW1ZauXkwCLxpQXNogPKLgrUdLoRd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020081

On Mon, 2 Nov 2026 17:23:31 +0800
santino.wang <santino.wang@mediatek.com> wrote:

> From: Santino Wang <santino.wang@mediatek.com>
> 
> Multicast every decoded corrected and uncorrectable error to user
> space through a generic netlink family, so a monitoring daemon can
> subscribe to events instead of polling the counters.
> 
> Signed-off-by: Santino Wang <santino.wang@mediatek.com>
There is a long history of using tracepoints for this. Why netlink?

This patch needs a lot more background information.

Jonathan
