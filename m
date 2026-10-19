Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792453624;
	b=BYPmmDrbEYkf1uEV0xAWleqB5aQtgyVFanisvT7nHMJG1hHuKH37rMwblptvAYCsudqd
	 TAzJ3+QdpGLYiHNxqLwZ7Ca4ccjFIiPYVlm5u4cCf6qhtPP1WvxeSS9m0WDOlDSFEVLvK
	 murHbolfsqxmH6gRxKKvIh+exBc3GyKm6xBsVJUPR74/7wiY2P5DADtGXTUyPro6Sfaj8
	 w7xF8tDHw2fa8dl3gwpPafHVECtwk76f2WSIP0eeohIeyuJ4Z8Lm4EXaDSrMAJUk5hJ8B
	 Ebml9qXhUTnQQpxxA8Il87c4hiheG5Zhe6nQ6kLG5CwpNnRsxoEL90aH3qhlfM59szQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ypCU1E5MKpp7DyfKc2E/egobrXvy2R64su9DcxdosVA=;
	b=5VCjOgVSJ2QncDp8JH/17+Xb87enT7R6YlXshWG7RB5k7MrNzk36GhCgTgVrF7n3Ps+R
	 a1T0EoQ6Hak1E7VOjop0DlxUQ2KSOFF0Qoj/lxQVH8+NhkLBley6U1M8ZUb9nq1D5gm5V
	 n4Rvt9GRE3Pq6FwRvkeTNVdvsTxdqIK5xY4tWg38fUAJhGmhEGDFeQ2IBhhiRP7YYoKK9
	 ZoRwZrU7S2xFXqDhtcFcHqa0O7qtvMEduRcYkOed53ERkfyThZPSJ6eQhjMfJL9vHL/9h
	 Reqkf3Sy89thI/tkNMaaw3ZAnQ4IBPikFGPO2rVpWnF3p6ieP+yU3GhT3bZ59Hs5JxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lgkpddl2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DC0606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11DC0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lgkpddl2
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so11942921fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792453622; cv=none;
        d=google.com; s=arc-20260327;
        b=f7qxECH5/doHMYZaXZPw2TCnqLNeRzX8Z9TFkPTM+V5+90La5c+RTi09MqOzCSv5VA
         bUe0PTzOJW6cMNjrNQ0KQJB7aqQI1ppkrUP7+enqZSfI0Ov7VmE1rUUgBZJRrovBT82H
         F60KbT9WTBnDprg/8OXUZFbYeBjWppx3kcsg+HkumURm4dzndBeWT3rp6SuaOUncRPfF
         ktatyhBZfk5RW7OtpHDiCCLhpPZUWR0/XOJzQkv57MF760cutaCwcdqbZWmcsA8ubX3H
         fqk7gD3bMAkCONbOnam7FXPhVRA1rCs0UzIPN5e5evrmiCe9eth3FyLtS/PW15HMlpF6
         0/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ypCU1E5MKpp7DyfKc2E/egobrXvy2R64su9DcxdosVA=;
        fh=uMr4FRYRDwNX+CzodSugqMgZOSj1k61n62voPCaJd+Q=;
        b=TMFtHQmcZNJq8lps7dn1jG6/b8NhlHKnH5uqn3mfxeGcUM1kuGUhygcA74xNvv1g75
         7ssyxj423lccHitggR+RMA6kdHH4NoonYSQkvaKEMT55dsPZpnn23YuwFPpoGyuxViI6
         LtmrnK8zGHgX9YtKVkPqucd6wNRdycij135HJy8NZA8/dDKQLJWEuNRFKrgS199xO/T1
         4lGImK+qzQZBaIgNSaIGOLuUooOjrV5i8QdiLCV5Fnd8hZpZF/URRBeWWEDlOT0HEJx1
         z9db/ClYRUdlnXRdV/Z/YGdP9M4IiJ/VX6AM7XYP32aTSxezWLVZCElRZtPZ5sCsWxOL
         C5AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792453622; x=1793058422; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypCU1E5MKpp7DyfKc2E/egobrXvy2R64su9DcxdosVA=;
        b=Lgkpddl2TvvCEoP9iVOQkoChp1KC29S+ddjoSUXUlTzd1BTVP6lz/tJ1HwEGS/F/A8
         /OSHUEs5EcXL83QlbmGhryu9bdgy0Pnu8QxPCvd4c+Unk4Y3rI3UyTm0qqeBASX/5Uou
         w6tENwv1hm6FZy44zEVf17LfBo25esknPgdZ7gs2Wq3phxLdFCr9aUNhPXe0OyzygCxJ
         6v1OtRUjnSerusS0ldpWeaxMKtogm9r0GVelfeA+y9tJdqm0MBXTcPQjJtPkagnT2zUZ
         grHA621VmUi+mG0NhI0VVKH4QKYQVpz9ADfebjH5jT6A864uxZTTn0Q4fUm4Dx2AHXg/
         CJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453622; x=1793058422;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ypCU1E5MKpp7DyfKc2E/egobrXvy2R64su9DcxdosVA=;
        b=UYowaG9EaDmLsf1+Z/NMFPXMTvT/iqWBKVqCU2h2XAv9dWhV2pW41AQdp3RdEU5v96
         U2+oXxghysg4VOi+t/ynOuNbBPc7BP6maV8IFpJTRbeSoxhgsHt7Ycmr3ScXStV1LXE4
         dsMukfOTWhHn4WXB5kgKQ1x8JHDdDSlu6Rw8XcbVsP+IJELDQXmr8EbI0d3fvoAKOWCQ
         fKLzxvusuQFz5A9ZVK/eV91wtutBYeCAM7eY/bPDD0RYY3WDMrqKN0TDQAbpBDjt4G35
         EtbirDEwl5HIa3gcwHFuLs7BsOrZMcEzxSMcTYQjN2d8jGorHCzBYNrfqmrKQhjqY/PP
         Xw6g==
X-Forwarded-Encrypted: i=1; AKwUvBxwn0HDqTrk64uwWRiPBnZ94ZIjB3R9f/JzlhhDIPIu7kbaMjZLd5AUwa9eFFTlOlGW0PCjTp6SIpWkER0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnC7XsePIQTmCJXcgA26TNyNVq9ORolb6dNYrn4GhY37ludGaV
	db6U0z5tecMVtmt16RMLOP86djNliNi1qDHo0DXVyR/sB4Cx+XaS628HLGArFtMHmsWhkU5TSqW
	izpYTt63goTO6daFHZA7VBfQO5lkXVTU=
X-Gm-Gg: AYBFou3h5avf5hULhUJb1pRhC1CEoy/v0JR6SwDGQpemU8ovwNOwH/zupZY9OfQrdop
	ZEtVLHp08/+zNhP3n4LnI1J1B4E1DgjJT8pAphxKrH4dk8x5LHOmCG+m+56e60MRQwJXJAe7lGs
	e6i9nM0EF20jh+YxKhEc5Gm4EhNRzsJxK+PVhG3dIgRXAbIcXIQqAb4cM0L/P4SKBCD7c8EAPdl
	Yy4rsF3+xWWeP2HQpWv2cgZAK+gW346eM0z/JkL0JPOaqdOMCqGIujf2xWhtuAT5TIiigDIUb1H
	QbcXNg1mwRutQATZo2DzZQipqRCQH2GCJqPURXy4dWNaEbcR2FzxHw==
X-Received: by 2002:a05:651c:510:b0:3ab:2d74:71e with SMTP id
 38308e7fff4ca-3ab2d742b84mr17797071fa.10.1792453621900; Mon, 19 Oct 2026
 16:47:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016023521.747447-1-oss.patchbox@gmail.com> <25a35fa8-9540-4892-8375-1788e6795dfb@kernel.org>
In-Reply-To: <25a35fa8-9540-4892-8375-1788e6795dfb@kernel.org>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Mon, 19 Oct 2026 19:46:50 -0400
X-Gm-Features: AclHuK-d2lDGIbO0nMDnG4pSmt2gfW-rFmLHGdUc2vgLpFp-z405iCYiTrPxDos
Message-ID: <CAGG=RgDUFpDqtbws4YO4T8A3pS4Dr9twVqP9hSD3J_zP5Dc_mQ@mail.gmail.com>
Subject: Re: [PATCH v1] virtio-mem: only mark the device ready in kdump mode
 with vmcore support
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 09:05, David Hildenbrand (Arm) <david@kernel.org> wrote:
>
> Which kdump kernel exists that does not enable CONFIG_PROC_VMCORE?
>
> IOW, why should this be stable material?

I tagged it because a9403425b3cf has been in releases since v6.14 and
PROC_VMCORE can still be turned off with CRASH_DUMP enabled, so the
-EBUSY path is reachable in a valid configuration. But as no practical
kdump kernel disables it, I'll drop the Cc: stable in v2.

> LGTM, but I am pretty sure it does not make any difference in practice?

Right, nothing is queued on that path, so the device has nothing to
access.
