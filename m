Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3910154704A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439982; cv=none; b=ZCTpEDuHSrcS2KRf5jsXSBt/bbEp8XMSnR7uA2Lij/d+Gd113kFryWoYvDkE964htvQAOQoacqtR41Qf6Ow0tvw52O5eiivRM4zwC4k3I6b1ZvdPCzBYxG4JIt9/OPbY5oMFjh6dwFM6Uc5EwvNfAFrDLRDGDFwmixIhF4zY+LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439982; c=relaxed/simple;
	bh=waeWroeP4xKtFKOgISd7hpP9YrbNnTVkhGw0oIV3/fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h92j/qMJX4X9RWZt+JP7DSnP150VAmGGc1i5XTnDCtoWkUMFb6Zgw9mm/vxXs2H9r9wDodt3sE8HvnCnBCd+tWdIrBnD5IRidyyVSh3yuIMOLwVKvboFDjSWBL0o6eELrC3CjUic/jTJo4Ecqj6g9lp7Pt5gPbJwnUocVxPMoaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtR08Tba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUJpAfnC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtR08Tba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUJpAfnC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BktN1158323
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0f3SYb/QaHvXkN8gz/IfSSHe6Mh2Mxm/hOMkaVJ0nM=; b=VtR08Tba7WqHucVJ
	U+8Piw0OWr+jbsezrQNyIh+WTA8mRVuCxJKaCAnhZaW7jDJZjS9zb8aYltomoOjB
	f1TRxxShskiEx7Y7pO8QBE9CNOsDIKyIPjZ2OsDPE9M14lTX6y7pmKvdpd1gneNb
	n3peM54vp25KmPCBwuOUt4S0ipcKYwPVjSwtvSM+BVaahFh2H7fK+cydpoWHJevR
	5j3HLah8P72wZ31tdbKUfFInHCOLHV9oSh3v7dlvjfr4r+gdGtlTi4cAkdw8mxze
	IaeWTNCzKodKhMCk3nHrxxds76tD/diHUVPrVsvHKVeIM7OCowGBglaTH7ku6e5z
	nf4QIg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51dgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:13:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a109c937so63131296d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439974; x=1792044774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0f3SYb/QaHvXkN8gz/IfSSHe6Mh2Mxm/hOMkaVJ0nM=;
        b=NUJpAfnClX9nQW8RSfxe5WW3MtYr8xtrB3Rv6ZjbbEPZiBtv2kYX2kD0sWAHpTBoab
         5VrxdaNseF6GY4YVgLZIem2yIxn2QD1+gDj428QmKL9SIaBxOAn4e+Ca5zqH9t1/Z5xm
         Afrgk2r8VwTWzAvaZXpH4VTV5YYltVoYIDtnZnj32hlUoKSDzyoM6E7D0CFVL1xxHcN8
         2PxtZGY0sFmZ3kFWyFz3W6okO3a4q7nneYaD6bgFYUlXymIHkASOuj6KSblXUUGvagBo
         DSlkct6qRb0Lw0PVI9FNVMK2Fbmab0t+2uiCCav1C3yJbLnzm2wxOnJgNqjQUaWRWscT
         2Oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439974; x=1792044774;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0f3SYb/QaHvXkN8gz/IfSSHe6Mh2Mxm/hOMkaVJ0nM=;
        b=nFmm/s3oPNw2buyvuZzelALNl/HEg3DVYcbS6qFBygcE2ETl3Dct+puT90jT+EdYxW
         fNU7/82Sxou9eM224vsSHHGgMrj61dwcwbeiQULelcMUxyr87nt9cyB6qwsoRUQ9ti3y
         pNWErr+xGJOm3BeQsaq3xypf9ERdbZq7xI30bRDezB01dfcHidxqPnGcFbOK47GQoXCA
         7Z6n6mybRgCd3ouXMw/jYBi8fnB5Py7XBvapoHXIsTqh0ucX2p/2mTsUT0qT60ReakA5
         ZXSIK0hk30oUsjCqPSzR2WBtyYFcr+G3B9Z7yMXoY0jVmTrbSysG76S1b/giKsEvzS9S
         N12A==
X-Forwarded-Encrypted: i=1; AKwUvBwAHqRVIqkzl2mAKKftoJuasajLUakc4EE1cAUot56j/bsh/Cu+LiJieelMHTkCcSk6gVeBmdz5hZ16+20=@vger.kernel.org
X-Gm-Message-State: AFuF++kaOUzGg+RBAy+Rqsmv9gDjismJr4koDxWc8uBOtkIsK5ASCfPy
	/MlHCZHApm8jA7QIYPZl+fXQiwmc5rRkTJYvQd3vtovN55mvvg1uzD9oznxVXencTosgj9mmxIb
	PQT9zcLoAUtdyKcy7D+ZNh+gLRsrqthhu6MCvTGV4emNjrOZUFWYAx4YExmELpL8f7n4=
X-Gm-Gg: AYBFou3/CvmrKQdFL8K3eTEPj9l1o2Qvv6a0490Px6fZNDY3nd712m7niNMYEsnQyzB
	4koypKGLs5VUBIrBW4dwtyW/g6DhdHo6Tzs5Mv28SpBrjjAYrjfPgrpDeNuLg6iJY979gaFeCTy
	nS+QnEozPal396Flldv/Li2Nv+ZQNHb7NIvksxreVIkIcHBM/U9FH9cj6CaJ2zy+zW8h8n/Z9fT
	wsDX2KzSkqPPVhQmvV1QUSVkjLRkZzwlQJuWPElyL5hKJf81/skaG+M0UrjHsJ1jt/66HO+uCqQ
	jUwAvOXV4F5keEVUL09vVghvnU41h8YxQHYTJg179olcSIbARA5mY4Fo5yXQm6QnDl3cJPT4tS4
	egdwxfJU/BpM1eeC4qWsVNnGYJ1fw6Rzr/jpjMc0=
X-Received: by 2002:a05:620a:1d0d:b0:939:93a1:1383 with SMTP id af79cd13be357-93e9b75cba8mr846472385a.32.1791439974537;
        Wed, 07 Oct 2026 23:12:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0d:b0:939:93a1:1383 with SMTP id af79cd13be357-93e9b75cba8mr846468785a.32.1791439974060;
        Wed, 07 Oct 2026 23:12:54 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c75b4e399sm8112748f8f.56.2026.10.07.23.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:12:53 -0700 (PDT)
Message-ID: <2b5c6895-58df-4fae-8d65-24806cea35c3@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 09:12:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/74] media: qcom: camss: vfe: Add helper
 __vfe_pix_format_is_raw
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-35-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-35-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eLxFO8qt2Zg0WeXj1I4PETEjNFeJsaA1
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac7346c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=STDLOB1srjojY5QKT3EA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX2FGbsCbKVTzN
 Pcvjzq2S+8OR8N6Q+7vEszYpuo3Q/hVgjVBQaEh00f8+FiRTEpO0R39O57EJbTU+1R0HvToLuZb
 O0+fyLepqibEoSSSQRLHOdQwnZjhBSc=
X-Proofpoint-GUID: eLxFO8qt2Zg0WeXj1I4PETEjNFeJsaA1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX1UmoYX07px4P
 bUVNTTiO+iO7jKwtNy9JrVfun9xc5Aw6HClC0YIIKOZnd+1KsqBEXkAzOfm/GWDyo2d416rdAPU
 7kDsNKWskWDc8zGQt6nq03MZxbhDVA5Aegwg4B9X+t1mZwBr2Xm4369TXEAYK80uPefvDetPybt
 AsJRZofE7CMNl3hc549cCe/Xn/Yd3A8vQFPcpBv9nD8b/LDN3BDjEAsEkkH+GbAxuyd4xqm+jqD
 1nUnzZ5XMCJa5prrANDCkbhbXa4GfzpTtbqlpIUIg38UpVPy7R0srS85N7IZ3KqoEWD4Cky/IOS
 62jD96Tgg5z1Ph9Essij13ep31RCMjEGon9l5D+BOX0qEyTIMu9vzMdPnNME+ZUbyjGht3CTdqX
 hAlNJobAC2VRi3iqW2qwgEKTquOBTOG5SQH1T5S58Zz4w/kNGTcVEuu3HIb3RGn/YYgo31ZaGP3
 M8UT4nymtBBU+tj0SdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024

Hi Bryan,

On 10/5/2026 8:14 PM, Bryan O'Donoghue wrote:
> It does exactly what it says on the tin.

I dont think it does exact what it says, my comments inline,

> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 9793df66b4149..43c91ec8db494 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -340,6 +340,18 @@ static const struct camss_format_info formats_pix_8x96[] = {
>  	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
>  };
>  
> +static bool __vfe_pix_fmt_is_raw(const struct camss_formats *fmts, u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < fmts->nformats; i++) {
> +		if (fmts->formats[i].code == code)
> +			return true;
> +	}

This function checks whether there is code present in the formats, it can be raw/yuv anything
why is called is_raw? Can it be is_mbus_code_supported? Or something similar?

~Gjorgji


