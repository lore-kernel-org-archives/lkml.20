Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793611344;
	b=1clR8jzpPwECeYpZMZ9nn5R/fRrAvTDqAyZ10hlPh0KmJNLfld9t/WfVRFtBAjxrBp3o
	 aKUDOFmIHZJniM9ecmiwmY9Zxg1UTBGNjPBKxuR2NzyHGE+1bKY3AVZZe/hnxOncbsi6V
	 QirDXdC+3WOnDaQqFGj3MuGug2OrmoFEVqpmBTAfibDvFbI8Mxm5ttMpLixbA7JEYe0oG
	 PCTGCMTcwHl6iVroGeGNzdN6LQUY/6Z39m+G5+EliZYCWfanS4nZUJD99EAEDD45LZCyG
	 RBHMXeAM1Kv74pn/7D8N/goakbgXxotZ+8JKi7BITAJKUeo4fyYLcYyG+6i4WtuGUlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=;
	b=zPMIXcQJY5yoFNwjadwrO19X9DxRg2L5LOcfNG3NLqZ177czKobaC+VB/izO1Gg6w/iN
	 RrgnBup9n0cRHWnMIRvmjJw1ElcIIf5U6yuAwWdvP2UK4OZmeUvLicIjRaDvV73BZHOVS
	 n2JfDMAHLqkWb/1a9SXxgOji32UTofbIfzimVXGY9fFb4r+cHd0yoBltZYgrU/dVkNYql
	 x5PNzF7MYHbej3pNfWDJnjKHKfgID4iTodHzTzaSoNA4INlCgnqFkfs3Cyw56e5/VB6Qm
	 bQcaRYCMqiCo3MBWHt6L+DiSYJE7B774EH77dpoBOWiPzvi1dQMrvIaKTsA5DEm974Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gMaMoSoe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8IT2CZH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B87606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B87606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gMaMoSoe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8IT2CZH
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A5pM260605
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=; b=gMaMoSoeQgqsgFv1
	/CctkgosPUXCWgDBD9gLv66iZFQgeiM+cuGtVMbnoBflkS6rjquO8F3/2Q4pqYKc
	x+UH0n/rMHsvuXld3O9vI+d7TUOv7D5QSlXeEu0P8LztqIFRAtJ8RBS1JEe7RSS/
	81FzD7jboIH/5GbXPhHRY1dQxtWQhiOc1TgJ/njxbVvf6zR6uM6wppb1QdZsKLQe
	uZ0J1OXzQVatEfEZo3YasAecugdrTRI8rmC3z/8Pa7M3bx2BHCGRUnT5LAUK2DMA
	ARN1JF3zV+LQ7LpAGiP+Jv8E5kF6tV1K4X0pWKjTWYs4QoEftsWjOiYvdoIxmWCT
	fq3P8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvr267-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:22:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9441113670dso658561385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:22:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793611342; cv=none;
        d=google.com; s=arc-20260327;
        b=P6mu1R0FCUGLM3ouDYdLxustTbuBUPgIotq/DRn/sQDODI/7f5v2nJg93OO0qHPsCi
         nQHfzdi7demWl+iYDtd7fVCJKqg+vCxafpU2oudAcxf0Voy0tP1jEo7L5INcvAL8PPjY
         I32eZ4JDZkVfBSOa+udCpE8NP4mUydimBxg0KToo+ostuQ6HV7tMB4nXHn1kWCpZVMM+
         SPDmcGswi5NQ4AMb4idI3Cv3aw2QQJNFNXOsZgbIykE3BsR0pwX0SH4L8MVDBMkfRTG8
         SEiyDlTBDhIUaCdsuSqmUvB91BdGbPhgxoIoqe5B5G/Kpqn+P7aLWLaKcEZSWy+1yZJ6
         g3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=;
        fh=XEa4JdBesYpcS0EO6pBFIXgi6bZLquPFxbUanLSDIBw=;
        b=revYXgYgIBU4M94eQaBoMEUX/J6rdhNjGrtjvYMDlgAuKbNCeVKYfYxZW5k3k8yIv1
         rW+YU5h03clb5CbfMfpi2qszj1Aw6xyv7cGrtjoc53qvcnxfMKl6vXQNSnKcG57HVWZ8
         faL/1ATJGz3DQDbDir3ziou50Awu7QEMZ7jb6k276/8qh79+vz8/7dH1LPSxm1AWTh//
         Zb0CBKVEyb8zIMIHioUOcu8OHFnQdPJNtmogwE8Vq326KrHUEL7wMkivPRJb5UPVxpEq
         7pOFdFMDdVuxSaf+95DBGgCQvtgqo3Zxo8jHgFMGF6E0a/pDKQYkRMKvhEy6SYkg+q+k
         U7lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611342; x=1794216142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=;
        b=L8IT2CZHstffVikBa2AjgYmHu63nzOMiwE2su0RLMkKHNmzV3el5a7u7vxOVk37lMR
         El6tZoF9IXk8YJ0sVVf0vu6/lUw30QmoZuLY/vv89TXXHnUQp3Op5gitXFrGz25EXsjF
         JhP88VFwvDwY7X1RpkIoiAS8pIqtYxKG2pYkQvqTJlheslNr8eWPkmB6w8JvYl2SbXcy
         Zty3fdBlRUFexXhtMcmIFzCZZLZCbAnZeE7KCW99QDTdxp6+KYzgZPOaNMON5MvZKuCx
         oHs/SsQqwAp5dZuwtpoEjt69j7K0z3lBlrfKt49H3kPUabUPa+kdo6eyUp6kvpLQ/zFx
         NsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611342; x=1794216142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=;
        b=Yzau3bAfdsebKKZmYbdAumCm7k9lQcyXCybFIil4gJ1XgFFRf+gnnOXSdb5luahVNc
         pkijjh1/6WlERylxPR+JEAZFD4oTru8V7QfAyNlIFINP5wGilDLusgMz8vS3rfimwQ58
         MiAFsaSzy8N1ksZCftQH6Nqfqx47O8lYC9fKFFrOZzhE7N1IJ7AtM9FLmaCEiYeLuxAN
         B0ijkxukLC4ynhMs80vev/TGJkDgeg7hRZ3cV+wNd0ghirdDfGgmANOMn3OL+yMoUT0z
         4OVjnPN8r/WMY85ddcN+oZ0XlmPfdbQ1kcuaP3xxjyryspGqptZQN2aaGdN3RGhL4Wz6
         4I4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwaOxGWiL9odR8OMIbtFQGsT34strYH7qdzonDy0rSJVu1lNrCJWAbxEirv0OJ+k2WnvL3kdQoTnB3pM7I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQPR8a/oapR57Vn1+5ngt3KZmYlSsfXuneqai4Xq6tsqlBsgJX
	fet821/ouLv2H5OJK0y4XzMSj8Ja0XnSKDXUjA0Ih90Kmu40R/VP3e4fZuSZMc4ib/Jczj4qZPl
	oo5kEmJwpBJrx0IMO8ccjzuOBFyyQfK/P8TJvHhSmp02GHoesSWEzSWG5rwKPP9S5KpCLwUjLb0
	kaM31o4Vwvict7Y8+YzZWFj2eD/wV++Ob4qsV/e7MjSg==
X-Gm-Gg: AYBFou0ufIUhi+WjdmvDd62FsIuDUGs12HnJzcrB//YobL3ltoKbRMFUB6GTu3Ew2pH
	fuKrVtTq2EAF3uigo4xnJMrTaqxWV55oGq4Gat6cFyFsOQR3tZn9+ATTyPaSOtESUU/o9b9qdq7
	/FY0fNt0R+lji46qrrhfiJuarYBYhDwCUgIqgJAQux5fXOKk2qiS0ui6OeQBFOlu5fX+y6zpZoR
	f74VXx7vpvaTY8/RQUl7+WsRwsU/I1dMbc2/WcP0BiIwuHuU2k9ioJEPvgPNyy9mhJNSxC9eoQ=
X-Received: by 2002:a05:620a:318a:b0:93c:6738:c2c1 with SMTP id af79cd13be357-9442158805dmr1513584285a.2.1793611342291;
        Mon, 02 Nov 2026 01:22:22 -0800 (PST)
X-Received: by 2002:a05:620a:318a:b0:93c:6738:c2c1 with SMTP id
 af79cd13be357-9442158805dmr1513582385a.2.1793611341849; Mon, 02 Nov 2026
 01:22:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031041154.308030-1-xiaqinghuan@mail.ustc.edu.cn> <20261031041154.308030-3-xiaqinghuan@mail.ustc.edu.cn>
In-Reply-To: <20261031041154.308030-3-xiaqinghuan@mail.ustc.edu.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:22:10 +0100
X-Gm-Features: AclHuK-lrKv7QKtCbq49GJ8Hz8MVkUY0WCwRGtxP81qzPU50sKw5_37IniqXuGk
Message-ID: <CAFEp6-2PjOg6wJ5SotsdGkkOvqeDHLbZo8w9s746LgfJTnpfvw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: camss: video: factor pipeline stream on/off
 into a helper
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8564f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=VJ0GMoCyF0DcjFHwqmgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 1eKRnYsWyQyLV26t5YgO0MYYNAFGDlhe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX41HbmNkYGiP4
 uexUZ8iK2TiyJ0048bHdPXNkRAyCSFncrxDVk40wAeCCHToEowOmNYHYKZUrDIoZ+ny/6qLNsgY
 Ly/W8qmSLkNuxxl2oTxn2FC4j0uSodU=
X-Proofpoint-ORIG-GUID: 1eKRnYsWyQyLV26t5YgO0MYYNAFGDlhe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX9H2Q+5sdphQ3
 +NNh1hxSNF+aBboAAsxa2O/cumJ5Q+3OmR3M2o7poJFWJKAbcW1ou44pW790rcUI9wsYAd4Ai7A
 5pyvLfKoDE/NKz7NVDt+38qsJMZuCniua4BZ+m3jIoGZr6+UqMJtjh5bSo8GMlNZxU6wTMytAVz
 Bc9hARCM4RM6pWVTbfjBgxWiZFOflki3S+B70KyyYHA24shiM2EFzSy0F7RNCKEPWiCFGOKKpIv
 5IryqUHEdJabIXgd5mtEzMZ0Fh7FheIh5oi3jkoScx6DYxoLXuy0su6dFQ8Zec91bsQ4I4DNFwu
 zkONz/2ldXw9UtWa+wm58ta2ht50/8DhvfuWIAxoUcUJ2gS78jwK+V1/UwFGQH10lpDidj3vWHD
 RcC/LMeGqXvH3cTY0pQyPyjWeoiJ24pkku8s90T41zymU9wOve3190SSMt+BFPOjj0zT/0ETQGx
 W3GTE9n0cz4Cf7UVeBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020037

On Sat, Oct 31, 2026 at 5:11=E2=80=AFAM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> When one subdevice fails to start, the ones already started further up th=
e
> pipeline were left streaming, and the next start would try to start them
> again.  video_stop_streaming() returned early on the first subdevice that
> failed to stop, leaving the rest running while the pipeline was torn down=
.
>
> Factor the walk into camss_video_subdevs_set_stream(video, bool), used by
> both start and stop.  A start error now unwinds the partial start by
> disabling the pipeline again; streams already in the requested state repo=
rt
> -EALREADY, so the subdevice that failed to start (never marked enabled) a=
nd
> the ones above it (never started) are left untouched.
>
> Locate each subdevice source pad with
> media_entity_remote_source_pad_unique() instead of assuming pads[0], and
> toggle it with v4l2_subdev_enable_streams() and
> v4l2_subdev_disable_streams() instead of the legacy .s_stream() call; the
> camss subdevices only implement .s_stream() so the helpers fall back to i=
t.

So the patch looks better now. However, after looking at
media_entity_remote_source_pad_unique(), it appears that it returns an
error when more than one source link is enabled.

This works with the current driver design, but Bryan may want to take
this into account for his pixel-path support series, as the VFE
subdevice could eventually have multiple active source links (for
example, from both CSID and Parameters).

So the change looks good to me, but I'll leave it to Bryan to decide
whether we should merge it as-is or address that future use case now.

Regards,
Loic

>
> Suggested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../media/platform/qcom/camss/camss-video.c   | 109 +++++++++++-------
>  1 file changed, 65 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6f13..9a633ca066 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -249,13 +249,66 @@ static int video_prepare_streaming(struct vb2_queue=
 *q)
>         return ret;
>  }
>
> +/*
> + * camss_video_subdevs_set_stream() - Enable or disable a video pipeline
> + * @video: The video node whose pipeline is toggled
> + * @enable: true to start the subdevices, false to stop them
> + *
> + * Walk the media pipeline upstream from the video node and toggle the s=
tream on
> + * each subdevice.  Each subdevice source pad is located with
> + * media_entity_remote_source_pad_unique() instead of assuming pads[0], =
and the
> + * stream is toggled with v4l2_subdev_enable_streams()/
> + * v4l2_subdev_disable_streams() rather than the legacy .s_stream() call=
.  The
> + * camss subdevices only implement .s_stream(), so the helpers fall back=
 to it.
> + *
> + * A stream that is already in the requested state reports -EALREADY.  O=
n the
> + * teardown path this simply skips subdevices that were never started, s=
o a
> + * partially started pipeline is unwound by disabling it again: the subd=
evice
> + * that failed to start was not marked enabled and is left untouched.  A
> + * subdevice without a streaming operation reports -ENOIOCTLCMD, which i=
s
> + * ignored here to match the previous .s_stream() call sites.
> + *
> + * Return: 0 on success, or the error code of the first subdevice that f=
ailed.
> + */
> +static int camss_video_subdevs_set_stream(struct camss_video *video,
> +                                         bool enable)
> +{
> +       struct media_entity *entity =3D &video->vdev.entity;
> +
> +       while (1) {
> +               struct media_pad *pad;
> +               struct v4l2_subdev *subdev;
> +               int ret;
> +
> +               pad =3D media_entity_remote_source_pad_unique(entity);
> +               if (IS_ERR(pad))
> +                       break;
> +
> +               if (!is_media_entity_v4l2_subdev(pad->entity))
> +                       break;
> +
> +               subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> +
> +               if (enable)
> +                       ret =3D v4l2_subdev_enable_streams(subdev, pad->i=
ndex,
> +                                                        BIT_ULL(0));
> +               else
> +                       ret =3D v4l2_subdev_disable_streams(subdev, pad->=
index,
> +                                                         BIT_ULL(0));
> +
> +               if (ret && ret !=3D -EALREADY && ret !=3D -ENOIOCTLCMD)
> +                       return ret;
> +
> +               entity =3D pad->entity;
> +       }
> +
> +       return 0;
> +}
> +
>  static int video_start_streaming(struct vb2_queue *q, unsigned int count=
)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
>         struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> -       struct media_pad *pad;
> -       struct v4l2_subdev *subdev;
>         int ret;
>
>         ret =3D video_device_pipeline_alloc_start(vdev);
> @@ -268,22 +321,11 @@ static int video_start_streaming(struct vb2_queue *=
q, unsigned int count)
>         if (ret < 0)
>                 goto error;
>
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
> -               ret =3D v4l2_subdev_call(subdev, video, s_stream, 1);
> -               if (ret < 0 && ret !=3D -ENOIOCTLCMD)
> -                       goto error;
> +       ret =3D camss_video_subdevs_set_stream(video, true);
> +       if (ret < 0) {
> +               camss_video_subdevs_set_stream(video, false);
> +               dev_err(video->camss->dev, "Video pipeline start failed: =
%d\n", ret);
> +               goto error;
>         }
>
>         return 0;
> @@ -300,34 +342,13 @@ static int video_start_streaming(struct vb2_queue *=
q, unsigned int count)
>  static void video_stop_streaming(struct vb2_queue *q)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
> -       struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> -       struct media_pad *pad;
> -       struct v4l2_subdev *subdev;
>         int ret;
>
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
> +       ret =3D camss_video_subdevs_set_stream(video, false);
> +       if (ret < 0)
> +               dev_err(video->camss->dev, "Video pipeline stop failed: %=
d\n", ret);
>
> -       video_device_pipeline_stop(vdev);
> +       video_device_pipeline_stop(&video->vdev);
>
>         video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
>  }
> --
> 2.53.0
>
