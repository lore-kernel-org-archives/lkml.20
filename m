Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE434AA3EB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821927; cv=none; b=cKVTTcBX7AhAZ/6aLBG2/EizzPs3qjMtJen4SYpb6LyY5ckp/l5MmHJ0VWNXV7LvinL99hxdZMdEDcaqkWwe6s+3AA/domdabSSJm7RVpoXBxH1pHfF5xNOKtednsc5IaNVe7l0oU3PfII1Ke5Qvn6k1U/Ilh1/TeaH7W7tizNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821927; c=relaxed/simple;
	bh=+NE18ke9KzvmlYSfERdehf4J8Dx7DueTMJd/A6Wr2XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+dABECQ6XNyqw325dI8UIXRN4aNQkXrld15v1BFVSP1pO1xyFn0UiilvdGP0kahURsaQ+xC38xlRtbJx9Le8E1z2QkILWkk49PcZmMxM/QW5I7Ak2Zscj8r9LifzGn4ARBjX4QOhAiTl8+A43mOwtFLyACz5XTQKaZ4er/tlwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0q1H8XT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WV0xTHbe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0q1H8XT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WV0xTHbe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFexvG3163188
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	992xLarjq0QrSCEXrsGRsdLKg44G3vu6aNh6DeczHcU=; b=j0q1H8XTFZxYi7A3
	9QyW3jRyF9odnWX4YAZEMXN37+l4twuaxFgwwPMXZIZvWBx1LQGTreTjzgYmeyM+
	5SZGxjqaYohCV1CeCbAFmvD6A4ZzrsLr6ZBC5HtplmxZwg0JlZ6Z06atZIn2mH1I
	GHZTR/8/WRBt7JqlQjM7Z4VZrVyPeh2Pl/vh7XmpQxaQGZfMWjeKbgy27brOtECP
	EjAkkNs0+Cc02+YTZqrhbxMIAUZES596SYbQFdHmshZAAB4Xv9h8LjM4RRbGa/a4
	NNlUf/ngkZDnI0Z4FeKtX255tLN4DXSZ1m4bJJSjZ1N68GvVKQHZjqaueMFd1fUR
	+Myg1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1tv8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:18:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533962f6bc9so4867411cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791821924; x=1792426724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=992xLarjq0QrSCEXrsGRsdLKg44G3vu6aNh6DeczHcU=;
        b=WV0xTHbeA4gj4WQ9C2NlIFxJlz+J/Va9v1HnKo68BypaB4IKyKrtY+wr2v6ykSiOkA
         ClpgwDE5ZTpEUL12w7JXngGxbjqBjMT+EzFJABN107SBWk4bIcPCkUv4pioucfxXL90D
         PpCTecxHuS9tR0O6xsZ6WkW3a26eBEg4xYL7e43JQbwC+NSV7rH73oCXbZ873sKo8xm9
         lTh1pE+JNwD+OnjhAy0VucLEcLxI3dnCUeZNzQ3iUgZ0nnKJ808JSVy8DwP2uGiCyfPe
         0TJuOKPD+JYT3L/Itg6t4diTdqnu0BPypjS9ZUqIhP5jExkTCXjwzONcLBYznDPJVYQF
         hkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821924; x=1792426724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=992xLarjq0QrSCEXrsGRsdLKg44G3vu6aNh6DeczHcU=;
        b=OaVGAOpDK1utdPOlKM84PKRVQqpyos5UK2VeWFvunLN5pqC3x3ECr6pKqDDyG2L8LF
         /SjK/iItNtqiwRIaQeKFAwKiKE7V/qz/1RA9a6h959lw1uhOfxYkcnxDWbXvP80+n7t7
         kOQqFnhHGo23cW7A0s0g4riTCM9/7T3L16HxpDdyvLX25Xhnqek8UkHgozYsMBIAUQbe
         MkYlUt4MW4O7TLiAqYLthFM0Saab6VLzSWGkfszhb0vYMfuTXXj5SP6X3hcZAFlI2/p2
         wI9WbLfLiMdbtQOcwhDG6hqNPcmY620ucMTXq0cCQBcUhWSedOnew7sFawqb9nJtvd76
         ivqg==
X-Forwarded-Encrypted: i=1; AKwUvBwPhXtoMLMm8H2MAJakjRJ2EDKP2PSzFVVExCFcTmgpt4jKW8uwRCS7nM17K4T0haLo1cCB95PX1WKGYWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrUUa1U4GxraJmvHFfWD/wSpqttx0iG+6mTo8rgOG/W+QOooIZ
	rcAZH1RfxdZwcwemJHLR1xxO6/Gg+R+ueQAnhaEYFF7/36I6hTR/4nAsACThEXEybcAnQZ7pRVL
	fHWOoQ/D4oMKgAOldn+geid9WcxpNbCeXmjBVJKfcgMkkHLrnKSPA5BV962ZWPGrb62njKw/WTd
	k=
X-Gm-Gg: AYBFou2I3iw+Kb2noFIuOVCjxewDs+MEwakSFrfKIM/EK7rWCH8PLyrwvhgd8+QCsKy
	opVVNdL0RCAjusoE7oUfIBX1cR6K1psMr2AfOBGhG8GEHevGRNyw68wOQ5W+3jTcrm+IKqw29W7
	tiuteBdytl0SIgluE7reZlRgIUor7JBf6/dt+dH7BcUVzfaAuI98f2RmFt/H8T6KbvfNKsNwA6D
	LUAmhkkMcnK74IdePQfdlTR652K2nVEZ9vLSSpaQyb9N0majnDtGRNbow9ALa2ogDfin1aDhCD4
	Dp+91+lZjSdMkxS9cYgdLGJwVPrQ4YLr8IfT+8CQJplXdQvL4x8p6eWt5Y1hcNH5jCtnhcVQJCx
	akhArhgQkk6QgO9/c6LvMSg==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr1732268185a.0.1791821923609;
        Mon, 12 Oct 2026 09:18:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr1732263185a.0.1791821923034;
        Mon, 12 Oct 2026 09:18:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbc9sm482104166b.20.2026.10.12.09.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:18:42 -0700 (PDT)
Message-ID: <0ee83fd8-dcc2-4666-a864-de52fdef1c7f@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:18:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: sdm660: Enable keep_alive and
 sync_state
To: fabricioakio@gmail.com, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261009-sdm660-icc-sync-state-v1-1-77b8d2501cb2@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-sdm660-icc-sync-state-v1-1-77b8d2501cb2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y5cZ-0h-KjYqIlKdGlgv9RoaopwKXcwB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NCBTYWx0ZWRfXwBjotr5+BPqO
 BWQTsyiw03rcpo2h/Nm298tpgT40gftIT0BoUnwRq03MqfHw1CQglbVTp9u8BCDy/EH5fGuY9CI
 STNC/Ke+Tv7Kss8lcZkbmfopMqNuj+s=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acd0865 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=USPW2_gFu0Xurz3Eb4AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: y5cZ-0h-KjYqIlKdGlgv9RoaopwKXcwB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NCBTYWx0ZWRfX8IRyAKD3/dOG
 HEMs8fTegrwW6VoaNcA7fQKhILw2zyHfbsIKxopJyvSblrd8EdjxC6/u6gdd7WrveeQOkW9bozm
 8xe29U+iBLdlt1kE54ChrqtOVlB8ujx0uAEZ3B8NUYIa9r75x7rE1TQteUCmMU1Ucsirgk76oEp
 UaUhQftbpl97ybOK6Bg8kYpI6ahnEZ1heLD+ImBhtogZPIymvF8oT8QnVIHW06vjzPxHXsCJ4HM
 PflHrNMjitmP27Fu4fbvJf9c673p2AO1yLAMrLTDBUzZZ1mhes2/KHOS3difInM3e1P3ZTIwcQn
 0ae7m4xVuh+bXRFx4TqexNRFaHSHJ3eADRVdIpuCw1WqIrNd+fubJn9skrkRXaxxVS10jlGecGM
 TJ1ayLlIqsrolqCr7GgdR14Nt/jv2mLrZQPHDbdv8eQWA+sg8A3yOnoGSx0iGp0UfWuvCqTjjhg
 ZwBalqAUOCCfWSGj4wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120064

On 10/9/26 10:45 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The interconnect core starts every node at INT_MAX and only lowers it in
> icc_sync_state(), which this driver never hooks up. Every bus therefore
> stays at its maximum rate, in the active and the sleep set.
> 
> Hook up icc_sync_state(). Releasing those votes also drops buses that no
> driver votes for, so enable keep_alive on the providers with a bus clock,
> as QCM2290 does: it keeps a minimum active-set vote and leaves the sleep
> set free.
> 
> On a Motorola Moto X4 (SDM630) with the screen off, this takes the
> battery current from 117 mA to 68 mA.
> 
> Fixes: f80a1d414328 ("interconnect: qcom: Add SDM660 interconnect provider driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

None should be necessary on 660, except on bus_0 / RPM_CNOC_PERIPH_CLK,
which is not associated with any interconnect master on this platform
(so it will actually get disabled through clock cleanup!)

Konrad
