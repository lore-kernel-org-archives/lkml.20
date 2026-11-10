Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794316887;
	b=yJUh0wqKjBLtm6IWBwkyM/1N+4ttBYq+14F/kQwhZk0lgqxt/IAedtIPuMMdoOD6cndg
	 32yjPSKuNSkO9RvzDSGgNO7HkcxriESvKVMqtOV2QB5FVXwVGSoQHwst3fSBuRNiN0rLB
	 467XBs8XibDaifAQJmKdgwd7TuWUtQqUVPtikXhas6Y1VJQrNadDb2HWtFjbPyI7GoORx
	 UqnWQz8tE7Y+dfF0DUvwuiHk32zXbiIF4fD5Hk31PrrRqc/FeUHDBIzpS/jg/CT3WbU5g
	 YBFST0TSWy1U9ak1/0IrnyKE2zQyEV4l4dcw3ERfI9w7QB/LwqP8UySyKRI7eXf7ZxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IIzXasZdl3uuF8A0Q0l5RjhqjxVPq2XhnRyfILIPfK8=;
	b=dSFQJ806YayN8/Gd22oAMOLX2H0yGO1u65FiWJeitQcTnP/xBjHEkO1P3JOflqTaUjj7
	 y1aNwaHisi18HyUhGUA6HckP5H3SE2jkN0gPidL6h1Jiyh47slyOzElZFTfUIcfhI3mBx
	 I+5z1kmPgqKHOL9rt6e/GSDCStvBkiBbzKGSKeha52bjhyvay2o51KArDj6S4z3geG1cK
	 g8oGPuit9qQf8znOfciZdAlkhPCujUe0izx68sDKcPRbnWPQkhczPdiZE2JEGlPEl0DfG
	 DlyvftUDM8Rmb/czUnyZq7V90lGB9bJe2C3DwzU7OztmC9oLUGh3ZVN+2U/NpHFFh/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V1UKZCwp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LPL1alPG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B641606B1AD
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B641606B1AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V1UKZCwp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LPL1alPG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABANk41599644
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IIzXasZdl3uuF8A0Q0l5RjhqjxVPq2XhnRyfILIPfK8=; b=V1UKZCwp63kvPwhf
	h41rxT74ANn20jC0bJ7s5PzBJwU6CkrHC6q0sEYzYdGtr5Ek0IVoBAKlsJ4fMLnl
	1xGGn3OWdFrxgSaU+sHBh6jb3kVp94TeHjSqMQzdrJaLl/755YTrKYgWuXldP9pS
	HAQ+IsiMSSdaP9BiWu5osSt7prpr6d787+aQH+GVXx6eCnHrK821xTSxZI+vJlol
	pa0oWwC3KELJhfE69Ax1XTcDcW4+m5kSWESYFXKPY/RzVhnXh+5QCIeae+7W56iA
	2y92KF6Sl8OvEDOehmNz+dBoIdTTlBLb8uaKJJBb4aBMkoULWz2Sa0Ah0bTp0x19
	MDAnXA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv4a7e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:21:26 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b2fd108b28so29425577b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794316885; cv=none;
        d=google.com; s=arc-20260327;
        b=hUVyxQXuRWJCvLUkTUDkL3D2nGeJuyQmllbHnIucqTk6khx8j3oFs/1sR4HOehRwz8
         NaLiHLxDzHwFdNg9Mx8UjTLWYogTsBMKL6H9CevqDM5CBOp2MWz6A63zX5lU7gG1yPjC
         CjiLufSBD2srk38F1y17iHzQUcAF8V3zDzP4NzrZQtfvtZCpu19nASw1/tisnBAPdbVg
         1Hhrfngf09/P8iTtg4W5h4beAYueQ8z8g52sV1TVVpd+34fWL2+Km2yx/IkO9mPpG6Oz
         0D8PgzMlmf441KcnhpKiCIyHutHGYV1fZPbG9+Y4sLOj60p8MhyJqOrFxxgTLu9riRRt
         41Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IIzXasZdl3uuF8A0Q0l5RjhqjxVPq2XhnRyfILIPfK8=;
        fh=rotdThuKvpnpJPI/bx4R/WAHiOAZ9iroRIXYQ2GNJlE=;
        b=EgECuXzwh/i2neRQkZWl4neiLeppxDSHRmLjynYwDOE6BReGFffdwEaOd66a/c6noz
         Eu1nRrzXMd1WvF5o0yNLs3318M869X1UIZdKf9B08qbTZxAwavtgeh/Asj1oIQJJPi/z
         sKjeyU6vUOJ/sfAG1SEXt2Hgk0g5ANDCFtf5NQBwnDmTqf7wmMQ/4Ls2/ppllV2y6uMo
         3ZvRuXQK+XuKwt0fjCUHdNAtSxYCRx5K6pHNxKNEvWhcxbhe1SuN/7y6JxNoS1JFUowK
         ly/ZXy4vXdnirzfoX2QGtykenTsOz6KbK1pTqmMFMHN2xx0d0tdyoPaUsGbz/qOYCk4A
         ucNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794316885; x=1794921685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIzXasZdl3uuF8A0Q0l5RjhqjxVPq2XhnRyfILIPfK8=;
        b=LPL1alPGxOcQEeqNJ2CTMTZ3g7e+V5scWjwcZu3qyv0e6NQRujwWKWx6KWTMBbQQ1X
         eTpBmHkQj6FkZ2AiJnHHExkrmH4qXV2IuX2obO7shN2mmlbXtSCAVs9Quox+4dfgCuD/
         mQHsDE7XwDIfOe6Tw99IEMZDAeBOFJ5/B5IwYMpUXBefJEOuwpdyVcxdKcKJJFuiP2LP
         +bCaYS90tM4YypOXY+N73CYwriTu1UoVFm8KqMpAZ6dPxLSfXa3g6UCNXsvMKbqDsrFX
         J9SgKF4gfxjW+JbHd5po53N/GCMPj3sTxAdGf67ByH3cFA0JO1GjPZH0AZ9XUCtfhegM
         8USw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316885; x=1794921685;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIzXasZdl3uuF8A0Q0l5RjhqjxVPq2XhnRyfILIPfK8=;
        b=kGVFCanxS+y9wmPWOtgkZxx6cURonztFXTCDcQDoLNQhP2oxSp64ldw6WmgSHui1px
         q/Hni57bbPGwdUP/VaOQ6j86R5kvwQco6qZ9IGboyCpbSVkFzy3zFa6lRv79dqgXDDVn
         tvLRjHnNyz76MX/056ePNhkyW1mCNo3Fy0W5wx4ENQ2mlJo1Iz45kROnQtSEIqT6uiRv
         PNDwhY/wgUNJsGQQCD32Bp6LP/GuEDUF+nUyIeqwugN9P9epiQ2uBcdOKvswPGJwlv7s
         JKwfnGLDUBYnnclp2pWGmvWoSFCYzMN5QXPNtGmPBZmrMyjDes/MTz5f6vP5lkI6FeVI
         GiGQ==
X-Forwarded-Encrypted: i=1; AL+hErEOVysQ/brYAjrrJxVbYi1ow0l0zgIkW0h0PkpI1YlDQm+6hzvsup7d11H/VGnz1tYehuqsaGLgb9hlKQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cu0pVHkLSdYtj+lobuyee6Qmr++IDPyxsN0XgKspCKxE2nqt5
	tM7MxWrB70iZaml9NFH2S2T8UwVd230KCguvPHSfGsYFDDeWiFj/fDhocz+cg7eM+DIQUKC8/nX
	4WRiqNa/GaXv9c5O3KJoyqZrWdI3bDKOBgv2oqG2Vc45sN9ATnmFti+0guzBoWrGvZ14blnCuxv
	MSvPaWYCf5Fz5JY8Ao1m0FcpB0jOA4udi3H19bmd+a2Tn1TyfRLYw7vHw=
X-Gm-Gg: AYBFou3XlZVfHMD/BAJmZGvqdiPxbq44GPBHiuqws7ak009PKAyaFzveBUgL0LRmPqD
	sMlKrAH/p1AQwQaEjFfaRHcPB5qKjKVmZ/wJnbMGDEbAZM+OP634uurNCZr3tSefSCCd2Zv8Ltl
	wewDqpWyOYXsF6N/v/9LcY1je1tCNHO9QZYDSHuOrzFvtcOkKygL2RU44xvHpBzg80wi0ev24sR
	eSWnPRiw4aJHjdhITmdBxwWvCQEt3m1jOunfIUe
X-Received: by 2002:a05:690c:f04:b0:8b3:615b:71d5 with SMTP id 00721157ae682-8b392be3ceemr13387567b3.107.1794316885505;
        Tue, 10 Nov 2026 05:21:25 -0800 (PST)
X-Received: by 2002:a05:690c:f04:b0:8b3:615b:71d5 with SMTP id
 00721157ae682-8b392be3ceemr13387437b3.107.1794316885060; Tue, 10 Nov 2026
 05:21:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026150345.284404-1-g.osokin@auroraos.dev>
In-Reply-To: <20261026150345.284404-1-g.osokin@auroraos.dev>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:21:14 +0100
X-Gm-Features: AclHuK_f3vyqMLgyBVux__eXfDzVIlzPHxEDHotsqfEZeO9lB7Q4GjX6bk6lk-o
Message-ID: <CAGgiveUr_1OX3qvq=kH9sdVggtgK8LyiSF5KDtCfGwqdxkRXew@mail.gmail.com>
Subject: Re: [PATCH v2] tee: shm: don't warn on oversized request in tee_dyn_shm_alloc_helper()
To: Georgiy Osokin <g.osokin@auroraos.dev>, Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jenswi@kernel.org>, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MyBTYWx0ZWRfX2Btk86LmXrgL
 gC8algqwNXxj1Yf/5RxyaZHw/irCXkg7yoU/jBHmie0MvQEmIdE36EHvumscwGvAYCtwhcZg93E
 YHjO7oaJUCTA5cZwSa7f2aD4n4FAmeM=
X-Proofpoint-ORIG-GUID: lgBSjXS12ydF8CAoZJgTwLUZtDY2rmgU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MyBTYWx0ZWRfX+RqHT/SqLnd7
 v592kIinqcH163/C8O6eaeuTmRHFJ6XLfh+G27rPaQUnAbRBJbwO3hRiKiwgrenEHEPkgFlvjHs
 3EPZH5E71TK3ybmi/XRxtQFKTA1lUHCFF3vxQKWBom6JsyUFdPhK8RTWkMXuRjtiSBmYGC509rs
 hujc29CUHu1wcD87STjJbhfdZPybjI8IOIizEa2uKLCfrDC8hrZ9HZkbrzyoRC9H7ZDEOXlPg0Y
 sXHN4DTLoMmkcsiufsIu9as9TaJxhG81b+VlBpw678e25ZlaJGlrIkmz542TR9NRfjLAr68CAiX
 ep2kbD3kESIJhbCvm5HthU/Ax/voPc8Yhvob5SQ6CVcPLVLIiSMhzJkMd2KCa9aCcN3+JvQcWuU
 U+ugApQYhvfnvO8h8j3zUOod2iaktDHGc5ocQOxwpu/uRHum5o3z23rqyV+TPthOkHHMIKSz1Hl
 zwsJ5rOr4GtN5Uc0iZA==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af31a56 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=HH5vDtPzAAAA:8
 a=Uqf-NjlQ7lL-qC9IIjUA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-GUID: lgBSjXS12ydF8CAoZJgTwLUZtDY2rmgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100053

On Mon, Oct 26, 2026 at 4:04=E2=80=AFPM Georgiy Osokin <g.osokin@auroraos.d=
ev> wrote:
>
> tee_dyn_shm_alloc_helper() passes the size from TEE_IOC_SHM_ALLOC to
> alloc_pages_exact(), which needs one physically contiguous block. A size
> above 4 MiB (MAX_PAGE_ORDER with 4 KiB pages) is more than the page
> allocator can serve, so it trips its order warning; on a panic_on_warn
> kernel that is a panic.
>
> The size comes from userspace and the request fails with -ENOMEM anyway,
> so pass __GFP_NOWARN.
>
> Fixes: abd135ba215c ("tee: optee: add optee-specific shared pool implemen=
tation")
> Cc: stable@vger.kernel.org
> Cc: lvc-project@linuxtesting.org
> Signed-off-by: Georgiy Osokin <g.osokin@auroraos.dev>
> ---
> v2: Fixes now points to abd135ba215c, the commit that introduced the
>     unchecked allocation; cf4441503e20 only moved the code.
> v1: https://lore.kernel.org/all/20261026105209.161195-1-g.osokin@auroraos=
.dev/
>
>  drivers/tee/tee_shm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index daa4af1..8b117d6 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -352,7 +352,7 @@ int tee_dyn_shm_alloc_helper(struct tee_shm *shm, siz=
e_t size, size_t align,
>          * and there's no need for any larger alignment.
>          */
>         shm->kaddr =3D alloc_pages_exact(nr_pages * PAGE_SIZE,
> -                                      GFP_KERNEL | __GFP_ZERO);
> +                                      GFP_KERNEL | __GFP_ZERO | __GFP_NO=
WARN);
>         if (!shm->kaddr)
>                 return -ENOMEM;
>
> --
> 2.54.0
>

I missed this one, confusing it with the other "don't warn" patch.
Looks good. Sumit, do you agree?

Cheers,
Jens
