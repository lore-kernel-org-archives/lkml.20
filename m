Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827413;
	b=xYD8pqjkW81eHCTuUX9JJ7Bq+f1xDBZ60D49BbIzol6uxvUF9kEUsE34FPRR6Hp5MygH
	 MY78UHEx+VUkYgH1ajwDEu9txNXCEbCFcmdey89U2oCMm068JVSqU3kktlI+AkxJvZA1j
	 ZgDEoj6Z7DMPvrlJCmXYqmHZPhOmC1ZMzRw32Qexwu79mZ6y4jS9189+s/NrVHv6gKQC+
	 Z2ks7INPi+25A9SBC6cZgGstTeF32fv/oZqTf8zEC83JuxVI1KKA13TcMO0S8tWO4SAC1
	 t7j9wP5q4QxYjyBre28OeX+Cmgb1VRWJ/2ZPSdvvbLDOFHyg/1DqIENwffbe5++W06Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827413;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=uRTVYEsDszveZvZe7HLiwaYLtr8pHwx+WE+BtUNEJrU=;
	b=wAYi8i6x4D8hHjaGN7CteuJma+85g4nti67psBCu49v6kNepD8Zn/hxpPYIZwz/LCwTF
	 dMMhkhjKnQmHJ9Cvmkjz0jHU7u6ASVx7WMghhfUkU9nVGksngFi7qvgoZJHTe48py+Jzg
	 CINa21s0+yIUXCn3E/m5D3da4fUPySC7W76UFfIMGmM6HWx7Masdo+toip2CK/aEqB5O3
	 K7+x7I4VTW3mGPjAu2tX0Popz/Ra6ykwt1gk0LBVMKILBlAygJXjwhfHTWGl8sov0qK8b
	 tRVhpNjtdMV24w6BdobiCka7fTIjSeZteSw0Seihq5N+BiHiCUMokJULRwBjEaXyb3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ua9S8h+a;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="HQQYWK/x";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6403E606FEA5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6403E606FEA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ua9S8h+a;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HQQYWK/x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794827411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uRTVYEsDszveZvZe7HLiwaYLtr8pHwx+WE+BtUNEJrU=;
	b=Ua9S8h+ae9wvOq5W8zJjatZzw2NmvNkUcaYAViYGpWW8Z3j/IuaHg3MKx9svFCvvLGjYKS
	SdIjeMkLVWn+I+vy3KKN2+XRAV+2mUG6QGDBGqu5xAl2Ba11D4gLfJkOMvmQTY+1NZV0AY
	csAsuz2LF7uLBUvAc4BTd17TT2qt86A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-WidpJu98OAi4eAwA8R86hg-1; Mon, 16 Nov 2026 06:10:10 -0500
X-MC-Unique: WidpJu98OAi4eAwA8R86hg-1
X-Mimecast-MFC-AGG-ID: WidpJu98OAi4eAwA8R86hg_1794827409
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ba078f26f4so20657415e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794827409; x=1795432209; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRTVYEsDszveZvZe7HLiwaYLtr8pHwx+WE+BtUNEJrU=;
        b=HQQYWK/xQXuXLfA4u+SuO7QS5Dw6O697NOaMVHk8jkf414YCA0G6o583W66w1NVcws
         3MQWOBAYJ5U6/OR3c60U8OpiiDKdT94MBAQrHR98aWERUSgMiSONvNKjmvxr22fS3tLi
         dMWggrEcapV9S+uI/f94a41SO1/Vp0jrvmXeSky97ZFe3RtQ6xbsWXP31h2aedpfn6w7
         qPlufolrEU+/4Y8aFyKIORkeZbYWVHmwgJIbxf5JaBoZq69R9MvSqGv5t8UC6jvHc5KT
         UM5s1iYmoeVgD1mnl6XLmT4ihj2m6c2SvNeCb+k7r1Qfak4tHF3/hpmKB5uy2IWARZrd
         oSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827409; x=1795432209;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uRTVYEsDszveZvZe7HLiwaYLtr8pHwx+WE+BtUNEJrU=;
        b=is1mHvexaUGcSAHtQQg/YXcQdLvJ8AzgarMtuKWyIW5oSmw7fS9DfItKtuqwFk+N95
         i34S+Ua0ZZpNEZQJFKYAILTsCkLutvg0SUgikP58wGK+m0eN03fq41uaFVXaJOZcTYVX
         3vRQVIdRgY5U/5kFFou5OLS9QDlY5nzd0x+0S89bqi+wUbXDfYsjuzdmRIbiwrhTrv3k
         xvPGPaO4XJFr9+UTyiYDC2hUEGGmigDSqfxXSCeELdOUS4dknUyNLxpBgCfx59D/x8PA
         JKxiQgPpBOFGoY3Bhp6SpcdUHReJA5wHkL8doq7kbN3VSP4QDi1ShMw8wj925eF59O8a
         ST0g==
X-Forwarded-Encrypted: i=1; AL+hErF0xTZhHLO4qh4Z2K7W2iBEykxOLLLYpI79gGtg43S0MwFCvHxv3ISgTy1Wqm0RFzOYDdKgzS84z/Vsoe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z99Z2oGduNpsalj30k1a1XkeU6Ul+Ilz94BDMdIbla5i1MAXCp+
	UTg80moZpi/LzUU+sCNbIAm3vnK9u1lQOR0hk3AKNQ655FsUb5r50kMPn6qTOalwNyxthM2IgSj
	LJPmql0pCFXDd3T5upIJZRa66XPUvPfkfYpo9BskksZOLaBoofsdbCw/S70NO5I6STFu7fd6dmA
	==
X-Gm-Gg: AYBFou0ueqVOGi8D2OlNGI7wGgKZ+aKL0Hrtsor2B4bU3WVxkz9623UY6uN7AhmFzHH
	u3hOe2K6sQxsK9GRH2Ak3HKIEQxHZrexKGolu7B6mwkfw7rezyFFtmm+eeAiwVvDHXJQsGkewFo
	Fq1OAbgUJJsZ7uxX0JxaEFgCEOwrFjvKA9czCsLprvpCsoq5LOGEX04mKncUbVWYXocS498g4/L
	0Fjr5lHM6L8onpo6/nePFM2AtjiYcpmgjSIF23EYsNP2SeVmcfVCem4DwI6BYbc2i5E4wtWWGnh
	76rlN+LF/tHLbhRJdE4dIfNFnSGYisDtrVf7weBEDwnCTOXnv8c9E+Ikm1QUcM0tv7ZuC+HYzwA
	i447av58oIq3bnMXuVrDQZzAT/UuayVHKW+Q1gpPu8YU9HCK1J3f8T8yPFxG9C4jD7jwnM/N8Nf
	e3xkTP26qDAdUaGZHyMi6kJrzj15dGNeejZZbxpGk=
X-Received: by 2002:a05:600c:3ba1:b0:4bb:6847:792d with SMTP id 5b1f17b1804b1-4bb68477c2dmr116141445e9.20.1794827408551;
        Mon, 16 Nov 2026 03:10:08 -0800 (PST)
X-Received: by 2002:a05:600c:3ba1:b0:4bb:6847:792d with SMTP id 5b1f17b1804b1-4bb68477c2dmr116140975e9.20.1794827407940;
        Mon, 16 Nov 2026 03:10:07 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm255738645e9.3.2026.11.16.03.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:10:07 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>, Thomas Zimmermann
 <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Wentao
 Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] firmware/sysfb: Fix device reference count leak in
 sysfb_disable()
In-Reply-To: <1794071765.2669957.4378216502938475@iscas.ac.cn>
References: <20260916073815.1972045-1-vulab@iscas.ac.cn>
 <BN9PR12MB5146B7A8975825C3623CFF97F7B92@BN9PR12MB5146.namprd12.prod.outlook.com>
 <2d89b88f-863c-4e8d-839c-5e800b4c4902@suse.de>
 <1794071765.2669957.4378216502938475@iscas.ac.cn>
Date: Mon, 16 Nov 2026 12:10:05 +0100
Message-ID: <xlv1cxs5rq0i.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Wentao Liang <vulab@iscas.ac.cn> writes:

Hello Wentao,

> Hi Thomas, Alex,
>
> Sorry for the very late reply, and thanks for the review.
>
> Alex, you asked whether sysfb_unregister() would still need to be called
> when the parent device lookup returns an error. It does: without a known
> parent we cannot tell whether the system framebuffer belongs to the
> calling device, and leaving it registered could make sysfb interfere with
> the native driver. Thomas, that is the defensive behaviour you suggested,
> so v2 unregisters unconditionally when sysfb_parent_dev() fails and only
> drops the reference on the non-error path.
>
> The reference leak fix itself is unchanged.
>
> From 8c5f084941a3b6aca5d3ae8cff0c3bd1d4ae1e6f Mon Sep 17 00:00:00 2001
> From: Wentao Liang <vulab@iscas.ac.cn>
> Date: Sat, 7 Nov 2026 17:02:27 +0000
> Subject: [PATCH v2] firmware/sysfb: Fix device reference count leak in
>  sysfb_disable()
>

Could you please post this as a separate thread? Otherwise I'm not sure if
tools like patman or dim would handle your patch correctly.

> sysfb_parent_dev() returns a pointer to &pdev->dev with an acquired
> reference when it finds the PCI device that contains the system
> framebuffer. sysfb_disable() never drops that reference, so a reference
> to the PCI device is leaked on every call that resolves a parent.
>
> Release the reference with put_device() before leaving the critical
> section.
>
> If the parent device cannot be determined, unregister the system
> framebuffer unconditionally, as it might still belong to the calling
> device. Leaving sysfb registered in that case can make it interfere
> with the native driver.
>
> Fixes: b49420d6a1ae ("video/aperture: optionally match the device in sysfb_disable()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> Changes in v2:
> - Sorry for the late reply.
> - Unregister the system framebuffer when the parent device lookup fails,
>   as pointed out by Alex Deucher and Thomas Zimmermann.
>
> Disclosure: the candidate was found with our static analysis tooling, and
> the audit and the fix were assisted by DeepSeek and GPT 6.1 sol.
> ---
>  drivers/firmware/sysfb.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>

This change makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

