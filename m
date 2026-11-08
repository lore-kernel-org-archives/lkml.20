Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794122289;
	b=mlcG0F7sl//jGvJy5fHopuSIqQP4ePlybD/PcdoCvFw4SKrjZSJezvGmdaYYVbgpqwWU
	 wsWQI0bhjvKSbmkIvlIkJTou2hf6IoWIV9KKmZ2qGujsA4yJObxDQ8cJUCWSaknPNjrVg
	 gpj3p9S+gGSUfJqqvvwmZS4Cu1Pd545Bi5708E8pZFFZpTZz9yLvzJTT6BnFgllvC/tEr
	 ggW+/MWRpHxnndMQGJnVpvX5D1aSv3ovT7KqNimb90EfLoMPWBtRbnSrtGnETVyP5EXwA
	 SUWGNEAg9hDIfazXMRMCvEzngsQOg7doPUaBfO/kiqE0h1PahqGVwQskO83tCnUy85Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NcRrq3gEPrpdv1ZQteio9YneHMJdpZak6tVDegOFnzM=;
	b=TDBV28BnpguBYu6axKbmqMJ/iVWQqLBtxS3TSefYqkc04DknfHFMcAWZkUKyy/cnHPub
	 QKE+Lqslj+tgjzyVUy2u+Z8K4sOafvxVFYCvr7iXFb2adquSGlcek4HFsP93Pq+eQbpkn
	 LuLvjF6CKaRlBf2B/po7fylLbODAFg/gM/oY6nsZF62sjBpvPXvxy0CHOT1P4XytdqCtB
	 wbb2VE8B0Kft3xh1GoR4PBRdjX3W2zwZ5RA6KJieR7R9ZMiRtbxCVd30hpqX9pp3MoZD0
	 8DRCC1eSFx1728xHrxn5njcEe86Ot1o8nFriYORh635u1IKJGxMGqeRxejeIDVJ9caQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvsZXXkN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73416606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73416606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvsZXXkN
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b1afdf5196so49330eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:18:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794122287; cv=none;
        d=google.com; s=arc-20260327;
        b=TBiBJbiDMrSEL1QbI7u4nPmi8YBxNsHJXiVDja9TGCv/8gPyu121urdd7omDSfo4Jz
         oT04Jy2HsTA0Tq2OyHoOTgZAAk9BMap0IJIud55HLM+BvWVAZRd9Y2A2H5/cHWoH/ng3
         xhUo5hwFi4YykTyErQmjP/NUTYE5/eUN6Jw/XzfwEwXKlpwey3TuDN/yGgl3u/Lqzsvd
         Q+XBWo6XQGKv4T0mQ9GJGvV4aiC86olpZqCHsVXYn77wRQ9aGNCJ93TZtIN/ZRXrR6KR
         iCA6SeyMV34jlPAFI5d7g/S6ylboQDPLJqdhkrIaUFu92UBAVk6/41DWqFNyprUD+d3l
         rHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NcRrq3gEPrpdv1ZQteio9YneHMJdpZak6tVDegOFnzM=;
        fh=xHGMRvNT3Mry9B1+EIQ0gZIQGYH+SxCNKgOUBf+Gqj4=;
        b=Sv0PE6CfibhOHY2L4wsIosp6fJwtxdoqHOAZzFMP8phKWViMfNH4DNMKaSCoEMiI5V
         TDC+Ta3Bluoahs2b97M/+xoJgoIe5mmnJjHM2NBi/ffrhWIVP8lG/8uayjNzosoVdaoT
         vOxogjNC6KgrO5p95JQ1HzWfXKcbnIdH9WLyMOMd5719NEld5rLiQasEnM0JMbGzSVxt
         PkYIdtvG2tXqrwEwuRWUQj95P4hzIclDSbd6aDM5lXKP812tTJf0tLpC8ESnv7AiAouJ
         lq8GFeN8AbfRamlzDsFqecAohL47tURvxqkPlWk6lK1CYRABIbMJ5fo5fIp2pi0/87SM
         vKlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122287; x=1794727087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcRrq3gEPrpdv1ZQteio9YneHMJdpZak6tVDegOFnzM=;
        b=FvsZXXkN3pZi3cVMZzITWpu0q5jH2Xl/9Va2MIzSmH07I0t7kI2tG50xY/SseFDXDo
         mDoQIPuLqEjReN3KSTGY2uJm9zuSvcZnY3jB34YHXrFWJHFikDjSQUvgyhgTuLL7DOK7
         GLyBNiDXWQKv9C8Bjfs6uX3d4xjJ/S0Jdj2xPVUNCJWuKmJ3DSqKc8T8ZsuFCrlin2rr
         dUygIiG13jR6AUygIHLeAV99CgY5LonY8D7HSy5jkGqYXTUhi1diuxJ351+cogfSwing
         EV1qdiPGKRlgeUCjvV9FYwF/Zcmm+vbW3b2o1uZ1tayoTnQtkQY94V4/P2NTGT0D+1ZU
         ASbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122287; x=1794727087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcRrq3gEPrpdv1ZQteio9YneHMJdpZak6tVDegOFnzM=;
        b=mP5o+GhXfoLULH/mFsu9vnnBDWeNMZ6+O+gqF/uD9qnN2REa0geeg2No6bkUmdvrVy
         UJp5xzZrPY58QjlQwhGYnCQG7CJA8izsvTiHV/Xr4P6s3DJNcGmsTT1brX30HCe3BTIQ
         NAuzyEu/TzaxpjbIM5HgnJ5G3udnBhiVEaoOgWnzvsc+o+YgkwEwqg02az2R+xEvMoqc
         uPYNxs4y2ycYyKe5w2Tvrl8c6kQH1tkrEy/f6DdcWhqjZASewn2iIcs2TJe+KIvxOfIJ
         Lmv58har/nbA6ccfeaA+jXsOTioo4GyOV1mSmGCLLeILzx8yQigUwb/U9GaRhHNPHGd/
         MXUg==
X-Forwarded-Encrypted: i=1; AKwUvBy1IVhh01fWAXb9JBicZBKM3AvFa2oUOlvxlxTwTvqp/v4cM3gKrZ+30pkC0D4X5pnmSJI8e767jtdNwyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bg7iWt7OxriatCMpx7FG53YJTYGc5pHbSe4sBQ7yCcCgo5zDg
	PbZ3wwFY9jYC0uhRtitBfKeYoJPLnh2VS6UPX2foV7Ih+gJHG3byG3iQsZ9iOjgDUO+0+gXgEbN
	CRJjm1wyWZeYfOQoVwHfc7AyDI+IslDp4QyMkuvgsfg==
X-Gm-Gg: AYBFou2udvJOfLGafrZ/vZSrfwHw7j6Znig+3FuKZL6gKTFo7kzcG+6XKabky+UNX57
	w3lJGv9rMe2Z+2xFIAWbWLYphsb9MGOs0ScpxO8b8aVocwxzAYDsHCkYgO5WWRjsAwRDtfY0xDz
	xgbqiljbb/D7+ZLnphwILg7COF+nLfJbCxNrr+C0HbZoGnf80xt//PXhx+ii1tV6Rh3F3mM5weL
	BfnuGiRX3TcGzItbN0LMSWLAeT8A0RH79CTkBQrC8IhFYRntbuwSrXdiNeCCyru9vcsapHraurL
	YBRwEhZDS8sAri11BB+2wo3tSnD2eXTacKbxubJVaw+WLU0kffoZXhlFZe45Hvbn0PzIqqhmsEg
	JSd3Q0GTfS1DKNth5Hu02Mxey8bZlK0mx1Rw9a9uNSR2IJkfggr3cGQPZ59rGlFuPV7VsX0jl9I
	xeRUNbsXa5cbQHMRCNPjwuPuWQPDq3f1QG2iagXYUCEDRZyIjMuLmEg59ExpeTH8F1l3YO8SU=
X-Received: by 2002:a05:6808:23cb:b0:53a:e153:e8e7 with SMTP id
 5614622812f47-568145d336emr529936b6e.44.1794122287109; Sat, 07 Nov 2026
 23:18:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101125808.9770-1-sowmyatorra@gmail.com> <20261108060418.4554-1-sowmyatorra@gmail.com>
In-Reply-To: <20261108060418.4554-1-sowmyatorra@gmail.com>
From: Sowmya Torra <sowmyatorra@gmail.com>
Date: Sun, 8 Nov 2026 12:47:55 +0530
X-Gm-Features: AclHuK_AWNWzoTHZGt6quHeK_0iVsD6npnwX0A7nfswTgR9HefL9of-94iq9oyA
Message-ID: <CAFsBPPmrD3ca=8-9c-baz+hEh7SBEr-n2nF0j2eZmDwp8h1Q+g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/xe: Remove unused xe_vm_restart tracepoint
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, 
	rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev, rostedt@goodmis.org, julianbraha@gmail.com, 
	julia.lawall@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I missed Steven=E2=80=99s request to combine this with the xe_vma_flush
removal before sending v3. Please hold off on applying this version.
I=E2=80=99m testing a combined revision and will send it shortly.

Sorry for the extra email.

Best regards,
Sowmya

On Sun, Nov 8, 2026 at 11:35=E2=80=AFAM Torra Sowmya <sowmyatorra@gmail.com=
> wrote:
>
> Commit f3e9b1f43458 ("drm/xe: Remove async worker and rework sync
> binds") removed the call to trace_xe_vm_restart(), but left the
> event definition behind.
>
> Remove the unused definition from xe_trace_bo.h to avoid generating
> code and data for an event that has no callers.
>
> With the tested x86-64 configuration, size reports a reduction of
> 436 bytes in xe_trace_bo.o, from 20262 to 19826 bytes: 140 bytes
> in text and 296 bytes in data.
>
> Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
> Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
> ---
> Changes in v3:
> - Add the Fixes tag.
>
> Changes in v2:
> - Document the measured object-size reduction.
>
>  drivers/gpu/drm/xe/xe_trace_bo.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_tra=
ce_bo.h
> index 86323cf3be2c..fa91dd2b2174 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -228,11 +228,6 @@ DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
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
