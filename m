Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7EE455177
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789676807; cv=none; b=OokNRW+AxQiMO7mvlvreOah2JuPF6Fpg7QsuUU/6VNQ9c+OdqF/d8XJIzJQkI48sRr7YcykvjZvufcA5cJcImxKPxKSXLjGrtCL8uNTloFyCWZs5BoktvJBWtgez4HM4NNHuI5yaCCnqeo8aEhpWykhzOegUPREE3uymbyNK5+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789676807; c=relaxed/simple;
	bh=ya+cIlw22G+pUR3u7ErvGhK75QjcpcCjqrMDeSWo6yw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oiud+FGmEG/YmPZLsnDYncr/hlymuM8ggOiSRsVFalSkbONxcoqnygmqOxygiBPxhFuZuffL8em9r0ShXiWKumRHGemh3PPFOWEZdKOJa19+JP4ZSXB1pwvop2LvLA3OqJV2n07FJSmiG6qTI+9/bEPFemSZfGRXpsjV4JHl49E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hyp29NaH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tWFcsvZF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hyp29NaH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tWFcsvZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789676805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ya+cIlw22G+pUR3u7ErvGhK75QjcpcCjqrMDeSWo6yw=;
	b=hyp29NaHyZlOgkDHgmbmNYOe6bCBS5j1cJfFeAY/sRcguEXVoK7GSGbLNIvx5SmuWsfGEy
	bA0r0qltyRY1CWwWNtRJssBy4ykZ8OvA5r2zmcHy9FP1RR1atYU0qYEWa9qFZ1Jmx0BlRL
	oLZQDwCe+dah/JQ6Wag8naXsvqMci3k=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-Q0hJfakVN-q90L6TVAKNpQ-1; Thu, 17 Sep 2026 16:26:43 -0400
X-MC-Unique: Q0hJfakVN-q90L6TVAKNpQ-1
X-Mimecast-MFC-AGG-ID: Q0hJfakVN-q90L6TVAKNpQ_1789676803
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e87478402so2699646d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789676803; x=1790281603; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ya+cIlw22G+pUR3u7ErvGhK75QjcpcCjqrMDeSWo6yw=;
        b=tWFcsvZFEdixQTaNp+FgjGlkCfsMWkm1BBUEDR8l+ChxIFKxB/dvas95S6D2sGblhc
         fqNOfcwRVwb+ata04HpsmxN2w2x2mYLNPAraeSyhY+thUdw6a3HCdPMK8/gYDU0hL7d5
         zvqvCvZ3i0OXQMqAjw51cOQ/rlfotg4jCJJhGo8DxAnUsrWa37iaDGyZdJUQ+RQHxAiz
         XK7zpqim+lKELHvQzLdZ58v925d6kYTyyaTB41SwiY7au1AxN//A21Flva4xTxYNeVES
         LmqEGvW1+FdGRUuLgtgorE7WYlvhEWosqsHAfImL2+EsGSbu54X0mASbs2llKe46Dp9O
         XdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789676803; x=1790281603;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ya+cIlw22G+pUR3u7ErvGhK75QjcpcCjqrMDeSWo6yw=;
        b=keNZCqhgJRLXecpT9k39rM69g73QW82XWYqQNS8q8F+629oc9VT90gNFk4Q170L6r1
         Xk/7AP33QySBErbUJuyx1V5U6QdQ9pAMgQxe2j0byNkUbJNZGGlp9GXA0tcsjuVkFrpF
         1FMbNYDYMQJvgxPqXGRDFZ7MUQLMSV9x9f++0rZy0R/OtiPu9ShpWfxRGs0qSHENYzYb
         6aPNRqo51G89oHZd0hTvLPuAlV3c9as9YDceGRsfPLetBpMx7sY2Syz+mfpwGh67sPAd
         eAizo9PTP5neB1HGByBAmF/11DtOPPDlVbarqviIXzDE4hG2/2+o/qB3EbjslJ37TnZr
         52vQ==
X-Forwarded-Encrypted: i=1; AKwUvBydFr16tChHvNQVLpuyihBgufgak4knQsu7g/GE3KZjltbhy0jacrPuderlfNWgklwO3XFRLD0wpH7XhO4=@vger.kernel.org
X-Gm-Message-State: AFuF++kGCxfco5wmyMDU8xFYjwvTqj5xSK0Gn4uK2PxuTaK4u8G5LYVv
	uniJ7rQttcT4fgihAx88Z2tJsW5Zpmqq5B9ADONGJtQNVmeJxvB2cSeiTKGIHDmimPdUnAc2nl0
	y3Ru/awP4QwvQwcynXSzmdpPShBUrzvEB4DDrhPTkYASwjTRRQwEfnNQ1RpetPdyGsw==
X-Gm-Gg: AYBFou2gL5w+pl3ynRvm//mRBrYlHDUxZDKrNhFHfkq49GZIb2odKIyynHaNxdOLzQd
	Mz9WSISyPGfkcXbRV7TGxmEBfpl0H0uftYbQ6FccV/iiDx9fXtidmobG7dB4v+Lhx1Ijycit1JO
	RdPEhrYelt7EuS8QdpbOjbW8Ir/1ydwsAhHX9i8nB9+yNs0diL2EvnualPkEQAUuQwTih756Pry
	KRAtxflu5fvi+yTyqRVhcoiP6r4MJfAFfeQw7v3t8N/gh8/vg1meZALWrlzYg7bNQTlukwxQRiH
	hAKk+aeMzK3fNJ3uC428sSBxbwdr6N4R9vkiDjr2PLhQggab0RC4vLKs4vDnhc8UvaVmyTHW
X-Received: by 2002:ac8:7e81:0:b0:530:256c:3718 with SMTP id d75a77b69052e-5329e4f5460mr6673741cf.38.1789676803171;
        Thu, 17 Sep 2026 13:26:43 -0700 (PDT)
X-Received: by 2002:ac8:7e81:0:b0:530:256c:3718 with SMTP id d75a77b69052e-5329e4f5460mr6672891cf.38.1789676802166;
        Thu, 17 Sep 2026 13:26:42 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252c805e1sm6287236d6.19.2026.09.17.13.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:26:41 -0700 (PDT)
Message-ID: <bd730e30c96bea38d8430460ee73f073e280374c.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Fix NULL pointer dereferences in
 GETPARAM ioctl
From: lyude@redhat.com
To: Jim Cromie <jim.cromie@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 17 Sep 2026 16:26:40 -0400
In-Reply-To: <20260815-null-fixes-v1-1-0df9dda951fb@gmail.com>
References: <20260815-null-fixes-v1-0-0df9dda951fb@gmail.com>
	 <20260815-null-fixes-v1-1-0df9dda951fb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-08-15 at 11:30 -0600, Jim Cromie wrote:
> When hardware or firmware initialization fails, the graphics engine
> (gr) or device functions may remain NULL. Attempting to access these
> during the GETPARAM ioctl (e.g., NOUVEAU_GETPARAM_GRAPH_UNITS)
> results
> in a kernel NULL pointer dereference, causing a crash when userspace
> (GNOME/Mesa) attempts to probe the device.
>=20
> Add safety checks for 'gr', 'gr->func', and 'nvkm_device->func' in
> the
> ioctl handler. Return -ENODEV to signal the missing hardware state to
> userspace, and use NV_ERROR_ONCE to provide diagnostic proof in the
> kernel log without risking a console flood.
>=20
> RFC:
>=20
> These crashes may not be repeatable, they happened while I was trying
> to build nouveau as a builtin module, with binary blobs in the kernel
> image, on a laptop with an encrypted disk.=C2=A0 Gemini tells me this
> won't
> work, so I punted.

"Gemini tells me this won't work, so I punted."

I'm sorry, what exactly do you mean here? And could you clarify what
LLMs were used for in writing this series? Code generation, analysis,
etc.?

>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

