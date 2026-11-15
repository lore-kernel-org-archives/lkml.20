Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794736583;
	b=KfJCB1e3NKTlZ5lvpN8IL4G6GoTzv/KX/DMaiXNP+aVMDzzGvziFV4m4dA6qD5U7BdsG
	 qzZLtjPIhMVzUNy74w4lUmt3HP1jdO6G44+dPFG2rS9skjP+K6fsdM7K4eEoHBTghJuMl
	 bCkjEvfKCH47rxr5MfNI6F1a3cEpLVNQZN6+WedZqZF8xWrsjB5QJw5aJnmSOfu+NXaMP
	 HXTderGyVgbMvJ0DYKTNJohtQYiTOGO4eMP21kqmaHrnhEdVA/Ih+qI1YYBwvCIoMyUDh
	 /5oD97070KRKopXb6m0yyZ3j/zDfBM9AYI0F7XAH3DHdg+SWaueBe4gay2PslOBsj6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736583;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CYguiHQQbL7nlCGNjEuWsnhSnp2jFi1ayNJhNVtpQ2A=;
	b=rqpa68Te1SWhEOPl9D8zHUBukNro6Dwxf187nSXZnRBQqkdvl52ZyNs9eIvbKlhfUvKL
	 0t4hXH1E90sbOKU+j/64h5TyyzItDgv5kndR1zEY7p77wHwvow1rYznp6vwqbJRJUC9FQ
	 zsEIFiPqRf5oIIN9jJw9t7y5/mlOx7l96jWFg6I5tGltSxUhSrehUFhvDsvr3Q81dBDcy
	 AxeBY51kUJgC+HYXWo7WTLgkxBftEizZ60IV/Pr44UOoatyyYzycwLRCaLAs+yxAHPLqw
	 JH3CFCQJknsf8zz45ZC0gOiHIrGxCYiXswTla+Lu9e4fen/x1fq1Lk1hOBtuiY2jKOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EL3h6ez9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E8MpiVCJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A6606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D9A6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EL3h6ez9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E8MpiVCJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7wQdJ2863581
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CYguiHQQbL7nlCGNjEuWsnhSnp2jFi1ayNJhNVtpQ2A=; b=EL3h6ez9A/Nyg5nC
	DcSANzEkvZkLjlHNB+vy5NxwrOY/iuv7Nat++Pl5nmxwYWDgePaxNC02OKFNvas2
	ZUDZ3SV8XO1ltwE49oHF8s/V11bfa4EMhlEao0b4nz0NtPKyuDiLb9EUjed1Ed5g
	zWw4YnqewvzcSf9EO0iJp1gWE65UOUFHlD/slzSrIPd2kAJ0G6Rt+INs1FABjX5q
	eS+JVWESPbARzR+wJ77xmCo6I9EIjES5YLL8iEH66dthJF5Xh33OBKErktGE79k5
	fd39JgxWxiNQOzAQjr2ZaggowQME+ujNlz7rnQ6FzEW/BJ9ELMY0hBblEW6wkUqb
	dB0Wwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmajnvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:56:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso203586985a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794736580; x=1795341380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYguiHQQbL7nlCGNjEuWsnhSnp2jFi1ayNJhNVtpQ2A=;
        b=E8MpiVCJXjSpN6QZP89fkLNpJ8vt7x/ToWGeSXwgguP75iA4Yw9FUqxKNlUk1yhDRH
         Z7ciZDBzII1U+67APlNzR3O1Whes8b7R+SJty8wnpWwu+NDw2zS9Y7KhgmOyK3lw/upL
         cHq32HHz+NpEZ/7Pt8IIyq6WuXPov4vwklz0JwIuzF1uRObSnZYd9ZLpHa/ppB0vCa9d
         sEVoNE4ZKEwO0SCPTMldBkGnZSIqYFKfvJagMEFhysV24TnupOqlnzit3majzOFVzilr
         3sHxfio1rN6Urzm7EKGsnfyyA7rmT4aYlY/I2X46r61A8ydklxFUWcgDuF+hvHnqgrSh
         Z6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736580; x=1795341380;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYguiHQQbL7nlCGNjEuWsnhSnp2jFi1ayNJhNVtpQ2A=;
        b=OaE7DMUwD8yhTSbXDP4Z20qZMBxaEdNc0lflcUv5rotvEjbKVPY7093sb/joHGAZ3z
         T6T3cZNX449SayFXr4mk2g/PBh/QZTPwb21GoKqRN7A9DD32C4MoL7aqljmH9SpbIXGR
         qza6ujaW2bFpX30Xr93INDDyLKR5N9iiy8EGwCBFtxPA6HrYHUrIlst4azjnbxcYEwtX
         DGIrhSJvsbz4aNJ6KET1rnQGZkGN/8GkzaFHYnb6+h14B+fCnTStudo2gCuD8Bar+MiB
         g/cMRFJuW8XvyhprxJOpLE5WvK5oUf/CPbUwOswJ+tOzIf61amjqyTtE2DXKd+n/vbSs
         YWiw==
X-Forwarded-Encrypted: i=1; AL+hErFYhB9ij5LMbvibT1rcGzkzxZ1+Ao3WCVyjBzC3qXC3NHTxlbEGBbHzwCKVbAiXoq6G9ZwfLIqkVHlkd8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qewEVTjbzy6U4t7TT6wSE/XFOzbpYHW/t+P7Uoo1ebQfm76Vg
	pVLdyHjct5To5klZrMWV8md/YMrJ9dz7MAsqQX02aFaOsBvHmxXvxsR74NvNhyhOQ2+yjX29y/c
	DQLwPWsFjJgvkAgFC8S16SBe3kg6frfTQ/pDQGz3QfY5t0j9olERAKoqPwxRadt2FYA0=
X-Gm-Gg: AYBFou1shTnrPbtBQjptpbkNEvLEnhMoLfCSQ7NjVAmnGMxOJhSJRwJYD69+keEAgRL
	w8Nc28Z5CyNc36LAoY3vTxGnMnK/OZwP4FZ4j7yG/BCAhg5wyVm3WEMJ0EOySrkEF/QA704zKih
	EyrFfK4pkExzbRtGNNVmoI7OMxJ7IdWrWLuIKEj0NNU40JL7hAKJ3hiUBak1uao3jro/MBmTtTZ
	YrtP8HsFMA1sWT0zetdSk6Nt5QnPv5xVjVuWvZiOel2AoZG7u/sz/J9224XfQE5Jfja7MdseNXE
	qypyC3uB+99O56qSTlr1ymcaDdeOG4prKczcEuDYzTNoZtwUF5FcENMjeVYbwPr2L8ubeuVkUZv
	QCfNgJatB8S3i41f8LXTxeIm1DrU/GpOrX2SfuIAUwA8IkeTT2ijQ0s2t51etN7tNJDQ9U9CAFm
	dnUegTf15RQhhafyclMg==
X-Received: by 2002:a05:620a:2903:b0:93c:a40d:e3cf with SMTP id af79cd13be357-9494b9c78a6mr1276204885a.1.1794736580196;
        Sun, 15 Nov 2026 01:56:20 -0800 (PST)
X-Received: by 2002:a05:620a:2903:b0:93c:a40d:e3cf with SMTP id af79cd13be357-9494b9c78a6mr1276203085a.1.1794736579716;
        Sun, 15 Nov 2026 01:56:19 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23dafbasm3186565a12.22.2026.11.15.01.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 01:56:17 -0800 (PST)
Message-ID: <c0a37fa2-902b-44c6-90bd-bbcce34a160b@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 09:56:16 +0000
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
Subject: Re: [PATCH 2/3] ASoC: qcom: q6dsp-lpass-clocks: Restore clocks after
 a DSP restart
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
 <20261115032027.414953-3-shengchao.guo@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261115032027.414953-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q6-MQWwk4wQjFbfoDMiCq9qCXr-lCDBe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAzOSBTYWx0ZWRfX6xIBR5RNOZCJ
 1zAKPIqCPAGBfOiPTq4jcGI+6qPdDH20DJ1KJuRNKhqGXxQzJGWlGlyepRAWGEmJhn/+cBfEln0
 DGfLfJn4jbAfVFcwbOCqlZAUSH8rb/wEB0SjGlEzfcZ/0VklXzT+YEIdCNO+2NcDaIYxTMjZepV
 FKxXoe7QEjYLRoeCsD9LzA6yzE2n0vd62Nodba+WCB268I1SA8Q88bngAgM+MaQIDLOZ08uRdq2
 VYjPW2ki94WTAbSsni6WFPii0G2j9cpxnYpujLD+QzfpRH/i+nUrreRa2wZmGBCCtqtx7bhf5BO
 cOkydDuBYBcEgkRbd1I3kSLBrWEJuBtL5dBy96BnouxoIqCOIoHuNvaxi3OfIJiKXaF8WeK6zWj
 pGNhdEbVJaa3ykoGHEk1d7ZUUqaTCcRDAaOPUjKrmCy2BsiDS6et7E9zgFClPHhMVIRRsrrZzYj
 moMFHQEA04Tj9toETTw==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af981c4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1HHStOHi6RfkYRcxXAUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Q6-MQWwk4wQjFbfoDMiCq9qCXr-lCDBe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAzOSBTYWx0ZWRfX2iZd1xoxQxgi
 59rW9uhi4AWBY+P8nlB1c6YSa1oVJUJ7zr8OFvwh4IQmtS4UxB1Iw2fiE1HDiqN5fmS+672XxbJ
 3FHPFy/IVFoXH9zxZgIFfgoex0DWo4Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150039

On 11/15/26 3:20 AM, Shawn Guo wrote:
> The DSP forgets all clock requests and votes when it stops. A consumer
> that still holds a clock prepared across a DSP restart then holds a
> clock that the DSP no longer provides, and its later unprepare releases
> a request the DSP never saw.
> 
> Track which clocks are prepared, and add q6dsp_clock_dsp_down() and
> q6dsp_clock_dsp_up() for the DSP service driver to call when the DSP
> goes away and comes back. dsp_down() marks the prepared clocks as lost.
> dsp_up() requests them again at their current rate, or votes for them
> again. Unpreparing a lost clock skips the release, since the DSP holds
> nothing for it.
> 
> Fold the prepare/unprepare ops of rate and vote clocks into one pair,
> so both kinds share the request/release helpers used by the restore
> path. A mutex serializes prepare/unprepare against dsp_down/up.
> 
> This patch does not change behaviour on its own: no driver calls the
> new functions yet.

Looks like you are hitting the devlink issue that decides to create
provider link between remoteproc to clk consumer instead of prm clk
controller to clk consumer.

Devlink somehow uses parent as provider if the actual provider(prm) is
not probed yet. This results in incorrect teardown of consumers.
This is one of the corner case that devlink does not handle correctly.

--srini


> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 147 ++++++++++++++++++----
>  sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h |   2 +
>  2 files changed, 123 insertions(+), 26 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> index 94d96130245e..22d3f3c6d46f 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/device.h>
>  #include <linux/platform_device.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/slab.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> @@ -22,6 +23,10 @@ struct q6dsp_clk {
>  	int attributes;
>  	int rate;
>  	uint32_t handle;
> +	bool vote;
> +	bool prepared;
> +	/* Still prepared, but dropped by the DSP when it stopped */
> +	bool lost;
>  	struct clk_hw hw;
>  };
>  
> @@ -29,17 +34,45 @@ struct q6dsp_clk {
>  
>  struct q6dsp_cc {
>  	struct device *dev;
> +	/* Serializes clock requests against DSP down/up */
> +	struct mutex lock;
>  	struct q6dsp_clk *clks[Q6DSP_MAX_CLK_ID];
>  	const struct q6dsp_clk_desc *desc;
>  };
>  
> +static int q6dsp_clk_request(struct q6dsp_cc *cc, struct q6dsp_clk *clk)
> +{
> +	if (clk->vote)
> +		return cc->desc->lpass_vote_clk(clk->dev, clk->q6dsp_clk_id,
> +						clk_hw_get_name(&clk->hw),
> +						&clk->handle);
> +
> +	return cc->desc->lpass_set_clk(clk->dev, clk->q6dsp_clk_id, clk->attributes,
> +				       Q6DSP_LPASS_CLK_ROOT_DEFAULT, clk->rate);
> +}
> +
> +static void q6dsp_clk_release(struct q6dsp_cc *cc, struct q6dsp_clk *clk)
> +{
> +	if (clk->vote)
> +		cc->desc->lpass_unvote_clk(clk->dev, clk->q6dsp_clk_id, clk->handle);
> +	else
> +		cc->desc->lpass_set_clk(clk->dev, clk->q6dsp_clk_id, clk->attributes,
> +					Q6DSP_LPASS_CLK_ROOT_DEFAULT, 0);
> +}
> +
>  static int clk_q6dsp_prepare(struct clk_hw *hw)
>  {
>  	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
>  	struct q6dsp_cc *cc = dev_get_drvdata(clk->dev);
> +	int ret;
>  
> -	return cc->desc->lpass_set_clk(clk->dev, clk->q6dsp_clk_id, clk->attributes,
> -				     Q6DSP_LPASS_CLK_ROOT_DEFAULT, clk->rate);
> +	guard(mutex)(&cc->lock);
> +
> +	ret = q6dsp_clk_request(cc, clk);
> +	if (!ret)
> +		clk->prepared = true;
> +
> +	return ret;
>  }
>  
>  static void clk_q6dsp_unprepare(struct clk_hw *hw)
> @@ -47,8 +80,14 @@ static void clk_q6dsp_unprepare(struct clk_hw *hw)
>  	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
>  	struct q6dsp_cc *cc = dev_get_drvdata(clk->dev);
>  
> -	cc->desc->lpass_set_clk(clk->dev, clk->q6dsp_clk_id, clk->attributes,
> -			      Q6DSP_LPASS_CLK_ROOT_DEFAULT, 0);
> +	guard(mutex)(&cc->lock);
> +
> +	/* A lost clock is not held by the DSP, so there is nothing to release */
> +	if (!clk->lost)
> +		q6dsp_clk_release(cc, clk);
> +
> +	clk->prepared = false;
> +	clk->lost = false;
>  }
>  
>  static int clk_q6dsp_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -83,26 +122,9 @@ static const struct clk_ops clk_q6dsp_ops = {
>  	.recalc_rate	= clk_q6dsp_recalc_rate,
>  };
>  
> -static int clk_vote_q6dsp_block(struct clk_hw *hw)
> -{
> -	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
> -	struct q6dsp_cc *cc = dev_get_drvdata(clk->dev);
> -
> -	return cc->desc->lpass_vote_clk(clk->dev, clk->q6dsp_clk_id,
> -				  clk_hw_get_name(&clk->hw), &clk->handle);
> -}
> -
> -static void clk_unvote_q6dsp_block(struct clk_hw *hw)
> -{
> -	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
> -	struct q6dsp_cc *cc = dev_get_drvdata(clk->dev);
> -
> -	cc->desc->lpass_unvote_clk(clk->dev, clk->q6dsp_clk_id, clk->handle);
> -}
> -
>  static const struct clk_ops clk_vote_q6dsp_ops = {
> -	.prepare	= clk_vote_q6dsp_block,
> -	.unprepare	= clk_unvote_q6dsp_block,
> +	.prepare	= clk_q6dsp_prepare,
> +	.unprepare	= clk_q6dsp_unprepare,
>  };
>  
>  
> @@ -146,6 +168,10 @@ int q6dsp_clock_dev_probe(struct platform_device *pdev)
>  	cc->dev = dev;
>  	q6dsp_clks = desc->clks;
>  
> +	ret = devm_mutex_init(dev, &cc->lock);
> +	if (ret)
> +		return ret;
> +
>  	for (i = 0; i < desc->num_clks; i++) {
>  		unsigned int id = q6dsp_clks[i].clk_id;
>  		struct clk_init_data init = {
> @@ -160,12 +186,13 @@ int q6dsp_clock_dev_probe(struct platform_device *pdev)
>  		clk->dev = dev;
>  		clk->q6dsp_clk_id = q6dsp_clks[i].q6dsp_clk_id;
>  		clk->rate = q6dsp_clks[i].rate;
> +		clk->vote = !clk->rate;
>  		clk->hw.init = &init;
>  
> -		if (clk->rate)
> -			init.ops = &clk_q6dsp_ops;
> -		else
> +		if (clk->vote)
>  			init.ops = &clk_vote_q6dsp_ops;
> +		else
> +			init.ops = &clk_q6dsp_ops;
>  
>  		cc->clks[id] = clk;
>  
> @@ -183,3 +210,71 @@ int q6dsp_clock_dev_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(q6dsp_clock_dev_probe);
> +
> +/**
> + * q6dsp_clock_dsp_down() - Mark the clocks dropped by a stopped DSP
> + * @dev: clock controller device
> + *
> + * The DSP forgets all clock requests when it stops. Remember the clocks that
> + * consumers still hold prepared, so q6dsp_clock_dsp_up() can request them
> + * again once the DSP is back.
> + */
> +void q6dsp_clock_dsp_down(struct device *dev)
> +{
> +	struct q6dsp_cc *cc;
> +	int i;
> +
> +	guard(device)(dev);
> +
> +	cc = dev_get_drvdata(dev);
> +	if (!cc)
> +		return;
> +
> +	guard(mutex)(&cc->lock);
> +
> +	for (i = 0; i < Q6DSP_MAX_CLK_ID; i++) {
> +		struct q6dsp_clk *clk = cc->clks[i];
> +
> +		if (clk && clk->prepared)
> +			clk->lost = true;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(q6dsp_clock_dsp_down);
> +
> +/**
> + * q6dsp_clock_dsp_up() - Restore the clocks dropped by a stopped DSP
> + * @dev: clock controller device
> + *
> + * Request again, at their current rate, the clocks that were still prepared
> + * when the DSP stopped.
> + */
> +void q6dsp_clock_dsp_up(struct device *dev)
> +{
> +	struct q6dsp_cc *cc;
> +	int i, ret;
> +
> +	guard(device)(dev);
> +
> +	cc = dev_get_drvdata(dev);
> +	if (!cc)
> +		return;
> +
> +	guard(mutex)(&cc->lock);
> +
> +	for (i = 0; i < Q6DSP_MAX_CLK_ID; i++) {
> +		struct q6dsp_clk *clk = cc->clks[i];
> +
> +		if (!clk || !clk->lost)
> +			continue;
> +
> +		ret = q6dsp_clk_request(cc, clk);
> +		if (ret) {
> +			dev_err(dev, "Failed to restore %s: %d\n",
> +				clk_hw_get_name(&clk->hw), ret);
> +			continue;
> +		}
> +
> +		clk->lost = false;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(q6dsp_clock_dsp_up);
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h
> index 3770d81f2bd6..e4655a0b77c6 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h
> @@ -26,5 +26,7 @@ struct q6dsp_clk_desc {
>  };
>  
>  int q6dsp_clock_dev_probe(struct platform_device *pdev);
> +void q6dsp_clock_dsp_down(struct device *dev);
> +void q6dsp_clock_dsp_up(struct device *dev);
>  
>  #endif  /* __Q6DSP_AUDIO_CLOCKS_H__ */

