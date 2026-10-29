Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286070;
	b=zQ9ADgmFG69BeV3CGg2bvoY7HR+ri3tZNwA+aIfVAd+3uGoLj30VWSje3dLv2RFVHIz3
	 3KPuH3/rs2NteV7ZxpkL3wKMQ0AuxdCXm4/GB025DZMW9s2zJcMuaI9evSzI7zQs97nGG
	 G4JQ6ZTxmWqwjCr54jr2W/UUv66neasYVq1kcKaT2oTSzZmCCxeu3YRcU8F++6TXlxkA3
	 DK8ADmDYpp4gb5qTiVJ1ibn2X/8BeGY3nMZP5vm2ZGEasLbwKdUtiYvGt3+DlOcCRJC9f
	 viRWvyS0OzDXLtgfCXUMCLG2jhZxDW3/RJdqk6S4CSncBkXfC4k2O2pgvl02vuwxhcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=;
	b=jVmwOh7sK43VEnofdpmUF5Sdx4Um5byAqOihKgpVWbz1zrsqnZKcKwqp1kr67csyyxXI
	 OYL2qV/vNhiP7hVeQkKQlVkSqoPvg78Z3sVDha8LYSD4UEvOMMPr1nhKhhbGS9KmtPGWI
	 77BLOoaLy7bB84oxwLZXN9M64Fl+AgLXK1UlnYWOxMOeinR4YD3ee2gTSijkfZX0yXn8H
	 Inhoj5FY7fAJrwuQeinUtQ9rhAROdL4p6w63y0xiSszvM5moho6BpCFHLnYBSEUzVGZTI
	 MnjUCj28EownTlcxvX41ROx+aH6FHafklOzpKgDwnvFT38Xt++8BAXuSlb1UDn2xpuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D3h6ZnZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLzmPHnT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC9D606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC9D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D3h6ZnZP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLzmPHnT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdq9p1147348
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=; b=D3h6ZnZPaYF3lbYG
	blUwG57DFfm8azwZ3tjiyes/cCXXOepQ7KEpiVmDR2F5Q9tz/C3T1AJ+jjUyx04p
	NvYfJp/IwPiUDRqbwkDw9OrBNvQNrMyN+NT5jnZjLVmn6SDd3WHnuWcwMwgSPZxE
	Ps1KKeLOcGe00BSyUS8x4J6ASp3t3V+0ybmCctvmCP1WldtXbw/mWHfVDtrmegJh
	i2uv/tBpvWN72SX7y0dGF8GZe3pvvs36O6uK9Aa1cHue3E5Xi92iW8nOMt1o8xaU
	jfnZpRKx+KGZOT4bhwzL6IxnIDJ0r+xxSX/+BDXyVr00pxoIRlYsjPgKT9NfOTEn
	hUzoPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm44q92ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:01:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so261718985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793286066; cv=none;
        d=google.com; s=arc-20260327;
        b=oeIiifw6+s7lUT4igMLpuBv+2OXU56jR8dFcxYwe/TUBObEjlLybJe9X2WFKHgimD6
         cXKct2qEavpd13HlTAbM66BliBlOSOmoTTkqJWLZdOpHVtMLbTFaVJH5gkBmf779w6LY
         D/rQgo/TfCEs2APZvi0hQ55tlQKTAmOzL8br4CKz+94qx41BT0ia75V4825Ot+rOlRzR
         qxVZwhfyip6IKWufkNmfGlFv/o7FI0wpc5RSafOC7uXPWHkFhXcoACSksZJUgInB0dOq
         7c6Ub2oZEVluzY8eqfGPbFau/xTa1xBdmjeGnhK/W5ZnK6tRM2PqSHFJlCDwf9+tSeKN
         8eyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=;
        fh=usZEiedl+hcu0Ju9Get5Ftb3XjU0GdCalvTLosA5bAU=;
        b=OF7Smpqc7+YuhjfqkkmuJzbyG4AppZBshiXUugP4txgXdmkGyrBBOSSW/eKnnk4GDx
         ankiqH1zHojcIWjVEkXFZ3UQePJrmSr+TCzDgcOa3wcjVMi96T6OerIBprpjww+i6v8D
         2VComAM5YNmghXAML9lDCOoOv2ufWk51WvUG6Wl7lkFDLs7ezlPYBRlI5quyhjQub3ih
         /BOfohsm7DgWgYbT6ine+8Mjeqf5TYyZmipG9HD5KwTpBvXKn+BPPgGuo+mrGbFNnBwW
         pNNVgirloFI/lrrbgPgxsdg4LgsNEsocqQsV9b+L1IA4kt2WSIvtzmDAqplFe/PrI+py
         RaRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793286066; x=1793890866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=;
        b=DLzmPHnTtmHP+Hg3Ewokbi48PkweneldmYzVU9yYYqweMbME/VzPB/dJf5rMSOqnHl
         EhP4QtXHuaHrYEoxhB6wSOMFCaSwJ2iEglO7JpGFjzF1dmJ4+hu1vGPqYnZ82Unj3o93
         u4f9YEmX3VC8DNhDucP8ibIZW9SzHpBG3633dK4FTLA9Pohla62s1SzkNhOrsDyEF4I7
         1hR+7ZRVkbDjq9MW2ptfEf2M4dJ26gDvd4kpuAV9eYw1jR7UI1Hv0Awf9e+QNGaq0Jcf
         VPKmqTAe7EoFS/juvxfCOq6cnvgFVf0UQgcqNcJx6dk6YItNxBebNak5Sa7ywzXpU1bR
         TNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286066; x=1793890866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=;
        b=TEYVLAOv7kqtlItvzNlPKYSxdNf2ViGkSZZbzfAIKUvoCbpM5tZcjZfSKbe/ToZdLR
         5un5sou8J/poxLk3jviyQn1DHl8lweYIH084GQ8R81Ylm28K0IwPQKVm9bapDd3CoEVA
         xje+ZSDpsIPX89YDkIyubd/P8SyouoqF0Zquzc9XRXT1jn4MRKtgAu0JsiLNmCM8kyFF
         mqMfgOmRnT1AYBeeWxQEPQtoOwuf22+v7GJUIAKHAe1WZenZG9oqjFtjrmyC7cg+UX7E
         VmfS1oC6ZFih+HcyTTq4vG8lbnI/PRO8Q7CQqS/w6+jRXc7e1hH07L0E137JUAfKEdOZ
         NW7w==
X-Forwarded-Encrypted: i=1; AKwUvBy8bSEskxik429swNyenWKZaLNmJDDLPVpuFTAPUmzEE83l60yDnS5z/5CX6gngFv1tOb6vgLbqO3ZdtQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe9X95rf+EPa77CFElKQE49TJCR7dVVQkAxgH9IkhneRqOG59D
	4o04qDmutZy/3OqwGqPPWYQRlvtcmxkQkhuSRgJW2F73eEQeMel6dOXZTpaRs4ulMqOjamVw5Fo
	g2ir9kfN5lzoy51wsf8OCK6MaXtKnYwlLJpSx7hmBs+Ni7D55bi8ee+LELnM1CZAf8YPS5p/5Lr
	wilks9oCrnaj2epZCgKUk/xwTmhX8sA/vwYSAOx31ipg==
X-Gm-Gg: AYBFou1YwFZ2gdv9YGAAvV1krvolIxHuewp2H0mBMzp5o2QjE1o3LJzt0prt+ktpMrU
	yKLWqp7BBu9gv0cnaDizMJ9eF9DdaGidTm1oqtDbIULbpiHUmr51s1yqCAnyYWFhjMNt50mohOv
	BZsd0EZ2Q9FU3sW9I9lDqZsuq4ujF2AK3WJn2ruoJdc+2Xm9xf4Vp47jo6lZhdOS6MB8L790cQG
	D/x4u5HZPawg5u9g4ovt4fbjNDo1zsBI2VYwoBHw2T/B05XfQ93IyxKZWHjc46H+QnhfQ76UDD4
X-Received: by 2002:a05:620a:4505:b0:93f:2ed6:1f3a with SMTP id af79cd13be357-94408cc0ba3mr830857285a.49.1793286066097;
        Thu, 29 Oct 2026 08:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:93f:2ed6:1f3a with SMTP id
 af79cd13be357-94408cc0ba3mr830847785a.49.1793286065425; Thu, 29 Oct 2026
 08:01:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn> <20261029123107.28705-4-xiaqinghuan@mail.ustc.edu.cn>
In-Reply-To: <20261029123107.28705-4-xiaqinghuan@mail.ustc.edu.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:00:53 +0100
X-Gm-Features: AclHuK8PQe0DwZ8FBjrux1Zc5_4AUwT8-TJVyvWYZ5AuJYjpyLWFa_T86llNyPA
Message-ID: <CAFEp6-1dRNJ9rr5JWJ0W-XawtE1nby14a-ndCyCxEnd0K=gSYQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: camss: video: stop the subdevices already
 started when a start fails
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1OCBTYWx0ZWRfX9iRgZ6MWuTR8
 HMCHJMZC130MnlyG/ss78hC9aX9lIAO1DRfJevqEFscBTF+78IzQTCb/+iVkzwwc7Zi3uxzt0Qk
 CuGhfZP5Dvtkc3OrHumIrBj8ldNUWt0=
X-Proofpoint-ORIG-GUID: J6zqMeXMOYmOsv9l0nmeap5-lfYE07M_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1OCBTYWx0ZWRfX1XwwX0hpwwoq
 n59jNzdwX6R05gbUIp0G7VzLFWQCeRKdfiXUiXLQIl9eX5hBmEJfgE24XJdrMvUe//UX5T4WwUl
 W5xjeA4lwP79Z90/YC2SWyqYKQ7FdyJd7N8UtxrpB5weRdEoqa/NoRanHtoKwkHUT+DwEE0xN2H
 SUb3yztgwr6/mQhxA85pFcSn4KtlQI+VH4nbObSJLtBv/ICjuWonMPqPAYAkHCewNX7CI467dZw
 PVY1757l/4G33DHR4uVevVJ7lLDASKPtP3wirh2DHDdSasMiO3BoLvh6kL25EdgLk0ZkPS5AVvn
 BfpJ2sHXth5Ev6Hs1RIciFzhmleB18SzUGBV3YUEw3GmC9PqF0g/yWrAi/XIttMkpaLoqUj37pg
 emNgTgRndTUR1RqwhDAiA76AOv2ls0VB9Krh2Qy0JlA3+oNXvOeeTvysiDDlNL2fuvacd9yZM+7
 RImnNj06Mik7ywXsRvg==
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae35fb3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ufGlPyg97rzgKyQT:21 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=hCK_lH1sK9i1C6WOWb8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: J6zqMeXMOYmOsv9l0nmeap5-lfYE07M_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290058

On Thu, Oct 29, 2026 at 1:31=E2=80=AFPM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> When one subdevice fails to start, the ones already started further up th=
e
> pipeline were left streaming, and the next start would try to start them
> again.  Factor the teardown loop out of video_stop_streaming() into
> video_stop_subdevices() and run it from the error path, stopping at the
> subdevice that failed.
>
> While at it, keep stopping the remaining subdevices when one of them fail=
s
> to stop instead of returning early: the pipeline is being torn down, so a
> failure there must not leave the rest running.
>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../media/platform/qcom/camss/camss-video.c   | 60 +++++++++----------
>  1 file changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 027cf024f9..ee9ffd0432 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -265,11 +265,37 @@ static int video_prepare_streaming(struct vb2_queue=
 *q)
>         return ret;
>  }
>
> +/* Stop the started subdevices, excluding the one that failed to start. =
*/
> +static void video_stop_subdevices(struct camss_video *video,
> +                                 struct media_entity *stop)
> +{
> +       struct media_entity *entity =3D &video->vdev.entity;
> +       struct v4l2_subdev *subdev;
> +       struct media_pad *pad;
> +       int ret;
> +
> +       while (entity !=3D stop) {
> +               pad =3D &entity->pads[0];
> +               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +                       break;
> +               pad =3D media_pad_remote_pad_first(pad);
> +               if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +                       break;
> +               entity =3D pad->entity;
> +               if (entity =3D=3D stop)
> +                       break;
> +               subdev =3D media_entity_to_v4l2_subdev(entity);
> +               ret =3D v4l2_subdev_call(subdev, video, s_stream, 0);
> +               if (ret && ret !=3D -ENOIOCTLCMD)
> +                       dev_err(video->camss->dev, "Video pipeline stop f=
ailed: %d\n", ret);
> +       }
> +}
> +

Now you're here, It might also make sense to introduce a generic CAMSS
helper to walk the media graph upstream and start/stop all subdevices
in the pipeline, something along the lines of
camss_video_subdevs_set_stream(.. bool enable).
While doing so, you could leverage more modern framework helpers, such as:
- v4l2_subdev_enable_streams() and v4l2_subdev_disable_streams()
instead of legacy s_stream()
- media_entity_remote_source_pad_unique() to locate the upstream
entity rather than relying on pads[0]

Regards,
Loic

>  static int video_start_streaming(struct vb2_queue *q, unsigned int count=
)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
>         struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> +       struct media_entity *entity =3D &vdev->entity;
>         struct media_pad *pad;
>         struct v4l2_subdev *subdev;
>         int ret;
> @@ -284,7 +310,6 @@ static int video_start_streaming(struct vb2_queue *q,=
 unsigned int count)
>         if (ret < 0)
>                 goto error;
>
> -       entity =3D &vdev->entity;
>         while (1) {
>                 pad =3D &entity->pads[0];
>                 if (!(pad->flags & MEDIA_PAD_FL_SINK))
> @@ -305,6 +330,7 @@ static int video_start_streaming(struct vb2_queue *q,=
 unsigned int count)
>         return 0;
>
>  error:
> +       video_stop_subdevices(video, entity);
>         video_device_pipeline_stop(vdev);
>
>  flush_buffers:
> @@ -316,35 +342,9 @@ static int video_start_streaming(struct vb2_queue *q=
, unsigned int count)
>  static void video_stop_streaming(struct vb2_queue *q)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
> -       struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> -       struct media_pad *pad;
> -       struct v4l2_subdev *subdev;
> -       int ret;
> -
> -       entity =3D &vdev->entity;
> -       while (1) {
> -               pad =3D &entity->pads[0];
> -               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> -                       break;
> -
> -               pad =3D media_pad_remote_pad_first(pad);
> -               if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> -                       break;
> -
> -               entity =3D pad->entity;
> -               subdev =3D media_entity_to_v4l2_subdev(entity);
> -
> -               ret =3D v4l2_subdev_call(subdev, video, s_stream, 0);
> -
> -               if (ret) {
> -                       dev_err(video->camss->dev, "Video pipeline stop f=
ailed: %d\n", ret);
> -                       return;
> -               }
> -       }
> -
> -       video_device_pipeline_stop(vdev);
>
> +       video_stop_subdevices(video, NULL);
> +       video_device_pipeline_stop(&video->vdev);
>         video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
>  }
>
>
