Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793050889;
	b=WpMqkxBlVm89TsBoog9Ski75AUuSfBZ/mPsxCkZD2N0BUyFqyNGSTlzNgw4sm+uUyJ6f
	 QwYugqLgddtdP0K/rPK/jv41Ipb7mpI6m5jr6cgwqenksAAY3CatmTAS18XeMlA8OTZ0t
	 tLaJtTZ0wMjsoKpDTGoWV/dNQdQ8cV8dTPY4jZ2pBuoasbbXH1NWOsq0PmE9RoxIzkKuQ
	 OJFCj8RMtlO+HI3gGeKw8oy9YmYxewAThSo6cH/mIqHD5yERQHcKMu3reMwQd19/Si5Hr
	 g0kauy/Hq4OK6vNlN5OnZrrtYUAtqDzEyWxUV1qpd476doogp8gINC6Ag21QvGvSFRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lWzxRcNP0EA974T23MJtm9JINdrJZubezdMnSoVs3yE=;
	b=i2fdkGUwPGmBBmFp1KrrYWKiBO1AprGPquAKRBjwJuV5jT5pyNzK7uaR0BhxbEEsUsCn
	 TSNEXzYgYnafHs/262HOsjhHqD8WfqKwg4w3p85qy8pmghUaDBC8mqTMWHdYHmJPEhCeU
	 i73GkzO+pGn66BmtOwVLf/Id+FSHdnwz7YuuULcMfd5xiRc5QsWPDabMoRARE6iVCoAda
	 T7KL4JuhlhqKf1O8OTQOoTCey00Gh/cYDIJODLnZeudQEzVZM/kUUCbpw3B/4b1uYGvti
	 trqhF2GwAsSkPa5IJI+dxSx/rLt/fQdHWXxu2ezgjCFJOQPbmgPHE/d1q3a/mC4MGCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i1HD5ZpP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SQn4dk8f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AC4606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8AC4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i1HD5ZpP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SQn4dk8f
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIoItC488448
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=lWzxRcNP0EA974T23MJtm9JINdrJZubezdMnSoVs3yE=; b=i1
	HD5ZpPQh7FmJTdyM4lPzMiwyHeHp+XFvkKgfZ6OBqDRrW8DkvJyAS4W53OUFw5po
	SLQRtdxZe9ceVunbTWAwpCbVCdRZ5+ZEXFDYHi2QBSQcQF3wCuQjUZp+A7VTcFKE
	RkEG4qqasoRLcidRJ1MyQOAfGSmx2hcqdIeWoFKUDMJBnGiCUcgmcftRNBNFn6RT
	F3OGGURu1bbiK8HzRCawmWw7PI8t1lCB6y/iKFw+L+PdibcWCzkdvp7v2aXEvuB9
	rKrQqm6db2tT0yPshIDh+4OR/b/7kf0oNzsv26OtdjZtCLI+Y8nxaaRoQbgRXm99
	Rm1oZWDVarEmf4Ul9R3Q==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf2kk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:41:27 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46dade0d7cdso3357146fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793050887; cv=none;
        d=google.com; s=arc-20260327;
        b=Tkx4ieJPsmQdXkfwVr/0YSKUcrHVBbVYNVxJpm0pMjeA8htq6UVzRDoFUD+sm1Zo2x
         tJqNFBFPH3CJMUMXgVFLa5wPI6VlbUN15rS3hszrultJDn58JSnzjQ1pnhD9f6LhJ47W
         ithFbnmBAJs32PSLwR0jnis7/d+ktBjktK5ZKHSh8KHmiN93YJSD2334or206g3KUf9w
         bdVm98phfuV+nY35+y1oa5n3eDdZcjCK245RW4pAYn2GSLv8WjykRo2ANxC7b02CPuG3
         ksggMU8eelETn7hxqKH5JUVIxt7xDKFCMEjhZ4TTbFV1Dn3fepSE0O770QIDnITC5FNu
         /YZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=lWzxRcNP0EA974T23MJtm9JINdrJZubezdMnSoVs3yE=;
        fh=pVSDqPo3rwta0qlmaJq5LuEevrnTxF+vHfTiZJm4nG8=;
        b=evbUAjLvQggqvTaCzweRY8Y1PCgORI+dd8AGyWyU3oMFZcIGc6LyRqdWN95eqBVBR/
         gQgeS2ULY3JY4CzeytlSpp4Rqq8P1CqLs+3HvImxn6wwKCyICNmpcoQ0ID0J2D4Ov/ga
         7nhehCvtRZ0LKdeSaSwve+p0WuQswWEuXYET1/lySgQXXhro49o3ASO1a5+ag3kitamm
         ss1pbSvSg3dZ3WX7Xa9OHNv64FWT2ifF9FkHzxWmn8H7mvTHWJrFD4hGUK4PctIG/cwO
         fjJ7luGoajOqJOO4KcczrwOmcdd2ac1bC0bPMsUUET6AyM3glk1n5RMGoDhdTPFARG3i
         vULQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793050887; x=1793655687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lWzxRcNP0EA974T23MJtm9JINdrJZubezdMnSoVs3yE=;
        b=SQn4dk8fXGvQFIl9Qka6dwTCOzIdPVi+FeQF/m3x582nM598VwpZbH8PVewPtDWJNS
         Lg9sRvF1QbXEx1M180g45CsWizTkmUoBKZnjaquJxgBO3RirkiOvsM5lpy/DcKosWUi3
         TCV9E6F+2hMCtA2HXoxkbK6aMF9IeTlAamqTXeGKQ0tWKY/eNIWB+ahp6Cg/3qJ2zNSs
         x0Ut/LH7e89rmJtseOFoSx8YW6YzKGMcwMOwIrUx2HIQGJVOkFpr3Xo3vFY5ZKS7x9/D
         qfmFt/NVzqWiTfZaFwdHciFI7zcgrtcO60vk+/ZdCnlBfnP2tr3qK/c+GNA6eKZBxRJj
         S7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050887; x=1793655687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lWzxRcNP0EA974T23MJtm9JINdrJZubezdMnSoVs3yE=;
        b=ZZYkSe1NRTvwc4llfa/FHvyG16E4srWoBVfFnnujwnDxLW9Fi0zKxVKh9RPfyvXuIu
         dbhdVUHHy7xidDXqehC9NNAw3NdFmw769lAQptZNGJpm8o6wa/mZx1i7JqNt3V+fVe+T
         0UXdui85PQH8SA6X4GX6IesH/aVIYOYc7Ag1fFx3hqRnsFyyrtpZ2rXLBit6yJ8nHxME
         4PAqPw28dKQpg2YKzJl04SgGPWDvb/x6aoJT+f4/8dSEEwUczCDJtGDfb8zxPlTX0bGU
         NWcos095Cukgjiwom5S46pYqM8v5mIZ2DsOnh0NvWVgXMvY5AEN5XQFnRL4IrtaaZtTe
         SPSA==
X-Forwarded-Encrypted: i=1; AKwUvBysTl+TqqXBb+Gd46CakX/n9Ammmu2cOEnXYYwjScggOlaMQD3huSUR7VdkEJudmxDrPy0za7UmGoGZ7UE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlZtyZrd9KIhwGKPjTz2yxDIDuwSFnzfZrcjzkYolwYu4Iva7b
	dFr67K8LuS4vwCc9IKeg/RJWpo84a2UPLIOA/ONLm6r07fjNJKnjjrk2sz4HlJVwzTAEyMwkr/u
	yXz0/+KxdPKNpzd5X6J59LX5CkEQYId7J+n1kWjF94kG4VOSrGUJ4dX5EqrI3WHMArBblg3/Re0
	WUVciZ62PR67sksIVQYSYmdUSrkvfGb2mmpXC80loRwJ9YdQUfp9WA
X-Gm-Gg: AYBFou0EGWjmf38ZZIkkgEywdI/QobwAv233run5QW5DoTHZlPQbnB8134BydouOVAE
	6jHWy/C7PAx2mhDy6KCVJnWIQfTG6tRy9W9EssT+NgfQVNdPDqKgzBdJlC//yQQvA3aGgKbbuiN
	XtSI4xy8ES0CiCb3dz5rlox8FdIE7QKeDAWqvuGvzCIr4u2bf3IWzeel10Iw==
X-Received: by 2002:a05:6870:a2c9:b0:491:8695:3323 with SMTP id 586e51a60fabf-4a83f5338fdmr4761486fac.24.1793050887070;
        Mon, 26 Oct 2026 14:41:27 -0700 (PDT)
X-Received: by 2002:a05:6870:a2c9:b0:491:8695:3323 with SMTP id
 586e51a60fabf-4a83f5338fdmr4761476fac.24.1793050886681; Mon, 26 Oct 2026
 14:41:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <9671164f87138a0caf5c69b66129bbd6faf932f8.1793044688.git.bvanassche@acm.org>
In-Reply-To: <9671164f87138a0caf5c69b66129bbd6faf932f8.1793044688.git.bvanassche@acm.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:41:15 -0700
X-Gm-Features: AclHuK_7zT2IvHbHTNDkSXUCFvxh-cTVSQ0IQQuP8eK-pbBj0w4a_pzyD7ZWFRw
Message-ID: <CACSVV03Vjjd7AV3WrrpxbDgHAjWAUrru8GnJQK7HLwSSzQ=XAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix a lock leak in msm_ioctl_gem_info_set_metadata()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yuan Chen <chenyuan@kylinos.cn>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NiBTYWx0ZWRfXxewH3RZtmQwi
 DPo8hFT1TXivK9fWTujykvdJhSfLrK0xDso7OYxTN303CCM/Lp/wgretbtWzFfuQBpY6/HO0aAE
 xtdtZpHZXrvBFp3jgkY/zdMOB0yN+ag=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adfc907 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N54-gffFAAAA:8
 a=058b4stj7-OAlbUbkHcA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: _4iwBMQutQ77UOan9xB_ppzOM6feaNKz
X-Proofpoint-ORIG-GUID: _4iwBMQutQ77UOan9xB_ppzOM6feaNKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NiBTYWx0ZWRfX80X1gi4XOLFY
 Z7yO6/NpXr2ghO4fvOr1W6VCovvsZbUwNBgz708J+CBMjEquNLpNQT5i11upUv951H64uYCcrtM
 TLT5Sej7WsGSrTyCpYE8xOVrdsg4ZLIip6+F7MhvMRMgK8YiV0J+8jV1vNBMsrnsSULAn1s4Aqw
 QbO+tt4j7ijvbaqhMGSRK7L/RLmDNH9ElIGXa+zruXQtYZ/fGbcSKT7/bJ9MRDr858O/wb+kL4C
 XxkgbP/kBzxM20GIt5FGMNe7IakKWmamaDKYu4cWtjD5ZuRWEzvVy0AFnKoL41rFrf5Xce6+l2Y
 pImcbrMsClsCRkuzU2krWGhdBgFvjr+/YV0tZy877vwqqxbvX78hqj6M1UHEGwHIcIDnTangqba
 J7HLeKHl2AkvuI610P0bgJLMtTI19T1YZ3ZWOEdqUH8QQ5uOcHvissy7mygCxBt6oXyXDw05I18
 zLUXEXvqx7I2Iwb11mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260086

On Mon, Oct 26, 2026 at 12:58=E2=80=AFPM Bart Van Assche <bvanassche@acm.or=
g> wrote:
>
> If krealloc() fails, msm_ioctl_gem_info_set_metadata() returns without
> unlocking the GEM object. Fix this by jumping to a new label that
> unlocks the GEM object before the buffer is freed. This bug has been
> detected by the Clang thread-safety analyzer.
>
> Fixes: 1c8c354098ea ("drm/msm: Add error handling for krealloc in metadat=
a setup")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

You nerd-sniped me into:
https://lore.kernel.org/all/20261026213701.22126-1-robin.clark@oss.qualcomm=
.com/

(but I'll take your patch for -fixes and rebase mine on top)

BR,
-R

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index 5e8f3ce26b32..7ab808322be6 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -571,13 +571,14 @@ static int msm_ioctl_gem_info_set_metadata(struct d=
rm_gem_object *obj,
>                 krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
>         if (!new_metadata) {
>                 ret =3D -ENOMEM;
> -               goto out;
> +               goto unlock;
>         }
>
>         msm_obj->metadata =3D new_metadata;
>         msm_obj->metadata_size =3D metadata_size;
>         memcpy(msm_obj->metadata, buf, metadata_size);
>
> +unlock:
>         msm_gem_unlock(obj);
>
>  out:
