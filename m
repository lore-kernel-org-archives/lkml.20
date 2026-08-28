Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131CE35E92F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950398; cv=pass; b=HZsgBLRSLlIuNztNaBAhKysoKeQEsc32L9Lc5jvp5/3quFSSnkSWQjTCnksrZSS5RdlzKB2sjiSesLtETmkgChmvGjga8QCG/h4bIXZmu3dau2TE7JaFXPLVvyvBjpabaHxD0AGm2aHLGUqcWhUFYtdVHHGZQqNSqwwXUEuVHvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950398; c=relaxed/simple;
	bh=nMk6YIu/HJFxj64b+fZMk5CqLv1z4gaw54JaGg+DSGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hT+S3YfLoXaIWyXyJaJ84mu/s+F31gWP/Npp+eDBg4JQ+4F5sUG6uM4iJELlJhWg6T0O03pslHxmMur6AKvBQp75bfICTMAJ6fgHfMgomaIdNa2Xz0sO+btD5zDcP1tG+xCXYdDPsrfnD7UnvyHqHhDhm9MTcWJE7ypX47ULhh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ju8C2oo9; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ju8C2oo9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d3b445a84fso7995ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787950396; cv=none;
        d=google.com; s=arc-20260327;
        b=XWxbKj6Jix9Djo3Ybc74KACa1c9ZvXlWZ6hLdC/7DveQFi0sXpwdIHEe/GVu33CsVh
         BriEe60o0u/2ffvABWPhyD/B7TxW66iwY+YDZft9K6NStOog/k6bjK3NSoXuJuTMfKAS
         m2SX5tg13Vr7mpZzHV+Qjd8pWzA70nBy8JrNMVZnoOb4jph/tOEGHsKyVqfNny1bngm5
         bTYzLQbIYQ45NGyjWenAg5GYP8inJaAovEgETJSI7X6tKokIhYcNNt/GT7MSjvg6FyxJ
         b/iV/KRkJ8rteWkxYc5UeS0yvW+wz8URIkDsXW7/Wwrn/2koj4zt21NzTX0D6qWYhk7U
         mCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CjwZCbIUlQx7f/5ABrSJyP1/dVlm3TRTKEOHbWjYFh4=;
        fh=l73Sb6a0NMIX+okDJF4EoYxR6MgO4ptw5vO3TuW68bk=;
        b=Kh6jbDS2EiU24CnmVYnkJxIrlNUcQgg/Ii4dF7MzFKQO3HRefJVmTBSYMNk1+c9jGR
         uTec7iI4/8zl8T2g9DBxjSOWbenFLBqRDHgSHrK24J/k8kIux8xxlN2KoD5jxr9MpLnA
         XXQg0F05/ekgVGR5KVtCmoqnIsku5ogIElO0oVrSlHRGR0Z13GA3uuMQDxlqCr46h5hT
         d9r7cM8rvZ5WOQ7g4jptRLgec6KKDHGifK3l0JclD39hGWj/z7PlGVdUBxhrSeqw5NOJ
         hpj+pcUP3uSCl69/CjDDasJZrkfi5yqgG12IszwsK6TEuEEivT7O+m01rzvhojqPvWEz
         GWzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787950396; x=1788555196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CjwZCbIUlQx7f/5ABrSJyP1/dVlm3TRTKEOHbWjYFh4=;
        b=ju8C2oo9uY1Lqp58aRh8shZCNPVIL7y30VKZqV2em068+aET0AmP0XrwFrfgKWZ5t7
         PbFYwoGeOi0WAubhPKB89QXg8+ntXxSY66aE3+TorCwaJaeattFCv+GiUgFIgop1N/5j
         wjqG0eU1NQ/Ib61TE5ScD3Ld+tcbuz7z9o7fgWIE8GnR3AuVU+r509cRRK0yOBdER9GF
         oEllQ/gALmoP8IxmnGww7Hg5r/jHt8CQGwQ6XSJNOmRew9zxWkqSID1Sk5+PWomGaAjG
         ngOtAISJLaSilNnMNqS6clgdTGu/LWohyPT+KrlSYpxW2fPx3FXJOApcVOpUJkg0Rn7w
         Io8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950396; x=1788555196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjwZCbIUlQx7f/5ABrSJyP1/dVlm3TRTKEOHbWjYFh4=;
        b=rtwF57n67l+jXEAGrschSq0beBNeMAH0oe7xvfY/E7R0EDnKewQHzX++HmQO/Xi02A
         F+0bUoblxBWLj+9OETafHsjNTEeuI1Mz2ucS8djgcyzDZw/IYH7B+FnpVQ2zQGHL0Nbh
         Esnyvd93JsEEoDz0GXXLka1XEtdYoSf0xR5PCLfgPX/oGLNGUzB732z3ZxI4jd0bKxoh
         2XTQobtqDNXbehg1qfxvyiPxHTw0Ml11rgydSZnNJv8EBRlpHLdNNTuoDNuMZxpx3xzw
         YgwSgoKgoqGc/chQf7hpq74A4AXbrHPZ+/PHkUOaY/JiEb3H7v/yyS8d8g893Xa5VmBg
         GsQA==
X-Forwarded-Encrypted: i=1; AKwUvBxfj7EPOPEbvs0cIdzv9jvwlRpS2u7aW6NxSC+S6H3+TcYfJZAQQW6BwYCbhCJdOicZFnkkye5w+EEV82k=@vger.kernel.org
X-Gm-Message-State: AFuF++na1FzeAX7UQqUnt+KWVNmFGZ1LQsMCcKyqHIs0e0DL8z9z4pQi
	Btwb493Acw/ewt5MCSvc2AvYOhYCRcvfCp8mr779zrU5LPu0q5UO8lenQECabnzX6G4K6r+9ufy
	Yyk9TvkQ0RA2vQvpTWsBKG4d3Egl8EFjdLzFTxQUY
X-Gm-Gg: AYBFou0ARQxExUFW9r7iafQtTkbhwNCqqTL4Lcx0sHZz5Sj1Gi54Z8ki6ewFqSu7YfQ
	XAcphf+7oubr82rIv5bHZYlFYHlHshH67RMRBbk6lhRjfAv5R4gz6iz30IJDLUD02HzV9ZtD1j8
	kiC6EyzxORSBdMK/byQC7uS8DifIxpmUG0Pg0pwCo/2kPbCcOMrRN/9cdGrDI/x0lRbmTBC8f2M
	2L7byZ+Hk3WRjDLvKtT87AvN5hUtSGOghUz6GgzqPivkPHIwYZn/jhWg8z2mW7FTZSePTfbZMnV
	oufwSVGTnNocDM6c0nenm2VyHKP3JtwuJ8PXpMngc7GnIbkYWIMvSozHDvf8SUhqoVf8zxMMr0t
	prk8hgyDsU2NfcJjgLnieteFVDo1kQjvxZoF7buuIDA==
X-Received: by 2002:a17:902:d4d1:b0:2cf:4353:f117 with SMTP id
 d9443c01a7336-2d8df23260dmr1944515ad.0.1787950395666; Fri, 28 Aug 2026
 13:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovCgforg-XzdODxh9axazFP8M+hFj1wk=XE05oSGz9B2Zzw@mail.gmail.com>
In-Reply-To: <CA+0ovCgforg-XzdODxh9axazFP8M+hFj1wk=XE05oSGz9B2Zzw@mail.gmail.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Fri, 28 Aug 2026 13:53:04 -0700
X-Gm-Features: AcwNN1VGv8Y7N556IkOEUqeS40HHYOe-n-1fUfpBJ9k3A9wyQexICTfuT2-fSyg
Message-ID: <CAEAWyHfU-yo+H6Ss_wXPSzMnsU+bd9EP8Jz7bPJ17xvj2Kc6Yw@mail.gmail.com>
Subject: Re: [BUG] gve_adminq_release -- unbounded reset-wait loop, WARNs then
 spins forever
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Joshua Washington <joshwash@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, falemi@asu.edu, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 9:23=E2=80=AFPM Farhad Alemi <farhad.alemi@berkeley=
.edu> wrote:
>
> Hello,
>
> As part of the kernel research at ASU's SEFCOM
> lab, we hit the crash below. Crash reports can be found here:
>
>   https://github.com/farhad-alemi/public_bug_reports/tree/main/129-gve-ad=
minq-release-unbounded-reset-wait/
>
>   Unrecoverable platform error!
>   WARNING: drivers/net/ethernet/google/gve/gve_adminq.c:378 at
> gve_adminq_release+0xff/0x260
> drivers/net/ethernet/google/gve/gve_adminq.c:378, CPU#1:
> syz.0.63/11869
>   Call Trace:
>    gve_adminq_release+0xff/0x260
> drivers/net/ethernet/google/gve/gve_adminq.c:378
>    gve_adminq_free+0x78/0x140 drivers/net/ethernet/google/gve/gve_adminq.=
c:392
>    gve_init_priv+0x2a8a/0x3450 drivers/net/ethernet/google/gve/gve_main.c=
:2509
>    gve_probe+0x61f/0x970 drivers/net/ethernet/google/gve/gve_main.c:2892
>    pci_device_probe+0x461/0xa50 drivers/pci/pci-driver.c:489
>    really_probe+0x267/0xaf0 drivers/base/dd.c:709
>    device_driver_attach+0xdc/0x1d0 drivers/base/dd.c:1206
>    bind_store+0x1d0/0x220 drivers/base/bus.c:267
>    kernfs_fop_write_iter+0x2fa/0x480 fs/kernfs/file.c:352
>
> Our reproducer.c is available upon request.

Hi,

Thanks for the report. Could you please share the reproducer too?

It's a good catch. The driver shouldn't spin infinitely if the
hypervisor is unresponsive/misbehaving. I will send out a patch to fix
this. Would be great if you could help test it also.
>
> Happy to test a patch if that would help.
>
> Regards,
