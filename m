Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794228985;
	b=Jlubr/TDPB20u65gijUmMeyt1xX+YXCIBfwzP7grh6LzUkIpimgi/7/uqPRvlZpT4hqx
	 WHWkI47cSBmxate8zhex5QDfpR/BTS6eC2zZmjOJisTsd3fIdt2su6xgvf/XfmqvImbLk
	 gYYxRFeiuCBAnqyOy3Hmu4+XMsSZuei8Ij98qLaXRFMuvBNs2LL666V7wMh9JLwaAKujs
	 XyCqF/eX3CLrUwSXbHt753q9ZIbGa4HHH8Md8v/uh6trhUvHpnOoInDjG9XCqj8Lgp+gQ
	 bZ9BuiqzNWOC5ph4hpW3PwGAHmlKRht5wcbiDk7/uUvMvRpaty39HvDxqeW8+mg/wLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=;
	b=lkebmMgeN+/l5lkn2ec9g4X5gHLd5oKeMqNxqER70hs7UL0C7SHEGLIrUD6rpux50uni
	 4MQDnOfgi68cf6+wbjr47y4Esb8c0f5RVLuHJRESy1LmDsu2Df5c+hE8X6NYmweB7iILN
	 w+NHxt24Q9NGcZ+HOy+GSIhRswxNTxbEAT42bQi7zsegDJ+Zzxa00ybzFDTUiDG1zg1sa
	 jhW8Y71R/hDffnrF10s5+H/i0bDEizykKd3BsGbYzzJkuGHiwRLeJLvCuVPkj+ulXGVdL
	 n+E+NabgSwTLEJsVstOQI264f18hp7c5nVm3Cm/PWKFISPBeyPgN+5GzhRC0dB8tdgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GZHRCDNR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLJyUKIt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D308E606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D308E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GZHRCDNR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLJyUKIt
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99utME4131057
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 12:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=; b=GZHRCDNRmwLs1HaR
	aEnt0Bt8GmyRP8tfkk2pxl/tz4eT4kiq0Ew+hnyd5cc5VwdjVIaShGiZy2qdKLK9
	94AcZUZT5jnIfCmFkVFD93w4YorUstdbreUI5BtjWbcnmJ9N0sMrwHyurjstSGVM
	zEVOzP+otwFJa/kZ79JHZa3u8Epgd/bHTzXuGFjk8iOZ9sTLGxkXQnLCIzQCOpWV
	sULZf2JSYAjQKlEej9AI+e5VZnuZn8WfPdPO+Kp/ROl66OHdLPcLoLw7IlYGYPvG
	jd7EQKWSPNt9zNGgDv+J3W4lXQLIfySev3wzR1o2zQkfNxxqSH34WFhd2tsIC88m
	hfkV6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2hqy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:56:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944138ed63fso140643985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794228983; cv=none;
        d=google.com; s=arc-20260327;
        b=Okr62zxhoLTND/dtNgL2CjT0je1CnhuQ1NL04wwWoC1/8gqa4amF2BASXKRN7h0ljY
         uQoKylXY847+4/JhbGUPakiQ0B1rLAx+SqBK1B3dj7RP4jslRoL0wXPHHltadpnuk0d5
         igsBba9Ei7DxLzDqOKm6pIGqSk2lIt1vkDN9U0Fzwh++A6M336y8EtALWIEDvtyqJKWR
         vXLPl9QRHqFi2/tMLJheE4/eGzO0g2qjTzsXNE8YHFAEAaYqUXak5Oux/zTJMBEYHzUb
         O2ZwAmpniastiCTuJdM8N43slg390De24Ba+CC5534vON+VTSUHddv0PsvFIs+zezsY7
         mdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=;
        fh=7ph2auqMXOAerFuD3YEv0Zayuu/X0itAutv8mLwweMw=;
        b=YUxvIUNcYPv7RaEE/3lHCRt+GBM2UBbDdymy7/cekAyl9nh2Rj7eJ/zMLj3U2aX0YR
         50zr/zwBBq8EnPVm3oiNvvrTafz1ASXY7qnCMwIcU8dx6EBcp8DrEHO5cyY3fcGf1SdG
         yjXVeRzUySQnDWIIrnh9P+XVIV0grdFPMpS/ecTwwt42Csv2XKk0b0MXhRq4F+JHR5Mp
         /FuJaBSMBznROQW3Tk9Hqm7qMDvrt9brU33s/yfcNK4k62lBTPrqnj5O5ERbufsH0m0z
         tkaribV6GGcMjZbAvLA3L701+ZyeCVuctXT+bllJV0O0Pl5VNxJBRkuG8xT5opx8QQd7
         mnkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228983; x=1794833783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=;
        b=gLJyUKItZurL5R19QpsemoNX0HxU7Y+G4TOHmG7l3282u4W5bxkhcRsm1Ww1LrUKFR
         8/cA97lGZn0PA30XaDfPUv+w5BDAs39ZLQOATo4prG9JN1uwSw3gukCCj9vMhrYqSaan
         0hi19UIDZitR4tkDnru4zfHZU4KizutmTrGm0AFBeyYCFiEqFLNCsXf8fxQZ+efYeUxU
         /ZV+5aYkUB465w9sPny2drfrAcR4irCfzdFJA2qaEAT16tuZ2uEU89xNGYW0qZ6qDbVL
         CQ3PHiDTAYsBhNTtJI8tDJSQLdLlpUPqxrDEfvA2zaAOtxO8GtE+eDvc9Gw5U167eNTH
         dDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228983; x=1794833783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=;
        b=kS5DoifocsMflBOEhvA2EdrgjJWG9dYVXD5lv0/t/5w9t/IM6eriJ5cbXaBhpEJFOE
         TkDVKY4IPGfzSqlbpeyh48Wo3Wv5zfGwbpFmEZYTu+cYH5pEjN4+/7iPyHPYU6XRLTcM
         MuRREfnQpzpeSDnClKR0CZMOf6LWpeyK539n9mwpkozGbN7Hs4Y7LzvUvNLGOugIm08L
         +j2P7y7ATXrDO0mICjPmd4EEraZnXTde6qLJWv4BtyyrlgQX7mA+RzwDRsn8cZPsCQ6/
         aam2YrwtXjy0+NeVU0SoIgqYrkVW3FqNQ7dlvpkSl8pX53LJWv0mCHIDa3VL4hxawwLF
         7MiQ==
X-Forwarded-Encrypted: i=1; AL+hErFCvFMYUriEsbCzw4vgU2bEqEYK7aBgL/lDPeWQTL1JHr4XgkcoUJ4HUsld6QeScrumXbEYuWs5MaEZDmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/udowO71KngMOx80vs8YhyneKb0OwDkCSq9ElMzMiCDISv9gT
	LWhswC3W2841Q7BxYARZBhWXg0QPgdxoexgWMEVDwbslKT/FIvke3Ly7zE2EsIaXNBnJKSlmTxI
	3tdNRvYjiWilWAbQjBvmiX2MU7UePMlf28nJpgsH2EAGBbUchHbfUp98R25ty+tK+SVH60DS7z+
	uFmFSCcm/y43qzuQlic+QY2jsITTFWxFL+1PleLwFzZfemIhN1olTO
X-Gm-Gg: AYBFou0vUE/28lgpTl6kVTDRtRpQBL83gu+gB3ZfPl2nxK5k63U0Qzz9DV33Ky+HU7s
	aQhMR2VXXRBnqNIEwYC7cIkXzkegjOJ+vRDrtgC7t+/ykHjL7is7rQigl1GPgAseNQgby+m0ph4
	oPYpKKqyDK19LNMCqPT6bZalshgjLfPS4dp9YcgKqvviY3sY7JtExcETNbyxr/2oF6TJukhhunc
	gdNBwty821J7YSpYm95Z0CY0QInyp3fnsKB+z+rGdAvCaZDaKE0Bt9GB6fkZ780yMrnCjlajJA=
X-Received: by 2002:a05:620a:838d:b0:93a:2150:ec06 with SMTP id af79cd13be357-9478422fc8cmr547411585a.31.1794228983100;
        Mon, 09 Nov 2026 04:56:23 -0800 (PST)
X-Received: by 2002:a05:620a:838d:b0:93a:2150:ec06 with SMTP id
 af79cd13be357-9478422fc8cmr547406585a.31.1794228982628; Mon, 09 Nov 2026
 04:56:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br> <20261109112611.94010-4-allan@fatecpompeia.edu.br>
In-Reply-To: <20261109112611.94010-4-allan@fatecpompeia.edu.br>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 13:56:11 +0100
X-Gm-Features: AclHuK_pX5cjcq1dpBPF5s54jQuJQpNTlm-1RA8DMjxVMXKjxJaJCgy01Kzjzr0
Message-ID: <CAFEp6-1Ok1S=t+yuBu6XB8_WZkJ7h1TYr=S+RvpuDzLimoByeg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
To: Allan Siriani <allan@fatecpompeia.edu.br>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1c2f7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=17UmKnwEPstP-2NXI4oA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MSBTYWx0ZWRfX2oJTRzbjS6zT
 dlg0ZJma96/+rrbhfky6RHsjf7XXdmx02ijP4srJpY9WblKM+DeSdE+8Of/FN6Kddd3oCqufTnz
 DEiVaBEhhd50FntwZ2GUzoHVDtTVC05TLKafh2xV2zTOF/nsjyv+PrWSPobrD0EkIs47MrNCg4z
 eo2wZ29A+CiTmVfQRJPSgYD1iyfhOKCNa6OUBcye04HusJ1sXFU3c4U/EfIMLO+xuYtBTQ8o6oD
 SGTBrcFfP3h0YJHCZ5iIXS+sZtv/xh1rXAjOp+mxXS/hyFhtu09xFELvb8D7GPjk6RYNCcVbcTI
 lKOqwE81dXRnfNMMdSj9WM0GnPptt0/EqwswyQxsTiXAXBDWCy+2+vntnn+G0ysaTC8U/4XRdk1
 1pfZmx1Q3+8wbDkTdsG8Blh76GLM2OqKi6VE37sQyZmKkSvkthwN4bU22PyUpXQGmeAICcMI4Vl
 DmUPQFHmwbfEvC8GnLA==
X-Proofpoint-GUID: AGQmQWWpszMBfOzpEuU0jlswysieOAZH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MSBTYWx0ZWRfX0KDTMzeg3LC0
 GZjcpDR2RDHZeFafN3ZAYmeYRmHdm7WmneifqWwCEWMNcsk1QaLl2GtFmdcMso9opkGUIJP3Z7B
 h8Q7mcc2HEHWHyxMzVPmbWFi60WG+Sc=
X-Proofpoint-ORIG-GUID: AGQmQWWpszMBfOzpEuU0jlswysieOAZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090051

On Mon, Nov 9, 2026 at 12:26=E2=80=AFPM Allan Siriani <allan@fatecpompeia.e=
du.br> wrote:
>
> video_stop_streaming() walks the pipeline upstream and calls
> .s_stream(0) on every subdev. It gives up on the first non-zero return,
> without stopping the media pipeline and without returning the queued
> buffers to vb2.
>
> A subdev without .s_stream() returns -ENOIOCTLCMD. video_start_streaming(=
)
> already ignores that, but video_stop_streaming() does not, so with such a
> subdev in the pipeline, e.g. the pixel array entity of the MT9M114 sensor
> driver, every stream off:
>
> - triggers the vb2 WARN about buffers still owned by the driver,
> - leaves the pipeline started, so the next VIDIOC_STREAMON and
>   "media-ctl -r" fail with -EBUSY.
>
> Treat -ENOIOCTLCMD as success, as at stream on, and only log real
> errors, then always stop the pipeline and flush the buffers: a
> .stop_streaming() callback cannot fail and must give back all buffers.
>
> Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stoppin=
g for multiple virtual channels")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 5de6ff5ec..8341666f9 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -313,12 +313,16 @@ static void video_stop_streaming(struct vb2_queue *=
q)
>                 entity =3D pad->entity;
>                 subdev =3D media_entity_to_v4l2_subdev(entity);
>
> +               /*
> +                * Subdevs without .s_stream(), such as a sensor pixel ar=
ray
> +                * entity, return -ENOIOCTLCMD, as at stream on. On a rea=
l error
> +                * keep going: the pipeline must be stopped and the buffe=
rs
> +                * returned to vb2 in any case.
> +                */
>                 ret =3D v4l2_subdev_call(subdev, video, s_stream, 0);
> -
> -               if (ret) {
> -                       dev_err(video->camss->dev, "Video pipeline stop f=
ailed: %d\n", ret);
> -                       return;
> -               }
> +               if (ret && ret !=3D -ENOIOCTLCMD)
> +                       dev_err(video->camss->dev,
> +                               "Failed to stop %s: %d\n", entity->name, =
ret);
>         }
>
>         video_device_pipeline_stop(vdev);
> --
> 2.43.0
>
