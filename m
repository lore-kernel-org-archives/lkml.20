Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658129;
	b=WAsVlpF5jiOfTOuNF/RfAtX9yvJt2UU/YzJ0WIdOakLkUP45i6U8cHeTgSqRhZbg1wPA
	 LyGX8COj+49RCm6o2wviX9XWnBUrGh/h927Mv4K3cQHLDQN3ihcidCgWRsRvEG8ZGnTjK
	 H6wzNBCQLYoTiSzELasCVBAYuh3EpHxxFJhKqFCFbKkeqVF6NIrU0fDBhzO439LSOi65v
	 r5LiZ+22PuPWOO41eXbAx9y32s/Q6fIVrHiQuaGvcGYSu0R4+uIIEZ7ROvPiPY9g70Qx3
	 wUKRNKS8jX92cZf6bXHK5wT2+wQTtOOnB6MGArIh6vYpuTAg85RKby9dA4toA9Vwwiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658129;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=2C7WZ1VtQP+VK8AvrEOe+mqYWvnN1r4n6Ye4rI4l0VU=;
	b=2J1PkADTt97KmHMoLyr/HwO9oCpEOFf76UlgQOCRJJsun/GXrV7RNzDYMKW7DFQCIvJL
	 B27K2PlyHkU4qMyYNuDuVz2lZmdf5JqZUmJp7+F0wYbFCwEPFt/N2uWkDPwaj/SbYs69A
	 edi/1ogfCVDjbBJuIIGrhpD5dbABYzPhe4GPS7dRiAnA7+KZqo0Sgkul0WKLEuPHpTr1q
	 5r8yq2F4EPShnF8G5WTa+DBzedjuUOwQOir7jPJiqhTS2yifGuIhwjJh8B0js3Zf3dfB2
	 TWlbsB2UP/dydUh389Yds6gB3VEGrz0aIgv+9Z5iCfvrUZxkxErEG0PX9Ckd6/Pl2yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QlIRoMlh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17966606A319;
	Thu, 22 Oct 2026 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QlIRoMlh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1FE1F000C1;
	Thu, 22 Oct 2026 08:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792658128;
	bh=2C7WZ1VtQP+VK8AvrEOe+mqYWvnN1r4n6Ye4rI4l0VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QlIRoMlhNr2DCbu+G2Gzh3l9XbURKpuPGsZUWcEToVd+RDQVrl33JpzK6oiDVL7QN
	 4Qvvz8a+38d4M5MvsCf0UJ2ugDWnxPR/gS9sLweY25iaWancK0zvlQSxPt6lIsUMpK
	 8TwbAxpNSPjvsCVbWqnPfZi0E5COo8WPVSAfa539lvLzll28bPrcvzskNYN03hd1VX
	 azXHB4JGq1tzoHM86d3rpfBkhR+wlr8jWUZbqH3CgRLTAmPq/WDEntPaC5KJkPXAnd
	 hOcutGnPEhg0bhLrJKZ2WswO+H/vvV7vSYWWCjmqNngPTyQrMMzd8Ww4INH0j8XATy
	 ARgqwy/J0xpgA==
Date: Thu, 22 Oct 2026 08:35:25 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: Yidi Lin <yidilin@google.com>, Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: coreboot: Don't skip CBMEM entries outside of
 known memory
Message-ID: <atnKzXmotubTRp89@google.com>
References: <20261017090351.1266064-1-michal@nozomi.space>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261017090351.1266064-1-michal@nozomi.space>

On Sat, Oct 17, 2026 at 11:03:51AM +0200, Michał Kopeć wrote:
> coreboot leaves CBMEM out of the /memory node of the device tree that it
> passes to FIT payloads, e.g. LinuxBoot on arm64 Chromebooks, and only
> lists it in the memory reservation block. The kernel has no resource for
> that memory, so region_intersects() reports it as neither System RAM nor
> Reserved memory, and since commit e31ecda9e3af ("firmware: coreboot:
> Skip no-map CBMEM entries") all CBMEM entries are skipped on such boards.
> That loses the coreboot log, the TPM event log and everything else that
> CBMEM devices expose.
> 
> Also accept entries that don't intersect any memory resource. No-map
> regions are still skipped, as they are IORESOURCE_MEM resources, as are
> device regions.
> 
> Fixes: e31ecda9e3af ("firmware: coreboot: Skip no-map CBMEM entries")
> Signed-off-by: Michał Kopeć <michal@nozomi.space>

Thank you for your patch.  I'll queue this after -rc1 and send it as a
fix.
