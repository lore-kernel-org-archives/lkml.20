Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F195345D5E7
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447662; cv=pass; b=sFeGGfnI/f03+547GGrXcam5WXahGRfcXzq95NOesW6eSd1vm3NQYt3j/A+W71Edvwr6xuM+mV7jlvZZew+RzpfiC15HjCrgC50XOjFPIq0t5Eg98OkycWlGmiKzn45WbgLC4Ucz8Vwt1PVHAvIC4r6myPknAEI3i+M79HW2KhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447662; c=relaxed/simple;
	bh=f0QzkL7iQswY0wlcgPH9TLEqtFMDOW+G71b2GJY8Sj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTkm8qOi21LAfdCUwn02lAOKcuOHEWeaeg6tx2HDPS4HhXytFzJRqqETRRie042khLhAfwQtVXoSTbRGY5UVCviSsCg+lHeMcwVe+0aBeM+GCUfkhyMR0GI4wR+ejSjDqM6UboMSgTcXFCChI2fDmVlMh1b0dofucDC8pdTEaQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3Xks1Tr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgIZIZoP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3Xks1Tr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgIZIZoP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KBt02560132
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 08:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIB4cQl0exFGRFC8UdOd4HdHw0g8TKxWx5FsF8wd+Pc=; b=Z3Xks1TrD2dT/8/N
	RDEZSZpeaD/IwUNbfh4XNQ3ep+4y7TMI9VW8Lr7i20Rp5WLtt3T8mnz1/nq5T//F
	t37QKS6VJP76Rn9h0VYVfBWXg0zCwbsNQbLYWiWTqwMP3f5J43Znt/KbbeXXttzV
	D6X0kGqiVGukjbYFPqR8xtr4YMwNgF07/Szuf623dKnWrHzOfbix09uNGEv238TQ
	1pb9Uz+uqj6OPHpR1lob0L524GaUuIsjO1NFr3O9BtYJY4oqHJMCnhf28of3YUUL
	bjBPcfHhU8Md+V3gZyKFmQCAW3D8hjXmIF9HVCaNglLjMJRn3mvg9EocfijPj0yY
	UEQSCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe81uqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:20:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46c120dfso549852185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791447659; cv=none;
        d=google.com; s=arc-20260327;
        b=AJZnOOeQoeg2wDhi6rsce0/ymGM8FER2OK1DYvqbgi7VX9AgB3YxjWHsi4sqAOiTim
         +1hDqmlNm51R47nhf02Qm/GhzmYeFRD7YXvbUFSDImp4aWEeey6AZCJvkNsM68lMJuCQ
         utYpS6knDeWr6acztF251z8sT3CoTpteMe6SCKoBG9Rd6Z71FJlQSMoTJmNcpbZ6rDhY
         al5zUzC94E+LQ2/bJDV/uTVyYbISRY3zIobEo3YcEEOmfoQE1h0OVH6Kip5ILO/WhDqe
         wSwUeMcFkzvmZszxBKyWxGquLNQofkJ+syZRgfErpYSVINGeCWryE9yETgm+JKMHMY3w
         bmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zIB4cQl0exFGRFC8UdOd4HdHw0g8TKxWx5FsF8wd+Pc=;
        fh=4AHXVRg4rf8bjit+jBavKzgGjjaZ53h74Qed/n9nMxs=;
        b=S/uwejNtgiMrEU1J3hgjG9QSXo+stNkNMySZPH45GhVSUAy56gOazR6j0s75yTKcds
         9i7VNbvP1BrP69d7XA4sxQR5J2CPlHYpq5s50qkq+io9AAfY6oK1QhwkMBhP3mcGYWOs
         OPqD67BI0cmK1sf1GmL4nSFlc/ByFfO/aLIHy4CgEkvKdwze+4WKfRu6VAOlFsGcyNXL
         YjTUjXDsICKD5DXBnzhIWqd0diRnSGSkPleUU2RttveUHCX8AO6nnb3yptgccFCcqgOS
         ZCJGSun65jLtRCb4lW0JB7omuZPl+fZXHLTE07UmpbU1EybM5kzPSt9Aavvtn4kZY43V
         WrZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447659; x=1792052459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zIB4cQl0exFGRFC8UdOd4HdHw0g8TKxWx5FsF8wd+Pc=;
        b=bgIZIZoPELUt4s27qhnZR41Zjx/rrM3tCPoTaFpOsn0dZJr2gJDtkFmrnIblqf5+et
         Yo3fKVJUBy5/znLaqOyupwtI8nJBVHInvCO0GmvLhb57CK791FJHyWAutJmDAXHhj3B8
         ajVnkxKLcH9FjvFDDGRBCgRF0wsZMcCh3qph6RnDCbelCYpRG6fMkpuzL712zR7Hqs7c
         +gYG1clCOzF3fRAS6V8DaLBeF9wV758xizw7U84sZ7e4Ez39/6FQbVothGPzbncKzeT4
         yRJRwcYII9vCNfRYnoNjSwJoev9FlLZuux059FdKqYFs6bwt8kJCVt1NthmmGo0X7yB1
         KSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447659; x=1792052459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIB4cQl0exFGRFC8UdOd4HdHw0g8TKxWx5FsF8wd+Pc=;
        b=Ho86Cl0iE80gU3X06JUV45fsqE/G8v3aJtGE92S+h2L4FF/sy2ES+9nb90Z6DeD5LT
         lPEPKiwkVYn5OMfDjJkdUOVs0HQyexv08RvBPoAN88+By3mq1qFHelBpjRzQ/Q537N/Z
         4X8DxSCJHAYIP8ucID3fmurPVRTI1yNg8kw3KT/Bns2u7fY5Dp7z35RgQepckk900kUi
         j1o5foRAxkru6vVrSoGhbHn7R60C/+KRtEpMUiR4nvy4P4iIorGLik1Z241xLrnAqps9
         fztyNK7YMMzrkP46JBfpPj5BAJ2T/wG+rLPYR3QIicaJTlb6d5KjuHm+HaRqcU9XaGot
         IFkg==
X-Forwarded-Encrypted: i=1; AKwUvBxIEE7fnxrIGqFDQVp6Nli0ipgvUiG2UggtQVUue/o0c7ZqWjwwmN7jqGbRlvNuxT1ybeiE40yvzxaEIww=@vger.kernel.org
X-Gm-Message-State: AFuF++m6cxGJGSYUHzpPtafh0Fp33lcKz4gbjDIlKVMebwR2o8gkcp9n
	BLDhn7I9XpTgTkbV7XqFhx+cL18+forVTeeP5lUHAq8LpoM6YHXTAV7vM/VKJvcIPcNrcg0/GTs
	nG7hmxYgII8k1NnoNAD6eAxCxBpnv3QSJ0z707wcrwtCbDamfz4yi7PVu2JBAcBJypDH2j/lxfb
	IC/3W2IS9M7vWy4csF6BNMroDh4SmOxew8mWAHRLsmbw==
X-Gm-Gg: AYBFou1oj/8MZaTwbnrdknnEIm/HvFw2Hv7Qj2jhLaj8SRl8X0CxkUvJpGIUPCasKDN
	xtielcEnPz3/2D9Jy5JKW/qxGyhJ1KyCMgj7Gv6I6WX35XlBGTkipBEoAqMD1iVjXxWRnwBO81n
	9snIhDrmr0xQxFR6/Cw6KpSGyrNGZTroJd/OlWo/gFEFd+b8Y9mjrN4AE=
X-Received: by 2002:a05:620a:2707:b0:93b:e9db:1bab with SMTP id af79cd13be357-93e9b7ec3damr815937285a.56.1791447658749;
        Thu, 08 Oct 2026 01:20:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2707:b0:93b:e9db:1bab with SMTP id
 af79cd13be357-93e9b7ec3damr815933385a.56.1791447657991; Thu, 08 Oct 2026
 01:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-7-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-7-72f222e23ec1@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 10:20:45 +0200
X-Gm-Features: AclHuK8VszX8MM8O8iN0SFhYNBrpC6tFcWm59t5pLqXff-TCJYx0we4frgkakhg
Message-ID: <CAGgiveU+8d-MmPL4n_ADimkrthsE1sU4QHJoBeh==sxLZmdrFw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 7/8] tee: optee: bind RPMI services and negotiate
 backend capabilities
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX3LKz8gGsxScm
 pzVqB1Xyns6ZgQ3ddlm2kMyzH0bHyFgcDsJRCK/bbgQToeuoht75L5FFnk7s9B4FEcWxTJ4uV7S
 2wUHB1vpllmHKDigkfzNY5qJt0dt/mcUaFiJP+nkw51rjOuyyb9Hg3G6xsrUPMP0hkWlZXHjMhv
 IXPKaXUae/LmO1jjQs1Jwrl3um6TqJ3Jihgkr4qp28Z88OMVEQyUVSK/E41xDtbrD7SQ3PL4/0s
 yb6Pk+kEXNd6wDNyQY9XGLQFNYGke/v4Pha9ATuhL+fVC6c1TzM0HGFg2M34B9QKHkcIVUrbw0M
 dtcComyXw8sdN5euT3u2+eaEZ1SnMivr+uk86ZdvLWV1CPw5MoRxvkGltRtYfE3qYFRgg6HTzRd
 0CnSG4dtH/jGw2vil2EJ/4xvNupZljlsQcKE+fsePmBbMxw00GJ8S+IZB26ficMrMB1b44sQWgJ
 8wmeTKvP9tYpG2CLlfQ==
X-Proofpoint-GUID: JRgjTBv_Nz42kMGxPu8--nEqdRuWZ924
X-Proofpoint-ORIG-GUID: JRgjTBv_Nz42kMGxPu8--nEqdRuWZ924
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX9JQu9t7OLsFe
 LF6iFugLVEEfDGR6lt2oY8r4FVwUDx9A6yM1NPZHkbIHl+7+p5oT8ulKuNpkANt+Nzov5KDz4mS
 5t1UV4VQBDPRAzWp5IhLNW5HdsUObG4=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac7526b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=G3rC2xmL4Tt6fuppFqwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080033

Hi Amir,

On Tue, Oct 6, 2026 at 2:40=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Register an RPMI service driver matching the OP-TEE service UUID and
> integrate it with OP-TEE module initialization and removal.
>
> Check the service API version, query the trusted OS revision, and
> obtain the RPC parameter and logical notification counts. Initialize
> shared-memory tracking, the call queue, supplicant state and internal
> context before publishing the client and supplicant TEE devices.
>
> Connect the RPMI backend to the common OP-TEE operations and enumerate
> trusted application devices. Enable in-kernel RPMB routing when the
> RPMB subsystem is reachable.
>
> Add removal and probe failure cleanup for the backend resources.
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/optee/core.c          |  10 +-
>  drivers/tee/optee/optee_private.h |  21 ++-
>  drivers/tee/optee/rpmi_abi.c      | 286 ++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 312 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index a52c1f498b99..8a44a25ebc66 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -220,6 +220,7 @@ void optee_remove_common(struct optee *optee)
>
>  static int smc_abi_rc;
>  static int ffa_abi_rc;
> +static int rpmi_abi_rc;
>  static bool intf_is_regged;
>
>  static int __init optee_core_init(void)
> @@ -245,14 +246,15 @@ static int __init optee_core_init(void)
>
>         smc_abi_rc =3D optee_smc_abi_register();
>         ffa_abi_rc =3D optee_ffa_abi_register();
> +       rpmi_abi_rc =3D optee_rpmi_abi_register();
>
> -       /* If both failed there's no point with this module */
> -       if (smc_abi_rc && ffa_abi_rc) {
> +       /* Keep the module if any supported transport registered successf=
ully. */
> +       if (smc_abi_rc && ffa_abi_rc && rpmi_abi_rc) {
>                 if (IS_REACHABLE(CONFIG_RPMB)) {
>                         rpmb_interface_unregister(&rpmb_class_intf);
>                         intf_is_regged =3D false;
>                 }
> -               return smc_abi_rc;
> +               return -EOPNOTSUPP;
>         }
>
>         return 0;
> @@ -270,6 +272,8 @@ static void __exit optee_core_exit(void)
>                 optee_smc_abi_unregister();
>         if (!ffa_abi_rc)
>                 optee_ffa_abi_unregister();
> +       if (!rpmi_abi_rc)
> +               optee_rpmi_abi_unregister();
>  }
>  module_exit(optee_core_exit);
>
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_=
private.h
> index 2422caf3c883..07c27e322a71 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -188,6 +188,8 @@ struct rpmi_tee_device;
>   * @rdev: owning RPMI service device
>   * @shm_rht_lock: protects parcel lookup, insertion, removal and publica=
tion
>   * @shm_rht: lookup by the host-endian parcel ID and nonce pair
> + * @sec_caps: negotiated optional OPTEE_RPMI_CAP_* features
> + * @notification_count: negotiated nonzero number of logical notificatio=
n keys
>   *
>   * Callers keep their tee_shm alive while using its registration. Lookup
>   * returns a raw pointer; the mutex does not protect its lifetime after
> @@ -199,6 +201,8 @@ struct optee_rpmi {
>         /* Protects parcel lookup, insertion, removal and publication. */
>         struct mutex shm_rht_lock;
>         struct rhashtable shm_rht;
> +       u32 sec_caps;
> +       u32 notification_count;

Why are these two needed?

>  };
>  #endif
>
> @@ -211,8 +215,8 @@ struct optee;
>   * @os_build_id:       OP-TEE OS build identifier (0 if unspecified)
>   *
>   * Values come from OPTEE_SMC_CALL_GET_OS_REVISION (SMC ABI) or
> - * OPTEE_FFA_GET_OS_VERSION (FF-A ABI); this is the trusted OS revision,=
 not an
> - * FF-A ABI version.
> + * OPTEE_FFA_GET_OS_VERSION (FF-A ABI) or OPTEE_RPMI_GET_OS_VERSION (RPM=
I ABI).
> + * This is the trusted OS revision, not a transport ABI version.
>   */
>  struct optee_revision {
>         u32 os_major;
> @@ -490,5 +494,18 @@ static inline void optee_ffa_abi_unregister(void)
>  }
>  #endif
>
> +#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
> +int optee_rpmi_abi_register(void);
> +void optee_rpmi_abi_unregister(void);
> +#else
> +static inline int optee_rpmi_abi_register(void)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static inline void optee_rpmi_abi_unregister(void)
> +{
> +}
> +#endif
>
>  #endif /*OPTEE_PRIVATE_H*/
> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> index 6e76316794c1..db541f3de425 100644
> --- a/drivers/tee/optee/rpmi_abi.c
> +++ b/drivers/tee/optee/rpmi_abi.c
> @@ -684,3 +684,289 @@ static int optee_rpmi_do_call_with_arg(struct tee_c=
ontext *ctx,
>
>         return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread=
);
>  }
> +
> +/* Query and store the trusted OS revision. */
> +static int optee_rpmi_get_os_version(struct optee *optee)
> +{
> +       struct optee_rpmi_probe_req req =3D {
> +               .op =3D cpu_to_le32(OPTEE_RPMI_GET_OS_VERSION),
> +       };
> +       struct optee_rpmi_os_resp os;
> +       int ret;
> +
> +       ret =3D optee_rpmi_call(optee, &req, sizeof(req), &os, sizeof(os)=
);
> +       if (ret)
> +               return ret;
> +
> +       optee->revision.os_major =3D get_unaligned_le32(&os.major);
> +       optee->revision.os_minor =3D get_unaligned_le32(&os.minor);
> +       optee->revision.os_build_id =3D get_unaligned_le64(&os.build_id);
> +
> +       if (optee->revision.os_build_id)
> +               pr_info("revision %u.%u (%016llx)\n",
> +                       optee->revision.os_major, optee->revision.os_mino=
r,
> +                       optee->revision.os_build_id);
> +       else
> +               pr_info("revision %u.%u\n", optee->revision.os_major,
> +                       optee->revision.os_minor);
> +
> +       return 0;
> +}
> +
> +/* Query and store secure-world capabilities and buffer limits. */
> +static int optee_rpmi_exchange_caps(struct optee *optee)
> +{
> +       struct optee_rpmi_probe_req req =3D {
> +               .op =3D cpu_to_le32(OPTEE_RPMI_EXCHANGE_CAPABILITIES),
> +       };
> +       struct optee_rpmi_caps_resp caps;
> +       u32 rpc_count, sec_caps, notif_count;
> +       int ret;
> +
> +       ret =3D optee_rpmi_call(optee, &req, sizeof(req), &caps, sizeof(c=
aps));
> +       if (ret)
> +               return ret;
> +
> +       sec_caps =3D get_unaligned_le32(&caps.secure_caps);
> +       rpc_count =3D get_unaligned_le32(&caps.rpc_param_count);
> +       notif_count =3D get_unaligned_le32(&caps.notification_count);
> +       if (!notif_count || !rpc_count)
> +               return -EPROTO;
> +
> +       optee->rpc_param_count =3D rpc_count;
> +       optee->rpmi.sec_caps =3D sec_caps;
> +       optee->rpmi.notification_count =3D notif_count;
> +       optee->in_kernel_rpmb_routing =3D IS_REACHABLE(CONFIG_RPMB);

What if OP-TEE is built without RPMB support?

> +
> +       return 0;
> +}
> +
> +static int optee_rpmi_api_is_compatible(struct optee *optee)
> +{
> +       struct optee_rpmi_probe_req req =3D {
> +               .op =3D cpu_to_le32(OPTEE_RPMI_GET_API_VERSION),
> +       };
> +       struct optee_rpmi_api_resp api;
> +       int ret;
> +
> +       ret =3D optee_rpmi_call(optee, &req, sizeof(req), &api, sizeof(ap=
i));
> +       if (ret)
> +               return ret;
> +
> +       if (get_unaligned_le32(&api.major) !=3D OPTEE_RPMI_VERSION_MAJOR)
> +               return -EPROTONOSUPPORT;
> +
> +       /* Version 1.0 has no minimum minor revision beyond zero. */
> +       return 0;
> +}
> +
> +static void optee_rpmi_get_version(struct tee_device *teedev,
> +                                  struct tee_ioctl_version_data *vers)
> +{
> +       *vers =3D (struct tee_ioctl_version_data) {
> +               .impl_id =3D TEE_IMPL_ID_OPTEE,
> +               .gen_caps =3D TEE_GEN_CAP_GP | TEE_GEN_CAP_REG_MEM |
> +                           TEE_GEN_CAP_MEMREF_NULL,
> +       };
> +}
> +
> +static int optee_rpmi_open(struct tee_context *ctx)
> +{
> +       return optee_open(ctx, true);
> +}
> +
> +static const struct tee_driver_ops optee_rpmi_clnt_ops =3D {
> +       .get_version =3D optee_rpmi_get_version,
> +       .get_tee_revision =3D optee_get_revision,
> +       .open =3D optee_rpmi_open,
> +       .release =3D optee_release,
> +       .open_session =3D optee_open_session,
> +       .close_session =3D optee_close_session,
> +       .invoke_func =3D optee_invoke_func,
> +       .cancel_req =3D optee_cancel_req,
> +       .shm_register =3D optee_rpmi_shm_register,
> +       .shm_unregister =3D optee_rpmi_shm_unregister,
> +};
> +
> +static const struct tee_driver_ops optee_rpmi_supp_ops =3D {
> +       .get_version =3D optee_rpmi_get_version,
> +       .get_tee_revision =3D optee_get_revision,
> +       .open =3D optee_rpmi_open,
> +       .release =3D optee_release_supp,
> +       .supp_recv =3D optee_supp_recv,
> +       .supp_send =3D optee_supp_send,
> +       .shm_register =3D optee_rpmi_shm_register,
> +       .shm_unregister =3D optee_rpmi_shm_unregister_supp,
> +};
> +
> +static const struct tee_desc optee_rpmi_clnt_desc =3D {
> +       .name =3D DRIVER_NAME "-rpmi-clnt",
> +       .ops =3D &optee_rpmi_clnt_ops,
> +       .owner =3D THIS_MODULE,
> +};
> +
> +static const struct tee_desc optee_rpmi_supp_desc =3D {
> +       .name =3D DRIVER_NAME "-rpmi-supp",
> +       .ops =3D &optee_rpmi_supp_ops,
> +       .owner =3D THIS_MODULE,
> +       .flags =3D TEE_DESC_PRIVILEGED,
> +};
> +
> +static const struct optee_ops optee_rpmi_ops =3D {
> +       .do_call_with_arg =3D optee_rpmi_do_call_with_arg,
> +       .to_msg_param =3D optee_rpmi_to_msg_param,
> +       .from_msg_param =3D optee_rpmi_from_msg_param,
> +};
> +
> +/* Keep callback state and memory tables alive until all TEE users relea=
se. */
> +static void optee_rpmi_remove(struct rpmi_tee_device *rdev)
> +{
> +       struct optee *optee =3D dev_get_drvdata(&rdev->dev);
> +
> +       optee_remove_common(optee);
> +       optee_rpmi_shm_rht_uninit(optee);
> +       kfree(optee);
> +}
> +
> +static int optee_rpmi_probe(struct rpmi_tee_device *rdev)
> +{
> +       struct tee_device *teedev;
> +       struct tee_context *ctx;
> +       int ret;
> +
> +       struct optee *optee __free(kfree) =3D kzalloc_obj(*optee);

The cleanup macros should, if I understand it correctly, not be used
in functions using gotos for cleanup.

> +       if (!optee)
> +               return -ENOMEM;
> +
> +       optee->rpmi.rdev =3D rdev;
> +       optee->ops =3D &optee_rpmi_ops;
> +
> +       ret =3D optee_rpmi_api_is_compatible(optee);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D optee_rpmi_get_os_version(optee);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D optee_rpmi_exchange_caps(optee);
> +       if (ret)
> +               return ret;
> +
> +       optee->pool =3D optee_rpmi_shm_pool_alloc();

Perhaps it's just me, but it seems a bit odd to store an err pointer
in a struct like this.

> +       if (IS_ERR(optee->pool))
> +               return PTR_ERR(optee->pool);
> +
> +       ret =3D optee_rpmi_shm_rht_init(optee);
> +       if (ret)
> +               goto err_pool;
> +
> +       optee_cq_init(&optee->call_queue, 0);
> +       optee_supp_init(&optee->supp);
> +       optee_shm_arg_cache_init(optee, OPTEE_SHM_ARG_SHARED);
> +       mutex_init(&optee->rpmb_dev_mutex);
> +       INIT_WORK(&optee->rpmb_scan_bus_work, optee_bus_scan_rpmb);
> +       optee->rpmb_intf.notifier_call =3D optee_rpmb_intf_rdev;
> +       ret =3D optee_notif_init(optee, optee->rpmi.notification_count);
> +       if (ret)
> +               goto err_common;
> +
> +       /* Allocate all keys, then restrict the inclusive bound to the la=
st key. */
> +       optee->notif.max_key =3D optee->rpmi.notification_count - 1;

Why? Do you have any plans for that?

Cheers,
Jens

> +
> +       teedev =3D tee_device_alloc(&optee_rpmi_clnt_desc, &rdev->dev,
> +                                 optee->pool, optee);
> +       if (IS_ERR(teedev)) {
> +               ret =3D PTR_ERR(teedev);
> +               goto err_notif;
> +       }
> +       optee->teedev =3D teedev;
> +
> +       teedev =3D tee_device_alloc(&optee_rpmi_supp_desc, &rdev->dev,
> +                                 optee->pool, optee);
> +       if (IS_ERR(teedev)) {
> +               ret =3D PTR_ERR(teedev);
> +               goto err_devices;
> +       }
> +       optee->supp_teedev =3D teedev;
> +
> +       optee_set_dev_group(optee);
> +
> +       /* Internal RPC allocation must be ready before userspace can ent=
er. */
> +       ctx =3D teedev_open(optee->teedev);
> +       if (IS_ERR(ctx)) {
> +               ret =3D PTR_ERR(ctx);
> +               goto err_devices;
> +       }
> +
> +       optee->ctx =3D ctx;
> +       dev_set_drvdata(&rdev->dev, optee);
> +       if (optee->in_kernel_rpmb_routing)
> +               blocking_notifier_chain_register(&optee_rpmb_intf_added,
> +                                                &optee->rpmb_intf);
> +
> +       ret =3D tee_device_register(optee->teedev);
> +       if (ret)
> +               goto err_initialized;
> +
> +       ret =3D tee_device_register(optee->supp_teedev);
> +       if (ret)
> +               goto err_initialized;
> +
> +       ret =3D optee_enumerate_devices(PTA_CMD_GET_DEVICES);
> +       if (ret)
> +               goto err_initialized;
> +
> +       dev_info(&rdev->dev, "OP-TEE RPMI %u.%u initialized\n",
> +                optee->revision.os_major, optee->revision.os_minor);
> +       retain_and_null_ptr(optee);
> +
> +       return 0;
> +
> +err_initialized:
> +       /* The remove path owns and frees the published backend state. */
> +       retain_and_null_ptr(optee);
> +       optee_rpmi_remove(rdev);
> +
> +       return ret;
> +err_devices:
> +       tee_device_unregister(optee->supp_teedev);
> +       tee_device_unregister(optee->teedev);
> +       optee_shm_arg_cache_uninit(optee);
> +err_notif:
> +       optee_notif_uninit(optee);
> +err_common:
> +       optee_supp_uninit(&optee->supp);
> +       mutex_destroy(&optee->call_queue.mutex);
> +       rpmb_dev_put(optee->rpmb_dev);
> +       mutex_destroy(&optee->rpmb_dev_mutex);
> +       optee_rpmi_shm_rht_uninit(optee);
> +err_pool:
> +       tee_shm_pool_free(optee->pool);
> +
> +       return ret;
> +}
> +
> +static const struct rpmi_tee_device_id optee_rpmi_device_ids[] =3D {
> +       { OPTEE_RPMI_SERVICE_UUID },
> +       {}
> +};
> +
> +static struct rpmi_tee_driver optee_rpmi_driver =3D {
> +       .name =3D DRIVER_NAME "-rpmi",
> +       .probe =3D optee_rpmi_probe,
> +       .remove =3D optee_rpmi_remove,
> +       .id_table =3D optee_rpmi_device_ids,
> +};
> +
> +int optee_rpmi_abi_register(void)
> +{
> +       return rpmi_tee_register(&optee_rpmi_driver);
> +}
> +
> +void optee_rpmi_abi_unregister(void)
> +{
> +       rpmi_tee_unregister(&optee_rpmi_driver);
> +}
> +
> +MODULE_ALIAS("rpmi_tee:486178e0-e7f8-11e3-bc5e-0002a5d5c51b");
>
> --
> 2.34.1
>
