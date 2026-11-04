Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793830319;
	b=L5vo0tREkAoWj3rKKjvdJ4ylFNRUZCrRP2wHtDib1DNZSPya+tlbicXaQrVsNPll4J7m
	 xFbfQEW3V7nHqgtgthuI1bLWyvkOtc/5V4ViXOmebP862CTZp5fS4hc8Pls25g2QX2HJa
	 y2GdSu1cTvlX0s21XmUsOwqKp5kId5ZuJPuiAj8KmFdiTQNOKoMSul5sewdt3BFbVVUzb
	 2vbxlK2MBKLa0O8GSPPaA8AqZj/ht69xJMPMrJgNKtYGJPlhuxeV68EjK9lLPbARJx3tg
	 u6w/HJNFdHnLO3jupjxK4bMboBRlxpz0TP+pBHtMWa+4CV4gpvw0zirQxMXsc/Q7MLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830319;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=;
	b=BNB0mfVoG2CKKf/BOZ1RewRRRGvboYy7NzL0ra9EfxYHyTncoH77tA8exW1ZYCj230Bz
	 n+G4u3mSDc4lu+1/tkxMReguEVEguM40CQS4N0bqToxXyZzqNuO2L4yxngNQ4tWlnWDXx
	 +JKGVGTeGFHTJK+qz03ef/fXXc//7r8p4IlBf1S8UwTCiGUonKlPE7NWbWpPkuhubgPX5
	 vb6kQsuH3NJ3uFheywpyDBmprgVaAf/wdPCuXGUxYAICafubcu1fR/ksu6rmwLMoVNkFl
	 15rafKOceY/4oN112V7h4Vo1A28bF8tri7mkfuAtHU5Emfky1USSj/4joz5PHoRmUjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h70xA2I1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QnfmsgFU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C40606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C40606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h70xA2I1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QnfmsgFU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4LiOxw2828735
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 22:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=; b=h7
	0xA2I1xOUhDBkTTwFd3Y2vgiA3FBpt8z0GVTxo5Z80TEHVxaIdPqt50JXBrFoFw4
	+YhsMcPobW7taryWOxNEkhkusXUyIv4SOjBq9JwJDKMCvlJn3eDTdFUDIJp+seHH
	jzBPDEV+a+yyLz//eNdZ4wO2XNMroQjPZv3WVbXlqyUC+osDrBP9moQwgu2eVOw/
	ji1SVFa4f1GADGy9FBZ9eSxZnZqopFznMAfgIC7XF4Ms/Pl05P1aiZO1Byqr6UVW
	4X7RSomoUm0190v1+hFRbfa7JT9g1w43gABb6WtelVG7zjGzyyqaD/+I6+kg4oL9
	5BAC0jq6OgjIJ4SGlCpQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284u1jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:11:58 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6dd1142710fso2117104eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:11:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793830316; cv=none;
        d=google.com; s=arc-20260327;
        b=TEsuoQC1+lGJe9hY58Y2t8USdw209cuXluN9DbHkGX6z5034MRpbNX5ZFJ+nHxqwsy
         NZfbGU/5ti3ymynMCBQ46lVEO93tTyV0ERRF5YmLDLfyvfOzueJov4kc1G0/ikoE7F0D
         UhM6roVGX32EZ40/6CqdF/ULC4yjMiqHjmWn+rsmn0fCfmlOjv7rokoHJclgsy/0hjVN
         JKPTqNmJ1qrnMDX9y9yeL6UMMXtMLvp5nJDKGgkknvXt9mWQIJkuIBZnCMRZiax3cW26
         bNLPXcSr8sECLyxqcOXKVqXfKjudSpefyqSiD2skkRL1qRVpTCiFfFE1R7ru7tSt0U+1
         PQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=;
        fh=8wDKH27HKmy9z7G02T4ZMGKXHf7SJoZJDyG96E7gZIg=;
        b=IkMlFBfEXOLNj4eoqYPCjCR3NNIiiJgg8021Wjth/sFQCpTVJQhIVSgLQ/bvWV5SUB
         w6jtduuXbViXWQE5WSZiLIijZfHXLiuPSHk7q3yCWQDcfxs4Sqye7bm/htY3bUb+qRJI
         4DUvf933gHp9CgjaBf3U2unKGPyb49Hej9xSASIOpYIv6iZqYjt+4RFRYU8Q09E6dIgS
         yeyjzehpZw+N6V7K8fsOhPjrMsYWSZ1hDjtDXVQXNnyGr4+TiBAnFlv6TMpWJaaUx+zV
         xzHVQyeFKpUC2163yyyLnqf+ha/b2mx2orzFZLSr//B8y5NnwCXND+H6ZQb0RbyBWd8S
         ccqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793830316; x=1794435116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=;
        b=QnfmsgFUjMlff8nr6ZBqL6J3ZKh1gtmaQQ/Is1qws8uLXJ8fGrbnlyPy4U1EbYGCAj
         OZaxUKJsfq4UA3rObUonLn2IT8zEZm5h8QxSSydV3VGOU+NGhkmM86/rbiP8z4F4JoLf
         UoomRDMUhmr3c2cySC1AkVfa0oSBXevqQs1aqdoMWuPMnVINlVjI23IiNetm9YUw3Qx+
         eSrKeb0q2W41OkyZbg/lLhqYJUYV40UDJi01R8nyhNoXp9PRqflppKXIRTtG2QQcKaGw
         3iKKSmosibd1vrc27DQvu1onA11STrMBl9TaFyiWKJxq2yxbhjpZc0GWZF8I94YhEDDd
         WBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830316; x=1794435116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiT1btz924HjQNzzWl70B3xvzB6Cqt62IjRgfUiOL4Y=;
        b=f29hti0Uez8dMF5V1O9k16t9bLFQ/cilMCnkUYlg6MadSwwKVjRNMTW6qq+L778Fbv
         KusXq850cjEG506rmrpHxKCUlspvfu1BUdQthse17cdsVTuu7TSTHdqHvTOQ0nTznOQs
         T/WLcVrimh0qRu/dPHa4C9kD6zXKauCKg1i4z1E3WZHuUF4uY5Mx80a8ZvoXUBG50GYf
         M5OASaaFeE0pZMIQtX6sFjVSLsED6scxQ1sx/MFuDoh2NoDwqcLdEPFCFuJ79RIThwaQ
         qrZbMRbtMvnjxv0DEXAhNAJxMGUVOROACjTqHh65sd2AhcyOCPxjpfD3YuWxu6/b9zz6
         fTmA==
X-Forwarded-Encrypted: i=1; AKwUvByOl3izJpPAAOnICLZWNn6ngBwj4yV8gZwhv+9Gy+jd3XhplYHkV3SAlH4/DBnmVT38xEN5VkV8W/PTZ2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+8xcLnoGFFUAyyFAKSLFD3YtAGmYcuLNkO2k7o21E0NZJLNPo
	wbETk+C/sAluHR+oGAStE37Rx1VykGc+vxTGZ9PFiSkVRvP7I9tK2dP0vNSSdma6GwuRcw77RFN
	fz9/gms84xVGFEEn8s76nblJ8faKvW7kw60EH2Qq6aqF/9aD0QYV2y9415HeTmJ060qAWWnytO4
	nkBVgsRFlRG0M54wnAs1aushoF1Dn7iFmbab3CBbYDuw==
X-Gm-Gg: AYBFou3j094veOUrOP3eT18TG8uUfObXkk0u2h1gMDkZv/UdJv+Qm4v7ThpBAeMTQ+3
	DDXC1qnZjd0GvJfOUOjCm/JVedexw9rfKA1+ldnaMIhPXAPMx/j5O9mYG7kPz3eIKE3YOcdTv8t
	kB99JHc4gq2eUoBldD4gAPqFZZLdAIPwPWx3mCOhHWeiLkhL5Kkl/iAY3mxFxsx5dkZmHt2lIJ2
	+hzyjR/QJV6plXab4hPDg==
X-Received: by 2002:a05:6820:168c:b0:702:efc4:807d with SMTP id 006d021491bc7-714f29eed8dmr10906938eaf.49.1793830315869;
        Wed, 04 Nov 2026 14:11:55 -0800 (PST)
X-Received: by 2002:a05:6820:168c:b0:702:efc4:807d with SMTP id
 006d021491bc7-714f29eed8dmr10906914eaf.49.1793830315450; Wed, 04 Nov 2026
 14:11:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com> <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com>
In-Reply-To: <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:11:42 -0800
X-Gm-Features: AclHuK-PejnPAeVcWn1rFgQSugIaafHtbuWuLOPuri8tnD2WASiqu_5BlPlNCuI
Message-ID: <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
To: Robert Mader <robert.mader@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aebadae cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=guYwWtrNydk0MfZTwrkA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: _bqtUwTRGegWEgaSwCD15nGQ4EZcA--P
X-Proofpoint-GUID: _bqtUwTRGegWEgaSwCD15nGQ4EZcA--P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA4OCBTYWx0ZWRfX8JqlpOTytx1T
 70fm/p+wB4ScKRjQFiNnM9I4csZAepC6li0rwojUU0A2DSacWvxTYu5BT9CmwKVjwG8o30SCInO
 lhS1AzxuOBzn6O5j5o6PWJQud8g0LUpwwAF5nXYMUQCti3V9H+WlnntEwhnzTXOlkWar+mHO+BM
 fhpkNW8JcEJ1ncOblerbGDXIknSthtAtCTYHKjU9PyCrIW0RhJ0af7iU5M467rQMlXJDPRZ2vt7
 nGYMbiYzM21GjIAJNMTT1JrUr+vgCrgT3LeQFysflqDIlFjRuHzyBIbrjsrIHJhR+AG7nMwx5oC
 ONBQ1VDUyh9YG7HOil9okStBjTCyOY9A9AOqMDUhgA17GMveRfvRdC0wE/pUG3GySXO8W0ILkuJ
 jYotUl5uijZxkdGTx/1JsEZSTTfnd1BnqXR3+ZYC+MH8twF4xRcB2Ys2GDnlsQGfc8BWJekNL5U
 /YxbV4cuCsyNqMiv+Qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA4OCBTYWx0ZWRfX3pFy/EWu6KCF
 rjVKmbjYxHeZ53qivHmd4mLiih/N/n71hFvNOinyVq4iZsO+0zYLcxb8qibJNRwuoxN7NlvAfqf
 IrBMb/yDioUcaC+pPbn2j/43lPjg4+c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040088

On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.mader@collabor=
a.com> wrote:
>
> Nice, very happy to see the series!
>
> On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > The comment describing the QC10C buffer layout calls it a compressed
> > P010. It is not:
>
> If I'm not mistaken the display engine / the DRM side (including Mesa)
> describes it as P010+QCOM_COMPRESSED as well, and so does my pending
> Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire that
> up everywhere etc. OTOH if we want to keep the DRM side as is, then the
> comment should reflect that, IMO.

IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
as distinct formats, both with and without UBWC.  I'm not sure if the
same is true on video side but P010+UBWC was never exposed, or if it
truely only supports linear P010 and UBWC TP10.

BR,
-R

> Best regards,
>
> Robert
>
> 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/81=
95
>
> > P010 stores each sample in 16 bits, QC10C packs three
> > 10-bit samples in each 32-bit word, which is what the stride computed
> > below (width * 4 / 3) assumes. Name the format correctly.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/m=
edia/platform/qcom/iris/iris_buffer.c
> > index eb8de60c1177..ec2bf2a2d953 100644
> > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_i=
nst *inst)
> >
> >   /*
> >    * QC10C:
> > - * UBWC-compressed format for P010.
> > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packed in=
 32 bits.
> >    * Contains 4 planes in the following order -
> >    * (A) Y_Meta_Plane
> >    * (B) Y_UBWC_Plane
> >
