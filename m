Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C055C535FA9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172269; cv=pass; b=lY6rw+JkQ/fdWQ6f38EsLQqnlKc6ge5VNyxDegE+EHp8fHDKgjoxBRN5Gr4k/IPxmNXJwacrluaUhTI4oWZM53JsptF361dbfP2hQwPO9N/pSs3heZCD/1XVh27V4KO1yuDGDdHM89JvywOFjEp80zhLa0TvooiORC6kMnq/Gcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172269; c=relaxed/simple;
	bh=Se0afsEPP0FXjj+86JanuVzxFWSwP38EfVdhRpBurXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IADxcjPSorHc4HzCbStC8zg7jqogBItnpn1VkUP5bzA3QW59bevF4VYC8RkYY7iqlkcRXOQVh9YZLIEbgs3Yus9g1jTMctVxhVi9Ub99+8+/93LUF5u9CZJJeO82P+ZKyYsa92JQi+vJd0MaLPoIu84d65NiViJ96eDKXPwSeSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=czBYGUt7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FqP+A2yV; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="czBYGUt7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FqP+A2yV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBco6x3161409
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUXKudTNYRkjkcRMUBw+hNaRYWoi0rr6zfNliaS2E8A=; b=czBYGUt7dorwavSp
	7cNodHIkXwFMSqaK9pA7wHknL1Bv8/XXACcONIh1HDZ0+A/7YqMvH5nLwYv2k1Oy
	BU5Qp/wXu4SH6G2Id0EaYPS9kt+joe9s8OdKayxV2+jE3iXgIGebgwGuI120jL2X
	uXkg37MC7Ks235TEvb0/pQU8fgoR/GjGfkmPZhBUGWe2TMArk5tVmg2wR5CRW0ZF
	vAl8SNwsZdGFNW7GKNV7w8/F0o1f+tX8SByeQ5UewijknLQ73uI4KmTd8ArR5P8F
	+7wlTSAaXFcJnFDZ8RH6hmkSE6k7Np6VdHf7lq6o2Ydbv0eHeSmoRvrAki0yriPN
	iRfMCA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qu74n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:04:26 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-85da2b96c35so19046297b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790172266; cv=none;
        d=google.com; s=arc-20260327;
        b=JQj6LHoj5reB8s2sY9zsB69i3ElbaApghuS9ho3+w1IGycvJhi1PjJclcr1mBkGJ6r
         gLkYYjJrfvCgMZbJNwYI1fuQgGgmqHkD/oGFmW1DTY5xwT0EMDKKPkQbdUOSY5aTa+SJ
         fUmSZwx8JT+0X1klf67pUi1OVB5n/JbiMQKwOGTLuheAlINwSL1oIG1o/wCohGqEsXzl
         TVWIqMXUUDnHsOidfMXvw4fdsEEZdZtS7P0X9xI8/mVabe31BSQ6qw0TmjRe5M5CO212
         nEJr98WJ3aM0wLrH5yc9Svb4Cg7CMnjDjVAyjP5MMb5sxVm0YbV4owp1wlwvVZ2W0HL/
         tbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RUXKudTNYRkjkcRMUBw+hNaRYWoi0rr6zfNliaS2E8A=;
        fh=ZurO2eRSN1ICRrpDEutRyF52mZOxTyqrtfq5cbNAGLY=;
        b=OIKZ6I7ttFHhWfvCYiZLQRMFuLb4GK/Co4n2k622mp8+6MxfUwtQPoBdAe78yycwvZ
         y7PUoypXYounrMjAK5LeDhBVvYHuWGLjHq7BvI+nHrVNFognGSXahYGJV3lFmY4NWupp
         PkHCbkYBrnBHf5G3inXf8nUomzrEakVNjTNnVWvuOL9nmdOUdbSj1XQpEGfF32F6JhMh
         Lcw252jpizYIFTEUuJ+dc8CeT7xUyVhJAbHY1Azq52DJY6TG0QOMmvHE7qCRcl9QXJod
         9cpV5wZAKqerDKWybU/nHMNKMsaRQ4BTwPSpaf9bUPw/1SjblPfyTaE6NLJJ5gY/3F2c
         UXiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790172266; x=1790777066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUXKudTNYRkjkcRMUBw+hNaRYWoi0rr6zfNliaS2E8A=;
        b=FqP+A2yV5Q31tUb6WR4BedC/hClmDO4MO7RrWaKXQoSBLZ5F3F5BGY1W7VMkkBcQZn
         4qN+M5Kxj5GURgxeoj3VgqpYb7gsCXkOuRHOCg1kjdDuMT8v4mCzARE16QYPMa0FQMbH
         eQoyHxkioz9xUe7rNOpi0G1bqV4uD3fDDOq/C1kcaoz8I3ZKLuF1gq3InJp6ZWVKCPQb
         jwk8uuXvH6Q5j3b6k89sBS/8ormC/+Qs9ydPsY+LrdfSzEqeqHtmJyFgWjaBmpdFmACo
         XKsurgmV4WOqmG1l8wWP67KXYBgDBgqcv5FInycUGs7lcQZpKsJZ9XW78CYotHjyTLat
         FnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172266; x=1790777066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUXKudTNYRkjkcRMUBw+hNaRYWoi0rr6zfNliaS2E8A=;
        b=e2JROHN6pvu3mDd2IB74tdp2TCdsWTQ3FNcXD8Z0dU43ga1pi18mqz/kO195FGCPXF
         UoFvLKVdBQtanrx6uttYRobbm3p3D4UKREQ6rgOhEbWbg5wmxVxiPc7UJJqe0eDwqyCP
         7jzmkqN8SKarYBAREx95zgS2E6Xk/NrrwGqf07b+JFciyGMxk+J0polb0t3zny6xVQ88
         auvdmj3u0Y1nDHlZ2I0/xk2dygYj454fENbPZXsWcv7JgACbJQNK574FzXZod/c7oF0z
         tAP1sn/26Ita/8WLX22KRS8WJa7jCLUTNHRy7ELn1mEv30uWUUg2z3HLg7HAjCEow8Y2
         iitw==
X-Forwarded-Encrypted: i=1; AKwUvBziAl6vv55rBP1dJS0OwNkaH1VcMHTCCJfeMzcloVx4mgk+l8o/t1FyEH2cuJ1wmJwXeFZq8OTc62BKNKU=@vger.kernel.org
X-Gm-Message-State: AFuF++kzCa6e6WoPjtoTh7eSK0FhqluU7sVT7qIuR1yIceWbvmZCWLvQ
	8NQS1cv0aFcha7PsVdHFWed+/wwnReeSSZLfvUz8lCAWccR/QUqicoJFzvfiZER+2rNlgnXW7ks
	KMu4L+2170iFSlOb3HcSfENICenTnFMjoRz2fiTArm0l2NlwkHe04IYFJvMY++TWaGYW8+eJNNw
	SzxsaNraLyVJtBDUKA4cQA28VwpZDi2awf2xTfALi3Ig==
X-Gm-Gg: AYBFou3mYUNzdA/6ID5PbpK7Aggh+ilRSDrEIsiWCyASYhfCxeJl4y33+3o2j4yvyTC
	uMxLqh591qYQJyzfqdDjt5A4ZFZMfSMizI6yNOJIZoDisV1XxbipxihzqrI1P3SWkV1yfKHTkx4
	KRIYqgCjyjZ0icV5F8WowoPpTxTJKlTqEAbyCyZNjZLrpZK63SzCxzFa4=
X-Received: by 2002:a05:690c:e3cf:b0:86c:c7a8:2ebd with SMTP id 00721157ae682-8a45afa5e8fmr18610517b3.34.1790172265564;
        Wed, 23 Sep 2026 07:04:25 -0700 (PDT)
X-Received: by 2002:a05:690c:e3cf:b0:86c:c7a8:2ebd with SMTP id
 00721157ae682-8a45afa5e8fmr18609887b3.34.1790172264973; Wed, 23 Sep 2026
 07:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922131735.524635-1-marouene.boubakri@oss.nxp.com>
In-Reply-To: <20260922131735.524635-1-marouene.boubakri@oss.nxp.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:04:13 +0200
X-Gm-Features: AclHuK8BjLW6J8lXasYZWu38EGIbC1BxDyDBkkPm0GiEF2_C5KVvAqvITCDgvlY
Message-ID: <CAGgiveXEa=EXed3fJ7+rEr5-8aEX--jF90PtkhXPoWJg0Hv8jQ@mail.gmail.com>
Subject: Re: [PATCH v3] tee: optee: build the Arm-specific code only on Arm
To: marouene.boubakri@oss.nxp.com
Cc: jenswi@kernel.org, sumit.garg@kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        amirreza.zarrabi@oss.qualcomm.com, peter.lin@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab3dc6a cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=4M5lNuO9mvEfoSjbydwA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: i3nhfgG1aIzaMJoceAwZXWoKsSBXp4Js
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX75uMsJmrJ8vQ
 kT6hINScz/egmmoOBHXh8vhpFrdwJ8eurJ6fw8FPB+3tm4BHb2nckpz2Vir2rrb9Ys4oYWYBnbO
 vL0Mh2zIIquCqh4YfZcJxfmXbk2E1m4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX859pp+A0ucav
 kBZlCRapTx6pnRjWiRkMN7lkvtaWobhkM5p2jCWIHWZyIUxy9nqP7+BOYj3KDhZo7KtAF33JD4H
 B4IxPWEjnJuTfoNU/N/mTKh2lQi09Tr2x4ZhzDrnkV3PN0sQY6+voeMYKUD/IMTwAt0PdgLL6VL
 kaXss36cJ/SgH3drqaSSwjHS2w5k39XveU9+S/1yOqKOFW23qAL/l2+duYCxI+eK5StDqQENnxg
 R4BtodAavHpRJJXVX9jB+8XcX63hgDQXAamXyV2F/1kmYn+MGfK4hPJFKXkvp8hMZvqFEmnvijW
 zox1Ioe5FXWiMH9VTFb6QAjjBR2Vw1WqKOXDHVTYm/DCh8wYwRBlrJGYVwoDMso4Uj9877btEZG
 LhsRJm9JXmCe2DhmPmTPm0xfXqlS6GiVrWrk6H1oughL05PE/Xd0uPHyoz5MZa4EMUDvJlxuAAt
 I/spll6kCkv1DoCjv5w==
X-Proofpoint-ORIG-GUID: i3nhfgG1aIzaMJoceAwZXWoKsSBXp4Js
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230056

Hi,

On Tue, Sep 22, 2026 at 3:03=E2=80=AFPM <marouene.boubakri@oss.nxp.com> wro=
te:
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
> the FF-A transport is reachable, and provide stubs for their
> registration otherwise, so that it fails with -EOPNOTSUPP as the FF-A
> ABI already does when the FF-A transport is not reachable. Keep the
> SMCCC header, the SMC invoke function type, the SMC and FF-A specific
> structures and the SMC RPC register parameters in optee_private.h under
> the same conditions, and drop the unused <linux/arm-smccc.h> include
> from notif.c.
>
> The FF-A parts are keyed on IS_REACHABLE() rather than IS_ENABLED() to
> preserve the behaviour of a built-in driver with a modular FF-A
> transport: kbuild does not link the optee-m objects into a built-in
> optee.o, so ffa_abi.c is left out exactly when the transport is not
> reachable and the stubs are used instead. The IS_REACHABLE() checks in
> optee_ffa_abi_register() and optee_ffa_abi_unregister() are always true
> once ffa_abi.c is only compiled in that case, so drop them.
>
> No functional change: OPTEE still depends on HAVE_ARM_SMCCC, and
> ffa_abi.c is still built whenever the FF-A ABI can be registered.
>
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> ---
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
>  drivers/tee/optee/Makefile        |  4 ++--
>  drivers/tee/optee/ffa_abi.c       |  8 ++-----
>  drivers/tee/optee/notif.c         |  1 -
>  drivers/tee/optee/optee_private.h | 39 ++++++++++++++++++++++++++++++-
>  4 files changed, 42 insertions(+), 10 deletions(-)

Looks good, but I think that while we're at it, we should add
--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -5,6 +5,7 @@ config OPTEE
        depends on HAVE_ARM_SMCCC
        depends on MMU
        depends on RPMB || !RPMB
+       depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
        help
          This implements the OP-TEE Trusted Execution Environment (TEE)
          driver.

to make the optee driver a module if the FF-A transport is a module.

Cheers,
Jens

>
> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
> index ad7049c..183cdde 100644
> --- a/drivers/tee/optee/Makefile
> +++ b/drivers/tee/optee/Makefile
> @@ -7,8 +7,8 @@ optee-objs +=3D rpc.o
>  optee-objs +=3D protmem.o
>  optee-objs +=3D supp.o
>  optee-objs +=3D device.o
> -optee-objs +=3D smc_abi.o
> -optee-objs +=3D ffa_abi.o
> +optee-$(CONFIG_HAVE_ARM_SMCCC) +=3D smc_abi.o
> +optee-$(CONFIG_ARM_FFA_TRANSPORT) +=3D ffa_abi.o
>
>  # for tracing framework to find optee_trace.h
>  CFLAGS_smc_abi.o :=3D -I$(src)
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index 633715b..08236d8 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -1212,14 +1212,10 @@ static struct ffa_driver optee_ffa_driver =3D {
>
>  int optee_ffa_abi_register(void)
>  {
> -       if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
> -               return ffa_register(&optee_ffa_driver);
> -       else
> -               return -EOPNOTSUPP;
> +       return ffa_register(&optee_ffa_driver);
>  }
>
>  void optee_ffa_abi_unregister(void)
>  {
> -       if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
> -               ffa_unregister(&optee_ffa_driver);
> +       ffa_unregister(&optee_ffa_driver);
>  }
> diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
> index 6e85f2f..6801422 100644
> --- a/drivers/tee/optee/notif.c
> +++ b/drivers/tee/optee/notif.c
> @@ -5,7 +5,6 @@
>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> -#include <linux/arm-smccc.h>
>  #include <linux/errno.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_=
private.h
> index aefe1e6..02d6f79 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -6,7 +6,6 @@
>  #ifndef OPTEE_PRIVATE_H
>  #define OPTEE_PRIVATE_H
>
> -#include <linux/arm-smccc.h>
>  #include <linux/notifier.h>
>  #include <linux/rhashtable.h>
>  #include <linux/rpmb.h>
> @@ -15,6 +14,10 @@
>  #include <linux/types.h>
>  #include "optee_msg.h"
>
> +#ifdef CONFIG_HAVE_ARM_SMCCC
> +#include <linux/arm-smccc.h>
> +#endif
> +
>  #define DRIVER_NAME "optee"
>
>  #define OPTEE_MAX_ARG_SIZE     1024
> @@ -42,10 +45,12 @@
>   */
>  #define OPTEE_DEFAULT_MAX_NOTIF_VALUE  255
>
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  typedef void (optee_invoke_fn)(unsigned long, unsigned long, unsigned lo=
ng,
>                                 unsigned long, unsigned long, unsigned lo=
ng,
>                                 unsigned long, unsigned long,
>                                 struct arm_smccc_res *);
> +#endif
>
>  /**
>   * struct optee_call_waiter - TEE entry may need to wait for a free TEE =
thread
> @@ -119,6 +124,7 @@ struct optee_supp {
>         struct completion reqs_c;
>  };
>
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  /**
>   * struct optee_pcpu - per cpu notif private struct passed to work funct=
ions
>   * @optee:     optee device reference
> @@ -149,7 +155,9 @@ struct optee_smc {
>         struct work_struct notif_pcpu_work;
>         unsigned int notif_cpuhp_state;
>  };
> +#endif
>
> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>  /**
>   * struct optee_ffa -  FFA communication struct
>   * @ffa_dev:           FFA device, contains the destination id, the id o=
f
> @@ -170,6 +178,7 @@ struct optee_ffa {
>         struct workqueue_struct *notif_wq;
>         struct work_struct notif_work;
>  };
> +#endif
>
>  struct optee;
>
> @@ -257,8 +266,12 @@ struct optee {
>         const struct optee_ops *ops;
>         struct tee_context *ctx;
>         union {
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>                 struct optee_smc smc;
> +#endif
> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>                 struct optee_ffa ffa;
> +#endif
>         };
>         struct optee_shm_arg_cache shm_arg_cache;
>         struct optee_call_queue call_queue;
> @@ -290,6 +303,7 @@ struct optee_context_data {
>         struct list_head sess_list;
>  };
>
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  struct optee_rpc_param {
>         u32     a0;
>         u32     a1;
> @@ -300,6 +314,7 @@ struct optee_rpc_param {
>         u32     a6;
>         u32     a7;
>  };
> +#endif
>
>  /* Holds context that is preserved during one STD call */
>  struct optee_call_ctx {
> @@ -422,9 +437,31 @@ static inline void reg_pair_from_64(u32 *reg0, u32 *=
reg1, u64 val)
>  }
>
>  /* Registration of the ABIs */
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  int optee_smc_abi_register(void);
>  void optee_smc_abi_unregister(void);
> +#else
> +static inline int optee_smc_abi_register(void)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static inline void optee_smc_abi_unregister(void)
> +{
> +}
> +#endif
> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>  int optee_ffa_abi_register(void);
>  void optee_ffa_abi_unregister(void);
> +#else
> +static inline int optee_ffa_abi_register(void)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static inline void optee_ffa_abi_unregister(void)
> +{
> +}
> +#endif
>
>  #endif /*OPTEE_PRIVATE_H*/
>
> base-commit: 827751b699b79a6e569983359c02dce67f81b94c
> --
> 2.43.0
>
