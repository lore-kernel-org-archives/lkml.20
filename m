Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794216958;
	b=ikwHqQ5A8G4z3+o1DCRvhmnN9ZNi/wifCE1lTjTpc95gjmWqDtEDVZSvBX5kseCNGKpl
	 7ZzP8aoOXE7pYjhI3w5k6prYX+DWRBGwgBSO7T4Ha0eT8mq+RIhTqokyHnJCtBE0J5fe5
	 jhDhzazj1/Mmt/sIYiFvMn1yhSf6W+BDSOELJV/dgAlph3nahSRx7K3livw8VNgHp4lFc
	 DC9u1ZkQkFxB08KSKsCxVzvNXK22sZEfptpqwqKWMHcasEGGka0qfXPC892jokpH+SVjX
	 oC9Jt9mbAOAVDw/jWC4SvMJlC/vdkdSGi4LSbyGhQmb9PT3cfmxSPZ2if2Ld1tyi38A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=;
	b=2uQWYIxIORA1vrdFfLEXICuhgdOxdgwPjuwvXHeEOMq0y5ly/X36Kw0jacuyvf3Zlqva
	 nU97H9TK96nDFVKQhQAy/1YAXY2S03kD/soWUJ5V7FVdwLR715iPtFfeMZFMeDWtdc3Ck
	 k/CXkXbHA13sKmNGqsL+O3bRInCItbPqKc+6Wou3R7YxPQ7aqQAwBOBAX4P28omAS0Hqe
	 ZIWqev4gmtAtp3TU4AcmQZy4IX2aLOMdRPxY2ryfvvuwVtc2NYVfAmTqDOUg6SNzW9SQE
	 SrA22R3PL676x9INMGUqKhu2jM6MPd/Av/DEsYKLXWwsWSy0tKew5c5cHRd1XFcjaRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k59Rh23j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkgMrfzk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEA5606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EEA5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k59Rh23j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkgMrfzk
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A8NL401699
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=; b=k59Rh23j1+/mJ9Iz
	Q/lSh/AFKzplHqzHWeTReZ/CAiPKqq0uTUQKjsY9kcQja5Np1X0FwurOR/v9SGHn
	NlhtUAAJsrhBc3RgyJ+KY9aEIes4/h4vW5hUB44tt5Ak1VvPT1DAWYS4E7td+hnL
	mXQAbNn1qufc5SuHtVT5vXxzm00jz3l1S9trDw7ix/lndzSb7XN0ne8BxYstlJSo
	eiEvS/EMRYadWnRFTBKtZvKZm/ICNzaEekUdxeQwfd9YKTs7Yf23CuFF8sPDVeZc
	CUYqrDznXhnubQ/kFmucDz+gjFYspnQvAUlWMsTn99jfZ6xOB5pkh2jGhlXhUAmH
	7wU/Rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf60hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:35:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944101e6367so123653385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:35:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794216956; cv=none;
        d=google.com; s=arc-20260327;
        b=IIY26hUr152BoYWT99t1iRO3mxOcGabWgkidrT4QMOTwB7pk4SQfruAtEXlt1enMhD
         Sr3S2iNkBXrGR9xXwjPGNN7IQa7D+XywKe8X3+2iZNCEoyXr41qVim46dHh75H5S8CD7
         1Fj6BaV0S2bnh4s1NwU9HO0EwvzoQm1vst83tJ6v824A2UaiwevLwThmTxVxOXxUE9MS
         l2eA5C/hBzydhPXXMehu9/vejDDSN8V8V7h/1HsKXMdOma6YZ47LW8e7xiMSbkkrqTou
         QY2SiqZincWiIHmKsYy/auzYFBDZE7Y5BfGczech0YJW1dzSFH0XbCJug2A6+/nsDE5I
         2jJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=;
        fh=xiDvze2rW2EpvvA8777V+6uaq0jI4UZ8QGda1h2/yus=;
        b=DRA7vPjvnbUrx0kKndDc9tHxeS9S/5JReOWVSb28rD58rWTYIJdLgzpiJGPN/JkF/N
         HJAh10mmmZ5jMffQFi1Wgv6dKBfLSkP/zuXvUpfb4nhIgTGnNyBeZhfQIGpTb2wUYflX
         rnlzwXRTHbJAJGlqPTSQ4WkrVvyHEmPkbEW6h/4V6uw5WsMJMDhFkDkfpXEspvb2KWIE
         5S1kA5VEa5Bk4W+nSm6ul63+uDlKWBQ/G1sJIpM6aJ7kTHnJJydhxm5mkrUEye6NXTi5
         ZcqEvni2OuBaFF8fsBD54s6uvT9EKgADBL3WV8x+xDAdzsfYZUhmOJRH3kC2xRP/QEa0
         7zJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216956; x=1794821756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=;
        b=dkgMrfzk/OeSKfPGyF0nkbZlsCBZY/4M+o2Rq5l/N1k5FcWldWJpDaOE9GhCMldOJO
         Qoosjgag6Ivm/1WuSs+zo2Bk9beQsfiv0tS1kcHVtLiM3DjBZyx2OaUDaBONRBAYCmBk
         aMe1DcyQ8IsCOl2o8HdLfZpBHaAPeroqiyuIH3jyADxcjfgk5ec8eKB0mYUCGUGixDYC
         VdH7OGHIQJADJUBt0TfHZ6Ju3HgktXMQICNyVyxOhRHhOsrhUTf782zw6yHV6xLwT4/L
         u5q8A4ELCR/Xnr//HA4ZZSdxyJOGNmWmlxBtOTB7YUpdFLJsjkhcF6rdzuB40GgvhwL8
         a68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216956; x=1794821756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=;
        b=nb4BxWjoWNPZDjf6kcH3gfQ9yHUZ7tBGAmt4B7YShxfOnqYhj6+7K6KXpUgURGZgfS
         Q8JnA+oT/zA0pVult7UpqbbpDgeGPfRucTf/4JNzkNpegQ/oUJ5sWlPbPnVimi76Dse3
         D8lM5HaAPu+6YpK5WV2QxBBlkVTU4rn1rpmW1cuCOEO/9bDrFh9RlCvBUAVvkJo+LvPE
         HVhj2LxNVO6T5fsViNPpWywp7Yh5FvF4pE66IhrqYnpFvir/349jQvtIM6UHu+iBjSUE
         ZlmlQvU557Qakaxu36AqnmvVI9R/au305cnb1F/nxzOgRAdM8ddYIeb/P7ZDVK0IXj6N
         WOMQ==
X-Forwarded-Encrypted: i=1; AL+hErFHA+KrKKMXLa8u5Q4WfxWcL4AIopvt9KvJ3e0tLfmVxgiVGvkyv8qu76lbO/ZS7vlNoQAf+XxNQLbD3K4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ben4tECEk+K8N2n+3ycS8b569v2HWawEjTkZ2sLuEtbci00TX
	E7bCIlMjiYxlAuaVzrAJbNE4VS5fyAICBQ7k0q/G1bY9RLHp/EJrpEcg6EqezOOPBGieLK1//iZ
	3tU3lvyPw/kK2rM5+eEyGfvyI693rRZZCfiC2O9kTISTqvwvlBGldtP1EE1+EOGrwB33FzAHWm7
	WaT7nfywPfPBwychH8Xikg0a8FQT9JJ3qpfHNK8CHgxA==
X-Gm-Gg: AYBFou2WbtFTMtYUqCBoYnvGdvjo2SJVMpjdr97A89hHhwh0On+97VfmuLpd8v8r28n
	+tqHqtgc9mjpmJx30LG7RkBJ4auitPslI3Ov6LkQsMeva7PLx73u9SwO/xXG8MgY1hGcczngEP9
	tTRWNKxndA14viLhCcOZf1I9ff5WnPoSy6xOwFa00WWRME9V1Wef7sZsThc6DBctbZ2ondhbQCj
	iO7lcOoxB323b3tOwclgDuhmJ18QcMeBFmaixp0Wy2oSAB39LUKWM/tI4FVvsyTbD9vkMGP61w=
X-Received: by 2002:a05:620a:4381:b0:939:944b:2814 with SMTP id af79cd13be357-94784201bc5mr489628285a.19.1794216956271;
        Mon, 09 Nov 2026 01:35:56 -0800 (PST)
X-Received: by 2002:a05:620a:4381:b0:939:944b:2814 with SMTP id
 af79cd13be357-94784201bc5mr489626285a.19.1794216955763; Mon, 09 Nov 2026
 01:35:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org> <20261107-v4l2-frame-sync-v3-2-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-2-e5bf7073a35d@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:35:44 +0100
X-Gm-Features: AclHuK_kRS6_i-mtkKs6t_W1vede9PNYOgkyMo3-4PjlVizTB2VyTP2OY2wOt6E
Message-ID: <CAFEp6-2L36F=Q59zEHU_6q-atG8=aU4je4OYOF_CTSTjek0VdA@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] media: qcom: camss: Introduce SOF sequence tracking
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfXw/vym94ktTPR
 TazrsPmfFSoG7M7HOlB/thUjZjSyFRLmXXjAAxkP7K9/1/ieAk4NqFUMSDoa/tRYXxVGDTA5W79
 wB5QITERwy/meei5p80uu3bbqWdu18s=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af193fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ySw4tsHwzHfE-Ekmi8kA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JIfI7FEydXm1dThD6eu5k5UKDD96Ofk9
X-Proofpoint-ORIG-GUID: JIfI7FEydXm1dThD6eu5k5UKDD96Ofk9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX0nwLCVmoEGLZ
 tLnmcKCv++do1qtIhcGXTafJAjGwANdOfEMoJsUohPSVJ24zdYL8chS9ZBUO+7hchbmpjnzBy82
 NUOqSjyK+fy365Baszr1dX781BZPex/wJTP/9UCpMFZY46RfisV/9ZBp65yeDluSHn4kEPtRd4n
 dboY1lw7vqsDL5LGw89HsSxdVhdjBFegSkmBiVjhQx/39lB5w7hnsmoAkysBh1T77sIf+2vqxMh
 dmp3BvXTU1re+5PB712gVmlH786p0gj8UywazGvxN8PiVhJ/avmXyz6TcK6//nQO543usW2GTqt
 FgvX3suzm79akNY1xYarDmSxcGmPfHU48RgqTHVdYasziiTYv5TWDlu7O4x/Uy3D2W+kBdpTDzn
 k9tWcXLyvYpmQfL+d06MePoJ3xZfqDOAE1P+WZLMuZ6a71wzq+v8PUyIGiZIjNvWrMXOM85YuB/
 SfhircWSvQK0j+274+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090038

On Sat, Nov 7, 2026 at 2:01=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
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
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++++++++=
+++++-
>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index a00791b00feb7..7f33fb81ca8cc 100644
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
> @@ -778,6 +779,10 @@ static int csid_set_stream(struct v4l2_subdev *sd, i=
nt enable)
>         }
>
>         if (csid->phy.need_vc_update) {
> +               /* Set to -1 as we want to do atomic_inc_return to read *=
/
> +               for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +                       atomic_set(&csid->sof_seq[i], -1);
> +
>                 csid->res->hw_ops->configure_stream(csid, enable);
>                 csid->phy.need_vc_update =3D false;
>         }
> @@ -1316,9 +1321,56 @@ static int csid_link_setup(struct media_entity *en=
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
> +       atomic_inc(&csid->frame_sync_users);
> +
> +       return 0;
> +}
> +
> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> +
> +       atomic_dec(&csid->frame_sync_users);
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
> +       if (!csid->res->frame_sync_en)
> +               return -EINVAL;
> +
> +       return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> +}
> +
> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> +{
> +       struct v4l2_event event =3D {
> +               .type =3D V4L2_EVENT_FRAME_SYNC,
> +               .u.frame_sync.frame_sequence =3D
> +                       atomic_inc_return(&csid->sof_seq[id]),
> +       };
> +
> +       if (atomic_read(&csid->frame_sync_users))
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
> index 5296b10f6bac8..a9d88909d37fc 100644
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
> +       atomic_t frame_sync_users;
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
