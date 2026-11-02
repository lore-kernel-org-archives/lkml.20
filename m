Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793630855;
	b=MrleDOc2/5UqpnAuwjH/1JfbxQJnw+9Vw3OkNi3HwlGf/1TLs9fvP1MqiLwBa8CPGbx9
	 H6F94u15RXengrSxf4JgFftG+rOzj5NcKpCyEC/q+D5cynS48EnJ8YXY8AvtE0bATUuXG
	 4OFXRjtub0JJ2tfDRDAJdqtDvGbrbVY5G1busViJyg4ClbPYPSZUxkpK+i+Ttn26LMNjL
	 gnUpHSjc2YeG3SzUVs6IZ8YGYvGl7nIOmx+BvrSMpIaqIsThYerzpoO2yIARmpV35ObR+
	 vPMgqlEhRrVoZSwHNxnjlb8aMyFZlzqnqkjxcsrNVC9rP/GVz5038wrBwMY7xmKClkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=;
	b=Ppmo5gqU21A1+Bv1o7I6QrM5tbKih2egbniSoK1YCqdzidGaU6q5GkFhJYKM6qZeTz3c
	 XSszLDzQgDdBgyV+lpalOsfeDR8s7qygqYrCP90IDOqbOeEIbF9sc0WF3bH9olhiivYdn
	 a+cZ0iq+iCTmspDuTUlLceE3hKP6nFd4jXQ01ksPh5jYJnSedD1/tF6ADJJUtFOq5m4JN
	 PvnG4UdJSYKOMVksO9EjQy7aOAN1ivZdxjz9GyBpTug49MVe0oHih6AmAWzt1iW/YIufq
	 haXBn7hM+46xi7+MwHwuxUB9qG1fq8t3ZlRpRFmY35x2NTPXB9bPGI7fGZm1HvF6AtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gAzdOtsZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4s86SlG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C908608557B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C908608557B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gAzdOtsZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4s86SlG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRLV477106
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=; b=gAzdOtsZTxgNy94h
	ZPBgktST8H9qh/HqbR7qsGEwDXgGnW/s4aJoREacb32Hcv0lUYn6IGFaLj9n00qP
	eo5nDZUHtUw3HHnqdFUXRSrxOP+0YxsjiddZ+IilytcBFLsDneMN3tTG6+msTlS5
	s3rA6gNVWchexYjtkyW0QfY3nj17B8CXWrGMaVtQZHh3AnZqrfDOEfeMt0qjTpLf
	AdLndZzmCZnvF3+BpcCVoGeVQendqaL9tkDM3tUZG0KQ68riU0W69M2nswepn+1w
	LMai++QfbuLlBzXZ27MgMMbU/z9vxkR0Hl2zbe11dhq7O2zm6Bvqk8eQdg9GIz25
	c4A16A==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19mf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:47:34 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-84fe2593525so4696931a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:47:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793630853; cv=none;
        d=google.com; s=arc-20260327;
        b=bXegLxXKyZK01rz+0f0pvqMVWJxiCYDk3PWNY8+mf378xevy1nElIxKojoNes7zP52
         bv92GbJF919kJB+wSrWcey7EgrSHBT2dMmBIQSDmHoZxkE0h2dor+JtSQ4d8js+XKs0k
         Lly8u3Noaks5FOwd/TQ2PSKSqJplNPZvx3ZHcfqferLDSZnZfH4bHyxjCrdcsQhPHQWa
         0izzAObPZUcW5i2wFJGOJa9VKU4czmIZToLFvbVVGchcMec5JeNTRAAD4bHMzGEj0vBG
         +Yxz++emlP7upRBWauCmV1zndphH/5I+VUxqWtfufghZMa23/kIepG5hEU60v1i+cDyF
         jH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=;
        fh=VPbKGQngp+r4uXhpqucWz+eB0F8pHuvGW7B+k39yabo=;
        b=PDJhXvFCHi/pfNxoNPmq/1RK7pQFQYkqJnYrzLYVwuHR93WwBsccLdzTkFuULtXdmU
         vr02dR7pzduTR4IyVn8pzK5yg4xfbzTQvecLZArKIGLM3SrRSSSCyUCPf8pIT60Qd+eW
         X3443KTPxhUoYGFXPI86u/2N60or1hs/A3UIWxNTIO4CtcndmMyfSGehYDSSM+6odBbH
         FUO+EsjtmUiSUL1JtHhYLlHpJvZyic9WRhZcOEqRc7/VeMQphQ6cau08aL3TonSSjVz9
         AfVIAFN41HfGvvl8jQaeXUZNM8zS4Tit2x4f+fXXn3zGBWn1qgr3PzNQz4BEWwGSYd//
         EHVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793630853; x=1794235653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=;
        b=G4s86SlG1mh6vfGLj+6kpzbMZsy7KTERL8W9q0XIEazSRYLKo2laW3PLxnELTjMBD1
         2BtOxo/08ezako1wwgv7MqDOid5FZuakWoZnHh+1VaRbJeKlytF1fvE08c5gUpapOSHj
         MsR5ll9mAJ5vKNNhmn5Y5uXL9K3IbZU/yOqRQ4FCG/ZSpetpJjDYae1frGP6LqvHjQDn
         dGQbIV469uCBpmTfIMePae339DVqiIl38KHMnbHD1Ic3q4hwZPD1JsE6YoSee3nHSXG1
         2IFdapWA5tqj6nen6mJ/krTN9BPMboggifiK/DaeLhN6K3lEegzrVER+9UyepzFZtjdS
         9MsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630853; x=1794235653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=;
        b=G7OesvdOwwyFnIjEi494G6Q2/Rd3PJp1js/SnsO9ZLE3CbBKZZgl7yYkha8NBTB7MP
         ZAO+cF+aUnb4gZj5rOAcYe4phrkF2QuKpf+qNLrUWNif82AIcUMgAcwOH8Cy96OtjMVp
         NXd0JEQznce6e9GOccW6S1Bv4aUodf5r+9nvhv2d9VCK1r/y9Inp9lZIhDSOittMPEco
         Y6Z7XikW2VrrkHk2mv5rypG2INwzzkbFuqiU7DY5rbOAdzhOdlylKVZ98yqKZQBJRY1K
         FIaLgYv6FQX7YiXieBRjoR/8gXKhSY7KIEbC1cBE/BuE6L8LHB3PjC2kFuG3s88hGfeH
         VszQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiT4yVvuZeM6hvDoaP44tVNf3gfMoSlpjxt9fAS+Zg/DZ6g/0aYIgeCnae6c+6Tip/gf6KZtbYPqwL/WE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKwIeU85Q5kz8P2fB63DtK24U3Jb0sTEfTnsNuBPO75vIjmqF7
	DkO3QHK8HKCYfGaIVfkMOFo/InGTYweKZ6OzI6e+IrG5ZDWJWmdu1jxih9+ThA0N+88i1olzRF2
	IjZ+UDXMig9DivBgneG7b00bbUzRgKOa0n5rnHbLqw9Xn8aPBLCUrwocJUdikp/zphWbSpGB/n0
	8C+2IRwS3zsxLsSGNiFPbqJKTbTTVdjnvExQo1LcaqWQ==
X-Gm-Gg: AYBFou2MTMublwUoLKukD6dn4KYIjyczaHkbfWGJLlpm+xECS3RX4RwyG+jlAUj19ZH
	9/mBTT4Nb3jwEeCI1OUjodIa+ryYr6sTk/j/uGBEctVn5hNkRAkQVNnz1jCUCyky7OrK3mfXvLA
	kcEplYY7CERSlG57BtyP1nGbeCWa9v7vyPQU+AW4S1aNfQedCLdjv7TgWJoG3dlzWzRwstILtCJ
	a6ftCzdjp9y8jdJHG/7zs0LOtp4ps1lvKtXyX+RWntwSF/lzwJlHbCSZjSAwwpjmVYg8wwLgjA=
X-Received: by 2002:a05:6808:1783:b0:4fb:ac9b:b06a with SMTP id 5614622812f47-5640de0fc9emr7469406b6e.48.1793630853424;
        Mon, 02 Nov 2026 06:47:33 -0800 (PST)
X-Received: by 2002:a05:6808:1783:b0:4fb:ac9b:b06a with SMTP id
 5614622812f47-5640de0fc9emr7469389b6e.48.1793630852884; Mon, 02 Nov 2026
 06:47:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:47:20 +0100
X-Gm-Features: AclHuK9F-lczTho9-OOQz-6r-jj8Nij597M3yazka8tis8-xUrvn5J9xzKhwj5s
Message-ID: <CAFEp6-3LSPnYv2AV4xCc3i+NQJv13qHZ2JCX45drnx26=Z2kVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence tracking
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: AJ21EIYNlHIA6vjfS250Je1rrXGH8LV0
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8a286 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=ySw4tsHwzHfE-Ekmi8kA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AJ21EIYNlHIA6vjfS250Je1rrXGH8LV0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfXx26h1QuL7y8c
 k6/HzXC29ZoqAaR/qc9HPLtM2tNViMaVoDImA7SOf3aPDgq2FXkCEsRTwgs7bXnlM7H2D/Q/mTS
 Xy47njJs31aHagT2Rd9QEintzG548XxHztVgo+bOgagBuL1N6MG5Hr5bVJynXQY+mE7tCYg0itf
 6nVGQcrMtPnLKUBatuwkv5ZWnvDbVVhpWrLbkI9J6LC/p72afqd5kaIWiEMBSLE1FM2wk/6fAUh
 k/L6wFba10jkSFBQ2Ic3hYEuPabDcKURC1v/KyTIbVpdtSQ5BwCQnRdxx4ikISDMkW2KUMnJdp9
 gGN+JQCHEH7UrAqcO5TaghDgg/zcu7rmZpW361KmOJFqDAu4rLy5EvH7ZjN0+GxdWmqAEm/ezNe
 L16P51UI9GrEsh9a/Smt9XfS6KpDV5yZ8oTWtHqHL+rv5EV+2C4nMBx4d6Nz/fsZ/QeXhgwFe78
 y4PD1gtuFgM3e928S/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX5KsmAj6lq//a
 Xn299sI4g00fy2vct86lDRlwPbJ3Oed/WQtArZ9maCS4mQrqIPJsKr41zTv3kAdKi9XpKYL+4f0
 eg+qBh1f3h3qWu5C45/ECtJQh7QdlzM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020058

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> In order to communicate to user-space CSI2 SOF events we will need to hoo=
k
> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> implementations of FRAME_SYNC have CSI decoders which support the event
> always generate it in our case if and only if an atomic user count
> indicates it should be so.
>
> A flag in the CSID descriptor indicates if frame_sync_en is supported so
> for each SoC that supports it this flag should be true. Since bool is fal=
se
> by default no negative enumeration of existing or in-flight CSID is
> required.
>
> Subsequent patches will enable on a per-CSID basis.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++++++++=
+++++-
>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index a00791b00feb7..e9b399fcb9c7a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int=
 on)
>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>         struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> +       unsigned int i;
>         int ret;
>
>         if (enable) {
> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, in=
t enable)
>         }
>
>         if (csid->phy.need_vc_update) {
> +               for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +                       atomic_set(&csid->sof_seq[i], -1);

Should we introduce a `csid_sof_reset()` helper and only invoke it on
the enable path?
For example, on disable we currently reset the value before stopping
the CSID, so a late IRQ could still arrive and update `seq`. In
practice this is probably harmless since the value gets reset again on
the next enable...

Also, a short comment explaining why the sequence is initialized to
`-1` would be helpful.

> +
>                 csid->res->hw_ops->configure_stream(csid, enable);
>                 csid->phy.need_vc_update =3D false;
>         }
> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *en=
tity,
>         return 0;
>  }
>
> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsign=
ed int elems)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> +
> +       atomic_inc(&csid->frame_sync_users[sev->id]);
> +
> +       return 0;
> +}
> +
> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> +
> +       atomic_dec(&csid->frame_sync_users[sev->id]);
> +}
> +
> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops =3D {
> +       .add =3D csid_frame_sync_add,
> +       .del =3D csid_frame_sync_del,
> +};
> +
> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *=
fh,
> +                               struct v4l2_event_subscription *sub)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> +
> +       if (sub->type !=3D V4L2_EVENT_FRAME_SYNC)
> +               return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> +
> +       if (sub->id >=3D MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sy=
nc_en)
> +               return -EINVAL;
> +
> +       return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> +}
> +
> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> +{
> +       struct v4l2_event event =3D {
> +               .type =3D V4L2_EVENT_FRAME_SYNC,
> +               .id =3D id,
> +               .u.frame_sync.frame_sequence =3D
> +                       atomic_inc_return(&csid->sof_seq[id]),
> +       };
> +
> +       if (atomic_read(&csid->frame_sync_users[id]))
> +               v4l2_event_queue(csid->subdev.devnode, &event);
> +}
> +
>  static const struct v4l2_subdev_core_ops csid_core_ops =3D {
>         .s_power =3D csid_set_power,
> -       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +       .subscribe_event =3D csid_subscribe_event,
>         .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
>  };
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac8..2e48b08b93592 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -141,6 +141,7 @@ struct csid_hw_ops {
>
>  struct csid_subdev_resources {
>         bool is_lite;
> +       bool frame_sync_en;
>         const struct csid_hw_ops *hw_ops;
>         const struct parent_dev_ops *parent_dev_ops;
>         const struct csid_formats *formats;
> @@ -167,6 +168,8 @@ struct csid_device {
>         struct v4l2_ctrl_handler ctrls;
>         struct v4l2_ctrl *testgen_mode;
>         const struct csid_subdev_resources *res;
> +       atomic_t frame_sync_users[MSM_CSID_MAX_SRC_STREAMS];
> +       atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
>  };
>
>  struct camss_subdev_resources;
> @@ -248,4 +251,13 @@ u32 csid_hw_version(struct csid_device *csid);
>  u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
>                       unsigned int match_format_idx, u32 match_code);
>
> +/*
> + * csid_sof_event - Track SOF generate V4L2_EVENT_FRAME_SYNC
> + * @csid: CSID device
> + * @id: CSID src-stream ID
> + *
> + *  Called from the CSID interrupt handler on SOF of the path driving th=
e event.
> + */
> +void csid_sof_event(struct csid_device *csid, unsigned int id);
> +
>  #endif /* QC_MSM_CAMSS_CSID_H */
>
> --
> 2.56.0
>
