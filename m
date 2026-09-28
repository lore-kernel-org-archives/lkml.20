Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813D644E659
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582805; cv=pass; b=AcSdHDxKXy0tnAMRw+5AdbPEIa6ZVzfWcuH/1Tv3qq1xGfDXfZAX2OOprYpQ2pzVVFMJUcqzNaDvHZqW6dzMlIIdNRlFtbLE49TZiJfB4ewN371CyE/4AvG911Dfaf0P7ZhPMARTJnQqUWFSL1HxPAS3WFj2XdACOMSg7rIdKfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582805; c=relaxed/simple;
	bh=FKEyW8n2U9+lhPaV6HTQ4Z+XZRDk95eDypyZkwsJuw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBIwEdEJOxjSUig6TTKYm2Bf5LdQkT+qbm9/p0qdjQ5x3L33ma+mBlLsqp1rO5X/dBl4wldRACN4NB/LRG57n/Z326kO4gus/0LnnJ6wSGZ2tdVMIKlCwqn/g+Wnqh/EUCYWTqoVa0gAnrtll31X/QxFVJBvYpzrnQEOZuBK+1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ofwyh+C+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcJGRuhh; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ofwyh+C+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcJGRuhh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xT05062702
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xt0oKaJn67L4g+z8bImQqIhwIKc+sBHmTKsF2G0Msd4=; b=Ofwyh+C+8B+f9sv0
	ET4ehK3OF3LjEpRt5MNHvr8J3x4MOPHly0e0qJCSrlMQLMAAlWCjkp1PRM4wAesz
	i9pTJjuJYB9C8KIBQxyVvR4jj6TnT+n6tAS+1DN3zUZoy1tOJNv2AzmH0m1CtBV+
	wwo7nUJGCP1mBPNjXQnW2gI52S8RUDMY7dofnX3PiEtpSVRs9HIoBaAXckeD35u7
	SAVoS2FiPhy5IzzzJFXQFnChRU5uQFV6DXGg8Kow51UYVz7nze53eWChg57gzG2e
	JQbXnTvEyo9BHTIvFyOJ1oGGXH0fluea60eaTZUxF/G+77Mgr82WynoZrPWPLTOy
	QaYqwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt10ceg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:06:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0c7126e7so514439385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790582802; cv=none;
        d=google.com; s=arc-20260327;
        b=hz71jFPkzrjsA8KszY6fyV3D0Idgg41/1SA08Z/ZRVCL0/iOA+g1uZBKOoiDHTNr3w
         pgllLuxoqIFCVMzOeaP6k8gwBU+EqSAvxCgQtxK/Lzh7Mn/ScSdLruEAqTvDXjvFhAhV
         OiuTkQfaSEalPBVsGpQEzoVB2TbP3M9WqGfXsJIrw7x/pPLZCCenhHOugcrBL9FruyUU
         SPjgMlo0bfFxX/xZ10BA0ff10esXwvDc557QSNet8CGDM+NPH1uUzRZ0FT7UkdqTg7p0
         5B+juU9I+SFyzsWhLsi4r18XxFQbBjcwajr4kUWhxEo7TqthiubtYaBRBgEm3LlNn7/o
         KhoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xt0oKaJn67L4g+z8bImQqIhwIKc+sBHmTKsF2G0Msd4=;
        fh=19oksKNBFbJVdP+9bbtlYADJvRBANlXo/+te/8RPNB0=;
        b=B1oujntIAKNqo1zOmCtvlvQQtkesrII5vnAR/gFO+dT/mzpYAEUzYHqSJMMkPcgyUs
         bXSdpO4ucXcP7r52Q5ikssgcvOR6eTM2K7mkG3G8zwdCYscS1PjghHjYlNqRLsaTjTYq
         wYx3bSnTRp1DJMd5MEaA/fYXo9h2t93szGoJbIgJPZzzfA5TXRQ22/Af9gQ1zxU2IXjd
         m6AqBWn/dbd24FqmS4cwPlcvbo+OPpvk/NjPygP5SUiokjBDdyYW2WL0u2OxtFnWfrx3
         smoNcoQ4Gc9bMePE3Ux84cufEk6dDOpkPAykgi92G2Ym80eIjo7bayVjBCe6RV9SzGHz
         Lt6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582802; x=1791187602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xt0oKaJn67L4g+z8bImQqIhwIKc+sBHmTKsF2G0Msd4=;
        b=JcJGRuhhpQ8dEqXTJpu23TYg9KkGbmiDz5OW7q4OqJ4QH8JpdDonKGQ4MX79lmO6Ea
         FRqIu1kHku6S5yDtKgj+vnxZ4fg2z2Rs4WZwHmK5WxbLMBL8zSsCV+P5mEY7cdNmalzL
         RqnxnQChOXBZRYKqqWBjYnhL1hEhYQDnVvdo2xWa+LUnGwd061CuozhcVz73itebnsMe
         zuyRtqHsbWM4rXj1TIKCq9iEsnc0k1ZnCsA73Alf/ZBm/azJyXEcbiT5JCTDUqxHh1v0
         vz4bKKkJ0ZmTuciZ3e39kQl1v4dK4wdPpAbsZkEG0aWoxqpX9HOVsdRdW0fcwIAa18wg
         WEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582802; x=1791187602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xt0oKaJn67L4g+z8bImQqIhwIKc+sBHmTKsF2G0Msd4=;
        b=yZ54SsLRqqT6xdwWhBI8Cusa3vMj17YpJd1wmHxs8Kc+wx0YTXa2tIwzvPdno0jLZe
         nxEM93Fi8iqUtezmj8f+HCCM7KRgVLFr6KM6Yua+Lva66Y/1OrIVcpsZ6WNf+7lfKV/x
         L2nETcCw0cqzLSxsm7rQkmS5LlR1Zzer83a9R095XqruawWifH/e3KVhItIVpE8I7j1Q
         7EVBmocQoRdi8IYHGuewE7QKzbzYu7dStSXhb5kr86rZUHrZ71hQh42m6E+BE6i8NXja
         MHb/OpIs/tG4pkfLo9KyyNNz4ewx2qJxOoZla5tpC8ObO2nTpFKxrnpDZtJGx6Ntfhmc
         XDjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWSZM3LQOAKlWmv+wf7HW9/C+k3pTfQTJrjJjgFoqEWmWdWusY9+ATVboFta1C3sEqQZ9J6BucpYCznWk=@vger.kernel.org
X-Gm-Message-State: AFuF++nDtRw6R08BbnGkVio6GN1k7yzgC5bmJfe/bx5URIV5yLvdnyfP
	ZEjaYhZaYxo/c5Tb9UDLzBz/lFYZ9j5Ex8m35Q2WiaMJHlu6xdJP0OcTj5qFWqHPxVJQEX+gAX5
	Qv/YKTEPMXyujkESzPGI+r9vWeqol+/yK+n/QpJABhjMRjIjzl4Ar3si62cQtNeMkLWWHKmAbHr
	BaZaCYPlvc6ocCirMQWsrR/bhHAMXPsKiRXnmB4zrXOA==
X-Gm-Gg: AYBFou0vXNSWbHL6ZlKR+EHGfMowJvxAY2ER3DBXpTiDAN++XT3rsAXFDwIEsLNsSLQ
	/JC2UwpQ2JkJEwdGeS6yl95j6xOC8o5tuTbv1lwKc++J71jeUW7Cr2QTKRGnp5qh1MFlkbItm0U
	e4On7M2NAxGq0shS6o5Mzx9gypCMcV4h7S+RT/lqtmqqKLxugjXvbIPVwereDGXIaJob5YU/gy+
	U3lXOXFCdWrosnDynVuxjvs1jVm/lhSFVduvHU5Mr0JYt/u/NCIS1jWWSJJTmmkYiU9NJjS+uI=
X-Received: by 2002:a05:620a:a0c6:10b0:93c:8544:6adc with SMTP id af79cd13be357-93c85446be8mr36309585a.18.1790582802136;
        Mon, 28 Sep 2026 01:06:42 -0700 (PDT)
X-Received: by 2002:a05:620a:a0c6:10b0:93c:8544:6adc with SMTP id
 af79cd13be357-93c85446be8mr36307185a.18.1790582801653; Mon, 28 Sep 2026
 01:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928064336.272659-1-hitesh@ebytelogic.com> <20260928064336.272659-5-hitesh@ebytelogic.com>
In-Reply-To: <20260928064336.272659-5-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:06:30 +0200
X-Gm-Features: AclHuK82SWDZ4KKfAyhBngt9t9lHZQRpPUH9qSpCVj0bK_fMYfXekUG5njetwpQ
Message-ID: <CAFEp6-2Ra-JjoZgR0_RPU5mRgZefaWqb1F_HMLxubcSeHbdjzA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: qcom: camss: Take the link frequency from
 the CSI-2 transmitter
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX/NjqBgjC/aVx
 JLI8tcG9aztp5b9bD8zK6voKn9mR6YtES9z3qq4QJGWa7BREPXfPGP2cBxIDi/cK2pmje6C9WQ/
 nDPUXbbxkVhqQ80KQryxJMCnxsK9IGlv0Gedc0V16Tr5PC3L2SQ5GILN3ypttScd+/rCf4EJkgf
 ZTRs2VRVDtZVQNadu7JuqHHOn5OjYcFpJSwF8oDNjHIglr9O40qOI6LFYLp59ES7Hep3M7aCkfO
 wLDN5uavLzWWKLIMFBHDCML17MhnPplfTa6IfLcbwOMwKXIQ52XqghGe2l8y3/+2KxeDMRG8TVZ
 26EqJpTLpEJg2QJTQ/IErALr5kRos30Cik64cwjvDjVk4lzdkpnvFqD3c114beQRuFDziLosTB4
 rzz/4P9ulgSJxvgwlBBs5EfFE75sbZ7Bch+Szl3lZ2FzhVGtsDF1yiQuilHJq/6QicR7P1GZmbO
 ZjuGJxO6O+uKdhhvEfw==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba2013 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=ZovgdgjKAAAA:8 a=kD2hMPwKAu5PM3DgiqcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-ORIG-GUID: 4jMCOcHqXlG9Z4x68NGLLuy7aFQKN8CE
X-Proofpoint-GUID: 4jMCOcHqXlG9Z4x68NGLLuy7aFQKN8CE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX1mtAri+FnHs4
 AZZUhnFI3ctu9IYMGVrJaA0Dr65evYO1QhvWhFFhi3RQsZO0ruI+vD8qtK2lcmglLugBsoxs9MH
 85OWjjcW7Phl+uGUzrHuUPdZjbxRKUY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280032

On Mon, Sep 28, 2026 at 8:44=E2=80=AFAM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> camss_get_link_freq() walks the pipeline up to an entity with the
> MEDIA_ENT_F_CAM_SENSOR function and reads the link frequency there.
> The CSIPHY settle count and the CSID clock are then derived from it.
>
> The frequency the receiver has to be programmed for is the one on the
> CSI-2 bus, which belongs to whatever drives that bus. When the sensor
> is wired straight to the CSIPHY that is the sensor, and the walk gives
> the right answer. When a CSI-2 to CSI-2 bridge sits in between, such
> as a GMSL or FPD-Link deserializer, the bridge re-times the data onto
> its own output at its own rate: it may aggregate several sensors onto
> one link, forward one sensor at a different rate, or generate a test
> pattern with no sensor at all. The sensor's rate is then not what
> arrives at the SoC, and the CSIPHY does not lock.
>
> The walk can also fail before reaching a sensor. A deserializer has
> one sink pad per serial link and the walk always follows pad 0; a
> sensor attached to any other link is never found and streaming is
> refused with "Cannot get CSI2 transmitter's link frequency".
>
> Stop the walk at the first entity that is not a CAMSS receiver, i.e.
> at the external subdev feeding the CSIPHY, and ask that pad with
> v4l2_get_link_freq(). The helper queries the transmitter through
> .get_mbus_config first and falls back to its V4L2_CID_LINK_FREQ and
> V4L2_CID_PIXEL_RATE controls, so a bridge and a bare sensor are both
> handled by the standard mechanism.
>
> For a sensor connected directly to a CSIPHY the transmitter is the
> sensor, so the pad found and the value returned do not change.
> camss_find_sensor_pad() is kept for camss_get_pixel_clock() and the
> frame skip query, which do want the sensor.
>
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 70 +++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 23f3cc30a1..327ac7b280 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4619,24 +4619,82 @@ struct media_pad *camss_find_sensor_pad(struct me=
dia_entity *entity)
>         }
>  }
>
> +/*
> + * camss_is_receiver_subdev - Test whether a subdev is a CAMSS CSI-2 rec=
eiver
> + * @camss: CAMSS device
> + * @sd: Subdevice to test
> + *
> + * Return true for a CSIPHY or CSID belonging to @camss, false for anyth=
ing
> + * else, in particular for the external subdev transmitting to them.
> + */
> +static bool camss_is_receiver_subdev(struct camss *camss,
> +                                    struct v4l2_subdev *sd)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < camss->res->csiphy_num; i++)
> +               if (sd =3D=3D &camss->csiphy[i].subdev)
> +                       return true;
> +
> +       for (i =3D 0; i < camss->res->csid_num; i++)
> +               if (sd =3D=3D &camss->csid[i].subdev)
> +                       return true;
> +
> +       return false;
> +}
> +
> +/*
> + * camss_find_transmitter_pad - Find the pad of the CSI-2 transmitter
> + * @entity: Media entity in the current pipeline
> + *
> + * Walk the pipeline upstream through the CAMSS receiver subdevs and ret=
urn the
> + * source pad of the first entity that is not one of them: the CSI-2
> + * transmitter driving the SoC.
> + *
> + * Return a pointer to the transmitter media pad or NULL if not found
> + */
> +static struct media_pad *camss_find_transmitter_pad(struct media_entity =
*entity)
> +{
> +       struct camss *camss =3D container_of(entity->graph_obj.mdev,
> +                                          struct camss, media_dev);
> +       struct v4l2_subdev *sd;
> +       struct media_pad *pad;
> +
> +       while (1) {
> +               pad =3D &entity->pads[0];
> +               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +                       return NULL;
> +
> +               pad =3D media_pad_remote_pad_first(pad);
> +               if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +                       return NULL;
> +
> +               entity =3D pad->entity;
> +               sd =3D media_entity_to_v4l2_subdev(entity);
> +
> +               if (!camss_is_receiver_subdev(camss, sd))
> +                       return pad;
> +       }
> +}
> +
>  /**
> - * camss_get_link_freq - Get link frequency from sensor
> + * camss_get_link_freq - Get link frequency from the CSI-2 transmitter
>   * @entity: Media entity in the current pipeline
>   * @bpp: Number of bits per pixel for the current format
> - * @lanes: Number of lanes in the link to the sensor
> + * @lanes: Number of lanes in the link to the transmitter
>   *
>   * Return link frequency on success or a negative error code otherwise
>   */
>  s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>                         unsigned int lanes)
>  {
> -       struct media_pad *sensor_pad;
> +       struct media_pad *tx_pad;
>
> -       sensor_pad =3D camss_find_sensor_pad(entity);
> -       if (!sensor_pad)
> +       tx_pad =3D camss_find_transmitter_pad(entity);
> +       if (!tx_pad)
>                 return -ENODEV;
>
> -       return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +       return v4l2_get_link_freq(tx_pad, bpp, 2 * lanes);
>  }
>
>  /*
> --

I think we could even simply replacing/refactoring
camss_find_sensor_pad() with camss_find_transmitter_pad()?
