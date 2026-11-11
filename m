Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403864;
	b=XcUtTGmchhkXCfFEghvJL4caSaTGQ00z6D8CdfslWYX2xAdOXNTlEffbCteZtNDmb6Kx
	 LqWod5MXbBObGhh3CsEXbi9zIlbSRQKbVF9BEbq+Sq/ikcIcuPB8Srwx1HqWymcpifSFp
	 oJ721xboffKu+hs+hBNQv6tLvVEgdKRzcX/l3c+P0r5LNgoUP7KrNPZjpTAqjhH1munAw
	 VNBLC5oQN7myRd2OLDcIxtPsluaYnzY/K89Aip8PMlYe+qOKzSN06nKBMgnsR74wbllkN
	 KewUdcgiBDa1jGrObxuwfKajdm/cRYd1SgHK8FZMW1Y7LRJo+ybZ1cGS8Q4I+MFTTAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dxj1xubJ7YfRpFCHJdR6Gg9jjbHeiVgUIcmm1aUVPG8=;
	b=AchrsIbY/jVt1cLqMJcCIqdqXJaA7RWcBeYQP7JItcAx+rdxhobxVgtQOT11YjA6H6cS
	 765a9pUjq6EBP0ieYg5Maen7R+5nE60cvVHLuCP9cOUcDTEFHYfJqmIH6m7zB1SZPSwg8
	 o/iM8U/Ub469inC1kFB8gnddIDUVtf5YFkpLzW+tSmQrIoUQ00t9qp2/4S/tRfrCvWpez
	 kqR9XpMrI9nYsUT3t/SYNDsVq+C8yxJpEqaUwRM37EYEXjhkFXAFOyBPVeC07z7Rhql+C
	 8zI1Fw4a3FVydEx0rINVMzVfuCbROrCp1HWgnYwNleXSmbCP59NRAVT52Q4dEMz2Zug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRXd5l64;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apsjnk2X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCFB606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCCFB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRXd5l64;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apsjnk2X
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZNC43292404
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dxj1xubJ7YfRpFCHJdR6Gg9j
	jbHeiVgUIcmm1aUVPG8=; b=bRXd5l64IZARXIj0DgPF2TFExBKvqmSU/EfTGK+R
	QtBw4xh5sWHUL8WVwnLKYlCH631UjzHdjNsSEAbwp+htcZDHmEu+Q2tCb18riIZr
	GiTy/zm3fAK62HxVlUhA0pKJwdoiGSmz51Pdw9cHgmXtBUn3kNemUPNWTcss1/cN
	AksXqgOEpwD91tKkap43R3DmCByoBBIdvCNYh0l+pMbgLpvdO8dy4v4hZY2dRIiR
	1rS8NnyfykdNMYSZVEJVONrl2UMfwv912qibCV5zr1ydD6jHqN4bd6t47clIfey5
	B4ch6JiMdZmsNV5TSamWs0R2W85oh08/mquyi0u7HobOPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2nxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:31:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943e8ff02d0so350085085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403862; x=1795008662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dxj1xubJ7YfRpFCHJdR6Gg9jjbHeiVgUIcmm1aUVPG8=;
        b=apsjnk2Xq0usWokUuSgUuAAlj0PLSJsf2x3/E+ZqGoq7d2wvdgn+/60WNyYVxi9Y0D
         fGLj4+da6NhesEcgIi3mZ/qZ9I737llHHRQJ9tGrb2JckBTQCvbjCPbS8niteE0VyOqF
         VxS28GgUSipWGpkFBqNJxGHFJ99kTpWBzIAq/SJzy4haCbol8gDIARfqKh68q+Tesmsx
         PropQKjru7WZM4ZJtwAbjDUKGP+Yaqh9Gq8vtA3LOjmfN8FifV9VtHFam6jWVV8w660R
         anSLXf/yrUgIWJVIYjAsjYLwJpodBsdIGTX+WGT0/OJdS+Kkhc+zrIwByv0y0h+2ffep
         xWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403862; x=1795008662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxj1xubJ7YfRpFCHJdR6Gg9jjbHeiVgUIcmm1aUVPG8=;
        b=NGbzD2x7xtDSm9ZRtoDOQlerzTkm5cQcC6NCA+5VC1dtwUxh/h6E0EIWt/S0ObFLId
         Np5YZXeQMraT1SXEUjH0M/4gFZC2lSVwOENrtOC/0eV7OmwW/dJJ7yS0+HMxD4DO6vL5
         ABMeIqIOan+TFjEle7rjkTuKVLaAitGobwN0oGtsJUQzIuXJRXWGVRyKOaO6KGJFquFB
         xl3e1+lPbyeppbcv6DyrSQPE0jzJF3+XCLZpaN+wPhdv5L1ClI8BIw9zaMPE8Y1ZFTop
         DNdp3WzbYYEs5gR4OG7CYMl8v0YpBTUinZ3bFhxzWuI6H+RbXckHYp17oirheWBEgROV
         7fgA==
X-Forwarded-Encrypted: i=1; AL+hErEDhXm3CQPOA7gfTlgCJK+62b1pKF07UtYcpE6uSBV7WAG2PjrHdgdE+zop4QPbztyUj3QXKB7aENo3eHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AoAK4TUIJ0AVkpoRhZRRslhYSMUOz6c+AN+oGBpTiFsnKNiOp
	BIy1vWCjM1/hwoYcIesS3jAZlc8lvr3paMW1y1iEi9h/XKf7CKaiUqOjMEG53KC3mrPP1BAPaiI
	RSERm54xTC6cfEiR57tGdqch+Z7kAFx7ZODV3ek+cDE3ZZBEE7kAyVAcPDR6sLXNs0IA=
X-Gm-Gg: AYBFou0fKOsOpPxUlLrTNR/FyDFjU+AVPgYK/mj8gBzNG4u9MZJPAwCph5hfq2Be+1s
	0X6BZGWnbxOg4Q7hxFuK0dndkN1VtvEEFGteOMnEQoYTzNEtc37W+ODpCUM/jlxP5dBqOyG0k3W
	AVLMObtbI+Dn3bsbdWEqEpAbN6GDLttb2gdOq3vx0cwN+LcTzBA+0BcX9aAutxeWmv5+AO+Nqli
	2YXIeC6gygkbzYP0Lca7dqNKPncARpUGVUOv1khH9ne7NzIu75yTnZciLCUtGE+7hyTV4tShY8G
	gcYb0kUj6BeOPazNBSObda5J4n3FXfQ65vmNTJvdjiPaPYdJ8c185kTrVhlxEwbJ/7Oecpn0dI1
	9v986bHa8rNSUxGI8crRROx9BeHtlqR/tyWyxFXOSbDE8RryiQfwksurTC47v2UkbPjZ0OCnNxb
	D+gjgR/cyRbYRPabXna9yncatYILiMXMTyVIPX0v/sE6AgtItnlwUua6CAEUSvnA==
X-Received: by 2002:a05:620a:a49a:b0:947:b201:fafd with SMTP id af79cd13be357-947b20238c1mr253956985a.33.1794403861683;
        Wed, 11 Nov 2026 05:31:01 -0800 (PST)
X-Received: by 2002:a05:620a:a49a:b0:947:b201:fafd with SMTP id af79cd13be357-947b20238c1mr253948185a.33.1794403861046;
        Wed, 11 Nov 2026 05:31:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bab08asm988415e87.32.2026.11.11.05.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:30:58 -0800 (PST)
Date: Wed, 11 Nov 2026 15:30:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/8] media: v4l2-jpeg: Add a baseline JPEG header
 writer
Message-ID: <qb6mqteoxdk7xb7qhgiruncdamptf7m62m3y4zrccs4cesxr4t@q3oukzsd6qyr>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
 <20261110163909.78085-4-atanas.filipov@oss.qualcomm.com>
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
In-Reply-To: <20261110163909.78085-4-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MyBTYWx0ZWRfX7Xae6wLDdGe6
 /Qg62Q1ThBY3zHXjHECaKEj0jyiLF8M8eobtVQT7FNR8hO2LD9eKInhI460v4x97LMnT64s1ZR3
 j0QKmoNzRLgKAMKmyf1qa5vMx+M2KmyS3NoAmqakBffyxHb0oZpk2G0oSWlDZ5awJO7tz3l0o9U
 Efoq1SGIGs5ej9yzkv44uizxFy987xcYeVeoeHQOxGD27tLlV/v5nzd8LIqp5hAydjiGAB44hQd
 3PxKqEAeQItBBrPN/WzWb63sL6O/oaGyItp8lrEglaAOpk5658hXBa5a+rv/16sKrikNBrUxLJ+
 pxgWv/WS4kb+wVGhD4j0DIcNcHWBovkjJB1kDfZt0tLudHYqlHuKD/If8rQ8aKxlXssYjyz/D5r
 M5K6rhOeHKMGkcsHHwdEh4G5bc8Hub4vJt8yZA9CAPgpdqAjK7dpBeceSkCDsI+Jne3L7Dkfmw8
 O2hodDGo12Y0uV7xkdw==
X-Proofpoint-GUID: pJ6jR58raov2GMcz21uQz1ETee02Qv7K
X-Proofpoint-ORIG-GUID: pJ6jR58raov2GMcz21uQz1ETee02Qv7K
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af46e17 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=8L9HzTLjaCIjMRCGOecA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MyBTYWx0ZWRfX3QXXsFnK+TyF
 snECFbksKJZ71go4scC95KkI5G//iPiLv5eZJpUBi/NiroAHZf/xHlhXkZIYHsgj/rsvRppPXo+
 vglvdAR5h7SpvTgzKIZcv+BUKCTLbHE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110053

On Tue, Nov 10, 2026 at 06:39:04PM +0200, Atanas Filipov wrote:
> Several V4L2 JPEG encoder drivers build the JPEG header in the driver
> from a fixed template and patch the image size and quantization tables
> for each frame. Add v4l2_jpeg_write_header() for the baseline case: it
> writes SOI, an optional JFIF APP0, one DQT segment per table, SOF0, the
> ITU-T T.81 Annex K reference Huffman tables in one DHT segment and SOS,
> and returns the offsets of the fields set per frame. Add
> v4l2_jpeg_hdr_set_size() to set the image size in such a header.
> 
> The field values come from media/jpeg.h, so the driver keeps only the
> hardware specifics.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/v4l2-core/v4l2-jpeg.c | 165 ++++++++++++++++++++++++++++
>  include/media/v4l2-jpeg.h           |  31 ++++++
>  2 files changed, 196 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
> index 36a0f1a1b0d97..f466dc6a457de 100644
> --- a/drivers/media/v4l2-core/v4l2-jpeg.c
> +++ b/drivers/media/v4l2-core/v4l2-jpeg.c
> @@ -13,7 +13,10 @@
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/stddef.h>
> +#include <linux/string.h>
>  #include <linux/types.h>
> +#include <media/jpeg.h>
>  #include <media/v4l2-jpeg.h>
>  
>  MODULE_DESCRIPTION("V4L2 JPEG header parser helpers");
> @@ -711,3 +714,165 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
>  	return marker;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_header);
> +
> +/* baseline JPEG header writer */
> +
> +/* Segment length of a header struct: the marker is not counted */
> +#define JPEG_SEG_LEN(hdr)	(sizeof(struct hdr) - offsetof(struct jpeg_seg_hdr, length))
> +
> +struct jpeg_hdr_buf {
> +	u8 *buf;
> +	size_t len;
> +	size_t pos;
> +};
> +
> +/* Writes past the end only advance pos; v4l2_jpeg_write_header() checks it */
> +static void jpeg_put_bytes(struct jpeg_hdr_buf *b, const void *src, size_t n)
> +{
> +	if (b->pos + n <= b->len) {
> +		if (src)
> +			memcpy(b->buf + b->pos, src, n);
> +		else
> +			memset(b->buf + b->pos, 0, n);
> +	}
> +	b->pos += n;

Now b->pos has advanced past the b->len. Is it expected?

> +}
> +
> +static void jpeg_put_u8(struct jpeg_hdr_buf *b, u8 val)
> +{
> +	jpeg_put_bytes(b, &val, 1);
> +}
> +
> +static void jpeg_put_be16(struct jpeg_hdr_buf *b, u16 val)
> +{
> +	u8 data[2] = { val >> 8, val & 0xff };
> +
> +	jpeg_put_bytes(b, data, sizeof(data));
> +}
> +
> +static void jpeg_put_dht(struct jpeg_hdr_buf *b, u8 class_id, const u8 *table, size_t len)
> +{
> +	jpeg_put_u8(b, class_id);
> +	jpeg_put_bytes(b, table, len);
> +}
> +
> +/**
> + * v4l2_jpeg_write_header - write a baseline JPEG header
> + * @buf: destination buffer
> + * @len: length of the destination buffer
> + * @params: header parameters
> + * @layout: returns the header size and the offsets of the fields set per frame
> + *
> + * Writes SOI, an optional JFIF APP0, one DQT segment per quantization table,
> + * SOF0, one DHT segment with the reference Huffman tables of ITU-T.81 Annex K
> + * and SOS. Width, height and the quantization table values are written as
> + * zero; set them with v4l2_jpeg_hdr_set_size() and through the
> + * @layout->dqt_offset offsets.
> + *
> + * Returns 0 on success, -EINVAL for an unsupported number of components or
> + * -ENOSPC if @buf is too small.
> + */
> +int v4l2_jpeg_write_header(void *buf, size_t len, const struct v4l2_jpeg_hdr_params *params,
> +			   struct v4l2_jpeg_hdr_layout *layout)
> +{
> +	static const u8 jfif[] = {
> +		'J', 'F', 'I', 'F', JFIF_IDENT_TERM,
> +		JFIF_VERSION_MAJOR, JFIF_VERSION_MINOR,
> +		JFIF_UNITS_NONE,
> +		JFIF_DENSITY_HI, JFIF_DENSITY_LO,	/* X density */
> +		JFIF_DENSITY_HI, JFIF_DENSITY_LO,	/* Y density */
> +		JFIF_THUMBNAIL_SIZE, JFIF_THUMBNAIL_SIZE,
> +	};
> +	struct jpeg_hdr_buf b = { .buf = buf, .len = len };
> +	unsigned int nc = params->num_components;
> +	unsigned int ntables = nc == JPEG_COMP_MONO ? 1 : 2;
> +	unsigned int i;
> +
> +	if (nc != JPEG_COMP_MONO && nc != JPEG_COMP_COLOR)
> +		return -EINVAL;
> +
> +	memset(layout, 0, sizeof(*layout));
> +
> +	jpeg_put_be16(&b, SOI);
> +
> +	if (params->jfif) {
> +		jpeg_put_be16(&b, APP0);
> +		jpeg_put_be16(&b, sizeof(__be16) + sizeof(jfif));
> +		jpeg_put_bytes(&b, jfif, sizeof(jfif));
> +	}
> +
> +	/* one 8-bit table per segment, luma Tq 0, chroma Tq 1 */
> +	for (i = 0; i < ntables; i++) {
> +		jpeg_put_be16(&b, DQT);
> +		/* length field, Pq/Tq byte, table */
> +		jpeg_put_be16(&b, sizeof(__be16) + sizeof(u8) + V4L2_JPEG_PIXELS_IN_BLOCK);
> +		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
> +		layout->dqt_offset[i] = b.pos;
> +		jpeg_put_bytes(&b, NULL, V4L2_JPEG_PIXELS_IN_BLOCK);
> +	}
> +
> +	layout->sof_offset = b.pos;
> +	jpeg_put_be16(&b, SOF0);
> +	jpeg_put_be16(&b, JPEG_SEG_LEN(jpeg_sof_hdr) + nc * sizeof(struct jpeg_sof_comp));
> +	jpeg_put_u8(&b, JPEG_SAMPLE_PRECISION_BITS);
> +	jpeg_put_be16(&b, 0);		/* height */
> +	jpeg_put_be16(&b, 0);		/* width */
> +	jpeg_put_u8(&b, nc);
> +	for (i = 0; i < nc; i++) {
> +		jpeg_put_u8(&b, i + 1);
> +		jpeg_put_u8(&b, i ? JPEG_SAMPLING_H1V1 : params->luma_sampling);
> +		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
> +	}

I think it might be better to write explicitly:

	jpeg_put_u8(&b, 1);
	jpeg_put_u8(&b, params->luma_sampling);
	jpeg_put_u8(&b, JPEG_QTABLE_LUMA);

	if (params->num_components != JPEG_COMP_MONO) {
		jpeg_put_u8(&b, 2);
		jpeg_put_u8(&b, JPEG_SAMPLING_H1V1);
		jpeg_put_u8(&b, JPEG_QTABLE_CHROMA);
	}

> +
> +	jpeg_put_be16(&b, DHT);
> +	/* length field, then per table class a Tc/Th byte and the DC and AC tables */
> +	jpeg_put_be16(&b, sizeof(__be16) + ntables * (2 * sizeof(u8) + V4L2_JPEG_REF_HT_DC_LEN +
> +						      V4L2_JPEG_REF_HT_AC_LEN));
> +	jpeg_put_dht(&b, V4L2_JPEG_LUM_HT | V4L2_JPEG_DC_HT, v4l2_jpeg_ref_table_luma_dc_ht,
> +		     V4L2_JPEG_REF_HT_DC_LEN);
> +	jpeg_put_dht(&b, V4L2_JPEG_LUM_HT | V4L2_JPEG_AC_HT, v4l2_jpeg_ref_table_luma_ac_ht,
> +		     V4L2_JPEG_REF_HT_AC_LEN);
> +	if (nc == JPEG_COMP_COLOR) {
> +		jpeg_put_dht(&b, V4L2_JPEG_CHR_HT | V4L2_JPEG_DC_HT,
> +			     v4l2_jpeg_ref_table_chroma_dc_ht, V4L2_JPEG_REF_HT_DC_LEN);
> +		jpeg_put_dht(&b, V4L2_JPEG_CHR_HT | V4L2_JPEG_AC_HT,
> +			     v4l2_jpeg_ref_table_chroma_ac_ht, V4L2_JPEG_REF_HT_AC_LEN);
> +	}
> +
> +	jpeg_put_be16(&b, SOS);
> +	jpeg_put_be16(&b, JPEG_SEG_LEN(jpeg_sos_hdr) + nc * sizeof(struct jpeg_sos_comp) +
> +		      sizeof(struct jpeg_sos_tail));
> +	jpeg_put_u8(&b, nc);
> +	for (i = 0; i < nc; i++) {
> +		jpeg_put_u8(&b, i + 1);
> +		jpeg_put_u8(&b, i ? JPEG_TABLE_SEL_CHROMA : JPEG_TABLE_SEL_LUMA);
> +	}

The same.

> +	jpeg_put_u8(&b, JPEG_SPECTRAL_START);
> +	jpeg_put_u8(&b, JPEG_SPECTRAL_END);
> +	jpeg_put_u8(&b, JPEG_APPROX_HIGH_LOW);
> +
> +	if (b.pos > len)
> +		return -ENOSPC;
> +
> +	layout->size = b.pos;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_jpeg_write_header);

-- 
With best wishes
Dmitry
