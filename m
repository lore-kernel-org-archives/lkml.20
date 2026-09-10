Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E933D3C3F58;
	Thu, 10 Sep 2026 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030389; cv=none; b=udsxsLSpmK/r9TWJrSTEjbbXji6TttovtLfCAQJ4QVK1lZs+aRvKtTqt3jiYysEngpP375F+Wm8cKUq4Mn/7QNLpdxoPYhwtpeTs6fa5Ykxmo0ZCSPkbJNViPizlKuZ9TtQ983fFW0zlrmAbgd9tGdSGWW9Pe55z6PnlzUrtauY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030389; c=relaxed/simple;
	bh=ETfy3jUgKdVTNsbgyI7cziY/kDW3fakr25qqg9ig8wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKID8JEv+uhZDO3koegg7GDWoayJvjbhXfCZBwwXoN2Hggdy8K+8G/eIR/cIi920nWtfyThIgJ5pFHBEXUHgqaeoQmlHJT1OmqPFFida0dPMC7v9q+v4upxo4iaEENp9HS/IYr+jzLKJFEzVfuhdo5c8KYpdiy1kjz1poieYUDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8Oeo985; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8Oeo985"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14BAD1F000FF;
	Thu, 10 Sep 2026 08:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030381;
	bh=LWbuziL/gzqHiLZp9Iv1I9mzRwq5pd0PunHCM9fMJnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P8Oeo985doTWowffGnq4B6XCRHuOlPp945fNLrl/RMaXno6olC/NxJkFUaESpOkuR
	 YLNIMjMbZqwhkEPTdMNHDNsAN9ooUev5jX2sNeevIRI7BBGSefrnQ5K6UgS276qZE0
	 m4VJ41NsmnXmtNktvZZafKXYuD0vFWzNJ9zf4BZ8Dk2AAU8H84gVAWoWoG+NqYTqRO
	 s82xf+MlMsbbCrkorGAvdCf7FcZCUlH9LjlB+/BBJwS1KQsCzY3quE07fCx/BHZh66
	 ykks5wJPh9Sdbk9C4hyUuGTkmISDXa3Ygr0lKmSALL7oBiNzxH8AnTsZzIkHdv/2ZI
	 LZUq4/Cm6wCvA==
Date: Thu, 10 Sep 2026 10:52:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joel Selvaraj <foss@joelselvaraj.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] drm/panel: ebbg-ft8719: update Joel Selvaraj's email
 address
Message-ID: <20260910-large-tourmaline-frogmouth-ead837@quoll>
References: <20260909-update-email-address-v1-0-94a240f9469e@joelselvaraj.com>
 <20260909-update-email-address-v1-4-94a240f9469e@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909-update-email-address-v1-4-94a240f9469e@joelselvaraj.com>

On Wed, Sep 09, 2026 at 01:12:02AM -0700, Joel Selvaraj wrote:
> My jsfamily.in address is no longer active, switch to my current one.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>

And this the same as mailmap. Same maintainer will apply all this. Don't
inflate commits for review without need. Only the binding is separate by
convention.

Best regards,
Krzysztof

