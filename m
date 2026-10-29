Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793239989;
	b=aAcrj6pv1t3EAu5gdYwdXArEzu1P/eyaMFBFCWsBqcLQU/A1hm79uQ11UqyCYUrKU/q5
	 EvKF76KyLnKLyffyEVrPmCfzelxH20Y2ElNNWr5CzXXRARGje+vTtRKOSSXDQv+2xLJth
	 He+Vh+LETc8SsFVhA02NUeBNwxYvDq4prI0ZUsu0t+4RvBtmJgPf2TTI0PMrKursb5eLn
	 HBYRTao+ZFCvE2UxB/uc4x3JQ0jU9IT8TD9aoIeIWmv8NP+mgOEgty+nRLeUfCENXyuDf
	 hpopRSgemn6nlvAaBnwtG8DjSvFnp1RYMdU/cBuYIKLM/sILPYMeXMf604lA076BQkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793239989;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1ZfFpRYMJHgMnVimUEMcJlJtQnxuiTy6BkExQhm9AuQ=;
	b=XA88g+BdnNVRnykTuohvJXmqwXTbN5nrTJ2+UivBI8axBFFyP8wRt+LXxqZ+0KudiDj0
	 6cD8hdSrgd28beMFTGox+bflRDH2YjwQh3aMF63Klz6JZ5vGF03iED4PFme3Leq0WKjY0
	 xSK5pMtFVxZBbdRM14PrF2/NHdAETEYUFElx3Gm9PjXyrdua43S/Ac8UUHkb8j7d+wDMk
	 BUQZzEZb3JhNWteWegiFMnoLA1T9J/gXA4Qb5YGF4k0tzZVG0euSRVwnyHSGOyXf+ooHI
	 kJqWHSiO7BPuO1AbEy3abuM14VQjKzScruEd8FV6RfOSxpf8ma2NjQUxls/SfSsYN3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cDXds+7i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8TmTAHl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C12606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C12606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cDXds+7i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8TmTAHl
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jltX3920605
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1ZfFpRYMJHgMnVimUEMcJlJt
	QnxuiTy6BkExQhm9AuQ=; b=cDXds+7iozhUR4Ua0TOXiN3UTA8EK9QM+3Ae9/58
	ksCucRQHnTmxliv1ul+ha0ZiHzDv/dCcT8ljG8I9CFytsChebO2yUcs5k24YXr1D
	DlIpYezqnz9ePwvOLnZ41kqTEQkkPsdBuE1R3qfgZjIeMtx1DF/9F2e57wtJf+W0
	F6xKne7+L8UGIKZZypSryhGztJtKrkMXORZXpoZyCz+GGW4Uw+5pEsFpj1avu4Mn
	af3fLEaXVw3Y04G6zroVLszc3u+BCzgsAGL2s8LUgomP/7owVmI8zaFqvD7aRgXD
	AGEIngRTQe/ppdAW4B3bbnO3PNgMuVyKi+AJSOus2mX1Sg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehtf96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:13:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3692c5b061bso4520439eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793239987; x=1793844787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ZfFpRYMJHgMnVimUEMcJlJtQnxuiTy6BkExQhm9AuQ=;
        b=g8TmTAHl1SVRgfF9HPjSDobpUPo2IL1cPZLKaWiwGMEJdU5zPpnduI0kTrEGBip516
         u211JIx7SZTnzL6BTK9yvTsocTYmZ//Z5d/8746ByX98/ZqrH40D/egV1RTaJ+LN6cy+
         jevll/+NiOJQAYPJ2XCnLrwkZnHd+I/Rm1MQxw2oMmMbDXUb/A27uDMvUEfoTkDyBG4s
         KW/ly5sFSy69ZW9aS5KMgJ6l0VPjQnhniPqgxAxAcZrK4DZUNffYPee9QCrtnkLyIcYz
         mFwU+NGfkD7G3tCIWuJoVN7MLiq1sRP5mAKDARGEGddAhx6XpuK1ztepYQ51R/1+4zyF
         D1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793239987; x=1793844787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZfFpRYMJHgMnVimUEMcJlJtQnxuiTy6BkExQhm9AuQ=;
        b=b+ykepHhpFFdpeJX0unq6J+w1C5ZtXzqrqyuKTYADY6H2qrxARM9jpcM2YF561SWsB
         JF27a0q25sTP7OUyslyOWoLAc8S2boX8QJE0FHv28Ib9/klnZS65cFhzyrPXT0wlKEKD
         uNJfjPKS6CZYVYv655kREXqb4gdDEgHciGEWIZWOqWR4llazi0XAB9nnohDrywOniHun
         1e/jzVLon3shMPUE50rPC1maKaZzk7ehS4oZVREl1q0N8hIgZX5wz5N1MdZtjdO+qtdl
         B5KKGL3MfAbvzE7lIOPGMjzrAkbUeyYKLaaYgOhoQcyBbsPW+iXaeFQXoa7zZpwN1pWa
         JDZw==
X-Forwarded-Encrypted: i=1; AKwUvBx16hFKwxkWR8OmDmTlwRHbQ7cmHvZJk1OANE+BIq8c8Qbls1n9AGfaWwLpYDVhZLuGLO2siKaUVNKBHfk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE6+UzuFWR7BihVnN0o1OmWu3k3qrDE6rk3YBy9n1P+iyxktRa
	qNO0JA7FXXYXoHW9Iw4BOJoeFP0fLquR61muS9o4LSd389yskzA1LHjuP9A0RueVvCUimAxVdsc
	902V9ztphi4BCXRc2m4/8kkTXI8TYdLgFO/jvtNxbF16lq8tQS88G7mR6mywX8e6Ml5sclV71ia
	pVKQ==
X-Gm-Gg: AYBFou2MXfsPB+hZ+UaNsd2a22S4zhGkpaJV+BO+7QzQPs2TDsQ9F2/TgkY9KqzKJkL
	H9A9xqJGMjOLz0sa6wXzjmp56DCz+72aY5wUq6lxHtngNHCgVdS0rfSI7nXQS9I13FZk9dJE5vp
	wxVPgt1UWf6b2eHZ9FmHkkSa0VCtckJVC1oY4G5RjbTiOOBShYB5vD9q/AqyocWIZ3YxLHhtwiI
	ccvQSm01M0vDQUGNLyPzv8pGi3rT1EHnkCAYoz9Vzxuu44ZCAnx0pVsWAVJftCSv6QeHSkS7KHb
	rN+5J1EI6DitqVDvXaEtlabGvlhsclKc9edUXIIqoW3OppLB0Pa8EvxMPP2lcIurRje+dd+fGry
	8TAsFFjLbwS+4srqDOLrvFPpE4FuEwulXtByaqsUxcCFxcbE5NetPjqzGDYScMcfrJ8rK58+pG9
	6uYIXxJnKkFvWrpOw=
X-Received: by 2002:a05:7300:8801:b0:36a:3005:aa65 with SMTP id 5a478bee46e88-36a3005b037mr1710968eec.15.1793239987353;
        Wed, 28 Oct 2026 19:13:07 -0700 (PDT)
X-Received: by 2002:a05:7300:8801:b0:36a:3005:aa65 with SMTP id 5a478bee46e88-36a3005b037mr1710930eec.15.1793239986781;
        Wed, 28 Oct 2026 19:13:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm12163260eec.11.2026.10.28.19.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:13:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:13:00 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Message-ID: <auKrrKu5O7T9fXIv@QCOM-aGQu4IUr3Y>
References: <20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com>
 <679f383a-97a1-4505-8bd9-73ef76bc0d87@oss.qualcomm.com>
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
In-Reply-To: <679f383a-97a1-4505-8bd9-73ef76bc0d87@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KC6sMGRS5b6_8U7JEvVKalHv3t-2QRhT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfX1EaB+AhYdgzx
 dZB4E+RZz0bEbY2J9VJAEoF9SczmrgJlK5tScrx0yDfdiQOWdMhLIwJaxJzs3DyamsMAHC2ruYD
 2yedfGxkTqp3DMlCW6HIwyMahkXqkavkT/PuWqjgqB1C5RKHcNLwPyn1JNTez7Wq+G77Ui2L3cc
 LKalY9+dZ2JBqHaqGy2GR2Q0KJ0xqWYleaIfB3qYK+z1ny48cdIWbJgAG9bIAR7sqwTUcf4rSbr
 QWIn9LHb9uQhLCzxx+/x1R9gMJYa56Tz7tzGs9S/N864SAoj+oDfCyw6+UB9MUw5dHynbo5HByb
 sjr0Z+0V26sc7BDx0i2BNeZFbotiJg7ZXHCYMRr6xdnElgX2Yn8HQduOOCFH9REqTZBNd7DfNTI
 L3MTFRryW/CnO/VQTLnwoUWm33y7kF4yEEb9HSklwtiLCpxlrK62BWECWCmdYQyE9D7xiEHgP0B
 d5V/sR+vULEBSPOy6WQ==
X-Proofpoint-GUID: KC6sMGRS5b6_8U7JEvVKalHv3t-2QRhT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfX6zfErdua/Lob
 jbALlSyrzNhkQpC52Ir0LzRoo+I7ZV6XnwpHU1CjpefzjonTIeAnDZO0fh0c7Ka9P89kpWruQnj
 xpjSfpvjykORuNK2VvIIfFiYe32TPW4=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2abb4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VBx6HuuRU8mu7iSl-QoA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290008

On Wed, Oct 21, 2026 at 10:55:42AM +0530, Mohammad Rafi Shaik wrote:
> 
> 
> On 10/21/2026 8:23 AM, Shawn Guo wrote:
> > Derive the AIF_TDM_RX_8 and AIF_TDM_TX_8 backend channel count from
> > the cpu DAI TDM slot mask in the DT, using the same tx/rx mask
> > selection as q6tdm_set_tdm_slot(). Each board then gets the channel
> > count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on RIDE.
> > Keep the default of two when the link has no TDM slot description.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >   sound/soc/qcom/sc8280xp.c | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> > 
> > diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> > index 9aae6aadd43d..f3fb13145b3b 100644
> > --- a/sound/soc/qcom/sc8280xp.c
> > +++ b/sound/soc/qcom/sc8280xp.c
> > @@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> >   	channels->min = 2;
> >   	channels->max = 2;
> >   	switch (cpu_dai->id) {
> > +	case AIF_TDM_RX_8:
> > +	case AIF_TDM_TX_8: {
> 
> This should not be limited to AIF_TDM_RX_8/AIF_TDM_TX_8.
> 
> Enable it for all TDM DAI IDs.
> 
> case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> case AIF_TDM_RX_0 ... AIF_TDM_TX_12:

Ack, will cover both PRIMARY..QUINARY and AIF_TDM ranges in v2,
matching q6tdm_set_tdm_slot().

Shawn
