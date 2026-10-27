Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793094933;
	b=KazpHx3i9OlSaYNfVTCRdOSVNH+gOf0NPQve1o2rRmifNOWAuCuGtz0b+t3Sdrz9E1bB
	 dU9uCPrdRvVsBhmVnrubHDR8+yEF2NdrQVAdj1ZYYxw80DFjT/SSmzAZZBBNaNdLsB9gY
	 OFW/+TWqr6ch/TD256sY5cKrfGcEcnt11BT8qNwYOqEE1dfGcIs6jiRwLIr3B8Ut3CJT1
	 UEOkKMevZsFPqK/axaqP6FhA0Sos5+P8u312fWMfHAwPVTPriUoo+xlLTdAhpvXvP0QPw
	 p+cktYJkAIajrhr41hQ/dj8uZN7BiND0JA7WR7fRnHlVoCPqJMPjb0MZLwOlhANyfxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=;
	b=hK8TIG+5EFdoaxsnCL0b9TpIPjzL9gA0VP84y/ZBkgwjTx71Sq71kdZ9hlCRQg9iM+dU
	 UN4hVYE5vOU0PLUGXm1X9bisgK/vEA0ueVNbRaahBaHTXl5UlPIvgsXxqugaO1gCjCJzM
	 xV/SkbHzs2QfBhvi1yFA/FqHxaZqU1kscXNOLqSsqLeU12kY61d8DAkY4bWynYF7MlL+a
	 LN/7BrIIHknh/3hMXaBIFlzwg5dgcAO7oKsJDBI/GDOAuGnGyJ/9zWCQwF7rk4gMUbdC4
	 GIzWU0tGa9gt2ZwNkR83bd3Wii1ZVbqx5awVpd0Q+oO46Dy+1V5sPYlzYRd+1/5r5Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGVU2z5X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGNsLpU4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C14E606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C14E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGVU2z5X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGNsLpU4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gMaM2747309
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=; b=DGVU2z5XeSNhYIKS
	yfThQ5W/Fl7cOogg4qMa3jOQq/I+zQT+KPoV2DKRfPcrezlaEn7C0o9fTN28zDhi
	PzSOmZLvRy6m7W8CVlvWYDOvD9J+RLilyLePhVUlpl0UwNrXhY9+nUPDI74EQaI5
	WlXuqbwRTVaa0ZJZlR/KRwSuF9BNMpZtGzKRwJ2ERQ28p2bXgey64lnYMCZHsA3C
	o7dAUptj7m4UdfjxDFlU97ObXjRPKovx2RjLqvxmYd676bo135AXu7z1aKGmHEiK
	zXlmrUdqLcS6/SD4ad5OwId9hlFKa8jTSNl70Gx2w9STJJ7AmcaR7hulguh4wzz0
	bWvtpQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3daeef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:55:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dfb24dfedfso42655175ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793094931; cv=none;
        d=google.com; s=arc-20260327;
        b=MepGonlPa0qDwe/7VhK3rbYH05YVi/llqN8Tt0tSkAjvmE1/v5cdGT55++tn6B+13r
         sPYJ9oofeKAqcFOlnb2PBQd0z6M/7LwWa0Z8hfOwIpn6qhHgOrgiqtrcG4Zy9r6T9Zec
         I2sqMzRnfhAsyfwcMRhjMOtu1iX1sGxMtIxtHtRb0s5EB45/usKiuv5x2bPqqAm39LVp
         ILcKMgMd9NpvSWSOsX001PxdzmBXTMsITZs71EsSG0oYPDQmCyQBBLkSLbbFCWLmv7gD
         LHUrCajxaOZ+1iDY3X1tG0J/BzhGhN8Mjgk/64PBP1twrZCZ71kfG2yfFWwWPG9gYfPK
         fSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=;
        fh=C+9uJ3jNBvntFUq3T1VPXNm6KVRc/18NIaws1jElrM4=;
        b=MLQIswWe1NTX1Y2WgZqLubl2Ik3Qllo3VGI4NlXWvDyv7yv3ogXXlrYqFy9AQVUSt9
         T2e2o9tXTX13x1VVLfRfy7r2ru9aoff510a41Xx+Fxlu0HsYCP2GNaskq0shuJNmLqXR
         E1UYrnh17FiBJVDCO/AVe8E+N1NDmdYyQv69uobIotU22g9tmqq1DnBs9u78afLFhryN
         AKDmglq7Lh0dwBirXqw13OML8plm7i2+XpsBsJctlNvClLMJ2jVh+oDJoFpoxdxy8SMW
         qdOJWZI7sQj/3MG2TGu4axgcz1gQ29VjvXuUROO9N0N1hfClS4+9ZtqSqbdUPNYyO9Id
         aXpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793094931; x=1793699731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=;
        b=jGNsLpU48rqrrwG81MHZyHUAJA42yblEaFr5aCfLBH7GAfOEMXyf9AfuB6xmO3mALd
         pO6FCh8akvkJLsyrYGA/OxN2yKX79VicTdnRWN2FtUxYCb/lUQu5T6qo7dobLJsO0yeT
         S9xwmbH3Oxsht3L1U7qIanqqzT1bjLfvmczjFyr+YdLFx4TWU3zqK8dkGxQ/0Xpm26hV
         cdJf/xYFwer1LfbaKbGYWJkngbHhHbY2Zbrv3/lv23RjU64HfRoBniO0H3SaKntf9Bp2
         7Nae9p6df+qDkAKbQAy3akgVAII7wRzN9Z4IxndvUVtAA3ijfNFX4EVBUTUkvMvFEWHy
         4mHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094931; x=1793699731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=;
        b=HpT08uIBmvSSrWRPm3AaTG7BRdrj3giE+f5Lzbz0wtaEyprlR0X9BPCxlwQI9ulTgF
         sr9oznX8SE4W8s1qg6aeViw4A1U2cAQ6a1PBBe07e4LH5W0f0ln0YGX1BomiZbmvn0Ib
         p1Q1h/UxeoPUpcWc/Y659+bduw0vTOookONzmr2iLctlpZKM870/haFvTw05FPRPtz9m
         zqa7m1yCCcJlJhf54huk3E2J0AA5b6xd2XF3oqQQoO20aT6NQUmV69C1LUQaUYUC1/rk
         sWKsNnAN1hYd6Js+0gRPOUOUyH7bHMmuEfF19irKENgUdXpnpkhaFlbmp1PodaDTTJPV
         KJ1A==
X-Forwarded-Encrypted: i=1; AKwUvBwe431hCSCtF7GkHABJFjiL+fSBClkaTeKrJZNnx1Zkm9hddPRDoLjjfOCzRLRgGuD/eTvlhn+Vh368c8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlozL0sjbRq4P+VIFBfpUo8FgPt2LX+AHeGZntR4uBAP/dEhZB
	pYaIVjTYRiZ3po7RUzJ2Tn0Mxk4bEZN9Z0/nU3Mkcoo45+J7ZT/TZI7dLJN5cK5nGljL1NEgw05
	2CoGf93/xGNQJ2dpj6nmjgx4JMKxwVIaEcddBb2SraGdIUm/8/6l1OQbVeRdMAdwgoBDvFnU+g6
	j0wmp4cb7HOHoMBmbnluL6mlA58REIqxX/2kIfENan+Q==
X-Gm-Gg: AYBFou3lKckORslEDmuviTnZ7FqzRpI6d5fo/spN7AEFKOhGc2OsuN8ZqB5suF+2Uzu
	0SHL4zbi5nDpMnmJWCIvN/dzOo3m6Y88mv19zzvhfdxB5av5PQBo7wtAUE72UTOv1uggtUSCTKE
	2clcC0YsrdwCyDlR8Hj8nrjZDdlUkUX7HVVcdNRRT3ViOQWb2JmMZKi3XiIg==
X-Received: by 2002:a17:902:d50e:b0:2e5:c563:c0dc with SMTP id d9443c01a7336-2ea9c87db90mr82695185ad.42.1793094930972;
        Tue, 27 Oct 2026 02:55:30 -0700 (PDT)
X-Received: by 2002:a17:902:d50e:b0:2e5:c563:c0dc with SMTP id
 d9443c01a7336-2ea9c87db90mr82695055ad.42.1793094930556; Tue, 27 Oct 2026
 02:55:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com> <2936b4ec-3203-4137-9d29-7f95f22186d8@oss.qualcomm.com>
In-Reply-To: <2936b4ec-3203-4137-9d29-7f95f22186d8@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:55:19 +0800
X-Gm-Features: AclHuK-sZwvsBwYWTk7rZbRPQQgivUTPs2rn8QH7Aeck6ZgfXa4-Jadwu7F_w_8
Message-ID: <CAFkd8hsoWa9t6ySWM4o-xgm=mO=_RFuWJDVrCb1u+Zg-eymTJQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM formats
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX4GU7N9VkBl8c
 uZCeGyoZ27TXXFwfvvwLswcZcv79GZvScQT6SoPeAxfsZMuhvsNB6AcQ+pzEj9HRvhjocua41la
 +hkblINs5fgoUH8omL4y7PgnqbC4Pi8=
X-Proofpoint-GUID: aU1EkqvKVloh-Y86qr3P8qWCxB1BtlLl
X-Proofpoint-ORIG-GUID: aU1EkqvKVloh-Y86qr3P8qWCxB1BtlLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfXyBFt4oSUovlE
 NOviaBLeYuvlzShKLXx7t65RVYH8qaTxpULlNTdNV3FZeyVHMt6pvUnTytdMmxxtvKL9k2FeQHC
 S0H+HSOUE+wKQo7NbsA9V3EJcn+wBJMfsNCVHlxdGX9FNlG/8cczqWan6gd5LVTNAWGsbgFmHjL
 eVQ8YbhiQSneK/qKY3dRO6Coigkz9HfSFv/SRxi3MyKMtvq4NxELvpUo6M1yPWm0xHV2wRTxniz
 46MYfEr08+a/80gg6CS4547+XJPjytG25mqPBDj/SGUuHH034FqtpOD0qVF8rdzw7k2yWZfkkEU
 tUKI3lSIKm5cCDUpwVbBUPr8wpv4wuLaL4V7NmTnhOjkf2nVvdyPhjyapr/PtXT5txhLjZJTKh6
 bC8IWIjat6UQnJIgRaHYOMwbXK3jPHV5L9z+5ujq7qjcBdyqmbU2yPQKVMcYyIQCxu9jrw3YIjr
 FUYCzS+Dadkx+NtAhiQ==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae07513 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KEe7bkdQAAAA:20 a=EUspDBNiAAAA:8
 a=hVUKjqsWo0eiZm92ZjMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270039

On Tue, Oct 27, 2026 at 4:46=E2=80=AFPM Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> wrote:
>
> >   #define DRV_NAME "q6apm-dai"
> >   #define POS_BUFFER_BYTES    4096
> > @@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_compon=
ent *component,
> >       cfg.num_channels =3D runtime->channels;
> >       cfg.bit_width =3D prtd->bits_per_sample;
> >       cfg.fmt =3D SND_AUDIOCODEC_PCM;
> > -     audioreach_set_default_channel_mapping(cfg.channel_map, runtime->=
channels);
> > +     ret =3D q6dsp_map_channels(cfg.channel_map, runtime->channels);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (prtd->state) {
> >               /* clear the previous setup if any  */
> >               q6apm_graph_stop(prtd->graph);
> > @@ -1007,8 +1011,10 @@ static int q6apm_dai_compr_set_params(struct snd=
_soc_component *component,
> >               cfg.num_channels =3D 2;
> >               cfg.bit_width =3D prtd->bits_per_sample;
> >               cfg.fmt =3D codec->id;
> > -             audioreach_set_default_channel_mapping(cfg.channel_map,
> > -                                                    cfg.num_channels);
> > +             ret =3D q6dsp_map_channels(cfg.channel_map, cfg.num_chann=
els);
> |
> |
> |q6dsp_map_channels()| changes the mono mapping from |PCM_CHANNEL_FL| to
> |PCM_CHANNEL_FC| and does not handle 7 channels. Have these cases been
> checked and confirmed to be supported as expected for AudioReach ?

Yes, have checked with Rafi, should be PCM_CHANNEL_FC.

Also confirmed from audioreach-engine
https://github.com/AudioReach/audioreach-engine/blob/master/modules/process=
ing/bassboost/capi/src/capi_bassboost_utils.cpp
  case 1:
         if (PCM_CHANNEL_C !=3D format_ptr->format.channel_type[0])

https://github.com/AudioReach/audioreach-engine/blob/master/modules/process=
ing/Virtualizer/api/Virtualizer_api.h
  uint16_t channel_map[0];
  /**< @h2xmle_description  { Payload consisting of channel mapping
information for all the channels. \n
                              The channel mapping is specific for
specific number of channels \n
                              for 1 : [PCM_CHANNEL_C] \n
                              for 2 : [PCM_CHANNEL_L, PCM_CHANNEL_R] \n }

About 7 channel.
If hw requirement is there then we can add right.
Currently no qcom upstream device is testing 7 channels,

For example, RRD 4 chanels and Ride 6 channels.

Thanks
