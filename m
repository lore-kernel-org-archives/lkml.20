Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793883425;
	b=Zm8bX5/xj+d43k4TgPoCCZAkkQ6YaIRtW33DcDTsX2ApCeJMKEfhecDgeqfMEO4e9J0x
	 wFoxbUzGOuEJbMsGyUsyUocnTJ5V1vSCeH04uCLhqqLqv7rhuzUE7ciz1EvQYdUXFquL/
	 ZbDV3sWWaGN/XjGlaib5kqaVAUdQsHmns1r8vfCaWHU+CCQI6LFcQ/LNQeJmocJIZ6tjK
	 Tz+wqwz77UGiLdkJ30FQ+WRE7AZKaqnReq639MCSeToBdERck6MHDOBUv41IFUv/hrZQi
	 ljpMagN0j+NHn5c6lNs63TE1s7hOcnue0zJe/SuMvdFQnvbLNYbPtMfC+4tULkv8s1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883425;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6V0/Yb5a1QvRIJN2J2+vcq7KJWj1JHis9ukDzSy/NiU=;
	b=yEQt+RpBQFGOi1O5ICt6ro1xCY3qfQED5QKoPXKuQWRC9QUCFaKdTJrzJSYjyUEwSwqy
	 wy2hWaeR8HrtLWp18IFr/vY1YTIotzDjCi7VSdBZX4hqQi9eOvU8Mv1/jYMuVeiQAeEVD
	 7pD+RKhgDV9kQfRlCjsIW32ff5BTer5HvTv5i0Xfq5SNd0eH44MtjVIzu1zctt+HZlpaW
	 IQ9/E+go/Px1xAMBcxNeuu1CaZHGVKW/F7TjAyzJ+36fv/bbsPZzpcySRVoYvjCkd8Grs
	 5ZSiPCWCn5PxQhNF88ya8genTyaTU3v/K7FKkzWwHjO4KPMDWJaOxEtXRjbcCMhaLAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UxnJvaXE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kn80XzO3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C227A606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C227A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UxnJvaXE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kn80XzO3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tC1f444454
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 12:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6V0/Yb5a1QvRIJN2J2+vcq7KJWj1JHis9ukDzSy/NiU=; b=UxnJvaXELaUEgiuu
	ks9r5kdERBsPO9yfyr9ebaZiQJplcqUiXUkl29RnjuG1yp2Go09xrsKYQJ/vghmT
	Xf8gueYHQ8k2uMS1CAKebDWvKFbzDjkGAcnTcgETbt3QAxKQFe3g2w2QRDi3U4C5
	mTlNGqTAqSpGpWHctZEyNwqV380/7fk/k/bhhqFtQ+J+7gqYoj4DfUkkfD+tTwGs
	ciR5KvagIwFL32tzML+a6YJ/XQRCA/YNHEgqPemOw0ToppgITrehySGdGeuQAhsS
	il96VeapyMWoBSkl2T17q6gjwOURjHLgTWBcN4+9u/Qf8SrWx2dp7GiMacY/AI0g
	fDpdAA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaah31c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:57:03 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-679f81d5d7bso3150067d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:57:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793883423; cv=none;
        d=google.com; s=arc-20260327;
        b=aKr8ah4R19sfDgefPtDw554np9abFPQBCwak2PvPM79i/pJDbpWex9/naDYfP6ty9D
         FjhlPqmbid3i+xb/zDZhZZKrNtF1unLwA3+4XMjXrpcRfhEiyeqLtbXKMumbQfZr1csd
         l1U3qO5lAfrRmmOi4vSrajn594SgCz/+DpNM3Fch0gDYFdhge2Da3gHzFT8Rsvf4U8Hw
         SHwGfGIs+dr9zSrtSB8h1BFysHNxxUzj0C6nJl7kXMnD17BgcS8CxVzUzvwNfj4Qcdr2
         Nyp1Nmp1l6QACKVoqvBONj8JhcBT161zh5qfKc9S2C8ASsUgIwQ8RwW9ncZlXUpQ2rlk
         yTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6V0/Yb5a1QvRIJN2J2+vcq7KJWj1JHis9ukDzSy/NiU=;
        fh=UcZ/GG/cea1oxn6YNaj4FXDUYNQG1nPvsYrFMNTpmxE=;
        b=aTWhypUzTGfw6KsEqO1L2MvknApAuFePO+s8yoq7xCghWLXvIvBmi2hoWJ8JB59YPd
         mWyO+BbmmYYdWqR0dbS+S/yNGnDqnXOaQQjo/ayELQOxLZ8eTeZCHfO7VZRWTZO/B2Jj
         1mnTytGVx2h/3ZeCWs+bVFRcweBeYcmpQNFj2DlnmX0Pj3Yc5FcjtklPcbozZYI5aW7P
         b9JfLeBjxY2x8qd3OI4FRxrja1hfXKzNouHnSc3wE7DixOvO8to7qWaxAACMeVpik7lK
         Dm1Z8/HVlwK6ZkXvXpc4e57gwgEyrqHLBJEQkpraLEvV+lRpvseJX8rtPqH1tfQDxHZw
         OC0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793883423; x=1794488223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6V0/Yb5a1QvRIJN2J2+vcq7KJWj1JHis9ukDzSy/NiU=;
        b=kn80XzO37lATT+kK4V9ZQ4zxwYPKG2G/KO7hzOecdZDUgDDWixHr8l0X+B4n3PpoO6
         Swz9SR8rfWsSOdFbihZ1XtMQbz5Z43Sdl1JUATQewdhIOd5NnSvCeG5MoOkuDOxOO7L1
         My2m82rNlnoIHHOp8WCsFqeEN4Dzj+Bcoee9IXY7dDc7N0oYfmZBv/NXKc5DuTEFKTpY
         6K+11W/nlSYaABB0XNtwBYVBaFv0nESvwpTqmwu8BVtGA9gNDr2tCCVa4ZWmjbgPQZ/G
         3dGuc40FeBZ5/Es1zC0cK7zFZJgk9GwRolTJyYrmJyarUTgiP4aDw4TntM5zkBEp0QeP
         OShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883423; x=1794488223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6V0/Yb5a1QvRIJN2J2+vcq7KJWj1JHis9ukDzSy/NiU=;
        b=DpWbGwg+lOZT6ES4L4dmsVlosZlRDAqC46Wea7YS2x0Jg4mntw/nTubdAvZJcspyZU
         oT8N6H1Tr6MWrb6k280jJkz+zXxH4Km3gfrtQnvpvaI5b+/+OxhKp/b2j971EqFLO+rs
         Mi8hgInz71rWilqY2jZSAKV10OO9D0K6nl710BtCb1PcMvxEM3EhzYrrh01BhUDY3i0E
         v2Jx6jqWy5SqFLxjBnP1fBqHAw0+louJHcVYolAXi72MfTTOb8Lo3cIdTZVGtQ2kwq5W
         5Mr0fbtBNcKSQojKHfyauVVK3BfcDkaeuauy/2haxXjhClItwaVUdGyu4DPdmzzyiC53
         AeIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtX4V8aGFt3u8DRt146ZSzO3+gIbrK9Q5MIUE+dSnxDs07H9kD9a6pL1vpRwz5lCYSoKO3CkRToBLTqe4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QLchVjtcKcoo/871LT48VcUv6438qCZ9ZlJKUtrK97aSm/erh
	Icfp8sxXlFwn/Hfu5pD/Ud8Oyk1NAPhN4cpUZyBhg52RqNE1cxhmvaDKmcdkVYxQA4Ss76KoSH+
	dOySMI7VAeYmNCJMGy7VGS1fm7tqemC/NW025iFK13zPZucKT8NC0ZhqSXnpw1wP1kXBb4g8P3u
	Fw4AjIh/Oh5o4FzpxliBw6OX6D9RxjBvOV+eMBTooG2w==
X-Gm-Gg: AYBFou2Htaxoj+Nw/uhkmID/fFROsrwrcWJ6EGq1Y7kcMnuIjb9qOoK30k1V6SHhkbs
	pxVj/ZPvyXsqHQvcKUfRj5D05mqc3N+9RRFNUFpyA1vGOLN2cjlHB82XSPtTmCax6qQPw+MzmBP
	mcUczDup5z/B6jsmf1EhnUcKQ4zXHBgI8+OSEwZZcUUTUDhSK9SmSAE8xePs/whSvKhj96sb4tC
	VlpmBOXvGhS/zy9Yk+S0IcchqF66vwiuYTMxce7
X-Received: by 2002:a05:690e:a44:b0:67c:709:9d51 with SMTP id 956f58d0204a3-67c0709a0dfmr825275d50.83.1793883422971;
        Thu, 05 Nov 2026 04:57:02 -0800 (PST)
X-Received: by 2002:a05:690e:a44:b0:67c:709:9d51 with SMTP id
 956f58d0204a3-67c0709a0dfmr825261d50.83.1793883422546; Thu, 05 Nov 2026
 04:57:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260806060727.191-1-getshell@seu.edu.cn>
In-Reply-To: <20260806060727.191-1-getshell@seu.edu.cn>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:56:51 +0100
X-Gm-Features: AclHuK8fnhCuqb1T0fFS_ASfWZzvsgNNY_vGXPh2_piEpskxhsQ1ds10NH8uPJY
Message-ID: <CAGgiveVEiVqxVO-B0kxW9uCb43g2ocs1bgEZLWpVq=+AERaevA@mail.gmail.com>
Subject: Re: [PATCH] tee: avoid accessing dma-buf shared memory after put
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Olivier Masse <olivier.masse@nxp.com>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, jianhao.xu@seu.edu.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX2+qMEqGB9XKs
 Z9vYGUZbHi2kjF5wxNg/EGDEF65CHxfYdIZhNzwc0SB0M84e0BmmlNpW1/F7olOEh6/jO3SOCOw
 Jf8T28J3R76xe88HsXFVKfVmKGjy/coXm5bq2W2+uPgOZckrshpxl2KUqq313XsCWhX4SL5wRnJ
 otLZ0WXhLJGgu7Yi1IvdeLSrHEQ5cQt6/0bqDyIcfndk9keZC2CTnUU1Y8tGKQkXLviqGXWz/XR
 2mjHHh/nxW2fjsQrK2y4fMFz7z8MfOqVj1zDlNJh4Irskk6UR7msgEX6c9FjoOEZTYshQ6c4Y5f
 YVGsaGeiiGgaChJhem9ySfsLhL2fk6D2d2Gy0EbXl1Ocm/3LGSZoDN7PraaPe5hEo7NRqqNpwM3
 i2shxL4uYUc7cqbInyUnrO6Bl9X7BJku3DQSAvKb2EXg2Zwq2e92fY6sYQzPRkbWcUbDZ/9f38O
 Xqu02j1hPTftn6MEmiA==
X-Proofpoint-GUID: uhMH5I_xVV9LJdRqt3ASDU-1tkkTRp82
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX5mOWTi4pJHFo
 kk6aN+dXKu3nYV9wfR6+MEAH7pn3u7T5P1e2Vn4muZZz8VSMwV65iHV6X9N/3Y8YIHtDBFu4/mO
 ROv0OTUjAhWaflH9d5n6L/dn8cLMDEs=
X-Proofpoint-ORIG-GUID: uhMH5I_xVV9LJdRqt3ASDU-1tkkTRp82
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aec7d1f cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=X7xKr11vWj73--6tdDcA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051

Hi,

On Thu, Aug 6, 2026 at 8:07=E2=80=AFAM Hongyan Xu <getshell@seu.edu.cn> wro=
te:
>
> param_from_user_memref() obtains a temporary reference to the dma-buf
> tee_shm wrapper by ID. If closing the shared-memory file descriptor races
> with the ioctl, this temporary reference can be the wrapper's last one.
> tee_shm_put() then frees the enclosing tee_shm_dmabuf_ref, but the functi=
on
> still reads ref->parent_shm and ref->offset afterwards.
>
> Save the parent pointer and offset before dropping the wrapper reference.
> The additional parent reference keeps the parent shared memory alive for
> the parameter list as before.
>
> Fixes: 146bf4e75eca ("tee: new ioctl to a register tee_shm from a dmabuf =
file descriptor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> ---
>  drivers/tee/tee_core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 1aac50c7c1de..489c39d5b35f 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -397,6 +397,7 @@ static int param_from_user_memref(struct tee_context =
*ctx,
>                 }
>
>                 if (shm->flags & TEE_SHM_DMA_BUF) {
> +                       struct tee_shm *parent_shm;
>                         struct tee_shm_dmabuf_ref *ref;
>
>                         ref =3D container_of(shm, struct tee_shm_dmabuf_r=
ef, shm);
> @@ -409,10 +410,11 @@ static int param_from_user_memref(struct tee_contex=
t *ctx,
>                                  * list instead of the shm we got with
>                                  * tee_shm_get_from_id() above.
>                                  */
> -                               refcount_inc(&ref->parent_shm->refcount);
> -                               tee_shm_put(shm);
> -                               shm =3D ref->parent_shm;
> +                               parent_shm =3D ref->parent_shm;
>                                 offs =3D ref->offset;
> +                               refcount_inc(&parent_shm->refcount);
> +                               tee_shm_put(shm);
> +                               shm =3D parent_shm;
>                         }
>                 }
>         } else if (ctx->cap_memref_null) {
> --
> 2.50.1.windows.1
>

Looks good. Sumit, do you agree?

Cheers,
Jens
