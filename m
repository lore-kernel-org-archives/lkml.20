Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571303;
	b=N4HTx0Fa8qFYUN9jIjYcxptq3+o1nM7sOKzJqxwQeUbwFC+k+X6ofwpYIMbVXnBpCB7H
	 fSQ4KeiFue5Jo6woavjnj35Vp6uthsZfiozNwoUXzlkQ8I88h8sXNa63QELvQ4atti3PY
	 4tYe0SZ55ns9NidS9kiHBEwhJ41Font/0/5CH2g4czxVB0rHI1AyrXKCEy5bgXWncAYFy
	 +NwTD41iX41BpmuiVh4BHqpfcjAa9eLmOEQiM7XCeR20OQ0QEFHJ4SMXY08yn1fE47Hhr
	 Lzvpoqw9b1DEMVv/mRnrsh9fm4ic8wWeJOduRKINJTnvJdLmWxErYqPojQH7a1ffbrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571303;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=fjd5u6/VAOKxmcjraM0r6/Pa+qZxADFxvFzkqgtQ+GI=;
	b=P93aeM+V2NLMn1ATTLO0HOF9mDK5kPdB4uKDRcFjRYlxbYdb0Ou0TCDW8QKyTvrAT4gK
	 2lenAcm54fC9JxMgLZnndpDApp5bfc7DbYXh/vHgarSUOFUaaw8sGwI6mzHOeij0uJFL8
	 AmrwcTEm+WpjjuNljhQO7HDM/dI9DFs7CZm1mtdtoAX/ZdG2kN7gsuJoKtwZ6k7GV5NqQ
	 8SfOaSDmSKy8gVeAwrLyKdQHyK9V1opcWd7z7eM6wj2UHD9an5gWOu8RmfhzOieoNEIDJ
	 sRcuJsNU39hwdyWWL3tl+VKqQVxKsn7Am9/WX0mQ6/kL/+TnpC/5gfNtw/jX1cGEAfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VtLboRQT;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC064606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC064606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VtLboRQT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792571301;
	bh=wKjtnD396Woq3DWe1OJMEf7zfBjvDYFqy6fP3r3ECXw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VtLboRQT65bjASJEg53VUke7m8prr1Ad80lIhheRtD6A/Qy4kcVg1ZfLhGuhnBN5y
	 EClKje4l5ZpL/o7UORux9JHDMRKlq6GTaqDaMqmSWTeiuCOqqE8DZpn+aL08/QRUC5
	 CESyZ7VsmJofefBpf10CIEU2sujP7I73Lkn7vXTTH27maf8yt01dxfoLVeY/Zjel8O
	 wm8Q2qTMabqDuHRQErn27+ezeiB/b3knTfLdYreAqjX04d4MyjOz1TAOdXrXqvC6CK
	 jGL0aZLnZbITUi4pEX5HCqx2qXi2bc+pWBCKHP+rHh9zrB82DgmAWwB3gL3xGAIt6n
	 oIDVl+5AJifqQ==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B10B117E04B2;
	Wed, 21 Oct 2026 10:28:20 +0200 (CEST)
Date: Wed, 21 Oct 2026 10:28:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/12] drm/panthor: Pass drm_file instead of
 panthor_file
Message-ID: <20261021102815.2c312014@fedora-21.home>
In-Reply-To: <20261012125940.3291951-4-ketil.johnsen@arm.com>
References: <20261012125940.3291951-1-ketil.johnsen@arm.com>
	<20261012125940.3291951-4-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 14:59:31 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Some sched helpers need info that are part of drm_file, and we will
> soon need to call drm_gem_object_lookup() from panthor_group_create().
> Let's prepare for that by passing a drm_file instead of panthor_file to
> all current helpers taking a panthor_file, so we keep things consistent.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> 
> ---
> 
> v3:
> - Fixed incorrect parameter passed to panthor_gpu_show_fdinfo()

Test bot reported a bunch of kernel docs to fix to match some of the
new prototypes.
