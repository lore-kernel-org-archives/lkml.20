Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AF73D4101
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447104; cv=pass; b=Mo40lRExDbvYSTu8WnEoxxHj0iLpOppkl19JSXS/0coKhhWL+9AYq8qkhIl0wwDznT+EwdwbvdU8jz+LPFHRa072k0ENuDjNNIvDhP6Bjfyl4e/ZpbbTQjV/EH064i7IWp85MBUPXLhfLtCBsqrtg5/CPJMb3WIXs3470OuqWM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447104; c=relaxed/simple;
	bh=D7UiphtT6EBwO/k/ikf2NWjb/RYMvUOnxloV2AvhWw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMDKjSzg3SEz1fVAmK8Kcb8r0P25kY34SW2UmbYVKsVegXTLbBN/2xafcV5ur13JjxOo9YRC8jPmjbmZvYCJOCFcEYMpKxMRVxsVaeGRK3WRp1PGvihquDf33WJFMGtxR4wF/WIXdGwLbt/9XgrP5jTiL3UNaEzAaN96NLtCzY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvENMn6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPuJfmAl; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvENMn6W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPuJfmAl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KBrF2560132
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 08:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JItcqZCTTZ5Tr3DrlkTjE4P6dQhLoTOAQJPbjV6HDlQ=; b=lvENMn6WoMDZJeJH
	01RdZR9gO8z+f/cXd2he/jnQUB2R8Xqeb3nw4iaPPwOttG3a26yJqZCpdD3uhOsG
	9dv454H28YeDbtIDbJNw6vmfZe4Pp5/SWvOyXQv2DddRCN/p72q60CHRngiL0nm0
	HB7i3KeAdrgd16ZFXWONK4Hegqyx/Y7hBTujduBGtoQ+dcdHkZDg1pfJ5EOtEV2W
	4j/FDmq0kxszm3QUrral1g168QvpxlWcIOeqN0QaNOVDJnoEii9Q+ZI7XqOIN/XR
	xK8GVS0+tg/72OYeqfInTymZIClV2yHOpJiJyt5ruO+0LNj3iymWfDmUjuakz/3j
	Scwa8g==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe81tgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:11:41 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-677ed839276so2279190d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791447101; cv=none;
        d=google.com; s=arc-20260327;
        b=GTPCiVUxN0zWaGVdNvfaqWL5i9ZhIPHqMHUDEOVODKqVXcXtBN5XuVhNOzMhXGu/fe
         WOZVyPb5K2GEjv4TK3bmeFZlOBdI6B5+m7UdLbxpJTp4p+8/3gdbM29kYEVow6AsFDth
         W+ZBhYPLTqKuPApK+dvD52fQm6BglZyLyL4FNiLlT4RBYJY5fghJafjie/Qgahrdp5ER
         sFFCElyX+LhOY9pK7N8g+AjbMvsoVXGpuSMTLCaoV9VTIW83TKmcXqGtH0/7ZgQm69Sp
         ZFruJdZJ4pIcCHHz5/NvH5WYz8qjTXWa9eh4rovLkaPk0KFQ+uFNxNTLHaseoKYQlpt6
         N8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JItcqZCTTZ5Tr3DrlkTjE4P6dQhLoTOAQJPbjV6HDlQ=;
        fh=w/Bo6//f5sA4mi9ZnRAYehOWlZ9TVPX4D4zEJCAY50Y=;
        b=C+WpcI2ywiJJrTOEJwaGotcMlvCaZC804vFTvL3zjitAALcK7GlcHXyoaOxLMCxzYh
         MQOVCQ6FAtKgER92PwdKmPpyPYSCRSFCPQkQjNoF2n5GKRNpxKdblGLl8TocUXXZcdXb
         +hlDHWPjY4GSBZsU9U3Gf2c25ypdHZhWLisPRmVMd7qmB3C95MNniqulho5ZDCwEiWxR
         jaCRGo3DN6DB4rs9ZSX3J/RQfIwBWCSTvMQ2c2ljH6H6fZ7c+R+YyLc2BIBLbD0wX521
         /61vdITtf3oA+9Eeh0zmRgXTxXFIRFAdO6vgxA/15G41W3bdvhLPKVz7ph/uH8o3xu/H
         7ZBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447101; x=1792051901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JItcqZCTTZ5Tr3DrlkTjE4P6dQhLoTOAQJPbjV6HDlQ=;
        b=cPuJfmAlDmRAR0o23MONYD5SHbwg6aqDhkseWn/Z21fLItX+/VzVMFtNtFzh/tgyAV
         9hrcMuUq2xQCUgjfBgX2fzFT1VDHEqxuQ6KBTCQuBSO8izCN2o2r6Rf+PVnUHxCosbzn
         v6TH1b98DKkzcbP9cxbLR5FuqC0GD2E/uTe0MgdoUZWp7pvMo+8dHqm9GrCn7fmV3cYh
         ZVUDgRtSsoWNitYQ9VRcv/PT3S0jBrstOUwO+k4IhPMhSzfKJqlWoK9bORCnu5Z/1OPf
         y7S9pmgAf45Icb3DAoedMxYLhjt+wDP+rUqASy7AZi5W8f06XjOJaV3eKF3LpfriHi8a
         aZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447101; x=1792051901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JItcqZCTTZ5Tr3DrlkTjE4P6dQhLoTOAQJPbjV6HDlQ=;
        b=tZ9xQXIzBsBD4zjVpqwdN3GLspr3Nsov3ttJH75/7i8N59M+lp6Z7AAX6O3i1rbQnT
         s701EWhsWAfYcY47mpa7CqOU4Jf8LWOTeh6m8A9MdgxZCVGX4VEKBtUIT+97+AcoUWpa
         Ws5rtcTin9HetGOrLy4cGIt10y51OFwh64IBpzlpwnpdkiG5icgCuoxfXccI3zU3pslB
         qPWmKFC9C3wdqFgkAZCvIX7lx32WwSsxxnBFXB/bJ0nOTIMtkJnv2Kn/0awEZTOQINky
         3CGMLHL2q34z8c7LYF5Rsumc/8+eOdDDAOI5IRE5BjXWDLwin5cOxv9En6k9MlcaWYIR
         2KeQ==
X-Forwarded-Encrypted: i=1; AKwUvByfQQUu81q/0qcQmR9W167qQNmkpQf1e5+IQi0FnsQ9i9ndZXaGUCcxielMG4aXTiKpOVWFexeMCe4q2ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1T5iWzJfntBmYVtomlUAdZvsf+jnWWKD2lHp6iYFreAl9H+lI
	mf5pWn9KbXY0D8ZEI1o86MDdgcIPVkIh9ZxIoaTv2NFPmhiSBdbPBFvd/FpQZHP9TLr3eweJQTw
	EasxU+LiAdgMDhsyAVnSnCqVok9aKXcF+IgDCSNlge51EHkoc9fFspBtlaR+u/pubhjcIIfGGuL
	b1LJH9o7EsclGrYLq3ufDvMiLRNwOMNMh+w8M0FO5A8g==
X-Gm-Gg: AYBFou0aQBkJMwGAe0eq2B4pympaujVZsCI+bfCyXZ6+yT3J21XuLtbRLosqkQMxEkM
	m8vRsV3Kqhmn7i+Jga6XL+s8cCfn/G9MTERce0TmoX+9BjOY3vrEOQ/wO/z0U4Vjt5A3T6XV3R1
	o2OQq7AcgasqVobMctO3Zhs1R2zC5j0NAoglq0uFHaRv7QejB1hMb1A2I=
X-Received: by 2002:a05:690e:43d1:b0:677:d251:ccb2 with SMTP id 956f58d0204a3-6790a3ba2b6mr1617780d50.15.1791447101127;
        Thu, 08 Oct 2026 01:11:41 -0700 (PDT)
X-Received: by 2002:a05:690e:43d1:b0:677:d251:ccb2 with SMTP id
 956f58d0204a3-6790a3ba2b6mr1617763d50.15.1791447100494; Thu, 08 Oct 2026
 01:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 10:11:29 +0200
X-Gm-Features: AclHuK_ulwLbOdiOwhVLyKYI0w-jUZto9bQrzFykzb9tv-znqnJpL93tMSNQoQQ
Message-ID: <CAGgiveUzBk0Na13cqPRnQw8y2XdQ9LLktFK5eaJLTMiQZJPc_w@mail.gmail.com>
Subject: Re: [PATCH RFC v2 6/8] tee: optee: execute yielding RPMI calls
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX11tDmNJZuKJ6
 e9cmsCPHgJ2rWzj4kV6ltt8oucyr/p5JSReQuUCmHqGkzRMn1nLVzDkuOsP30izHCDrpJ0WwrJJ
 wXd4P5RBalW4KhC2v1m+/rA4mvpGhPFFMl9J7V4drFDogunqpkhFb80/Id3RVWXg2dXhxjve04K
 0Kfe1jMI997Yicpvf+iXdABntTA/OmM4axHIKCDGcbiHV2T7CWu2LZXlsH+5nFi7Nh+rfbACROA
 d0cYqy1r222GvT+MGfLyoNeKyrhBaK0eCtQNAHNHIGjbL4YLVGPGqQkJlMW+Frbsq8Ul1rdMgzV
 o26lKFL9V75yr6yVrw8TPYyn33O8XGwgb+vwvfcSLFGhwvNFHnyreIPGGn0OJXFcwsClwzdJH4E
 OhzCsHKkF+VDN6Zxo9dAHTa5qiz0vuBoFxTFs58Uc0qTFD1cySBu7xljlTLCVabdbCkSGnwOJtw
 24sKAtH9MJ50+TWrLHA==
X-Proofpoint-GUID: ydenPGvjlNcnlsgL2tjGEQKDjeuwJWLB
X-Proofpoint-ORIG-GUID: ydenPGvjlNcnlsgL2tjGEQKDjeuwJWLB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX9ppExmur6337
 +zL/K4eASsfVO8XM6hCtFHMv5smxxAIxHHGmb4qVTJjoz4lXZ+zpgSkzpC8rKZ23IuL2cO4dYny
 xMq21i/XC6Bs3DDA/mDE2fMhItqDy0U=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac7503d cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=ErwVIQJsGMf6Wn3gpasA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

On Tue, Oct 6, 2026 at 2:40=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> OP-TEE commands can span multiple exchanges with normal world. A call
> may yield to request an RPC service or allow interrupt processing
> before continuing execution in secure world.
>
> Add the RPMI yielding-call path used by the common OP-TEE session
> operations. Submit the command and RPC argument buffers as ranges
> within a shared memory parcel.
>
> Handle RPC requests while the call is suspended and resume execution
> using the token returned by OP-TEE until the command completes.
>
> Use the common OP-TEE call queue to wait when an initial request is
> rejected with RPMI_ERR_BUSY, allowing another active call to complete
> before retrying.
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/optee/rpmi_abi.c | 124 +++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 124 insertions(+)
>
> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> index 58d82678be98..6e76316794c1 100644
> --- a/drivers/tee/optee/rpmi_abi.c
> +++ b/drivers/tee/optee/rpmi_abi.c
> @@ -9,6 +9,7 @@
>  #include <linux/mailbox/riscv-rpmi-message.h>
>  #include <linux/overflow.h>
>  #include <linux/rpmi_tee.h>
> +#include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/unaligned.h>
>  #include "optee_private.h"
> @@ -560,3 +561,126 @@ static void optee_rpmi_handle_rpc_cmd(struct tee_co=
ntext *ctx,
>                 optee_rpc_cmd(ctx, optee, arg);
>         }
>  }
> +
> +/* Handle RPC command or interrupt returns from a yielding call. */
> +static void optee_rpmi_handle_rpc(struct tee_context *ctx, struct optee =
*optee,
> +                                 u32 result, struct optee_msg_arg *arg)
> +{
> +       switch (result) {
> +       case OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD:
> +               optee_rpmi_handle_rpc_cmd(ctx, optee, arg);
> +               break;
> +       case OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT:
> +               break;
> +       default:
> +               pr_warn("Unknown RPC func 0x%x\n", result);
> +               break;
> +       }
> +}
> +
> +/**
> + * optee_rpmi_yielding_call() - submit and resume a yielding RPMI comman=
d
> + * @ctx: calling context
> + * @req: initial command request
> + * @rpc_arg: shared RPC argument buffer
> + * @system_thread: caller requests TEE system thread support
> + *
> + * Only RPMI_ERR_BUSY rejection of the initial command permits retry.
> + *
> + * Return: zero on completion, or a negative error.
> + */
> +static int optee_rpmi_yielding_call(struct tee_context *ctx,
> +                                   const struct optee_rpmi_call_req *req=
,
> +                                   struct optee_msg_arg *rpc_arg,
> +                                   bool system_thread)
> +{
> +       struct optee *optee =3D tee_get_drvdata(ctx->teedev);
> +       struct optee_rpmi_resume_req resume =3D {
> +               .op =3D cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_RESUME),
> +               /* resume_token is nonzero after OP-TEE suspends the call=
. */
> +               .resume_token =3D 0,

I missed this when reviewing "tee: optee: define the RPMI control and
parcel-reference ABI". I'd prefer if the resume_token was a truly
opaque value, just as for the SMC and FF-A ABIs. Any reason why it's a
64-bit value instead of 32-bit, as is used for the other ABI?

> +       };
> +       struct optee_rpmi_call_resp resp;
> +       struct optee_call_waiter waiter;
> +       u32 result;
> +       s32 status;
> +       int ret;
> +
> +       optee_cq_wait_init(&optee->call_queue, &waiter, system_thread);
> +       while (true) {
> +               if (resume.resume_token)
> +                       ret =3D optee_rpmi_call_with_status(optee, &resum=
e,
> +                                                         sizeof(resume),=
 &resp,
> +                                                         sizeof(resp), &=
status);
> +               else
> +                       ret =3D optee_rpmi_call_with_status(optee, req, s=
izeof(*req),
> +                                                         &resp, sizeof(r=
esp),
> +                                                         &status);

Please fix the too-long lines above.

> +               if (ret)
> +                       goto done;
> +
> +               switch (status) {
> +               case RPMI_SUCCESS:

Any particular reason why we aren't using TEE error codes here?

> +                       break;
> +               case RPMI_ERR_BUSY:
> +                       if (!resume.resume_token) {
> +                               optee_cq_wait_for_completion(&optee->call=
_queue,
> +                                                            &waiter);
> +                               continue;
> +                       }
> +
> +                       fallthrough;
> +               default:
> +                       ret =3D rpmi_to_linux_error(status);
> +                       goto done;
> +               }
> +
> +               result =3D get_unaligned_le32(&resp.result);

Why not le32_to_cpu(resp.result)?

Cheers,
Jens

> +               if (result =3D=3D OPTEE_RPMI_YIELDING_CALL_RETURN_DONE)
> +                       goto done;
> +
> +               cond_resched();
> +               optee_rpmi_handle_rpc(ctx, optee, result, rpc_arg);
> +
> +               resume.resume_token =3D resp.resume_token;
> +       }
> +done:
> +       optee_cq_wait_final(&optee->call_queue, &waiter);
> +
> +       return ret;
> +}
> +
> +/* The caller supplies SHM with room for command and RPC args. */
> +static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
> +                                      struct tee_shm *shm, u_int offs,
> +                                      bool system_thread)
> +{
> +       struct optee *optee =3D tee_get_drvdata(ctx->teedev);
> +       struct optee_msg_arg *arg, *rpc_arg;
> +       struct optee_rpmi_call_req req;
> +       size_t arg_size, rpc_size, rpc_offset;
> +       u32 parcel_id, nonce;
> +
> +       arg =3D tee_shm_get_va(shm, offs);
> +       if (IS_ERR(arg))
> +               return PTR_ERR(arg);
> +
> +       arg_size =3D OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
> +       rpc_size =3D OPTEE_MSG_GET_ARG_SIZE(optee->rpc_param_count);
> +       rpc_offset =3D offs + arg_size;
> +       rpc_arg =3D tee_shm_get_va(shm, rpc_offset);
> +       if (IS_ERR(rpc_arg))
> +               return PTR_ERR(rpc_arg);
> +
> +       optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
> +
> +       req.op =3D cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_WITH_ARG);
> +       req.parcel_id =3D cpu_to_le32(parcel_id);
> +       req.nonce =3D cpu_to_le32(nonce);
> +       req.arg_offset =3D cpu_to_le64((u64)shm->offset + offs);
> +       req.rpc_offset =3D cpu_to_le64((u64)shm->offset + rpc_offset);
> +       req.arg_size =3D cpu_to_le32(arg_size);
> +       req.rpc_size =3D cpu_to_le32(rpc_size);
> +
> +       return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread=
);
> +}
>
> --
> 2.34.1
>
