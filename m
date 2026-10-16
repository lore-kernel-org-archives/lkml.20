Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6464D9F91
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158889; cv=none; b=T0J0WWAroGHKus+LIBOYSO/br1GQFLCM1ZsLsC+OkF2Ku/Z7CfypzsGwLuk+w1bs8HvNBj2bsiTDLzlrJgsqnaYusqNusY/jWEO6geIrjrfzCBKzmTkpeaIU89twAw6htzjx1Lr1kj3sD5lt6TmZ+NHPNqbM49oCXiUUTmeIBsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158889; c=relaxed/simple;
	bh=mqFXmG0+82kD8GDDaPBco0UAnX0A+bUqnYurXQmfV1Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YCBJfGynBD+UTZb7gyAbBe6ygJDkX70QO/UHmNoAQnVuTN0HO0DpcPE9VRR/FOqY8NWkCltdINuGRY7lUO41IpGiyse3t7/gtSOr0W+G+40EhW8jOgEmceraiwCVxYzVkQDVkHcM/wg6yyThF6WTxOFsMPR8/bDzunmZnpC7swY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fxh8SK97; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fxh8SK97"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1d1f26a63so3673025e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158886; x=1792763686; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRDYyfM7TkTb+fgJiC0WCgOCCRs4w4XpNaptrf9kwKY=;
        b=fxh8SK97hh8FxGnSWn87mqRin7ceMylKr0o3/DMs7ffJ7r7xQNdLyjsCGoLdov6Wjg
         wHqM/YKrkGYaWfzAO1evbAwBlZOPIvSRl8a0mcYkVOLunc1aHamHk+SZ9Iz1cIB8r0un
         lZ0LcRcXdQkNN3x9J5zDDUWoBdhmPwdhBkd0kyutRo+V5nfu6I92gsm18M4PGAyw05mT
         lCmQz+ExzmaI3VnDd1KYiG2M13MRjz+YfVjWpaDu5873B+2Od2enm1jBx8DpD8yIm+VJ
         FbCWYaAOGLFZrVpicK6md2AidwpygYUu3eI6myh4qIAO3ZYT1PlSROcrqBngOGxvRAMa
         t/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158886; x=1792763686;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRDYyfM7TkTb+fgJiC0WCgOCCRs4w4XpNaptrf9kwKY=;
        b=U0vdhIetyoWC5VvcRbIKHaEOGe1zQKvYEtZeCdRw9LO5FMr9nFCm7iIPVinTX7rYRf
         2BoJlbCmkwZ+A7b6uoIiGCv44we9I+qRGu2OMBSm117mBS9CZFoKmfCHKHrl4pVrF7Ij
         kvQombqvWE2TdMQQqjf7Sfl0vzcX9SVf2rlN+nqmjeZDAM0htsvx2iGXGqo2xj/741F7
         XNikhpX2oPwTFjTw9ldn+8WBes/JmfLV4JZBETMXIb//0OS6AIfWzOnyo8GycGfFa31D
         WRBuaD9+HmwlJ3I3mrgp+Thi2FYNjoV1M2T6Alz+10WINeudfXmKtjs63xnqx8Bhto8X
         DdgA==
X-Forwarded-Encrypted: i=1; AKwUvBwz+rrO8yGNrZZE86roAyNscL1Y6L5uKMEwRWAvh9hmd4B8MEQ368JzcDjiK+Hzs+HsFgoidrK4h/5/I4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlDP2kHH/4SnN/pdmbvKJEPHx4hmi/3VSbud09SZQnPPfX45Mw
	r456o5RnY7hCC78WXUjGA2j+jiqcbsvCWl3GORK8UweLKYMS5fqPMm+AZhe6WCM2bCKBhEfyY++
	PVDDJVB+Rv9M4Z6tAHA==
X-Received: from wmaz19.prod.google.com ([2002:a05:600c:6d93:b0:4a1:99b0:134f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4708:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a18e47a8a5mr488323585e9.10.1792158885671;
 Fri, 16 Oct 2026 06:54:45 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:37 +0000
In-Reply-To: <20260814230923.1292966-6-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-6-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-5-aliceryhl@google.com>
Subject: Re: [PATCH 5/7] rust: drm: wrap fops open with RegistrationGuard
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, 
	deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2026 at 01:09:03AM +0200, Danilo Krummrich wrote:
> Add a Minor abstraction with RAII release and a fops_open() wrapper that
> holds a RegistrationGuard (drm_dev_enter / drm_dev_exit) across the
> entire drm_open() call.
> 
> This guarantees that drm_dev_unplug() in Registration::drop() waits for
> the full open sequence to complete, so all files are visible in the
> filelist when iterating for cleanup.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I would consider whether drm_open() should be changed directly here, but:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
