Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433EF3AAF6C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438753; cv=none; b=oyHCCTtGNKm7DPnVLMA2QTVuIHUCQKzXvmp0WYBoMzrck5CJjAxbJ0/oJ2RrXZT1gQ0K9hQvPZjsYMHUItNMQM61qwGl+v25006abFjyP7X68PIr/AY211je5ILiXsqZ+idu7IgYtpo/V18E38hhOHsYfMdW5jLJ0vw/maMvp0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438753; c=relaxed/simple;
	bh=Uk460tCeaBsvnwr6hFJjy+4DyVahTBOsGXJc5SDSfiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrZzgXkBFyrbYAGSVrSBKZ0c9AsRBQZO2yrEBTpIBP9kJHeUf/rvvSoZrTXQIe2hzgkFeKJwap3eGzhUbkgOiyQ9B8+NNZKjua+kom5fNDvjNlvuEXcQvgBPSsIQDajIQaF2EOtHvDBLpQ5WHSE/PCpAtBipz4/GCXZrAjAINiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mccORTXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f81qrD5q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mccORTXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f81qrD5q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BU2v928478
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 05:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nl/ebYpCxWS1VsQEQ0bG8m+LAAelmFykJoODQwZgW54=; b=mccORTXIDNT2ZsUB
	FQpsxPjnUmj4Jj3/LHWBjuNvxp5A1UimGevn6T5IFTV1flyg21GRbxUvVGlWYsb4
	I9AF+VWj/trumaJol5kRQiZ36lIQ+/0U671OyWZj1li0KRT2pTjDsTtYktoqRSfB
	gBsnQ206xzC0YuWjvv9o6WrFmVAF1mIiF2x62ZaHqZnG+8b0K+vZpRvKgr9E4LAK
	0mcrmLJmjvMY/d0fGThNV3v+xiTFvYxmsXtkT1BOksTDvugWZg4wNRB6Y4r/QM5g
	NMSx9WURBkecgicWWsE+QyFkwybB4ApiG1M+DC7m96Yt7XdexDc9KkQ/nQU73s1V
	Z0TijQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2sb7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 05:52:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso794384785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791438750; x=1792043550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nl/ebYpCxWS1VsQEQ0bG8m+LAAelmFykJoODQwZgW54=;
        b=f81qrD5qkExPUxszjTFcUCz9P8asSwudGPQHyzGYHFnKlPM3L9HKPTpYP3CVOqsbtK
         nM9ud7MK2jsKWTOkHB7B9ZVihkWgJ53qqorluf8nbHbaRVa6Ef4IXP5ZgWahvC50KmRI
         oByt0LVGX2Ao4PT6JNFuaZ22+nty+sPm/9lvptuicC00IoXHssqYZx+klflVYSo/s4kR
         rZHj3yJ09UhB07RlQMvqs0+omuP6R/n5fpTTouC2raxdGjQyvx0h9CupKzGZWwSp3/vs
         J0AsapmJjUpRPs40WlawrV1nh6z5oJfQuBzULw9SR+BbyhuGs6OYdE2UJE4atHXEpEEv
         n6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791438750; x=1792043550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nl/ebYpCxWS1VsQEQ0bG8m+LAAelmFykJoODQwZgW54=;
        b=EaOT1GDiXFzIvngPbxesuYn84zHRvXbHLMEMztX6/rWwtJbB2zh/Onp/7RI92MonID
         Sm5WQvIXrSSECSGNYqaUxRgF0gAKtAt5Y46wdA/FfoVLTMF8YY+E98s9N9/7jA4I/mdS
         ItKRD3qmkn95BT2pXyNZtYRYDH9LzKDpG54sp8JFPsG3OC8p4glwsYfIfzo3eO6/OrZ9
         IdRx5yScWKXGOmR8ik4z7TCvAKCQ7N0PXk9D63w6l7SyJ4JJoAj9bm3fn6bKqJD5wdVl
         s9k5mH0PixHqy13X2434V8pV+xaL96AkoyUSdpxeBRntK52vOtLOWtW35+9JQTyS9I/p
         A7Eg==
X-Forwarded-Encrypted: i=1; AKwUvBycZIlnlo33TDvZtcMGeLLiEbShQxVVf7z/iDIJA0FC15ALENALbSrSICO7EUYwHzuoz5Hoc7rtdPJe3P0=@vger.kernel.org
X-Gm-Message-State: AFuF++kkpqnJ2JbM9GoOER6kxPTFXllAiYGrtJKAtPez12l9t0yE4YDz
	IdydOfEZCyMUi7QvGO+DDDnUTovt91oPOPFqktCNX+9+ubHIjPnTvqGSGEj9W0dTCVco+DOd0ZS
	qW45PotsCEpGqYnAIqamSmXGHzdJ4QGO2CibU28vYU0678+2mlGo2Bc9BB2nuxk7vHUM=
X-Gm-Gg: AYBFou2QF15xflAYCFqvm/XSavwLqji5oL08KFeoXp6rOBKWhoNr3fQMtwjhkulAp38
	rWNXHTzuVearI5hDzKudIup67D/uiiTxBKN3dT94Va5XUp7BBl5W0CXrz0FphgNDgCjY4/epX0z
	GsYdy3gUQzILaBsIT+hzc9T9NQutSNFJcaKHr/YcTm0sNlD+XQZt3eByrMYWQf2jj00ppueXiEa
	O6s62NyzgDAOk1jxTY0GfhPV+a8huiadm49jrw8e+AM9FvHyLWl/L2gOktx9TFLpE1LqJwgYtv9
	twgNNIAC2CWCFQ5aYVCzzs4XnFbRVkQbz141GG6I0ZT5xmlDr2PxPuQYmaWbEQ3Gl7x58xVglAf
	bWIv/5KYTSqDVjPY0seAYvnq+dS4MnrDO6qVGEFM=
X-Received: by 2002:a05:620a:198d:b0:93b:d79b:9a54 with SMTP id af79cd13be357-93e9b79f90dmr851201485a.53.1791438750466;
        Wed, 07 Oct 2026 22:52:30 -0700 (PDT)
X-Received: by 2002:a05:620a:198d:b0:93b:d79b:9a54 with SMTP id af79cd13be357-93e9b79f90dmr851199185a.53.1791438749947;
        Wed, 07 Oct 2026 22:52:29 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1ffbcsm8841922f8f.36.2026.10.07.22.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 22:52:29 -0700 (PDT)
Message-ID: <644dfb83-4543-4615-8300-165b40e222ea@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:52:26 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/74] media: qcom: camss: vfe: Define vfe v3 completion
 group enum
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
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-24-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-24-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX5AruwGUEAUcu
 MhcUxfw0SZioWf+1iQu3ARF3k1GXtRCsgBqd3ghayin4F8t+yJ9gRsZlgdw7UVAmvzlHrLbIXxM
 Q4heyYILXK7IpDtQDrMia88OgGaevkQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX1j7bye4PMGzD
 4RciEXj2Opk+No7sB7ARTgQvHB9mbWvt6vNCVY0aQUfznt+J/KrEPfLPKh0W2x+5IlALKvYt3Sz
 YXzNP2drWJrQtKo2bYQUpWyIgoi73ANd153SEztfKMrjlpcAneZo1mhruxGESao0hmb3MYHEogW
 7vD0/yolkSW1+EiSwNqUaHPA8sFuiZkwFvWFcOleUtZEgAKXoFaL0OjcMyNxgQayMSycJ49JKoP
 GmjWbN/uHMPsBBunHbx61Xzriu+nI+yHbjZup+KRIZxm0uJ6FUcronCw63+FLMhKzTopVI/tEiU
 yTwPrlnzNQDHlW2BXi4dnMNvidu5PE+AUnlw4LebBJq4tSyE3ydapf2H11SggM4mch3n+HiG5Is
 HrZOnesDLE249EkDrOEpJZ1qJxe/7Gi7Da/LvXxGnW67VhYihw4f6lsUiMYD0TQUJLZwp9a/Kbs
 Fb5KS0IHb0L2REVwlig==
X-Proofpoint-ORIG-GUID: wKkTFAHrj1ZQKBm92OVZQ5kAJDUz3T0J
X-Proofpoint-GUID: wKkTFAHrj1ZQKBm92OVZQ5kAJDUz3T0J
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac72f9f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=V_ISnGxoR7IPBYvKj00A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080023

Hi Bryan, 

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 925b0e59f9605..6ba0d0c7d6be2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -78,6 +78,27 @@ enum vfe_packer_format_v3 {
>  	VFE_BUS_WM_PACKER_FMT_V3_MAX,
>  };
>  
> +enum vfe_v3_comp_group {
> +	VFE_V3_COMP_GRP_0,
> +	VFE_V3_COMP_GRP_1,
> +	VFE_V3_COMP_GRP_2,
> +	VFE_V3_COMP_GRP_3,
> +	VFE_V3_COMP_GRP_4,
> +	VFE_V3_COMP_GRP_5,
> +	VFE_V3_COMP_GRP_6,
> +	VFE_V3_COMP_GRP_7,
> +	VFE_V3_COMP_GRP_8,
> +	VFE_V3_COMP_GRP_9,
> +	VFE_V3_COMP_GRP_10,
> +	VFE_V3_COMP_GRP_11,
> +	VFE_V3_COMP_GRP_12,
> +	VFE_V3_COMP_GRP_13,
> +	VFE_V3_COMP_GRP_14,
> +	VFE_V3_COMP_GRP_15,
> +	VFE_V3_COMP_GRP_16,
> +	VFE_V3_COMP_GRP_MAX,

Can we use numbers i dont see reason to have enum with _0, _1
but it is matter of taste maybe.

> +};
> +
>  struct vfe_wm {
>  	u8 bus_client;
>  };

Can we get at least what this bus_cleant means as comment to the structure or commit message?

~Gjorgji
