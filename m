Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC41388885
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790037; cv=none; b=it9AKni8p0P5/eeJb/BI3XHlyJ8bSgBzQ6AHNwQPEb1Yjm7fHylcwTdhah5jjG1hhoSBKEEKshvfpzVhn7nV9mYV1D7HBKQYhX/CUU4tLS9saqAgTkp4tr0igNAUtf9wjUm82TlQFz9nB0icB1WxqGs7eFnMBFtFf11bVFvzSQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790037; c=relaxed/simple;
	bh=i4VKammu5buQoQJpeeXuROL/djsewq+/0g1Rk/STEME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KftSBlc/C3H1sRY1P68Qr3U+kPOvs0MOXAehRGdDCByVfQW/SP9SKW8zSzBGoWJ5B+5hH6NRNRmV31cjEBAOlZ+FejRLsThKCs3Nhp6CKuP2U/k4EbWxWmjN0m5m4FInbgeEdCRgP1JQXqcC0dsVBame3qHf19WG0Dme6sR1BuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bx6cXTta; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PmEgM6wO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bx6cXTta";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PmEgM6wO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55wc3751220
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4fyEjrePybpWgh38Es527yBPdJjlebPtKOB1ktyX08=; b=bx6cXTtaP9nm0zq0
	j8GTzMm0yPWTrSODa0JYEqS6RTFjREX/EAPhxjCh4mMmmgTPrWGYSOT5JJTc3kvc
	l6stk64/Ysu1Kn6g7CT/AtoXnGbUJYXWNjWO/M1xWXNOXBqpb2D6M9SftbW91oFX
	fzPT3ff6TmmHnHKZLszsecXzviWbuIgsPrGfJP8TKmGkaVRvjswIlvjB/oC7OIBL
	sM7zfN9o36xbZbgMzhjH54N8ebZfeTlvPvgYqGPVcUuohP9nWbQlZTUlmC1v18ZJ
	cUwyVP8ZG5z9NWAiIROd4PFQY98ljsOWrRY1RISe3/1R4DTk+m1v0AI+6lJ17h2a
	1z1k7Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed85q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:27:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91064f6e75bso73232886d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791790032; x=1792394832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4fyEjrePybpWgh38Es527yBPdJjlebPtKOB1ktyX08=;
        b=PmEgM6wO5P09DBY4OwhjCm6nRSS/UjEjbnL6UAZMCojlGW0agDRrpGmxDHNPiJRcPK
         ADaTeJMnbNgQzNz2V2zQ409sE6djO5rpa8GbfE9Ce4/noW/KIJraxm7UtK2PM5Xo+Tmf
         brVqN7CASuOWWH7MpUZ+MNXXFOttN4toUOxuP25OT9khfrXww2PrQKM8ZhsMOiqg39zI
         0DY8GA1Fld/krcnJS2KPxqMR1fFd3kz0bnSi/A2kOeejyB07WyZ0ArL+eG9rSjAjRphr
         ummgdyWPIgKetFi7qqa0OGG7FavyUHaxi4C0BdUadkXYiGuyyO0B354k7/7WkkqMf1i9
         sP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790032; x=1792394832;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4fyEjrePybpWgh38Es527yBPdJjlebPtKOB1ktyX08=;
        b=hGIKFUFtX/ZeCzwhlKYfIUkRCk4Gvppx98HcScB6+0ete96D234QwzAe5TvxndnYi3
         rYaRPMY1BOZZ0G+5dP0SKQYxGzjhbXCICxfXHysfPKko2cM4PwX3Xt2wpdals4WMgsDU
         pwP0NfWyrYpsPfXxafqevSmf8ttVVfwoEmaw8L/Mtkvc2ULG4okRGoFdY2DBYvC/0vwQ
         KlUcOzZFliFUYwNOZAmFl47enA5pxMQzArkiStYrWSOfBDa3MFNmhrFRf1U391xpe+65
         ZHpz7Dj7TGqGuCzu9+CEXu9Wfn2XBmprFY021Wlj+veHXyqCA0yAuKV0fgla7bgSJ69D
         V3lw==
X-Forwarded-Encrypted: i=1; AKwUvBwSBF4H7ORmr5w9z3/U2p4Sj8gle6LwZXF0afXh9W0h7wp392hp1EJVx3soYmHWdM4cvhGrFCg2IWn6CKs=@vger.kernel.org
X-Gm-Message-State: AFq9FYImCzewtHyjXBmxYD5SssWgUMY8aoW7RAR7QvN+/oRClzYOSioN
	5ohNrQo1yXLk0ko6Vi2WV7146oLdtZX5zYoiS41NG7+x3UiSkDT0Jw+zkWUNBWo14DqfQOiaezO
	kIy2pFExp6mfRGWD6Nn7Lo0n8YsS/vhJeKL2pDmnTJFVegPuny4Zqofi2B9s2pJf6ShA=
X-Gm-Gg: AYBFou1sDIRYt+x+IDcbknrNgLZ60Dvmp5NUEf8skeyT4rb36ffJ7QUigi8bpLbcV7D
	qTT4SArFgQCgGvj79BmSWH/pihBlVCySSIibvGrMDb8WV0Wu4Cm85hIZv5HKQKMh9fVUTiw9GQv
	GB3XgVtA3UhcCGy9lw0opbTIIYWGVpCHbN/XLzxwP2j8dCvEUiCvmezyfRbeI0SgBvEsXiPxtF2
	sILCh+ahWE/+Cx0CejbBbdo5ik7ykPsTfp8ScjdAESj8YOHUEqWVCFE+TBiktKgZvrljs1J4Ujf
	0b8lPej9D6j2THntSw1Erjka7HzOt/ypLG9cQYUK4uRhYSmrsMJHVaVMXhvgFyRC2Hg8wVpu6nJ
	p2JAdQqA8oyVJedVfHybTnnI2b2EjDf//dzVSrPE=
X-Received: by 2002:a05:620a:2713:b0:93e:c12c:fbb8 with SMTP id af79cd13be357-93ec12d0844mr1554167985a.69.1791790032534;
        Mon, 12 Oct 2026 00:27:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2713:b0:93e:c12c:fbb8 with SMTP id af79cd13be357-93ec12d0844mr1554165685a.69.1791790031953;
        Mon, 12 Oct 2026 00:27:11 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c198134sm267210535e9.15.2026.10.12.00.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:27:11 -0700 (PDT)
Message-ID: <f2f42426-16b8-41f5-8501-a01a1c33dc01@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:27:08 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Enable the streams API on
 SC7280
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260915121536.19207-1-hitesh@ebytelogic.com>
 <20260916065422.819512-1-hitesh@ebytelogic.com>
 <20260916065422.819512-3-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20260916065422.819512-3-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX3KvD5+6wqwOG
 QcfOHtcmuj2CT1X+DbptyZHQEu3n1Q7EXmB/3eihce420AILwaI/oOPvSeSSGeqXTgBhenaXS4u
 fslVKLyDbdLpANRcxbdvI0sih0zElTuzoO+rMAY5+cWnXM/m1Iv88ZcarTKJpB9HldnouhpviGP
 Gbxo1ZOa1tJLey4VvubSXUSCdG6JEKXvWItkENpJnCbHEeRgjCsVuY9PWuOCl78rfk7BYKS/u6D
 ehSl0P5Ui6LO59q8PfdHlcDaihldJpSkmTQrfzmSyA7W9d4mIoPGM+zPsIZvknbolE5P4bnkZL8
 S/7zsrtoYDurV1Lr1rvxhK7YzVKeTH3wj0zlp1b7t1GGXREz4XCB9M6TtyXAHItNAbxpn+OQ/v/
 jAlGTYTpDCZs81l21DP4C4BTW/Lm7uqGSyly0kRv+si5ZevbtRzmIxi+phYykmybwtmcH5Oonh/
 TekFbnXCR4VZAq2oB5w==
X-Proofpoint-ORIG-GUID: ymFwAwLt48qYKsEiFr_rOveKFlUmUFmS
X-Proofpoint-GUID: ymFwAwLt48qYKsEiFr_rOveKFlUmUFmS
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc8bd1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZovgdgjKAAAA:8 a=XLtVEzLVMLZyz3yzeyUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfXywyUkyRDTSor
 wdqYWFbMWYYbUxwtVOl7h/UsdgzFQtChmKXdKzCs9ydOVmc65S2KprS5YvUUdudWBTcGC0MbiSV
 4Xu0tnxtqChjr13KeJO222SLAjvV5HI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Hi Hitesh,

Thanks i will try to include your changes in my next series,
it will need verification from your side as well.

~Gjorgji

On 9/16/2026 9:54 AM, Hitesh Patel wrote:
> Set streams_enable on every CSIPHY, CSID and VFE line of SC7280, as
> done for SM8250.
> 
> Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
> deserializer, one camera per CSI-2 port, so two independent pipelines
> share the deserializer subdev: both cameras stream concurrently, and
> each can be started and stopped repeatedly while the other keeps
> streaming, without the WARN in call_s_stream() and without the second
> pipeline tearing the first one down that the legacy s_stream path
> produces. The CSID test pattern generator keeps working.
> 
> This patch applies on top of Gjorgji Rosikopulos' series "media: qcom:
> camss: add V4L2 subdev streams API support" (see Link below); it does
> not build without it.
> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> Link: https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com
> ---
> v3: no code change. Reference the prerequisite series with a Link: tag
>     instead of a long URL in the text (checkpatch line-length warning).
> v2: no code change. Add the dependency to the commit message and as
>     base-commit/prerequisite-patch-id trailers, so patchwork and the
>     Media CI do not try to build the patches standalone.
> 
>  drivers/media/platform/qcom/camss/camss.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 0201debd4..2023c0df2 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2280,6 +2280,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>  		.reg = { "csiphy0" },
>  		.interrupt = { "csiphy0" },
>  		.csiphy = {
> +			.streams_enable = true,
>  			.id = 0,
>  			.hw_ops = &csiphy_ops_3ph_1_0,
>  			.formats = &csiphy_formats_sdm845,
> @@ -2298,6 +2299,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>  		.reg = { "csiphy1" },
>  		.interrupt = { "csiphy1" },
>  		.csiphy = {
> +			.streams_enable = true,
>  			.id = 1,
>  			.hw_ops = &csiphy_ops_3ph_1_0,
>  			.formats = &csiphy_formats_sdm845,
> @@ -2316,6 +2318,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>  		.reg = { "csiphy2" },
>  		.interrupt = { "csiphy2" },
>  		.csiphy = {
> +			.streams_enable = true,
>  			.id = 2,
>  			.hw_ops = &csiphy_ops_3ph_1_0,
>  			.formats = &csiphy_formats_sdm845,
> @@ -2334,6 +2337,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>  		.reg = { "csiphy3" },
>  		.interrupt = { "csiphy3" },
>  		.csiphy = {
> +			.streams_enable = true,
>  			.id = 3,
>  			.hw_ops = &csiphy_ops_3ph_1_0,
>  			.formats = &csiphy_formats_sdm845,
> @@ -2352,6 +2356,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>  		.reg = { "csiphy4" },
>  		.interrupt = { "csiphy4" },
>  		.csiphy = {
> +			.streams_enable = true,
>  			.id = 4,
>  			.hw_ops = &csiphy_ops_3ph_1_0,
>  			.formats = &csiphy_formats_sdm845,
> @@ -2373,6 +2378,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
>  		.reg = { "csid0" },
>  		.interrupt = { "csid0" },
>  		.csid = {
> +			.streams_enable = true,
>  			.is_lite = false,
>  			.hw_ops = &csid_ops_gen2,
>  			.parent_dev_ops = &vfe_parent_dev_ops,
> @@ -2392,6 +2398,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
>  		.reg = { "csid1" },
>  		.interrupt = { "csid1" },
>  		.csid = {
> +			.streams_enable = true,
>  			.is_lite = false,
>  			.hw_ops = &csid_ops_gen2,
>  			.parent_dev_ops = &vfe_parent_dev_ops,
> @@ -2411,6 +2418,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
>  		.reg = { "csid2" },
>  		.interrupt = { "csid2" },
>  		.csid = {
> +			.streams_enable = true,
>  			.is_lite = false,
>  			.hw_ops = &csid_ops_gen2,
>  			.parent_dev_ops = &vfe_parent_dev_ops,
> @@ -2430,6 +2438,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
>  		.reg = { "csid_lite0" },
>  		.interrupt = { "csid_lite0" },
>  		.csid = {
> +			.streams_enable = true,
>  			.is_lite = true,
>  			.hw_ops = &csid_ops_gen2,
>  			.parent_dev_ops = &vfe_parent_dev_ops,
> @@ -2449,6 +2458,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
>  		.reg = { "csid_lite1" },
>  		.interrupt = { "csid_lite1" },
>  		.csid = {
> +			.streams_enable = true,
>  			.is_lite = true,
>  			.hw_ops = &csid_ops_gen2,
>  			.parent_dev_ops = &vfe_parent_dev_ops,
> @@ -2475,6 +2485,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>  		.reg = { "vfe0" },
>  		.interrupt = { "vfe0" },
>  		.vfe = {
> +			.streams_enable = true,
>  			.line_num = 3,
>  			.is_lite = false,
>  			.has_pd = true,
> @@ -2501,6 +2512,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>  		.reg = { "vfe1" },
>  		.interrupt = { "vfe1" },
>  		.vfe = {
> +			.streams_enable = true,
>  			.line_num = 3,
>  			.is_lite = false,
>  			.has_pd = true,
> @@ -2527,6 +2539,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>  		.reg = { "vfe2" },
>  		.interrupt = { "vfe2" },
>  		.vfe = {
> +			.streams_enable = true,
>  			.line_num = 3,
>  			.is_lite = false,
>  			.hw_ops = &vfe_ops_170,
> @@ -2551,6 +2564,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>  		.reg = { "vfe_lite0" },
>  		.interrupt = { "vfe_lite0" },
>  		.vfe = {
> +			.streams_enable = true,
>  			.line_num = 4,
>  			.is_lite = true,
>  			.hw_ops = &vfe_ops_170,
> @@ -2573,6 +2587,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>  		.reg = { "vfe_lite1" },
>  		.interrupt = { "vfe_lite1" },
>  		.vfe = {
> +			.streams_enable = true,
>  			.line_num = 4,
>  			.is_lite = true,
>  			.hw_ops = &vfe_ops_170,

