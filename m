Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852906;
	b=zjmAj43WsE6PBMEeKirYMbzqgG06IxmcZ6wpZ+Jso50i3bHkRkSiCuwH6yZyKjHFxrOs
	 PWwhXQZKTlwYExymi0DI15AjYtab4p9/8SeaBYTHyOisPWFWEXy7Qe496LbcWksk6+YVd
	 EoIDuou4mDQ+tXbgf+KFEevnnJSOZY0z1Up5Mmibu5lO0QKR+xVbkyqidlRUJGs9TJNYC
	 5f9sbxSa9QhtwyWFl7qF3IrrywPe/t0Zn4OHY0K9As2kFmp8tvF2KoglUT89hQHbgXC7t
	 9ApXxuE3XqJtYoSHuBS7sr4AR9Vqh2HlbdjdXZy230ToyhMywuCnk8hfzgc96z+1kUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Y9VFYmn0OLSOPuVThwD952io40l2TovP2T7RuvsEtdM=;
	b=uVR1LJ5QkaGfjcW1eXBb1/1/EHsiFqh9oWdbWLjqeIWJI4fyFUaxKUAmAlQCGmWYSPya
	 9E7/DdLQTXy79WEsLui9ayKrbZ0UwxUqmT0NElrZNGTB4Un0YChtCcwy7ml7LG7A2XRYt
	 CBQZNclVKOawQGIdRnc2NXaVrFIYzOCc7Xbx96wE/iY7Zjg33ehbYkARv9hb4mmxKwU/r
	 sdMJmsPUjltNs+hP4aZ/tyGP+A3p7Z+tyDzF2t0y3KsVXjuSO2Vm1aguZ5YBKYyuRS5hd
	 iIRkalsN2pd/EH9YJejoAMs9qygeg4G257eO92dE5+8BHRybjWLM+VKfd22m3xRNxZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhWWSQNC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1C5606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D1C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhWWSQNC
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-833e671ee9fso4869343a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852905; cv=none;
        d=google.com; s=arc-20260327;
        b=GL47PJWqURxEjuOJmyrB/ZWDty8LXs0plNm8paviZP5HvT1OZng34IsCck5QpchyTk
         00v4+OrInBdFWtjo3zU8N5hXsbI3tcU/JIPmyiEWU2dXExFIlX7ZcKcBUoGpRWSnNoUE
         nAQEH/NzbYx92VZujRRVw13jZoZy7UqXZjXX66Ur/ygLnBkJWZ5iZ+Ftg3HUlcut2195
         0bTcCVt9bWYyBHzv24mAWrpvaOiqwtLlE5c4Eq0v85OwaHnTuG3zfj7xo0z0MVzOkSRn
         GM/p1aINnnFtUTBXuk+7mVxPZ8RaI4wZiUqB8oJ6QXwC1vbqw1NC3sUZzTSzwqrNOmX1
         LvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y9VFYmn0OLSOPuVThwD952io40l2TovP2T7RuvsEtdM=;
        fh=ai57wYhUAZ1CBshZtgyb7/BGBO0dQdKckpLSbchU+UM=;
        b=gWd4wUTtJRtFnzouJ6rgWgX3aBbpyJ52+ZnUEP3zlhAjYSY7FS106lYaxuQ0WbvSVN
         Dvl8Lggpv6Vl602iH86cO8pwgSvSV6Be4r9WYtn24low7bI4vmXi/Je2bIgCrzzQyazp
         S95j4hBuKQ4qtwuki9oNm0+s8jWRIhuqaXn85W+4u5nDoVb3t7zzbneQpqii4lHMklzP
         kf5brvH311GuM6qZU7i9TQJF3cUQ4bEijJl2MVaw2G0hfxW8iOhIXUB1GLabdvoC8Z6g
         69D2HAeNBP64UyWcBDUhM8Mt6M9oALbc+FXj9atoOATHkD0vS7cQQCVzJr7fYvFiWZBG
         QR2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852905; x=1795457705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9VFYmn0OLSOPuVThwD952io40l2TovP2T7RuvsEtdM=;
        b=QhWWSQNCk10MpZxFAn4KuGpIJAF4P77J7SSuEGqoIAaIM0BOw+iKR8DDOhyqeExaXf
         n/K1YTcJgppZuHacJ0p1qj/tgEWXtM/NgrIf9lvsi5VCsR5uI7y01bELgWeEr73KyTJU
         ra+AyeGXH3h4+Ir2Rov/FQGtnSG1y6Omkhk3WgJI4MtHvpJoueQ4/LgepGgV1TNSM6ue
         rw7ZmpMfdF98OgvEf5B/so4dCcwHzO/67+r+6cgtPbHi4T3ezegmYpjJE5dKAJXF/S1G
         V8ybNX4EcZF8entUHqx1cnQj8Q24jYHM48DEkQC6I2TfT5jAW9bqSYnglTx5xsRN429J
         1+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852905; x=1795457705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9VFYmn0OLSOPuVThwD952io40l2TovP2T7RuvsEtdM=;
        b=F+CyNdbiuJ/I4M8GSXmyPbGVAJBVEteFlaUuNCwO55ltx0/mSl9R74Vq1bV+PmA16p
         OwknZhaIVqMiBWHes/ZRi7TXSmSgNSQisW9PhZVWtEu/sIcrSwkn09sheu59jcHDsDfw
         +8KejuhThMYI74ZsCzMCBIM3PEs+ng3RNff1S30DiJpPzS4UtZcYKlSieGs4P5X+RBv8
         BzXQOy0GB0zzgyJxSNUDgqpjRObS4SqRCXyfMsfGSkyxqjHTmUNFjPHUo53ZdeY/iEDn
         kmAsYvR5i89EoOobicIJiV+y8pND1v7K8jsj9QJlE3B+S8jB2w9c3Q7aJks5Lmxr0W51
         VizA==
X-Forwarded-Encrypted: i=1; AL+hErFPFPE908IW5Xyg9J0+5Fi8HWM8gcm83ngY0uS+CsisYOGCYt2OAiF/JpwHqpCRuzUGzQXt1AeSRPuQcTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EVjK29Hxp99PEetv+zNycYkx9eWw39xHfnd8M+UYowf8bwNS8
	9QuKpKT9mb+Ch5lBl+D/D3imdCtzVM8qa234lc2LPcg8MrhbY9z2fRPdlFKd8K5mhpHc3/moXWw
	lQStA4iBuyqGRXJNQs6C7wJiJQ0zCvts=
X-Gm-Gg: AYBFou3kKRokaQEUfM0k9Iu7SXKuktlM76yruSPowFDmWtGeqmy4wXUUS3jb+6g7aJ5
	NbDN/XW551cFzcjOSjuPbwSi15oxfYY4o+G1BGwHlofguGrhBWRLJMARKOAGJEoqHQH+uN7xG+u
	kSNOw6QBX1cPYGYp+c9XY4gXTh/BwxF+zY7p6R858Eizi8PndaBMA8uRnzPapEZD4gwa91fiPGr
	OhShxvklsoCBn0C49KW0/zpNxPc2McsuGlGaD8Nmi4n5to6jzqosWt+TbzEzBMmobNypFGpNGCb
	YZa02ogwfsXkFy4YrX93eRpRIOiegopHz1n30+45ue5oyqGUOkymoZLXnAVPVcTz7yl7ijLWB5P
	YC3fEcqu9pLnBfKoV6zpQ5kNZ892CdjQHMEcjRRna821o4XqvfWQTjQruEWjX6XLwAsNJZ1puAA
	TmBUkDtotev8mFYKdCeoN55MrnSIhwVL1XhHHws2rmeAQ+cgTGbw==
X-Received: by 2002:a05:6808:4f5e:b0:53b:11c7:2da0 with SMTP id
 5614622812f47-56e63285bd9mr11614093b6e.21.1794852905260; Mon, 16 Nov 2026
 10:15:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108060418.4554-1-sowmyatorra@gmail.com> <20261108075335.13248-1-sowmyatorra@gmail.com>
In-Reply-To: <20261108075335.13248-1-sowmyatorra@gmail.com>
From: Sowmya Torra <sowmyatorra@gmail.com>
Date: Mon, 16 Nov 2026 23:44:54 +0530
X-Gm-Features: AclHuK80DRIS82kx7xBKjBoqWiP5iWpB5RL4yuJG733QwPO3EG-EZ7zh6pOiZ0o
Message-ID: <CAFsBPPnsv2xbLXHQfM66h6RdK1+mGR91S=D86OzKzmds1cTPnA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/xe: Remove unused xe_vm_restart and xe_vma_flush tracepoints
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, 
	rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev, rostedt@goodmis.org, julianbraha@gmail.com, 
	julia.lawall@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I received a CI notification saying that testing could not start
because my email address is not on the allowlist.

The notification refers to my earlier patch removing only
xe_vm_restart. I have since sent v4, which combines the removal of
xe_vm_restart and xe_vma_flush.

Could someone trigger CI for v4? Please let me know if I need to do
anything on my side.

Thanks,
Sowmya

On Sun, Nov 8, 2026 at 1:28=E2=80=AFPM Torra Sowmya <sowmyatorra@gmail.com>=
 wrote:
>
> Commit f3e9b1f43458 ("drm/xe: Remove async worker and rework sync
> binds") removed the calls to trace_xe_vm_restart() and
> trace_xe_vma_flush(), but left both event definitions behind.
>
> Remove the unused definitions from xe_trace_bo.h to avoid
> generating code and data for events with no remaining callers.
>
> With the tested x86-64 configuration, size reports a reduction of
> 888 bytes in xe_trace_bo.o, from 20262 to 19374 bytes: 296 bytes
> in text and 592 bytes in data.
>
> Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
> Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
> ---
> Changes in v4:
> - Combine the xe_vm_restart and xe_vma_flush removals as requested
>   by Steven. This replaces the separate patches for these events.
> - Report the measured combined object-size reduction.
>
> Changes in v3:
> - Add the Fixes tag.
>
> Changes in v2:
> - Document the measured object-size reduction.
>
>  drivers/gpu/drm/xe/xe_trace_bo.h | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_tra=
ce_bo.h
> index 86323cf3be2c..a6802f6d3a01 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -115,11 +115,6 @@ DECLARE_EVENT_CLASS(xe_vma,
>                               __entry->end, __entry->ptr)
>  )
>
> -DEFINE_EVENT(xe_vma, xe_vma_flush,
> -            TP_PROTO(struct xe_vma *vma),
> -            TP_ARGS(vma)
> -);
> -
>  DEFINE_EVENT(xe_vma, xe_vma_pagefault,
>              TP_PROTO(struct xe_vma *vma),
>              TP_ARGS(vma)
> @@ -228,11 +223,6 @@ DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
>              TP_ARGS(vm)
>  );
>
> -DEFINE_EVENT(xe_vm, xe_vm_restart,
> -            TP_PROTO(struct xe_vm *vm),
> -            TP_ARGS(vm)
> -);
> -
>  DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_enter,
>              TP_PROTO(struct xe_vm *vm),
>              TP_ARGS(vm)
> --
> 2.47.3
>
