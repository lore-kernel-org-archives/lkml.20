Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499019;
	b=qVvKL/CKP/K0QRHUc1AG+pCkfKVF34erWCgy5ZP9qSJticPNw3/XBlnkMkP4wLss6Ke0
	 q7Xw0CL1adkFbx+PxBZcMMsCLuDntWzozfSbMRD+yX6H5MtDWb/5k+c5bkLcfAf2yqiL9
	 /gOpxS2dgdkjNIW+Esr/PIRguPAm74V89Rh2dY5XRiqtojV1nw6W8kWrXRYTJyE3AQPAd
	 ffHlF7mjg8PheWEL9EWbW8zrb1KDtD7C3KqvOqknt4LmEAUQr+Bu1pvYnoMmDeV0fH1OH
	 teaGEdLS4lY/JU8TK8HmJ8p7ZEV/xWKl0WhuHhZPI+qCt15QRXByGIhf0DQmLBoPWNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=I42Z3b+yPEBavpF4t/N9DKKu9fZtHkDth+tw3l5ORkA=;
	b=UiG5X7o9rGnNvJHrAO9TD1quYe/gH3l6Om50Hznxa2Hxgo0oaK0ckcHKiXq8O1wBConW
	 OwR/DekuuNj4ixSnaUK5RliwmDsLJpIaK/FsJTd6i6auxeO8sJhd6UdYIlrAK/lXH/cDC
	 ORVUSQ+C93Prd2YtpVg9r081UjCIAEtQAP4ukLFxl6qJy3zsBioHURa8SUaaml5B10DiA
	 Gj30P0gtnuVgyUEqvPXS8YoutzLleu6c0gKmQc6O5ChR5qLH31ix/SthonpUZ8N4s4uKt
	 pVMOwwUEhWoIEs5dtvnMYuEYLB59mnlEj30iYeFnsn2flpgh4YPPqglqBbllB7Q9qcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FEemSMK6;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EADF606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EADF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FEemSMK6
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49cdc4080ddso4697665e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792499017; x=1793103817; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I42Z3b+yPEBavpF4t/N9DKKu9fZtHkDth+tw3l5ORkA=;
        b=FEemSMK6H6UPLEAX2X8VijY8Me7dhoMMbvdJ0zm6RUqScJ0zOqCAAwEzE2+lLjflFs
         Qc2cAdbhDbhd2ds8aIjSA9X864acwFh+iwxFLe3rZ6vqatoBcw7chkPVnyhZpqS85GYw
         IWaFv/xsSmqGuO3ZVP8TSZIi2vZ5AdjluRxveC+vwy8DdZyFFwVuqdP9zlF6tn+f98r3
         ATA2t+e1DCESnn8f7IMJwmKf0XWWcsG9m0o0F2ICBjKj0U6AtRo1WdgOIJFsJLeQ8FLr
         m0mTgJfXRn9OiXvqFMo4m7ljdeT2EU0M/mhd0M8yfXGibTFsbL83wW1gPOFs0EM2mrMt
         rixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499017; x=1793103817;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I42Z3b+yPEBavpF4t/N9DKKu9fZtHkDth+tw3l5ORkA=;
        b=yq9Toya8QuttzdIf2SqProstTyy1JbLJmtb9ETHbgZYy4AD7+z+D9SrjjflExLnMmb
         K+OjBg+XDK+W8kUCfXw2gJ9QL5u1J+kJvWTkIXQEcQen0dlNlBIiVeJLOBSWsU4WVlUT
         JPvmA+ZXC91vi49d87LJLmMr+0lSKOsmAIHfV5oX0GSiOB2uf8UzQcFu6POsiWAIF6RZ
         LNZo2jWtp36pgk4PiMJXxzZ4ibpTKWXvDP2PuUMAc/2G2QSHWkGbI7TKQEJuIoGR/YiO
         oVN3g9lG/eiuRQR6wvlWXN88Bh6+Lna8mSv+qNlxNv2n2yinBBMI3kQj59TIk6PM00ec
         Vn+g==
X-Forwarded-Encrypted: i=1; AKwUvBzfxUNHcZgNEINXI1oUA4qGFVPpJQlfGQCbKrJtOmORBtQ+Xl+FBsz8TZ82mFmNPk4vTBb1m2tVb+4DcHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvw2uOiq/P/7TtSRpiZWhDKiBq/K3eL99xavGRuE2ABNkhi89F
	gorEUiE7zrn21ozmxz3f5Q26kOMAlHCP00eg7yLKNqToAFK5LtzLe2BUbcwfw09ErvDEyFgktpT
	c3ZmP60zgR8W/WbH7vg==
X-Received: from wmbz19.prod.google.com ([2002:a05:600c:c093:b0:4a1:e348:29f1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6610:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a1f4fa26a5mr45442095e9.15.1792499017228;
 Tue, 20 Oct 2026 05:23:37 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:23:36 +0000
In-Reply-To: <20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com>
Message-ID: <atddSMMpb3DUauWH@google.com>
Subject: Re: [PATCH] rust: drm: gem: shmem: do not leak pages when sg_table() fails
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Lyude Paul <lyude@redhat.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 19, 2026 at 08:21:52PM +0000, Sami Tolvanen wrote:
> `SGTableMap::new()` takes a pages reference and maps the table before
> `Devres::new()` allocates. If the allocation fails, dropping the map
> frees the table but keeps the reference, and the next `sg_table()`
> takes another one. `drm_gem_shmem_release()` puts only one, so the
> pages leak.
> 
> Take the pages in the initializer, after the allocation.
> 
> Fixes: 616c229ab010 ("rust: drm: gem: Introduce shmem::Object::sg_table()")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

LGTM:

Cc: stable@vger.kernel.org
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Looks like there might still be another issue when Devres drops
SGTableMap, leaving a handle to the GEM open.

Alice
