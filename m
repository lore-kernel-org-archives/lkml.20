Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55D14E77E3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409530; cv=none; b=RTzDDYZWJI3HUOswjaKo3piEr4/fm4C10/HWQjLlCjhrQIHLnv0zP5PQpT7PCLvAZUWv3psPNJLEKwNODHiv59LL8+7byYgfmxw/Gn9nfdsxscnXnl3g2w8eAwm8IftN8cX57Im12YoBdTdQ+3OH2TrybrD2vlURmUDDIzYbzyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409530; c=relaxed/simple;
	bh=lwQQfEh9nOqhpblPlramWU10O82Qm2G3izaI5hHN9R0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2Fz+PcwWrjDXOWWdF+OwUbS9kdaPbkBkGT6UaQ6jddGCxQ4Il0gclow3j5atHDfN1KKQNezyurZNxAZPBTrZ0MRkGQSokj/Zi50zsBlOpJBePy8Nr4Ua7J9Fql7+dxHI6B7kFTC3JN15CPv/NjZqh9eTNbQ/RSj6gJN87fi9wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTDo3FLr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iakHDYG4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTDo3FLr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iakHDYG4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Os6T1665655
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pohp5mV7y1QLZu3exMVa2FPIYN+bK5gJNyDuRfvMI3Q=; b=RTDo3FLrGhjc/gZy
	n9Glp4xGxq7EJQEmcX1CiiEZZxn9jiqfa6PgqNIScBlelsdwbI/OqFuP521zGQ24
	sPooiOe25IeGZvNevJlSmbfEBn3uP60wQcWomHSTfYosxV7WgnANn5YazYR4wCO/
	hwOcWMMaTHiZAMPdUdXZruWtjRujJhyks+dyQ0KvMnH7EQc4GTBEVJDHbWsUgmWI
	gU0QAVjU2any5x0K/exh2z4mCUoP1R/zW6MMJeWFSILCCAcAA+HMZ50SAvMnQjrN
	NbU7PqlKGXGPkCxB5ow1R920VeVDCryDIoWwoMPBWJ2UltbyoWArBcwDZRzsREsm
	e2qUow==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0uaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:32:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e9b3b44aaeso57978e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409526; x=1793014326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pohp5mV7y1QLZu3exMVa2FPIYN+bK5gJNyDuRfvMI3Q=;
        b=iakHDYG4vMtBHmj2yC3gRRWgIXMF/XTRCHP5bVs0GEXABg1GexTe05n/jui93hbWP+
         xKjHTm93XTF7jC1w7Ym9ohglRiFTJ21iLVFtC3XY6W2jDcwEOWsoXMfsbtHYrP5FPfze
         BidZdVKwP2Pz/0MNNjj1hzbH/98q3Vhjrw8bvmSdrFcQ+dtF5BK2/x6q/eSTtjAx+wnV
         tNBAhERoQSA1GzXQWA6LdaC/DXKKhKxLtbmeKsl+sphOa/PhhstbC7JjxzlqKdPxcXtS
         jbTzaB2pvGhMIsH7J25i7hb8o7Mv7sdCzSpgLum9cfIVEX7t7JXWgKWljcj8s6a8ljuz
         lI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409526; x=1793014326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pohp5mV7y1QLZu3exMVa2FPIYN+bK5gJNyDuRfvMI3Q=;
        b=Wq8lnLHVQimTGbL9EEuPDSx4A+KCbNaAzvUZoOelMuvXA5dUOBANeP4wV5Z/zPTIIo
         0A91ZfZS0agUH2mLvd8S5HMcnYZoZNxwI5VM15EFJTxph/jYsRK0i0gUcoJe4+icsn5M
         GQ38ElMLYJAQeEW+0095j78iLLOgaHzbnVLf2moukq4qThSksqc9f9Fo3/u4buecxZHR
         HYqvqSe52Y7i74wVo56oDcLgLDYoTGrif9hefuHHJEBAa6KDWD3+x62+m7NHaxsV1DSY
         zAO7YxBpfGew65rf6EcE3zWSuNIWMrnXlA74aTC+93n2PhKvc2kzdcfdYPrGxuUwFFXw
         Cthg==
X-Forwarded-Encrypted: i=1; AKwUvBzc79fIde7EIZZ5bLX8I6qG0YrYxh3QN8VN0sjgKb5Afel5Gx5OoFBXmEzuBKGcpq9lKCeODEGrWSxHdj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXQBb8vlOOkoNyo2gcnzqAFnpiZelTqe/4NwRSPmfsfl4CCHWL
	3qoMXDM1TRTkceiFn3YXxAqzrVtxfMa8STcv5QQKcz4z1BFCgqQ6Ul/q2Owmci1JXhhY5dCQ8EE
	RyKhAaZHp8VSglB49TrjXhWl8gfwNoo6Yxx3rqQlsMIIwOtshOLWkjsMAf5S72bJ8Cu8=
X-Gm-Gg: AYBFou1/CDuBJ+6stYX4PV2kZgaTnIdNxxgJQ4mRwWtAfXOFlu9xTAD9FzIDUzEbQAI
	LjmModweljyjiQcd/hJwdKok0d8kMIPf/HnMpZfJDe5dOGbgGOhqbCIi+lg1v3taGQk1b8xp8ln
	9AZwSbx3T13+Ag8kuzMOe3kSY/0U20zy4xyRKFTJlkziYzWBcqnw/wmfin0mTuhNP8CLic6P1ZH
	3Sf9t2YPBicuGV/R/K7JGjDWLsPHNVFScwLGHDZh/QEr7nzR1JrsA6sQmF3scVZUGA6AzcTwpRs
	X8eHM+nEFf8b6lVS1K7W4dsyOTfLf3KbRbK4E/6vt+vIpnBhh0RTM1t/+sFHWFpvDiO4N9E3d3h
	CCH/mRUWDSlkFZ0+vnC23mg==
X-Received: by 2002:a05:6102:dd1:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc36973b47mr1277907137.3.1792409525964;
        Mon, 19 Oct 2026 04:32:05 -0700 (PDT)
X-Received: by 2002:a05:6102:dd1:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc36973b47mr1277902137.3.1792409525489;
        Mon, 19 Oct 2026 04:32:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c42554cf6cesm217763566b.36.2026.10.19.04.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:32:04 -0700 (PDT)
Message-ID: <e91eb6ff-1d7a-4295-ad57-02ca2bd10411@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:32:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] arm64: qcom: enable display card support on SM8150
 HDK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXxtN3SKTX6AEh
 pIkO3SmW0K01nBbX7xoJopCXkmMnyvrExEUWBpQDSaSOwr0K8r67LT9sy6pKZaieMhOya92J3Qg
 OazJQEAfZa5h8WKK1DvK3SxoV1CNGJU=
X-Proofpoint-ORIG-GUID: ZXjMLZ99won02v60GqCuSUDMoZnxSR2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXw7c4ZNC8OaE4
 NJ65cuevBLHEXcOM7SJJawwK8D4/XeCV4qqKN178J7cP+8vmg632FFRa2d1EDXwvXf/QhDQpMpX
 tzU+i9DWUNlJ3lPjQlOttOsAdDPoYjT4ROSIs9E6mQmld2eBs84q8fR/+/NOcAOnj6g2ZHr2Cm0
 a8zhJkVVvTnAaTmHpH1gMye2oOsr2I3nUwaO7/ahuxWdUfGjuIMq6u/ff71S6B5GJJSUT74PwsE
 Gx2163Ldke7k5SYLeMkaxj1McIbD/cHkO5jNo/Z64uiZRJ3HDkgw9dWdkN9QlEl3K2CYLIo3nOI
 7BoeeXWps7rtT/v0GYtal/U9MgwNPOi5D+ZHr1XafQcxzOqc7zRLSWEXCx2i4jOuuxlNcHfi/bk
 GCfoQ53zIy6v7C0VVT1t5IiqyM5tAT99BhtOsRIVJiEthJbeUobyg/Ys+xKo+UBqD8jyMlWjXEL
 rkWrJtXP1D94ESve5sg==
X-Proofpoint-GUID: ZXjMLZ99won02v60GqCuSUDMoZnxSR2q
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad5ffb7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rzYBljbM_JLXBvC404AA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045

On 10/19/26 1:25 PM, Dmitry Baryshkov wrote:
> The Qualcomm SM8150 HDK can be equipped with an optional display card
> having the same panel as the display card for SDM845 HDK. Reuse the
> driver submitted at [1] and enable display card support on this HDK.
> 
> Unlike SDM845, this also requires a new LCDB driver, providing voltage
> for the panel and several fixes in the WLED driver. The FSA4480 address
> fix is independent and can be applied earlier.
> 
> [1] https://lore.kernel.org/dri-devel/20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Dropped WLED patch, duplicating one of the applied patches (Konrad)
> - Rework the WLED auto-calibration patch, also dropping the reviews.

The latter failed to complete

Konrad
