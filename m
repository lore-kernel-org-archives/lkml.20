Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571710;
	b=ANiJDnB4uX/mSN0h35A1uWMxhhNGwobzoiHRmrXrPUeZHtUssFKqGva/o6N5dHFzSFho
	 B8acQ9n5KjQ6NB16V7WgwiXcBqCEeMluk1FoUXEvUPLwNeQbSSwqTqnX5nsQJW/b3kZUl
	 oPrNA9kb25zgj70tCrRqbhZu84f/pGWrSgsgqEuTkF4/CBlpjwSQo8Gk3x3WOhj1Zmh53
	 +SR6lMR1pEJd/ALI+0eSt543gUQH1rxT/jrpqlQih1O9DnKvzL4mgt7gzDUpt0BhWXK1p
	 Xt/5s42DzzpavgWEzBr5a1X6dZSvAiEuFkqDP8mOxFC08FoczxQgV7YJykyChrdIZuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571710;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9JiDbdgGuLN51aKpNSs4G0icKV5bYJezA/G+Y0YwoiM=;
	b=RdY16UrNs6aVFcGyuvEujcLZgSUL2MJFqyg06yD5+kBVTfqpIp5GrPQslhyw6TP34O5c
	 tluCNq6JcZTLrP2phZzekUuTBnIJjID4aUU2MziFwEbT242QX2LSlCqScMiPImj0Kd/xw
	 16WkO6Fk9Bn+Dx1HkNscPCW+jV+QuBcL1WEzufxcOaLxGQ50D8o9pI+TWco/rI1GZzsZ1
	 MQ9gPB/BDtV4QX8vAdO/op+P+tegiwFNgC7Jq6MTW7w2pLokqN8IjPjCUGZy6F9MIjSp/
	 LPzeasCcFEfzOnNnaXU0guYUH5UsMHCceH7hWWGLk9q3knQbMzbHiOPK0ryrtVQxNGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fK8XeHWi;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53492606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53492606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fK8XeHWi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792571708;
	bh=UNMzNdSJ1jQYOZWHW+9R2rXUtTmKqb+0DXMYwW9GLZ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fK8XeHWi1Yss47HrUDxKYtxdkcrstJ1znpAmGWlcseetbOrr+SgnNjYGB7Jq2Y0mO
	 JKMtoVkXfWCl9tL5cKOt1670V9lp07bETwSVJmMJIBHI6Cop0yGXCXpuhM5GWrd4+Z
	 8TG97txhE/WmTai9G+KyyYIL+dgJRdHpOiaf//g6T+ni59jQzQs72wLVo4+j8B1Zxn
	 CTrC3Gf30ULT+M9eIee9K4eIBYDuJ5yRlseo80yvqcxgYlfKnN+Pzi4z25c/RtvEwG
	 3DgprH13tBfS8jLI/Rqdu0n5JP80zdesRbGVsM4/OG4cJYPFHUCbVObYaS/KeoOCkb
	 c5PmnxF8uOj5w==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2220417E053E;
	Wed, 21 Oct 2026 10:35:08 +0200 (CEST)
Date: Wed, 21 Oct 2026 10:35:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>, Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, Alice
 Ryhl <aliceryhl@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/12] drm/panthor: Refactor GEM usage flags
 assignment
Message-ID: <20261021103501.14368b3d@fedora-21.home>
In-Reply-To: <20261012125940.3291951-9-ketil.johnsen@arm.com>
References: <20261012125940.3291951-1-ketil.johnsen@arm.com>
	<20261012125940.3291951-9-ketil.johnsen@arm.com>
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

On Mon, 12 Oct 2026 14:59:36 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> -static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
> +static void panthor_gem_debugfs_add_usage_flags(struct panthor_gem_object *bo,
> +						u32 usage_flags)

nit: Limit has been bumped to a 100 characters per line, so let's keep
the prototype on a single line.

>  {
> -	bo->debugfs.flags = usage_flags;
> -	panthor_gem_debugfs_bo_add(bo);
> +	atomic_or(usage_flags, &bo->debugfs.flags);
>  }
>  #else
> +static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}
>  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
> -static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {}
> +static void panthor_gem_debugfs_add_usage_flags(struct panthor_gem_object *bo,
> +						u32 usage_flags) {}

Ditto. And if we were to have multiple lines, I'd recommend:

static void panthor_gem_debugfs_add_usage_flags(structpanthor_gem_object *bo,
						u32 usage_flags)
{
}
