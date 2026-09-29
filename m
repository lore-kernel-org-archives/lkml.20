Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F215218A1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694332; cv=pass; b=nUlpFxlJvaBEZgHc7ipO4r1dgjrA1FoMjffwdWmv5y4vuR2mrkE4ksxC7cXvAUvMStBe2I72TDLTAD0LHQsGCm+UlW83NnduPNDsx8vwDSKIAtF9kNZmHpMoWaiTiTCCtLk4mVn2VZgnSi4aahTqe3n6ASeB1AxvcKdgopk9zRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694332; c=relaxed/simple;
	bh=FeWUS+Q6rRQt/exe2FmXZxiieY1gab74/3uvCwXlE+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s7qfzhQwgycJXU7mbvk7pMwb+FEdv9x+pIgEcmfYFaCt/lmyPQngyr0n5J5oyvv0oOJfqlZvp7QQjgBfxhrBxC8TtMIzIlIXlZOn7YzFAuRzz99aHaHeq8XMnSuwYD1TaYWAjurYCinqUeCGtScNWGQSUtogOwkwxlJZXhxkBjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVtttBKT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ui9xRSyt; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVtttBKT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ui9xRSyt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqZnZ3936596
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lin7ry/oLwtfMeL3Cn94jsgt
	01Sg93DuOFM6kwK21kw=; b=OVtttBKTgJcLF5WQkPHVSSphYWtWxp7DYKs7JZj/
	dWbPx7fmXepg/KyJhtEc+8BTojaqsqnOa2En+pEkHNhqoUC4R11ijBqrGHzC+4xz
	AM1LQeMJiQ2V9y8FvKMABSTbwkud4zngzTEV/8sNyvjHBP9vuKVDAepNnjrL8sNh
	yXIzdpQGx8V/rOe6juaBO4bxeEStanDY/StRQaIyy8F0++x7IPAZaOqkV3lAJpDm
	fDNFAaRKX3IK+9sCeHTWso9YiniDwK+7f9f8gj5MF8J4iTOSF7g7zaW4hI9b3MnG
	O4+J6+0d8aLrxdWDqDZf3QdQ4jiADH1jnbC2ZGe07BI3RA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1h6df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:05:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so3119376a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790694330; cv=none;
        d=google.com; s=arc-20260327;
        b=pjx3UcXVeoh5yHl9p+GTDN7GjwZO/08F6V2nCz3ST83dbRDU2EVAuew4sP+K29kmxS
         xAd5B6b90a839RwXUOaHuwbDpXA6bwt3MFeoqFBcso4r1FPQ4J7UPflbyqNzoa37++XQ
         +E2RK8y1k/0XSUCFISMY+1nKnungbQGV2A5k9YBgzm1IhvzTRcC1b2n03L2uWipzXeKg
         MCyz2FMJ0RQds26qbJGkwQTJam1v9rPssef0PRc/VCS8YODU1CzsXMlZFzFS0btYU9Pw
         jUic4rEV7D5vZrXtAhVeOpqL55JQkOkTD9kb2z7WcoSquWkKt8JHZ0aHtTvubR5E87v2
         X0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Lin7ry/oLwtfMeL3Cn94jsgt01Sg93DuOFM6kwK21kw=;
        fh=uVgLofzIYdxkYcckIV/dM5SkAsBO1mgeGtM6bHpJJYI=;
        b=SwtubcFhBb3nbsyCyDOudBQIhwUINuktyEkG8AWSdFwg4g02zDwVtV6mER9teV6Qo+
         uMfSaY+lvuO5dw7pmAkOhRqBLogHIiZUkQi+u+Rh8O0q5GnJmTLndhHIRu2qh9/BF/U/
         2Ei7zEbViG2CZnX0yvAXoaQGLstAGxLeTsXY6TqUNiDExgKeMXR6m32+J4mlygwb9J/r
         lOzjtPORVy1cWR+FrtqDFq9o748jkeO3R5tbdJQ1jhNj7CwIb1ehdmCgaR5TJsThAGET
         S86oGnFWGzdMzt5kbzApu59qEutwLEfVDoodWruaduJhmq/DlsLkwav/wxu6hZ/F9MnG
         gZQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790694330; x=1791299130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lin7ry/oLwtfMeL3Cn94jsgt01Sg93DuOFM6kwK21kw=;
        b=Ui9xRSytSAZYJCOeKQuez7+NlxHURgls5C23Yo2rFbTQLZVzRWRkgOj9isyKdo93GP
         RUbmVspbSNAczAjUckq9n3ePaeStMccaF32Cou8I/KqkTpwytHOps8N1qe0tuErV4avS
         NImZeoAg+L+4rSjF1Kyn1Zak5u2bgLR0pYlDE2+h88mTaOwtgg77S5Wm6Kc3J6ZKfxtF
         5W++IRX21U7ip2uto4Px+S4GVNz1clYktBbuxeVnHTDvrTKbTUe8NLQP0tx1Zf4UdcdJ
         FFJdHP5nWdy3IYnnRqW9UqGS58p9mwHU6asDrtOG27SozUOZfCtM/PwtkY3qi63uJylr
         ATBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694330; x=1791299130;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lin7ry/oLwtfMeL3Cn94jsgt01Sg93DuOFM6kwK21kw=;
        b=FoabRiv28lwKwaY5uSI8vlXKSCa5zs4C9Y2V0xk5QUngCnc5PI41KhSmGyNjDmgWcx
         k5ZrknyryC0JBx53bAKD9Cgvfx4eIFYQp/JgqWbbwiXj8vfqBqFDyQQhGv8PO7ZaMx9S
         eRdHXWhuFna6HkB9jpduSxg8Rl3mtSIufBKVK03O90Tnebj660kSIbENKGPuo4BR1zF6
         +G5448MPnqt7d+2PD5f1BDRu7BNqxxlZH26bPGJhfSm335e1wsKy6TyKJBaJCg6cBPOz
         VmUOk0x/gplqPKH+xlmcRhG1JdRo/8LVJrk/4aery0W2imeNGsIP/7Ds2vlSldBxhZLU
         FlHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3PW+54MJdObk3IIDxZc2VSGVWt6a6t57rQm0qaJzRjB4dmjFdQ9J8ds80MRGfCh2zhB80N+X78ImAk7w=@vger.kernel.org
X-Gm-Message-State: AFuF++k3DFolm8cegAaW9EMDNaf1PIVHIfKSqKFI0128lD1h1/OObd4C
	GjNDxB7+tNPns4d5RE2R1RIun7NMJ7WiVPW0uSU0eQmbFm7RMvIjp19CF2hPqzWCVLQuM9PbA0t
	t5b3Zlh+yuKjqn5W8L6VvdyZrmUpIVYCCxpkmE8ptMuIrhRo4sXYh1/XzX3RhMcjpavy2vYOAm1
	BD4oihfl6Db4V88aw+3s7DxtWyDrYeOyE2xfHjj3nylA==
X-Gm-Gg: AYBFou0DB9yvh0mIkd1N+vmfqAn4+9sJStx+hBEfy4nALdXhYz1bGPuGeZM3xobXMhe
	094WhKo+lnEUeufrWkuh7SlqePndkv7fsZrwIhBhV2dtTi/CaVceVFekU11FO+geAEHybjacGTb
	Vq0oORTcMunPNFZT6/Fo5PnZUnuY8NVvICamHJqM/oLBBUEilAwExB8Y9JS2sJGlH0IHHUowY=
X-Received: by 2002:a05:6a21:501:b0:3dd:a197:735b with SMTP id adf61e73a8af0-3de0e86f5bdmr16216862637.52.1790694329664;
        Tue, 29 Sep 2026 08:05:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:501:b0:3dd:a197:735b with SMTP id
 adf61e73a8af0-3de0e86f5bdmr16216826637.52.1790694329185; Tue, 29 Sep 2026
 08:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
 <20260927-iris_vbv_delay-v4-2-8ee2b7462e68@oss.qualcomm.com>
 <jc4vctqyyrh7gvoxv7h7ioqnrv72t73trgesscx3xpd4xwpj2m@m6no5tnmet5s> <828e8a38-4d11-4126-8f77-04e05e1a94b9@oss.qualcomm.com>
In-Reply-To: <828e8a38-4d11-4126-8f77-04e05e1a94b9@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:05:16 +0300
X-Gm-Features: AclHuK9z7LRIRsWkSV-6zc2nCOLL4Q1345PFz3bZTsnP0_j-k0noC3SWULLjUv8
Message-ID: <CAO9ioeW_EabUpjDZa6w-60=CbDXVgGw0-N2t4Z5SpJPrrhcrtw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: iris: add support for vbv delay
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MCBTYWx0ZWRfXwTyONwJ1S/1c
 +WqqcypMj4DY42z7WHeDo6N1MQNKLbMdMIdE9jYV7PcIZzC0NTE7MjmZFgZIqCqVN5gzQ3+aFWz
 vKmXbnDxmPkeYYUK12yHUT+VwZbly6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MCBTYWx0ZWRfX029DZaPZKJ9q
 tgT+QfODZc8oX7c0jYU+OIfmRZx78YX0mazTt55SjtFUbv8bchaQlAOCKv0DWjj4cX2ab5KhUo4
 +GR8vnRD9SXr+JirFU6kDt8RTUF90+l4nk9xfi74MotLKCKPS97U1CqO1yewpxm0KagHs0Q7TWY
 /xCI9Ec8yKV7Iq9AJufhmscfJqpIocGu70e7/TOlm+iqmPfFuvB7kZsNcxY/nac3hnl841+38vg
 WeLyeMxoxnq1ZP7F6k+iufV7bRPHpQLGR6cdFNjt9sSzNsygIZglhcxuNB4ABy5WoeJtV2tyIT/
 yezqWp3lKlpganRBtHpY8G8xRtz3CW6CyK//oDLLTUfpILEQ6VtSVp72SiTIkUWKPHs6PUlnJQz
 F8ca9LTMhhgJd2+zoBSkx3mY+PdEURpakMtMGQDbICsaLY+tyyibk4bcWtqzd32jNsaER3S3pzT
 DumlfMMUTg/KwUPJDSQ==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbd3ba cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=lQF29MC2Urm1tU4UuJQA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: zqr8XF7s6ZhQQ3pydw5U8LostctRNbX7
X-Proofpoint-GUID: zqr8XF7s6ZhQQ3pydw5U8LostctRNbX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290060

On Tue, 29 Sept 2026 at 14:54, Sachin Kumar Garg
<sachin.garg@oss.qualcomm.com> wrote:
>
>
>
> On 9/27/2026 11:55 PM, Dmitry Baryshkov wrote:
> > On Sun, Sep 27, 2026 at 09:27:46AM +0530, Sachin Kumar Garg wrote:
> >> Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
> >> exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
> >> HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
> >> is only meaningful for CBR rate-control modes.
> >>
> >> Low VBV delay values (34-100 ms) require the encoder to run
> >> with a single video pipe, so extend iris_set_pipe() to force
> >> work_route to 1 whenever the configured VBV_DELAY falls in that
> >> range.
> >>
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> >> ---
> >>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 37 +++++++++++++++++++++-
> >>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
> >>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++-
> >>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
> >>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
> >>   5 files changed, 50 insertions(+), 2 deletions(-)
> >>
> >> @@ -541,8 +545,19 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
> >>   int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> >>   {
> >>      const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> >> -    u32 work_route = inst->fw_caps[PIPE].value;
> >> +    u32 work_route = inst->fw_caps[PIPE].max;
> >
> > Why is being set to the max value instead of using the .value?
> >
>
> fw_caps[PIPE].min/.max/.value are all seeded from the same platform
> constant (num_vpp_pipe) at init, so .max and .value were interchangeable
> before this patch. This patch now writes the applied pipe count back
> into .value (used elsewhere for power/cycle estimation), which makes
> .value stateful. Since iris_set_pipe() is re-invoked on every resolution
> change while streaming, seeding work_route from .value would let a
> previous single-pipe override persist as the new baseline on the next
> call, even after the VBV-delay/CBR condition no longer applies. Reading
> from .max instead keeps the default pipe count stable and re-evaluates
> the workaround fresh on every call.

With the .value being written, does it need a lock protection?

>
> Regards,
> Sachin>>        u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> >> +    u32 vbv_delay;
> >> +
> >> +    if (inst->domain == ENCODER &&
> >> +        inst->fw_caps[FRAME_RC_ENABLE].value &&
> >> +        inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) {
> >> +            vbv_delay = inst->fw_caps[VBV_DELAY].value;
> >> +            if (vbv_delay >= 34 && vbv_delay <= 100)
> >> +                    work_route = 1;
> >> +    }
> >> +
> >> +    inst->fw_caps[PIPE].value = work_route;
> >>
> >>      return hfi_ops->session_set_property(inst, hfi_id,
> >>                                           HFI_HOST_FLAGS_NONE,
>


-- 
With best wishes
Dmitry
