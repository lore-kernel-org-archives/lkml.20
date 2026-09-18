Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE31D518122
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755677; cv=none; b=cl9Z4nBDLslAHWOUrHV4+cHy5ZwgUhvHkafmtTAJqItDfryt2UC5tfA4HASMBV+ieIYP/tPx7bnHsDFjLbl3E8zIIejYnKCHZYTbNPSNi33syn5dtCe3yYKmEnhSaHc9naxqBY5PaZSjhOAKLUNYz0t42nwgZtPy4DmjVZFhcRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755677; c=relaxed/simple;
	bh=0r3tMFOFOAW8J7BYEA1pHbKenas8eUDf37+J0cEGSYI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tWuy3X4aS5f66odReu4WsjXQWu865EuDc5dtOAegn342GjBc9IHe3xcCoRMcyvWt1s8LTOQgHtiqxJjVYsMNmDHSD1tmY1FV0NafdTn3rvUjtAQaMcM81R0+iv+sj8k3gWiXfDBZxNA9U0wlw42kBLGFR8j3OFE9eOuD0dUzRVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SSs0XwU/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sSHLe1Vh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SSs0XwU/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sSHLe1Vh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789755674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2S6whF13bO6Q8rMa62A4PVjJyOAlHhvbqnUwD5kAdIE=;
	b=SSs0XwU/Lz/HhfqyrwQAhkSzBNXd5ux9zc0BxPFeFEWkgTgCJBnH16cnsp9bKXRsNqKwvW
	kof6koPgBdfesQRlf9QTlSTMKFAoNpY9mBRuTtZvBOKgsCMBatROAOfMnV6MqkRGZg42YY
	yNmB0KXZ9IVUzCfqBE5DptqU0byJPDo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-qimplt8NPMq-im1qkmCwjQ-1; Fri, 18 Sep 2026 14:21:13 -0400
X-MC-Unique: qimplt8NPMq-im1qkmCwjQ-1
X-Mimecast-MFC-AGG-ID: qimplt8NPMq-im1qkmCwjQ_1789755673
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-912351b220bso18673986d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789755673; x=1790360473; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2S6whF13bO6Q8rMa62A4PVjJyOAlHhvbqnUwD5kAdIE=;
        b=sSHLe1VhJHneS3C2ivGl23vfz1CJ0DdaO/ukwqYkW/hWbkQiMYJYIFC0q6vbvQtrRu
         FzENzNrS7EMsK9bzK9z7PJBi5BEpy77knt+7pkrbDfAdL5MLWJQUUW7zVFEY2/XczkNa
         ByQ4/ed7y3thyAjy+RkcR4mQwCHpZYMpFdmua1ZS4OeD2uwOBueDus0amFgzYcWCfgwh
         HoZkAPWGIFyowgqeiIH8xMxu0s9PzGsseVp4ub35CJQiBsLlqXRadKtB1mGuH9JnOsh4
         GlCwARGKspcxfQ/L+naLt16t/aXf0Gyn0VPQbMxnjmVNtoeHCIXNTNFWXbA6dU8nrduc
         L0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755673; x=1790360473;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2S6whF13bO6Q8rMa62A4PVjJyOAlHhvbqnUwD5kAdIE=;
        b=oXvO2c2/yEnGFg9rs5mI+lpzDLIAMsUsJ9UTC8Wf4GzMP1biWCXWjcW6KlLdw9rZiN
         ZzI/eMahIkvj/zAM0gZH178oSLD9xNwqqFKFnUYdn/o8Bn7sr/TaK8WLTjZXjioL6If8
         sP1q5iA5uHtu5vP4dPT2ZCSMQPCoyX+bJ9movFbV9SFkdknEe7mvj3zS7hEABcMCodRK
         o5doiJu/ArixQHUUPLqhO1J/RBW/pYarNlh/A8Yackgqa1gM9lm4IrU+Y7GmoybPjHY/
         W8I9GlBoX741WKy+QdD0w54SN2QNsNDxjlKsmiTwChDJJoOL6OblnWKtMhV2OxZKbtXm
         q57g==
X-Forwarded-Encrypted: i=1; AKwUvBzZquX34KETtYJSrNF2siOtxgIEGjZPFoieL9MyHp7RNa9KqIAuf6+4fluzVLPCsE/Xia2MpQd5XFEQp8k=@vger.kernel.org
X-Gm-Message-State: AFuF++kSSTA+22NqXIjm2aRtZq0nrkdZFnKav3r6w/zgP2qmIu3Q/c09
	f/UEnPMGFqizP0voEzYWW0Zwb8ORdtmFeQraDIF96bNSSpm/78RgcVRNUcSyZKGu4YlM5k1eLXR
	p+IvUjdBJ3ThIy6jIcbU4nj2bU+IdlBHwcYikXVR63bA6JSktLO1X5ydkqULyPLCQEw==
X-Gm-Gg: AYBFou1Jfw6/tYkFW0oEaCK/zaOwTk5y7k/yIWR5NblRvD/DhTQEnouGxlDaSaAPY+1
	uxSuW+CajPKU2aBGIEChlTc7ZjZ5iW98NGQdiQeD7OycYyBJv9XDbTu0M6wWKnDYU7zsmo+EirB
	2Dee2wgX7nMhPPJqTk1oJa6w0+2qd0jIVxoDQ67ev15f6vl7U3ZK3I965NbSawetT+iu/FuKC9J
	8PzI7AbwVmatF+JUImxTH4IsnzkB7TH23Py2+toXF0Ph2TCFtFdXNg4m/H+QbHo0T/SacgqoNED
	VymJ23lf8CBx1mvBDMv0p8fYNONC01JwVUs7lopQcyQGZ8a2XnmQcSGFAi28ZNG518UEQBVk
X-Received: by 2002:a05:6214:20ad:b0:907:be64:6b76 with SMTP id 6a1803df08f44-91254e8dfc5mr49888396d6.12.1789755672483;
        Fri, 18 Sep 2026 11:21:12 -0700 (PDT)
X-Received: by 2002:a05:6214:20ad:b0:907:be64:6b76 with SMTP id 6a1803df08f44-91254e8dfc5mr49887826d6.12.1789755671848;
        Fri, 18 Sep 2026 11:21:11 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a85c7bsm1762376d6.32.2026.09.18.11.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:21:10 -0700 (PDT)
Message-ID: <f8a34420ac2bfadda23ef6812933ae64510972e4.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau/disp: don't reject HDMI config on cards
 without SCDC
From: lyude@redhat.com
To: Tano Dzhinski <tano.dzhinski@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>
Cc: Giuseppe Ranieri <giuseppe@ranieri.dev>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 18 Sep 2026 14:21:09 -0400
In-Reply-To: <20260917215114.1136715-1-tano.dzhinski@gmail.com>
References: <20260917135051.47683-1-tano.dzhinski@gmail.com>
	 <20260917215114.1136715-1-tano.dzhinski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment, thank you!

On Thu, 2026-09-17 at 21:51 +0000, Tano Dzhinski wrote:
> From: Giuseppe Ranieri <giuseppe@ranieri.dev>
>=20
> nv50_hdmi_enable() passes the sink's SCDC capability from its EDID
> straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is
> no
> hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
> configuration with -EINVAL, and nv50_hdmi_enable() returns before
> hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.
>=20
> The result on such a card driving an SCDC-capable HDMI 2.0 sink is
> that
> HDMI audio silently stops working. Video is unaffected, and nothing
> is
> logged, which makes the failure hard to attribute.
>=20
> SCDC is optional, and the hdmi->scdc() call further down is already
> guarded against a missing callback. Requesting it on a card that
> cannot
> do it need not invalidate the rest of the HDMI configuration, so drop
> that term from the condition and let the existing guard skip SCDC
> alone.
>=20
> Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config
> method")
> Signed-off-by: Giuseppe Ranieri <giuseppe@ranieri.dev>
> Co-authored-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> Tested-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> ---
> v2: restore Giuseppe Ranieri's original authorship and Signed-off-by
> =C2=A0=C2=A0=C2=A0 (he posted this fix to the nouveau list on 2026-01-17,
> =C2=A0=C2=A0=C2=A0 https://ratatoskr.run/nouveau/2026/01/16963412), per L=
yude's
> =C2=A0=C2=A0=C2=A0 review of v1. Added Co-authored-by and Tested-by.
> =C2=A0=C2=A0=C2=A0 Tested on GK104 (GTX 670MX) with BenQ PD2700U and EW27=
90U.
>=20
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> index 377d0e0cef84..9887b3898505 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> @@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void
> *argv, u32 argc)
> =C2=A0
> =C2=A0	if (!ior->func->hdmi ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 args->v0.max_ac_packet > 0x1f ||
> -	=C2=A0=C2=A0=C2=A0 args->v0.rekey > 0x7f ||
> -	=C2=A0=C2=A0=C2=A0 (args->v0.scdc && !ior->func->hdmi->scdc))
> +	=C2=A0=C2=A0=C2=A0 args->v0.rekey > 0x7f)
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	if (!args->v0.enable) {

