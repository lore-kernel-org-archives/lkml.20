Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C6B499F1F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790336454; cv=pass; b=qnBfDtv8F1d6Esf9w9Jn0rxgbzVlun5kIGXPVKqMDN04g4hGhizNqYtACwJZEsU7hZv+ZHo3/YiwZ5Zq5eLk2M1vp8bYp0Yx4bRZRJZ4aoLroDINtKmdH+pWDHh1t4wyLz5qDXacWTffdHgcSqiraWyyXJnJdYfXuUQ+7oRhfgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790336454; c=relaxed/simple;
	bh=2D3uL89/JQPQtiHFVdcupeNgMI7DOotuUFB6nC37h1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZEJjswg5VZbpTarI/vS5PiA9WxBbtK7oxfOqGaPt02nmgkCn0/RzMTE7aZGG2c/30JmIJd8/qJUfA2H/6Kkix0a43Ig3WhmdeRrtXXxOWaeuwepf1FGifR6+WiRzs/LyAa4h4pAnJWxgPEP0x5+NJHT26oxLhbmGiVEQUjNoDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJj1QL4N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ci7V9dWG; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJj1QL4N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ci7V9dWG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J4J0756780
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rsNrOzwbCifpU6R6cJ/a5dsMB4faQfYqNwJbgN8GX/4=; b=mJj1QL4NL1LcI3Sf
	9kX2QOperICOQlPFMtnh7bHpFLC0junUGc/gBIo98esg2yuTqko1yUe9u0v/QuQl
	qrYi1caRlRO4Xnsm7CCya5O3d5QeUpE/UQexh0fcUTjT/4CLqfrVvmXi0MD7B9Gl
	i0nZa68+qYiJcLoaHXBSX8qHavv2xqM9r2nKbk5GZiHofhWV3Qw7qXyURbd94Hj/
	3GoOD/+i1qVTuyBFSMTgwJTT1ywRvMstVcY7JKGzURSfLr5ZC5S/Thah0QgzhYK3
	3EM8TJTEJ7Mq1GtfU0y89yww4q4TdBCriqKP1bfVokaN4SnCACs1LKW13ZH8ZTE1
	1gWcMA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq095kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:40:51 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-674183ca3fdso228432d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790336451; cv=none;
        d=google.com; s=arc-20260327;
        b=s+Q115NADUO7ko01yQvfHG7xjSt9zPUCwW/kni8vi9SCdnE9nx3v2LRXA+WQOv8bIG
         yyIM/UYkt/5L4dfmn1UXXkTZqt8UjXWecDqaRF3VVh46nGrPi+xUyoTpOMkq722lvfMy
         YMoiLPT97ekLfRNf7Ys1WOSDLnAY9x0uQvEZN7tyRyjy3/Dnl2wWfOOOnAJIESZLtg7I
         Qmkwxu12OOn7Ssc+cJ0GrVWy1ZTPsrZPXnvMByvP9p5PSUEWZh8ItKD+kySuE/jajJWh
         ZuBIwDHprNaETK7jqJS5qB+Wkloz/vHIqt9O3a6w10LQyC9jcAvaZ5sQA48849KAAzUA
         NknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rsNrOzwbCifpU6R6cJ/a5dsMB4faQfYqNwJbgN8GX/4=;
        fh=NglB7e2Tfb0YLqQMjOaiZJNwcW+aAeHMJypfUZ1TlsI=;
        b=hILXxD7sATZoLfaS6BtQz6J4vah6zW2Mj5BTSxumnM6eqtfy8F1MUXMrBeLkDVDJUf
         VteoUs7SRyILX/BQUhcHuHY6Yd865TT2XEMqUofrlqThy9FowvAqtV6EnNpWTq7hkjPY
         367+fsJj961CDPGODDeoAFcn5b3QV+hcBLXztl6cdr24gSztwxa7WaVg1TazRVfCHF8f
         GgdV9f8Xs2wAx8UzGMMFJNdUnxl5+R9ADVD4LXrsjTxtkBQmx6SYsFuUgIZpRu89zmGD
         jN9eDQVCtToYkUqMpOOzlyTqneqgp63os60WZ1LZvRxVmWQEj7yCaX81rH/w6BbdBQT3
         0uyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790336451; x=1790941251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rsNrOzwbCifpU6R6cJ/a5dsMB4faQfYqNwJbgN8GX/4=;
        b=ci7V9dWGT6IXdMTDcRznEHMClp+FXLybIlldJR2+nABU4m5ZQuHpYcac+WWWQpX5lZ
         dekHgNW5/v0hgXGxMaaEweY5fqPorueyjHop7jckTMa2/DDVF73fSl3joOG/YQl4hCRw
         a1VjHqPZ6H5K8H+M2LEx7lZtys1D5BeMnt/9ZmMKv0lRjB7bSEtkj9XlyUi1zrf4CeMe
         sAkuCn59cONaDpmvxOtpr+zzBna/HtMJist8yTB3INOFAL23bXCfXl3GVScVgpSJRHF7
         CUckHzoSQO4uQmqLvkAf48bmGcIXHPRzrJNbCfwX5FP5rJUf9Nk8prQ+bgW3tNhs2EcI
         1HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790336451; x=1790941251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsNrOzwbCifpU6R6cJ/a5dsMB4faQfYqNwJbgN8GX/4=;
        b=ludc1e890QLIi1ogiNG/Iyp6+g3H97ipzrF7xt3DeapRsrVJH85PQ90hXWycIR2/K6
         MrI8ejAetB9VeFk5tPRBLJS5PuCVjM+iRHPc4y9Ka0k7yptyR+8LuBjoPIoY/u9irC39
         XvL3AGmhIq6y9aI8SovN+NDrclX4DaEu+opBcfgd6MY+6i7HiwpMCq0R2igHL1nitVb6
         Onm8foEDpgO1YyUAl8xTq3shZqP9lMtpN1NCzSqZQ6thbdhSVpdFf0N7gMYo0cjuuLBe
         2kRQLkxzqfu6B7q2yg31tynwO09X02sm5/ONBJU7Bu6mkX7PF7+G/kdazMeNBBBaL6Oa
         +9Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzsieNjmtdEmlewdgO9JwPzoKWUhFfQ4CeOWfxXlKeHApapVOckXc0uID5rUIWJ8kYIAr8wDx8hAmTLnIE=@vger.kernel.org
X-Gm-Message-State: AFuF++mNqD0tfRVeLMo9ZMbYLPc9EAQzj+QFavmYw4s/k0teeiBuyAxA
	WaStrdFmjmbiME3whGCQ1w1XgmIvlehZMfRbptwnneJLjnurMW0jy1k/1oNoo86Nu8SZBdb8kyH
	+kxIufPpYiIaf5Z0aLhvn/czJqTHCS4up29qk8DmxI5fdSjpAPnmLoyT3HXozrml/bnO2M5QAum
	N9WF2LCrlL9tvaAAr5kzY0qZv9k2ZtFaoJzu/LbFHKew==
X-Gm-Gg: AYBFou1bkrd4RMJq2fUclD619hoHrGZZnvl5BKr3eMxpKHTbKPVKOLa1d6XrpwGN0G4
	EhDRG+sD85Dd3wouz98PB8bsC7SUFj9PI2NueW65z/ZRIlcWS+tANkcysP3vg7r++DC4kjJ7+r0
	pup3P9573a+OCJzLNq0Bl+uGmrF1O8DONnvPXz2RAtZMeiJzNw+LWc/qg=
X-Received: by 2002:a05:690e:4386:b0:671:5206:72f5 with SMTP id 956f58d0204a3-672ed447526mr2076037d50.64.1790336450638;
        Fri, 25 Sep 2026 04:40:50 -0700 (PDT)
X-Received: by 2002:a05:690e:4386:b0:671:5206:72f5 with SMTP id
 956f58d0204a3-672ed447526mr2076032d50.64.1790336450169; Fri, 25 Sep 2026
 04:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924105145.532787-1-marouene.boubakri@oss.nxp.com>
In-Reply-To: <20260924105145.532787-1-marouene.boubakri@oss.nxp.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:40:38 +0200
X-Gm-Features: AclHuK8-NKfHmECD0DVtOmk_e4klBoqgwKqOwd5x4NG4wazlnEDTkkCFkHyTAAw
Message-ID: <CAGgiveV=MvRpgQxsfxxh9Hq2CFm3HDxOn3V1i7X2d9wYAvzXrw@mail.gmail.com>
Subject: Re: [PATCH v4] tee: optee: build the Arm-specific code only on Arm
To: marouene.boubakri@oss.nxp.com
Cc: jenswi@kernel.org, sumit.garg@kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        amirreza.zarrabi@oss.qualcomm.com, peter.lin@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0NiBTYWx0ZWRfX/3eRMiMbyWQA
 aPaW1qgJAzxfbK42qJKRT4buiXkggmdGNf9WLlPUY56ZtthyUu1NF0+InxvBCxZkpPvWoNaFyGX
 krWMqU52Wzm+99gRdYh0Lj+FWyFbWdk=
X-Proofpoint-GUID: Z8iwKvcsUrJssPJ-BVeGDYygmmP0fW5Q
X-Proofpoint-ORIG-GUID: Z8iwKvcsUrJssPJ-BVeGDYygmmP0fW5Q
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab65dc3 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=iiJROjN2hu4f1MACNQ8A:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0NiBTYWx0ZWRfXywu7en/Z2PoE
 3+x2K4e5L3MtlWzVf7s4+zvrn/RJCspyej7GamhHnqNAItM2lC2pN0FW5GLGDQWm+Wi76VqNbP0
 3a3nDRlkj90RsqFs0n19vAG+swMcoVIN5RqxoLJKC7WHGXFbhwUmSuH4MWHkxmQUdx0vtRUs6Yd
 W8Q01v1JwcguGMSKYZK8zZJ6I6MvUAhYHEuRgfFtLDF4DXv9u3V2hBfVg5MObnp0P8uBkeI4BkC
 Z+rphtnNlRT/G9Ty7KQrHDX3ao4SOffdi3UtgHWiGaIkfd5Hng0aRuMTvOu3TEztkIx5R3TcJh5
 zF90ZPclsktb38ec15KTlPvUo1cQzOTM+kmoOnHCLsQCZzHzdYnHYL1zIJxt5gmhoW5cYvp0i0i
 SYPHOGTdBCZVHujefL4K9p8RJe88hIAzpYxChWQNFPQOMLP3uhrSUggf/RwO3hpIPEV/sx83qAx
 uvgPONEpLsWknu4iMQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1011 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250046

Hi,

On Thu, Sep 24, 2026 at 12:37=E2=80=AFPM <marouene.boubakri@oss.nxp.com> wr=
ote:
>
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>
> The OP-TEE driver reaches OP-TEE through the SMC ABI or the FF-A ABI,
> both specific to Arm, yet builds both unconditionally together with the
> SMC Calling Convention definitions they rely on: ffa_abi.c is always
> compiled and only its registration is conditioned on
> IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT), and optee_private.h includes
> <linux/arm-smccc.h> and defines the SMC and FF-A specific types for
> every file of the driver. This is fine as long as the driver depends on
> HAVE_ARM_SMCCC, but it keeps the driver from being built for an
> architecture without SMCCC, such as RISC-V.
>
> Build smc_abi.c only when HAVE_ARM_SMCCC is set and ffa_abi.c only when
> the FF-A transport is enabled, and provide stubs for their registration
> otherwise, so that it fails with -EOPNOTSUPP as the FF-A ABI already
> does when the FF-A transport is not reachable. Keep the SMCCC header,
> the SMC invoke function type, the SMC and FF-A specific structures and
> the SMC RPC register parameters in optee_private.h under the same
> conditions, and drop the unused <linux/arm-smccc.h> include from
> notif.c.
>
> Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT, as it
> already does for RPMB, so that the driver is limited to a module when
> the FF-A transport is one, rather than built in without FF-A support.
> ffa_abi.c is thus built exactly when the FF-A transport is reachable
> from the driver, and the IS_REACHABLE() checks in
> optee_ffa_abi_register() and optee_ffa_abi_unregister() are always
> true, so drop them.
>
> OPTEE still depends on HAVE_ARM_SMCCC, so smc_abi.c is still always
> built. The only visible change is that OPTEE=3Dy can no longer be
> combined with ARM_FFA_TRANSPORT=3Dm: such a configuration now resolves to
> OPTEE=3Dm, with the FF-A ABI available.
>
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> ---
> Changes in v4:
> - Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT so that
>   the driver is limited to =3Dm when the FF-A transport is =3Dm (Jens).
> - Update the commit message accordingly.
> v3: https://lore.kernel.org/all/20260922131735.524635-1-marouene.boubakri=
@oss.nxp.com/
>
> Changes in v3:
> - Dropped the RPMI ABI placeholder and the RISC-V enablement patches,
>   this is now a single patch (Jens).
> - Key the FF-A parts of optee_private.h on IS_REACHABLE() instead of
>   IS_ENABLED(): with OPTEE=3Dy and ARM_FFA_TRANSPORT=3Dm kbuild drops
>   ffa_abi.o from the built-in optee.o while optee_ffa_abi_register()
>   was still declared, which does not link.
> - Drop the now always true IS_REACHABLE() checks in
>   optee_ffa_abi_register() and optee_ffa_abi_unregister().
> - Describe the current FF-A conditional compilation accurately in the
>   commit message.
> - Posted as a new thread with a proper subject prefix.
> v2: https://lore.kernel.org/op-tee/20260915020235.507302-2-marouene.bouba=
kri@oss.nxp.com/
>
> Changes in v2:
> - No code change, the testing section of the cover letter was completed.
> v1: https://lore.kernel.org/op-tee/20260914175435.118303-2-marouene.bouba=
kri@oss.nxp.com/
>  drivers/tee/optee/Kconfig         |  1 +
>  drivers/tee/optee/Makefile        |  4 ++--
>  drivers/tee/optee/ffa_abi.c       |  8 ++-----
>  drivers/tee/optee/notif.c         |  1 -
>  drivers/tee/optee/optee_private.h | 39 ++++++++++++++++++++++++++++++-
>  5 files changed, 43 insertions(+), 10 deletions(-)

Looks good, I'm picking this up.

Cheers,
Jens
