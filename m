Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793155250;
	b=NvlyMwfzcG3kjKIiJ0Mltt1THNDWO2vifHcGAgTwX1QrDamK9xlgJrsHImzR0+47eC8R
	 3o5nkEvAdeGErghxocOkmGpJVPto9x3/K9v3k8r1u0fqoFmSI9/ZqHk9+i1JC9UBih/UD
	 jZLCNYxxnNFZn04Nn1TCTFLw0beO/mmJ1pylzRVuzGOUYiOT4Op+Hbu/bYIdOQ/iotyGT
	 aGGBDYJcddkwTXFLCu2Jt2edfmAA9f3vp0lAh6bLpZ0aT33kzRcNNDj5eRRx0trr2WYX8
	 rVEBpkJ3JUWCkyEBDhgJkqYoWaZTC9982zqVaqTtY1AwJat5G52THjzPugWDekEqMsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=;
	b=AcNzwx1ghwxic7kW0pV1E4DGhVRDwtwDk8c+5N1Qf++b0py33zNNSMnDvPaOoaOSPq0d
	 jw+ZO/Y/JVb5sCulWj3GmKYefEdrKOSDFp4jUCuHxgqhqdGJgvQUYi7Dx77vTabPRx36t
	 OjSb/j1f/pc/vtp3cj/dMzRVey3t41crGbpiq2RtllDsnXjXD28IR/H5MDTAi/G7HfXd7
	 roKVS3ULZcRJLrwd/lLA4Q3nxhbQab0FBjW78S3XWzsIv+HrH1X/rBDWAk4TPWT63Gbp3
	 lqCwrFWnNflac0X3p+SsNaRldfmSIJGYbdNq7G+TBVq2icFkH2jqPzteGCycmQE1tSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP0jeGoj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HNjjMIUL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F0A606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F0A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP0jeGoj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HNjjMIUL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0jBxj3459311
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=; b=MP0jeGojr59swceb
	S29QoMx2oPgTkVTBRpSWG0EljdUAEgQz3Ms/n+K/GyOnZfgFdIwcBI+Pfz8ah73P
	HbNoFuCrRwesYx7sNi9cP1Scj7G+sY5f1nAO9vKv713tjigijZXvFa9iEqqfpell
	Atv7cLbpPx4fwKZxgEfRZrkzI0onxbrOnrCml7JaZ1O+iBzHbQF+nlfJXsudH5h5
	m+83gfcpFtIZjHS2HKLhQ+v5y9oYqdj0IbEhfYDEjh9TEw1SFI1a2FlYEVdLjpA0
	EK7FmTY36QHBJS/EcrfXXLJE04xG3tcyDnH1fVKXoNbFcD8LDLO69JWFqqKkhhDM
	BmH9cg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be0dc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:40:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so490248a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793155248; cv=none;
        d=google.com; s=arc-20260327;
        b=nE2la4/1xdAXlldcBbkkcnC0vU57nvSSAvcjFgcw2EIlYQiMoFNyuXy2nbtuNaDvEM
         00U6fz7aGnhdwbKOPVQ1s9+FZrwTWSEViVhsAATZFz/Yycj55Dnn1f1FW3adp1l/+VRf
         jOCG/hY9WpkPREhEh/r7kRQmYvRWUZi6XACFc0cRSUluYeRiX/0qws8Ir85W750ILut3
         5K7/gDZ7iqiB0kMO051au1FvJ+bQdNc+nw/XTG4XYzD6duMpbrfTIKarFD5pnlszfJPf
         ODh4cXfVWdkbOyR6Zi418YXiBS0NLgX2qT4aTRJ3knnpkp+MfgMElUcvN58/V04f3csj
         7iZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=;
        fh=HlDdSdGxTUfJih5WzHaGPbI70alHS6LI42rCclHdEZc=;
        b=LJW9DtHpClArpBZLDmp5aIc62MHCNbl7XF2L8i8rUcmwQlbcm1SyVMNrPm60mX9y1q
         hsKVZ6HoDWp3KecwjxuWQ2Ja6c1D9iBD2YfIiKG5Oybg/NA+LA9MFrJgRcNr8u6FCgWe
         1XV0q7ZFlyI2S9Lmj7SJIREiH56r1+MrUJdY0cUCjVUJ4uNmrYaa6t1xCtHrKI8Yqpx2
         ODOMQXYSCiWpePQGsAAaeJyzkZe5SiPSSFK2v2d9dygl+GUVttAshc/WHZwJrSMQNDDH
         +NjOsDTVLHJnHWCXAdSd3QBgDpWjYZWDNXE1Eu1fmBwT98dem4j5zy2gzYc5YDOoW/QD
         pWHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793155248; x=1793760048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=;
        b=HNjjMIULiyUJ+giAF1chQ8RVnFuhvtHUYiPWm3bVvnAgSjjy6YblwLsMSL+tpGFt9h
         QSjMkUs4JrT1IHSxSK60/Sou//uI9566SUhnF2TR5xtsEagh9r7fuAcWUg8JeG2/qyjd
         qj9BOvmqcpg8DyCV/U2nHIuZBBPW1ptlTSSaADaE6+el+BImpjPWX3WfvwHYftHQKyvM
         NDVs/Zbuu0lK4o4MW6yQnQVwz+jgeVDE0DBKRexyexbVEYuLv/Cd7xw2T8BRSb2a7qj4
         AV45z9JI0N3kwHkgOClRiaOMjxH6fLyKEZg8sTO09gMXViY7riGRRRMJm/pZkR+8cTxn
         PWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155248; x=1793760048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=;
        b=gv24Js8Z1c+sOuKHv/DdD2mhtg1pkV5hqNKy4IcuAd8lBhZAlwGnlGn8ypzILyTV0P
         ipPa825d4tTEVoC7KmggYVr6EezQ8KZgOIViHXOV2nMzV89+IdX5eHmf3BeQ/4IC0QM+
         NGbZQFHhgmV/MhN7GWPx9zaajVzh/hgNIxargTzdqePHsOHTdbX1Mdz8m8IOI/hZ1omX
         8X7tO+DGzK5h9nGbUSXzUepsI4EvwQcowEst1aCnKA+WRfnVWASrIzf4pvOJ2VNQghO6
         QN4EjR9ZlZdaCeV/uFClBn+hRcReH2ZbXaqIphEfwHchWmO3/d8eY+1R/TUa2ioJh/id
         8gHg==
X-Forwarded-Encrypted: i=1; AKwUvByzLfMk2sI/IoSisQn6U4rqxIjeL/lDFo/uck3W2U8EWNVXepNtn6kQgQgRglz5zK5hx18FYBmECA9njI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnkNeoDm8c5itTiuqfKO0q4/iBHFXgZDwFqccW3+u8y3+XjzRk
	BBmapkQVFG7zDnOIaN7Pt+9+kuL0w5PVigmwvqlEAHgVIDeJFebbiEKcgZs+Uzt+ABJtfYIkEj6
	T5iCbm6fK5oBgny5rbHyDdUcFoQNegXSNxZ8hSENEIf7YU0PRzBbyUiKhXWf/FPatwyqMSMY1I/
	4gBTS161JnTdo1qtJf70KgNwltfBLnOjBPA7pDe2kM8w==
X-Gm-Gg: AYBFou22AUoVFV5cexJrfDa/tsq0kdIUHEO3o9yp6EhqN5FeHOxwPa+GpVFapzKHzmV
	RP9C7tYmRefTLM7jnm3UEZSdiqDhCovfW+yeu1cUgWpxPeECzRTBinJrcLtwi70AiGgEOaAlylR
	bSDhY3xJ71Q+RfeBt8jXJ4eMgL0b+hQ2AjI65LGFFyPRC+q53GsTZh0/cDvg==
X-Received: by 2002:a05:6a21:6001:b0:3dd:a195:fa1d with SMTP id adf61e73a8af0-3e9023e1c1emr828637637.66.1793155247572;
        Tue, 27 Oct 2026 19:40:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:6001:b0:3dd:a195:fa1d with SMTP id
 adf61e73a8af0-3e9023e1c1emr828612637.66.1793155247093; Tue, 27 Oct 2026
 19:40:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com> <0dd1f699-6e08-4e9c-bf92-187edf9904c7@oss.qualcomm.com>
In-Reply-To: <0dd1f699-6e08-4e9c-bf92-187edf9904c7@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 10:40:35 +0800
X-Gm-Features: AclHuK9R4i_-p9NyTVXeDuSZ-1inIa2D1mlRB5RBblU7VSo9hG-gWj7dTK6LuCw
Message-ID: <CAFkd8hsBqFQcXi66wWsZhRt7Sm29jVL0vZ1aW=NR3kwjtcsQUg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM formats
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 4hlJMpPPkeaF2XvsI57JGWUnjeVvWKdY
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae160b0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=1tmr-2Z58gs6IC_Pm1AA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxMCBTYWx0ZWRfX9mMNLd8JVyV2
 SGMx8UokL4rCKRejNOwNUBGFzHBCo34E/5kDsZv8blULgpAI1wI//UvEDpwV0hL5S76uR7S8y/v
 GT0PodE87Zt6XOJ16Vvl6iIv0D9WjVI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxMCBTYWx0ZWRfX68bfP/p97GqG
 IdS2hKXv548qgeoHCVfTDCcfc+6H7IeSPJWui10JxUyIp7hzt/jJ2Yk4yN+2SiQGndT9KucT4Pv
 Z7Xu3rya/4aVzyu+bS0VKH+n1ds0QZrwxQQm/zmhVfrasx2aLT/X5RQMXqZtIJ74cRLoBG2ektJ
 x0ApcEGtpKeI1RzJeW8Yz0/nZlRn8h50cb6urQ3pevDzaA2ojVV1W70SGLBqPqpcxmyeAn45JLE
 Yl7iw565svMx4anhgV43EP8XSbECTgqrZHWd2mbkXayVNah4XUFLYdJCr8m8ax3fpHesdi9yHXb
 ++HfiMUyGxkCiaooT2zVWsP2sS2n0t999RvIUi40gIc3qP3BshPa9lOzPn4Nhl1PKUZf0BPnKMC
 MglQzuZseWLjj7ba4dSflmo0f7pQNHdOVXQ5NwAJu+QrdawOfpkOao3kUBT4G4Ed8cRrKRpwxsN
 oDpU3waM/OMCKg8rh6Q==
X-Proofpoint-GUID: 4hlJMpPPkeaF2XvsI57JGWUnjeVvWKdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280010

On Tue, Oct 27, 2026 at 9:47=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> On 10/26/26 8:25 AM, Zhangfei Gao wrote:
> > AudioReach currently rejects PCM streams with more than four channels i=
n
> > the PCM and shared-memory media format paths.
> bit more context would help, why you need it now?

Sure

>
> >
> > Reuse q6dsp_map_channels() to support multichannel PCM formats.
> >
> > Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> > ---
> >
> > v2: reuse q6dsp_map_channels
> >
> >  sound/soc/qcom/qdsp6/audioreach.c       | 26 -------------------------
> >  sound/soc/qcom/qdsp6/audioreach.h       |  1 -
> >  sound/soc/qcom/qdsp6/q6apm-dai.c        | 12 +++++++++---
> >  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  9 +++++++--
> >  4 files changed, 16 insertions(+), 32 deletions(-)
> >
> > diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/a=
udioreach.c
> > index d2dc5d37bccf..33161523c7da 100644
> > --- a/sound/soc/qcom/qdsp6/audioreach.c
> > +++ b/sound/soc/qcom/qdsp6/audioreach.c
> > @@ -306,22 +306,6 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, u=
int32_t opcode, uint32_t token
> >  }
> >  EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
> >
> > -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channe=
ls)
> > -{
> > -     if (num_channels =3D=3D 1) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -     } else if (num_channels =3D=3D 2) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -     } else if (num_channels =3D=3D 4) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -             ch_map[2] =3D  PCM_CHANNEL_LS;
> > -             ch_map[3] =3D  PCM_CHANNEL_RS;
> > -     }
> > -}
> > -EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
> > -
> while you at this, please remove AR_PCM_MAX_NUM_CHANNEL too.

Good idea,
Will reuse PCM_MAX_NUM_CHANNEL to replace AR_PCM_MAX_NUM_CHANNEL
>
> Other than that it looks good to me.
>
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>

Thanks
