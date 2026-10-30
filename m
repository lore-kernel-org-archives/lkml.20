Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793365669;
	b=IesoFSQy8rbjfUxC51tVUnrw7iISUGAC13a2z4hL4JR/91dPtW2mf8LlWUyw5lFcD2n3
	 pVwob7ki+N9sSDGQRpxLMaxHG/EwZ7DdIeHSvOwQTm6thOk0FEtxwe9fqhWqpua4W1Nbh
	 sC2H/eGrCO/Dcy33foSizM+iq7U7iNMtY8arTo2ecS1IzSSgMkQBO4psBhYaUjDEZbT+l
	 cs2dJC2I1/QEPuuLWhFWmy2qD0daFO+92BuRhQv/e55gzubqDBzDnUrGrLTBtXeciiDSu
	 c6xsg1/BBSAKnPq2V11irv5XPwq+p1fDazhoXyyq5UKEYarKNso2CgnwkggD9p3VZWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JmQ9d1VaCaPK84ub762yzt3Mt8tgFQPf/KYdvYI3qug=;
	b=aB750meyY44kJIoUkeJflANnEpGarjeYg2o2chKPKNNuLRdGpFLrwCVMeL79+tJ0QzJb
	 DW+XwO2rsHItl/wmkGKPBulu6GW8qvu0GMDn8ngwmHSsranrjlGCkKuqqW1v7E83Us6FV
	 P/VNwqBdoZyQaBZ7SI9ihqiFGqAuNq64dlVUTkEUwoog26QrCRy831HKf4BwOHLwKuvIs
	 QytZYbgz5Sis9xHMTDL8wTRQ1LAMGQmeYWym3BCoCUvwTYQBaYbu3IiIqp59M7LHT0l/k
	 m6fEVbZgBqvaKeO+kFDbbhQYE+OeL8YKqxDdx0cXLoXv4JgaTaRwwCh2ZL7Tp1Xyo6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=L2WtQQkD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7625E606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7625E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=L2WtQQkD
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-188406bb948so708812c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793365667; cv=none;
        d=google.com; s=arc-20260327;
        b=SSVK9nVY4+JhpeUC7nG3BIdVYtPNf09m9epags6lMNRUROy/Tgv/qtHmcPBN/4OFOZ
         jfLpbcML0UmCIIAcoePnBevm4mxLShdNM1DizAuGUKw/LHSZ3BOuXyZxKy/VgCITvr88
         EAeHYtiE4IMGE9WxyAQPW0nfRYavl8bjZZRJ+xJA8V5JHultGEKGAtpHm1sFdEHgBdB4
         vh6gcozD62fy3wIaF+F3pR8Kt1CMUVhX6WQ78V+VdX5E4ZquU1D60YBi3ETbYdHXiC/r
         jXaGuVNxcEJNFKnA9FGBArPuU28fOUywEvnt+kFj/sjWLpkcw3v1frzrrvVieCUwmUA9
         ry7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JmQ9d1VaCaPK84ub762yzt3Mt8tgFQPf/KYdvYI3qug=;
        fh=jq0LtEc3T/8XlHjY+IrOZXxn9uI4P+agGLn9EA4k0fI=;
        b=Y0gBXAlourr7YoNPmQ0W0g3aH/kMlf+uiV5gVKlmucCDz37RdAeFroMnAjqtF4tH0d
         WA4Rmw54puJzNnr8nm5yU+olgkiqJZzxnHO3lC7hE0VxuNPuS3F0MzyV3O/VQIYC9rbT
         dtyBeeqbnnTbh1q8l9WnNkJMptQZoCl/wsUca4Hcm1OCely/W7SYhSMtO68pxHANS7yk
         MWFUGH9oL/NQ0URUjtIsPRaNVLRdCTKJnUJMZE6bbM8sMcs/CsY+LbKAsEjpqbsPycVH
         qwf8jmNxCothYFAP0wbpZSBoYAg4ye6uuLXtxPgzZg1ICvmZ3NtHf6HwnoDc977CBoJA
         zqHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793365667; x=1793970467; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmQ9d1VaCaPK84ub762yzt3Mt8tgFQPf/KYdvYI3qug=;
        b=L2WtQQkDQr/ikFf70TriVrT9Bc5MydqRF03Mxy6wxr1eTlxBgU42cyrioewGrtTOp5
         muH1oqm6RphBSw/KlXWY5gfjhaaL4n4+j0QgO+58W0PASyuPBzGvTm8Go3/E3M6ee/l0
         FU2cPItHLnotHQFedOaOsiJcpOXKrRO/aeAeBLfQmi7l3lbRLq9STb6mIJ17I1Ebiulb
         Fjei/76IyahKbPDAhG4wU+OKVPMwdVX/B1/Qa0FhFb9ZYFJE9U3Pp208SjAbkkRjpz03
         ebLSW0AwUPIVn9naoWACwYhLXmbEsco1jNchBWDnYDaUv0OhgUhHP52PO3yESJ1WxDes
         o45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365667; x=1793970467;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JmQ9d1VaCaPK84ub762yzt3Mt8tgFQPf/KYdvYI3qug=;
        b=fNa64pGMzXXGYpQ8cSzll9BSJh0X9KN3i8HbhS9qqz3xaLhZ+ErWpnjH8wcoHuTghh
         6Y+F4Ctm7Cwk9VoHWPaBjaoVKi2n09FA1i7v2lp5OBo5ylLLT839P61ERP8On4yaVdDK
         hBLZlz8S1xb3Vpf/k7x2lTr7ftTx0wV9xsoo0Ls1XkoD0JlEKtUNUhzu7b2JvQNDHi0P
         UJFzZ+aDCMB7TXyO1yhRFaxD03rB8aWxZQoDsFWCEBkebY7K7BYjHAqjcyXr8a0C+dMC
         j/P4laZhg2U15nakQlo1szlLacCtPIVBO+HYVe/S8RIGe8TA/VPVfSB2zVPlaLb4igdV
         uggw==
X-Forwarded-Encrypted: i=1; AKwUvBzlSAtsciR9Pcxuv6BvlpzphQ6mxdzsSN/aa+J7dKN5UfpUIitZLuX7QPn2ht5QGAvkh3/h8LXS3LjlTc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9SzZLfZXwkkrR0G8kqd9CrTsvE9pEnDQqhV9y5IDrmvGekz25
	ioCE9HaN9LwHkE5hyTMAjo2j25iy+IjDbkucj54NjC51LxE6Atm/PZqly6ENJZsK0L+wboKqA8M
	TP0IClpC4krp0ZXGlPOEW2uf+reJlYM+d+ovbTilV8g==
X-Gm-Gg: AYBFou0J0/h99xuQwULT5TIsqWy7rAcM4uXwzpTr/MkLobm/dgHUZAnDsFih0eWiiK9
	C/c3Vr+OerXl8YULP9XziHvurCfE6+80zQU5TipYMuE80hLj26f588nE/5Rx/zpIj/NRmv1gy8Z
	BEXdgVceiwn4ryKkY4JQuVkNr+dG0zx6KkQnG12jjuGa5V8c4JMsOWsy5tFMeNA39eOkPDYq2HX
	P35IqQcflU4wjA53dhkwvysiOsu3OHCgjfsWIEB0O7ILsHtlBLNUN7birEIPU3UbtgptRvYBbEU
	FVtAPelrS2kDOnmImwefRnwyFcZxVLJ5MkHTdNUedkg3k/zyBLAA8ksxnHwsIw7zjfYRJhSuwWj
	M657ABCf02oF9Nuc41vBd+3/R0EXey7myTgJp+K/bWB/zq6ffPp4xQCseUw==
X-Received: by 2002:a05:701b:4248:20b0:191:3c:aae7 with SMTP id
 a92af1059eb24-1ac5c64cb0emr3294959c88.26.1793365667567; Fri, 30 Oct 2026
 06:07:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <4b9b0f01c86a84b4666a1ba38a085c7b84e9a585.1793364084.git.wy@wyuan.org>
In-Reply-To: <4b9b0f01c86a84b4666a1ba38a085c7b84e9a585.1793364084.git.wy@wyuan.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 13:07:35 +0000
X-Gm-Features: AclHuK-1ALJd-b5WzPc3TmnRn1z3_PjdkYlh7mZ6HcDVDQubZ-bE1wfpniBQrCk
Message-ID: <CAPj87rPiFR7idU9ta44sa9LSXNX8FrG_uLaRa2b8gp=Rp5kJsQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/connector: Fix HDMI VRR capability member documentation
To: Weijie Yuan <kernel@wyuan.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Tomasz Pakula <tomasz.pakula.oficjalny@gmail.com>, 
	Fangzhi Zuo <Jerry.Zuo@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 30 Oct 2026 at 12:48, Weijie Yuan <kernel@wyuan.org> wrote:
> The HDMI VRR capability comments name mcnmvrr and mcinema_vrr, but
> the members are named cnmvrr and cinema_vrr. This causes kernel-doc
> to report both missing and excess member descriptions.
>
> Match the comment names to the existing members.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
