Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4114E13EC;
	Mon,  7 Sep 2026 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794668; cv=none; b=YS/XzypKjyYGJTqjgXchCJ+KfdsABItqFVXdC0ZbAA0USf/eevezK14nO6bx3pTzEHGVPzBW7iecjRJPkdktm2Xjl5eN9dyVdDCXDveUcZx148Bc9sVWV942DxxLTB19gDeOx09E29LYJOuu4E/zGKPYIetLISTcXUbHXaqYdDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794668; c=relaxed/simple;
	bh=/GSMCKuEwbRdKS/oDEd67l9HHPp1vsmFQSqylEUq4yk=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Zzac01gDdtGC0HTeKd+SpWovqM4P1Fnatti93MZMPnfvjBwz9F8UfRZXH+P79Ut82wOVuyyucTgxyWas2xLcrsD0IPAg5LYr0W6qyHhdKU4siKNQGTWh8c4s5el7/Bwv0ZUBQOIRCopwIsfumNUZfsBT+vP5ym4Jbz3e6uwF0fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V22MOAAf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V22MOAAf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448BD1F00A3A;
	Mon,  7 Sep 2026 15:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788794667;
	bh=cs18S0yn14DT22ndf3lI2JAvn9FJIqzlDxuCLEPdPnE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=V22MOAAfQyvY1iD+rFNvwPOhxydC+MqZPySdf/KszacU+qNucovNq/VMau1c46xpE
	 ux5vtT/Tg7YTB0gheF+/fE+kTDmtubiO/lYZ/88Ky5zHqldXCyuM5BJXu9Qw7x1ly8
	 iCrWfBRVuKHAtbFyOsc/MecX62mUqnqc9QWIRSSH67y+I4Yo/w/dDWcW3nQt+pX63h
	 t5dZPyVUzLG8QAZj8ZBiE8V0bayt7uil6WiXlZk/4BbeLzFgNFV2hzmlMf4EzuqPOC
	 ONOjqOAiPPlvs+e0MKFeC+zGWaVm+yNwxI5X21+Gf1P5EXUVMiY8UFFrk1Hp2qwVjZ
	 h3wv8KwU1mzGw==
Message-ID: <16a57ae9d703e8aee8fbe8a243c7e40f@kernel.org>
Date: Mon, 07 Sep 2026 15:24:23 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Albert Esteve" <aesteve@redhat.com>
Subject: Re: [PATCH 0/3] drm/amd/display: use kunit/visibility.h for test
 helpers
In-Reply-To: <20260907-visibility-unification-v1-0-6a962e5b3351@redhat.com>
References: <20260907-visibility-unification-v1-0-6a962e5b3351@redhat.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alex
 Deucher" <alexander.deucher@amd.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "David
 Airlie" <airlied@gmail.com>, "Harry Wentland" <harry.wentland@amd.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Leo Li" <sunpeng.li@amd.com>, "Maxime Ripard" <mripard@kernel.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Rodrigo Siqueira" <siqueira@igalia.com>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Simona Vetter" <simona@ffwll.ch>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Mon, 7 Sep 2026 15:28:55 +0200, Albert Esteve wrote:
> amdgpu_dm grew its own STATIC_IFN_KUNIT / EXPORT_IF_KUNIT /
> INLINE_IFN_KUNIT macros instead of using kunit/visibility.h. This
> series switches the KUnit helpers over to the common API.
> 
> VISIBLE_IF_KUNIT is gated on CONFIG_KUNIT rather than
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
