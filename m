Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1622D46A60A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294552; cv=none; b=HM0CNyDgkenPdzGHZZ4wme/wDQVBHSI+9ScKSWv0iczHRnlqZLWOVhQSr3pxaLviAS/GzS1xKdBgdiEevPpeXTUAXawUVdKNBLKece4olwUbJk8ALAywWg+Ei8uIXWvgPFfYaJWcl7A2FeumE1vTEfiRahUMPzDxzaYyLYENJxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294552; c=relaxed/simple;
	bh=dYKvfZiAERpOxnN2PaW+Lz5SjOFiWz06C/VYAQHYfsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZt1g07exv4DnYGd3xO9/0U3XXbswP72+3AlGwftWpRXIwoLsWcOu7Srij7I+dIFt2VrcxP187cQVAYU8YAUw8jTlQQLYM5MdZioXgvPBaZ8asmOKGTKObVS6YrQUJGrZRSyLaVXiMBgcJgif/G/3X8MJNU4G8sGJ6CpctYIhqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZnp7Cb+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZnp7Cb+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38511F000E9;
	Tue,  1 Sep 2026 20:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788294550;
	bh=ItPrb8m+8Z75krTp11hhE6Jc3K1gPkj7qQ/v5ze/0As=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DZnp7Cb+mm1iS1vX2nH9QUjMDPPWrpfvCDM3ZbIQC0REkHUwO/19ZK5AmjML+IWpA
	 sKqY07WnE394O1OfphCqtORuUbXwLb1uSRZ7RGkt/tLK7xUVF2RzclQJ99giNkREDm
	 4mhoUSXOagxpB2o4CVe7zQzSXOusS8oIK/ojra3VAJgjKxERGjNIyQetisv51ta8GB
	 ZPFslsUeOKlJxzG69AgC/6gRtaiuh1UNpT+9n5JJy50orhQ1hVOfXTGvvqyS9Ieq7N
	 v/RgsOiFoBRCTI3pySCePHxaIGUTNRYklb+HPOK8lwSDG38p1e3rL8Xo1fIylumCMn
	 8wEhPCCu0JyaA==
From: Danilo Krummrich <dakr@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Karol Herbst <kherbst@redhat.com>,
	Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v2] drm/nouveau: Use write-combined maps for coherent
Date: Tue,  1 Sep 2026 22:29:00 +0200
Message-ID: <20260901202900.6808-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com>
References: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 21 Aug 2026 23:42:59 -0500, Aaron Kling wrote:
> [PATCH v2] drm/nouveau: Use write-combined maps for coherent

Applied, thanks!

  Branch: drm-misc-fixes
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/1] drm/nouveau: Use write-combined maps for coherent
      commit: 774b73428e6e

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
