Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794297599;
	b=4F2foHe9eF9ui/xbUfMemAV/mb5i6kG9ynCzYqdBQCgNiP4rkYM+1s4wgsQgR5nPGtYm
	 +usiicWULKMKSRT5djc2j/wx0hDSc65xEejQv1Obrr18Pj9PY/QHz0Mx8eAmYeoO+dlp9
	 pre/iaq/FtwcLcXLK11ZvNJAv0TNtnvyUnS61JQVkdVVFPsisibGFnDa/6jY/e4cbgbFF
	 krEuoFqgrwirUllJVk1p0A4rx9rciOWtcafWxGw1jVxgr3RgBYO+hshuMrGByurJxQnK/
	 SGYXXWmY+6GftYLEtuHM3VALelPtKnG+Fn5q79ya/o14xoLmx9HEPH5HZUPw0WKknCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297599;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1q8KZvUyx0wMnb01QCxwvBMDQ/z9mBvAgyaDAz8CIyA=;
	b=wP9Oq4ZeWFN5qnnELUmpM2xZKJ5ggn+5QVb8P9Xa3XCh5vSqgsjP7wNb2/VkbCVdj99B
	 dlMeRKbNOgA6OffY0EZHVgEH1LS9y/B+rA6jU5O2Lf7K3udp8BSVTPq/MHdHlE25YPh4u
	 YmiR3f3xOFotpoqNZKbQ1n3vvE0nGv86+xAqGGpcEtJg6mvJyKhRJhdJqQRN5ikJK9yJq
	 fIyRAAwxqfDAGVJfuA32TDvo2Dc9BhtX5oaCNHuC+uStDEBxhK0MISqxcTWFDBE00tQS4
	 ce10U1WwIkVu1v0jFD7iUpfk0OkUrSI8sjrYqU1yVswRC+QFVhcyPnRsP7qTIbAMzJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SbNq20tY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ggtl5LDj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57A3606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B57A3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SbNq20tY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ggtl5LDj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7kpPi3742705
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1q8KZvUyx0wMnb01QCxwvBMDQ/z9mBvAgyaDAz8CIyA=; b=SbNq20tYV34HB8fk
	LeAvcdMKNK+XYVVRzGAAGo4h9dAxGrA9qYEheoUoOBqrjM37LAk5BvnMsZFPfqm+
	wkiwS1dTcWO/dRgDlG/B7u8iTUCWEw6ZeMnXLr9kOkZZ0yp1A9oLKRJwm7wPnZQJ
	RN/NVpvOtgrlaxOU7tOgBc18wPU72teAZqLflZ7n1a3ALmUgYtcSzn5n/hFZ1AwR
	DiCigAcr5aw5Bjy6KmkH+wAWMioRmjjPtgb/Os6r6VPOp5XRtJyTBog4EHUL3CI8
	1fCdLjL98lVR+luQFY2BO8zXMSVfN3MxGJDSiXSXjxcqtgoA0R5l70Y0vGCL2n1B
	l/rP/A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qv2nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:59:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so1658689a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:59:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794297597; cv=none;
        d=google.com; s=arc-20260327;
        b=D0H1Pr2qTo3P/7VaeZ0wPP9QfZlsLY4p3YwrbtLctsSUHtKzB3WRwsoV7keFX5uw8/
         Z7o3tN6aJaXWjU/yOfj7sbTrakx2TI1FS6y5xJxC4S+kzOL56uG0t14U6GrCYBuxwq1q
         WuMl2IjjqaswLkvmAsrNLpr0/E6WVEVcFMxYaG+H+PqjeH8A1IooCpZGvgI84lyWpUHS
         pGJCIzwViHe9E1owcxaALcbZwvs2yItI7SkPae0lMLLMzi+KHBKTvps5CONVKpurcIBp
         1juYrthOXJ0HY99Q0V0vtSwHnlO5X4p7G0iOmrgj6XoPEHjdexB0HxACk123WHlqkLQb
         c94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1q8KZvUyx0wMnb01QCxwvBMDQ/z9mBvAgyaDAz8CIyA=;
        fh=T+2NAAqoe38w7mJsP6f2GxS2ojkWIC2EcOSbnYSvSdQ=;
        b=HYJOHYN8ZeoksiL+VADlKK/xaIf9PiZaBu3kflNmobu2eU67mwTBQFav1fXSCWGQh+
         sZ4zzy4CNuFTmX4ShpfAg/sr+dX1lZWJuAuNXdwEcpspj014XydfLTQ0iTIYJDV9GMLE
         cR4mj8PwJH3gWCpfy7A7Mnc5vwUSeSqMufp156p13FnHJIRHD0GaxzT6UFhKjE3GPEhO
         RPPE+aS4qQXHSRQCt4YOCoTAnkLwqMsrEE4kKAnDyErV+xwynV/aVsIg9iRdt+f9Yy2N
         J30ZiK51m4SBtmqOCdLogrTADUfk//4zfL4V2PLPx8Fd9T2YXPf4WDCSu8AqWVAPgSyX
         H34Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794297597; x=1794902397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1q8KZvUyx0wMnb01QCxwvBMDQ/z9mBvAgyaDAz8CIyA=;
        b=Ggtl5LDjbCamzGWPitlbpMhTKwtDu78N/9WUpW873qVAViJcPsp3a/i/dKbz0TKaYG
         lbPZoTbHObJSX1WiU04nn0Js2PuBkVuyifuZgS9ram7sgPEsNf8nh0Arji92ofrBczxF
         I0Ct7gWJWIXCnNgfBl80+CI6zFIn5+SJoYbTLGO3LHHyYVT/LS8iXA1Okq7LtcBvpmuL
         eynb065L69FkfTxx9ZPrK5VGpaVQlmX4TdRmuSasDxL2nm9FYU+hN5b7/878gyPxdGO8
         WgUcIykYhC/LwtLdl3JKVDRvWQEIgX6zt8WAZAOhESvR2yo6Hu+bPExNIT6tQc6Hxn8u
         knhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297597; x=1794902397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1q8KZvUyx0wMnb01QCxwvBMDQ/z9mBvAgyaDAz8CIyA=;
        b=EU8G8aeyv9aMySF5i7QgwEfNBqn2QRiiKBm1rVvAuBUj7YBASaw+WwsxV4RSFPgGfb
         lt0+61GXvRsd9bbuo4bHGBewVt8gvjhG1sBQW4BuQYf3O9Wej/ve9u558ogtu2mONsza
         MyBzMuF2aCuc0m/w9hT3WwxFgMLuA15Ds/O9lVaxilbmBcAnZzsiK4VRkevoL9fZYL/g
         0r3hIyxqdsDDjP/RsJg5vbaq89JzgqGp/7jMtU494T95ShycwaRmmH5972kPnR3qZL/5
         NZzFnA4F8zhcqMX2CFwMRdt0vGVkgCAq/thoWU0vfrcZxNqUD/4cYZbM3M77wpAf9Sn0
         tNnA==
X-Forwarded-Encrypted: i=1; AL+hErEDCk5XjSRPO57xnJd0p6LHcVNur3U+dZHPlGgLB0YJnlWzs+I6YigKoZNOd4CasERTnBLBAT3yzuximPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vzqu/rQDlTE0cGfhkL0H06Fcw4asaRDvi59fF0sl5mTSoIxRi
	jpAK4kJPzgg/kHtfnUFPNBkqA8LeXjM25vL2A40qmjsRC1WLKisz8Tt8kvQ0iRE1H3Psjln3TN+
	7frLEuWxXVk11nTAxu1n2bv4Ur1XKo/VNDorzEZjnYkWhkU+El2vzCLOLzeoeRJh75RFInC6N3K
	GlhBzCqzS+cHl4JS30g/0KLolM4PsR/WHRP8UiJbHW1Q==
X-Gm-Gg: AYBFou010a2Y0uubzU5dJ1uQgE8BTeSgQmBcffknFTbFpkZYqBENZftBPhDNojx0iO3
	yMNnAs5qA1OXLKQgCEYMTaZkukrjD9EGRO9V6S1eP6vYJA+pKRnMkCvrW+P0gnZjXbwaAQ9nkxZ
	l8ZhNuoU3e/COsyWYaU0k+CxbDaYxin3oNVVkLfQcbT7eDdQ8DecJ1iofwCg==
X-Received: by 2002:a17:90a:e7c9:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b166d19fdemr2096693a91.42.1794297597114;
        Mon, 09 Nov 2026 23:59:57 -0800 (PST)
X-Received: by 2002:a17:90a:e7c9:b0:3ab:e588:c295 with SMTP id
 98e67ed59e1d1-3b166d19fdemr2096684a91.42.1794297596521; Mon, 09 Nov 2026
 23:59:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com> <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
In-Reply-To: <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:59:44 +0800
X-Gm-Features: AclHuK-Wh_FoCrAkjmR8o4Q6NvapBEp6E63cXzxrhVdtr2TiW8KWZ0PyAbif3g8
Message-ID: <CAFkd8hvXor7A5zaRtH5iQm6NsphzsxrjbADcRwedsONo=6J2gA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: qcom: audioreach: support multichannel PCM formats
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX4G4GflWk4FrD
 7CoaaR9FdQ6GbLUxzxSHFo+hjqj/1eMIKB4D4QkIInmbHTkP8fNU6T4x8xhsjFUec+Unjjs2nkx
 ZyHIzC6gdgdnzvmVtDQ6ALKnrD9zeFQUJudnSBGB9J2zN8gkKijcnO0l5m5/p96jV6emq0b72SF
 R7P3HhPu7pzSqLsWPjWSeIqpK5DbPrYw6bbVSd8iM5deeuN+5ujYoWqa5P/+0pINNp7No/g/mx/
 1b5o2PKwmh7xb73Q8mkokKPqdjx4IuimP9a52e7wy4m3R8V39dG58PMlPuII4O63ZHbexSo6LNO
 jK/00LHFYErytFP2bWabVIp/o5dSFVV4r/ebLoE1Tvv/FNGwPizutPT/w0rWUZnA+JzltynwyVZ
 dw+pSbmsrvkbQTu8BV5ZyQKG5J7Mx7h8sxKjRrooaRtoidYI6agduj0Mo3bhD2cGBqX210UtRBC
 MdDMOjXl2jl+wo+BSSQ==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af2cefd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=-pBZ-5fkuRBhhW-rZE8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: NkIjAevtonMrh2FhbkI98ETDHJ6BTzKY
X-Proofpoint-ORIG-GUID: NkIjAevtonMrh2FhbkI98ETDHJ6BTzKY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX0ljG9nYiJPZ4
 42+CbZuMvPjjH4s3Tnmy8zCSzsv4kAQGf3y6GNHgOIcBqkehZA9fynFPLp+1Ycfk9XqtuAa9U7I
 LYHfsUtFSTDDCphnoDoeLlLhPLXGzT8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100031

On Wed, Oct 28, 2026 at 10:47=E2=80=AFAM Zhangfei Gao
<zhangfei.gao@oss.qualcomm.com> wrote:
>
> AudioReach currently rejects PCM streams with more than four channels in
> the PCM and shared-memory media format paths.
>
> This prevents TDM links that expose more channels, such as the 6-channel
> playback path used on SA8797P Ride, from being configured.
>
> Reuse q6dsp_map_channels() to support multichannel PCM formats and use
> the common PCM channel limit definition.
>
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>
> v3: reuse PCM_MAX_NUM_CHANNEL to replace AR_PCM_MAX_NUM_CHANNEL (Srinivas=
)
> v2: reuse q6dsp_map_channels
>
>  sound/soc/qcom/qdsp6/audioreach.c       | 36 ++++---------------------
>  sound/soc/qcom/qdsp6/audioreach.h       |  5 ++--
>  sound/soc/qcom/qdsp6/q6apm-dai.c        | 12 ++++++---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 11 +++++---
>  4 files changed, 24 insertions(+), 40 deletions(-)
>
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index d2dc5d37bccf..e6f077a5b750 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -306,22 +306,6 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uin=
t32_t opcode, uint32_t token
>  }
>  EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
>
> -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels=
)
> -{
> -       if (num_channels =3D=3D 1) {
> -               ch_map[0] =3D  PCM_CHANNEL_FL;
> -       } else if (num_channels =3D=3D 2) {
> -               ch_map[0] =3D  PCM_CHANNEL_FL;
> -               ch_map[1] =3D  PCM_CHANNEL_FR;
> -       } else if (num_channels =3D=3D 4) {
> -               ch_map[0] =3D  PCM_CHANNEL_FL;
> -               ch_map[1] =3D  PCM_CHANNEL_FR;
> -               ch_map[2] =3D  PCM_CHANNEL_LS;
> -               ch_map[3] =3D  PCM_CHANNEL_RS;
> -       }
> -}
> -EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
> -
>  static void apm_populate_container_config(struct apm_container_obj *cfg,
>                                           const struct audioreach_contain=
er *cont)
>  {
> @@ -760,7 +744,7 @@ static int audioreach_codec_dma_set_media_format(stru=
ct q6apm_graph *graph,
>         intf_cfg->cfg.intf_index =3D module->hw_interface_idx;
>         intf_cfg->cfg.active_channels_mask =3D 0;
>         /* Convert the physical channel mapping into a bit field */
> -       for (i =3D 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
> +       for (i =3D 0; i < PCM_MAX_NUM_CHANNEL; i++)
>                 if (cfg->channel_map[i])
>                         intf_cfg->cfg.active_channels_mask |=3D BIT(i);
>
> @@ -883,7 +867,7 @@ static int audioreach_mfc_set_media_format(struct q6a=
pm_graph *graph,
>         media_format->bit_width =3D cfg->bit_width;
>         media_format->num_channels =3D cfg->num_channels;
>         /* Convert the physical mapping to a logical mapping of the chann=
els */
> -       for (i =3D 0, j =3D 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num=
_channels; i++) {
> +       for (i =3D 0, j =3D 0; i < PCM_MAX_NUM_CHANNEL && j < cfg->num_ch=
annels; i++) {
>                 if (!cfg->channel_map[i])
>                         continue;
>                 media_format->channel_mapping[j++] =3D cfg->channel_map[i=
];
> @@ -1185,11 +1169,6 @@ static int audioreach_pcm_set_media_format(struct =
q6apm_graph *graph,
>         int payload_size;
>         int i, j;
>
> -       if (num_channels > 4) {
> -               dev_err(graph->dev, "Error: Invalid channels (%d)!\n", nu=
m_channels);
> -               return -EINVAL;
> -       }
> -
>         payload_size =3D APM_PCM_MODULE_FMT_CMD_PSIZE(num_channels);
>
>         struct gpr_pkt *pkt __free(kfree) =3D
> @@ -1218,7 +1197,7 @@ static int audioreach_pcm_set_media_format(struct q=
6apm_graph *graph,
>         media_cfg->q_factor =3D mcfg->bit_width - 1;
>         media_cfg->bits_per_sample =3D mcfg->bit_width;
>         /* Convert the physical mapping to a logical mapping of the chann=
els */
> -       for (i =3D 0, j =3D 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->nu=
m_channels; i++) {
> +       for (i =3D 0, j =3D 0; i < PCM_MAX_NUM_CHANNEL && j < mcfg->num_c=
hannels; i++) {
>                 if (!mcfg->channel_map[i])
>                         continue;
>                 media_cfg->channel_mapping[j++] =3D mcfg->channel_map[i];
> @@ -1275,11 +1254,6 @@ static int audioreach_shmem_set_media_format(struc=
t q6apm_graph *graph,
>         int i, j;
>         void *p;
>
> -       if (num_channels > 4) {
> -               dev_err(graph->dev, "Error: Invalid channels (%d)!\n", nu=
m_channels);
> -               return -EINVAL;
> -       }
> -
>         payload_size =3D APM_SHMEM_FMT_CFG_PSIZE(num_channels) + APM_MODU=
LE_PARAM_DATA_SIZE;
>
>         struct gpr_pkt *pkt __free(kfree) =3D
> @@ -1313,7 +1287,7 @@ static int audioreach_shmem_set_media_format(struct=
 q6apm_graph *graph,
>                 cfg->endianness =3D PCM_LITTLE_ENDIAN;
>                 cfg->num_channels =3D mcfg->num_channels;
>                 /* Convert the physical mapping to a logical mapping of t=
he channels */
> -               for (i =3D 0, j =3D 0; i < AR_PCM_MAX_NUM_CHANNEL && j < =
cfg->num_channels; i++) {
> +               for (i =3D 0, j =3D 0; i < PCM_MAX_NUM_CHANNEL && j < cfg=
->num_channels; i++) {
>                         if (!mcfg->channel_map[i])
>                                 continue;
>                         cfg->channel_mapping[j++] =3D mcfg->channel_map[i=
];
> @@ -1436,7 +1410,7 @@ static int audioreach_speaker_protection_vi(struct =
q6apm_graph *graph,
>
>         cm_cfg->cfg.num_channels =3D num_channels * 2;
>         /* Convert the physical mapping to a logical mapping of the chann=
els */
> -       for (i =3D 0, j =3D 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_chan=
nels; i++) {
> +       for (i =3D 0, j =3D 0; i < PCM_MAX_NUM_CHANNEL && j < num_channel=
s; i++) {
>                 if (!mcfg->channel_map[i])
>                         continue;
>                 /*
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/aud=
ioreach.h
> index 587f14ce71d2..9f4166ebdc10 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -6,6 +6,7 @@
>  #include <linux/soc/qcom/apr.h>
>  #include <uapi/sound/snd_ar_tokens.h>
>  #include <sound/soc.h>
> +#include "q6dsp-common.h"
>  struct q6apm;
>  struct q6apm_graph;
>
> @@ -805,7 +806,6 @@ struct param_id_hw_ep_power_mode_cfg {
>  #define PARAM_ID_HW_EP_DMA_DATA_ALIGN  0x08001233
>  #define AR_HW_EP_DMA_DATA_ALIGN_MSB    0
>  #define AR_HW_EP_DMA_DATA_ALIGN_LSB    1
> -#define AR_PCM_MAX_NUM_CHANNEL         8
>
>  struct param_id_hw_ep_dma_data_align {
>         uint32_t dma_data_align;
> @@ -998,7 +998,7 @@ struct audioreach_module_config {
>         u16     nslots_per_frame;
>         u16     slot_width;
>         struct snd_codec codec;
> -       u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
> +       u8 channel_map[PCM_MAX_NUM_CHANNEL];
>  };
>
>  /* Packet Allocation routines */
> @@ -1009,7 +1009,6 @@ static inline u16 audioreach_gpr_dest_domain(gpr_de=
vice_t *gdev)
>
>  void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode,
>                                    uint32_t token);
> -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels=
);
>  void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
>                                uint32_t token, uint32_t src_port,
>                                uint32_t dest_port);
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6ap=
m-dai.c
> index 58beaf906b9f..83594b693569 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -21,6 +21,7 @@
>  #include <asm/div64.h>
>  #include <asm/dma.h>
>  #include "q6apm.h"
> +#include "q6dsp-common.h"
>
>  #define DRV_NAME "q6apm-dai"
>  #define POS_BUFFER_BYTES       4096
> @@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_componen=
t *component,
>         cfg.num_channels =3D runtime->channels;
>         cfg.bit_width =3D prtd->bits_per_sample;
>         cfg.fmt =3D SND_AUDIOCODEC_PCM;
> -       audioreach_set_default_channel_mapping(cfg.channel_map, runtime->=
channels);
> +       ret =3D q6dsp_map_channels(cfg.channel_map, runtime->channels);
> +       if (ret)
> +               return ret;
> +
>         if (prtd->state) {
>                 /* clear the previous setup if any  */
>                 q6apm_graph_stop(prtd->graph);
> @@ -1007,8 +1011,10 @@ static int q6apm_dai_compr_set_params(struct snd_s=
oc_component *component,
>                 cfg.num_channels =3D 2;
>                 cfg.bit_width =3D prtd->bits_per_sample;
>                 cfg.fmt =3D codec->id;
> -               audioreach_set_default_channel_mapping(cfg.channel_map,
> -                                                      cfg.num_channels);
> +               ret =3D q6dsp_map_channels(cfg.channel_map, cfg.num_chann=
els);
> +               if (ret)
> +                       return ret;
> +
>                 memcpy(&cfg.codec, codec, sizeof(*codec));
>
>                 ret =3D q6apm_graph_media_format_shmem(prtd->graph, &cfg)=
;
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qds=
p6/q6apm-lpass-dais.c
> index 83f2711bceea..9a3994a4f475 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -94,7 +94,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *da=
i,
>                         return -EINVAL;
>                 }
>
> -               if (tx_num > AR_PCM_MAX_NUM_CHANNEL) {
> +               if (tx_num > PCM_MAX_NUM_CHANNEL) {
>                         dev_err(dai->dev, "invalid tx num %d\n",
>                                 tx_num);
>                         return -EINVAL;
> @@ -147,7 +147,9 @@ static int q6hdmi_hw_params(struct snd_pcm_substream =
*substream,
>         cfg->bit_width =3D params_width(params);
>         cfg->sample_rate =3D params_rate(params);
>         cfg->num_channels =3D channels;
> -       audioreach_set_default_channel_mapping(cfg->channel_map, channels=
);
> +       ret =3D q6dsp_map_channels(cfg->channel_map, channels);
> +       if (ret)
> +               return ret;
>
>         switch (dai->id) {
>         case DISPLAY_PORT_RX_0:
> @@ -173,11 +175,14 @@ static int q6dma_hw_params(struct snd_pcm_substream=
 *substream,
>         struct q6apm_lpass_dai_data *dai_data =3D dev_get_drvdata(dai->de=
v);
>         struct audioreach_module_config *cfg =3D &dai_data->module_config=
[dai->id];
>         int channels =3D hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_C=
HANNELS)->max;
> +       int ret;
>
>         cfg->bit_width =3D params_width(params);
>         cfg->sample_rate =3D params_rate(params);
>         cfg->num_channels =3D channels;
> -       audioreach_set_default_channel_mapping(cfg->channel_map, channels=
);
> +       ret =3D q6dsp_map_channels(cfg->channel_map, channels);
> +       if (ret)
> +               return ret;
>
>         return 0;
>  }
> --
> 2.43.0
>

Hi, Mark

Any comments of this patch?

Thanks
