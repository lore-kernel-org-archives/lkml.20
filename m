Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F638339B41
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792745; cv=none; b=fEJUpJk1ndTaRtlkMSQes5LJBbzwXG9h/+3UlHrd4WsD2S6HE7hnoehmfcy8/zPsU056ihUSUGP2FpXwajdp2HsbqSz76VP1NO1lwfs01yrDP6kmuAJqokYU1lsL75VlJhltXTx1+MPplmRP4VfA+P0PYBDoNFZ3+umZadjzGJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792745; c=relaxed/simple;
	bh=Eigyb5yU/yoEUyJpAZ1pdAIXqCCX2dykvEGn+0HTJdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYOPOkkjsyLxPRXACBK9Lclm1jaZ0t7G0qDVUDRfASM2ZjQSPsRbgWBlo2+IeBSJ2StDBxmy3DURZSPdZWRQK/FbIGxLhLFG7Ack7X7ARy6JWTX05q7p1Kddq2gHIzFLnjdl5qciCzpgPfJCatzv3FJOgeynPkpqOiJf8IwlJfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sx1OwxOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAYKqbvq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sx1OwxOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAYKqbvq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55jvH475094
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QDsfEPhwfstGXtyIHPjDssEUUvE4bGtbloleL923ipg=; b=Sx1OwxOoXjciOR6r
	igtohScS1Z3Mpl8wxvVlru42qxvdWipxhn6Yw3IizENNfVNb6bAL2vJA4vaB7E+2
	JTieuDGXBO4OT6t871I681OwzMarPoifYmHmrZ88/sIFghxMm2Zc2KDkdHj+boPv
	x5AS/e1GihsmsTrrwg/3FuxLOrBoJDEFPJv9A+4BzcvdWoWhpr7rpoVLs/ObcpJx
	hsOV/h7xPA38QnNdUCCNlfb3UceYuVzq4/6EkNfyzXXX19ZW8wUtfZ217Hdnn8hL
	uRhces0afrfyZLfgQVT4UpR5e6XNgnUMXNZPBMlrCn9GRS2DdhcCuWT5pu0Dx2ak
	En9pkg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9wbpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:12:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so5340436d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791792743; x=1792397543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDsfEPhwfstGXtyIHPjDssEUUvE4bGtbloleL923ipg=;
        b=WAYKqbvqyz2boWg/OCHbQmQAKgiY5Kn0bxWVPUL5wT0EDA7VTtEqe+So5TVCdKde3X
         PGJzCsZkBOfzfHMpChhEjb03UiW7w29ZJfTLD9GeDvlFdHL+QiHU0qiqJV+Jnbg3Jea/
         6hRoJnSJdDCdGzHQtVrGTwdcsZpIXu7IaB5rtKxJTGHaS294BJ96QeeaXRNjQxdeczJh
         AIsgXUBVplQujrkiNdcv4NpSeB03SlAew7VmexNtHPZaT83Ta2PnJGEQZ1jEfsG4PDQW
         kHCM4mVOsWH1MywGG03qS6VQ4tRjZLqkNcTdwlxHPGvNAb2M1iOZk8Ck49KuHJBTnXri
         eVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792743; x=1792397543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDsfEPhwfstGXtyIHPjDssEUUvE4bGtbloleL923ipg=;
        b=zJ6dG3NPBlDZg9ZUdCuKUEuy9SFNukuiyd7qX0cJx57CRtHJgggQToFR2/9JW16Xo/
         /qtxepcmc3Uma+rUy6c0NHte+2qA+Ry5PQuSFPgvsun6QPQnSZ+W1oNWdxZVGFJuWeyJ
         HMeOWr87v/QGVOKsawYgcgy40J7VopOepRy4r3M/kjEYhFDlS6IAiDlPWtpX2bmoH9xe
         gcNX1aBNVHaaPJBBb0XlUXesh4QrUowz8Gy0ybN/RrBn0Tawz+ty21wvJ/CrreYSfmY5
         kPctqTKKPau+VvTd3DsXIx543xQbkPsmBK4rqmTvFxAMMMpgmhixRl10Hv01qAaToZ6y
         Dw8A==
X-Forwarded-Encrypted: i=1; AKwUvBzbBhLI/EVMKN31nekbnZIQkc9WvvM6BxlkYFMtjPiyf+nz12UY9hNCz3rxjaGGCppub3tC6MU8LY3+b5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS0K+PotBUD+aLgQUou4bajPy/o82QDQfoXgsTI/J6gvbc/dml
	CDMVrxW0HPtEQpNQnAmi3pKEvnaEB62to47EH8re8hofoL4yYypQo79XVM8uClJk1h6bslac8+U
	LgRE0tMqDbrqFjbmzTxBMT00Y+TIZO9CrDdWc/W6OD+NJXFpOtC61oSZU653TvIOLjyY=
X-Gm-Gg: AYBFou0H682DiRae2RTvGkxZ//Bho7aWbOztGxtVMtID2nVaeaHd4uOsUc8yzZXnCAb
	83Aj9F3Lo0o+/g4Vr2WzvsTwo0LM+SVain7+8UOxtDkf92+rWcBkWLlRE8Ma0mzr/jo1+eIB3Cn
	jyhjhYvMSFgPx1W9jY4n2fd9mYE5ed4IgXIUF7kZ/913/HLX9auaCnjhmjMpqCR3hoERq21MC0h
	1JFk2QeDEZnrOHG6RXTZZkyvCZfqTMPbZMzkbQNSiBTPh7casOI4Y0unIqhryUmIeW27ao3Lqxb
	rTID/0Spjjx0NAowKiUq4LtSCPKcQFb+IEMAgXKkahQ497Ngmn5N9zoBgljUSeFQ/s+n8WtB9v6
	d2S1t4cM3WCga/3KrLSwHMQ==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr1592995985a.6.1791792742650;
        Mon, 12 Oct 2026 01:12:22 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr1592994385a.6.1791792742285;
        Mon, 12 Oct 2026 01:12:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9767227sm427742366b.11.2026.10.12.01.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:12:21 -0700 (PDT)
Message-ID: <582fe88d-fb5e-460c-b67d-a06072c64fe2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:12:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/a6xx: Move a702/a704 to a6xx list
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
 <20261010154125.726149-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261010154125.726149-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acc9667 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4hOvTdViVUcvaw6_JQoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: OgnS9Sxv1xqEJCH6MM5kkuWqefl2RdCR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMiBTYWx0ZWRfX98qDGrufL4lw
 +go0VK9egPikgVc/znY85NZvby/twSdm4iC/RNAQ3OBMRoyq5zj8Y+iwKnjqvSd1rlphTEAfnJ7
 eLk7WTT1sUi4Be1ZFyZxGWoK43juHuswL84MVZNdkRAml9ZQ9k19xZDch2OP2siOVfGB9UGuilK
 lpznuWpvsHvlmPM0MOIpcgiRbuvji0OG46JxqC4+1wHbN/Y6eWPczGN3hHK+ddF5Nh6Ej2+S1NE
 bb1mEQk+Q6fPQ5Y3yaEjamUG04th57nIasqe77ZUGJM6egAK3hDB4W5pulbDA2rn8GElbmeAAlg
 Cg+K7ou1u74JEAJXOc5yfXQoO0kBwnat9hyQM47uFcrbvYIiWGVYpxHchizJM/opM4gxAb9kkdv
 jMtYTNlc9zSnZW+uhp+d6NgGCpbLbecxjvTMJK0U9IdwCYQz/YijA91DUzpCLIPksRXBMIUDxMs
 4QNJfqGUafQvzok2qtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMiBTYWx0ZWRfX2b7/Bf3sMPzQ
 KPbaJHk0hlfKLodQBUMLPZPh30iktGG8T76Zw1CjBXAZDqMh5uCtKGVYEeem4N1fxjCoMscwyZC
 uJo/20JvuxuH5fx3Jbd+EHYdCN1vJ+0=
X-Proofpoint-ORIG-GUID: OgnS9Sxv1xqEJCH6MM5kkuWqefl2RdCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120032

On 10/10/26 5:41 PM, Rob Clark wrote:
> It is a bit more a6xx than a7xx, and this simplifies the next patch.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
