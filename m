Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAAE3E1688
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709566; cv=pass; b=JNawCxmvsWITkb+3FFCBL8Cy8XxicFqe8b0Qn+qk2t15yX3gKinGH1jgldRMe+Ym7KQl6aHqcRtAQDXYrxM1LeYA8LeSB2P1ySgSRD7EDqeE2z35jHMqLBv4jMoxcMS6K1eXWFRf1WPSIombotAGuUcB3j3aVmhEh9WF0MZ0TCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709566; c=relaxed/simple;
	bh=44gjQzNxBrnR5TH9xUkmggx7BOgePD2SnGCc2dJUF84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUMWm9Q1DPBPwqDKgwTAlr0K7O8ve2VstJm2MFwc+Ptpp1hbEOssO16co+V1q6P+xgGzhG3YvlNIV3OUeheVpwvOHWc3lhp3DLDju1bgeAjX6hylK/sW2CveTjBb13/t3Q4fhks671ZQajOONCWLA9e90NuSoEAdPgbyPGcn27w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMJApMI2; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMJApMI2"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c6d6660191so2317930b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790709563; cv=none;
        d=google.com; s=arc-20260327;
        b=nGjCltmQ2GF1CfYCTXGOJjeM+Mz1P09cIOtiewWVJfmS3p9f/d3fWvxnFjbMu6SVki
         nmn0ViRFfuzKUncFw8ukwXBZLs90ewibRLDJBzks07Aoxo67bMDGxmyQAyhQb6vEfzmm
         g0cvXqrqi2zEiBTgn4VGWKGqiC2MzapQtW/cU/YbHEbDMPT9CsD7QNuM7TW0ZC6MwwFh
         3fubh1OwttDqULxpAZY8+vg/GYDlPvEnUJeZjcCi0ErIdLvhSr5s56otNKEcP+fAOJC8
         9kZ38PVIIscJyHt1AC6kDvHIOAzmehA9KihvtpdLf5Kd3Cf0HiznYZ25WlF846Ps2xE2
         EDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kzJgW1rsJZfo72Y77K+E8QsTkrVDWI4mp7BQj3TrqUo=;
        fh=jqStuZmmzZXcXKgPa9if7EG8djs4K4B7imjqFhenK70=;
        b=TocFV+TyulSl1R3rn7yVSzHqFfnReD76L/pKGCDmTCT3Vn5Ew2FcGCXaps3ttGq40/
         233lxkNM93TtdzdAo6rXtRD4NvUGTuhzah/5WFHDLqem5VysOxAg7GCXGJloZfa0yPFN
         L54yelHAhoXlFyiYoJsjDggRXk6IPnFvK55ql9ikj/a5KF9ywDaONoBSFf/OIiHP609y
         3/PuE1o+Oxvm5YiGJ/SD5h1njWqRLqWjnSUp2PFUSl1pc/qD6M4QzdjQFiHxtofDzppr
         +NfENFAtPeuvFzRDhTldr9x+RoCX2zZQSwQt4tlajTK9p8RmbRbNAE+2hIyLNFW30U1q
         mAfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790709563; x=1791314363; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kzJgW1rsJZfo72Y77K+E8QsTkrVDWI4mp7BQj3TrqUo=;
        b=JMJApMI2XTRZLEHtxUrZl2n2EQmY/2Ajpm+g4jhibncyJOLLXg1E8Qy8gCHbwTxqdU
         /fLof0bDEGt4deK0s+yMemt9bhnc4IEslAPrcRhU+3JyNmlGNWrZIxasDDb+npSkLFaI
         4o4RaJeguh7Sm+/yN6j9GMXRM1C7DN0vfSLVDuq6yK9dG6JRRBbHzV7cDr+DHW0qCG4F
         +2/s5wlvBmuf2o/d8KjnJZT4peptqj86O9ggQU5LIiCZshCVXPyRrDyXapmRZmyZsMER
         c+1sF/BwH5/qHsfW2A6GpceR38okqtfHxTv7OA6YsyDkaVxk+hKJhD8tfEdOT5fB6BrV
         FmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790709563; x=1791314363;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzJgW1rsJZfo72Y77K+E8QsTkrVDWI4mp7BQj3TrqUo=;
        b=wcVhOiNnRE/QtSeBz5dFpxSABjFAOyInTJMd5abgrY5joS9kLiAXK+ulW0dp5FW0Vh
         jw1MlcPNDrNegH0E0NIc5cdn+sZYivrb0PvyG+cPL8kD9kaX7651PTDQGnILRF07lbhI
         RrsJSI153R7BEHoUsv9PQK59OuUxyvWze2Ol4XoQdjeVMdJKzG58X//1wit8ik/XttIq
         HVoXtLpo+NCWTK1I1OLQUQzZPzSVCaatGq36CM5z3699GabqvxFMcOdYJ449htEjNgmu
         l56TZN6fmKj7CXgf3c6+TMKwRRyjHKpPZfUD/tJ8GgFxkLf0ucdEc0HrK6G1ubuQr0o7
         em4w==
X-Forwarded-Encrypted: i=1; AKwUvByPk4w2Wj5iBFrLDCZaa6i+1UIvqyKRg5VF2BOsE3kYbYzvl/TMJ/28xWQeSYdx6rM2TQNaCPfpOFeMHCg=@vger.kernel.org
X-Gm-Message-State: AFuF++nrXMoPgDyxtvHlyCH2dGAaBe8uWzadAH7q1eJ5f+BWcqDeg0mG
	twoGzxz+dWy6xvuOSq2BHkAazr3GiJKgk9HzMGOeYv+GKWIlkDGjkMWkSyf/6fauinLFJSQOOPI
	A5Ycc4W6KPavYQEo/BZvZ0h6cmY9B3FY=
X-Gm-Gg: AYBFou3xHgxWqpWt6V2XlIp9kj+JGM4CHNgYM6QD3xcybSg6SQumAR9HCRUYuwkH7sU
	emxROAFb1c0YZqW/rlc1+j5u+J0/3eC/CsxlpDiXdIv4LhPgKAZ6p4Lt7bQz02cONcgXNUzpoZw
	PrEKHl/DOWJEgtefoXuadnXGtKEDe0MO/1GTL8Bq4QpNrivMsA3hxp2hLDSqOh/IF3Usiad1U3w
	XF/aChJRiTWX3HPxxmTk8M3CDBEewjNmi8tR4SXtuMkRaUa4NtsuZE35rc73rK6GyUg+ZuNWJ1h
	QDAYQd9mDyoUTTzUePm6SwUBA57T5Jxrc5/LFweakJ/gyXDuNqo5j2ifYkT8kjdgB5v49sqtM3/
	WuoMZDNURVw==
X-Received: by 2002:a05:6808:1714:b0:4c3:82cd:601a with SMTP id
 5614622812f47-4f06a4671d5mr577481b6e.32.1790709563185; Tue, 29 Sep 2026
 12:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926174406.346253-1-devnexen@gmail.com> <e5b5770f-8ae1-41c3-b5d9-53798dd3fd45@amd.com>
In-Reply-To: <e5b5770f-8ae1-41c3-b5d9-53798dd3fd45@amd.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 29 Sep 2026 20:19:12 +0100
X-Gm-Features: AclHuK-hjcBmIezQ0GYgI88OqlUbULC7G7Y8Vcu-Rocor7p5PAhT4RVRzBr4btA
Message-ID: <CA+XhMqzQRS4Re6YXONFmrt2rOOKoghyQqFgHu=Ziixpm2n4sLA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: Fix NPA-REVOKE racing an in-flight UALink import
To: Mukul Joshi <mukul.joshi@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, Philip Yang <Philip.Yang@amd.com>, 
	Lijo Lazar <lijo.lazar@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mukul,

On Tue, 29 Sept 2026 at 20:05, Mukul Joshi <mukul.joshi@amd.com> wrote:
>
> Hi David,
>
> Thanks for the patch. Yes the race is real, however, the patch needs some updations.
>
> More below.
>
>
> On 9/26/2026 1:44 PM, David Carlier wrote:
>
> [You don't often get email from devnexen@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The exporter records an importer when it answers NPA-REQ, so it can send
> NPA-REVOKE as soon as the BO is freed, before the importer has finished
> building the dma-buf for that handle. The revoke handler assumes a fully
> imported node: it dereferences imp_xa_node->dmabuf, which is still NULL
> until the import completes, and drops the xarray reference the importing
> thread still relies on. The importer then links the node and marks it
> READY regardless, so the node can be freed while still on the per-remote
> list.
>
> Only tear down a node that is READY. Otherwise mark it for teardown and
> send NPA-RELEASE, as nothing has been handed to user-space yet, and wake
> the importer if it is still waiting for NPA-RSP so that it fails right
> away. A node already in teardown belongs to whoever moved it there, so a
> duplicate NPA-REVOKE no longer touches it either. The importer checks for
> teardown under the xarray lock before linking the node and marking it
> READY, and unwinds otherwise.
>
> I think NPA-REVOKE cannot land before a NPA-RSP so we will not hit the condition where
> we have to wake up the importer.
> NPA-REVOKE is sent only when the exporter's XA entry's ref count goes down to 0.
> That will happen at the end of process_npa_req(), by that time, the NPA-RSP is already sent.
>
> Fixes: 7cc82cd90d35 ("drm/amdgpu: Implement mechanism to revoke exported memory")
> Assisted-by: LLM
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
> Changes in v2:
> - Tear down only READY nodes, so a duplicate NPA-REVOKE for a node already
>   in teardown neither dereferences a NULL dmabuf nor drops the node
>   reference twice (Sashiko).
> - Complete npa_done when a revoke arrives before NPA-RSP, so the importer
>   fails right away instead of timing out into a connection reset (Sashiko).
> - Use the current Assisted-by format.
>
> Found by code analysis and compile-tested with W=1. Not tested on hardware,
> as it needs two UALink-connected accelerators in a vPod.
>
> v1: https://lore.kernel.org/all/20260926171625.288519-1-devnexen@gmail.com/
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c | 34 +++++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
> index 8411ea17172f..cb35026e6eba 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
> @@ -3265,6 +3265,7 @@ static void amdgpu_ualink_process_npa_revoke_msg(struct amdgpu_device *adev,
>  {
>         struct amdgpu_ualink_imp_xa_node *imp_xa_node;
>         struct amdgpu_bo *bo;
> +       u32 node_state;
>         int r = 0;
>
>         /* Remove the entry from the Xarray. */
> @@ -3288,7 +3289,23 @@ static void amdgpu_ualink_process_npa_revoke_msg(struct amdgpu_device *adev,
>                 return;
>         }
>
> +       node_state = READ_ONCE(imp_xa_node->node_state);
>         WRITE_ONCE(imp_xa_node->node_state, AMDGPU_UALINK_NODE_TEARDOWN);
> +
> +       /* Only a READY node is torn down here. If the import is still in
> +        * flight, the dmabuf may not exist yet and nothing has been handed
> +        * to user-space: leave the node to the importing thread, which sees
> +        * the teardown state and unwinds, and wake it up if it is still
> +        * waiting for NPA-RSP. A node already in teardown is owned by
> +        * whoever moved it there, e.g. an earlier NPA-REVOKE.
> +        */
> +       if (node_state != AMDGPU_UALINK_NODE_READY) {
> +               if (node_state == AMDGPU_UALINK_NODE_NOT_READY)
> +                       complete(&imp_xa_node->npa_done);
> +               xa_unlock(&adev->ualink.imp_xa);
> +               goto send_release;
> +       }
>
> As mentioned above, NPA-REVOKE cannot land before the NPA-RSP is sent by the exporter.
> So, if the node_state is NOT_READY that means its a stale NPA_REVOKE and we should just ignore
> that NPA-REVOKE. Having said that, we should definitely do the teardown when the node_state is READY.
> We should also handle NPA-REVOKE while node_state is in PENDING state.
> So, maybe we can refactor this code to something like this:
>
> switch (READ_ONCE(imp_xa_node->node_state)) {
>     case AMDGPU_UALINK_NODE_READY:
>         /* existing teardown */
>         break;
>     case AMDGPU_UALINK_NODE_PENDING:
>         WRITE_ONCE(imp_xa_node->node_state, AMDGPU_UALINK_NODE_TEARDOWN);
>         xa_unlock(&adev->ualink.imp_xa);
>         break;
>     default:
>         xa_unlock(&adev->ualink.imp_xa);
>         return;
>     }
>
> +
>         list_del_init(&imp_xa_node->list);
>         xa_unlock(&adev->ualink.imp_xa);
>
> @@ -3299,6 +3316,7 @@ static void amdgpu_ualink_process_npa_revoke_msg(struct amdgpu_device *adev,
>         /* Drop the refcount for the node */
>         amdgpu_ualink_imp_xa_entry_put(imp_xa_node);
>
> +send_release:
>         r = amdgpu_ualink_send_npa_release_msg(adev, remote_acc_id, handle);
>         if (r)
>                 dev_err(adev->dev,
> @@ -3760,9 +3778,20 @@ static int amdgpu_ualink_do_import_handle(struct amdgpu_device *adev,
>                 return r;
>         }
>
> -       /* Add this node to the imported handles list for the remote GPU */
> +       /* Add this node to the imported handles list for the remote GPU,
> +        * unless the exporter revoked the handle while the import was in
> +        * flight. The dmabuf is released with the last node reference.
> +        */
>         xa_lock(&adev->ualink.imp_xa);
> +       if (READ_ONCE(imp_xa_node->node_state) == AMDGPU_UALINK_NODE_TEARDOWN) {
> +               xa_unlock(&adev->ualink.imp_xa);
> +               dev_warn(adev->dev,
> +                        "IMPORT: handle:%llx:%llx revoked during import\n",
> +                        handle.handle_hi, handle.handle_lo);
> +               return -EINVAL;
> +       }
>         list_add(&imp_xa_node->list, &adev->ualink.imp_handles_list[remote_acc_id]);
> +       WRITE_ONCE(imp_xa_node->node_state, AMDGPU_UALINK_NODE_READY);
>         xa_unlock(&adev->ualink.imp_xa);
>
> The changes here makes sense. One nit-pick is to change from dev_warn to dev_dbg().
>
>         return 0;
> @@ -3938,9 +3967,6 @@ int amdgpu_ualink_import_handle(struct drm_device *dev,
>                                         "IMPORT: XA import failed for handle:%llx:%llx\n",
>                                         handle.handle_hi, handle.handle_lo);
>                         goto cleanup;
> -               } else {
> -                       WRITE_ONCE(imp_xa_node->node_state,
> -                                  AMDGPU_UALINK_NODE_READY);
>                 }
>
> ACK.
>
>
> Regards,
>
> Mukul
>
>         }
>
> --
> 2.55.0

True, a revoke can't arrive before NPA-RSP, so
v3 uses your switch and dev_dbg():

Cheers.
