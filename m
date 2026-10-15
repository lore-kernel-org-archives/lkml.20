Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084FF49F115;
	Thu, 15 Oct 2026 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066292; cv=none; b=BD4NSECgzaoy2v9PGJziK6nXrx6IS6RgjiOvCGLdE+ByrbLed7/F5Oyqthu5bGHRL54ktC1yuoyyjZcSVEirU85InpL2GHF46eaAsQc+d3w4zoOpZXWNVGK7tX1aAkRiD59UktYi2nQPhvbNLpNRzM4JDlA8KBqZxR1b+6C5kgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066292; c=relaxed/simple;
	bh=2NtPz39aovy4RnKvI/EytnYTuchMrt4CPkEO4fsxov8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=CLYAf16G3r59wkAm0YF1wSTzzPjsEdo7e+1+TEzbJjidjHHavXyQr2CuEFv5OdHph4zIKkTmaXwaW+gvZgd9w7FwlQZE5Tdw+HhQnGy+VpboadaiJscfsuJV+Jjm6aSc2rbBn+j0QplwfR//VxjKC8ypUXOtaSteUvRgxp+IlN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/Q7753D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/Q7753D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131511F000C4;
	Thu, 15 Oct 2026 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792066291;
	bh=c6YnxnG+gJbch+R5VS3vE5pnef9Y+ENKkjRrOC1AvnE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=m/Q7753DNhXKEODgQGQdxWcbrMpjx1MzEMR7nI3q8i13U46QsL98/SDWtVjpraAtq
	 gypNBCcMRkHTE93IervYneCQI7U2jIEAFHvLvskPHo8VY9tMCrk7So5mbtzTFEJIdn
	 EiYPuRSHEPJtRAlPvZ8eC7rFQvQUEFEb9xWo3xDK3Hx/lWF4uTpfyCN7xqBO2KyLsR
	 lHOWBtBr9srEbnksFyYU3MItPH4GmPbQoCF4Rux1liPgn3zBaqnVi959Bm4vY3Kc4S
	 GFxTzVT5y9vQoM/vgZFV/vOla4FhxBNOVLd3wqZkw9XWAjqeIxuSPL/Z0wIfsiG1Yq
	 5Kf3rmItiOMxw==
Message-ID: <b9c2f013a83257e2416ece9183d7efda@kernel.org>
Date: Thu, 15 Oct 2026 12:11:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Albert Esteve" <aesteve@redhat.com>
Subject: Re: [PATCH v2 0/3] drm/amd/display: use kunit/visibility.h for test
 helpers
In-Reply-To: <20261013-visibility-unification-v2-0-3ce8d458bddf@redhat.com>
References: <20261013-visibility-unification-v2-0-3ce8d458bddf@redhat.com>
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

On Tue, 13 Oct 2026 13:58:12 +0200, Albert Esteve wrote:
> amdgpu_dm grew its own STATIC_IFN_KUNIT / EXPORT_IF_KUNIT /
> INLINE_IFN_KUNIT macros instead of using kunit/visibility.h. This
> series switches the KUnit helpers over to the common API.
> 
> VISIBLE_IF_KUNIT is gated on CONFIG_KUNIT rather than
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
