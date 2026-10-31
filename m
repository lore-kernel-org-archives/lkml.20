Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793434622;
	b=rMcmoDdwlkI4TREyQ7X++qbjWyb11q7EoCyFyhabrnWGSksppT1dDR6DWxmTe/mQQoI4
	 BcZDtOk8xxYqywbRxWNfKT56AMDnEBquNHFUnpY6r7HeTZc1MQitUNCT4QiCuXIezUp7E
	 A+JhCyRFtG1zDSh9g0y3xAsmyKlJE+bHGvPhlpIkuL6jXcS2dKwuAFH4OTgR5y2cTLlZC
	 aqc4cWeTTc9vdQrOVJYhFT2pMPiy+e9XZSvSzrfIJfJeVbt+lyrPCBJlCkeU+UaI2hHNe
	 kNylX5ISKqfERR8EfRpGiWyhuFN1yOXNppJW0JHkVtA/u37ru0c4ksPVV5LyE/DmZhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793434622;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2vw6HyQtXuRoikTGlJUDmnSnXK5AJkthquCz9mUm8YI=;
	b=Ldt70HQ9asG7E4ID2vyNufQbGTBB+KZQKzpGvUYPtYMpXmG5kvLj0wJwRS/xw3QfE/0/
	 BKJgV2ZmzOTBFYvW0GYgpR31LOPD+prZK2g8pm6Uxp+am+hf0kdpfYV6we3ZqmxIRvqFg
	 mVB/gYTRjsI4n/8oxcS9j8XMnYAmC0RRb5NcJdoDCkp+BT3CcVn4P2tM3Mp17eW3Sb0Zb
	 G7Gwu+ujnEY53eVYGIveKPLiGPlpyfChScuW2utib3CRd1M7w5dBD90sWkB7uL43zM1v9
	 s0aG6Nzik+jJoVr34hMeMFZu8qwISgkAkDY9sNV07MESrF30vNaYMG7TU98w013q/ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HjzSbq9x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=giUGF3Rr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF1E606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF1E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HjzSbq9x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=giUGF3Rr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4aIlY1169009
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2vw6HyQtXuRoikTGlJUDmnSn
	XK5AJkthquCz9mUm8YI=; b=HjzSbq9xqHwShjbDgQTAf25CWAw7T8Cga632j0tt
	Nz5y9pJlWXGq0dByUVyxZufshCtPW3xxgj+1dDUB8tj9rl4lDI91XaVJ6Eg4XhI/
	6rdeeVF+bZ9S4IEOjU/ccrYL3Q8XK/NUpJFZfEpKyOvq+gBezmx/t/PFDuw8HPH9
	1w0sEAdGQkfAForLQGhLXid81HAIhtaXXQBBFchTyILWFJa3RuIuaEXK0tkTvP/I
	nhUwHaIpM7YvK+mHuIKhBIxCYpg8xdf1GuvLhPb63Bu7wU1f+oB6VFT/0jYmu9LS
	QG03Am20rx7tbFYJHHQNjewtG0t+pRs8NQjJVr9QP/4Qng==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8du8mmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:17:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3334960eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793434620; x=1794039420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2vw6HyQtXuRoikTGlJUDmnSnXK5AJkthquCz9mUm8YI=;
        b=giUGF3Rr1YodUYQyaL3NnIf5JhkBG9KyLS4dWko6slUFG4aSLsC9XA2YEgstKh63b+
         AQGB3ViJiA0PmiSMv/vi64O5gZ/xQUX6u3RjpcV56PUmULW/rMvbWW9KysDoxDLBklwC
         XvxG890efefFzbgtL1iu8WcjikSWCymn5vys4v/YNuGytd8VeO0AhtB/7jHX1CMLLZRh
         j34mrr/prdQ8BbcGA31vfrWPsuaJu4p9BTQLdVrnptKDkubrYtKQAK58SEyOCQNQJjtn
         Pyh4xr815jC5tUoPqNi1wQGH+CTInjpHlazksSt5VjEREQQ5cF5Wt0F60Ber8CU7ad/7
         woTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793434620; x=1794039420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vw6HyQtXuRoikTGlJUDmnSnXK5AJkthquCz9mUm8YI=;
        b=HSid9y4kmV2iVz5ISLaasaB5jtPWsh80S2wCcqtVGJqN7WlwBoXzDIc5d+XD1tRei7
         51Me7l3k7oe+paCnthvUj/sv95MruJaH/a+T4sBarRV2OC3YmYMuiAXqp05ZINHRBUie
         3KY630UXwrp7MJIV3L0Pqc9stbGvVUXOUWPgSew2TRWoj8jAqvy6+8PUQSjTnnbZ1css
         zXsWMqBkEoLllRTpA9PQYqir2I2z/83Ei+xJa8kHlGRjU6BpLAUW35kihdxUtZAUhFmy
         ERxoRHfXyn0VE8LcnB1Q2WZCDhV4wDvC9rnkIk/Hls4ZSIMIQXrhdz+z05hYO+NZJ0n5
         dGlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAB+PW3jlDMst0QG1hk8qLzldaAna1r9TDdLQr01GqR/eadDioE7TNlYV0w66IvCiYaQpDTax3gEwmB74=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRx8ney2KvodT8vNwViInhP9WqvqapPWKSxsy/GUSI2Y119ULR
	wuWTHgFxcUGU5cE24G/fQR7HTl9CDnXGuucoRt6P7ExvmyP8x795cIbECb/Vc3r3JomZvQq4zYw
	BFAc/2AkGVJilcL756uUo/6IsSif5C0/JMImfq1NQW6uKRwgvb5NVUQJ+++VpZ/3yyyk=
X-Gm-Gg: AYBFou1l7hJYY+9ImlexIFyX2chCMuB39v5JokiHntmHPnti7u0g+qMkJRPmZSg8hKH
	+nQkBr3f8iGDi28JipZCS7k6+EgWZj4pL/frATw8LRM2ESpu25+ijcPhvX+bM0hLc3VRe8IuMTh
	xL+mQijB4MHngzMy3QYbgdzKL2TZlVJO+YJROYkbRN50B2nKTxO/LCBR58pN+8K1lVwGH2iGY54
	CY5CO+u0vHR9sdKv3TK0EuFujyNvHISC0yZpFGVLmw7n/aHyJ1LBHaIlBvtdzuzqgqGjB6BkjnV
	PAdoBrguGIVTYauA+CF5yOzN1yIyMh/JnFlFmvbqGmNedM5B98oXIEg3c7184B/i6QGGkhE8tGj
	bGrq8rD9LupLel77AO6QmQIQG78T87cgIMWCJ/65q5cYg2/W9QZYsDDF5YlHVC8chIZbwe6biPJ
	RHBB4nhzYmj1X9HTM=
X-Received: by 2002:a05:7022:5f15:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1ac5d88c71cmr6434305c88.13.1793434619485;
        Sat, 31 Oct 2026 01:16:59 -0700 (PDT)
X-Received: by 2002:a05:7022:5f15:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1ac5d88c71cmr6434270c88.13.1793434618901;
        Sat, 31 Oct 2026 01:16:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm13098143c88.8.2026.10.31.01.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:16:58 -0700 (PDT)
Date: Sat, 31 Oct 2026 16:16:52 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Message-ID: <auWj9PgfrDMNYrI7@QCOM-aGQu4IUr3Y>
References: <20261029022340.591372-1-shengchao.guo@oss.qualcomm.com>
 <c28ddf94-9bfb-4ed2-977c-4b1731a03887@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c28ddf94-9bfb-4ed2-977c-4b1731a03887@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae5a3fc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8aRUgtnILpt5z2d1PpgA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: JStmm9Ml4dAZ2bJylf0lVi3fXW6q_Kor
X-Proofpoint-GUID: JStmm9Ml4dAZ2bJylf0lVi3fXW6q_Kor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzMiBTYWx0ZWRfX24/3gY5KMpZr
 oVxEyCn0a0zW9uxhWSbIOVVbB1JR6jRleTZK037sE7A7E40IV1DZG6Z0PMuRPUx/mIFbgc7YIfk
 C756YxfTpa7Sh3aPWOpSt4qceEbTpfL5sjBOoJNN6kO2k9rGFU9KdQBSIhMjMuXx7U6OiumOE3g
 0zlbjxZx7i/jOYmkdmuFp47IIvGJbPBbRmvFxZkRftCLRXDoxp4bYfVNxZ5OkFN4gCEL+mEXxJC
 bJ9yVzegSkBCQiyN2JjrA4mfXDPZ/Xkj6d9qr/xN268IyUS1fwMsbx+KdmXkeLn85tQN1ziRIbh
 tvU91nDokv/NuXZUbyEwsJRHNEecs4fDKixCpOEHDEk+wM5J738onfXUoYKquBrF0ir783AX/3A
 wT4cBycmPq5do/vg9hlarLhh75HIcNz2Gte44LYJungxlFZ4PdT/FfNmqdrD/3fHOyCfprUHy9L
 mnA/VRwnev49HAshbqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzMiBTYWx0ZWRfX8uH5ND91KjaF
 d78GR+6SnLvl0/lTCHumxv7sTQ8Gpa6GB7pduG96FLjNZ9F9Aa8aF1t7195STn8u1E9qPJyYjcT
 wLYs314pacMLgvMtVVMtHV20taZAs+M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310032

On Thu, Oct 29, 2026 at 10:59:25PM +0530, Prasad Kumpatla wrote:
> > diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> > index 9aae6aadd43d..f5b147962afa 100644
> > --- a/sound/soc/qcom/sc8280xp.c
> > +++ b/sound/soc/qcom/sc8280xp.c
> > @@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> >   	channels->min = 2;
> >   	channels->max = 2;
> >   	switch (cpu_dai->id) {
> > +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> > +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12: {
> > +		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
> > +		unsigned int mask;
> > +
> > +		if (qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg))
> 
> 
> qcom_snd_get_dai_tdm_slots() errors are silently ignored here and the channel count falls back to 2.
> Could we distinguish the no-TDM-slot case from an actual parsing/configuration error?
> This would also make invalid TDM configurations easier to debug.


Good point, Prasad! I will send v3 for that.

Shawn
